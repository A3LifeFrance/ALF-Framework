#include "\ALF_Client\script_macros.hpp"

//TFAR
#include "\z\tfar\addons\handhelds\script_component.hpp"

/*
	File: fn_SonyCallCustom.sqf
	Author: ALF Team
*/
private _numbercalling = ctrlText 39009;

if(_numbercalling isEqualTo "") exitWith {hint "Le numero est vide.";};
private _length = count (toArray(_numbercalling));
private _chrByte = toArray (_numbercalling);
private _allowed = toArray("0123456789");
if(_length > 10) exitWith {hint "Tu ne peux ecrire que 10 caractères max."};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

if(_numbercalling isEqualTo ALF_Phone_Number) exitWith {hint "Tu ne peux t'appeler toi même.";};

if(_length < 10 && {!(_numbercalling in ["17","18","124"])}) exitWith {hint "Tu ne peux écrire que 10 caractères min."};
if((ALF_Forfait isEqualTo 0) && {!(_numbercalling in ["17","18"])}) exitWith {hint "Ton forfait est epuise.";};

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

ALF_Phone_CallNumber = _numbercalling;

[ALF_Phone_Anonyme,ALF_Phone_Number,_numbercalling,player] remoteExec ["HC_fnc_callSystem",HC3_Life];

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,false,0,_numbercalling];
ALF_Phone_Historique pushBack _data;

player setVariable ["tf_unable_to_use_radio", true];

if !(isNull (findDisplay 38999)) then {
	uiNamespace setVariable ['sonyp',0];
	[] call ALF_fnc_menuSonyP;
};

private _myRadio = call TFAR_fnc_activeSwRadio;

private _boucle = 5;
if(_numbercalling in ["17","18"]) then {
	_boucle = 60;
};

for "_i" from 0 to _boucle step 1 do {
	if !(ALF_Phone_tryCall) exitWith {};
	if !(life_is_alive) exitWith {};

	private _radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {};

	playSound "phone_call";
	sleep 5;
};
if(ALF_Phone_tryCall) then {[] call ALF_fnc_resetcall;};
