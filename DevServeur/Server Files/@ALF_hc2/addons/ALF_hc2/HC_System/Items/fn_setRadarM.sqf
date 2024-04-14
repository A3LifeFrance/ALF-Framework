/*
	File: fn_setRadarM.sqf
	Author: ALF TEAM
*/
private _radar = _this select 0;
private _speedlimit = _this select 1;
private _amende = _this select 2;
private _player = _this select 3;
if(_speedlimit isEqualTo 0 OR {_amende isEqualTo 0}) exitWith {["Radar Mobile", "Données incorrects.", "danger", false] remoteExec ["ALF_fnc_doMsg",_player];};

["Radar Mobile", format["Le radar est programmé sur %1Km/h.",_speedlimit], "success", false] remoteExec ["ALF_fnc_doMsg",_player];
_radar setVariable ["RadarM",[_speedlimit,_amende,[]],true];
[_radar] remoteExec ["ALF_fnc_radarMenu",_player];

for "_i" from 0 to 1 step 0 do {
	if(isNull _radar OR {_radar animationPhase "clic" > 0 } OR {(_radar getVariable "RadarM" select 0) isEqualTo 0}) exitWith {};
	private _amendenow = _amende;
	private _nearVehicles = (getPos _radar) nearEntities [["Car"],20];
	if(count _nearVehicles > 0) then {
		{
			private _vehicle = _x;
			private _vInfo = _vehicle getVariable ["dbInfo",[]];
			if(count _vInfo > 0) then {
				private _speed = floor(speed _vehicle);
				private _bool = _vehicle getVariable ["Flashed",false];
				if (_speed > _speedlimit && {!_bool}) then {
					private _plaque = _vInfo select 1;
					[_vehicle] spawn {
						(_this select 0) setVariable ["Flashed",true];
						uiSleep 15;
						(_this select 0) setVariable ["Flashed",false];
					};
					[_radar, "flashRadarM"] remoteExecCall ["life_fnc_say3D",0];
					[_radar] remoteExec ["ALF_fnc_flashRadar",playableUnits select {(_x distance _radar) < 100}];
					
					private _p1 = _plaque select 0;
					private _p2 = _plaque select 1;
					private _p3 = _plaque select 2;
					private _p4 = _plaque select 3;
					private _p5 = _plaque select 4;
					private _p6 = _plaque select 5;
					private _p7 = _plaque select 6;
					private _p8 = _plaque select 7;
					private _p9 = _plaque select 8;
					private _pf = format["%1%2%3%4%5%6%7%8%9",_p1,_p2,_p3,_p4,_p5,_p6,_p7,_p8,_p9];
					
					if (typeOf(_vehicle) isEqualTo "V_ALF_Kx") then {_pf = "Inconnue"};

					private _hour = date select 3;
					private _min = date select 4;
					if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
					private _time = format["%1:%2",_hour,_min];

					private _var = _radar getVariable ["RadarM",[]];
					private _data = _var select 2;
					_data pushBack [_time,_pf,_speedlimit,_speed];

					if(_speed >= (_speedlimit+20) && {_speed < (_speedlimit+50)}) then {_amendenow = _amendenow * 1.5};
					if(_speed >= (_speedlimit+50)) then {_amendenow = _amendenow * 2.5};

					_var set[2,_data];
					_radar setVariable ["RadarM",_var,true];
					private _unit = driver _vehicle;
					if (!isNull _unit) then {
						[_speedlimit,_speed,_amendenow] remoteExec ["ALF_fnc_getFlashed",_unit];
					};
				};
			};
		} forEach _nearVehicles;
	};
	uiSleep 0.5;
};
