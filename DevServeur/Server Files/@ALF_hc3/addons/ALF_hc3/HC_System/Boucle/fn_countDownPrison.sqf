/*
	File: fn_countDownPrison.sqf
	Author: ALF NiiRoZz
*/
for "_i" from 0 to 1 step 0 do {
	uiSleep 60;
	_count = (["SELECT COUNT(*) FROM players WHERE jail='1' AND jailtime > 0",2] call HC_fnc_asyncCall) select 0;

	if (_count > 0) then {
		{
			[format["UPDATE players SET jailtime=(jailtime - 1) WHERE jail='1' AND jailtime > 0 AND playerid='%1'",(getPlayerUID _x)],1] call HC_fnc_asyncCall;
		} forEach (playableUnits select {_x getVariable ["ALF_EnPrison",false]});

		_queryResult = ["SELECT playerid, name FROM players WHERE jail='1' AND jailtime <= 0",2,true] call HC_fnc_asyncCall;
		
		if (_queryResult isEqualTo []) exitWith {};
		if (_queryResult isEqualType "") exitWith {};

		{
			_uid = _x select 0;
			_name = _x select 1;
			["Bracelet",format["Le temps de %1 est terminé. Il n'est plus en prison.",_name]] remoteExec ["ALF_fnc_doCopCall",(playableUnits select {_x getVariable ["CopService",false]})];

			[format["UPDATE players SET jail='0', jailtime='0' WHERE playerid='%1'",_uid],1] call HC_fnc_asyncCall;
		} forEach _queryResult;
	};
};
