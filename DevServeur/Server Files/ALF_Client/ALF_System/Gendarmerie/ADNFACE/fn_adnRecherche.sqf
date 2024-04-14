#include "\ALF_Client\script_macros.hpp"
/*
File: fn_adnRecherche.sqf
Author: ALF Team
*/
private _codeadn = ctrlText 12501;
if(_codeadn isEqualTo "") exitWith {["INFO","Le code ADN est vide.","warning"] spawn ALF_fnc_doMsg;};
private _length = count (toArray(_codeadn));
private _chrByte = toArray (_codeadn);
private _allowed = toArray("0123456789");
if !(_length isEqualTo 8) exitWith {["INFO","Le code ADN est invalide.","warning"] spawn ALF_fnc_doMsg;};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {["INFO","Le code ADN est invalide.","warning"] spawn ALF_fnc_doMsg;};

[_codeadn,player] remoteExec ["HC_fnc_adnRecherche",HC_Life];
