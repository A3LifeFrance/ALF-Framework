/*
	File: fn_animate.sqf
	Auhtor: ALF Team
*/
private _obj = _this select 0;
private _anim = _this select 1;
private _num = _this select 2;
if(isNull _obj || {isNil "_anim"} || {isNil "_num"}) exitWith {};

_obj animate [_anim,_num,true];
