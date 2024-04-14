#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_annonceBFM.sqf
	Author: ALF Team

*/
disableSerialization;
if(dialog) exitWith {};

createDialog "bfm_dialog";
private _d = findDisplay 5456;
private _b = _d displayCtrl 5460;
_b buttonSetAction "[] spawn ALF_fnc_bfmCitoyen;";
