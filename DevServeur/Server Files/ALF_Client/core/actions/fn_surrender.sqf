#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_surrender.sqf
	Author:

	Description: Causes player to put their hands on their head.
*/
if ([player] call ALF_fnc_checkMenotter || {vehicle player != player} || {speed player > 1} || {ALF_Phone_tryCall} || {ALF_Phone_inCall}) exitWith {};
if !(currentWeapon player isEqualTo "") then {
	life_curWep_h = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
	player switchCamera cameraView;
};

if !(isNull (findDisplay 20000)) then {
	closeDialog 20000;
};
if !(isNull (findDisplay 56400)) then {
	closeDialog 56400;
};
if !(isNull (findDisplay 32999)) then {
	closeDialog 32999;
};
if !(isNull (findDisplay 38999)) then {
	closeDialog 38999;
};

player playActionNow "ALF_Surrender";
player forceWalk true;

_array = player getVariable ["ALF_MenotterSurrender",[false,false]];
_array set [1,true];
player setVariable ["ALF_MenotterSurrender",_array,true];

uiSleep 1;

waitUntil {
	if (vehicle player != player && {(driver vehicle player) isEqualTo player}) then {
		unassignVehicle player;
		player action ["getOut", vehicle player];
	};
	if !(isForcedWalk player) then {
        player forceWalk true;
    };
	if !(currentWeapon player isEqualTo "") then {
		life_curWep_h = currentWeapon player;
		player action ["SwitchWeapon", player, player, 100];
		player switchCamera cameraView;
		player playActionNow "ALF_Surrender";
	};
	player playActionNow "ALF_Surrender";
	!([player] call ALF_fnc_checkSurrender) || {player getVariable ["ReviveMedic",false]} || {!alive player}
};

if !([player] call ALF_fnc_checkMenotter) then {
	player playActionNow "gestureNod";
};
player forceWalk false;
[] spawn {
    sleep 1;
    player forceWalk false;
	player playActionNow "gestureNod";
};


