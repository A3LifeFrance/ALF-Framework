#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_woodSystem.sqf
*/
private["_hits","_tree","_treeModelNames","_obj","_obj2","_obj3","_obj4"];
_hits = _this select 0;

_treeModelNames = ["t_ficusb2s_f.p3d","t_fraxinusav2s_f.p3d","t_ficusb1s_f.p3d","t_pinuss2s_f.p3d","t_pinuss2s_b_f.p3d"];
_tree = _treeModelNames call ALF_fnc_getLookAt;

if (!isNull _tree) then {
	if (alive _tree) then {
		//reset hit time
		if((time - life_hit_time) > 10) then {life_ALF_Hit = 0;};
		life_hit_time = time;

		life_ALF_Hit = life_ALF_Hit + 1;

		//Regulation XP
		if((time - life_hit_time) > 1200) then {alf_xp_mc = 0;};
		if((time - alf_xp_mt) > 1200) then {
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

		if (life_ALF_Hit > _hits) exitWith {
			_tree setDammage 1;
			[_tree] spawn {
				uiSleep 2;
				[_this select 0] remoteExecCall ["hideObjectGlobal",2];
			};
			_obj = createVehicle ["groundweaponholder", [0,0,0], [], 0, "NONE"];
			_obj setPosATL (getPosATL player);
			_obj addMagazineCargoGlobal ["ALF_Buche",4];
			life_ALF_Hit = 0;

			if(player canAdd "ALF_Buche") then {
				if !(alf_xp_m) then {
					alf_xp_mc = alf_xp_mc + 1;
					alf_xp_mt = time;
					[0,3] spawn ALF_fnc_addXP;
				};
			};
		};
	};
};
