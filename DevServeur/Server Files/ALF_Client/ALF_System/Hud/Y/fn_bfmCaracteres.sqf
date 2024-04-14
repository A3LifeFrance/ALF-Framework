#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_bfmofficiel.sqf
	Author: ALF Team

*/
disableSerialization;
private _display = findDisplay 5456;
private _btn = _display displayCtrl 5460;

private _msg = ctrlText 5459;
private _l2 = count _msg;

_btn ctrlSetText format["PUBLIER - %1/200",_l2];
