#include "\ALF_Client\script_macros.hpp"
/*
File: fn_receptionSmsPhone.sqf
Author: ALF Team
Description:

*/
private["_anonyme","_nameExpediteur","_numberExpediteur","_msg"];
_anonyme = _this select 0;
_numberExpediteur = _this select 1;
_msg = _this select 2;

_nameExpediteur = "Inconnu";
{
	if ((_x select 1) isEqualTo _numberExpediteur) then {_nameExpediteur = _x select 0;};
} forEach life_contacts;
if (_anonyme isEqualTo 1) then {_nameExpediteur = "Anonyme"; _numberExpediteur = "**********";};

private _radios = player call TFAR_fnc_radiosList;
if(count _radios > 0) then {
	if([(call TFAR_fnc_activeSwRadio),"alf_3310_1"] call TFAR_fnc_isSameRadio) then {
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>SMS<br/><t color='#33CC33'><t align='left'><t size='1'><br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/>(%2)<br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3",_nameExpediteur,_numberExpediteur,_msg];
	};
	if([(call TFAR_fnc_activeSwRadio),"alf_iphone_1"] call TFAR_fnc_isSameRadio) then {
		[format["%1 - %2",_nameExpediteur,_numberExpediteur],_msg] spawn ALF_fnc_doSms;
	};
	if !(ALF_Phone_Mute) then {
		if([(call TFAR_fnc_activeSwRadio),"alf_3310_1"] call TFAR_fnc_isSameRadio) then {
			[player,"nokia_sms"] remoteExec ["life_fnc_say3D",RANY];
		};
		if([(call TFAR_fnc_activeSwRadio),"alf_iphone_1"] call TFAR_fnc_isSameRadio) then {
			[player,"iPhone_sms"] remoteExec ["life_fnc_say3D",RANY];
		};
		if([(call TFAR_fnc_activeSwRadio),"alf_neogend_1"] call TFAR_fnc_isSameRadio) then {
			[player,"Sony_sms"] remoteExec ["life_fnc_say3D",RANY];
		};
		if([(call TFAR_fnc_activeSwRadio),"alf_sony_1"] call TFAR_fnc_isSameRadio) then {
			[player,"Sony_sms"] remoteExec ["life_fnc_say3D",RANY];
		};
	} else {
		playSound "sms_vibreur";
	};
	ALF_Phone_SMS = true;
};
