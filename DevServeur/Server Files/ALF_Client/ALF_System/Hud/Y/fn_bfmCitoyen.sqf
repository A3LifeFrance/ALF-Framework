#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_bfmofficiel.sqf
	Author: ALF Team

*/
disableSerialization;
private _name = ctrlText 5457;
private _msg = ctrlText 5459;

if(_name isEqualTo "" OR {_msg isEqualTo ""}) exitWith {hint "Ton message est vide.";};

private _cb = (findDisplay 5456) displayCtrl 5458;
private _number = cbChecked _cb;
private _myNumber = "Inconnu";
if(_number) then {
	_myNumber = ALF_Phone_Number;
};

private _l1 = count (toArray(_name));
private _c1 = toArray (_name);

private _l2 = count (toArray(_msg));
private _c2 = toArray (_msg);

private _allowed = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]€!?;:)(=+&<>*$éèàç ");

if(_l1 > 30) exitWith {hint "Tu ne peux écrire que 30 caractères dans le nom."};
if(_l2 > 200) exitWith {hint "Tu ne peux écrire que 200 caractères dans l'annonce."};

private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _c1;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _c2;

if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

private _action = ["Veux-tu publier cette annonce pour 850€ ?","BFM TV","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

private _exit = false;
if(850 >= life_cash) then {
	private _handle = [850,false] call ALF_fnc_handleCB;
	if(_handle) exitWith {_exit = true;};
} else {
	life_cash = life_cash - 850;
	[0] call SOCK_fnc_updatePartial;
};
if(_exit) exitWith {};

["BFM TV","Ton annonce vient d'être diffusée.","success"] spawn ALF_fnc_doMsg;

closeDialog 0;

[_name,_myNumber,_msg] remoteExec ["ALF_fnc_doBfmC",(playableUnits select {alive _x})];
