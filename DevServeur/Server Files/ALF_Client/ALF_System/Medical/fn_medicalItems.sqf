#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_medicalItems.sqf
	Author: ALF Team
*/
private _item = _this select 0;
private _dose = _this select 1;

if(_item isEqualTo "ALF_Bandage" && {alf_ms_bleeding}) exitWith {
	alf_ms_bleeding = false;
};

if(_item find "ALF_PocheDeSang_" > -1) exitWith {
	for "_i" from 1 to 15 step 1 do {
		alf_ms_mmHg = alf_ms_mmHg + 2;
		if(alf_ms_mmHg < 0) then {
			alf_ms_mmHg = 0;
		};
		if(alf_ms_mmHg > 200) then {
			alf_ms_mmHg = 200;
		};
		sleep 30;
	};
};

if(_item isEqualTo "ALF_Saline") exitWith {
	for "_i" from 0 to 4 step 1 do {
		alf_ms_mmHg = alf_ms_mmHg + 5;
		if(alf_ms_mmHg < 0) then {
			alf_ms_mmHg = 0;
		};
		if(alf_ms_mmHg > 200) then {
			alf_ms_mmHg = 200;
		};
		sleep 30;
	};
	for "_i" from 0 to 4 step 1 do {
		alf_ms_mmHg = alf_ms_mmHg - 5;
		if(alf_ms_mmHg < 0) then {
			alf_ms_mmHg = 0;
		};
		if(alf_ms_mmHg > 200) then {
			alf_ms_mmHg = 200;
		};
		sleep 30;
	};
};

if(_item isEqualTo "ALF_Adrenaline") exitWith {
	private _bpm = _dose * 20;
	for "_i" from 0 to 6 step 1 do {
		alf_ms_bpm = alf_ms_bpm + ceil(_bpm / 6);
		if(alf_ms_bpm < 0) then {
			alf_ms_bpm = 0;
		};
		if(alf_ms_bpm > 200) then {
			alf_ms_bpm = 200;
		};
		sleep 30;
	};
};

if(_item isEqualTo "ALF_Atropine") exitWith {
	private _bpm = _dose * 15;
	for "_i" from 0 to 6 step 1 do {
		alf_ms_bpm = alf_ms_bpm + ceil(_bpm / 6);
		if(alf_ms_bpm < 0) then {
			alf_ms_bpm = 0;
		};
		if(alf_ms_bpm > 200) then {
			alf_ms_bpm = 200;
		};
		sleep 30;
	};
};

if(_item isEqualTo "ALF_Morphine") exitWith {
	private _bpm = _dose * 20;
	private _spo2 = _dose * 5;
	private _pain = _dose * 30;
	for "_i" from 0 to 6 step 1 do {
		alf_ms_bpm = alf_ms_bpm - ceil(_bpm / 6);
		alf_ms_spo2 = alf_ms_spo2 - ceil(_spo2 / 6);
		alf_ms_pain = alf_ms_pain - ceil(_pain / 6);
		if(alf_ms_bpm < 0) then {
			alf_ms_bpm = 0;
		};
		if(alf_ms_bpm > 200) then {
			alf_ms_bpm = 200;
		};
		if(alf_ms_spo2 < 0) then {
			alf_ms_spo2 = 0;
		};
		if(alf_ms_spo2 > 100) then {
			alf_ms_spo2 = 100;
		};
		if(alf_ms_pain < 0) then {
			alf_ms_pain = 0;
		};
		if(alf_ms_pain > 100) then {
			alf_ms_pain = 100;
		};
		sleep 30;
	};
};

if(_item isEqualTo "ALF_M_Oxy9L") exitWith {
	if(!alf_ms_bouteille) then {
		alf_ms_bouteille = true;
		player setVariable ["bouteilleo2",alf_ms_bouteille,HC3_life];
		[player] remoteExec ["HC_fnc_medicalo2",HC3_Life];
		for "_i" from 0 to 18 step 1 do {
			if !(alf_ms_active) exitWith {};
			alf_ms_spo2 = 97;
			sleep 30;
		};
		alf_ms_bouteille = false;
		player setVariable ["bouteilleo2",alf_ms_bouteille,HC3_life];
	};
};
