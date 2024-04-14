/*
	File: fn_getPLaque.sqf
	Author: ALF NiiRoZz
*/
params [
  ["_veh",objNull,[objNull]]
];

if (isNull _veh) exitWith {[]};

_textures = getObjectTextures _veh;

if (_textures isEqualTo []) exitWith {};

private _ps1 = format ["%1", "-"];
private _pl1 = ((_textures select 1) select [30, 1]);
private _pl2 = ((_textures select 2) select [30, 1]);
private _pl3 = ((_textures select 6) select [30, 1]);
private _pl4 = ((_textures select 7) select [30, 1]);
private _pn1 = ((_textures select 3) select [30, 1]);
private _pn2 = ((_textures select 4) select [30, 1]);
private _pn3 = ((_textures select 5) select [30, 1]);



[_pl1, _pl2, _ps1, _pn1, _pn2, _pn3, _ps1, _pl3, _pl4]
