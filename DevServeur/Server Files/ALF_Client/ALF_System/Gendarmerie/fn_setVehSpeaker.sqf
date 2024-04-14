#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setRadarM.sqf
Author: ALF Team
*/
private _var = (vehicle player) getVariable ["Megaphone",0];
if(_var > 0) exitWith {["INFO","Le mégaphone est déjà activé.","warning"] spawn ALF_fnc_doMsg;};

private _freq = random[10000,50000,99999];
//Channel
[call TFAR_fnc_activeLrRadio, 3] call TFAR_fnc_setLrChannel;
//Freq
[call TFAR_fnc_activeLrRadio, str(_freq)] call TFAR_fnc_setLrFrequency;
//Speaker ON
(call TFAR_fnc_activeLrRadio) call TFAR_fnc_setLrSpeakers;
//volume
[call TFAR_fnc_activeLrRadio, 10] call TFAR_fnc_setLrVolume;
//Radio Code
[call TFAR_fnc_activeLrRadio, "_bluefor"] call TFAR_fnc_setLrRadioCode;

(vehicle player) setVariable ["Megaphone",_freq,true];
["INFO","Le Mégaphone est activé.","success"] spawn ALF_fnc_doMsg;
