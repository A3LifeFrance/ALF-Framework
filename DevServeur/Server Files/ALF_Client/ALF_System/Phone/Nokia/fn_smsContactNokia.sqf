#include "\ALF_Client\script_macros.hpp"
/*
File: fn_smscontactNokia.sqf
Author: ALF Team
Description:
Menu sms après selection depuis le menu contact du Nokia.
*/
if(EQUAL((lbCurSel 20011),-1)) exitWith {hint "Il faut selectionner quelqu'un."};
disableSerialization;
private _display = findDisplay 20000;
private _menu1sim = _display displayCtrl 200011;
private _menu1nosim = _display displayCtrl 200012;
private _menu1incall = _display displayCtrl 200013;
private _menu1ring = _display displayCtrl 200014;
private _datenokia = _display displayCtrl 20001;
private _menu1smsbtn = _display displayCtrl 20002;
private _menu1contactsbtn = _display displayCtrl 20003;
private _menu1name = _display displayCtrl 200041;
private _menu1num = _display displayCtrl 200042;
private _menu1Time = _display displayCtrl 200043;
private _menu1decrocher = _display displayCtrl 20004;
private _menu1refuser = _display displayCtrl 20005;
private _menu1raccrocher = _display displayCtrl 20006;
private _menu1quit = _display displayCtrl 200061;
private _menu1up = _display displayCtrl 200062;
private _menu1down = _display displayCtrl 200063;
private _menu1phone = _display displayCtrl 200016;
private _menu1phonetbn = _display displayCtrl 200031;

private _menu2pic = _display displayCtrl 20010;
private _menu2contactslist = _display displayCtrl 20011;
private _menu2appeler = _display displayCtrl 20012;
private _menu2sms = _display displayCtrl 20013;
private _menu2supprimer = _display displayCtrl 20014;
private _menu2nameedit = _display displayCtrl 20015;
private _menu2numedit = _display displayCtrl 20016;
private _menu2ajouter = _display displayCtrl 20017;
private _menu2retour = _display displayCtrl 200171;

private _menu3pic = _display displayCtrl 20018;
private _menu3smsname = _display displayCtrl 200181;
private _menu3numedit = _display displayCtrl 200182;
private _menu3smsedit = _display displayCtrl 20019;
private _menu3smsbtn = _display displayCtrl 20020;
private _menu3retour = _display displayCtrl 200201;

private _menu4pic = _display displayCtrl 200211;
private _menu4smslist = _display displayCtrl 20021;
private _menu4smsview = _display displayCtrl 20022;
private _menu4repondre = _display displayCtrl 20023;
private _menu4supprimer = _display displayCtrl 20024;
private _menu4newsms = _display displayCtrl 20025;
private _menu4retour = _display displayCtrl 20026;
private _menurecents = _display displayCtrl 20027;
private _menurecentlist = _display displayCtrl 20028;

private _dataname = CONTROL_DATA(20011);
_dataname = call compile format["%1", _dataname];

_menu1up ctrlShow false;
_menu1down ctrlShow false;
_menu1incall ctrlShow false;
_menu1sim ctrlShow false;
_menu1nosim ctrlShow false;
_menu1ring ctrlShow false;
_menu1smsbtn ctrlShow false;
_menu1contactsbtn ctrlShow false;
_menu1decrocher ctrlShow false;
_menu1refuser ctrlShow false;
_menu1raccrocher ctrlShow false;
_menu1quit ctrlShow false;
_menu2pic ctrlShow false;
_menu2contactslist ctrlShow false;
_menu2appeler ctrlShow false;
_menu2sms ctrlShow false;
_menu2supprimer ctrlShow false;
_menu2nameedit ctrlShow false;
_menu2numedit ctrlShow false;
_menu2ajouter ctrlShow false;
_menu3smsname ctrlShow true;
_menu3smsedit ctrlShow true;
_menu3smsbtn ctrlShow true;
_menu3numedit ctrlShow false;
_menu4smslist ctrlShow false;
_menu4smsview ctrlShow false;
_menu4repondre ctrlShow false;
_menu4supprimer ctrlShow false;
_menu4newsms ctrlShow false;
_menu4pic ctrlShow false;
_menu3pic ctrlShow true;
_menu2retour ctrlShow false;
_menu3retour ctrlShow true;
_menu4retour ctrlShow false;
_menu1name ctrlShow false;
_menu1num ctrlShow false;
_menu1Time ctrlShow false;
_menu1phone ctrlShow false;
_menu1phonetbn ctrlShow false;
_menurecents ctrlShow false;
_menurecentlist ctrlShow false;

private _name = _dataname select 0;
_numero = _dataname select 1;
_menu3smsname ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.5'>%1</t>",_name];

ALF_pInact_Number = _numero;
_menu3smsbtn buttonSetAction "[ALF_pInact_Number] spawn ALF_fnc_sendSmsNokia; uiNamespace setVariable ['nokiamenu',1]; [] call ALF_fnc_menuNokia;";
