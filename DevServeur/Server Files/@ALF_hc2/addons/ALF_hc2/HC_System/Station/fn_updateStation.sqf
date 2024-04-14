/*
	File: fn_updateStation.sqf
	Author: ALF NiiRoZz

	This file is for Nanou's HeadlessClient.
*/
params [
	["_litre", -1, [0]],
	["_station", objNull, [objNull]]
];

if (_litre isEqualTo -1 || isNull _station) exitWith {};
private _id = _station getVariable ["station_id", 1];
private _litreUpdate = round (0 max ((_station getVariable ["station_litre", 3000]) - _litre));
_station setVariable ["station_litre", _litreUpdate, true];

[format["UPDATE station SET litre='%2' WHERE id='%1'",_id,_litreUpdate],1] call HC_fnc_asyncCall;

switch (true) do {
	case (_litreUpdate isEqualTo 0): {
		_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_0.paa"];
	};
	case (_litreUpdate <= 500): {
		_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_1.paa"];
	};
	case (_litreUpdate > 500 && _litreUpdate <= 1000): {
		_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_2.paa"];
	};
	case (_litreUpdate > 1000 && _litreUpdate <= 1500): {
		_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_3.paa"];
	};
	case (_litreUpdate > 1500 && _litreUpdate <= 2000): {
		_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_4.paa"];
	};
	case (_litreUpdate > 2000 && _litreUpdate <= 2500): {
		_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_5.paa"];
	};
	case (_litreUpdate > 2500): {
		_station setObjectTextureGlobal [0, "alf_batiments\alf_station\data\tank_6.paa"];
	};
};
