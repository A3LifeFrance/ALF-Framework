#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_callForceEnd.sqf
	Author: ALF Team
*/
private _myRadio = _this select 0;
private _myFrequence = _this select 1;
private _myRadioCode = _this select 2;
private _myRadioSetting = _this select 3;

ALF_Phone_inCall = false;
ALF_Phone_tryCall = false;
ALF_Phone_Ring = false;

player setVariable ["callFrequence",0];

iPhone_Mute = false;
iPhone_Speackers = false;

ALF_Central = false;

ALF_Phone_CallNumber = "";

player setVariable ["tf_unable_to_use_radio",true];

player setVariable ["call_info",0,HC3_Life];

[format[localize "STR_transmit_end",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _myRadio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _myRadio >> "picture")], 1,_myFrequence],
format["TANGENT	RELEASED	%1%2	%3	%4",_myFrequence,_myRadioCode, getNumber(configFile >> "CfgWeapons" >> _myRadio >> "tf_range") * _myRadioSetting, getText(configFile >> "CfgWeapons" >> _myRadio >> "tf_subtype")]
] call TFAR_fnc_ProcessTangent;

[_myRadio, 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
[_myRadio, 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;

if !(isNull ALF_PhoneObject) then {
	detach ALF_PhoneObject;
	deleteVehicle ALF_PhoneObject;
	ALF_PhoneObject = objNull;
	player playActionNow "gestureNod";
	[{player playActionNow "gestureNod";}] call CBA_fnc_execNextFrame;
};
