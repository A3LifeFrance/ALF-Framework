/*
	File: fn_dogAttack.sqf
	Author: ALF TEAM
*/
_target = _this select 3;
if (isNull _target) exitWith {};

private _dog = player getvariable ["ALF_Dog", objNull];

if (isNull _dog) exitWith {};

player setVariable ["ALF_dogAction","attack"];

_dog enableAI "PATH";
_dog playMoveNow "Dog_Sprint";
[player,"ALF_Sifler"] remoteExecCall ["life_fnc_say3D",0];

while {((player getVariable ["ALF_dogAction",""]) isEqualTo "attack") && {alive _dog} && {alive _target}} do {
	_dog moveTo (getPosATL _target);
	uiSleep 0.5;
	if ((_target distance _dog) < 3) exitWith {
		[_target] remoteExec ["life_fnc_knockedOut",_target];
		player setVariable ["ALF_dogAction",""];
	};
};

if((player getVariable ["ALF_dogAction",""]) isEqualTo "attack") then {
	player setVariable ["ALF_dogAction",""];
};