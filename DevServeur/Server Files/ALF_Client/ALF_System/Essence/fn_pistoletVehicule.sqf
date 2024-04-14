/*
    File: fn_pistoletVehicule.sqf
    Author: NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_veh",objNull,[objNull]],
	["_essence","",[""]]
];

switch (_mode) do {
	//Poser le pistolet sur le vehicule
	case 0: {
		if (isEngineOn _veh) exitWith {["Essence", "Tu ne peux pas poser le pistolet lorsque ton véhicule est allumé", "danger", false] spawn ALF_fnc_doMsg;};
		if ((fuel _veh) isEqualTo 1) exitWith {["Essence", "Le vehicule est deja plein", "danger", false] spawn ALF_fnc_doMsg;};

		private _ActivePistoletObj = objNull;
		{
			if ((typeOf _x) isEqualTo "ALF_Pistolet_Essence") exitWith {
				_ActivePistoletObj = _x;
			};
		} forEach (attachedObjects player);

		if (isNull _ActivePistoletObj) exitWith {};
		if !([(_ActivePistoletObj getVariable ["ALF_ActivePompe",objNull])] call ALF_fnc_hasEnergy) exitWith {["Total", "La pompe n'a pas d'électricité.", "danger"] spawn ALF_fnc_doMsg;};
		ALF_ActivePrisePistolet = false;

		_ActivePistoletObj attachTo [_veh, ([[-0.14,0,-0.2],[0.14,0,-0.2]] select (_essence isEqualTo "essence_1")), _essence];
		_ActivePistoletObj setDir ([0,180] select (_essence isEqualTo "essence_1"));
		_ActivePistoletObj setVectorUp ([[0.7,0,1],[-0.7,0,1]] select (_essence isEqualTo "essence_1"));
		_ActivePistoletObj setVariable ["ALF_ActiveVeh",_veh];
		player playActionNow "gestureNod";

		//Fuel du vehicule
		[_veh,_ActivePistoletObj,player,(getPos player)] remoteExec ["HC_fnc_fuelVehicule",HC3_Life];
	};

	//Prends le pistolet sur le vehicule
	case 1: {
		private _ActivePistoletObj = objNull;
		{
			if ((typeOf _x) isEqualTo "ALF_Pistolet_Essence") exitWith {
				_ActivePistoletObj = _x;
			};
		} forEach (attachedObjects _veh);

		if (isNull _ActivePistoletObj) exitWith {};
		ALF_ActivePrisePistolet = true;

		_ActivePistoletObj attachTo [player, [-0.025,0.045,-0.095], "RightHandMiddle1"];
		_ActivePistoletObj setDir 270;
		_ActivePistoletObj setVectorUp [0,0,1];
		player playActionNow "ALF_Pistolet_Essence";

		[(_ActivePistoletObj getVariable ["ALF_ActivePompe",objNull]),(_ActivePistoletObj getVariable ["ALF_ActivePistolet","pistolet_1"])] spawn {
			params [
				["_pompe",objNull,[objNull]],
				["_pistolet","",[""]]
			];

			for "_i" from 0 to 1 step 0 do {
				if !(ALF_ActivePrisePistolet) exitWith {};
				if !(currentWeapon player isEqualTo "") then {
					life_curWep_h = currentWeapon player;
					player action ["SwitchWeapon", player, player, 100];
					player switchCamera cameraView;
				};
				if ([player] call ALF_fnc_checkMenotter || {[player] call ALF_fnc_checkSurrender}) exitWith {[1,_pompe,_pistolet] spawn ALF_fnc_pistoletEssence};
				if (_pompe distance2D player >= 5.5) exitWith {[1,_pompe,_pistolet] spawn ALF_fnc_pistoletEssence};
				_dir = _pompe getRelDir player;
				if ((_pistolet isEqualTo "pistolet_1" && {_dir <= 180 && {_dir >= 0}}) || {_pistolet isEqualTo "pistolet_2" && {_dir <= 360 && {_dir >= 180}}}) exitWith {[1,_pompe,_pistolet] spawn ALF_fnc_pistoletEssence};
				sleep 0.05;
			};
		};
	};
};