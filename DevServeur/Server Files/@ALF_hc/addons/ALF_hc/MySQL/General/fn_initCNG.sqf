/*
	File: fn_initCNG.sqf
*/
private _result = [format["SELECT bank FROM CNG WHERE id='1'"],2] call HC_fnc_asyncCall;
if(count _result isEqualTo 0) exitWith {};
_result = parseNumber(_result select 0);
missionNamespace setVariable ["CNG",_result,true];
