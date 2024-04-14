/*
	File: fn_firstViewCombat.sqf
	Author: Nanou
*/
params [
	["_unit",objNull,[objNull]],
	["_vehicle",objNull,[objNull]],
	["_distance",-1,[-1]],
	["_weapon","",[""]],
	["_muzzle","",[""]],
	["_mode","",[""]],
	["_ammo","",[""]],
	["_gunner",objNull,[objNull]]
];

if((player distance getMarkerPos "hunting_zone") < 500) exitWith {};
if (_weapon in ["ALF_Hache","ALF_Pioche","ALF_Batte","ALF_Faux","ALF_X26","ALF_Couteau","ALF_FireNozzle","ALF_Katana","ALF_CanneAPeche"]) exitWith {};

life_combatTime = time;
if !(life_firstCombatActive) then {
	[] spawn {
		life_firstCombatActive = true;
		for "_i" from 0 to 1 step 0 do {
			if (((time - life_combatTime) > 60)) exitWith {life_firstCombatActive = false;};
			if (toLower (cameraView) isEqualTo "external") then {
				player switchCamera "Internal";
			};
		};
	};
};
