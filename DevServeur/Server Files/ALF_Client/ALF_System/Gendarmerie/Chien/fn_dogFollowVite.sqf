/*
	File: fn_dogFollowVite.sqf
	Author: ALF TEAM
*/
private _dog = player getvariable ["ALF_Dog", objNull];

if (isNull _dog) exitWith {};

player setVariable ["ALF_dogAction","followVite"];

_dog enableAI "PATH";
_dog playMoveNow "Dog_Sprint";
[player,"ALF_Sifler"] remoteExecCall ["life_fnc_say3D",0];

while {(player getVariable ["ALF_dogAction",""]) isEqualTo "followVite" && {alive _dog}} do 
{
	_dog moveTo (getPosATL player);

	uiSleep 0.5;
};