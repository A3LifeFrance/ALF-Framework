/*
	File: fn_buyForfait.sqf
	Author: ALF Team
*/
params [
	["_uid","",[""]],
	["_mode",-1,[0]],
	["_unit",objNull,[objNull]]
];
if(_uid isEqualTo "" OR {_mode isEqualTo -1} OR {isNull _unit}) exitWith {};

private _metod = 0;
private _time = 0;

//On check si il existe
private _queryResult = [format["SELECT offre, time FROM phone WHERE playerid='%1'",_uid],2] call HC_fnc_asyncCall;

if (count(_queryResult) isEqualTo 0) then {
	_metod = 2;
} else {
	_metod = 1;
	_time = _queryResult select 1;
};

private "_query";
switch (_metod) do {
	case 1 : {
		switch (_mode) do {
			case 1 : {
				_time = _time + (60 * 24);
			};
			case 2 : {
				_time = _time + (60 * 24) * 3;
			};
			case 3 : {
				_time = _time + (60 * 24) * 7;
			};
			case 4 : {
				_time = _time + (60 * 24) * 14;
			};
		};
		_query = format["UPDATE phone SET offre='1', time='%1' WHERE playerid='%2'",_time,_uid];
	};
	case 2 : {
		switch (_mode) do {
			case 1 : {
				_time = (60 * 24);
			};
			case 2 : {
				_time = (60 * 24) * 3;
			};
			case 3 : {
				_time = (60 * 24) * 7;
			};
			case 4 : {
				_time = (60 * 24) * 14;
			};
		};
		_query = format["INSERT INTO phone (playerid, offre, time, contacts) VALUES ('%1', '1', '%2','""[]""')",_uid,_time];
		[_uid,_unit] spawn HC_fnc_createPhoneNumber;
	};
};

[_query,1] call HC_fnc_asyncCall;

[_time] remoteExecCall ["ALF_fnc_updateForfait",_unit];
