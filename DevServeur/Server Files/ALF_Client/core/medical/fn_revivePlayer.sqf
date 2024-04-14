#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description: Land_Defibrillator_F
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title","_uid","_badDistance"];
_target = param [0,objNull,[objNull]];
if(isNull _target) exitWith {};

_revivable = _target getVariable ["ReviveMedic",false];
if !(_revivable) exitWith {};
if(_target getVariable ["Reviving",objNull] isEqualTo player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if(player distance _target > 5) exitWith {};

_targetName = name _target;
_uid = getPlayerUID _target;
_title = format[localize "STR_Medic_Progress",_targetName];
life_action_inUse = true;

_target setVariable ["Reviving",player,true];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

private _jerry = createSimpleObject ["A3\Structures_F_EPA\Items\Medical\Defibrillator_F.p3d", [0,0,0]];
_jerry setPosATL (player modelToWorld [0,0.3,0]);

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep .15;
	_cP = _cP + .05;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR {!alive player}) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
	if([player] call ALF_fnc_checkMenotter) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
	if !(_target getVariable ["ReviveMedic",false]) exitWith {};
	if !(_target getVariable ["Reviving",objNull] isEqualTo player) exitWith {};
};

playSound3D ["ALF_Client2\sounds\defib.ogg", player, false, getPosASL player, 1, 1, 20];
sleep 3;

detach _jerry;	deletevehicle _jerry;

5 cutText ["","PLAIN"];
player playActionNow "stop";

if !(_target getVariable ["Reviving",objNull] isEqualTo player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
_target setVariable ["Reviving",NIL,true];

if(!alive player OR {life_istazed} OR {life_isknocked}) exitWith {life_action_inUse = false;};
if !(_target getVariable ["ReviveMedic",false]) exitWith {hint localize "STR_Medic_RevivedRespawned";};
if([player] call ALF_fnc_checkMenotter) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
[player] remoteExec ["life_fnc_revived",_target];

[_targetName,_uid,"MORT",format ["A ete reanime par %1",profileName]] remoteExec ["HC_fnc_logIt",HC3_Life];

sleep .6;
player reveal _target;

life_cash = life_cash + 10;
[0] call SOCK_fnc_updatePartial;

[500] remoteExecCall ["HC_fnc_updateCNP",HC_life];