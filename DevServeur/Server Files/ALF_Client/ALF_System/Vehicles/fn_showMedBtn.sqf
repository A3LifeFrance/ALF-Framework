#include "\ALF_Client\script_macros.hpp"
/*
File: fn_showMedBtn.sqf
Author: ALF Team
*/
private["_veh"];
_veh = _this select 0;
life_vInact_curTarget = _veh;
disableSerialization;
private _display = findDisplay 30200;
private _Btn1 = _display displayCtrl 30401;
private _Btn2 = _display displayCtrl 30402;
private _Btn3 = _display displayCtrl 30403;
private _Btn4 = _display displayCtrl 30404;
private _Btn5 = _display displayCtrl 30405;
private _Btn6 = _display displayCtrl 30406;
private _Btn7 = _display displayCtrl 30407;

_Btn1 ctrlSetText "Bump";
if(alive _veh && {count crew _veh isEqualTo 0} && {canMove _veh}) then {
	_Btn1 buttonSetAction "life_vInact_curTarget setPosATL [getPosATL life_vInact_curTarget select 0, getPosATL life_vInact_curTarget select 1, (getPosATL life_vInact_curTarget select 2)+0.2]; closeDialog 0;";
} else {
	_Btn1 ctrlEnable false;
};

_Btn2 ctrlSetText "Ejecter du vehicule";
_Btn2 ctrlEnable true;
_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";

private _locked = locked _veh;

if(b_4 && !life_pompier_service) then {
	_Btn3 ctrlShow true;
	if(_locked isEqualTo 2) then {
		_Btn3 ctrlSetText "[DEP] Ouvrir véhicule";
		_Btn3 buttonSetAction "[life_vInact_curTarget,0] remoteExecCall [""life_fnc_lockVehicle"",life_vInact_curTarget]; closeDialog 0;";
	} else {
		_Btn3 ctrlSetText "[DEP] Fermer véhicule";
		_Btn3 buttonSetAction "[life_vInact_curTarget,2] remoteExecCall [""life_fnc_lockVehicle"",life_vInact_curTarget]; closeDialog 0;";
	};
} else {
	_Btn3 ctrlShow false;
};

_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
