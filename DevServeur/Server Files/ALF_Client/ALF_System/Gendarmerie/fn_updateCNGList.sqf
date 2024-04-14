#include "\ALF_Client\script_macros.hpp"
/*
File: fn_updateCNGList.sqf
Author: ALF Team
*/
disableSerialization;
private _list = _this select 0;
if(isNil "_list") exitWith {};

private _uilist = (findDisplay 16500) displayCtrl 16508;
lbClear _uilist;

if(count _list isEqualTo 0) then {
	_uilist lbAdd "Vide.";
} else {
	{
		private _name = _x select 0;
		private _value = [parseNumber(_x select 1)] call life_fnc_numberText;
		private _time = _x select 2;
		_uilist lbAdd format["%3 - %1 - %2",_name,_value,_time];
	} forEach _list;
};