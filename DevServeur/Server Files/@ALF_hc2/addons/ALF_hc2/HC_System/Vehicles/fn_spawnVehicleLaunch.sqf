/*
	File: fn_spawnVehicleLaunch.sqf
	Author: ALF Team
*/

waitUntil {!(isNil "HC3_Life")};

//Veh civ							0       		1    			2     			3        		4     			5      			6				7				8				9              10                   11
private _q = ["SELECT vehicles.classname, vehicles.pid, vehicles.plate, vehicles.gear, vehicles.position, vehicles.fuel, vehicles.damage, vehicles.insure, players.name, vehicles.type, vehicles.insurecount, vehicles.peinture
FROM vehicles
INNER JOIN players
WHERE players.playerid = vehicles.pid
AND vehicles.active = '1' AND vehicles.alive = '1'",2,true] call HC_fnc_asyncCall;
if(count _q > 0) then {
	{
		private _v = _x;
		private _pid = _v select 1;
		private _p = _v select 2;

		private _gr = [_v select 3] call HC_fnc_mresToArray;
		if(_gr isEqualType "") then {_gr = call compile format["%1", _gr];};

		private _ps = [_v select 4] call HC_fnc_mresToArray;
		if(_ps isEqualType "") then {_ps = call compile format["%1", _ps];};

		private _f = _v select 5;

		private _damage = [_v select 6] call HC_fnc_mresToArray;
		if(_damage isEqualType "") then {_damage = call compile format["%1", _damage];};

		private _sp = _ps select 0;
		private _dir = _ps select 1;
		private _in = _v select 7;
		private _incount = _v select 10;

		private _new = [(_p)] call HC_fnc_mresToArray;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_p = _new;

		private _veh = (_v select 0) createVehicle [0,0,1000];
		_veh allowDamage false;
		_veh setDir _dir;
		if(_veh isKindOf "Ship") then {
			_veh setPosATL [_sp select 0,_sp select 1,1];
		} else {
			_veh setPosATL _sp;
		};
		_veh setFuel _f;
		_veh lock 2;

		private _n = _v select 8;
		_veh setVariable ["vehicle_info_owners",_pid,true];
		_veh setVariable ["dbInfo",[_pid,_p,_in,_incount,0]];
		_veh setVariable ["Flashed",false];
		[_veh,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
		_veh disableTIEquipment true;

		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;

		if((_v select 0) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_Berlingo_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_Passat_GND","V_ALF_DV15_Gendarmerie","V_ALF_Vito_Gendarmerie"]) then {
			_veh setVariable ["TF_RadioType", "alf_megaphone", true];
			{_veh setHit[_x,1];} forEach ["lightg01_h","lightg02_h","lightg03_h","lightg04_h","lightg05_h","lightg06_h","lightg07_h","lightg08_h"];
		};

		if(_veh isKindOf "Air") then {
			_veh setVariable ["TF_RadioType", "alf_radioheli", true];
			private _freq = random[1000, 5000, 9999];
			_veh setVariable ["helicofreq", _freq, true];
		};

		/////////////////////////////////	KEYS	/////////////////////////////////////
		if(count(_v select 9) isEqualTo 9) then {
			private _arr = missionNamespace getVariable [format["%1_KEYSB",(_v select 9)],[]];
			_arr pushBack _veh;
			_arr = _arr - [objNull];
			missionNamespace setVariable[format["%1_KEYSB",(_v select 9)],_arr,true];
			_veh setVariable ["business_veh",[_v select 9],true];
		} else {
			private _arr = missionNamespace getVariable [format["%1_KEYS",_pid],[]];
			_arr pushBack _veh;
			_arr = _arr - [objNull];
			missionNamespace setVariable[format["%1_KEYS",_pid],_arr];
		};
		//////////////////////////////////////////////////////////////////////////////

		if (count _gr > 0) then {
			private _it = _gr select 0;
			private _mags = _gr select 1;
			private _wp = _gr select 2;
			private _bp = _gr select 3;
				for "_i" from 0 to ((count (_it select 0)) - 1) do {
				_veh addItemCargoGlobal [((_it select 0) select _i), ((_it select 1) select _i)];
			};
			for "_i" from 0 to ((count (_mags select 0)) - 1) do {
				_veh addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
			};
			for "_i" from 0 to ((count (_wp select 0)) - 1) do {
				_veh addWeaponCargoGlobal [((_wp select 0) select _i), ((_wp select 1) select _i)];
			};
			for "_i" from 0 to ((count (_bp select 0)) - 1) do {
				_veh addBackpackCargoGlobal [((_bp select 0) select _i), ((_bp select 1) select _i)];
			};
		};
		
		_veh allowDamage true;

		if (count _damage > 0) then {
			private _parts = getAllHitPointsDamage _veh;

			{
				_veh setHitPointDamage [format["%1",((_parts select 0) select _forEachIndex)],_x];
			} forEach _damage;
		};

		if (_in > 0) then { _veh animateSource ["assu", 0, true];} else {_veh animateSource ["assu", 1, true];};

		_veh animateSource ["tracker", 1, true];

		private _peinture = [_v select 11] call HC_fnc_mresToArray;
		if(_peinture isEqualType "") then {_peinture = call compile format["%1", _peinture];};
		
		if !(_peinture isEqualTo []) then {
			_veh setObjectTextureGlobal [0,(_peinture select 0)];
			_veh setObjectMaterialGlobal [0,(_peinture select 1)];
		};

		_veh setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 0]];
		_veh setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 1]];
		_veh setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 3]];
		_veh setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 4]];
		_veh setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 5]];
		_veh setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 7]];
		_veh setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 8]];
	} forEach _q;
};

//Veh Cop			0     1    	  2      3        4    	5      	6	   7 
_q = ["SELECT classname, plate, gear, position, fuel, damage, type, peinture FROM vehicles_cop WHERE active = '1' AND alive = '1'",2,true] call HC_fnc_asyncCall;
if(count _q > 0) then {
	{
		private _v = _x;
		private _p = _v select 1;

		private _gr = [_v select 2] call HC_fnc_mresToArray;
		if(_gr isEqualType "") then {_gr = call compile format["%1", _gr];};

		private _ps = [_v select 3] call HC_fnc_mresToArray;
		if(_ps isEqualType "") then {_ps = call compile format["%1", _ps];};

		private _f = _v select 4;

		private _damage = [_v select 5] call HC_fnc_mresToArray;
		if(_damage isEqualType "") then {_damage = call compile format["%1", _damage];};

		private _sp = _ps select 0;
		private _dir = _ps select 1;

		private _new = [(_p)] call HC_fnc_mresToArray;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_p = _new;

		private _veh = (_v select 0) createVehicle [0,0,1000];
		_veh allowDamage false;
		if(_veh isKindOf "Ship") then {
			_veh setPosATL [_sp select 0,_sp select 1,1];
		} else {
			_veh setPosATL _sp;
		};
		_veh setDir _dir;
		_veh setFuel _f;
		_veh lock 2;

		_veh setVariable ["vehicle_info_owners","Gendarmerie",true];
		_veh setVariable ["dbInfo",[-1,_p,1,0,0]];
		_veh setVariable ["Flashed",false];
		[_veh,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
		_veh disableTIEquipment true;

		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;

		if((_v select 0) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_Berlingo_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_Passat_GND","V_ALF_DV15_Gendarmerie","V_ALF_Vito_Gendarmerie"]) then {
			_veh setVariable ["TF_RadioType", "alf_megaphone", true];
			{_veh setHit[_x,1];} forEach ["lightg01_h","lightg02_h","lightg03_h","lightg04_h","lightg05_h","lightg06_h","lightg07_h","lightg08_h"];
		};

		if(_veh isKindOf "Air") then {
			_veh setVariable ["TF_RadioType", "alf_radioheli", true];
			private _freq = random[1000, 5000, 9999];
			_veh setVariable ["helicofreq", _freq, true];
		};

		private _arr = missionNamespace getVariable ["GENDARMERIE_KEYS",[]];
		_arr pushBack _veh;
		_arr = _arr - [objNull];
		missionNamespace setVariable["GENDARMERIE_KEYS",_arr];

		if (count _gr > 0) then {
			private _it = _gr select 0;
			private _mags = _gr select 1;
			private _wp = _gr select 2;
			private _bp = _gr select 3;
				for "_i" from 0 to ((count (_it select 0)) - 1) do {
				_veh addItemCargoGlobal [((_it select 0) select _i), ((_it select 1) select _i)];
			};
			for "_i" from 0 to ((count (_mags select 0)) - 1) do {
				_veh addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
			};
			for "_i" from 0 to ((count (_wp select 0)) - 1) do {
				_veh addWeaponCargoGlobal [((_wp select 0) select _i), ((_wp select 1) select _i)];
			};
			for "_i" from 0 to ((count (_bp select 0)) - 1) do {
				_veh addBackpackCargoGlobal [((_bp select 0) select _i), ((_bp select 1) select _i)];
			};
		};
		
		_veh allowDamage true;

		if (count _damage > 0) then {
			private _parts = getAllHitPointsDamage _veh;

			{
				_veh setHitPointDamage [format["%1",((_parts select 0) select _forEachIndex)],_x];
			} forEach _damage;
		};
		
		_veh animateSource ["assu", 0, true];
		_veh animateSource ["tracker", 1, true];

		private _peinture = [_v select 7] call HC_fnc_mresToArray;
		if(_peinture isEqualType "") then {_peinture = call compile format["%1", _peinture];};
		
		if !(_peinture isEqualTo []) then {
			_veh setObjectTextureGlobal [0,(_peinture select 0)];
			_veh setObjectMaterialGlobal [0,(_peinture select 1)];
		};

		_veh setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 0]];
		_veh setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 1]];
		_veh setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 3]];
		_veh setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 4]];
		_veh setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 5]];
		_veh setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 7]];
		_veh setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 8]];
	} forEach _q;
};

//Veh SP			0     1    	  2      3        4    	5      	6	   7  
_q = ["SELECT classname, plate, gear, position, fuel, damage, type, peinture FROM vehicles_med WHERE active = '1' AND alive = '1'",2,true] call HC_fnc_asyncCall;
if(count _q > 0) then {
	{
		private _v = _x;
		private _p = _v select 1;

		private _gr = [_v select 2] call HC_fnc_mresToArray;
		if(_gr isEqualType "") then {_gr = call compile format["%1", _gr];};

		private _ps = [_v select 3] call HC_fnc_mresToArray;
		if(_ps isEqualType "") then {_ps = call compile format["%1", _ps];};

		private _f = _v select 4;

		private _damage = [_v select 5] call HC_fnc_mresToArray;
		if(_damage isEqualType "") then {_damage = call compile format["%1", _damage];};

		private _sp = _ps select 0;
		private _dir = _ps select 1;

		private _new = [(_p)] call HC_fnc_mresToArray;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_p = _new;

		private _veh = (_v select 0) createVehicle [0,0,1000];
		_veh allowDamage false;
		if(_veh isKindOf "Ship") then {
			_veh setPosATL [_sp select 0,_sp select 1,1];
		} else {
			_veh setPosATL _sp;
		};
		_veh setDir _dir;
		_veh setFuel _f;
		_veh lock 2;

		_veh setVariable ["vehicle_info_owners","Pompiers",true];
		_veh setVariable ["dbInfo",[-1,_p,1,0,0]];
		_veh setVariable ["Flashed",false];
		[_veh,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
		_veh disableTIEquipment true;

		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;

		if(_veh isKindOf "Air") then {
			_veh setVariable ["TF_RadioType", "alf_radioheli", true];
			private _freq = random[1000, 5000, 9999];
			_veh setVariable ["helicofreq", _freq, true];
		};

		private _arr = missionNamespace getVariable ["POMPIERS_KEYS",[]];
		_arr pushBack _veh;
		_arr = _arr - [objNull];
		missionNamespace setVariable["POMPIERS_KEYS",_arr];

		if (count _gr > 0) then {
			private _it = _gr select 0;
			private _mags = _gr select 1;
			private _wp = _gr select 2;
			private _bp = _gr select 3;
				for "_i" from 0 to ((count (_it select 0)) - 1) do {
				_veh addItemCargoGlobal [((_it select 0) select _i), ((_it select 1) select _i)];
			};
			for "_i" from 0 to ((count (_mags select 0)) - 1) do {
				_veh addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
			};
			for "_i" from 0 to ((count (_wp select 0)) - 1) do {
				_veh addWeaponCargoGlobal [((_wp select 0) select _i), ((_wp select 1) select _i)];
			};
			for "_i" from 0 to ((count (_bp select 0)) - 1) do {
				_veh addBackpackCargoGlobal [((_bp select 0) select _i), ((_bp select 1) select _i)];
			};
		};
		
		_veh allowDamage true;

		if (count _damage > 0) then {
			private _parts = getAllHitPointsDamage _veh;

			{
				_veh setHitPointDamage [format["%1",((_parts select 0) select _forEachIndex)],_x];
			} forEach _damage;
		};
		
		_veh animateSource ["assu", 0, true];
		_veh animateSource ["tracker", 1, true];

		private _peinture = [_v select 7] call HC_fnc_mresToArray;
		if(_peinture isEqualType "") then {_peinture = call compile format["%1", _peinture];};
		
		if !(_peinture isEqualTo []) then {
			_veh setObjectTextureGlobal [0,(_peinture select 0)];
			_veh setObjectMaterialGlobal [0,(_peinture select 1)];
		};

		_veh setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 0]];
		_veh setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 1]];
		_veh setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 3]];
		_veh setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 4]];
		_veh setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 5]];
		_veh setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 7]];
		_veh setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_p select 8]];
	} forEach _q;
};