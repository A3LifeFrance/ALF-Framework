/*
	File: fn_bag_unstock.sqf
	Author: ALF Dev Team
*/

params [
	["_veh",objNull,[objNull]],
	["_mode",0,[0]]
];

if (isNull _veh) exitWith {};
if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};

private _obj = player getVariable ["wallet_obj", objNull];
if !(isNull(_obj)) exitWith {
	["ERREUR", "Vous portez déjà une valise.", "danger"] spawn ALF_fnc_doMsg;
};

if (_mode isEqualTo 0) then {
	life_action_inUse = true;
	
	[1,_veh,player] remoteExecCall ["HC_fnc_bag_vehicle",HC2_Life];
	
	life_action_inUse = false;
} else {
	life_action_inUse = true;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	uiSleep 1.5;

	[] spawn ALF_fnc_moneyBagHandle;
	
	life_action_inUse = false;
};