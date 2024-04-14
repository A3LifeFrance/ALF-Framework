/*
	File: fn_joinCallCentral.sqf
	Author: ALF Team
*/
if((lbCurSel 33121) isEqualTo -1) exitWith {};
private _cible = lbData[33121,lbCurSel (33121)];
_cible = call compile format["%1", _cible];
private _callIDvalue = lbValue[33121,lbCurSel (33121)];

_cible params [
	["_callID",0,[0]],
	["_anonyme",false,[false]],
	["_number","",[""]],
	["_unit",objNull,[objNull]]
];
if(isNull _unit) exitWith {};

ALF_Phone_CallAnonyme = _anonyme;
ALF_Phone_CallNumber = _number;

[_unit,player,_callIDvalue,"17"] remoteExecCall ["HC_fnc_joinCentral",HC3_Life];

if !(isNull ALF_PhoneObject) then {
	detach ALF_PhoneObject;
	deleteVehicle ALF_PhoneObject;
	ALF_PhoneObject = objNull;
	player playActionNow "gestureNod";
	[{player playActionNow "gestureNod";}] call CBA_fnc_execNextFrame;
};
