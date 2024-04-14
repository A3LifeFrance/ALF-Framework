#include "\ALF_Client\script_macros.hpp"
/*
File: fn_knabisBuy.sqf
Author: ALF Team
*/
private _number = ctrlText 24505;
private _allowed = toArray("0123456789");
private _chrByte = toArray(_number);
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {["INFO", "La quantité est incorecte.", "warning"] spawn ALF_fnc_doMsg;};
_number = parseNumber(_number);
if(_number < 1) exitWith {["INFO", "La quantité est incorecte.", "warning"] spawn ALF_fnc_doMsg;};
if(_number > 100) exitWith {["INFO", "La quantité est trop haute.", "warning"] spawn ALF_fnc_doMsg;};
if(count life_houses isEqualTo 0) exitWith {["INFO", "Tu n'as pas de domicile.", "warning"] spawn ALF_fnc_doMsg;};

uiNamespace setVariable ['internetmenu',2];
[] call ALF_fnc_menuInternet;
