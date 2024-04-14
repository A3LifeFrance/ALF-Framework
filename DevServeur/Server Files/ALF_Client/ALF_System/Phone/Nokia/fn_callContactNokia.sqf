#include "\ALF_Client\script_macros.hpp"
/*
File: fn_CallContactNokia.sqf
Author: ALF Team
Description:
Script pour appel d'un joueur
*/
if((lbCurSel 20011) isEqualTo -1) exitWith {hint "Il faut selectionner quelqu'un."};
private _cible = lbData[20011,lbCurSel (20011)];
_cible = call compile format["%1", _cible];

if(ALF_Forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

player playActionNow "ALF_Tel";
//ALF_PhoneObject = "ALF_3310_Object" createVehicle [0,0,1000];
if !(isNull ALF_PhoneObject) then {
	//[ALF_PhoneObject,false] remoteExecCall ["enableSimulationGlobal",2];
	[] spawn {
		uiSleep 0.3;
		if (vehicle player isEqualTo player) then {
			ALF_PhoneObject attachTo [player, [0.02,0.01,0.15], "RightHandMiddle1"];
			ALF_PhoneObject setVectorDirAndUp [[-0.21017,0.265195,-0.94101],[-0.949623,0.173499,0.260989]];
		} else {
			ALF_PhoneObject attachTo [(vehicle player),((vehicle player) worldToModel (player modelToWorldVisual ((player selectionPosition "RightHandMiddle1") vectorAdd [0.02,0.01,0.15])))];
			ALF_PhoneObject setVectorDirAndUp [[-0.21017,0.265195,-0.94101],[-0.949623,0.173499,0.260989]];
		};
	};
};

ALF_Phone_tryCall = true;
life_radio_connected = false;
ALF_Phone_CallNumber = _cible select 1;

[ALF_Phone_Anonyme,ALF_Phone_Number,_cible select 1,player] remoteExec ["HC_fnc_callSystem",HC3_Life];

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,false,0,_cible select 1];
ALF_Phone_Historique pushBack _data;

player setVariable ["tf_unable_to_use_radio", true];

if !(isNull (findDisplay 20000)) then {
	uiNamespace setVariable ['nokiamenu',0];
	[] call ALF_fnc_menuNokia;
};

private _myRadio = call TFAR_fnc_activeSwRadio;

for "_i" from 0 to 5 step 1 do {
	if !(ALF_Phone_tryCall) exitWith {};
	if !(life_is_alive) exitWith {};

	private _radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {};
	if ((([_myRadio,"alf_iphone_1"] call TFAR_fnc_isSameRadio) || {([_myRadio,"alf_3310_1"] call TFAR_fnc_isSameRadio)}) && {!(currentWeapon player isEqualTo "")}) exitWith {};

	playSound "phone_call";
	sleep 5;
};
if(ALF_Phone_tryCall) then {[] call ALF_fnc_resetcall;};
