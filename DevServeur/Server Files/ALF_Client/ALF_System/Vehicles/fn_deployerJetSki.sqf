#include "\ALF_Client\script_macros.hpp"
/*
File: fn_deployerJetSKi.sqf
Author: ALF Team
*/
private["_veh","_mode","_jet"];
_veh = _this select 0;
_mode = _this select 1;

switch (_mode) do {
	case 0 : {_jet = "V_ALF_JetSki_Gendarmerie" createvehicle [0,0,0];};
	case 1 : {_jet = "V_ALF_JetSki_Pompier" createvehicle [0,0,0];};
	default {_jet = "V_ALF_JetSki_Gendarmerie" createvehicle [0,0,0];};
};

_veh animate ["JetSki_M002",1];
_jet setPosASL (_veh modelToWorldWorld [0,-8,0]);
_jet lock 0;
