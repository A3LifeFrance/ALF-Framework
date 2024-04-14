/*
	File: fn_dogGetInVehicle.sqf
	Author: ALF TEAM
*/
private _dog = player getvariable ["ALF_Dog", objNull];
private _vehicule = cursorObject;

if (isNull _dog || {isNull _vehicule}) exitWith {};

player setVariable ["ALF_dogAction","monterVehicule"];

_dog moveTo (getPosATL _vehicule);
[player,"ALF_Sifler"] remoteExecCall ["life_fnc_say3D",0];

waitUntil {_dog distance2D _vehicule < 5};

switch (typeOf _vehicule) do {
	case "V_ALF_Vito_Gendarmerie" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Penit" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_G_SR" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Black" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_White" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Blue" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Darkgreen" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Darkred" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Green" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Orange" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Silver" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Red" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	case "V_ALF_Vito_Yellow" : {_dog attachTo [_vehicule, [0,-2,-0.95]];};
	
	//Oreilles dépasses du coffre
	case "V_ALF_RS6_White" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Blue" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Darkgreen" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Darkred" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Green" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Orange" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Pink" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Purple" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Red" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Silver" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	case "V_ALF_RS6_Black" : {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
	default {_dog attachTo [_vehicule, [-0.2,-1.6,-1.02]];};
};

_dog disableAI "PATH";

[_dog, "Dog_Sit"] remoteExec ["switchMove", 0];   