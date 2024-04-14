/*
	fn_doQuickMsg.sqf
*/

disableSerialization;
params ["_message", "_POPUPCLASS7", "_POPUP"];

if !(alive player) exitWith {};
if (player getVariable ["ReviveMedic", false]) exitWith {};

20 cutRsc ["RSC_DOMSG7","PLAIN"];
_POPUPCLASS7 = uiNameSpace getVariable ["RSC_DOMSG7",displayNull];
_POPUP = _POPUPCLASS7 displayCtrl 13377;
_POPUP ctrlSetStructuredText parseText format["<t color='#FFCC00'><t size='0.75'>INFO</t><br/>%1",_message];