/*
	File: fn_initStation.sqf
	Author: ALF Nanou

	This file is for Nanou's HeadlessClient.
*/
private["_queryResult","_query","_count"];
_count = (["SELECT COUNT(*) FROM station",2] call HC_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	_query = format["SELECT id, pos, litre FROM station LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call HC_fnc_asyncCall;
	if(count _queryResult isEqualTo 0) exitWith {};
	{
		private _station = nearestObject [(call compile format["%1",_x select 1]), "Land_ALF_station"];
		if !(isNull _station) then {
			private _litre = _x select 2;
			_station setVariable ["station_litre",_litre,true];
			_station setVariable ["station_id",_x select 0];
			switch (true) do {
				case (_litre isEqualTo 0): {
					_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_0.paa"];
				};
				case (_litre <= 500): {
					_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_1.paa"];
				};
				case (_litre > 500 && _litre <= 1000): {
					_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_2.paa"];
				};
				case (_litre > 1000 && _litre <= 1500): {
					_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_3.paa"];
				};
				case (_litre > 1500 && _litre <= 2000): {
					_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_4.paa"];
				};
				case (_litre > 2000 && _litre <= 2500): {
					_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_5.paa"];
				};
				case (_litre > 2500): {
					_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_6.paa"];
				};
			};
		};
	} forEach _queryResult;
};
