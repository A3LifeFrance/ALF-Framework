#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_copBreakDoor.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Allows cops to 'kick' in the door?
*/
private["_house","_door","_title","_titleText","_progressBar","_cpRate","_cP","_uid"];
_house = param [0,objNull,[objNull]];
private _mode = _this select 1;

if (isNull _house || {!(_house isKindOf "House_F")}) exitWith {};
if (isNil {_house getVariable "ALF_PorteFermer"}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_door = [_house,player] call life_fnc_nearestDoor;
if(EQUAL(_door,0)) exitWith {hint localize "STR_Cop_NotaDoor"};
if !(_house getVariable ["ALF_PorteFermer",false]) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Progress";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0092;

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
_house animateSource [format ["Door_%1_sound_source",_door],1];
_house animate [format ["Door_%1",_door],1];

if(_mode isEqualTo 1) then {
	["ALF_Lockpick",false] spawn life_fnc_handleItem;
	[name player,getPlayerUID player,"MAISON",format["A lockpick une porte de maison | POS : %1 | MAISON : %2", getPos _house, typeOf _house]] remoteExec ["HC_fnc_logIt",HC3_Life];
} else {
	[name player,getPlayerUID player,"MAISON",format["(Gendarme) A casser une porte de maison | POS : %1 | MAISON : %2", getPos _house, typeOf _house]] remoteExec ["HC_fnc_logIt",HC3_Life];
};

[_house,player] remoteExecCall ["HC_fnc_copBreakDoor",HC2_Life];
