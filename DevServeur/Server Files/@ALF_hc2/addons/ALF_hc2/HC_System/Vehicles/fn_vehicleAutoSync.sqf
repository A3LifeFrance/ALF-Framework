/*
	File: fn_vehicleAutoSync.sqf
	Author: ALF Team
*/
for "_i" from 0 to 1 step 0 do {
	uiSleep 60;
	{
		private _veh = _x;
		if(alive _veh) then {
			private _dbInfo = _veh getVariable["dbInfo",[]];
			if(count _dbInfo > 0) then {
				private _uid = _dbInfo select 0;
				private _plate = _dbInfo select 1;
				private _vehBusiness = _veh getVariable["business_veh",[]];
				private _fuel = fuel _veh;
				private _dir =  getDir _veh;
				private _pos = getPosATL _veh;
				private _position = [[_pos,_dir]] call HC_fnc_mresArray;
				private _position2 = [[round(_pos select 0),round(_pos select 1),round(_pos select 2)]] call HC_fnc_mresArray;
				private _damage = getAllHitPointsDamage _veh;
				_damage = _damage select 2;
				_damage = [_damage] call HC_fnc_mresArray;
				_plate = [_plate] call HC_fnc_mresArray;

				private _vehItems = getItemCargo _veh;
				private _vehMags = getMagazineCargo _veh;
				private _vehWeapons = getWeaponCargo _veh;
				private _vehBackpacks = getBackpackCargo _veh;
				private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
				if((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {
					_cargo = [];
				};
				_cargo = [_cargo] call HC_fnc_mresArray;
				
				private _inHome = 0;
				if(_veh isKindOf "Car") then {
					if(_inHome isEqualTo 0 && {count _vehBusiness > 0}) then {
						private _business = nearestObjects[_pos,["Land_ALF_Entreprise"],30];
						if(count _business > 0) then {
							{
								private _var = _x getVariable ["business",[]];
								if(count _var > 0) then {
									private _siretstr = _var select 2;
									if(_siretstr isEqualTo (_vehBusiness select 0)) then {
										_inHome = 1;
									};
								};
							} forEach _business;
						};
					};
				};
				if(_veh isKindOf "Air") then {
					private _helipad = nearestObject [position _veh,"Land_Helipad"];
					if(_veh distance _helipad < 10) then {
						_inHome = 1;
					};
				};
				if(_veh isKindOf "Ship") then {
					private _dock = nearestObject [position _veh,"Land_PierWooden_01_dock_F"];
					if(_veh distance _dock < 10) then {
						_inHome = 1;
					};
				};
				private _query = "";
				if ((_veh getVariable["vehicle_info_owners",""]) isEqualTo "Gendarmerie") then {
					_query = format["UPDATE vehicles_cop SET fuel='%2', position='%3', pos_save='%4', damage='%5', isInHome='%6', gear='%7' WHERE plate='%1'",_plate,_fuel,_position,_position2,_damage,_inHome,_cargo];
				} else {
					if ((_veh getVariable["vehicle_info_owners",""]) isEqualTo "Pompiers") then {
						_query = format["UPDATE vehicles_med SET fuel='%2', position='%3', pos_save='%4', damage='%5', isInHome='%6', gear='%7' WHERE plate='%1'",_plate,_fuel,_position,_position2,_damage,_inHome,_cargo];
					} else {
						_query = format["UPDATE vehicles SET fuel='%3', position='%4', pos_save='%5', damage='%6', isInHome='%7', gear='%8' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel,_position,_position2,_damage,_inHome,_cargo];
					};
				};
				[_query,1] call HC_fnc_asyncCall;
			};
		};
	} forEach (entities [["Car","Air","Ship"], [], false, true]);
};
