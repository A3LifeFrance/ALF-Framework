#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneNewSmsSend.sqf
Author: ALF Team
Description:
Envois d'un sms depuis l'iPhone'.
*/
private["_number","_msg"];
disableSerialization;

_number = ctrlText 564092;
_msg = ctrlText 564094;
private _badChar = false;
if(_number isEqualTo "") exitWith {hint "Il manque le numero.";};
if(_msg isEqualTo "") exitWith {hint "Ton message est vide.";};
private _length = count (toArray(_number));
private _chrByte = toArray (_number);
private _allowed = toArray("0123456789");
if !(_length isEqualTo 10) exitWith {hint "Tu ne peux ecrire que 10 numeros."};
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
private _length2 = count (toArray(_msg));
private _chrByte2 = toArray (_msg);
private _allowed2 = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]éàç€!?;:êè)(=+&<>*$ ");
if(_length2 > 500) exitWith {hint "Tu ne peux ecrire que 500 caractères max."};
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte2;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

if(ALF_Forfait isEqualTo 0) exitWith {hint "Ton forfait est epuise.";};

private _anonyme = 0;
if (ALF_Phone_Anonyme) then {_anonyme = 1;} else {_anonyme = 0;};

if !(ALF_Phone_Mute) then {
	[player,"message_sent"] remoteExecCall ["life_fnc_say3D",0];
} else {
	playSound "message_sent";
};

[_anonyme,ALF_Phone_Number,_number,_msg] remoteExecCall ["HC_fnc_sendSmsPhone",HC3_Life];
uiNamespace setVariable ['iphonemenu',0];
[] call ALF_fnc_menuiPhone;

