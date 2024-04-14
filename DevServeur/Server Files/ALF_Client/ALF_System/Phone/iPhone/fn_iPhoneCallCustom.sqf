#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneCallCustom.sqf
Author: ALF Team
Description:

*/
private _numbercalling = ctrlText 564052;

if(_numbercalling isEqualTo "") exitWith {hint "Le numéro est vide.";};
private _length = count (toArray(_numbercalling));
private _chrByte = toArray (_numbercalling);
private _allowed = toArray("0123456789");
if(_length > 10) exitWith {hint "Tu ne peux écrire que 10 caractères max."};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if !(currentWeapon player isEqualTo "") exitWith {["Telephone", "Tu as les mains encombrés.", "danger", false] spawn ALF_fnc_doMsg;};

if(_numbercalling isEqualTo ALF_Phone_Number) exitWith {hint "Tu ne peux t'appeler toi même.";};

if(_length < 10 && {!(_numbercalling in ["17","18","124"])}) exitWith {hint "Tu ne peux écrire que 10 caractères min."};
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

ALF_Phone_CallNumber = _numbercalling;

[ALF_Phone_Anonyme,ALF_Phone_Number,_numbercalling,player] remoteExec ["HC_fnc_callSystem",HC3_Life];

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,false,0,_numbercalling];
ALF_Phone_Historique pushBack _data;

player setVariable ["tf_unable_to_use_radio", true];

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',0];
	[] call ALF_fnc_menuiPhone;
};

private _myRadio = call TFAR_fnc_activeSwRadio;

private _boucle = 5;
if(_numbercalling in ["17","18","124"]) then {
	_boucle = 60;
};

for "_i" from 0 to _boucle step 1 do {
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
