#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_getAnnonceLeboncoin.sqf
*/
private _u = _this select 0;

private _r = ["SELECT id, seller, numid, obj, titre, description, prix, nom, numero, DATE_FORMAT(insert_time,'%d/%m/%Y %HH%i') FROM leboncoin WHERE active='1'",2,true] call HC_fnc_asyncCall;
if(_r isEqualType "") exitWith {
	[[]] remoteExec ["ALF_fnc_loadAnnonceLeboncoin",_u];
};

{
	_x set[3,toString(_x select 3)];
	_x set[4,toString(_x select 4)];
	_x set[5,toString(_x select 5)];
	_x set[7,toString(_x select 7)];
} forEach _r;

[_r] remoteExec ["ALF_fnc_loadAnnonceLeboncoin",_u];
