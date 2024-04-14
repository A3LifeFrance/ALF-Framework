#include "\ALF_Client\script_macros.hpp"
disableSerialization;
if((lbCurSel 39144) isEqualTo -1) exitWith {hint "Il faut selectionner quelqu'un."};

private _delButton = ((findDisplay 38999) displayCtrl 39147);
_delButton ctrlShow false;

private _data = CONTROL_DATA(39144);
_data = call compile format["%1", _data];

private _destinataire = ALF_Phone_Number;
private _id = _data select 4;

[_id,player,_destinataire] remoteExec ["HC_fnc_deleteSmsSonyP",HC3_Life];
