/*
	File : fn_PlayerInBuilding.sqf
	Author: Mad_Cheese
	Description:
	Indicates whether a player is in a building
	Edit: BoGuu - lineIntersectsWith returns an array ordered by distance from farthest to closest.
	Script needed to check the last index for each wallCheck array.
	Parameter(s):
	0: OBJECT - Unit
	Returns:
	BOOL - true if player is in a building, else false
	Example
	//--- Find if a unit is in building
	[player] call life_fnc_PlayerInBuilding
*/
params [
    ["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {[objNull,false]};

private _eyePosition = eyePos _unit;
private _array = [];

_roof = [_eyePosition select 0,_eyePosition select 1, (_eyePosition select 2) + 20];
_floor = [_eyePosition select 0,_eyePosition select 1, (_eyePosition select 2) - 5];
_wallFront = [(_eyePosition select 0) + (((50)*sin(getDir _unit))), (_eyePosition select 1) + ((50)*cos(getDir _unit)),(_eyePosition select 2)];
_wallBack = [(_eyePosition select 0) + (((-50)*sin(getDir _unit))), (_eyePosition select 1) + ((-50)*cos(getDir _unit)),(_eyePosition select 2)];
_wallRight = [(_eyePosition select 0) + (((50)*sin(getDir _unit + 90))), (_eyePosition select 1) + ((0)*cos(getDir _unit)),(_eyePosition select 2)];
_wallLeft = [(_eyePosition select 0) + (((-50)*sin(getDir _unit + 90))), (_eyePosition select 1) + ((0)*cos(getDir _unit)),(_eyePosition select 2)];

private _roofCheck = lineIntersectsWith [_eyePosition,_roof,_unit,_unit,true];

if (_roofCheck isEqualTo []) exitWith {[objNull,false]};

_floorCheck = lineIntersectsWith [_eyePosition,_floor,_unit,_unit,true];
_wallCheck_Front = lineIntersectsWith [_eyePosition,_wallFront,_unit,_unit,true];
_wallCheck_Back = lineIntersectsWith [_eyePosition,_wallBack,_unit,_unit,true];
_wallCheck_Right = lineIntersectsWith [_eyePosition,_wallRight,_unit,_unit,true];
_wallCheck_Left = lineIntersectsWith [_eyePosition,_wallLeft,_unit,_unit,true];

private _return = false;

if ((_roofCheck select 0) isKindOf "House_F") then {
    {
        _index = (count _x) - 1;
        if(_index > -1) then {
            if ((_x select _index) isKindOf "House_F") then {
                _array pushBack (_x select _index);
            };
        };
    } forEach [_wallCheck_Front,_wallCheck_Back,_wallCheck_Right,_wallCheck_Left,_floorCheck];

    if ({_x isEqualTo (_roofCheck select 0)} count _array >= 3) then {
        _return = true;
    };
};

[(_roofCheck select 0),_return]