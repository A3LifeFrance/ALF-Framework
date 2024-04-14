#include "\ALF_Client\script_macros.hpp"
/*
File: fn_showCarBtn.sqf
Author: ALF Team
*/
private["_veh"];
_veh = _this select 0;
life_vInact_curTarget = _veh;
disableSerialization;
_display = findDisplay 30200;
_Btn1 = _display displayCtrl 30401;
_Btn2 = _display displayCtrl 30402;
_Btn3 = _display displayCtrl 30403;
_Btn4 = _display displayCtrl 30404;
_Btn5 = _display displayCtrl 30405;
_Btn6 = _display displayCtrl 30406;
_Btn7 = _display displayCtrl 30407;

_Btn1 ctrlSetText "Bump";
if(alive _veh && {count crew _veh isEqualTo 0} && {canMove _veh}) then {
	_Btn1 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
} else {
	_Btn1 ctrlEnable false;
};

_Btn2 ctrlSetText "Ejecter du vehicule";
private _locked = locked _veh;
if((_veh in life_vehicles OR (currentWeapon player == primaryWeapon player && primaryWeapon player != "")) && speed _veh < 5 && player distance _veh < 8) then {
	_Btn2 ctrlEnable true;
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
} else {
	_Btn2 ctrlEnable false;
};

if("ALF_Lockpick" in (magazines player)) then {
	_Btn3 ctrlShow true;
	_Btn3 ctrlSetText "Crocheter";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_lockpick; closeDialog 0;";
} else {
	_Btn3 ctrlShow false;
};

if(b_4) then {
	_Btn4 ctrlShow true;
	if(_locked isEqualTo 2) then {
		_Btn4 ctrlSetText "[DEP] Ouvrir véhicule";
		_Btn4 buttonSetAction "[life_vInact_curTarget,0] remoteExecCall [""life_fnc_lockVehicle"",life_vInact_curTarget]; closeDialog 0;";
	} else {
		_Btn4 ctrlSetText "[DEP] Fermer véhicule";
		_Btn4 buttonSetAction "[life_vInact_curTarget,2] remoteExecCall [""life_fnc_lockVehicle"",life_vInact_curTarget]; closeDialog 0;";
	};
} else {
	_Btn4 ctrlShow false;
};

_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
