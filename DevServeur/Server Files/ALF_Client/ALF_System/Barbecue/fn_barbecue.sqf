#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_barbecue.sqf
	Author: ALF NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_bbq",objNull,[objNull]]
];

if (_mode isEqualTo -1 || {isNull _bbq}) exitwith {};

switch (_mode) do {
	//Allumer BBQ
	case 0: {
		_bbq animateSource ["chacha_source",0];
		private _jip = [2,_bbq] remoteExecCall ["ALF_fnc_barbecue",0,true];
		_bbq setVariable ["ALF_bbq_JIP",_jip,true];
	};

	//Eteindre BBQ
	case 1: {
		_bbq animateSource ["chacha_source",1];
		remoteExecCall ["", (_bbq getVariable ["ALF_bbq_JIP",""])]; 
		[3,_bbq] remoteExecCall ["ALF_fnc_barbecue",0];
		_bbq setVariable ["ALF_bbq_JIP","",true];
	};

	//Particule sur le bbq
	case 2: {
		if !(hasInterface) exitWith {};

		private _multipliersize = 1.5;
		private _multiplier = 1;
		private _fog = "#particleSource" createVehicleLocal getPos _bbq;
		_fog setParticleParams ["\A3\data_f\cl_basic",
			"",
			"Billboard", //Particle Type
			0.5, // Timer Period (s)
			5, //Lifetime (s)
			"fume", //Position
			[0, 0.1, -0.1], //Move Velocity
			1, //Rotation velocity
			1.2, //Weight
			1, //Volume
			0.1, //Rubbing
			[0.1 * _multipliersize, 0.2 * _multipliersize, 0.1 * _multipliersize], //Size
			[[0.2 * _multiplier, 0.2 * _multiplier, 0.2 * _multiplier, 0.3 * _multiplier],[0, 0, 0, 0.01],[1, 1, 1, 0]], //Color
			[500], //AnimationSpeed
			1, //randomDirectionPeriod
			0.04, //randomDirectionIntensity
			"", //onTimerScript
			"", //beforeDestroyScript
			_bbq //Object
		];
		_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
		_fog setDropInterval 0.005;
		_bbq setVariable ["ALF_bbq_Fog",_fog];
	};

	//Retirer particule
	case 3: {
		if !(hasInterface) exitWith {};

		private _fog = _bbq getVariable ["ALF_bbq_Fog",objNull];

		if (isNull _fog) exitWith {};

		_bbq setVariable ["ALF_bbq_Fog",objNull];
		deleteVehicle _fog;
	};
};
