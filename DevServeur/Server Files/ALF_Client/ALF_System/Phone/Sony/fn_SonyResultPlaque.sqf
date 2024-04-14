#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyResultPlaque.sqf
Author: ALF Team
*/
private ["_display","_check","_plaquetexte","_classname","_nameplayer","_insure","_t1","_Texte1"];
if(isNull (findDisplay 32999)) exitWith {};

disableSerialization;
_display = findDisplay 32999;

_check = uiNamespace getVariable "sony";
if(_check != 14) exitWith {};

_plaquetexte = _this select 0;
_classname = _this select 1;
_nameplayer = _this select 2;
_insure = _this select 3;

_t1 = format["<t color='#000000'>Type de véhicule: %2</t><br/><t color='#000000'>Immatriculation: %1</t><br/><t color='#000000'>Nom du propriétaire: %3</t><br/><t color='#000000'>Assurance: %4</t>",_plaquetexte,_classname,_nameplayer,if(_insure in [1,2,3]) then {"<t color='#000000'>Assuré"} else {"<t color='#000000'>Non Assuré</t>"}];
_Texte1 = _display displayCtrl 33164;
_Texte1 ctrlSetStructuredText parseText format["%1",_t1];
