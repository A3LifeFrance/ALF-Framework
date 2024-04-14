#include "\ALF_Client\script_macros.hpp"
/*
File: createBusiness.sqf
Author: ALF Nanou
*/
private["_business"];
_business = _this select 0;
disableSerialization;

if !(ALF_PlayTime >= 3000) exitWith {["INFO","Tu n'as pas 50H de jeu sur le serveur.","warning"] spawn ALF_fnc_doMsg;};

private _l1 = toUpper(ctrlText 28501);
private _l2 = toUpper(ctrlText 28502);
private _l3 = toUpper(ctrlText 28503);
private _l4 = toUpper(ctrlText 28504);
private _l5 = toUpper(ctrlText 28505);
private _l6 = toUpper(ctrlText 28506);
private _l7 = toUpper(ctrlText 28507);
private _l8 = toUpper(ctrlText 28508);
private _l9 = toUpper(ctrlText 28509);
private _l10 = toUpper(ctrlText 28510);
private _l11 = toUpper(ctrlText 28511);
private _l12 = toUpper(ctrlText 28512);
private _l13 = toUpper(ctrlText 28513);
private _l14 = toUpper(ctrlText 28514);
private _l15 = toUpper(ctrlText 28515);
private _l16 = toUpper(ctrlText 28516);
private _l17 = toUpper(ctrlText 28517);
private _l18 = toUpper(ctrlText 28518);
private _l19 = toUpper(ctrlText 28519);
private _l20 = toUpper(ctrlText 28520);
private _l21 = toUpper(ctrlText 28521);
private _l22 = toUpper(ctrlText 28522);
private _l23 = toUpper(ctrlText 28523);
private _l24 = toUpper(ctrlText 28524);

private _exit = false;
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ");
{
	private _length = count (toArray(_x));
	if(_length > 1) exitWith {_exit = true;};
	private _chrByte = toArray (_x);
	{if(!(_x in _allowed)) exitWith {_exit = true;};} forEach _chrByte;
} forEach [_l1,_l2,_l3,_l4,_l5,_l6,_l7,_l8,_l9,_l10,_l11,_l12,_l13,_l14,_l15,_l16,_l17,_l18,_l19,_l20,_l21,_l22,_l23,_l24];
if(_exit) exitWith {["INFO","Il y a une erreur dans le nom de l'entreprise.","warning"] spawn ALF_fnc_doMsg;};

private _ctrl = lbCurSel(28525);
private _num = ctrlText 28526;
if !([_num] call TON_fnc_isnumber) exitWith {};
_num = parseNumber(_num);
if(_num < 7500) exitWith {["INFO","Le capital est inférieur à 7.500€.","warning"] spawn ALF_fnc_doMsg;};

private _cbsignature = (findDisplay 28500) displayCtrl 28527;
private _signature = cbChecked _cbsignature;
if(!_signature) exitWith {["INFO","Tu n'as pas signé le document.","warning"] spawn ALF_fnc_doMsg;};

private _action = ["Es-tu certain de vouloir envoyer ce document de création d'entreprise ? Cette opération ne sera plus modifiable.","Entreprise","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

private _name = [_l1,_l2,_l3,_l4,_l5,_l6,_l7,_l8,_l9,_l10,_l11,_l12,_l13,_l14,_l15,_l16,_l17,_l18,_l19,_l20,_l21,_l22,_l23,_l24];
private _uid = getPlayerUID player;
private _pos = getPosATL _business;

if(_num > life_cash) then {
	private _handle = [_num,false] call ALF_fnc_handleCB;
	if(_handle) exitWith {_exit = true;};
} else {
	life_cash = life_cash - _num;
	[0] call SOCK_fnc_updatePartial;
};
if(_exit) exitWith {};

[_uid,_pos,_name,_ctrl,_num,player] remoteExec ["HC_fnc_createBusiness",HC2_Life];
closeDialog 0;
