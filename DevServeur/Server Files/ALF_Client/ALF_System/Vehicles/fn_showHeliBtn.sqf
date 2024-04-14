#include "\ALF_Client\script_macros.hpp"
/*
File: fn_showHeliBtn.sqf
Author: ALF Team
Description:

*/
private["_veh"];
_veh = _this select 0;
life_vInact_curTarget = _veh;
disableSerialization;
_display = findDisplay 30200;
_R1 = _display displayCtrl 30411;
_R2 = _display displayCtrl 30412;
_R3 = _display displayCtrl 30413;
_R4 = _display displayCtrl 30414;
_R5 = _display displayCtrl 30415;
_R6 = _display displayCtrl 30416;

_R1 ctrlSetText "Rep. Generale";
if("ALF_Boiteaoutils" in (magazines player)) then {
	_R1 buttonSetAction "[life_vInact_curTarget] spawn ALF_fnc_repairHeli; closeDialog 0;";
	_R1 ctrlShow true;
	_R1 ctrlEnable true;
} else {
	_R1 ctrlEnable false;
};

if (life_gendarme_service || {b_4}) then {
	_R2 ctrlShow true;
	_R2 ctrlSetText "Immobiliser vehicule";
	if ((speed life_vInact_curTarget) isEqualTo 0 && {!(life_vInact_curTarget in (missionNamespace getVariable ["VehiculeImmobiliser",[]]))} && {(count (crew life_vInact_curTarget)) isEqualTo 0} && {life_gendarme_service}) then {
		_R2 buttonSetAction "[0,life_vInact_curTarget] call ALF_fnc_immobiliserVehicle; closeDialog 0;";
	} else {
		if ((speed life_vInact_curTarget) isEqualTo 0 && {(life_vInact_curTarget in (missionNamespace getVariable ["VehiculeImmobiliser",[]]))} && {(count (crew life_vInact_curTarget)) isEqualTo 0}) then {
			_R2 ctrlSetText "Lever immobilisation";
			_R2 buttonSetAction "[1,life_vInact_curTarget] call ALF_fnc_immobiliserVehicle; closeDialog 0;";
		} else {
			_R2 ctrlEnable false;
		};
	};
} else {
	_R2 ctrlShow false;
};

_R3 ctrlShow false;
_R4 ctrlShow false;
_R5 ctrlShow false;
_R6 ctrlShow false;
