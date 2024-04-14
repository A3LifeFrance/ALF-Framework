/*
	File: fn_createPhoneNumber.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:

*/
params [
	["_uid","",[""]],
	["_unit",objNull,[objNull]]
];

_prefix = selectRandom ["06","07"];
private _nbf = _prefix + format["%1%2%3%4%5%6%7%8", floor(random 10), floor(random 10), floor(random 10), floor(random 10), floor(random 10), floor(random 10), floor(random 10), floor(random 10)];

private _count = ([format["SELECT COUNT(*) FROM phone WHERE number='%1'",_nbf],2] call HC_fnc_asyncCall) select 0;

if(_count isEqualTo 0) then {
	private _query = format["UPDATE phone SET number='%1' WHERE playerid='%2'",_nbf,_uid];
	[_query,1] call HC_fnc_asyncCall;
	_unit setVariable ["phoneNumber",_nbf];
	[_nbf] remoteExecCall ["ALF_fnc_setPhoneNumber",_unit];
} else {
	[_uid,_unit] spawn HC_fnc_createPhoneNumber;
};
