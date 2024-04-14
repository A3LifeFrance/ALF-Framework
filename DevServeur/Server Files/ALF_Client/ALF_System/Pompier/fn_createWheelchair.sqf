/*
	fn_createWheelchair.sqf
	Dev Team
*/

if (!(license_med) && !(license_medWork)) exitWith {["INFO","Tu n'es pas Pompier ou Médecin.","success"] spawn ALF_fnc_doMsg;};
private _p = _this select 0;
private _pb = _p modelToWorld [0,3,0];

private _nearVeh = [_pb select 0, _pb select 1, 0] nearEntities [["Car","Ship","Air"],10];
if(count _nearVeh > 0) exitWith {["INFO", "Un véhicule gène le point de spawn.", "warning"] spawn ALF_fnc_doMsg;};

private _b = "ALF_WheelChair_P" createVehicle [0,0,0];
[_b,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
_b setPosATL [_pb select 0, _pb select 1, 0];
_b allowDamage false;
[_b] call life_fnc_clearVehicleAmmo;

["INFO","Un fauteuil roulant est disponible !","success"] spawn ALF_fnc_doMsg;
