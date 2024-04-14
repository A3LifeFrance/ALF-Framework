/*
	File: fn_getMSGFromNumber.sqf
	Author: ALF Adam
*/
params [
	["_number","",[""]]
];
if (_number isEqualTo "") exitWith {};

private _query = format["SELECT expediteur, destinataire, message, insert_time FROM sms WHERE destinataire='%1' OR expediteur='%1'",_number];
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;

if (count(_queryResult) isEqualTo 0) then {
	_queryResult = [[]];
} else {
	{
		_x set[2, toString(_x select 2)];
	} forEach _queryResult;
};

[2, _number, _queryResult] remoteExec ["ALF_fnc_menuSMSSR", remoteExecutedOwner];