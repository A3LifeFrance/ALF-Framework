#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_Anubis.sqf
  ALF Nanou
*/
private["_obj","_mode","_a1","_a2"];
_obj = _this select 0;
_mode = _this select 1;
if((_obj animationSourcePhase "relique_source") < 1) exitWith {};

switch (_mode) do {
	case 1 : {["ALF_Relique_1",false] spawn life_fnc_handleItem;};
	case 2 : {["ALF_Relique_2",false] spawn life_fnc_handleItem;};
	case 3 : {["ALF_Relique_3",false] spawn life_fnc_handleItem;};
};
_obj animateSource ["relique_source",0];
sleep 0.3;

_c = false;
_a1 = nearestObjects[position player,["Land_ALF_Anubis_01","Land_ALF_Anubis_02","Land_ALF_Anubis_03"],50];
if(count _a1 > 0) then {
	{
		if((_x animationSourcePhase "relique_source") > 0.9) then {
			_c = true;
		};
	} forEach _a1;
} else {
	_c = true;
};
if(_c) exitWith {};

{
	_x animateSource ["axe_1_source",1];
	sleep 1.5;
	playSound3D ["ALF_Client2\sounds\boum.ogg",_x];
} forEach _a1;

_a2 = nearestObjects[position player,["Land_ALF_Sphinx"],300];
if(count _a2 > 0) then {
	{
		_x animateSource ["relique_source",1];
		playSound3D ["ALF_Client2\sounds\boum.ogg",_x];
	} forEach _a2;
};

private _cupi = "groundweaponholder" createVehicle [0,0,0];
_cupi setPosATL [8495.4,13957.6,0.9];
_cupi addMagazineCargoGlobal ["ALF_Cupidon",1];