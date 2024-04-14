#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_hudSetup.sqf
	Author: ALF Team

	Description:
	Setups the hud for the player?
*/
[{
	disableSerialization;
	_ui = uiNameSpace getVariable ["playerHUD",displayNull];
	if (isNull _ui) exitWith {
		cutRsc ["playerHUD", "PLAIN", 2, false];
		_ui = uiNameSpace getVariable ["playerHUD",displayNull];
	};

	_health = _ui displayCtrl 11110;
	_damage = ceil ((1 - (damage player)) * 10);
	if (_damage isEqualTo 0) then {
		_health ctrlSetStructuredText parseText "<\br><img size='2.8' image='\ALF_Client2\icons\ALF_Health0.paa'/>";
	} else {
		_health ctrlSetStructuredText parseText (["<\br><img size='2.8' image='\ALF_Client2\icons\ALF_Health",_damage,"0.paa'/>"] joinString "");
	};
	_health ctrlCommit 0;

	_drink = _ui displayCtrl 11111;
	_soif = floor (life_thirst / 10);
	if (_soif < 1) then {
		_drink ctrlSetStructuredText parseText "<\br><img size='2.8' image='\ALF_Client2\icons\ALF_Drink0.paa'/>";
	} else {
		_drink ctrlSetStructuredText parseText (["<\br><img size='2.8' image='\ALF_Client2\icons\ALF_Drink",_soif,"0.paa'/>"] joinString "");
	};
	_drink ctrlCommit 0;

	_food = _ui displayCtrl 11112;
	_hunger = floor (life_hunger / 10);
	if (_hunger < 1) then {
		_food ctrlSetStructuredText parseText "<\br><img size='2.8' image='\ALF_Client2\icons\ALF_Food0.paa'/>";
	} else {
		_food ctrlSetStructuredText parseText (["<\br><img size='2.8' image='\ALF_Client2\icons\ALF_Food",_hunger,"0.paa'/>"] joinString "");
	};
	_food ctrlCommit 0;

	_tfr = _ui displayCtrl 11109;
	switch (TF_speak_volume_level) do {
		case "yelling": {
			_tfr ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\TFR_Yelling.paa'/>");
		};
		case "normal": {
			_tfr ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\TFR_Normal.paa'/>");
		};
		case "whispering": {
			_tfr ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\TFR_Whispering.paa'/>");
		};
	};
	_tfr ctrlCommit 0;
		
	_earPlug = _ui displayCtrl 11108;
	if (life_fadeSound) then	{
		_earPlug ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\ALF_EarPlug.paa'/>");
	} else {
		_earPlug ctrlSetStructuredText (parseText "");
	};
	_earPlug ctrlCommit 0;

	_inCall = _ui displayCtrl 11116;
	if (ALF_Phone_inCall) then	{
		_inCall ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\InCall.paa'/>");
	} else {
		_inCall ctrlSetStructuredText (parseText "");
	};
	_inCall ctrlCommit 0;

	_callOff = _ui displayCtrl 11113;
	if (ALF_Phone_Avion) then	{
		_callOff ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\CallOff.paa'/>");
	} else {
		_callOff ctrlSetStructuredText (parseText "");
	};
	_callOff ctrlCommit 0;

	_mutePhone = _ui displayCtrl 11115;
	if (ALF_Phone_Mute) then	{
		_mutePhone ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\ViberMode.paa'/>");
	} else {
		_mutePhone ctrlSetStructuredText (parseText "");
	};
	_mutePhone ctrlCommit 0;

	_newMsg = _ui displayCtrl 11114;
	if (ALF_Phone_SMS) then	{
		_newMsg ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\NewSms.paa'/>");
	} else {
		_newMsg ctrlSetStructuredText (parseText "");
	};
	_newMsg ctrlCommit 0;

	_anonyme = _ui displayCtrl 11117;
	if (ALF_Phone_Anonyme) then	{
		_anonyme ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\anonyme.paa'/>");
	} else {
		_anonyme ctrlSetStructuredText (parseText "");
	};
	_anonyme ctrlCommit 0;

	_bracelet = _ui displayCtrl 11118;
	if (player in (missionNamespace getVariable ["ALF_AllBracelets",[]])) then	{
		_bracelet ctrlSetStructuredText (parseText "<\br><img size='2.8' image='\ALF_Client2\icons\bracelet.paa'/>");
	} else {
		_bracelet ctrlSetStructuredText (parseText "");
	};
	_bracelet ctrlCommit 0;
}, 0.5] call CBA_fnc_addPerFrameHandler;
