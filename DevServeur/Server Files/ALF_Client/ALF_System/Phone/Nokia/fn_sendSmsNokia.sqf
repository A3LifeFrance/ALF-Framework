#include "\ALF_Client\script_macros.hpp"
/*
File: fn_sendSmsNokia.sqf
Author: ALF Team
Description:
Envois d'un sms depuis le Nokia.
*/
private["_number","_display"];
_number = _this select 0;
disableSerialization;
_datamsg = ctrlText 20019;
if(_datamsg isEqualTo "") exitWith {hint "Ton message est vide.";};
_length = count (toArray(_datamsg));
_chrByte = toArray (_datamsg);
_allowed = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]éàç€!?;:êè)(=+&<>*$ ");
if(_length > 150) exitWith {hint "Tu ne peux écrire que 150 caractères."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if(ALF_Forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

if !(ALF_Phone_Mute) then {
	[player,"message_sent"] remoteExecCall ["life_fnc_say3D",0];
} else {
	playSound "message_sent";
};

[0,ALF_Phone_Number,_number,_datamsg] remoteExecCall ["HC_fnc_sendSmsPhone",HC3_Life];
