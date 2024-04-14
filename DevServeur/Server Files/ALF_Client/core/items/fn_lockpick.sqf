#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance","_data"];
private _curTarget = _this select 0;
life_interrupted = false;

if(count (attachedObjects player) > 0) exitWith {};
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far

_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !([_curTarget] call ALF_fnc_checkMenotter)) exitWith {};
if(_curTarget getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true;

private _3dlock = "Land_File_F" createvehicle [0,0,0];
_3dlock attachto [player, [-0.015,0.08,0], "RightHandMiddle1"];
_3dlock setDir 180;

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable  "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep 0.5;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];

	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {detach _3dlock;	deletevehicle _3dlock;}; //Tazed
	if(life_isknocked) exitWith {detach _3dlock;	deletevehicle _3dlock;}; //Knocked
	if(life_interrupted) exitWith {detach _3dlock;	deletevehicle _3dlock;};
	if([player] call ALF_fnc_checkMenotter) exitWith {detach _3dlock;	deletevehicle _3dlock;};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true; detach _3dlock;	deletevehicle _3dlock;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if([player] call ALF_fnc_checkMenotter) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;

if(!_isVehicle) then {
	[_curTarget,"gestureNod"] remoteExecCall ["playActionNow",_curTarget];
	[name player,getPlayerUID player,"Lockpick",format["A lockpick les menottes de %1.",name _curTarget]] remoteExec ["HC_fnc_logIt",HC3_Life];
} else {
	private _dice = random(1000);
	private _adn = player getVariable "adnface" select 0;
	if(_dice <= 200) then {
		["INFO", "Tu as ouvert le véhicule.", "warning"] spawn ALF_fnc_doMsg;

		[name player,getPlayerUID player,"Lockpick",format["A lockpick (WIN sans alarme) %1",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")]] remoteExec ["HC_fnc_logIt",HC3_Life];
		if(local _curTarget) then {
			_curTarget lock 0;
		} else {
			[_curTarget,0] remoteExecCall ["life_fnc_lockVehicle",_curTarget];
		};
		detach _3dlock;	deletevehicle _3dlock;
		if(_dice > 5 && {_dice < 105}) then {
			_data = _curTarget getVariable ["ilyadeladn",[]];
			if(count _data isEqualTo 0) then {
				_curTarget setVariable["ilyadeladn",[_adn],true];
			} else {
				_data pushBack _adn;
				_curTarget setVariable["ilyadeladn",_data,true];
			};
		};
	};
	if(_dice > 200 && {_dice < 500}) then {
		["INFO", "Tu as ouvert le véhicule mais tu as déclenché l'alarme du véhicule.", "warning"] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"Lockpick",format["A lockpick (WIN avec alarme) %1.",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[_curTarget,"ALF_CarAlarm1"] remoteExec ["life_fnc_say3D",RANY];
		if(local _curTarget) then {
			_curTarget lock 0;
		} else {
			[_curTarget,0] remoteExecCall ["life_fnc_lockVehicle",_curTarget];
		};
		detach _3dlock;	deletevehicle _3dlock;
		if(_dice > 250 && {_dice < 450}) then {
			_data = _curTarget getVariable ["ilyadeladn",[]];
			if(count _data isEqualTo 0) then {
				_curTarget setVariable["ilyadeladn",[_adn],true];
			} else {
				_data pushBack _adn;
				_curTarget setVariable["ilyadeladn",_data,true];
			};
		};
	};
	if(_dice >= 500) then {
		["INFO", "Tu as cassé le lockpick !", "warning"] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"Lockpick",format["A lockpick (FAIL) %1.",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")]] remoteExec ["HC_fnc_logIt",HC3_Life];
		["ALF_Lockpick",false] spawn life_fnc_handleItem;
		detach _3dlock;	deletevehicle _3dlock;
		if(_dice > 700 && {_dice < 950}) then {
			_data = _curTarget getVariable ["ilyadeladn",[]];
			if(count _data isEqualTo 0) then {
				_curTarget setVariable["ilyadeladn",[_adn],true];
				_curTarget setVariable["ilyadeladn",[_adn],true];
			} else {
				_data pushBack _adn;
				_curTarget setVariable["ilyadeladn",_data,true];
			};
		};
	};
};
