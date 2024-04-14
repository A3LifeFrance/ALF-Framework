#include "\ALF_Client\script_macros.hpp"
/*
File: deposerBusiness.sqf
Author: ALF Nanou
*/
private["_business"];
_business = _this select 0;

private _value = ctrlText 29511;
if !([_value] call TON_fnc_isnumber) exitWith {};
_value = parseNumber(_value);
if(_value < 1) exitWith {};
if(life_cash < _value) exitWith {["INFO","Tu n'as pas autant sur toi.","warning"] spawn ALF_fnc_doMsg;};

private _action = [format["Es-tu certain de vouloir déposer %1€ dans le capital de ton entreprise?",_value],"Entreprise","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

private _var = _business getVariable ["business",[]];
private _capitalstr = _var select 3;
private _siretstr = _var select 2;

private _newvalue = _capitalstr + _value;
_var set[3,_newvalue];

life_cash = life_cash - _value;
[0] call SOCK_fnc_updatePartial;

_business setVariable ["business",_var,true];

private _display = findDisplay 29500;
private _capital = _display displayCtrl 29503;
_capital ctrlSetStructuredText parseText format["<t style='0' align='left' shadow='0' color='#000000' size='1'>%1€</t>",[_newvalue] call life_fnc_numberText];

[_siretstr,_newvalue] remoteExec ["HC_fnc_capitalBusiness",HC2_life];
