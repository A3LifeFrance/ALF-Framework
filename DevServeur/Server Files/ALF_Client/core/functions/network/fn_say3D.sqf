/*
	File: fn_say3D.sqf
	[_veh,"unlock"] remoteExec ["life_fnc_say3D",RANY];
*/
private _o = _this select 0;
private _s = _this select 1;
if(isNil "_o" OR {isNil "_s"}) exitWith {};

_o say3D _s;
