#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_keyGive.sqf
	Author: ALF Team
	Description:

*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 123450;
_list = _dialog displayCtrl 123457;

_sel = lbCurSel _list;
if((_list lbData _sel) isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectVehicle";};
_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

_unit = cursorObject;
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit isEqualTo player) exitWith {};
if!(_unit isKindOf "Man") exitWith {};
if(!isPlayer _unit) exitWith {};
if(!alive _unit) exitWith {};

private _owners = _vehicle getVariable "vehicle_info_owners";
private _exit = false;
if !((_owners in ["Gendarmerie","Pompiers"]) && (life_coplevel > 0 || life_mediclevel > 0)) then {
	if (!((getPlayerUID player) isEqualTo _owners) || {!(_vehicle getVariable ["business_veh",""] isEqualTo "") && {!((player getVariable ["isEmployed",""]) isEqualTo ((_vehicle getVariable ["business_veh",[""]]) select 0))}}) exitWith {["INFO", "Tu n'es pas le proprietaire du vehicule.", "success"] spawn ALF_fnc_doMsg; _exit = true;};
};
if (_exit) exitWith {};

private _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

["INFO", format["Tu viens de prêter les clés de : %1",_name],"success"] spawn ALF_fnc_doMsg;

[_vehicle,_unit] remoteExecCall ["TON_fnc_clientGetKey",_unit];

["INFO", format["On t'a prêté les clés de : %1",_name], "success"] remoteExec ["ALF_fnc_doMsg",_unit];
