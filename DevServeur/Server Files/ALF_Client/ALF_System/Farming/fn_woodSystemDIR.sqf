#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_woodSystemDIR.sqf
*/
private["_tree","_treeModelNames","_obj"];

_treeModelNames = ["t_ficusb2s_f.p3d","t_fraxinusav2s_f.p3d","t_ficusb1s_f.p3d","t_pinuss2s_f.p3d","t_pinuss2s_b_f.p3d"];
_tree = _treeModelNames call ALF_fnc_getLookAt;

if (!isNull _tree) then {
	if (alive _tree) then {
		if((time - life_hit_time) > 10) then {life_ALF_Hit = 0;};
		life_hit_time = time;
		life_ALF_Hit = life_ALF_Hit + 1;
		if((time - life_hit_time) > 1200) then {alf_xp_mc = 0;};

		if (life_ALF_Hit > 3) exitWith {
			_tree setDammage 1;
			[_tree] spawn {
				uiSleep 2;
				[_this select 0] remoteExecCall ["hideObjectGlobal",2];
			};
			_obj = createVehicle ["groundweaponholder", [0,0,0], [], 0, "NONE"];
			_obj setPosATL (getPosATL player);
			_obj addMagazineCargoGlobal ["ALF_Buche",4];
			life_ALF_Hit = 0;
		};
	};
};
