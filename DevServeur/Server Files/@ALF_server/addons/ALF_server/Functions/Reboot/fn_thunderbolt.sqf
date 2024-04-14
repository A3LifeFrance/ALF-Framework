if !(isServer) exitWith {};

private _type1_detect	= _this select 0;
private _type2_detect	= _this select 1;
private _type3_detect	= _this select 2;
private _rain_drops		= _this select 3;
private _wind_debris	= _this select 4;
private _local_fog		= _this select 5;

setWind [15, 15, true];
2 setOvercast 1;
2 setRain 1;
2 setGusts 1;
forceWeatherChange;

if(_type1_detect > 1) then {
	[_type1_detect] spawn {
		private _delay1 = _this select 0;
		alias_thunder_1 = true;
		publicVariable "alias_thunder_1";	
	
		for "_i" from 0 to 1 step 0 do {
			if !(alias_thunder_1) then {
				waitUntil {sleep 0.3; alias_thunder_1};
			};
			_rand_pl = [] spawn TON_fnc_hunt;
			waitUntil {sleep 0.3; scriptDone _rand_pl};
			_dire	= [2000,-2000] call BIS_fnc_selectRandom;
			_xx = (getpos hunt_alias select 0)+random _dire;
			_dire	= [2000,-2000] call BIS_fnc_selectRandom;	
			_yy = (getpos hunt_alias select 1)+random _dire;
			_zz = 1000;
			poz_obj_fulger1 = [_xx, _yy, _zz];
			publicVariable "poz_obj_fulger1";
			[poz_obj_fulger1] remoteExec ["ALF_fnc_thunderone",0];			
			sleep _delay1;
		};
	};
};

if(_type2_detect > 1) then {
	[_type2_detect] spawn {
		private _delay2 = _this select 0;
		alias_thunder_2 = true;
		publicVariable "alias_thunder_2";	
	
		for "_i" from 0 to 1 step 0 do {
			if !(alias_thunder_2) then {
				waitUntil {sleep 0.3; alias_thunder_2};
			};	
			_rand_pl = [] spawn TON_fnc_hunt;
			waitUntil {sleep 0.3; scriptDone _rand_pl};
			poz_f_1 = [hunt_alias,700+random 1300, random 360] call BIS_fnc_relPos;
			publicVariable "poz_f_1";
			[poz_f_1] remoteExec ["ALF_fnc_thundertwo",0];
			sleep _delay2;
			waitUntil {sleep 0.3; alias_thunder_2};
		};
	};
};

if(_type3_detect > 1) then {
	[_type3_detect] spawn {
		_delay3 = _this select 0;
		alias_thunder_3 = true;
		publicVariable "alias_thunder_3";	
		for "_i" from 0 to 1 step 0 do {
			if !(alias_thunder_3)then {
				waitUntil {sleep 0.3; alias_thunder_3};
			};	
			_sound_only = ["t_far_1","t_far_3","t_far_4","t_far_5","t_far_6","t_far_8","t_far_9","t_far_10","t_far_15","t_far_18","t_far_19","t_far_20","t_far_21","t_far_22"] call BIS_fnc_selectRandom;
			playSound _sound_only;
			sleep _delay3;
			waitUntil {sleep 0.3; alias_thunder_3};	
		};
	};
};

if(_rain_drops OR {_wind_debris} OR {_local_fog}) then {
	if (_rain_drops) then {alias_rain_drops = true; publicVariable "alias_rain_drops";} else {alias_rain_drops = false; publicVariable "alias_rain_drops";};
	if (_wind_debris) then {alias_wind_debris = true; publicVariable "alias_wind_debris";} else {alias_wind_debris = false; publicVariable "alias_wind_debris";};
	if (_local_fog) then {alias_local_fog = true; publicVariable "alias_local_fog";} else {alias_local_fog = false; publicVariable "alias_local_fog";};
	[] remoteExec ["ALF_fnc_weathereffect",0];
};
