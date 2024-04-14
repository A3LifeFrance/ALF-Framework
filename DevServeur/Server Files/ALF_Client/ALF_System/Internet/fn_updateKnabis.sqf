#include "\ALF_Client\script_macros.hpp"
/*
File: fn_updateKnabis.sqf
Author: ALF Team
*/
private["_number","_display","_texte","_price"];
_number = parseNumber(ctrlText 24505);
_price = 13;
if(_number > 10 && {_number <= 20}) then {
	_price = 12;
};
if(_number > 20 && {_number <= 30}) then {
	_price = 11;
};
if(_number > 30) then {
	_price = 10;
};
_display = findDisplay 24500;
_texte = _display displayCtrl 24506;
_texte ctrlSetStructuredText parseText format["<t align='left' style='0' shadow='0' color='#000000' size='1'>%1 €</t>", _number * _price];
