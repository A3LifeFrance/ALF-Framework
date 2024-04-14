#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_changerPlaque.sqf
	Author: ALF Team
*/
if(!dialog) then {
	createDialog "ALF_QBRICO_Dialog";
};
disableSerialization;

private _list = ((findDisplay 12000) displayCtrl 12001);
lbClear _list;

private _var = brico getVariable ["info",[]];

if(count _var isEqualTo 0) then {
	_list lbAdd "Je n'ai rien a vous dire, je le jure.";
} else {
	{
		private _cn = _x select 0;
		private _pOne = _x select 1;
		private _pTwo = _x select 2;

		private _p1 = _pOne select 0;
		private _p2 = _pOne select 1;
		private _p4 = _pOne select 3;
		private _p5 = _pOne select 4;
		private _p6 = _pOne select 5;
		private _p8 = _pOne select 7;
		private _p9 = _pOne select 8;
		private _pOneF = format["%1%2-%3%4%5-%6%7",_p1,_p2,_p4,_p5,_p6,_p8,_p9];

		private _p11 = _pTwo select 0;
		private _p22 = _pTwo select 1;
		private _p44 = _pTwo select 3;
		private _p55 = _pTwo select 4;
		private _p66 = _pTwo select 5;
		private _p88 = _pTwo select 7;
		private _p99 = _pTwo select 8;
		private _pTwoF = format["%1%2-%3%4%5-%6%7",_p11,_p22,_p44,_p55,_p66,_p88,_p99];

		_list lbAdd format["J'ai changé %1 (%2) en %3 ensuite..",_cn,_pOneF,_pTwoF];
	} forEach _var;
	_list lbAdd "Je crois que c'est tout, je jure !";
};
