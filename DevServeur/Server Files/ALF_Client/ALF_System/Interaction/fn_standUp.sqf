/*
    File: fn_standup.sqf
    Author: ALF - NiiRoZz
*/
private _obj = _this select 3;

if (isNull _obj) exitWith {};

[player, ""] remoteExecCall ["ALF_fnc_switchMove",0];
player removeAction standup;
jesuisassis = false;
player setPosASL (AGLToASL (_obj modelToWorld (_obj selectionPosition "pos cargo dir")));