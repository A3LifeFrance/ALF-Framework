/*
	createBrancard
	Nanou
*/

/*
POSITION BRANCAR SPRINTER

BRANCARD attachTo [SPRINTER,[0.15,-1.5,1.12]]
BRANCARD setDir 180;
*/
if !(license_med) exitWith {["INFO","Tu n'es pas Pompier.","success"] spawn ALF_fnc_doMsg;};
private _pb = getMarkerPos (_this select 3);

private _nearVeh = [_pb select 0, _pb select 1, 0] nearEntities [["Car","Ship","Air"],10];
if (count _nearVeh > 0) exitWith {["INFO", "Un véhicule gène le point de spawn.", "warning"] spawn ALF_fnc_doMsg;};

private _b = "ALF_Brancard_P" createVehicle [0,0,0];
_b allowDamage false;
_b setPosATL [_pb select 0, _pb select 1, 0];
[_b] call life_fnc_clearVehicleAmmo;

["INFO","Un brancard est disponible !","success"] spawn ALF_fnc_doMsg;
