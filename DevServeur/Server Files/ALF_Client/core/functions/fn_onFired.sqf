#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_onFired.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles various different ammo types being fired.
*/
private["_unit","_ammo","_cfg","_anim","_pr","_mg"];
_unit = _this select 0;
_ammo = _this select 4;
_mg = _this select 5;
_pr = _this select 6;

if (_ammo isEqualTo "ALF_FireNozzle_Ammo" && {isNull ropeAttachedTo player}) exitWith {
	deleteVehicle _pr;
	player action ["SwitchWeapon", player, player, 100];
};

if (_ammo isEqualTo "ALF_FireNozzle_Ammo" && {!life_firenozzle}) exitWith {
	life_firenozzle = true;
	_pr spawn {
		private "_position";
		while {!isNull _this} do {
            _position = getPosATL _this;
            uiSleep 0.05;
        };
		[_position] spawn ALF_fnc_fireNozzle;
		life_firenozzle = false;
	};
};

if (_mg isEqualTo "KA_M7290") exitWith {
	_pr spawn {
        private "_position";
        while {!isNull _this} do {
            _position = ASLtoATL (visiblePositionASL _this);
            uiSleep 0.05;
        };
        [_position] remoteExec ["ALF_fnc_flashbang",playableUnits select {_x distance _position < 20}];
    };
};

if (_mg isEqualTo "KA_M814") exitWith {
	_pr spawn {
        private "_position";
        while {!isNull _this} do {
            _position = ASLtoATL (visiblePositionASL _this);
            uiSleep 0.05;
        };
		private _vehs = _position nearEntities [["Air", "Car", "Ship"], 7];
		if ((count _vehs) > 0) then {
			{
				private _locked = locked _x;
				if (_locked isEqualTo 2) then {
					if(local _x) then {
						_x lock 0;
					} else {
						[_x,0] remoteExecCall ["life_fnc_lockVehicle",_x];
					};
				};
			} forEach _vehs;
		};
		
        [_position] remoteExec ["ALF_fnc_iem",playableUnits select {_x distance _position < 8}];
    };
};

if (_mg isEqualTo "KA_M84") exitWith {
	_pr spawn {
        private "_position";
        while {!isNull _this} do {
            _position = ASLtoATL (visiblePositionASL _this);
            uiSleep 0.05;
        };
        [_position] remoteExec ["ALF_fnc_stunGrenade",playableUnits select {_x distance _position < 20}];
    };
};

if ((currentWeapon _unit isEqualTo primaryWeapon _unit) && primaryWeapon _unit isEqualTo "ALF_CanneAPeche" && !ALF_PecheEnCours) exitWith {
	[] spawn ALF_fnc_peche;
};

if(_ammo isKindOf "Melee") then {
	_cfg = (configFile>>"CfgAmmo">>_ammo>>"Melee");
	_anim = getText(_cfg>>"anim");
	_unit playActionNow _anim;
};

if(currentWeapon _unit isEqualTo "ALF_Hache" && {cursorObject isKindOf "House_F"} && {life_mediclevel > 0}) exitWith {
	if (isNil {(cursorObject getVariable ["ALF_PorteFermer",false])}) exitWith {};
	private _door = [cursorObject,player] call life_fnc_nearestDoor;
	if(_door isEqualTo 0) exitWith {};
	if !(cursorObject getVariable ["ALF_PorteFermer",false]) exitWith {};
	if((time - life_hit_time) > 10) then {life_ALF_Hit = 0;};
	life_hit_time = time;
	life_ALF_Hit = life_ALF_Hit + 1;
	if(life_ALF_Hit >= 5) then {
		cursorObject animateSource [format ["Door_%1_sound_source",_door],1];
		cursorObject animate [format ["Door_%1",_door],1];
		life_ALF_Hit = 0;
		["Info",format["%1 vient d'enfoncer une porte.",name player]] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
	};
};

if(currentWeapon _unit in ["ALF_Hache","ALF_Pioche","ALF_Batte","ALF_Faux","ALF_Couteau"] && {cursorObject isKindOf "Man"} && {(_unit distance cursorObject) < 2.2}) exitWith {
	[currentWeapon _unit] remoteExec ["ALF_fnc_kickSystem",cursorObject];
};

if(currentWeapon _unit isEqualTo "ALF_Pioche" && {(_unit distance cursorObject) < 1.5}) exitWith {
	if(typeOf cursorObject isEqualTo "Land_ALF_Pierre") exitWith {
		if(alf_niv_minage >= 0) then {
			["ALF_pierre_small",0] spawn ALF_fnc_minageSystem;
		} else {
			["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;
		};
	};
	if(typeOf cursorObject isEqualTo "Land_ALF_Pierre_cui") exitWith {
		if(alf_niv_minage >= 1) then {
			["ALF_pierre_cui_small",1] spawn ALF_fnc_minageSystem;
		} else {
			["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;
		};
	};
	if(typeOf cursorObject isEqualTo "Land_ALF_Pierre_fer") exitWith {
		if(alf_niv_minage >= 2) then {
			["ALF_pierre_fer_small",2] spawn ALF_fnc_minageSystem;
		} else {
			["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;
		};
	};
	if(typeOf cursorObject isEqualTo "Land_ALF_Pierre_saphir") exitWith {
		if(alf_niv_minage >= 5) then {
			["ALF_saphir_small",3] spawn ALF_fnc_minageSystem;
		} else {
			["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;
		};
	};
	if(typeOf cursorObject isEqualTo "Land_ALF_Pierre_dia") exitWith {
		if(alf_niv_minage >= 8) then {
			["ALF_pierre_dia_small",3] spawn ALF_fnc_minageSystem;
		} else {
			["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;
		};
	};
	if(typeOf cursorObject isEqualTo "Land_ALF_Pierre_or") exitWith {
		if(alf_niv_minage >= 9) then {
			["ALF_Pepite_Or",3] spawn ALF_fnc_minageSystem;
		} else {
			["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;
		};
	};
};

if(currentWeapon _unit isEqualTo "ALF_Hache" && {(_unit distance cursorObject) < 15} && {_unit distance getMarkerPos "wood_zone" < 251}) exitWith {
	if(alf_niv_recolte >= 2) exitWith {
		[3] spawn ALF_fnc_woodSystem;
	};
};

if(currentWeapon _unit isEqualTo "ALF_Hache" && {(_unit distance cursorObject) < 15} && {b_18}) exitWith {
	[] spawn ALF_fnc_woodSystemDIR;
};
