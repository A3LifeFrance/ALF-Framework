_object = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _object) exitWith {};

alf_object = _object;
_object attachTo [player,getArray(missionConfigFile >> "ALF_OBJECTS" >> typeOf(_object) >> "attachTo")];

private _action1 = player addAction ["Placer",{detach alf_object;{_x disableCollisionWith alf_object;} forEach (nearestObjects [getPos alf_object,["Car","Air","Ship"],5]);},"",9999,true,true,"",'!isNull alf_object'];

waitUntil {((isNull _object) || (isNull (attachedTo _object)))};

alf_object = objNull;
player removeAction _action1;