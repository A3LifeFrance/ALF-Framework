#include "\ALF_Client\script_macros.hpp"
/*
File: fn_fipSonyAdd.sqf
Author: ALF Team
*/
private["_data","_motif"];
if(EQUAL((lbCurSel 33189),-1)) exitWith {hint "Il faut selectionner quelqu'un.";};
_data = CONTROL_DATA(33189);
if(_data isEqualTo "Casier vierge.") exitWith {};
_data = call compile format["%1", _data];
_lieu = _data select 0;
_infra = _data select 1;
_date = _data select 2;

[_lieu,_infra,_date,player] remoteExec ["HC_fnc_deleteTajSony",HC3_Life];

uiNamespace setVariable ['sony',0];
[] call ALF_fnc_menuSony;
