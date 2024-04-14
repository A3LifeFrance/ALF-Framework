#include "\ALF_Client\script_macros.hpp"
/*
    File: fn_pistoletEssence.sqf
    Author: NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_pompe",objNull,[objNull]],
	["_pistolet","",[""]]
];

if (isNull _pompe || {_mode isEqualTo -1}) exitWith {};

switch (_mode) do {
	//Prendre le pistolet de la pompe
	case 0: {
		private _station = nearestObject [player, "Land_ALF_station"];
		if (isNull _station) exitWith {["Total", "Une erreur vient de ce produire.", "success"] spawn ALF_fnc_doMsg;};
		private _litreStation = _station getVariable ["station_litre",3000];
		if (_litreStation <= 0) exitWith {["Total", "Il n'y a plus d'essence dans la station service.", "success"] spawn ALF_fnc_doMsg;};

		if !(currentWeapon player isEqualTo "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};
		ALF_ActivePrisePistolet = true;
		_ActiveKart = "C_Kart_01_Red_F" createVehicle [0,0,0];
		_ActiveKart allowDamage false;
		hideObject _ActiveKart;
		[_ActiveKart] remoteExecCall ["hideObjectGlobal",2];
		uiSleep 1;

		_ActivePistoletObj = "ALF_Pistolet_Essence" createVehicle [0,0,0];
		_ActivePistoletObj setVariable ["ALF_ActivePistolet",_pistolet,true];
		_ActivePistoletObj setVariable ["ALF_ActivePompe",_pompe,true];
		_ActivePistoletObj allowDamage false;
		_ActivePistoletObj enableSimulation false;
		_ActivePistoletObj setPosATL ((getPosATL player) vectorAdd [0,0,1]);
		_ActivePistoletObj enableRopeAttach true;
		_ActiveKart enableRopeAttach true;
		_ActiveKart setPosASL (_pompe modelToWorldWorld ((_pompe selectionPosition (["rope_1","rope_2"] select (_pistolet isEqualTo "pistolet_2"))) vectorAdd [0,0,-1]));
		ropeCreate [_ActiveKart, [0,0,0], _ActivePistoletObj, "rope_start", 5];
		_pompe animateSource [(["pistolet_1_source","pistolet_2_source"] select (_pistolet isEqualTo "pistolet_2")), 1, true];
		player playActionNow "ALF_Pistolet_Essence";
		_ActivePistoletObj attachTo [player, [-0.025,0.045,-0.095], "RightHandMiddle1"];
		_ActivePistoletObj setDir 270;

		uiSleep 0.35;
		{
			_x setObjectTexture [0, "\ALF_Batiments\ALF_Station\proxies\data\Tuyau_Pompe_CO.paa"];
			_x setObjectTexture [1, ""];
			_x setObjectTexture [2, ""];
		} forEach ((player nearObjects ["ropesegment", 25]) + (player nearObjects ["rope", 25]));

		[_ActivePistoletObj] spawn {
			_ActivePistoletObj = _this select 0;
			uiSleep 1.5;
			if !(isNull _ActivePistoletObj) then {
				[2,_ActivePistoletObj] remoteExecCall ["ALF_fnc_pistoletEssence",0,_ActivePistoletObj];
			};
		};

		[_pompe,_pistolet] spawn {
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

	//Poser le pistolet de la pompe
	case 1: {
		private _ActivePistoletObj = objNull;
		{
			if ((typeOf _x) isEqualTo "ALF_Pistolet_Essence") exitWith {
				_ActivePistoletObj = _x;
			};
		} forEach (attachedObjects player);
		if (isNull _ActivePistoletObj) exitWith {};

		private _nombrelitres = _ActivePistoletObj getVariable ["ALF_NombreLitre",0];
		private _veh = _ActivePistoletObj getVariable ["ALF_ActiveVeh",objNull];
		
		private _price = 0;
		if (_nombrelitres > 0) then {
			private _fuelCost = LIFE_SETTINGS(getNumber,"fuel_cost");
			_price = _nombrelitres * _fuelCost;
		};

		if (_price > 0) then {
			private _exit = false;
			private _handle = false;
			if(_price > life_cash) then {
				_handle = [_price,false] call ALF_fnc_handleCB;
				if(_handle) exitWith {_exit = true;};
			} else {
				life_cash = round (life_cash - _price);
				[0] call SOCK_fnc_updatePartial;
			};
			
			if (_exit) exitWith {
				["Vidéo surveillance", "Tu es parti sans payer ! Les services de Gendarmerie sont prévenus !", "danger", false] spawn ALF_fnc_doMsg;
				["COG", format["De COG à l'ensemble des effectifs, véhicule ayant refusé de payer - station service située en %1.",mapGridPosition _pompe]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
				
				private _cam = nearestObject[position player,"Land_ALF_Security"];
				if(isNull _cam) exitWith {};
				if(_cam distance player > 100) exitWith {};
				
				private _hour = date select 3;
				private _min = date select 4;
				if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
				
				_plaque = [_veh] call ALF_fnc_getPlaque;
				if(isNil "_plaque") exitWith {};
				_p1 = _plaque select 0;
				_p2 = _plaque select 1;
				_p3 = _plaque select 2;
				_p4 = _plaque select 3;
				_p5 = _plaque select 4;
				_p6 = _plaque select 5;
				_p7 = _plaque select 6;
				_p8 = _plaque select 7;
				_p9 = _plaque select 8;
				
				private _pf = "";
				if ((random 10) < 4) then {
					_pf = format["%1*%2%3%4%5%6%7* - %8 €",_p1,_p3,_p4,_p5,_p6,_p7,_p8,_price];
				} else {
					_pf = format["%1%2%3%4%5%6%7%8%9 - %10 €",_p1,_p2,_p3,_p4,_p5,_p6,_p7,_p8,_p9,_price];
				};

				[_cam,format["%1:%2",_hour,_min],[_pf]] remoteExecCall ["HC_fnc_setCameraVar",HC_Life];
			};
			
			if (_nombrelitres > 0) then {
				["Station service", format["Tu as payé ton essence pour %1€",_price], "success", false] spawn ALF_fnc_doMsg;
			};
		};

		ALF_ActivePrisePistolet = false;

		ropeDestroy ((ropes _ActivePistoletObj) select 0);

		_ActiveKart = nearestObject [_pompe modelToWorld (_pompe selectionPosition (["rope_1","rope_2"] select ((_ActivePistoletObj getVariable ["ALF_ActivePistolet","pistolet_2"]) isEqualTo "pistolet_2"))), "C_Kart_01_Red_F"];
		deleteVehicle _ActiveKart;
		_ActiveKart = objNull;

		_pompe animateSource [(["pistolet_1_source","pistolet_2_source"] select ((_ActivePistoletObj getVariable ["ALF_ActivePistolet","pistolet_2"]) isEqualTo "pistolet_2")), 0, true];

		detach _ActivePistoletObj;
		deleteVehicle _ActivePistoletObj;

		player playActionNow "gestureNod";

		ALF_ActivePistolet = "";
	};

	//JIP texture de la rope
	case 2: {
		if (!hasInterface || {isNull _pompe}) exitWith {};

		{
			_x setObjectTexture [0, "\ALF_Batiments\ALF_Station\proxies\data\Tuyau_Pompe_CO.paa"];
			_x setObjectTexture [1, ""];
			_x setObjectTexture [2, ""];
		} forEach ((_pompe nearObjects ["ropesegment", 25]) + (_pompe nearObjects ["rope", 25]));
	};

	//Engine off
	case 3: {
		player action ["engineOff", vehicle player];
	};
	
	//Partir sans payer
	case 4: {
		private _ActivePistoletObj = objNull;
		{
			if ((typeOf _x) isEqualTo "ALF_Pistolet_Essence") exitWith {
				_ActivePistoletObj = _x;
			};
		} forEach (attachedObjects _pompe);
		if (isNull _ActivePistoletObj) exitWith {};

		private _nombrelitres = _ActivePistoletObj getVariable ["ALF_NombreLitre",0];
		private _veh = _ActivePistoletObj getVariable ["ALF_ActiveVeh",objNull];
		
		if (_nombrelitres > 0) then {
			private _fuelCost = LIFE_SETTINGS(getNumber,"fuel_cost");
			private _price = _nombrelitres * _fuelCost;
		
			["Vidéo surveillance", "Tu es parti sans payer ! Les services de Gendarmerie sont prévenus !", "danger", false] spawn ALF_fnc_doMsg;
			["COG", format["De COG à l'ensemble des effectifs, véhicule ayant refusé de payer - station service située en %1.",mapGridPosition _pompe]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
			
			private _cam = nearestObject[position player,"Land_ALF_Security"];
			if(isNull _cam) exitWith {};
			if(_cam distance player > 100) exitWith {};
				
			private _hour = date select 3;
			private _min = date select 4;
			if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
				
			_plaque = [_veh] call ALF_fnc_getPlaque;
			if(isNil "_plaque") exitWith {};
			_p1 = _plaque select 0;
			_p2 = _plaque select 1;
			_p3 = _plaque select 2;
			_p4 = _plaque select 3;
			_p5 = _plaque select 4;
			_p6 = _plaque select 5;
			_p7 = _plaque select 6;
			_p8 = _plaque select 7;
			_p9 = _plaque select 8;
			
			private _pf = "";
			if ((random 10) < 4) then {
				_pf = format["%1*%2%3%4%5%6%7* - %8 €",_p1,_p3,_p4,_p5,_p6,_p7,_p8,_price];
			} else {
				_pf = format["%1%2%3%4%5%6%7%8%9 - %10 €",_p1,_p2,_p3,_p4,_p5,_p6,_p7,_p8,_p9,_price];
			};

			[_cam,format["%1:%2",_hour,_min],[_pf]] remoteExecCall ["HC_fnc_setCameraVar",HC_Life];
		};

		ALF_ActivePrisePistolet = false;

		ropeDestroy ((ropes _ActivePistoletObj) select 0);

		private _pompe2 = nearestObjects[player, ["Land_ALF_Pompe"], 50] select 0;

		if !(isNull _pompe2) then {
			_ActiveKart = nearestObject [_pompe2 modelToWorld (_pompe2 selectionPosition (["rope_1","rope_2"] select ((_ActivePistoletObj getVariable ["ALF_ActivePistolet","pistolet_2"]) isEqualTo "pistolet_2"))), "C_Kart_01_Red_F"];
			deleteVehicle _ActiveKart;
			_ActiveKart = objNull;

			_pompe2 animateSource [(["pistolet_1_source","pistolet_2_source"] select ((_ActivePistoletObj getVariable ["ALF_ActivePistolet","pistolet_2"]) isEqualTo "pistolet_2")), 0, true];
		};

		detach _ActivePistoletObj;
		deleteVehicle _ActivePistoletObj;

		ALF_ActivePistolet = "";
	};
};