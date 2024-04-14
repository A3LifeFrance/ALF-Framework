#include "\ALF_Client\script_macros.hpp"
/*
	File : fn_deadOnBreak.sqf
	Author: ALF Team
*/
private _bpm = selectRandom[35,43,57,68,72,111,123,138,149,155,167,172];
private _mmHg = selectRandom[64,71,83,94,105,116,127,135,144,151,162,173];
private _resp = selectRandom[11,15,18,22,29,37,45,48,52,55,60];
private _spo2 = selectRandom[61,67,72,79,81,85,89,91,93,95,97,99];
private _pain = selectRandom[0,10,20,30,40,50,60,70,80,90];

alf_ms_bpm = _bpm;
alf_ms_mmHg = _mmHg;
alf_ms_resp = _resp;
alf_ms_spo2 = _spo2;
alf_ms_pain = _pain;

alf_ms_active = true;

for "_i" from 0 to 1 step 0 do {
	if !(alive player) exitWith {};
	if !(alf_ms_active) exitWith {};
	player setVariable ["MedicalStats",[alf_ms_bpm,alf_ms_mmHg,alf_ms_resp,alf_ms_spo2],true];
	if(alf_ms_bpm isEqualTo 0 || {alf_ms_bpm isEqualTo 200}) exitWith {alf_ms_isdead = true; player setDamage 1;};
	if(alf_ms_mmHg < 20 || {alf_ms_mmHg > 180}) exitWith {alf_ms_isdead = true; player setDamage 1;};
	if(alf_ms_spo2 < 50) exitWith {alf_ms_isdead = true; player setDamage 1;};
	if(alf_ms_resp < 7) exitWith {alf_ms_isdead = true; player setDamage 1;};
	if(alf_ms_pain isEqualTo 100) exitWith {alf_ms_isdead = true; player setDamage 1;};
	if(alf_ms_bpm > 60 && {alf_ms_bpm < 110} && {alf_ms_resp > 10} && {alf_ms_resp <= 30} && {alf_ms_spo2 >= 94} && {alf_ms_mmHg > 90} && {alf_ms_mmHg < 140} && {!alf_ms_bleeding}) exitWith {[] spawn ALF_fnc_jesusImAlive;};
	sleep 5;
};
