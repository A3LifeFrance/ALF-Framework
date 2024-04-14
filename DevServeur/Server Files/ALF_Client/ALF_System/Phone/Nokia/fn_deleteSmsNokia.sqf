#include "\ALF_Client\script_macros.hpp"
/*
File: deleteSmsNokia
Author: ALF Team
Description:
Supprime un contact au joueur depuis le menu du Nokia.
*/
disableSerialization;
if((lbCurSel 20021) isEqualTo -1) exitWith {hint "Il faut selectionner quelqu'un."};

private _delButton = ((findDisplay 20000) displayCtrl 20024);
_delButton ctrlShow false;

private _data = CONTROL_DATA(20021);
_data = call compile format["%1", _data];

private _id = _data select 4;
private _destinataire = ALF_Phone_Number;

[_id,player,_destinataire] remoteExec ["HC_fnc_deleteSmsNokia", HC3_Life];
