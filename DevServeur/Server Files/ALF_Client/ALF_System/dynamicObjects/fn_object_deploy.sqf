_item = [_this,0,"",[""]] call BIS_fnc_param;

if (_item isEqualTo "") exitWith {};
if !(isNull alf_object) exitWith {};

private _config = (format["getText(_x >> 'item') isEqualTo ('%1')",_item] configClasses (missionConfigFile >> "ALF_OBJECTS")) select 0;
if (isNil "_config") exitWith {};

private _object = configName(_config) createVehicle [0,0,0];
_object attachTo [player,getArray(_config >> "attachTo")];
[_object] call life_fnc_clearVehicleAmmo;
[_object,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
_object setVectorUp (surfaceNormal position _object);
alf_object = _object;

private _action1 = player addAction ["Placer",{detach alf_object;{_x disableCollisionWith alf_object;} forEach (nearestObjects [getPos alf_object,["Car","Air","Ship"],5]);},"",9999,true,true,"",'!(isNull alf_object)'];
waitUntil {((isNull _object) || (isNull (attachedTo _object)))};

alf_object = objNull;
_object setPosATL [(getPosATL _object select 0),(getPosATL _object select 1),(getPosATL player) select 2];
player removeAction _action1;

if (isNull _object) exitWith {};

if (_item in (magazines player)) then {
	player removeMagazine _item;
} else {
	deleteVehicle _object;
};