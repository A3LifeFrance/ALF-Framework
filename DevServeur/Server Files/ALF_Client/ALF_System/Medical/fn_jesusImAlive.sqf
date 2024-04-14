/*
Author: ALF Team
*/
alf_ms_active = false;
alf_ms_isdead = false;

life_is_alive = true;
[3] call SOCK_fnc_updatePartial; //Alive + POS

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
