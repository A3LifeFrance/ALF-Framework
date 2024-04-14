#include "\ALF_Client\script_macros.hpp"

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

alf_death_effect ppEffectEnable false;
ppEffectDestroy alf_death_effect;

player setUnconscious true;

life_radio_connected = false;
ALF_Sony_Freq = 0;
player setVariable ["SonyFreq",0,HC3_Life];
ALF_Sony_FreqAdd = 0;
player setVariable ["SonyFreqAdd",0,HC3_Life];

player setVariable ["Reviving",nil,true];
player setVariable ["tf_voiceVolume", 1, true];
player setVariable ["ReviveMedic",false,true];

if (ALF_Bracelet) then {
	_array = missionNamespace getVariable ["ALF_AllBracelets",[]];
	if !(player in _array) then {
		_array pushBack player;
		missionNamespace setVariable ["ALF_AllBracelets",_array,true];
	};
};

if (ALF_Prison) then {
	player setVariable ["ALF_EnPrison",true,true];
};

if(life_coplevel > 0) then {
	player setVariable ["SonyFreq",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllGendarmes",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["SonyFreqAdd",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllGendarmes",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["CopService",life_gendarme_service,[HC_Life,HC3_Life]];
	[0] remoteExecCall ["HC_fnc_priseService",HC3_Life];
};

if(life_mediclevel > 0) then {
	player setVariable ["SonyFreq",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["SonyFreqAdd",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["MedService",life_pompier_service,[HC_Life,HC3_Life]];
	[1] remoteExecCall ["HC_fnc_priseService",HC3_Life];
};

if(life_penit > 0) then {
	player setVariable ["PenitService",life_penit_service,HC_Life];
};

alf_ms_active = false;
alf_ms_isdead = false;

life_is_alive = true;

alf_ms_bpm = 80;
alf_ms_mmHg = 120;
alf_ms_resp = 15;
alf_ms_spo2 = 97;
alf_ms_pain = 0;
alf_ms_bleeding = false;
alf_ms_bouteille = false;
player setVariable ["bouteilleo2",alf_ms_bouteille,HC3_life];

player setVariable ["MedicalStats",[],true];

player setUnconscious false;

[player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",0];
[] call SOCK_fnc_updateRequest;

player allowDammage false;
[] spawn ALF_fnc_deadOnBreak;
sleep 5;
player allowDammage true;