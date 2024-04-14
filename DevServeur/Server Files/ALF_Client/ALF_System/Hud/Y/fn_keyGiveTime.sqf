#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_keyGiveTime.sqf
	Author: ALF Team
*/
disableSerialization;
private _dialog = findDisplay 123450;
private _list = _dialog displayCtrl 123457;

private _sel = lbCurSel _list;
if((_list lbData _sel) isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectVehicle";};
private _vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

private _unit = cursorObject;
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit isEqualTo player) exitWith {};
if!(_unit isKindOf "Man") exitWith {};
if(!isPlayer _unit) exitWith {};
if(!alive _unit) exitWith {};

private _num = ctrlText 123496;
if(_num isEqualTo "") exitWith {[] spawn ALF_fnc_keyGiveDef;};
if !([_num] call TON_fnc_isnumber) exitWith {["INFO","Erreur dans le nombre de jour.","success"] spawn ALF_fnc_doMsg;};
_num = parseNumber(_num);
if(_num < 1 OR {_num > 30}) exitWith {["INFO","Le nombre de jour doit etre entre 1 et 30.","success"] spawn ALF_fnc_doMsg;};

private _uid = getPlayerUID _unit;

if !(_vehicle isKindOf "House") then {
	private _owners = _vehicle getVariable ["vehicle_info_owners",[]];
	if !((getPlayerUID player) isEqualTo _owners) exitWith {["INFO", "Tu n'es pas le proprietaire du vehicule.", "success"] spawn ALF_fnc_doMsg;};

	[0,_vehicle,_num,_unit,player] remoteExec ["HC_fnc_keyGiveTime",HC2_Life];
} else {
	[1,_vehicle,_num,_unit,player] remoteExec ["HC_fnc_keyGiveTime",HC2_Life];
};
