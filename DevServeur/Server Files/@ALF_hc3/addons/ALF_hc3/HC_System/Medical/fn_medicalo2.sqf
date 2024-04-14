/*
	File: fn_medicalO2.sqf
*/
params[
	["_u",objNull,[objNull]]
];
if(isNull _u) exitWith {};

private _o = "ALF_Oxy9L" createVehicle [0,0,0];
[_o,false] remoteExecCall ["enableSimulationGlobal", 2];
_o setPosATL [(getPosATL _u) select 0,((getPosATL _u) select 1)+0.3,0];
playSound3D ["ALF_Client2\sounds\oxygen.ogg", _o, false, getPosASL _o, 1, 1, 35];

waitUntil {uiSleep 0.25; isNull _u || {!(_u getVariable ["bouteilleo2",false])} || {count (_u getVariable ["MedicalStats",[]]) isEqualTo 0}};

deleteVehicle _o;
