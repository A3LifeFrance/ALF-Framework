#include "\ALF_Client\script_macros.hpp"
/*
File: fn_placeRadarM.sqf
Author: ALF Team
*/
private["_item","_radar"];
_item = _this select 0;
if(life_copLevel isEqualTo 0 OR {[player] call ALF_fnc_checkMenotter} OR {[player] call ALF_fnc_checkSurrender}) exitWith {};

[_item,false] spawn life_fnc_handleItem;
_radar = "Land_ALF_radar_m" createVehicle [0,0,0];
_radar attachTo[player,[0,1.5,1.8]];

life_spikestrip = _radar;

life_action_spikeStripDeploy = player addAction["Poser le radar",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = objNull;}; player removeAction life_action_spikeStripDeploy; life_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull life_spikestrip'];
waitUntil {sleep 0.3; isNull life_spikeStrip};
if(!isNil "life_action_spikeStripDeploy") then {player removeAction life_action_spikeStripDeploy;};
if(isNull _radar) exitWith {life_spikestrip = objNull;};

_radar setPos [(getPos _radar select 0),(getPos _radar select 1),0];

_radar setVariable ["RadarM",[0,0,[]],true];
