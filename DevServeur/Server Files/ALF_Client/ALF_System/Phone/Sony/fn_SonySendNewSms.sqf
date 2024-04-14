#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneSmsContactSend.sqf
Author: ALF Team
Description:
Envois d'un sms depuis l'iPhone'.
*/
private["_number","_datamsg"];
disableSerialization;
_number = ctrlText 33151;
_datamsg = ctrlText 33152;
if(_number isEqualTo "") exitWith {hint "Le numero est vide."};
if(_datamsg isEqualTo "") exitWith {hint "Tu ne peux pas envoyer de message vide."};
private _length = count (toArray(_datamsg));
private _chrByte = toArray (_datamsg);
private _allowed = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]çéà€!?;:êè)(=+&<>*$ ");
if(_length > 500) exitWith {hint "Tu ne peux ecrire que 500 caractères max."};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
private _length2 = count (toArray(_number));
if(_length2 < 10) exitWith {hint "Numero incorrect."};

if(ALF_Forfait isEqualTo 0) exitWith {hint "Ton forfait est epuise.";};

private _anonyme = 0;
if (ALF_Phone_Anonyme) then {_anonyme = 1;} else {_anonyme = 0;};

if !(ALF_Phone_Mute) then {
	[player,"message_sent"] remoteExecCall ["life_fnc_say3D",0];
} else {
	playSound "message_sent";
};

[_anonyme,ALF_Phone_Number,_number,_datamsg] remoteExec ["HC_fnc_sendSmsPhone",HC3_Life];

closeDialog 0;
