/*
	File: fn_dogGetOutVehicle.sqf
	Author: ALF TEAM
*/
private _dog = player getvariable ["ALF_Dog", objNull];

if (isNull _dog) exitWith {};

player setVariable ["ALF_dogAction","descendreVehicule"];

private _dog = player getvariable ["ALF_Dog",objNull];
private _vehicule = attachedTo _dog;

[player,"ALF_Sifler"] remoteExecCall ["life_fnc_say3D",0];
[_dog, "Dog_Stop"] remoteExec ["switchMove", 0]; 

detach _dog;

_dog setPosATL ((getPosATL _vehicule) vectorAdd [0,-2.5,0]);
_dog enableAI "PATH"; 