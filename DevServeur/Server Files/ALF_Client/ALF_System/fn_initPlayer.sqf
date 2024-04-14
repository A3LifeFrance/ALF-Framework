#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_initPlayer.sqf
	Author: ALF Team

	Description:
	Initializes the people.
*/
waitUntil {sleep 0.3; !(isNull (findDisplay 46))};

if(ALF_Prison) then {
	if(life_is_alive) then {
		player setPosATL life_civ_position;
	} else {
		player setPosATL [11005.1,3701.35,0.00239563];
		player setDamage 1;
	};
	[-1] spawn ALF_fnc_boucleEnPrison;
} else {
	if (life_is_alive) then {
		if(life_playerfirstjoinserver) then {
			ALF_PlayingVideo = false;
			[] spawn ALF_fnc_spawnVideo;
			waitUntil {sleep 0.5; ALF_PlayingVideo};
			[getPlayerUID player] remoteExecCall ["HC_fnc_FirstJoinServer",HC_Life];
		} else {
			player setPosATL life_civ_position;
		};
	} else {
		player setPosATL life_civ_position;
		player setDamage 1;
	};
};

[3] call SOCK_fnc_updatePartial; //Alive + POS

/*
if(life_coplevel > 0) then {
	player addAction["Monter en conducteur",ALF_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorObject && {(locked cursorObject) != 0} && {cursorObject distance player < 5} && {(typeOf cursorObject) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_1400GTR","V_ALF_Berlingo_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Vito_G_SR","V_ALF_Passat_GND","V_ALF_DV15_Gendarmerie","ALF_Stinger_GND"]}'];
	player addAction["Monter en passager",ALF_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorObject && {(locked cursorObject) != 0} && {cursorObject distance player < 5} && {(typeOf cursorObject) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_1400GTR","V_ALF_Berlingo_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Vito_G_SR","V_ALF_Passat_GND","V_ALF_DV15_Gendarmerie","ALF_Stinger_GND"]}'];
	player addAction["Descendre",ALF_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && {locked(vehicle player) isEqualTo 2} && {typeOf (vehicle player) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_1400GTR","V_ALF_Berlingo_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Vito_G_SR","V_ALF_Passat_GND","V_ALF_DV15_Gendarmerie","ALF_Stinger_GND"]}'];
};
if(life_mediclevel > 0) then {
	player addAction["Monter en conducteur",ALF_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorObject && {(locked cursorObject) != 0} && {cursorObject distance player < 5} && {(typeOf cursorObject) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Scania_P","V_ALF_Titan_SMUR","V_ALF_Titan_Pompier","V_ALF_Sprinter_Pompier","V_ALF_Berlingo_Pompier","V_ALF_DV15_Pompier"]}'];
	player addAction["Monter en passager",ALF_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorObject && {(locked cursorObject) != 0} && {cursorObject distance player < 5} && {(typeOf cursorObject) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Scania_P","V_ALF_Titan_SMUR","V_ALF_Titan_Pompier","V_ALF_Sprinter_Pompier","V_ALF_Berlingo_Pompier","V_ALF_DV15_Pompier"]}'];
	player addAction["Descendre",ALF_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && {locked(vehicle player) isEqualTo 2} && {typeOf (vehicle player) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Scania_P","V_ALF_Titan_SMUR","V_ALF_Titan_Pompier","V_ALF_Sprinter_Pompier","V_ALF_Berlingo_Pompier","V_ALF_DV15_Pompier"]}'];
};
*/

[] call ALF_fnc_setupKeyBinding;

setViewDistance 500;

//Teamspeak
ALF_Teamspeak_Plugin_Enabled = false;
ALF_Teamspeak_Server_Enabled = false;
ALF_Teamspeak_Channel_Enabled = false;
if (life_adminlevel isEqualTo 0) then {
	[{
		if !(call TFAR_fnc_isTeamSpeakPluginEnabled) then {
			if !(ALF_Teamspeak_Plugin_Enabled) then {
				ALF_Teamspeak_Plugin_Enabled = true;
				"teamspeakPlugin" cutText ["Merci d'activer votre plugin sur ts3 || TS3 -> Settings -> Plugins","BLACK FADED"];
				"teamspeakPlugin" cutFadeOut 99999999;
			};
		} else {
			if (ALF_Teamspeak_Plugin_Enabled) then {
				ALF_Teamspeak_Plugin_Enabled = false;
				"teamspeakPlugin" cutText ["","BLACK IN"];
			};
		};

		_serverts = [] call TFAR_fnc_getTeamSpeakServerName;
		_channelts = [] call TFAR_fnc_getTeamSpeakChannelName;

		if !(_serverts isEqualTo "ArmA 3 France Life - Teamspeak Officiel") then {
			if !(ALF_Teamspeak_Server_Enabled) then {
				ALF_Teamspeak_Server_Enabled = true;
				"teamspeakServ" cutText ["Vous devez etre sur l'onglet de notre teamspeak pour pouvoir jouer.","BLACK FADED"];
				"teamspeakServ" cutFadeOut 99999999;
			};
		} else {
			if (ALF_Teamspeak_Server_Enabled) then {
				ALF_Teamspeak_Server_Enabled = false;
				"teamspeakServ" cutText ["","BLACK IN"];
			};
		};

		if !(_channelts isEqualTo "[cspacer12]TASK FORCE RADIO") then {
			if !(ALF_Teamspeak_Channel_Enabled) then {
				ALF_Teamspeak_Channel_Enabled = true;
				"teamspeakChannel" cutText ["Vous devez etre sur l'onglet de notre teamspeak pour pouvoir jouer.","BLACK FADED"];
				"teamspeakChannel" cutFadeOut 99999999;
			};
		} else {
			if (ALF_Teamspeak_Channel_Enabled) then {
				ALF_Teamspeak_Channel_Enabled = false;
				"teamspeakChannel" cutText ["","BLACK IN"];
			};
		};
	}, 10] call CBA_fnc_addPerFrameHandler;
};

//Playtime + AutoSync
[{
	ALF_PlayTime = ALF_PlayTime + 10;
	[getPlayerUID player,ALF_PlayTime] remoteExec ["HC_fnc_playTime",HC_Life];

	[] spawn ALF_fnc_paycheck;
}, 600] call CBA_fnc_addPerFrameHandler;

//Ajout des markers lorsqu'on ouvre la carte
addMissionEventHandler ["Map",{
	if (_this select 0) then {
		switch (true) do {
			case (life_copLevel > 0): {
				[] spawn ALF_fnc_copMarkers;
			};
			case (life_medicLevel > 0): {
				[] spawn life_fnc_medicMarkers;
			};
			default {
				[] spawn ALF_fnc_civMarkers;
			};
		};
	};
}];
if(life_adminlevel > 1) then {
	player addAction ["Cheveux Noirs", {player setObjectTextureGlobal [0, "\ALF_Perso\textures\T_Chr0010_hair_C.paa"]}, "", 4, true, true, "", "(uniform player) == ""U_ALF_Vegeta"""];
	player addAction ["Cheveux Jaunes", {[] spawn {_smoke = createVehicle ["SmokeShellYellow", (getPos player), [], 0, "CAN_COLLIDE"]; _smoke attachTo [player, [0, 0, -0.1], ""]; uisleep 6; deleteVehicle _smoke; uisleep 2; player setObjectTextureGlobal [0, "\ALF_Perso\textures\T_Chr0010_hair_C_Yellow.paa"]; player say3D ["son1", 20, 1,false];}}, "", 3, true, true, "", "(uniform player) == ""U_ALF_Vegeta"""];
	player addAction ["Cheveux Rouges", {[] spawn {_smoke = createVehicle ["SmokeShellRed", (getPos player), [], 0, "CAN_COLLIDE"]; _smoke attachTo [player, [0, 0, -0.1], ""]; uisleep 6; deleteVehicle _smoke; uisleep 2; player setObjectTextureGlobal [0, "\ALF_Perso\textures\T_Chr0010_hair_C_Red.paa"]; player say3D ["son1", 20, 1,false];}}, "", 2, true, true, "", "(uniform player) == ""U_ALF_Vegeta"""];
	player addAction ["Cheveux Bleus", {[] spawn {_smoke = createVehicle ["SmokeShellBlue", (getPos player), [], 0, "CAN_COLLIDE"]; _smoke attachTo [player, [0, 0, -0.1], ""]; uisleep 6; deleteVehicle _smoke; uisleep 2; player setObjectTextureGlobal [0, "\ALF_Perso\textures\T_Chr0010_hair_C_Blue.paa"]; player say3D ["son1", 20, 1,false];}}, "", 1, true, true, "", "(uniform player) == ""U_ALF_Vegeta"""];
};
if (life_adminlevel < 3) then {
	showChat false;
};

//Test de la nuit plus belle
_adjustLight = {
	_brightness = if (CHBN_adjustBrightness > 0) then {200 * abs (1 - (2 ^ CHBN_adjustBrightness))} else {0};
	CHBN_light setLightAttenuation [10e10,(30000 / (_brightness max 10e-10)),4.31918e-005,4.31918e-005];
	CHBN_light setLightAmbient CHBN_adjustColor;
};

CHBN_adjustBrightness = missionNamespace getVariable ["CHBN_adjustBrightness",1.10];
CHBN_adjustColor = missionNamespace getVariable ["CHBN_adjustColor",[0.3,0.5,1]];

if (!isNil "CHBN_light") then {deleteVehicle CHBN_light};
CHBN_light = "#lightpoint" createVehicleLocal [0,0,0];
CHBN_light setLightBrightness 1;
CHBN_light setLightDayLight false;
call _adjustLight;

//Maladies
if (count(alf_deseases) > 0) then {
	[] spawn {
		{
			[(_x select 0)] spawn ALF_fnc_handleDesease;
		} forEach alf_deseases;
	};
};

private _cacheStaticModels = [];
private _vehicleClasses = "isClass _x && (configName _x) isKindOf 'Static'" configClasses (configFile >> "CfgVehicles");

{
    private _model = getText (_x >> "model");
    if (_model != "") then {
        private _array = _model splitString "\";
        _cacheStaticModels pushBackUnique toLower (_array select ((count _array) - 1));
    };
} forEach _vehicleClasses;

private _nonAIVehicleClasses = "isClass _x" configClasses (configFile >> "CfgNonAIVehicles");

private _cfgBase = configFile >> "CfgNonAIVehicles";
{
    private _model = getText (_x >> "model");
    if (_model != "") then {
        private _array = _model splitString "\";
        _cacheStaticModels pushBackUnique toLower (_array select ((count _array) - 1));
    };
} forEach (_nonaivehicleClasses select {(configName _x) isKindOf ["Bridge_base_F", _cfgBase]});

uiNamespace setVariable ["cacheStaticModels", compileFinal str _cacheStaticModels];
