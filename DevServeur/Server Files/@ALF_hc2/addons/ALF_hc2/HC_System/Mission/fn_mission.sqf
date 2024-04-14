params [
	["_unit", objNull, [objNull]],
	["_type", "", [""]],
	["_position", [], [[]]]
];

if (_type isEqualTo "") exitWith {};

private _config = missionConfigFile >> "ALF_MISSIONS" >> _type;

private _types = [];
{
	if (count(getArray(_config >> "stock" >> _x)) > 0) then {
		_types pushBack _x;
	};
} forEach (["weapons", "magazines", "items", "backpacks"]);

uisleep 600;

private _vehicle = createVehicle [getText(_config >> "vehicle"),[_position select 0,_position select 1,400],[],0,"FLY"];
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle allowDamage false;

private _objectBB = [[-0.8,-0.6,-12.1],[0.8,0.6,-10.7]];
private _objectMinBB = _objectBB select 0;
private _objectMaxBB = _objectBB select 1;

private _objectCenterX = (_objectMinBB select 0) + (((_objectMaxBB select 0) - (_objectMinBB select 0)) / 2);
private _objectCenterY = (_objectMinBB select 1) + (((_objectMaxBB select 1) - (_objectMinBB select 1)) / 2);

private _para = createVehicle ["B_parachute_02_F", [0,0,999999], [], 0, ""];
_para disableCollisionWith _vehicle;
_para allowDamage false;

_para setDir getDir _vehicle;
_para setPosATL getPosATL _vehicle;

uiSleep 2;

_vehicle attachTo [_para, [0 - _objectCenterX, 0 - _objectCenterY, 0]];

uiSleep 4.25;

waitUntil {(getpos _para select 2) < ((_position select 2) + 8) || isTouchingGround _para || !alive _para};

if (!isNull _para) then {
	_para setVelocity [0,0,0];
	detach _para;
	sleep 1.5;
	deleteVehicle _para;
	_vehicle allowDamage true;
};

["Cargaison",format["La livraison est arrivée en %1.", (mapGridPosition _position)],"warning"] remoteExec ["ALF_fnc_doMsg",_unit];

for "_i" from 0 to 10 do {
	_type = ([_types] call CBA_fnc_shuffle) call BIS_fnc_selectRandom;

	_item = ([getArray(_config >> "stock" >> _type)] call CBA_fnc_shuffle) call BIS_fnc_selectRandom;
	switch _type do {
		case "weapons": {_vehicle addWeaponCargoGlobal [_item, 1]};
		case "magazines": {_vehicle addMagazineCargoGlobal [_item, 4]};
		case "backpacks": {_vehicle addBackpackCargoGlobal [_item, 1]};
		case "items": {_vehicle addItemCargoGlobal [_item, 1]};
	};
};

if ((_vehicle isKindOf "Car") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Tank")) then {
	if (local _vehicle) then {
		_vehicle lock 2;
	} else {
		[_vehicle, 2] remoteExecCall ["lock", _vehicle];
	};
} else {
	["Cargaison","Le coffre sera supprimée dans 60 minutes.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];
	uiSleep (60 * 60);
	deleteVehicle _vehicle;
};