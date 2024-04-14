/*
	File: fn_dogFollowDoucement.sqf
	Author: ALF TEAM
*/
private _dog = player getvariable ["ALF_Dog", objNull];

if (isNull _dog) exitWith {};

player setVariable ["ALF_dogAction","followDoucement"];

_dog enableAI "PATH";
_dog playMoveNow "Dog_Walk";
[player,"ALF_Sifler"] remoteExecCall ["life_fnc_say3D",0];

while {(player getVariable ["ALF_dogAction",""]) isEqualTo "followDoucement" && {alive _dog}} do 
{
	_dog moveTo (getPosATL player);

	uiSleep 0.5;
};