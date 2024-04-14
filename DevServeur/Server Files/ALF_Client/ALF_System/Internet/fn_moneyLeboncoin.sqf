#include "\ALF_Client\script_macros.hpp"
/*
File: moneyLeboncoin.sqf
Author: ALF Nanou
*/
private _p = _this select 0;

if(!life_laactive && {!life_lbactive} && {!life_lcactive}) exitWith {
	life_cash = life_cash + _p;
	[0] call SOCK_fnc_updatePartial;
	["INFO",format["Tu as recu l'argent de ton annonce Leboncoin. %1€ en cash.",_p],"success"] spawn ALF_fnc_doMsg;
};
if((life_livreta + _p) < 75000) exitWith {
	life_livreta = life_livreta + _p;
	[6] call SOCK_fnc_updatePartial;
	["INFO",format["Tu as recu l'argent de ton annonce Leboncoin. %1€ sur ton Livret A.",_p],"success"] spawn ALF_fnc_doMsg;
};
if(!life_lbactive) exitWith {
	life_cash = life_cash + _p;
	[0] call SOCK_fnc_updatePartial;
	["INFO",format["Tu as recu l'argent de ton annonce Leboncoin. %1€ en cash.",_p],"success"] spawn ALF_fnc_doMsg;
};
if((life_livretb + _p) < 500000) exitWith {
	life_livretb = life_livretb + _p;
	[7] call SOCK_fnc_updatePartial;
	["INFO",format["Tu as recu l'argent de ton annonce Leboncoin. %1€ sur ton Livret B.",_p],"success"] spawn ALF_fnc_doMsg;
};
if(!life_lcactive) exitWith {
	life_cash = life_cash + _p;
	[0] call SOCK_fnc_updatePartial;
	["INFO",format["Tu as recu l'argent de ton annonce Leboncoin. %1€ en cash.",_p],"success"] spawn ALF_fnc_doMsg;
};

life_livretc = life_livretc + _p;
[8] call SOCK_fnc_updatePartial;
["INFO",format["Tu as recu l'argent de ton annonce Leboncoin. %1€ sur ton Livret C.",_p],"success"] spawn ALF_fnc_doMsg;
