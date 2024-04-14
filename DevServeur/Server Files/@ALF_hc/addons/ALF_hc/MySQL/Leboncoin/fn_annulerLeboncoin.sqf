#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_annulerLeboncoin.sqf
*/
private _id = _this select 0;
private _numid = _this select 1;
private _uid = _this select 2;
private _u = _this select 3;

uiSleep random(0.5);

private _count = ([format["SELECT COUNT(*) FROM leboncoin WHERE active='1' AND id='%1'",_id],2] call HC_fnc_asyncCall) select 0;
if(_count isEqualTo 0) exitWith {["Leboncoin","L'annonce a été achetée entre temps.","warning"] remoteExec ["ALF_fnc_doMsg",_u];};

[format["UPDATE vehicles SET pid='%2' WHERE pid='%1'",_numid,_uid],1] call HC_fnc_asyncCall;
[format["UPDATE houses SET pid='%2' WHERE pid='%1'",_numid,_uid],1] call HC_fnc_asyncCall;
[format["UPDATE mobiliers SET pid='%2' WHERE pid='%1'",_numid,_uid],1] call HC_fnc_asyncCall;
[format["UPDATE leboncoin SET active='0' WHERE id='%1'",_id],1] call HC_fnc_asyncCall;

["Leboncoin","Vous avez annulé votre annonce sur Leboncoin.","success"] remoteExec ["ALF_fnc_doMsg",_u];
