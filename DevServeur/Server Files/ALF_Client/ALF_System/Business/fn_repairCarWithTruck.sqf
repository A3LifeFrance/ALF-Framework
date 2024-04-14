#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Nanou
*/
private _truck = _this select 0;
if(_truck getVariable ["inUse",false]) exitWith {};

private _car = _truck getVariable ["attach",objNull];
if(isNull _car) exitWith {};

_truck setVariable ["inUse",true,true];
[_truck,"truck_wip"] remoteExec ["life_fnc_say3D",playableUnits];

sleep 15;
if(_truck distance _car > 20) exitWith {};

{
	if ((_car getHitPointDamage _x) > 0) then {
		[_car,_x,0] remoteExecCall ["ALF_fnc_setHPD",_car];
	};
} forEach ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitLMWheel","HitLBWheel","HitRMWheel","HitRBWheel","HitFWheel","HitBWheel"];

if ((_car getHitPointDamage "HitEngine") > 0.25) then {
	[_car,"HitEngine",0.25] remoteExecCall ["ALF_fnc_setHPD",_car];
};
	
_truck setVariable ["inUse",false,true];
