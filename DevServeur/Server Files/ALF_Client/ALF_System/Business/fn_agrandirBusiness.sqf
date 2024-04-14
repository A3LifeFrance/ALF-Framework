#include "\ALF_Client\script_macros.hpp"
/*
File: fn_agrandirBusiness.sqf
Author: ALF Nanou
*/
private["_business"];
_business = _this select 0;

private _var = _business getVariable ["business",[]];
private _capitalstr = _var select 3;
private _levelstr = _var select 6;
private _siretstr = _var select 2;
if(_capitalstr < 1000000) exitWith {["INFO","Le capital est inférieur à 1.000.000€.","warning"] spawn ALF_fnc_doMsg;};
if(_levelstr isEqualTo 1) exitWith {["INFO","L'entreprise est déjà au maximum.","warning"] spawn ALF_fnc_doMsg;};

private _action = ["Es-tu certain de vouloir agrandir ton entreprise pour une valeur de 500.000€.","Entreprise","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

private _newvalue = _capitalstr - 500000;
_var set[3,_newvalue];
_var set[6,1];

_business setVariable ["business",_var,true];

_business animateSource ["level_source",1,true];

private _display = findDisplay 29500;
private _capital = _display displayCtrl 29503;
private _level = _display displayCtrl 29504;
_capital ctrlSetStructuredText parseText format["<t style='0' align='left' shadow='0' color='#000000' size='1'>%1€</t>",[_newvalue] call life_fnc_numberText];
private _levelfinal = "Niveau 2";
_level ctrlSetStructuredText parseText format["<t style='0' align='left' shadow='0' color='#000000' size='1'>%1</t>",_levelfinal];

[_siretstr,_newvalue,1] remoteExec ["HC_fnc_agrandirBusiness",HC2_life];