/*
	File: fn_deleteSmsNokia.sqf
	Author: ALF Team
	Description:

*/
private _id = _this select 0;
private _unit = _this select 1;
private _destinataire = _this select 2;

private _query = format["UPDATE sms SET active='0' WHERE id='%1'",_id];
[_query,1] call HC_fnc_asyncCall;
uiSleep 0.3;
_query = format["SELECT anonyme, expediteur, message, id FROM sms WHERE destinataire='%1' AND active='1'",_destinataire];
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(count (_queryResult) isEqualTo 0) then {
	_queryResult = [];
} else {
	_queryResult = _queryResult;
	{
		_x set[2,toString(_x select 2)];
	} forEach _queryResult;
};
[_queryResult] remoteExec ["ALF_fnc_updateSmsSony",_unit];
