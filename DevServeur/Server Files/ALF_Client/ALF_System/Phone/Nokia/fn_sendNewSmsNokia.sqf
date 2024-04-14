#include "\ALF_Client\script_macros.hpp"
/*
File: fn_sendNewSmsNokia.sqf
Author: ALF Team
Description:
Repondre a un sms depuis le menu SMS du Nokia.
*/
private["_number","_msg"];
_number = ctrlText 200182;
_msg = ctrlText 20019;
if(_msg isEqualTo "") exitWith {hint "Ton message est vide.";};
if(_number isEqualTo "") exitWith {hint "Le numero est vide.";};
private _length = count (toArray(_msg));
private _length2 = count (toArray(_number));
private _chrByte = toArray (_msg);
private _chrByte2 = toArray (_number);
private _allowed = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]éàç€!?;:êè)(=+&<>*$ ");
private _allowed2 = toArray("0123456789");
if(_length > 150) exitWith {hint "Tu ne peux ecrire que 150 caractères max."};
if !(_length2 isEqualTo 10) exitWith {hint "Numero incorrect."};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte2;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if(ALF_Forfait isEqualTo 0) exitWith {hint "Ton forfait est epuise.";};

if !(ALF_Phone_Mute) then {
	[player,"message_sent"] remoteExecCall ["life_fnc_say3D",0];
} else {
	playSound "message_sent";
};

[0,ALF_Phone_Number,_number,_msg] remoteExecCall ["HC_fnc_sendSmsPhone",HC3_Life];
