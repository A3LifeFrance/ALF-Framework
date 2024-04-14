if (!hasInterface) exitWith {};

_alias_bolt_1 = _this select 0;

if ((player distance _alias_bolt_1)>1300) then {

	_poz_obj_fulger = "Land_HelipadEmpty_F" createVehicleLocal [_alias_bolt_1 select 0,_alias_bolt_1 select 1,0];
	_sound_far = ["t_far_1","t_far_3","t_far_4","t_far_5","t_far_6","t_far_8","t_far_9","t_far_10","t_far_15","t_far_18","t_far_19","t_far_20","t_far_21","t_far_22","t_close_1","t_close_2","t_close_3","t_close_5","t_close_8","t_close_9","t_close_10","t_close_12","t_close_14","t_close_15","t_close_17","t_close_18"] call BIS_fnc_selectRandom;
	_f_dim	= 3;
	
	_lum_fulg_w = "#lightpoint" createvehiclelocal getPosATL _poz_obj_fulger;
	_lum_fulg_w attachto [_poz_obj_fulger,[0,0,1000]];
	_lum_fulg_w setLightDayLight true;
	_lum_fulg_w setLightUseFlare false;
	_lum_fulg_w setLightFlareSize 100;
	_lum_fulg_w setLightFlareMaxDistance 2000;	
	_lum_fulg_w setLightAmbient[0.5,0.5,1];
	_lum_fulg_w setLightColor[0.8,0.8,1];

	_lum_fulg_w setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 0, /*quadratic*/ 0, /*hardlimitstart*/0,4000];  
	_lum_fulg_w setLightIntensity	2000;
	_lum_fulg_w setLightBrightness	300+random 100;
	_alias_flicker=floor (1+random 5);
	while {_alias_flicker>0} do {
		sleep 0.1+random 0.1;
		_lum_fulg_w setLightBrightness 50+ random 100;
		sleep 0.2;
		_lum_fulg_w setLightBrightness	300+random 300;
		_alias_flicker=_alias_flicker-1;
	};
	sleep 0.2;
	_lum_fulg_w setLightBrightness 50;
	
	_fulger = "#particlesource" createVehicleLocal getPosATL _poz_obj_fulger;
	_fulger setParticleCircle [/*radius*/0,/*vit xyz*/ [0, 0, 0]];
	_fulger setParticleRandom
		/*LifeTime*/		[0,
		/*Position*/		[0,0,0],
		/*MoveVelocity*/	[0,0,0],
		/*rotationVel*/		0,
		/*Scale*/		0,
		/*Color*/		[0,0,0,0],
		/*randDirPeriod*/	0,
		/*randDirIntesity*/	0,
		/*Angle*/		0];
//	_poz_obj_fulger setVectorDir [f_x_unghi,f_y_unghi,z_unghi];
	_fulger setParticleParams
		/*Sprite*/		[["\A3\data_f\blesk1",/*Ntieth*/ 1, /*Index*/0, /*Count*/1, /*loop*/0], "",
			/*Type*/			"spaceObject",
			/*TimmerPer*/		1,
			/*Lifetime*/		0.5,
			/*Position*/		[0,0,400],
			/*MoveVelocity*/	[0,0,0],
			/*Simulation*/		0,10,7.9,0.075,//rotationVel,weight,volume,rubbing
			/*Scale*/		[_f_dim],
			/*Color*/		[[1,1,1,1]],
			/*AnimSpeed*/		[0,0],
			/*randDirPeriod*/	0,
			/*randDirIntesity*/	0,
			/*onTimerScript*/	"",
			/*DestroyScript*/	"",
			/*Follow*/		_poz_obj_fulger,
			/*Angle*/              0,
			/*onSurface*/          false,
			/*bounceOnSurface*/    -1,
			/*emissiveColor*/      [[0,0,0,0]]];
	_fulger setDropInterval 180;
//	_fulger setVectorUp [0, 0, 1]; //	_fulger setVelocity [0, 0, f_viteza];	//	_poz_obj_fulger say3D _sound_f_close;

	_lum_fulg_w setLightIntensity	2500 + random 1000;
	_intens_vf = 700+random 110;
	_lum_fulg_w setLightBrightness	_intens_vf;
	sleep 0.3;
	deleteVehicle _fulger;

	while {_intens_vf>0} do {
		_intens_vf = _intens_vf-50;
		_lum_fulg_w setLightIntensity 0;
		_lum_fulg_w setLightBrightness _intens_vf;
		sleep 0.01;
	};	
	_lum_fulg_w setLightBrightness 0;
	_lum_fulg_w setLightIntensity  0;

	sleep 1.5;
	playSound _sound_far;
	deleteVehicle _lum_fulg_w;
	deleteVehicle _poz_obj_fulger;
};




if ((player distance _alias_bolt_1)<1300) then { 

	_voice_fulger = "Land_HelipadEmpty_F" createVehicleLocal [_alias_bolt_1 select 0,_alias_bolt_1 select 1,500];
	_sound_f_close = ["t_close_1","t_close_2","t_close_3","t_close_5","t_close_8","t_close_9","t_close_10","t_close_12","t_close_14","t_close_15","t_close_17","t_close_18"] call BIS_fnc_selectRandom;
	f_viteza 	= 30;
	f_x_unghi	= random 360;
	f_y_unghi	= random 360;			
	z_unghi		= 180;
	_f_dim		= 5;
	
	_cloud = "#particlesource" createVehicleLocal getPosATL _voice_fulger;
	_cloud setParticleCircle [200,[(wind select 0)+100,(wind select 1)+100, 50]];
	_cloud setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	_cloud setParticleParams
		/*Sprite*/		[["\A3\data_f\cl_basic", 1, 0, 1], "",
		/*Type*/			"Billboard",
		/*TimmerPer*/		1,
		/*Lifetime*/		12,
		/*Position*/		[0,0,500],
		/*MoveVelocity*/	[(wind select 0)+10,(wind select 1)+10,10],
		/*Simulation*/		5,10,7.9,0.075,//rotationVel,weight,volume,rubbing
		/*Scale*/		[300,300,300],
		/*Color*/		[[0.1,0.1,0.5,0],[1,1,1,0.005],[0,0,0.5,0]],
		/*AnimSpeed*/		[0,0],
		/*randDirPeriod*/	0,
		/*randDirIntesity*/	0,
		/*onTimerScript*/	"",
		/*DestroyScript*/	"",
		/*Follow*/		_voice_fulger,
		/*Angle*/              0,
		/*onSurface*/          false,
		/*bounceOnSurface*/    -1,
		/*emissiveColor*/      [[0,0,0,0]]];
	_cloud setDropInterval 0.1;	
	sleep 6;
	deleteVehicle _cloud;
	
	_lum_fulg_c = "#lightpoint" createvehiclelocal getPosATL _voice_fulger;
	_lum_fulg_c attachto [_voice_fulger,[0,0,200]];
	_lum_fulg_c setLightDayLight true;
	_lum_fulg_c setLightUseFlare false;
	_lum_fulg_c setLightFlareSize 100;
	_lum_fulg_c setLightFlareMaxDistance 2000;	
	_lum_fulg_c setLightAmbient[0.7,0.7,0.9];
	_lum_fulg_c setLightColor[0.9,0.9,1];

	_lum_fulg_c setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 0, /*quadratic*/ 0, /*hardlimitstart*/0,4000];  
	_lum_fulg_c setLightIntensity	5000;
	_lum_fulg_c setLightBrightness	500+random 100;
	sleep 0.1;
	_lum_fulg_c setLightBrightness 200;
	sleep 0.2;	

	_fulger = "#particlesource" createVehicleLocal getPosATL _voice_fulger;
	_fulger setParticleCircle [/*radius*/0,/*vit xyz*/ [0, 0, 0]];
	_fulger setParticleRandom
		/*LifeTime*/		[0,
		/*Position*/		[0,0,0],
		/*MoveVelocity*/	[0,0,0],
		/*rotationVel*/		0,
		/*Scale*/		0,
		/*Color*/		[0,0,0,0],
		/*randDirPeriod*/	0,
		/*randDirIntesity*/	0,
		/*Angle*/		0];
	
	_voice_fulger setVectorDir [f_x_unghi,f_y_unghi,z_unghi];
	
	_fulger setParticleParams
		/*Sprite*/		[["\A3\data_f\blesk1",/*Ntieth*/ 1, /*Index*/0, /*Count*/1, /*loop*/0], "",
			/*Type*/			"spaceObject",
			/*TimmerPer*/		1,
			/*Lifetime*/		0.5,
			/*Position*/		[0,0,300],
			/*MoveVelocity*/	[0,0,0],
			/*Simulation*/		0,10,7.9,0.075,//rotationVel,weight,volume,rubbing
			/*Scale*/		[_f_dim],
			/*Color*/		[[1,1,1,1]],
			/*AnimSpeed*/		[0,0],
			/*randDirPeriod*/	0,
			/*randDirIntesity*/	0,
			/*onTimerScript*/	"",
			/*DestroyScript*/	"",
			/*Follow*/		_voice_fulger,
			/*Angle*/              180,
			/*onSurface*/          false,
			/*bounceOnSurface*/    -1,
			/*emissiveColor*/      [[0,0,0,0]]];
	
	_fulger setDropInterval 60;
	
	_lum_fulg_c setLightIntensity	5000;
	_lum_fulg_c setLightBrightness	900+random 110;
	sleep 0.3;
	
	_voice_fulger say3D _sound_f_close;	
	
	_lum_fulg_c setLightBrightness 0;
	_lum_fulg_c setLightIntensity  0;

	sleep 1;
	deleteVehicle _fulger;
	deleteVehicle _lum_fulg_c;
	sleep 23;
	deleteVehicle _voice_fulger;
};