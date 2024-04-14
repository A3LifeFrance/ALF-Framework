#include "\ALF_Client\script_macros.hpp"
disableSerialization;
if((lbCurSel 33144) isEqualTo -1) exitWith {hint "Il faut selectionner quelqu'un."};

private _delButton = ((findDisplay 32999) displayCtrl 33147);
_delButton ctrlShow false;

private _data = CONTROL_DATA(33144);
_data = call compile format["%1", _data];

private _destinataire = ALF_Phone_Number;
private _id = _data select 4;

[_id,player,_destinataire] remoteExec ["HC_fnc_deleteSmsSony",HC3_Life];
