#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_getLeboncoin.sqf
*/
private _uid = _this select 0;
private _u = _this select 1;

_r = [format["SELECT id, classname, insure, active, type FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND lockveh='0'",_uid],2,true] call HC_fnc_asyncCall;

if(_r isEqualType "") exitWith {
	[[]] remoteExec ["ALF_fnc_loadLeboncoin",_u];
};

[_r] remoteExec ["ALF_fnc_loadLeboncoin",_u];
