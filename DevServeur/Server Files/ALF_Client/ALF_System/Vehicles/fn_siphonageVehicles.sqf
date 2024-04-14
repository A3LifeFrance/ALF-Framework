#include "\ALF_Client\script_macros.hpp"
/*
	File: siphonageVehicles.sqf
	Author: Nanou
*/
private ["_item","_vehicle"];
_item = _this select 0;
_vehicle = cursorObject;
if(isNull _vehicle) exitWith {};
if !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship") exitWith {};
if(player distance _vehicle > 8) exitWith {};
if(fuel _vehicle isEqualTo 0) exitWith {["Siphonnage", "Ce véhicule n'a pas d'essence.", "danger"] spawn ALF_fnc_doMsg;};

life_action_inUse = true;

[_item,false] spawn life_fnc_handleItem;

private _jerry = "Land_CanisterFuel_F" createvehicle [0,0,0];
_jerry attachto [player, [0.02,0,-0.27], "RightHandMiddle1"];
_jerry setDir 270;

private _displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

private _upp = format["Siphonnage: %1",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNameSpace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {detach _jerry;	deletevehicle _jerry;};
	if(life_interrupted) exitWith {detach _jerry; deletevehicle _jerry;};
	if(life_istazed) exitWith {detach _jerry; deletevehicle _jerry;};
};
life_action_inUse = false;
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; [_item,true] spawn life_fnc_handleItem; ["Siphonnage", "Action annulée.", "danger"] spawn ALF_fnc_doMsg;};
if(life_istazed) exitWith {};
5 cutText ["","PLAIN"];
player playActionNow "stop";
player switchMove "";


switch (true) do
{
	case (fuel _vehicle <= 0.2 && fuel _vehicle > 0):
	{
		["ALF_Barile_10",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle <= 0.3 && fuel _vehicle > 0.2):
	{
		["ALF_Barile_20",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle <= 0.4 && fuel _vehicle > 0.3):
	{
		["ALF_Barile_30",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle <= 0.5 && fuel _vehicle > 0.4):
	{
		["ALF_Barile_40",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle <= 0.6 && fuel _vehicle > 0.5):
	{
		["ALF_Barile_50",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle <= 0.7 && fuel _vehicle > 0.6):
	{
		["ALF_Barile_60",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle <= 0.8 && fuel _vehicle > 0.7):
	{
		["ALF_Barile_70",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle <= 0.9 && fuel _vehicle > 0.8):
	{
		["ALF_Barile_80",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle <= 1 && fuel _vehicle > 0.9):
	{
		["ALF_Barile_90",true] spawn life_fnc_handleItem;
	};
	
	case (fuel _vehicle == 1):
	{
		["ALF_Barile_100",true] spawn life_fnc_handleItem;
	};
	
};

["Barile", "Tu as rempli ton bidon.", "success"] spawn ALF_fnc_doMsg;
[name player,getPlayerUID player,"VEHICULE",format["A siphonné %1 | Pos : %2 | MapPos : %3 | Fuel : %4", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"), getPos _vehicle, mapGridPosition _vehicle, fuel _vehicle]] remoteExec ["HC_fnc_logIt",HC3_Life];

detach _jerry;
deletevehicle _jerry;
	
if(!local _vehicle) then
{
	[_vehicle,0] remoteExec ["life_fnc_setFuel",_vehicle];
}
else
{
	_vehicle setFuel 0;
};

private _dice = random(1000);
private _adn = player getVariable "adnface" select 0;
if(_dice > 200) then {
	["INFO", "Tu as déclenché l'alarme du véhicule !", "warning"] spawn ALF_fnc_doMsg;
	[_vehicle,"ALF_CarAlarm1"] remoteExec ["life_fnc_say3D",RANY];
};
if(_dice > 200 && {_dice <= 900}) then {
	private _data = _vehicle getVariable ["ilyadeladn",[]];
	if(count _data isEqualTo 0) then {
		_vehicle setVariable["ilyadeladn",[_adn],true];
	} else {
		_data pushBack _adn;
		_vehicle setVariable["ilyadeladn",_data,true];
	};
};