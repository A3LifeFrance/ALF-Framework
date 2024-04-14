/*
	File: fn_headbag_put_target.sqf
	Auhtor: ALF Team
*/

if ((headgear player) != "") then {
	_holder = nearestObjects [player, ["groundweaponholder"], 4];
	if (_holder isEqualTo []) then {
		_holder = "groundweaponholder" createVehicle [0,0,0];
		_holder setPosATL (getPosATL player);
	} else {
		_holder = _holder select 0;
	};

	_holder addItemCargoGlobal [(headgear player), 1];
};

player addHeadgear "ALF_Headbag";