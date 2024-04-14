#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_refuelStation.sqf
	Author: ALF NiiRoZz
*/
params [
	["_station", objNull, [objNull]]
];
private _c = {_x isEqualTo "ALF_Barile_Station"} count (magazines player);
if(_c < 1) exitWith {["INFO","Tu n'as pas au moins 1 bidon traité d'essence sur toi.","warning"] spawn ALF_fnc_doMsg;};

if ((_station getVariable ["station_litre", 3000]) >= 3000) exitWith {["INFO","La station service contient déja 3000 litres d'essence.","warning"] spawn ALF_fnc_doMsg;};

life_action_inUse = true;
private _h = ["ALF_Barile_Station",false] spawn life_fnc_handleItem;
waitUntil {sleep 0.3; scriptDone _h;};

[-50,_station] remoteExecCall ["HC_fnc_updateStation",HC2_Life];

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

["INFO","Tu as ajouté à la station service 50 litres d'essence.","success"] spawn ALF_fnc_doMsg;

private _price = ["ALF_Barile_Station"] call ALF_fnc_returnPrice;
life_cash = life_cash + _price;
[0] call SOCK_fnc_updatePartial;

life_action_inUse = false;