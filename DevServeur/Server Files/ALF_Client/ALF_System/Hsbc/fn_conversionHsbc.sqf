#include "\ALF_Client\script_macros.hpp"
/*
File: fn_conversionHsbc.sqf
Author: ALF Team
Description: Hsbc Panel update "onKeyDown"

*/
private["_display"];

disableSerialization;
_display = findDisplay 23560;
_texteconversiontoeuro = _display displayCtrl 23560;
_texteconversiontochf = _display displayCtrl 23560;
_number = parseNumber(ctrlText 23560);
_bad = false;

if(!([str(_number)] call TON_fnc_isnumber)) then {_bad = true;};

if !(_bad) then {

	_numbertoeuro = floor(_number / 1.2);
	_numbertochf = ceil(_number * 1.2);

	_texteconversiontoeuro ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[_numbertoeuro] call life_fnc_numberText];
	_texteconversiontochf ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1/CHF</t>",[_numbertochf] call life_fnc_numberText];

} else {

	_texteconversiontoeuro ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>Erreur</t>"];
	_texteconversiontochf ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>Erreur</t>"];

};