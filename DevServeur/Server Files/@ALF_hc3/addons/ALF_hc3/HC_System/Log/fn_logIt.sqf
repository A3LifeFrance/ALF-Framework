/*
	File: fn_logIt.sqf
*/
params[
	["_name","",[""]],
	["_uid","",[""]],
	["_type","",[""]],
	["_text","",[""]]
];
if(_name isEqualTo "" OR {_uid isEqualTo ""} OR {_type isEqualTo ""} OR {_text isEqualTo ""}) exitWith {};

[format["INSERT INTO logs_alf (name, uid, type, text) VALUES ('%1', '%2', '%3', '%4')",_name,_uid,_type,_text],1] call HC_fnc_asyncCall;
