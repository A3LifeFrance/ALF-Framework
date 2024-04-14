#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_kickSystem.sqf
	Auhtor: ALF Team
*/
private _w = _this select 0;
if(isNil "_w") exitWith {};

private _r = 0;

if(!life_istazed) then {
	if(_w isEqualTo "ALF_Batte") then {
		_r = 5;
	} else {
		_r = selectRandom[0,1,2,3,4,5,6,7,8,9];
	};
	player setDamage (getDammage player + 0.1);
	
	if(_r >= 5 && {alive player} && {!alf_ms_active}) then {
		life_istazed = true;

		player setUnconscious true;
        disableUserInput true;
        sleep 30;
        player setUnconscious false;
        [player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        life_istazed = false;
        player allowDamage true;
        disableUserInput false;
	};
};
