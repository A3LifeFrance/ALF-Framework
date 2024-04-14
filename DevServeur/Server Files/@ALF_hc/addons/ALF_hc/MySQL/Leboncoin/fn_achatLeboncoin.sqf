#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_achatLeboncoin.sqf
*/
private _id = _this select 0;
private _numid = _this select 1;
private _uid = _this select 2;
private _u = _this select 3;
private _s = _this select 4;
private _p = _this select 5;

[format["UPDATE vehicles SET pid='%2', insurecount='0' WHERE pid='%1'",_numid,_uid],1] call HC_fnc_asyncCall;
[format["UPDATE houses SET pid='%2' WHERE pid='%1'",_numid,_uid],1] call HC_fnc_asyncCall;
[format["UPDATE mobiliers SET pid='%2' WHERE pid='%1'",_numid,_uid],1] call HC_fnc_asyncCall;
[format["UPDATE leboncoin SET active='0' WHERE id='%1'",_id],1] call HC_fnc_asyncCall;

["Leboncoin","Vous avez acheté cette annonce. Félicitation.","success"] remoteExec ["ALF_fnc_doMsg",_u];

private _e = false;
{
	if((getPlayerUID _x) isEqualTo _s) exitWith {
		[_p] remoteExec ["ALF_fnc_moneyLeboncoin",_x];
		_e = true;
	};
} forEach playableUnits;

if !(_e) then {
	[format["UPDATE players SET cash=cash+%2 WHERE playerid='%1'",_s,_p],1] call HC_fnc_asyncCall;
};
