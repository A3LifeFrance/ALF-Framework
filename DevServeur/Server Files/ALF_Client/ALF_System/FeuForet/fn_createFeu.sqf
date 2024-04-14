/*
	File: fn_createFeu.sqf
	Author: ALF NiiRoZz
*/
params [
	["_feu",objNull,[objNull]],
	["_mode",0,[-1]]
];
_feu setVariable ["effects",[]];
_pos01 = getPos _feu;

switch (_mode) do {
	case 0: {
		_source01 = "#particlesource" createVehicleLocal _pos01;
		_source01 setParticleClass "BigDestructionFire";
		_source01 attachto [_feu,[0,0,0]];

		_source02 = "#particlesource" createVehicleLocal _pos01;
		_source02 setParticleClass "BigDestructionSmoke";
		_source02 attachto [_feu,[0,0,0]];

		_source03 = "#particlesource" createVehicleLocal _pos01;
		_source03 setParticleClass "FireSparks";
		_source03 attachto [_feu,[0,0,0]];

		_li = "#lightpoint" createVehicleLocal _pos01;
		_li setLightBrightness 0.08;
		_li setLightAmbient [1,0.28,0.05];
		_li setLightColor [1,0.28,0.05];
		_li lightAttachObject [_feu, [0,0,0]];

		_feu setVariable ["effects",[_source01,_source02,_source03,_li]];
	};

	case 1: {
		_source01 = "#particlesource" createVehicleLocal _pos01;
		_source01 setParticleClass "MediumDestructionFire";
		_source01 attachto [_feu,[0,0,0]];

		_source02 = "#particlesource" createVehicleLocal _pos01;
		_source02 setParticleClass "MediumDestructionSmoke";
		_source02 attachto [_feu,[0,0,0]];

		_source03 = "#particlesource" createVehicleLocal _pos01;
		_source03 setParticleClass "FireSparks";
		_source03 attachto [_feu,[0,0,0]];

		_li = "#lightpoint" createVehicleLocal _pos01;
		_li setLightBrightness 0.08;
		_li setLightAmbient [1,0.28,0.05];
		_li setLightColor [1,0.28,0.05];
		_li lightAttachObject [_feu, [0,0,0]];

		_feu setVariable ["effects",[_source01,_source02,_source03,_li]];
	};

	case 2: {
		_source01 = "#particlesource" createVehicleLocal _pos01;
		_source01 setParticleClass "ALFFeuForetAmbiance";
		_source01 attachto [_feu,[0,0,0]];
		_feu setVariable ["effects",[_source01]];
	};
};