/*
	File: fn_checkaxa.sqf
	Author: ALF Team
*/
private _acp = ["SELECT playerid, axacount FROM players WHERE axa > 0",2,true] call HC_fnc_asyncCall;
if(count _acp > 0) then {
	{
		private _acuid = _x select 0;
		private _axac = _x select 1;
		private _ac = ([format["SELECT COUNT(*) FROM vehicles WHERE pid='%1' AND insure='1'",_acuid],2] call HC_fnc_asyncCall) select 0;
		if !(_ac isEqualTo _axac) then {
			[format["UPDATE players SET axacount='%1' WHERE playerid='%2'",_ac,_acuid],1] call HC_fnc_asyncCall;
		};
	} forEach _acp;
};

private _p = ["SELECT playerid FROM players WHERE axa='4' AND isPremium='0'",2,true] call HC_fnc_asyncCall;
if(count _p > 0) then {
	{
		private _uid = _x select 0;
		[format["UPDATE players SET axa='3' WHERE playerid='%1'",_uid],1] call HC_fnc_asyncCall;
		private _c = ([format["SELECT COUNT(*) FROM vehicles WHERE pid='%1' AND insure='1'",_uid],2] call HC_fnc_asyncCall) select 0;
		if(_c > 10) then {
			private _q = [format["SELECT id FROM vehicles WHERE pid='%1' AND insure='1'",_uid],2,true] call HC_fnc_asyncCall;
			private _n = 0;
			{
				_n = _n + 1;
				if(_n > 10) then {
					[format["UPDATE vehicles SET insure='0' WHERE id='%1'",_x select 0],1] call HC_fnc_asyncCall;
				};
			} forEach _q;
			[format["UPDATE players SET axacount='10' WHERE playerid='%1'",_uid],1] call HC_fnc_asyncCall;
		};
	} forEach _p;
};
