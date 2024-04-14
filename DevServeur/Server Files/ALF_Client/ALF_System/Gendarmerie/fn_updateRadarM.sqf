#include "\ALF_Client\script_macros.hpp"
/*
File: fn_updateRadarM.sqf
Author: ALF Team
*/
private["_amende"];
_amende = parseNumber(ctrlText 18553);
private _display = findDisplay 18550;
private _texte1 = _display displayCtrl 18554;
private _texte2 = _display displayCtrl 18555;
_texte1 ctrlSetStructuredText parseText format["<t align='left' style='0' shadow='0' color='#000000' size='1'>%1 €</t>", _amende * 1.5];
_texte2 ctrlSetStructuredText parseText format["<t align='left' style='0' shadow='0' color='#000000' size='1'>%1 €</t>", _amende * 2.5];
