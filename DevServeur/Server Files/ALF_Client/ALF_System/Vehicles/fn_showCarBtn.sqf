#include "\ALF_Client\script_macros.hpp"
/*
File: fn_showCarBtn.sqf
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

_R1 ctrlSetText "Rep. moteur";
if("ALF_Boiteaoutils" in (magazines player)) then {
	_R1 buttonSetAction "[1,life_vInact_curTarget] spawn ALF_fnc_repairCar; closeDialog 0;";
} else {
	_R1 ctrlEnable false;
};

_R2 ctrlSetText "Rep. technique";
if("ALF_KitMecatechnic" in (magazines player)) then {
	_R2 buttonSetAction "[2,life_vInact_curTarget] spawn ALF_fnc_repairCar; closeDialog 0;";
} else {
	_R2 ctrlEnable false;
};

_R3 ctrlSetText "Changer roues";
if("ALF_Roue" in (magazines player)) then {
	_R3 buttonSetAction "[0,life_vInact_curTarget] spawn ALF_fnc_repairCar; closeDialog 0;";
} else {
	_R3 ctrlEnable false;
};

_R4 ctrlShow false;

if (life_gendarme_service || {b_4}) then {
	_R4 ctrlShow true;
	_R4 ctrlSetText "Immobiliser vehicule";
	if ((speed life_vInact_curTarget) isEqualTo 0 && {!(life_vInact_curTarget in (missionNamespace getVariable ["VehiculeImmobiliser",[]]))} && {(count (crew life_vInact_curTarget)) isEqualTo 0} && {life_gendarme_service}) then {
		_R4 buttonSetAction "[0,life_vInact_curTarget] call ALF_fnc_immobiliserVehicle; closeDialog 0;";
	} else {
		if ((speed life_vInact_curTarget) isEqualTo 0 && {(life_vInact_curTarget in (missionNamespace getVariable ["VehiculeImmobiliser",[]]))} && {(count (crew life_vInact_curTarget)) isEqualTo 0}) then {
			_R4 ctrlSetText "Lever immobilisation";
			_R4 buttonSetAction "[1,life_vInact_curTarget] call ALF_fnc_immobiliserVehicle; closeDialog 0;";
		} else {
			_R4 ctrlEnable false;
		};
	};
};

if (b_24) then {
	_R4 ctrlShow true;
	_R4 ctrlSetText "Stocker une valise";
	if ((speed life_vInact_curTarget) isEqualTo 0 && {!(isNull (player getVariable ["wallet_obj", objNull]))}) then {
		_R4 buttonSetAction "[life_vInact_curTarget,0] call ALF_fnc_bag_stock; closeDialog 0;";
	} else {
		_R4 ctrlEnable false;
	};
	
	_R5 ctrlShow true;
	_R5 ctrlSetText "Prendre une valise";
	if ((speed life_vInact_curTarget) isEqualTo 0 && {isNull (player getVariable ["wallet_obj", objNull])}) then {
		_R5 buttonSetAction "[life_vInact_curTarget,0] call ALF_fnc_bag_unstock; closeDialog 0;";
	} else {
		_R5 ctrlEnable false;
	};
} else {
	_R5 ctrlShow false;
};

if ("ALF_Tracker_i" in (magazines player)) then {
	_R6 ctrlSetText "Poser un tracker";
	_R6 buttonSetAction "[""ALF_Tracker_i"",life_vInact_curTarget] spawn ALF_fnc_poserTracker; closeDialog 0;";
} else {
	_R6 ctrlShow false;
};