#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Picks up money
*/
private ["_value","_n"];
if((time - life_action_delay) < 1.5) exitWith {hint "Tu appuis trop vite."; _this setVariable ["inUse",false,true];};
if(isNull _this OR {player distance _this > 3}) exitWith {_this setVariable ["inUse",false,true];};

_value = _this getVariable ["item",[]] select 1;
_n = _this getVariable ["item",[]] select 2;
if(_n isEqualTo "") exitWith {hint "Dommage #01";};
if(!isNil "_value") exitWith {
	deleteVehicle _this;

	switch (true) do {
		case (_value > 20000000) : {_value = 10000;};
		case (_value > 5000000) : {_value = 25000;};
		default {};
	};

	player playMove "AinvPknlMstpSlayWrflDnon";
	titleText[format[localize "STR_NOTF_PickedMoney",[_value] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _value;
	life_action_delay = time;
	[name player,getPlayerUID player,"PICKUP",format["A ramassé %1€ au sol de %2 | Position : %3 | Cash : %4€",_value,_n,getPos player,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
};