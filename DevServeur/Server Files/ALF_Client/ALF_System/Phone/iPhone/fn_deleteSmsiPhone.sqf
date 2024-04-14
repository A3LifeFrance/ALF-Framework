#include "\ALF_Client\script_macros.hpp"
/*
File: deleteSmsiPhone
Author: ALF Nanou
*/
disableSerialization;
if((lbCurSel 682561) isEqualTo -1) exitWith {hint "Il faut selectionner quelqu'un."};

private _delButton = ((findDisplay 56400) displayCtrl 682565);
_delButton ctrlShow false;

private _data = CONTROL_DATA(682561);
_data = call compile format["%1", _data];
private _id = _data select 4;
private _destinataire = ALF_Phone_Number;

[_id,player,_destinataire] remoteExec ["HC_fnc_deleteSmsiPhone",HC3_Life];
