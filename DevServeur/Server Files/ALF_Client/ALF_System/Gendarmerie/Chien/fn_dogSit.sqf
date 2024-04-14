/*
	File: fn_dogSit.sqf
	Author: ALF TEAM
*/
private _dog = player getvariable ["ALF_Dog", objNull];

if (isNull _dog) exitWith {};

player setVariable ["ALF_dogAction","SitDown"];

_dog disableAI "PATH";
[player,"ALF_Sifler"] remoteExecCall ["life_fnc_say3D",0];

while {(player getVariable ["ALF_dogAction",""]) isEqualTo "SitDown" && {alive _dog}} do 
{
	_dog playMoveNow "Dog_Sit";

	uiSleep 1.5;
};