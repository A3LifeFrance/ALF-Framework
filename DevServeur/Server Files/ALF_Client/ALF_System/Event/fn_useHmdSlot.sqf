/*
    File: fn_useHmdSlot.sqf
    Author: ALF - NiiRoZz
*/
private _hmd = hmd player;

if (!(_hmd in murshun_cigs_cigsArray) || {player getVariable ["murshun_cigs_cigLitUp", false]}) exitWith {};

[player] spawn murshun_cigs_fnc_start_cig_your;