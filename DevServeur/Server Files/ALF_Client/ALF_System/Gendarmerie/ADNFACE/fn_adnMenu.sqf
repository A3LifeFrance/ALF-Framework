#include "\ALF_Client\script_macros.hpp"
/*
File: fn_adnMenu.sqf
Author: ALF Team
*/
if(life_copLevel < 1) exitWith {["INFO","Tu n'es pas Gendarme.","warning"] spawn ALF_fnc_doMsg;};
disableSerialization;
if(dialog) exitWith {};
createDialog "ALF_ADN_Dialog";
private _btn1 = (findDisplay 12500) displayCtrl 12505;
private _btn2 = (findDisplay 12500) displayCtrl 12506;
_btn1 buttonSetAction "[] call ALF_fnc_adnRecherche;";
_btn2 buttonSetAction "[] spawn ALF_fnc_adnCreate;";
