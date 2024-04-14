#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_spikeStrip.sqf
	Author: ALF Nanou
*/
private["_spikeStrip"];
_item = _this select 0;
[_item,false] spawn life_fnc_handleItem;

uiSleep 1;

_spikeStrip = "ALF_Herse" createVehicle [0,0,0];
_spikeStrip setDir 90;
_spikeStrip attachTo[player,[0,4,0.2]];
_spikestrip setVectorDirAndUp [[1,0,0],[0,0,1]];
[_spikeStrip,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];

alf_object = _spikeStrip;

life_action_spikeStripDeploy = player addAction["Placer la herse",{if(!isNull alf_object) then {detach alf_object; alf_object = objNull;}; player removeAction life_action_spikeStripDeploy; life_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull alf_object'];
waitUntil {sleep 0.3; isNull alf_object};

if(!isNil "life_action_spikeStripDeploy") then {player removeAction life_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {alf_object = objNull;};

_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];

[_spikeStrip] remoteExec ["HC_fnc_spikeStrip",HC2_Life]; //Send it to the HeadlessClient for monitoring.