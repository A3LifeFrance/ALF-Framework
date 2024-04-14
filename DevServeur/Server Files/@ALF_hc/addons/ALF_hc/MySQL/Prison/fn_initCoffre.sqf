#include "\ALF_hc\hc_macros.hpp"
/*
	initCoffre prison
*/
private _q = ["SELECT id, gear, safe, piege FROM prison",2,true] call HC_fnc_asyncCall;
{
	private _id = _x select 0;
	private _gear = [_x select 1] call HC_fnc_mresToArray;
	if(_gear isEqualType "") then {_gear = call compile format["%1",_gear];};

	private _c = call compile format ["alf_coffre_prison_%1",_id];

	if (count _gear > 0) then {
		private _items = _gear select 0;
		private _mags = _gear select 1;
		private _weapons = _gear select 2;
		private _backpacks = _gear select 3;
		for "_i" from 0 to ((count (_items select 0)) - 1) do {
			_c addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
		};
		for "_i" from 0 to ((count (_mags select 0)) - 1) do{
			_c addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
		};
		for "_i" from 0 to ((count (_weapons select 0)) - 1) do{
			_c addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
		};
		for "_i" from 0 to ((count (_backpacks select 0)) - 1) do{
			_c addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
		};
	};

	private _safe = [_x select 2,1] call HC_fnc_bool;
	if(_safe) then {
		_c animateSource ["safe_source",0,true];
	};

	private _piege = [_x select 3,1] call HC_fnc_bool;
	if(_piege) then {
		_c animateSource ["piege_source",0,true];
	};
} forEach _q;
