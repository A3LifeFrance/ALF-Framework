#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneSmsContactSend.sqf
Author: ALF Team
Description:
Envois d'un sms depuis l'iPhone'.
*/
private["_number","_datamsg"];
_number = _this select 0;
disableSerialization;
_datamsg = ctrlText 564094;
if(_datamsg isEqualTo "") exitWith {hint "Tu ne peux pas envoyer de message vide."};
private _length = count (toArray(_datamsg));
private _chrByte = toArray (_datamsg);
private _allowed = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]éàç€!?;:êè)(=+&<>*$ ");
if(_length > 500) exitWith {hint "Tu ne peux écrire que 500 caractères max."};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

if(ALF_Forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

private _anonyme = 0;
if (ALF_Phone_Anonyme) then {_anonyme = 1;} else {_anonyme = 0;};

if !(ALF_Phone_Mute) then {
	[player,"message_sent"] remoteExecCall ["life_fnc_say3D",0];
} else {
	playSound "message_sent";
};

[_anonyme,ALF_Phone_Number,_number,_datamsg] remoteExecCall ["HC_fnc_sendSmsPhone",HC3_Life];

uiNamespace setVariable ['iphonemenu',0];
[] call ALF_fnc_menuiPhone;
