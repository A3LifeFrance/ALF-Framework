#include "\ALF_Client\script_macros.hpp"
/*
File: fn_showCarBtn.sqf
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

_Btn2 ctrlShow true;
_Btn2 ctrlSetText "Ejecter du vehicule";
if(speed _veh < 5 && {player distance _veh < 8}) then {
	_Btn2 ctrlEnable true;
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
} else {
	_Btn2 ctrlEnable false;
	_Btn2 ctrlShow false;
};

if(life_ilyadeladn) then {
	_Btn3 ctrlEnable false;
} else {
	_Btn3 ctrlEnable true;
	_Btn3 ctrlSetText "Inspecter";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn ALF_fnc_inspectVehicle; closeDialog 0;";
};

if(life_ilyadeladn) then {
	_Btn4 ctrlShow true;
	_Btn4 ctrlSetText "Prélever l'ADN";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn ALF_fnc_getADN; closeDialog 0;";
} else {
	_Btn4 ctrlShow false;
};

_Btn5 ctrlShow true;
_Btn5 ctrlSetText "Ranger le vehicule";
_Btn5 buttonSetAction "[life_vInact_curTarget] spawn ALF_fnc_copStoreVehicle; closeDialog 0;";

_Btn6 ctrlShow true;
_Btn6 ctrlSetText "Saisir Cannabis";
_Btn6 buttonSetAction "[life_vInact_curTarget] spawn ALF_fnc_cannabisVehicle; closeDialog 0;";

_Btn7 ctrlShow true;
_Btn7 ctrlSetText "Saisir Cocaine";
_Btn7 buttonSetAction "[life_vInact_curTarget] spawn ALF_fnc_cocaineVehicle; closeDialog 0;";
