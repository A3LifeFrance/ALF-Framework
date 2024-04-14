/*
	File: fn_keyGiveTime.sqf
	Author: ALF Team
	0 = veh
	1 = house
*/
private _mode = _this select 0;
private _obj = _this select 1;
private _time = _this select 2;
private _unit = _this select 3;
private _player = _this select 4;
private _uid = getPlayerUID _unit;
private _name = getText(configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName");

switch (_mode) do {
	case 0 : {
		private _var = _obj getVariable["dbInfo",[]];
		if(count _var isEqualTo 0) exitWith {};
		private _plate = _var select 1;
		_plate = [_plate] call HC_fnc_mresArray;

		private _check = format["SELECT id FROM vehicles WHERE plate='%1'",_plate];
		private _result = [_check,2] call HC_fnc_asyncCall;
		if(count _result isEqualTo 0) exitWith {};

		private _vid = _result select 0;

		private _count = ([format["SELECT COUNT(*) FROM keysTime WHERE pid='%1' AND idobj='%2' AND mode='%3'",_uid,_vid,_mode],2] call HC_fnc_asyncCall) select 0;
		if(_count > 0) exitWith {};

		private _query = format["INSERT INTO keysTime (pid, mode, idobj, time) VALUES('%1', '%2', '%3','%4')",_uid,_mode,_vid,_time];
		[_query,1] call HC_fnc_asyncCall;

		[_obj,_unit] remoteExecCAll ["TON_fnc_clientGetKey",_unit];

		["PORTE CLES", format["Tu as recu un double de clé de: %1 pour %2 jour(s).",_name,_time],"success"] remoteExec ["ALF_fnc_doMsg",_unit];
		["PORTE CLES", format["Tu as donné le double de clé de: %1 pour %2 jour(s).",_name,_time],"success"] remoteExec ["ALF_fnc_doMsg",_player];
	};
	case 1 : {
		private _dbInfo = _obj getVariable ["house_owner",[]];
		if(count _dbInfo isEqualTo 0) exitWith {};
		if !((getPlayerUID _player) isEqualTo (_dbInfo select 0)) exitWith {["INFO", "Tu n'es pas le proprietaire de la maison.", "success"] remoteExec ["ALF_fnc_doMsg",(remoteExecutedOwner)];};

		private _hid = _obj getVariable ["house_id",-1];
		if(_hid isEqualTo -1) exitWith {};

		private _count = ([format["SELECT COUNT(*) FROM keysTime WHERE pid='%1' AND idobj='%2' AND mode='%3'",_uid,_hid,_mode],2] call HC_fnc_asyncCall) select 0;
		if(_count > 0) exitWith {};

		private _query = format["INSERT INTO keysTime (pid, mode, idobj, time) VALUES('%1', '%2', '%3','%4')",_uid,_mode,_hid,_time];
		[_query,1] call HC_fnc_asyncCall;

		[_obj,_unit] remoteExecCAll ["TON_fnc_clientGetKey",_unit];

		["PORTE CLES", format["Tu as recu un double de clé de: %1 pour %2 jour(s).",_name,_time],"success"] remoteExec ["ALF_fnc_doMsg",_unit];
		["PORTE CLES", format["Tu as donné le double de clé de: %1 pour %2 jour(s).",_name,_time],"success"] remoteExec ["ALF_fnc_doMsg",_player];
	};
};
