/*
	File: fn_handleDamage.sqf
	Author: ALF TEAM
*/
params[
	["_unit",objNull,[objNull]],
	["_hitSelection","",[""]],
	["_damage",-1,[0]],
	["_source",objNull,[objNull]],
	["_projectile","",[""]],
	["_hitPartIndex",-1,[0]],
	["_instigator",objNull,[objNull]],
	["_hitPoint","",[""]]
];

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if !(_source isEqualTo _unit) then {
		if (currentWeapon _source in ["ALF_X26"] && {_projectile in ["ALF_B_Taser"]}) then {
			_damage = getDammage player;
			if (alive player && {!life_istazed} && {!life_isknocked}) then {
				if (_unit distance _source < 40) then {
					if !(isNull objectParent player) then {
						if (typeOf (vehicle player) in ["B_Quadbike_01_F"]) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						};
					} else {
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
			};
		};
		if (currentWeapon _source in ["KA_crossbow_vodka"] && {_projectile in ["KA_peche_ammo"]}) then {
			_damage = getDammage player;
			if (alive player && {!life_istazed} && {!life_isknocked} && {!([_unit] call ALF_fnc_checkMenotter)}) then {
				private ["_distance"];
				_distance = 40;
				if (_unit distance _source < _distance) then {
					if(isNull objectParent player) then {
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
			};
		};
		if(currentWeapon _source in ["ALF_Pioche","ALF_Batte","ALF_Hache","ALF_Faux","ALF_Couteau","ALF_Katana"]) then {
			_damage = 0.3;
		};
		if((vehicle _unit) isEqualTo _unit) then {
			_isVehicle = vehicle _source;
			if(_isVehicle isKindOf "Air" OR {_isVehicle isKindOf "Car"} OR {_isVehicle isKindOf "Boat"}) then {
				_damage = getDammage player;
			};
		};
		life_lastShooter = _source;
		life_lastWShooter = [currentWeapon _source,_source distance player];
	};
};

_damage;