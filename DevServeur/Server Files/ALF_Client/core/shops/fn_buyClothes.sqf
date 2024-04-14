#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buyClothes.sqf
*/

if(EQUAL((lbCurSel 3101),-1)) exitWith {};

private _price = 0;
{
	if(!(EQUAL(_x,-1))) then {
		_price = _price + _x;
	};
} forEach life_clothing_purchase;

if(_price > life_cash) then {
	private _handle = [_price,false] call ALF_fnc_handleCB;
	if(_handle) exitWith {};
	life_clothesPurchased = true;
} else {
	life_cash = life_cash - _price;
	life_clothesPurchased = true;
};

closeDialog 0;