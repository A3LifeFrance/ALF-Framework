#include "\ALF_Client\script_macros.hpp"
/*
File: supprimerLeboncoin.sqf
Author: ALF Nanou
*/
disableSerialization;
if((lbCurSel 24532) isEqualTo -1) exitWith {hint "Tu n'as rien selectionne."};

private _data = CONTROL_DATA(24532);
_data = call compile format["%1",_data];

private _action = ["Es-tu certain de vouloir supprimer cette annonce?","Leboncoin","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {};

closeDialog 0;

[_data select 0,_data select 2,player] remoteExec ["HC_fnc_supprimerLeboncoin",HC_Life];

[name player,getPlayerUID player,"LEBONCOIN",format["vient de supprimer %1 de l uid %2",_data select 2,_data select 1]] remoteExec ["HC_fnc_logIt",HC3_Life];
