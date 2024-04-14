#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_paramSafe.sqf
	ALF TEAM
*/
disableSerialization;
params [
	["_container",objNull,[objNull]],
	["_mode",-1,[0]]
];
if(isNull _container || {_mode isEqualTo -1}) exitWith {};
life_pInact_mobilier = _container;

if(isNull (findDisplay 158532)) then {createDialog "ALF_Mobilier_Safe"};
private _display = findDisplay 158532;
private _btn = _display displayCtrl 158533;

private _num = ctrlText 158534;
private _chrByte = toArray(_num);
private _length = count(_chrByte);
private _allowed = toArray("0123456789");
if !(_length isEqualTo 4) exitWith {};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {};

ALF_Mobilier_Data params [
	["_owner","",[""]],
	["_id",-1,[0]],
	["_classname","",[""]],
	["_house",objNull,[objNull]],
	["_safe","",[""]],
	["_locked",false,[false]]
];
if(_owner isEqualTo "" OR {_id isEqualTo -1} OR {_classname isEqualTo ""} OR {isNull _house} OR {_safe isEqualTo ""}) exitWith {};

if(_mode isEqualTo 0) then {
	_btn ctrlSetText "OUVRIR";
	_btn buttonSetAction "[life_pInact_mobilier,2] call life_fnc_paramSafe;";
};

if(_mode isEqualTo 1) then {
	_btn ctrlSetText "PARAMETRER";
	_btn buttonSetAction "[life_pInact_mobilier,3] call life_fnc_paramSafe;";
};

if(_mode isEqualTo 2) then {
	if(_num isEqualTo _safe) then {
		[_container] call life_fnc_mobilierInv;
	};
};

if(_mode isEqualTo 3) then {
	ALF_Mobilier_Data set[4,_num];
	closeDialog 158532;
	[_container,_num] remoteExecCall ["HC_fnc_editSafeCode",HC2_Life];
	closeDialog 37400;
};
