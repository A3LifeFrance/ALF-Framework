/*
	File: fn_countDownForfait.sqf
	Author: ALF Team
*/
for "_i" from 0 to 1 step 0 do {
	uiSleep (30*60);
	{
		private _number = _x getVariable ["phoneNumber",""];
		if !(_number isEqualTo "") then {
			private _result = [format["SELECT time FROM phone WHERE number='%1'",_number],2] call HC_fnc_asyncCall;
			if !(_result isEqualTo []) then {
				[_result select 0] remoteExecCall ["ALF_fnc_updateForfait",_x];
			};
		};
	} forEach playableUnits;
};
