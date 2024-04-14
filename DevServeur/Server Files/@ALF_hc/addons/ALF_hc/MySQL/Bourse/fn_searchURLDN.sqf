/*
	File: fn_searchURLDN.sqf
*/
private _url = _this select 0;

private _queryResult = ["SELECT active FROM cyber WHERE id='1'",2] call HC_fnc_asyncCall;

if ((_queryResult select 0) isEqualTo 0) then {
	["CYBER","Le DarkNet n'est pas accessible a cette heure !","danger"] remoteExec ["ALF_fnc_doMsg",remoteExecutedOwner];
} else {
	[_url] remoteExecCall ["ALF_fnc_returnSearchURLDN",remoteExecutedOwner];
};
