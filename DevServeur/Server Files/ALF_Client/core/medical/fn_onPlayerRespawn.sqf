#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_onPlayerRespawn.sqf
	Author: ALF Team

	Description:
	Does something but I won't know till I write it...
*/
params [
	["_unit",objNull,[objNull]],
	["_corpse",objNull,[objNull]]
];

if (ALF_Killed) then {
	_this spawn {
		params [
			["_unit",objNull,[objNull]],
			["_corpse",objNull,[objNull]]
		];

		waitUntil {(speed _corpse) isEqualTo 0};
		ALF_Killed = false;

		_unit setPosATL (getPosATL _corpse);

		//Comment this code out if you want them to keep the weapon on the ground.
		private _containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
		{deleteVehicle _x;} forEach _containers; //Delete the containers.

		deleteVehicle _corpse;

		_unit setUnconscious true;
		_unit allowDamage false;

		//Set some vars

		_unit setVariable ["phoneNumber",ALF_Phone_Number,HC3_Life];
		_unit setVariable ["ReviveMedic",true,true];
		_unit setVariable ["tf_unable_to_use_radio", true];
		_unit setVariable ["tf_voiceVolume", 0, true];
		if (ALF_Bracelet) then {
			_array = missionNamespace getVariable ["ALF_AllBracelets",[]];
			_array pushBack _unit;
			missionNamespace setVariable ["ALF_AllBracelets",_array,true];
		};
		
		"mort" cutText ["","BLACK IN"];

		//Setup our camera view
		life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
		showCinemaBorder true;
		life_deathCamera cameraEffect ["Internal","Back"];
		createDialog "DeathScreen";
		life_deathCamera camSetTarget _unit;
		life_deathCamera camSetRelPos [0,3.5,4.5];
		life_deathCamera camSetFOV .5;
		life_deathCamera camSetFocus [50,0];
		life_deathCamera camCommit 0;
		
		alf_death_effect = ppEffectCreate ["DynamicBlur", 500];
		alf_death_effect ppEffectEnable true;
		alf_death_effect ppEffectAdjust [8];
		alf_death_effect ppEffectCommit 5;

		(findDisplay 7300) displaySetEventHandler ["KeyDown","_handle = false;if((_this select 1) isEqualTo 1) then {_handle = true}; _handle"]; //Block the ESC menu

		if (isPlayer life_killer && {_unit != life_killer}) then {
			[name _unit,getPlayerUID _unit,"MORT",format["a été tué par %1 [%2m avec %3]",name life_killer,_unit distance life_killer,currentWeapon life_killer]] remoteExec ["HC_fnc_logIt",HC3_Life];
			private _dice = random(100);
			if(_dice > 60) then {
				alf_ms_bleeding = true;
			};
		};

		//Create a thread for something?
		_unit spawn {
			_unit = _this;
			disableSerialization;
			private _RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
			private _Timer = ((findDisplay 7300) displayCtrl 7301);
			private "_maxTime";
			if (alf_ms_isdead) then {
				_maxTime = time + 120;
			} else {
				if(ALF_Count_Meds isEqualTo 0) then {
					_maxTime = time + 420;
				} else {
					_maxTime = time + 900;
				};
			};
			_RespawnBtn ctrlEnable false;
			waitUntil {
				_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
				round(_maxTime - time) <= 0 || {isNull _unit}
			};
			_RespawnBtn ctrlEnable true;
			_Timer ctrlSetText localize "STR_Medic_Respawn_2";
		};

		_unit spawn {
			_unit = _this;
			disableSerialization;
			private _requestBtn = ((findDisplay 7300) displayCtrl 7303);
			_requestBtn ctrlEnable false;
			private _requestTime = time + 5;
			waitUntil {round(_requestTime - time) <= 0 || {isNull _unit}};
			_requestBtn ctrlEnable true;
		};

		[] remoteExecCall ["HC_fnc_deathScreen",HC_Life];

		//Create a thread to follow with some what precision view of the corpse.
		_unit spawn {
			_unit = _this;
			waitUntil {
				life_deathCamera camSetTarget _unit;
				life_deathCamera camSetRelPos [0,3.5,4.5];
				life_deathCamera camCommit 0;
				isNull (findDisplay 7300) || {isNull _unit} || {isNull life_deathCamera}
			};
		};

		player setUnitLoadout life_save_gear;

		player enableFatigue false;
	};
};