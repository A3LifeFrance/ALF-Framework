#include "\ALF_Client\script_macros.hpp"
/*
File: fn_fireIsDone.sqf
*/
private _cl = _this select 0;
if(isNil "_cl" OR {isNull _cl}) exitWith {};

["BRAVO","VOUS AVEZ ETEINT L'INCENDIE FELICITATION !!"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];

private _p = 0;
switch (typeOf _cl) do { 
	case "Land_ALF_Caravane" : {_p = 10000;};
	case "Land_i_House_Big_01_V1_F" : {_p = 50000;};
	case "Land_i_House_Big_01_V2_F" : {_p = 50000;};
	case "Land_i_House_Big_01_V3_F" : {_p = 50000;};
	case "Land_ALF_station" : {_p = 75000;};
	default {
		_p = 25000;
	};
};

[_p] remoteExecCall ["HC_fnc_updateCNP",HC_life];