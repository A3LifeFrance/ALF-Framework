#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_couperBarbele.sqf
	Author: ALF Team
*/
private _obj = _this select 0;
if(isNull _obj) exitWith {};
if(life_action_inUse) exitWith {};

if(ALF_Count_Penit < 4) exitWith {};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable  "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%","Coupe du barbelé"];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep 0.5;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Coupe du barbelé"];

	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {};
	if(life_isknocked) exitWith {};
	if(life_interrupted) exitWith {};
	if([player] call ALF_fnc_checkMenotter) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR {life_istazed} OR {life_isknocked}) exitWith {life_action_inUse = false;};
if([player] call ALF_fnc_checkMenotter) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;

private _dice = random(100);
private _adn = player getVariable "adnface" select 0;
if(_dice <= 25) then {
	["INFO", "Tu as coupé le barbelé.", "success"] spawn ALF_fnc_doMsg;
	[name player,getPlayerUID player,"PRISON","A COUPER (REUSSIT) LE BARBELE."] remoteExec ["HC_fnc_logIt",HC3_Life];
	_obj animate ["Hide_Coupe",1];
	if(_dice > 5 && {_dice <= 20}) then {
		private  _data = _obj getVariable ["ilyadeladn",[]];
		if(count _data isEqualTo 0) then {
			_obj setVariable["ilyadeladn",[_adn],true];
		} else {
			_data pushBack _adn;
			_obj setVariable["ilyadeladn",_data,true];
		};
	};
} else {
	if(_dice >= 90) then {
		["INFO", "Tu as cassé ta paire de ciseaux inox.", "warning"] spawn ALF_fnc_doMsg;
		["ALF_ZipCutterP",false] call life_fnc_handleItem;
	} else {
		["INFO", "Tu n'as pas réussit à couper le barbelé.", "warning"] spawn ALF_fnc_doMsg;
	};
	[name player,getPlayerUID player,"PRISON","A COUPER (ECHEC) LE BARBELE."] remoteExec ["HC_fnc_logIt",HC3_Life];
};