/*
	File: fn_bag_get.sqf
	Author: ALF Dev Team
*/

if (!b_24) exitWith {};
if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};

private _obj = player getVariable ["wallet_obj", objNull];
if (!isNull(_obj)) exitWith {
	["ERREUR", "Vous avez déjà une valise de billets.", "danger"] spawn ALF_fnc_doMsg;
};

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

if(_capitalstr < 10000) exitWith {["ERREUR","Tu n'as pas 10000€ dans ton capital d'entreprise.","danger"] spawn ALF_fnc_doMsg;};

private _newvalue = floor(_capitalstr - 10000);
_var set[3,_newvalue];

_building setVariable ["business",_var,true];

[_siretstr,_newvalue] remoteExec ["HC_fnc_capitalBusiness",HC2_life];

life_action_inUse = true;
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
uiSleep 1.5;

[] spawn ALF_fnc_moneyBagHandle;

life_action_inUse = false;