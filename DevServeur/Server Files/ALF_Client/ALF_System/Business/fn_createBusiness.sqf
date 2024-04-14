#include "\ALF_Client\script_macros.hpp"
/*
File: createBusiness.sqf
Author: ALF Nanou
*/
private["_business","_display","_btn"];
_business = _this select 0;
life_pInact_curTarget = _business;

if !(player getVariable ["isEmployed",""] isEqualTo "") exitWith {["INFO","Tu es déjà employé d'une entreprise.","warning"] spawn ALF_fnc_doMsg;};

if(!dialog) then {
	createDialog "ALF_CreateBusiness_Dialog";
};
disableSerialization;

_display = findDisplay 28500;

_filter = _display displayCtrl 28525;
lbClear _filter;
_filter lbAdd "A DEFINIR SUR LE FORUM";
_filter lbSetCurSel 0;

_btn = _display displayCtrl 28528;
_btn buttonSetAction "[life_pInact_curTarget] spawn ALF_fnc_btnCreateBusiness;";
