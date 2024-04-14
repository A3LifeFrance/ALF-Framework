#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setAirRadio.sqf
Author: ALF Team
*/
if !((vehicle player) call TFAR_fnc_hasVehicleRadio) exitWith {["INFO","Ce véhicule n'a pas de radio aerienne.","warning"] spawn ALF_fnc_doMsg;};
if(((vehicle player) getVariable ["helicofreq",0]) isEqualTo 0) exitWith {["INFO","Ce véhicule n'a pas de radio aerienne.","warning"] spawn ALF_fnc_doMsg;};
private _volume = (call TFAR_fnc_ActiveLrRadio) call TFAR_fnc_getLrVolume;
if !(_volume isEqualTo 8) then {
	//Channel
	[call TFAR_fnc_activeLrRadio, 4] call TFAR_fnc_setLrChannel;
	//Freq
	[call TFAR_fnc_activeLrRadio, (vehicle player) getVariable ["helicofreq",0]] call TFAR_fnc_setLrFrequency;
	//volume
	[call TFAR_fnc_activeLrRadio, 8] call TFAR_fnc_setLrVolume;
	//Radio Code
	[call TFAR_fnc_activeLrRadio, "_bluefor"] call TFAR_fnc_setLrRadioCode;
	//Stereo
	[call TFAR_fnc_activeLrRadio, 1] call TFAR_fnc_setLrStereo;
	["INFO","La radio aerienne est activé.","success"] spawn ALF_fnc_doMsg;
} else {
	//volume
	[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 0] call TFAR_fnc_setLrVolume;
	["INFO","La radio aerienne est désactivé.","warning"] spawn ALF_fnc_doMsg;
};
