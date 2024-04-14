/*
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: The colour of the tag (valid colours are black, red, green and blue or full path to custom texture) <STRING>
 * 2: Material of the tag <STRING> (Optional)
 *
 * Example:
 * [player, "ALF_Client2\Textures\tags\black\0.paa"] spawn ALF_fnc_tag;
 */

params [
    ["_unit", objNull, [objNull]],
    ["_texture", "", [""]],
    ["_material", "", [""]]
];

if (isNull _unit || {_texture isEqualTo ""}) exitWith {};

private _startPosASL = eyePos _unit;
private _cameraPosASL =  AGLToASL positionCameraToWorld [0, 0, 0];
private _cameraDir = (AGLToASL positionCameraToWorld [0, 0, 1]) vectorDiff _cameraPosASL;
private _endPosASL = _startPosASL vectorAdd (_cameraDir vectorMultiply 2.5);

private _intersections = lineIntersectsSurfaces [_startPosASL, _endPosASL, _unit, objNull, true, 1, "GEOM", "FIRE"];

if (_intersections isEqualTo []) exitWith {false};

(_intersections select 0) params ["_touchingPoint", "_surfaceNormal", "", "_object"];

if ((!isNull _object) && {!(_object isKindOf "Static")}) exitWith {false};

if (_surfaceNormal vectorDotProduct  (_endPosASL vectorDiff _startPosASL) > 0) then {
    _surfaceNormal = _surfaceNormal vectorMultiply -1;
};

private _v1 = vectorNormalized (_surfaceNormal vectorMultiply -1);
private _v2 = vectorNormalized (_v1 vectorCrossProduct (_endPosASL vectorDiff _startPosASL));

if (abs (_v1 select 2) < 0.94) then {
    private _v3Temp = _v1 vectorCrossProduct [0, 0, 1];
    _v2 = _v3Temp vectorCrossProduct _v1;
};
private _v3 = _v2 vectorCrossProduct _v1;

private _fnc_isOk = {
    params ["_rx", "_ry"];
    private _startPosASL2 = _touchingPoint vectorAdd (_v2 vectorMultiply _rx) vectorAdd (_v3 vectorMultiply _ry) vectorAdd (_v1 vectorMultiply (-0.06));
    private _endPosASL2   = _startPosASL2 vectorAdd (_v1 vectorMultiply (0.12));
    private _intersections = lineIntersectsSurfaces [_startPosASL2, _endPosASL2, _unit, objNull, true, 1, "GEOM", "FIRE"];
    if (_intersections isEqualTo []) exitWith {false;};
    if !(((_intersections select 0) select 3) isEqualTo _object) exitWith {false;};
    true
};

if (!([ 0.5 * 0.6, 0.5 * 0.6] call _fnc_isOk) || {!([ 0.5 * 0.6,-0.5 * 0.6] call _fnc_isOk) || {!([-0.5 * 0.6, 0.5 * 0.6] call _fnc_isOk) || {!([-0.5 * 0.6,-0.5 * 0.6] call _fnc_isOk)}}}) exitWith {false};

private _vectorDirAndUp = [_surfaceNormal vectorMultiply -1, _v3];

_unit playActionNow "PutDown";

uisleep 0.6;

playSound3D ["ALF_Client\sounds\spray.ogg", _unit, false, (eyePos _unit), 10, 1, 15];

[_touchingPoint vectorAdd (_surfaceNormal vectorMultiply 0.06), _vectorDirAndUp, _texture, _object, _unit, _material] call ALF_fnc_createTag;

true