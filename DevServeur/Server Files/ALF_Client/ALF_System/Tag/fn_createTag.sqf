/*
 * Arguments:
 * 0: Position ASL <ARRAY>
 * 1: Vector dir and up <ARRAY>
 * 2: Colour of the tag (valid colours are black, red, green and blue or full path to custom texture) <STRING>
 * 3: Object it should be tied to <OBJECT>
 * 4: Unit that created the tag <OBJECT>
 * 5: Material of the tag <STRING> (Optional)
 *
 * Example:
 * [positionASL, vectorDirAndUp, "z\ace\addons\tagging\UI\tags\black\0.paa", object] call ALF_fnc_createTag;
 */

params ["_tagPosASL", "_vectorDirAndUp", "_texture", "_object", "_unit", ["_material","",[""]]];

diag_log str([_tagPosASL,_vectorDirAndUp,_texture,_object,_unit]);

if (_texture isEqualTo "") exitWith {false};

private _tag = createSimpleObject ["UserTexture1m_F", _tagPosASL];
_tag setObjectTextureGlobal [0, _texture];
if (_material != "") then { _tag setObjectMaterialGlobal [0, _material] };
_tag setVectorDirAndUp _vectorDirAndUp;

["ace_tagCreated", [_tag, _texture, _object, _unit]] call CBA_fnc_globalEvent;

if (isNull _object) exitWith {true};

_object setVariable ["testVar", true];
if (_object getVariable ["testVar", false]) then {
    private _attachedTags = _object getVariable "attachedTags";
    if !(isNil  "_attachedTags ") exitWith {
        _attachedTags pushBack _tag;
    };
	
    _attachedTags = [_tag];
    _object setVariable ["attachedTags", _attachedTags];

    _object addEventHandler ["HandleDamage", {
        params ["_object", "_selection", "_damage"];
        if (_selection isEqualTo "" && _damage >= 1) then {
            {
                deleteVehicle _x;
            } foreach (_object getVariable ["attachedTags", []]);
            _object setVariable ["attachedTags", []];
        };
    }];
};

_vectorDirAndUp params ["_v1", "_v2"];
	
private _endPosASL = _tagPosASL vectorAdd (_v1 vectorMultiply 0.08);
private _intersections = lineIntersectsSurfaces [_tagPosASL, _endPosASL, _tag, objNull, true, 1, "GEOM", "FIRE"];

if (_intersections isEqualTo []) then {
    deleteVehicle _tag;
    false
} else {
    true
};

true