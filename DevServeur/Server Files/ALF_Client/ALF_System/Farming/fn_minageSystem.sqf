#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_minageSystem.sqf
  Farming System by ALF Team
*/
private _rocku = _this select 0;
private _hits = _this select 1;
//reset hit time
if((time - life_hit_time) > 10) then {life_ALF_Hit = 0;};
life_hit_time = time;

life_ALF_Hit = life_ALF_Hit + 1;

//Regulation XP
if((time - life_hit_time) > 900) then {alf_xp_mc = 0;};
if((time - alf_xp_mt) > 900) then {
	alf_xp_m = false;
	//profileNamespace setVariable ["alf_xp_m", false];
	//saveProfileNamespace;
	alf_xp_mc = 0;
};
if(alf_xp_mc >= 100 && {!(alf_xp_m)}) then {
	alf_xp_m = true;
	//profileNamespace setVariable ["alf_xp_m", true];
	//saveProfileNamespace;
};

if (life_ALF_Hit > _hits) then {
	private "_obj";
	private _objects = nearestObjects [player, ["groundweaponholder"], 1.5];
	if (_objects isEqualTo []) then {
		_obj = "groundweaponholder" createVehicle [0,0,0];
		_obj setPosATL (getPosATL player);
	} else {
		_obj = _objects select 0;
	};
	_obj addMagazineCargoGlobal [_rocku,1];
	life_ALF_Hit = 0;
	if(player canAdd _rocku) then {
		if !(alf_xp_m) then {
			alf_xp_mc = alf_xp_mc + 1;
			alf_xp_mt = time;
			
			switch (_rocku) do {
				case "ALF_pierre_small": {[1,1] spawn ALF_fnc_addXP;};
				case "ALF_pierre_cui_small": {[1,2] spawn ALF_fnc_addXP;};
				case "ALF_pierre_fer_small": {[1,3] spawn ALF_fnc_addXP;};
				case "ALF_saphir_small": {[1,4] spawn ALF_fnc_addXP;};
				case "ALF_pierre_dia_small": {[1,5] spawn ALF_fnc_addXP;};
				case "ALF_Pepite_Or": {[1,5] spawn ALF_fnc_addXP;};
			};
		};
	};
};
