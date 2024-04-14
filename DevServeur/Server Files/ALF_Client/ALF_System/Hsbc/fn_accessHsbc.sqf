#include "\ALF_Client\script_macros.hpp"
/*
File: fn_accessHsbc.sqf
Author: ALF Team
Description: Hsbc access panel

*/
private["_display"];

createDialog "ALF_HsbcAccess_Dialog";
disableSerialization;

_display = findDisplay 23560;
_textetype = _display displayCtrl 23560;
_textetype2 = _display displayCtrl 23560;
_numbercompte = _display displayCtrl 23560;
_textelivret = _display displayCtrl 23560;
_textecash = _display displayCtrl 23560;
_retirer = _display displayCtrl 23560;
_deposer = _display displayCtrl 23560;
_transferext = _display displayCtrl 23560;
_name = _display displayCtrl 23560;
_name ctrlSetStructuredText parseText format["<t align='center' size='1.1px'>%1</t>",name player];

_numberaccount = player getVariable "numberHsbcAccount";
_textetype2 ctrlSetStructuredText parseText format["Mon numéro de compte: %1",_numberaccount];

_textetype ctrlSetStructuredText parseText "Panel de votre compte en Suisse.";
_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_hsbc] call life_fnc_numberText];
_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
_retirer buttonSetAction "[] call ALF_fnc_retirerHsbc;";
_deposer buttonSetAction "[] call ALF_fnc_deposerHsbc;";
_transferext buttonSetAction "[] call ALF_fnc_transferExtHsbc;";
