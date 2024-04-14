#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneCallContact.sqf
Author: ALF Team
Description:
Script pour appel d'un joueur
*/
if((lbCurSel 682567) isEqualTo -1) exitWith {hint "Il faut selectionner quelqu'un."};

private _cible = lbData[682567,lbCurSel (682567)];
if(_cible isEqualTo "Aucun historique.") exitWith {};
_cible = call compile format["%1", _cible];

private _anonyme = _cible select 1;
private _number = _cible select 3;
if(_anonyme) exitWith {hint "Tu ne peux rappeler un numéro anonyme.";};
if !(currentWeapon player isEqualTo "") exitWith {["Telephone", "Tu as les mains encombrés.", "danger", false] spawn ALF_fnc_doMsg;};

if((ALF_Forfait isEqualTo 0) && {!(_numbercalling in ["17","18"])}) exitWith {hint "Ton forfait est épuisé.";};

player playActionNow "ALF_Tel";
//ALF_PhoneObject = "ALF_Iphone_Object" createVehicle [0,0,1000];
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

//On met en standby les radios.
if(life_radio_connected) then {
	[(call TFAR_fnc_activeSwRadio),1,getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
};

ALF_Phone_CallNumber = _number;

[ALF_Phone_Anonyme,ALF_Phone_Number,_number,player] remoteExec ["HC_fnc_callSystem",HC3_Life];

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,false,0,_number];
ALF_Phone_Historique pushBack _data;

player setVariable ["tf_unable_to_use_radio", true];

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',0];
	[] call ALF_fnc_menuiPhone;
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
