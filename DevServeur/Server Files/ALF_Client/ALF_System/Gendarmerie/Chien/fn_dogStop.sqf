/*
	File: fn_dogStop.sqf
	Author: ALF TEAM
*/
private _dog = player getvariable ["ALF_Dog", objNull];

if (isNull _dog) exitWith {};

player setVariable ["ALF_dogAction","stop"];

_dog disableAI "PATH";
[player,"ALF_Sifler"] remoteExecCall ["life_fnc_say3D",0];

while {(player getVariable ["ALF_dogAction",""]) isEqualTo "stop" && {alive _dog}} do 
{
	_dog playMoveNow "Dog_Stop";

	uiSleep 3.5;
};