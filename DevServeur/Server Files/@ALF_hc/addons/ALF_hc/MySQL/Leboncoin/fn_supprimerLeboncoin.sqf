#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_supprimerLeboncoin.sqf
*/
private _id = _this select 0;
private _numid = _this select 1;
private _u = _this select 2;

[format["DELETE FROM vehicles WHERE pid='%1'",_numid],1] call HC_fnc_asyncCall;
[format["DELETE FROM houses WHERE pid='%1'",_numid],1] call HC_fnc_asyncCall;
[format["DELETE FROM mobiliers WHERE pid='%1'",_numid],1] call HC_fnc_asyncCall;
[format["UPDATE leboncoin SET active='0' WHERE id='%1'",_id],1] call HC_fnc_asyncCall;

["Leboncoin","Vous avez supprimé cette annonce Leboncoin.","success"] remoteExec ["ALF_fnc_doMsg",_u];
