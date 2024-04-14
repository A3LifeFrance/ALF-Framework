#include "\ALF_Client\script_macros.hpp"
/*
File: fn_poserBBQ.sqf
Author: ALF Team
*/
private["_obj","_item","_panneau"];
_item = _this select 0;
if([player] call ALF_fnc_checkMenotter OR {[player] call ALF_fnc_checkSurrender}) exitWith {};
if(vehicle player != player OR !isNull life_spikestrip) exitWith {};
[_item,false] spawn life_fnc_handleItem;

_obj = "Land_ALF_bbq";
_panneau = _obj createVehicle [0,0,0];
_panneau allowdamage false;
_panneau attachTo[player,[0,0.7,1.2]];
[_panneau] call life_fnc_clearVehicleAmmo;
[_panneau,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];

life_spikestrip = _panneau;

life_action_spikeStripDeploy = player addAction["Poser le BBQ",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = objNull;}; player removeAction life_action_spikeStripDeploy; life_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull life_spikestrip'];
waitUntil {sleep 0.3; isNull life_spikeStrip};
if(!isNil "life_action_spikeStripDeploy") then {player removeAction life_action_spikeStripDeploy;};
if(isNull _panneau) exitWith {life_spikestrip = objNull;};

_panneau setPosATL [(getPosATL _panneau select 0),(getPosATL _panneau select 1),0];
