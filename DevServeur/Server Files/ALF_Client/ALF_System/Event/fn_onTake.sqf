/*
    File: fn_onTake.sqf
    Author: ALF - NiiRoZz
*/
params [
    ["_unit",objNull,[objNull]],
    ["_container",objNull,[objNull]],
    ["_item","",[""]]
];

if (_item isEqualTo "ALF_Raisin" && {_container getVariable ["TakeRaisin",false]}) exitWith {
    _count = {(_x select 0) isEqualTo "ALF_Raisin"} count (magazinesAmmo _container);
    if (_count isEqualTo 0) then {
        [0,3] spawn ALF_fnc_addXP;
        closeDialog 0;
        deleteVehicle _container;
    };
};