/*
	File: fn_bag_deposit.sqf
	Author: ALF Dev Team
*/

params [
	["_dab",objNull,[objNull]]
];

if (isNull _dab) exitWith {};
if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};

private _obj = player getVariable ["wallet_obj", objNull];
if (isNull(_obj)) exitWith {
	["Distributeur", "Vous n'avez pas de valise de billets.", "warning"] spawn ALF_fnc_doMsg;
};

life_action_inUse = true;

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
uiSleep 1.5;
detach _obj;
deleteVehicle _obj;

[_dab,10000] remoteExecCall ["HC_fnc_updateDABDispo",HC2_Life];

private _building = objNull;
{
	if (((_x getVariable ["business",["","",""]]) select 2) isEqualTo (player getVariable ["isEmployed",""])) exitWith {
		_building = _x;
	};
} forEach ALF_allBusinesss;

if (isNull _building) exitWith {};

private _var = _building getVariable ["business",[]];
private _capitalstr = _var select 3;
private _siretstr = _var select 2;

private _newvalue = floor(_capitalstr + 15000);
_var set[3,_newvalue];

_building setVariable ["business",_var,true];

[_siretstr,_newvalue] remoteExec ["HC_fnc_capitalBusiness",HC2_life];

life_action_inUse = false;