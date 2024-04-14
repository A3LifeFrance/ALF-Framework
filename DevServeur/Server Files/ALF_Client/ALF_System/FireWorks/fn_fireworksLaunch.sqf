private _type1 = [_this,0,"",[""]] call BIS_fnc_param;
private _initial_velocity = [_this,1,[],[[]]] call BIS_fnc_param;
private _explosion_power = [_this, 2, 0, [0]] call BIS_fnc_param;
private _glitter_count = [_this, 3, 0, [0]] call BIS_fnc_param;
private _color = [_this,4,[],[[]]] call BIS_fnc_param;
private _explosion_fragments_array = [_this,5,[],[[]]] call BIS_fnc_param;
private _explosion_subfragments_array = [_this,6,[],[[]]] call BIS_fnc_param;
private _launchSound = _this select 7;
private _whistlingSound = _this select 8;
private _bangSound = _this select 9;
private _singleFizz = _this select 10;
private _groupFizz = _this select 11;
private _firing_position = _this select 12;

private _nul1 ="CMflare_Chaff_Ammo" createVehicleLocal [_firing_position select 0,_firing_position select 1, 0]; 
_nul1 setVelocity _initial_velocity; 

private _light1 = "#lightpoint" createVehicleLocal [0,0,0];
_light1 setLightBrightness 0.1;
_light1 setLightColor [1,0.3,0];
_light1 setLightUseFlare true;
_light1 setLightFlareMaxDistance 1000;
_light1 setLightFlareSize 5;

private _light2 = "#lightpoint" createVehicleLocal [0,0,0];
_light2 setLightBrightness 0.08;
_light2 setLightColor [1,0.8,0];
_light2 setLightUseFlare true;
_light2 setLightFlareMaxDistance 1000;
_light2 setLightFlareSize 4;
sleep 0.01;
_light1 lightAttachObject  [_nul1,[0,0,0]];
_light2 lightAttachObject  [_nul1,[0,0,0]];

_nul1 say3D [format["ALF_%1",_launchSound],300];
sleep 1;

if (_type1 isEqualTo "fizzer") then {
	_nul1 say3D [format["ALF_%1",_whistlingSound],300];
};

sleep 2.5;

deleteVehicle _light1;
deleteVehicle _light2;

private _nul2 ="FxExploArmor3" createVehicleLocal (getPos _nul1);
sleep 0.10;
_nul2 say3D [format["ALF_%1",_bangSound],300];

for [{_i=0},{_i < count _explosion_fragments_array},{_i=_i+1}] do {
	[_nul1,_type1,_explosion_fragments_array,_explosion_subfragments_array,_color,_glitter_count,_i,0.25,4,_singleFizz,_groupFizz,_bangSound] spawn {
		private _rocket = _this select 0;
		private _type2 = _this select 1;
		private _fragments = _this select 2;
		private _subfragments = _this select 3;
		private _color2 = _this select 4;
		private _glitter_count2 = _this select 5;
		private _selector = _this select 6;
		private _randomSleep2 = _this select 7;
		private _randomSleepLong2 = _this select 8;
		private _singleFizz1 = _this select 9;
		private _groupFizz1 = _this select 10;
		private _bangSound1 = _this select 11;

		_nul2 ="CMflare_Chaff_Ammo" createVehicleLocal (getPos _rocket); 
		private _smoke ="SmokeLauncherAmmo" createVehicleLocal (getPos _rocket);	
		
		_nul2 setVelocity (_fragments select _selector);

		_light2 = "#lightpoint" createVehicleLocal [0,0,0];
		_light2 setLightBrightness 20;
		_light2 setLightDayLight true;
		if (_type2 == "normal" || _type2 == "fizzer") then {
			_light2 setLightAmbient [1,0.9,0.6];
		} else {
			_light2 setLightAmbient _color2;
		};
		
		_light2 setLightColor _color2;
		_light2 lightAttachObject  [_nul2,[0,0,0]];

		_light2 setLightUseFlare true;
		_light2 setLightFlareMaxDistance 1000;
		_light2 setLightFlareSize 4;

		if (_type2 == "normal") then {
			sleep (3 + (random 1));
			deleteVehicle _light2;
		};
		
		if (_type2 == "fizzer")  then {
			sleep 1.0;
			deleteVehicle _light2;
			
			_nul2 say3D [format["ALF_%1",_bangSound1],300];
		
			for [{_j=0},{_j < (count _subfragments)},{_j=_j+1}] do {
				[_nul2,_type2,_subfragments,_color2,_j,_randomSleep2,_randomSleepLong2,_singleFizz1,_groupFizz1,_bangSound1] spawn {
					_rocket2 = _this select 0;
					_type3 = _this select 1;
					_subfragments2 = _this select 2;
					_color3 = _this select 3;
					_selector2 = _this select 4;
					_randomSleep3 = _this select 5;
					_randomSleepLong3 = _this select 6;
					_singleFizz2 = _this select 7;
					_groupFizz2 = _this select 8;
					_bangSound2 = _this select 9;
					
					_posx = (getPos _rocket2) select 0;
					_posy = (getPos _rocket2) select 1;
					_posz = (getPos _rocket2) select 2;
					deleteVehicle _rocket2;
					
					_nul3 ="F_20mm_White" createVehicleLocal [_posx + ((random 20)-10),_posy+ ((random 20)-10),_posz+ ((random 20)-10)];
					_nul3 setVelocity (_subfragments2 select _selector2);

					_light3 = "#lightpoint" createVehicleLocal [0,0,0];
					_light3 setLightBrightness 20;
					_light3 setLightDayLight true;
					if (_type3 == "normal" || _type3 == "fizzer") then {
						_light3 setLightAmbient [1,0.9,0.6];
					} else {
						_light3 setLightAmbient _color3;
					};
					_light3 setLightColor _color3;
					_light3 lightAttachObject  [_nul3,[0,0,0]];

					_light3 setLightUseFlare true;
					_light3 setLightFlareMaxDistance 1000;
					_light3 setLightFlareSize 1;

					sleep (random 1);
					_nul3 say3D [format["ALF_%1",(_singleFizz2 call BIS_fnc_selectRandom)],300];

					sleep (2 - (random 1.5));

					deleteVehicle _light3;
					deleteVehicle _nul3;
				};
			};
		};
	};
};

sleep 1;
_nul2 say3D [format["ALF_%1",(_groupFizz call BIS_fnc_selectRandom)],300];
sleep 2;

deleteVehicle _nul2;