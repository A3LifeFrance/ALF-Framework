/*
	File: fn_vehicleStockAfterSell.sqf
	
	This file is for Nanou's HeadlessClient.
*/
private["_cn","_query"];
_cn = _this select 0;
if(_cn isEqualTo "") exitWith {};

_query = format["UPDATE shop SET dispo = dispo + 1 WHERE className='%1'",_cn];
[_query,1] call HC_fnc_asyncCall;
