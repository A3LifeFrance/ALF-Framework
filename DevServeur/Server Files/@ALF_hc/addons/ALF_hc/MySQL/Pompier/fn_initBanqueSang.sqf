/*
	initBanque Sang
*/
private _q = ["SELECT id, gear FROM banquesang",2,true] call HC_fnc_asyncCall;
{
	private _gear = [_x select 1] call HC_fnc_mresToArray;
	if(_gear isEqualType "") then {_gear = call compile format["%1",_gear];};

	if (count _gear > 0) then {
		private _items = _gear select 0;
		private _mags = _gear select 1;
		private _weapons = _gear select 2;
		private _backpacks = _gear select 3;
		for "_i" from 0 to ((count (_items select 0)) - 1) do {
			alf_banque_sang addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
		};
		for "_i" from 0 to ((count (_mags select 0)) - 1) do{
			alf_banque_sang addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
		};
		for "_i" from 0 to ((count (_weapons select 0)) - 1) do{
			alf_banque_sang addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
		};
		for "_i" from 0 to ((count (_backpacks select 0)) - 1) do{
			alf_banque_sang addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
		};
	};
} forEach _q;