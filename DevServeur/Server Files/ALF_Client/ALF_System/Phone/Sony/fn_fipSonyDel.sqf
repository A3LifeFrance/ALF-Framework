#include "\ALF_Client\script_macros.hpp"
/*
File: fn_fipSonyAdd.sqf
Author: ALF Team
*/
private["_data","_motif","_name"];
if(EQUAL((lbCurSel 33176),-1)) exitWith {hint "Il faut selectionner quelqu'un.";};
if(life_copLevel < 4) exitWith {["INFO","Tu n'es pas OPJ."]};
_data = CONTROL_DATA(33176);
if(_data isEqualTo "La liste est vide.") exitWith {};
_data = call compile format["%1", _data];
_motif = _data select 0;
_name = _data select 1;

[_motif,player] remoteExec ["HC_fnc_deleteFipSony",HC3_Life];

["FPR",format["%1 a retire %2 du fichier des personnes recherchees.",name player,_name]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
