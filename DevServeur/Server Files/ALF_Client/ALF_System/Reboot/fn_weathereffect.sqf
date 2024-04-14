if (!hasInterface) exitWith {};

if(alias_rain_drops)then {
[] spawn {
	for "_i" from 0 to 1 step 0 do {
		if (!alias_rain_drops)then {waitUntil {sleep 0.3; alias_rain_drops};};
			_alias_rain_drop_interval = 300 + random 300;
			_alias_rainLevel = rain;
			if (_alias_rainLevel < 0.5) then {_alias_rain_drop_factor =0.05;} else {_alias_rain_drop_factor =0.01;};
			_pos_rd = [getpos player select 0,getpos player select 1,0];
			_alias_drop_r = "#particlesource" createVehicleLocal _pos_rd;
			_alias_drop_r setParticleCircle [20, [0, 0, 0]];
			_alias_drop_r setParticleRandom [0.1, [20, 20, 0], [0.175, 0.175, 0], 13, 0.15, [0, 0, 0, 0.1], 0, 0];
			_alias_drop_r setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.15], 11, 12, 7.9, 0.075, [0.3, 0.5, 1], [[1, 1, 1, 1], [0.5, 0.5, 0.5, 0.5], [0.25, 0.25, 0.25, 0]], [0.08], 1, 0, "", "", vehicle player];
			_alias_drop_r setDropInterval 0.05;
			
			sleep _alias_rain_drop_interval;
			deleteVehicle _alias_drop_r;
		};
	};
};

if (alias_wind_debris) then {
	
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			if (!alias_wind_debris)then {waitUntil {sleep 0.3; alias_wind_debris};};	
			_alias_debris_interval = 180 + random 300;
			_alias_wind = wind;
			_xx_speed	=_alias_wind select 0;
			_yy_speed	=_alias_wind select 1;
		
			_alias_drop_factor = [_xx_speed,_yy_speed] call BIS_fnc_greatestNum;
			
			_Leaves_Green_interval	= 2/(_alias_drop_factor*20) + 0.1;
			_Leaves_leaf_interval	= 2/(_alias_drop_factor*20) + 0.1;
			_WoodParts_interval		= 2/(_alias_drop_factor*20) + 0.1;
			_leaves_p_interval		= 2/(_alias_drop_factor*20) + 2+ random 1;
			
			_Leaves_Green = "#particlesource" createVehicleLocal (getpos player);
			_Leaves_Green attachto [player];
			_Leaves_Green setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Leaves_Green.p3d", 1, 0, 1],"","SpaceObject",1,7,[0,-3,5],[_xx_speed,_yy_speed,0],1,0.000001,0,1.4,[1+random 0.5],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
			_Leaves_Green setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
			_Leaves_Green setParticleCircle [0.0, [0, 0, 0]];
		
			_Leaves_leaf = "#particlesource" createVehicleLocal (getpos player);
			_Leaves_leaf attachto [player];
			_Leaves_leaf setParticleParams [["\A3\data_f\cl_leaf", 1, 0, 1],"","SpaceObject",1,7,[0,-3,5],[_xx_speed,_yy_speed,0],1,0.000001,0,1.4,[1+random 0.5],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
			_Leaves_leaf setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
			_Leaves_leaf setParticleCircle [0.0, [0, 0, 0]];
		
			_WoodParts = "#particlesource" createVehicleLocal (getpos player);
			_WoodParts attachto [player];
			_WoodParts setParticleParams [["\A3\data_f\ParticleEffects\Universal\WoodParts_01.p3d", 1, 0, 1],"","SpaceObject",1,7,[0,-3,5],[_xx_speed,_yy_speed,0],1,0.000001,0,1.4,[1+random 0.5],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
			_WoodParts setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
			_WoodParts setParticleCircle [0.0, [0, 0, 0]];
		
			_leaves_p  = "#particlesource" createVehicleLocal (getpos player);
			_leaves_p attachto [player];
			_leaves_p setParticleRandom [0, [10, 10, 7], [4, 4, 5], 13, random 0.5, [0, 0, 0, 0.5], 0, 0];
			_leaves_p setParticleCircle [60, [0, 0, 0]];
			_leaves_p setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Sticks_Green", 1, 1, 1], "", "SpaceObject", 1,17,[0,-5,15],[_xx_speed,_yy_speed,0],0/*random 0.5*/,0.00001,0.0,0.1,[random 5],[[0.68,0.68,0.68,1],[0.68,0.68,0.68,0]],[1.5,1],13,13,"","",vehicle player,0,true,1,[[0,0,0,0]]];
		
			_Leaves_Green setDropInterval _Leaves_Green_interval;
			_Leaves_leaf setDropInterval _Leaves_leaf_interval;
			_WoodParts setDropInterval _WoodParts_interval;
			_leaves_p setDropInterval _leaves_p_interval;
		
			sleep _alias_debris_interval;
		
			deleteVehicle _Leaves_Green;
			deleteVehicle _Leaves_leaf;
			deleteVehicle _WoodParts;
			deleteVehicle _leaves_p;
		};
	};
};

if (alias_local_fog)then {
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			if (!alias_local_fog)then {waitUntil {sleep 0.3; alias_local_fog};};
			_alias_fog_interval = 180 + random 300;
			_alias_wind = wind;
			_xx_fog_speed	=_alias_wind select 0;
			_yy_fog_speed	=_alias_wind select 1;
			_alias_drop_fog_factor = 0.03+random 0.1;
			_alias_local_fog = "#particlesource" createVehicleLocal (getpos player); 
			_alias_local_fog attachto [player];
			_alias_local_fog setParticleCircle [10, [3, 3, 0]];
			_alias_local_fog setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];
			_alias_local_fog setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [-1, -1, 0], 3, 10.15, 7.9, 0.01, [10, 10, 20], [[0.5, 0.5, 0.5, 0], [0.5, 0.5, 0.5, 0.3], [1, 1, 1, 0]], [0.08], 1, 0, "", "", vehicle player];
			_alias_local_fog setDropInterval _alias_drop_fog_factor;
		
			sleep _alias_fog_interval;
			deleteVehicle _alias_local_fog;
		};
	};
};