/*
    File: fn_ambientAnim.sqf
    Author: NiiRoZz

    Description:
    Some information in local client for his position
*/
params [
    ["_trader",objNull,[objNull]]
];
if (isNull _trader) exitWith {};

private _animsAndGear = [str _trader] call HC_fnc_getAnimGear;
_animsAndGear params [
    ["_animations",[],[[],""]],
    ["_gear",[],[[]]]
];

private _dir = getDir _trader;
_trader setVariable ["BIS_enableRandomization", false];
_trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
[_trader,"ALL"] remoteExecCall ["disableAI",_trader];
_trader allowDamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader setUnitLoadout _gear;

private _attachToObject = "Land_Screwdriver_V1_F" createVehicle [0,0,0];
_attachToObject setPosATL (getPosATL _trader);
[_attachToObject] remoteExecCall ["hideObjectGlobal",2];

_trader attachTo [_attachToObject, [0,0,0]];
[_trader,_dir] remoteExecCall ["setDir",_trader];

/*
if (_animations isEqualType []) then {
    [_trader,_animations] remoteExec ["ALF_fnc_ambientAnim",0,true];
} else {
    _animations = [_animations];
    [_trader,_animations] remoteExec ["ALF_fnc_ambientAnim",0,true];
};
*/