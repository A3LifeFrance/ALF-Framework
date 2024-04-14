#include "\ALF_Client\script_macros.hpp"
/*
File: getFiredBusiness.sqf
Author: ALF Nanou
*/
private["_secteur"];
_secteur = _this select 0;

["INFO","Tu as été viré par ton employeur.","success"] spawn ALF_fnc_doMsg;
