#include "\ALF_Client\script_macros.hpp"

//TFAR
#include "\z\tfar\addons\handhelds\script_component.hpp"

/*
	File: fn_SonyCallContact.sqf
	Author: ALF Team
*/
private _cible = lbData[33113,lbCurSel (33113)];
_cible = call compile format["%1", _cible];

if ((_cible select 1) isEqualTo ALF_Phone_Number) exitWith {hint "Tu ne peux pas t'appeler toi même.";};
if(ALF_Forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

ALF_Phone_tryCall = true;

if !(isNull ALF_PhoneObject) then {
	detach ALF_PhoneObject;
	deleteVehicle ALF_PhoneObject;
	ALF_PhoneObject = objNull;
	player playActionNow "gestureNod";
	[{player playActionNow "gestureNod";}] call CBA_fnc_execNextFrame;
};

//On met en standby les radios.
if (life_radio_connected) then {
	[(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setAdditionalSwChannel;
	[(call TFAR_fnc_activeSwRadio),1,getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	[(call TFAR_fnc_activeSwRadio),2,getPlayerUID player] call TFAR_fnc_SetChannelFrequency;

	private _settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
	_settings set [TFAR_ADDITIONAL_CHANNEL_OFFSET, 1];
	[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
};

ALF_Phone_CallNumber = _cible select 1;

[ALF_Phone_Anonyme,ALF_Phone_Number,_cible select 1,player] remoteExec ["HC_fnc_callSystem",HC3_Life];

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,false,0,_cible select 1];
ALF_Phone_Historique pushBack _data;

player setVariable ["tf_unable_to_use_radio", true];

if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
};

private _myRadio = call TFAR_fnc_activeSwRadio;

for "_i" from 0 to 5 step 1 do {
	if !(ALF_Phone_tryCall) exitWith {};
	if !(life_is_alive) exitWith {};

	private _radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {};

	playSound "phone_call";
	sleep 5;
};
if(ALF_Phone_tryCall) then {[] call ALF_fnc_resetcall;};
