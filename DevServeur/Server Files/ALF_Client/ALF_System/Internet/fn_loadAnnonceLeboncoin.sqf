#include "\ALF_Client\script_macros.hpp"
/*
File: fn_loadAnnonceLeboncoin.sqf
Author: ALF Team
*/
private["_lb","_list","_btn","_tmp"];
_list = _this select 0;
if !(uiNamespace getVariable ['internetmenu',0] isEqualTo 8) exitWith {};

disableSerialization;
_lb = ((findDisplay 24500) displayCtrl 24532);
lbClear _lb;

{
	_lb lbAdd format["%1e - %2",[_x select 6] call life_fnc_numberText, _x select 4];
	_tmp = [_x select 0,_x select 1,_x select 2,_x select 3,_x select 4,_x select 5,_x select 6,_x select 7,_x select 8,_x select 9];
	_tmp = str(_tmp);
	_lb lbSetData [(lbSize _lb)-1,_tmp];
} forEach _list;
lbSort _lb;

((findDisplay 24500) displayCtrl 24532) lbSetCurSel 0;

_btn = ((findDisplay 24500) displayCtrl 24531);
_btn ctrlShow true;
_btn buttonSetAction "uiNamespace setVariable ['internetmenu',9]; [] call ALF_fnc_menuInternet;";
