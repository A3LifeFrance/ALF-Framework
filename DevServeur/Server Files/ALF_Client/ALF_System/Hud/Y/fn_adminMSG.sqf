/*
	File: fn_adminMSG.sqf
	Author: ALF Team
*/

disableSerialization;

private _mode = lbCurSel(123538);
private _msg = ctrlText 123539;

if(_msg isEqualTo "") exitWith {hint "Ton message est vide.";};

private _l2 = count (toArray(_msg));
private _c2 = toArray (_msg);

private _allowed = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-\/[]€!?;:)(=+&<>*$éàùè|çêîïâä ");

if(_l2 > 70) exitWith {hint "Tu ne peux écrire que 70 caractères dans l'annonce."};

private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _c2;

if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

if(_mode isEqualTo 1) then {
	_mode = "#FFCC00";
} else {
	_mode = "#27AE60";
};

["Admin",_msg,_mode] remoteExec ["ALF_fnc_doMsg",(playableUnits select {alive _x})];