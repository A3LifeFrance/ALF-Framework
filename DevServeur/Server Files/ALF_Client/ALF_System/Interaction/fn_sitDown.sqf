/*
    File: fn_sitdown.sqf
    Author: ALF - NiiRoZz
*/
params [
	["_obj",objNull,[objNull]],
	["_pos","",[""]]
];

if (isNull _obj || {_pos isEqualTo ""}) exitWith {};
private _pos2 = (AGLToASL (_obj modelToWorld (_obj selectionPosition _pos)));
if((_pos2 distance [0,0,0]) < 100) exitWith {};

[player, "Crew"] remoteExecCall ["ALF_fnc_switchMove",0];
player setPosASL _pos2;
jesuisassis = true;
standup = player addaction ["<t color='#0099FF'>Se lever</t>",ALF_fnc_standUp,_obj];