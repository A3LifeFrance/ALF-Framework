#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_checkLeboncoin.sqf
*/
private _id = _this select 0;
private _numid = _this select 1;
private _prix = _this select 2;
private _u = _this select 3;
private _s = _this select 4;

private _q = [format["SELECT COUNT(*) FROM leboncoin WHERE numid='%1' AND active='1'",_numid],1] call HC_fnc_asyncCall;
if(_q isEqualTo 0) then {
	["Leboncoin","Cette annonce n'est plus active.","success"] remoteExec ["ALF_fnc_doMsg",_u];
} else {
	[_id,_numid,_prix,_s] remoteExec ["ALF_fnc_buyLeboncoin",_u];
};
