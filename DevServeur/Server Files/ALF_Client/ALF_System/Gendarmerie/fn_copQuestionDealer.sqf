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

private _var = obj_dealer getVariable ["info",[]];

if(count _var isEqualTo 0) then {
	_list lbAdd "Je n'ai rien a vous dire, je le jure.";
} else {
	{
		_list lbAdd (format["J'ai dealer avec un type à %1..",_x]);
	} forEach _var;
	_list lbAdd "Je crois que c'est tout, je jure !";
};
