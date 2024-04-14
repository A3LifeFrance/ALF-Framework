#include "\ALF_Client\script_macros.hpp"
/*
File: fn_menuHsbc.sqf
Author: ALF Team
Description: HSBC Panel

*/
private["_display"];
if(!dialog) then {
	createDialog "ALF_HsbcMenu_Dialog";
};
disableSerialization;

_display = findDisplay 23530;
_texte1 = _display displayCtrl 23531;
_texte2 = _display displayCtrl 23532;
_livrethsbc = _display displayCtrl 23533;
_piclivrethsbc = _display displayCtrl 23534;
_achatlivrethsbc = _display displayCtrl 23535;
_picachatlivrethsbc = _display displayCtrl 23536;
_name = _display displayCtrl 23537;
_name ctrlSetStructuredText parseText format["<t align='center' size='1.1px'>%1</t>",name player];

if (life_hsbcactive) then {
	_piclivrethsbc ctrlShow true;
	_livrethsbc buttonSetAction "[] spawn ALF_fnc_accessHsbc;";
	_achatlivrethsbc ctrlShow false;
	_picachatlivrethsbc ctrlShow false;
	_texte1 ctrlShow true;
	_numberaccount = player getVariable "numberHsbcAccount";
	_texte1 ctrlSetStructuredText parseText format["Mon numéro de compte: %1",_numberaccount];
} else {
	_texte1 ctrlShow false;
	_livrethsbc ctrlShow false;
	_achatlivrethsbc ctrlShow true;
	_piclivrethsbc ctrlShow false;
	_picachatlivrethsbc ctrlShow true;
	_achatlivrethsbc buttonSetAction "[] spawn ALF_fnc_achatHsbc;";
};

if (!life_hsbcactive) then {
	_texte2 ctrlSetStructuredText parseText "Vous n'avez pas de compte en Suisse.";
} else {
	_texte2 ctrlSetStructuredText parseText "Vous disposez d'un compte en Suisse.";
};
