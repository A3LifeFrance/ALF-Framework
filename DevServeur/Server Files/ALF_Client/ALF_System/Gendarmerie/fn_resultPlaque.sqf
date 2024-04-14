#include "\ALF_Client\script_macros.hpp"
/*
File: fn_resultPlaque.sqf
Author: ALF Team
Description:

*/
if(isNull (findDisplay 30560)) exitWith {};

uiNamespace setVariable ['gplaquemenu',1];
[] call ALF_fnc_menuPlaque;

disableSerialization;
_display = findDisplay 30560;
_Load0 = _display displayCtrl 30580;
_Load1 = _display displayCtrl 30581;
_Load2 = _display displayCtrl 30582;
_Load3 = _display displayCtrl 30583;
_Load4 = _display displayCtrl 30584;
_Load5 = _display displayCtrl 30585;
_Load6 = _display displayCtrl 30586;
_Load7 = _display displayCtrl 30587;
_Load8 = _display displayCtrl 30588;

sleep 0.2;
_Load0 ctrlShow true;
_Load1 ctrlShow false;
_Load2 ctrlShow false;
_Load3 ctrlShow false;
_Load4 ctrlShow false;
_Load5 ctrlShow false;
_Load6 ctrlShow false;
_Load7 ctrlShow false;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow true;
_Load2 ctrlShow false;
_Load3 ctrlShow false;
_Load4 ctrlShow false;
_Load5 ctrlShow false;
_Load6 ctrlShow false;
_Load7 ctrlShow false;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow false;
_Load2 ctrlShow true;
_Load3 ctrlShow false;
_Load4 ctrlShow false;
_Load5 ctrlShow false;
_Load6 ctrlShow false;
_Load7 ctrlShow false;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow false;
_Load2 ctrlShow false;
_Load3 ctrlShow true;
_Load4 ctrlShow false;
_Load5 ctrlShow false;
_Load6 ctrlShow false;
_Load7 ctrlShow false;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow false;
_Load2 ctrlShow false;
_Load3 ctrlShow false;
_Load4 ctrlShow true;
_Load5 ctrlShow false;
_Load6 ctrlShow false;
_Load7 ctrlShow false;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow false;
_Load2 ctrlShow false;
_Load3 ctrlShow false;
_Load4 ctrlShow false;
_Load5 ctrlShow true;
_Load6 ctrlShow false;
_Load7 ctrlShow false;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow false;
_Load2 ctrlShow false;
_Load3 ctrlShow false;
_Load4 ctrlShow false;
_Load5 ctrlShow true;
_Load6 ctrlShow false;
_Load7 ctrlShow false;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow false;
_Load2 ctrlShow false;
_Load3 ctrlShow false;
_Load4 ctrlShow false;
_Load5 ctrlShow false;
_Load6 ctrlShow true;
_Load7 ctrlShow false;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow false;
_Load2 ctrlShow false;
_Load3 ctrlShow false;
_Load4 ctrlShow false;
_Load5 ctrlShow false;
_Load6 ctrlShow false;
_Load7 ctrlShow true;
_Load8 ctrlShow false;
sleep 0.2;
_Load0 ctrlShow false;
_Load1 ctrlShow false;
_Load2 ctrlShow false;
_Load3 ctrlShow false;
_Load4 ctrlShow false;
_Load5 ctrlShow false;
_Load6 ctrlShow false;
_Load7 ctrlShow false;
_Load8 ctrlShow true;

if(isNull (findDisplay 30560)) exitWith {};
uiNamespace setVariable ['gplaquemenu',2];
[] call ALF_fnc_menuPlaque;

_plaquetexte = _this select 0;
_classname = _this select 1;
_nameplayer = _this select 2;
_insure = _this select 3;

private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;

_t1 = format["<t color='#000000'>%1</t>",_plaquetexte];
_t2 = format["<t color='#000000'>%1</t>",_vehicleInfo select 3];
_t3 = format["<t color='#000000'>%1</t>",_nameplayer];

_Texte1 = _display displayCtrl 30567;
_Texte2 = _display displayCtrl 30568;
_Texte3 = _display displayCtrl 30569;
_Texte4 = _display displayCtrl 30570;

_Texte1 ctrlSetStructuredText parseText format["%1",_t1];
_Texte2 ctrlSetStructuredText parseText format["%1",_t2];
_Texte3 ctrlSetStructuredText parseText format["%1",_t3];
_Texte4 ctrlSetStructuredText parseText format["%1",if(_insure isEqualTo 1) then {"<t color='#000000'>Assuré</t>"} else {"<t color='#000000'>Non Assuré</t>"}];
