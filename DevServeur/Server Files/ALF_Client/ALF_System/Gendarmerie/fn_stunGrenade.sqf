/*
    File: fn_stunGrenade.sqf
    Author: ALF Dev Team
*/
private ["_pos","_eyeDir","_pPos","_impactPos","_norm","_angle","_blurEffect","_ppEffect"];
params [
    ["_pos",[],[[]]]
];
if (_pos isEqualTo []) exitWith {};
if (player distance _pos > 20) exitWith {};

_pos set[2,(_pos select 2)+0.2];
if (lineIntersects [eyePos player, ATLtoASL _pos,player]) exitWith {};

_eyeDir = eyeDirection player;
_pPos = getPosATL player;
_impactPos = [(_pos select 0)-(_pPos select 0),(_pos select 1)-(_pPos select 1),(_pos select 2)-(_pPos select 2)];
_norm = sqrt((_impactPos select 0)^2+(_impactPos select 1)^2+(_impactPos select 2)^2);
_angle = aCos ((_eyeDir select 0)*((_impactPos select 0) / _norm)+((_impactPos select 1) / _norm)*(_eyeDir select 1)+((_impactPos select 2) / _norm)*(_eyeDir select 2));

playSound "flashbang";
_blurEffect = ppEffectCreate ["DynamicBlur",500];
_blurEffect ppEffectForceInNVG true;
_blurEffect ppEffectEnable true;

if (_angle < 200) then {
    //Create white-screen
    sleep 0.01;
    player switchmove "acts_CrouchingCoveringRifle01";
	[player, "acts_CrouchingCoveringRifle01"] remoteExec ["switchMove", 0]; 
	_blurEffect ppEffectAdjust [5];
	_blurEffect ppEffectCommit 5;
	
	player setFatigue 1;
	5 fadeSound 0.25;
	sleep 7;
	
    player switchmove "acts_CrouchingCoveringRifle01";
	[player, "acts_CrouchingCoveringRifle01"] remoteExec ["switchMove", 0]; 
	sleep 4;
    player switchmove "";
	[player, ""] remoteExec ["switchMove", 0]; 
	15 fadeSound 1;
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 5;
	sleep 5;
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect
} else {
    _blurEffect ppEffectAdjust [2.1];
    _blurEffect ppEffectCommit 0.1;
    15 fadeSound 0.25;
    sleep 15;
    _blurEffect ppEffectAdjust [0];
    _blurEffect ppEffectCommit 10;
    sleep 5;
    15 fadeSound 1;
    sleep 5;
    _blurEffect ppEffectEnable false;
    ppEffectDestroy _blurEffect;
};