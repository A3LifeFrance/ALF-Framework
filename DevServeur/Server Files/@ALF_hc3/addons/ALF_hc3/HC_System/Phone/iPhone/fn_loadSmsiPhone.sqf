/*
	File: fn_loadSmsNokia.sqf
	Author: ALF Team
*/
private _mynumber = _this select 0;
private _unit = _this select 1;

private _query = format["SELECT anonyme, expediteur, message, id FROM sms WHERE destinataire='%1' AND active='1'",_mynumber];
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(count (_queryResult) isEqualTo 0) then {
	_queryResult = [];
} else {
	_queryResult = _queryResult;
	{
		_x set[2,toString(_x select 2)];
	} forEach _queryResult;
};
[_queryResult] remoteExec ["ALF_fnc_updateSmsiPhone",_unit];
