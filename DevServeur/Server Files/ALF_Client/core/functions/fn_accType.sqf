#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_accType.sqf
*/
params [
	["_item","",[""]],
    ["_type",0,[0]]
];
if (_item isEqualTo "" || _type isEqualTo 0) exitWith {0};
private _ret = 0;

private _weaponArray = [primaryWeapon player, secondaryWeapon player, handgunWeapon player];
{
    if (!(_ret isEqualTo 0)) exitWith {}; //Make sure we exit the loop since there was already a match.
    if (!(_x isEqualTo "")) then
    {
        _weapon = _x;
        _cfgInfo = [_weapon,"CfgWeapons"] call life_fnc_fetchCfgDetails;

        _legacyItems = ((_cfgInfo select 10) + (_cfgInfo select 11) + (_cfgInfo select 12));
        _newItems = _cfgInfo select 14;

        //Check Legacy Items first
        if (count _legacyItems > 0) then {
            for "_i" from 0 to (count _legacyItems)-1 do {
                _legacyItems set[_i,toLower(_legacyItems select _i)];
            };

            if ((toLower _item) in _legacyItems) exitWith {_ret = switch (_weapon) do {case (primaryWeapon player): {1};case (secondaryWeapon player) : {2};case (handgunWeapon player): {3};default {0};};};
        };

        //Check new compatibleItems class structure
        if (count _newItems > 0) then {
            //This gets weird with forEach in forEach :\
            {
                if (!(_ret isEqualTo 0)) exitWith {};

                if (isClass (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> _x >> "compatibleItems")) then {
                    _cfg = FETCH_CONFIG4(getNumber,"CfgWeapons",_weapon,"WeaponSlotsInfo",_x,"compatibleItems",_item);
                };

                if (isNil "_cfg") then {_cfg = 0;};
                if (_cfg isEqualTo 1) exitWith {
                    _ret = switch (_weapon) do {case (primaryWeapon player): {1};case (secondaryWeapon player) : {2};case (handgunWeapon player): {3};default {0};};
                };
            } forEach _newItems;
            if (!(_ret isEqualTo 0)) exitWith {}; //Make sure we exit the loop
        };
    };
} forEach _weaponArray;
_ret;