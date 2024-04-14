/*
	File: fn_respawned.sqf
	Author: ALF TEAM
*/
private["_handle"];

life_use_atm = true;
life_hunger = 100;
life_thirst = 100;
life_drunk = 0;
if !(ALF_Prison) then {
	_handle = [player] spawn life_fnc_dropItems;
	waitUntil {scriptDone _handle};
	life_cash = 0;
};
life_respawned = false;

//EN VIE
life_is_alive = true;

alf_ms_active = false;
alf_ms_isdead = false;

if (lifeState player isEqualTo "INCAPACITATED") then {
	player setUnconscious false;
};

player allowDamage true;

alf_ms_bpm = 80;
alf_ms_mmHg = 120;
alf_ms_resp = 15;
alf_ms_spo2 = 97;
alf_ms_pain = 0;
alf_ms_bleeding = false;
alf_ms_bouteille = false;
player setVariable ["bouteilleo2",alf_ms_bouteille,HC3_life];

alf_death_effect ppEffectEnable false;
ppEffectDestroy alf_death_effect;

player setVariable ["MedicalStats",[],true];

if (life_radio_connected) then {
	life_radio_connected = false;
	ALF_iPhone_Freq = 0;
	player setVariable ["tf_unable_to_use_radio", true];
	[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
};
ALF_Sony_Freq = 0;
player setVariable ["SonyFreq",0,HC3_Life];
ALF_Sony_FreqAdd = 0;
player setVariable ["SonyFreqAdd",0,HC3_Life];

player setVariable ["tf_voiceVolume", 1, true];
player setVariable ["ReviveMedic",false,true];
alf_deseases = [];
alf_medecine = [];
alf_vaccins = [];

player setVariable ["Reviving",nil,true];

//Load gear for a 'new life'
_handle = [] spawn life_fnc_civLoadout;
waitUntil {sleep 0.3; scriptDone _handle};

//Cleanup of weapon containers near the body & hide it.
private _containers = nearestObjects[player,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers; //Delete the containers.

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if (ALF_Prison) exitWith {
	player setVariable ["ALF_EnPrison",true,true];
	player setPosATL [11005.1,3701.35,0.00239563];
	// Ajouter la position de base
	[] call SOCK_fnc_updateRequest;
};

if(life_coplevel > 0) then {
	player setVariable ["SonyFreq",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllGendarmes",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["SonyFreqAdd",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllGendarmes",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["CopService",life_gendarme_service,[HC_Life,HC3_Life]];
	[0] remoteExecCall ["HC_fnc_priseService",HC3_Life];
	//player addAction["Monter en conducteur",ALF_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorObject && {(locked cursorObject) != 0} && {cursorObject distance player < 5} && {(typeOf cursorObject) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_1400GTR","V_ALF_Berlingo_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Vito_G_SR","V_ALF_Passat_GND","V_ALF_DV15_Gendarmerie"]}'];
	//player addAction["Monter en passager",ALF_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorObject && {(locked cursorObject) != 0} && {cursorObject distance player < 5} && {(typeOf cursorObject) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_1400GTR","V_ALF_Berlingo_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Vito_G_SR","V_ALF_Passat_GND","V_ALF_DV15_Gendarmerie"]}'];
	//player addAction["Descendre",ALF_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && {locked(vehicle player) isEqualTo 2} && {typeOf (vehicle player) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_1400GTR","V_ALF_Berlingo_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Vito_G_SR","V_ALF_Passat_GND","V_ALF_DV15_Gendarmerie"]}'];
};
if(life_mediclevel > 0) then {
	player setVariable ["SonyFreq",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["SonyFreqAdd",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["MedService",life_pompier_service,[HC_Life,HC3_Life]];
	[1] remoteExecCall ["HC_fnc_priseService",HC3_Life];
	//player addAction["Monter en conducteur",ALF_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorObject && {(locked cursorObject) != 0} && {cursorObject distance player < 5} && {(typeOf cursorObject) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Scania_P","V_ALF_Titan_SMUR","V_ALF_Titan_Pompier","V_ALF_Sprinter_Pompier","V_ALF_Berlingo_Pompier","V_ALF_DV15_Pompier"]}'];
	//player addAction["Monter en passager",ALF_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorObject && {(locked cursorObject) != 0} && {cursorObject distance player < 5} && {(typeOf cursorObject) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Scania_P","V_ALF_Titan_SMUR","V_ALF_Titan_Pompier","V_ALF_Sprinter_Pompier","V_ALF_Berlingo_Pompier","V_ALF_DV15_Pompier"]}'];
	//player addAction["Descendre",ALF_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && {locked(vehicle player) isEqualTo 2} && {typeOf (vehicle player) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Scania_P","V_ALF_Titan_SMUR","V_ALF_Titan_Pompier","V_ALF_Sprinter_Pompier","V_ALF_Berlingo_Pompier","V_ALF_DV15_Pompier"]}'];
};
if(life_penit > 0) then {
	player setVariable ["PenitService",life_penit_service,HC_Life];
};
if(life_adminlevel > 1) then {
	player addAction ["Cheveux Noirs", {player setObjectTextureGlobal [0, "\ALF_Perso\textures\T_Chr0010_hair_C.paa"]}, "", 4, true, true, "", "(uniform player) == ""U_ALF_Vegeta"""];
	player addAction ["Cheveux Jaunes", {[] spawn {_smoke = createVehicle ["SmokeShellYellow", (getPos player), [], 0, "CAN_COLLIDE"]; _smoke attachTo [player, [0, 0, -0.1], ""]; uisleep 6; deleteVehicle _smoke; uisleep 2; player setObjectTextureGlobal [0, "\ALF_Perso\textures\T_Chr0010_hair_C_Yellow.paa"]; player say3D ["son1", 20, 1,false];}}, "", 3, true, true, "", "(uniform player) == ""U_ALF_Vegeta"""];
	player addAction ["Cheveux Rouges", {[] spawn {_smoke = createVehicle ["SmokeShellRed", (getPos player), [], 0, "CAN_COLLIDE"]; _smoke attachTo [player, [0, 0, -0.1], ""]; uisleep 6; deleteVehicle _smoke; uisleep 2; player setObjectTextureGlobal [0, "\ALF_Perso\textures\T_Chr0010_hair_C_Red.paa"]; player say3D ["son1", 20, 1,false];}}, "", 2, true, true, "", "(uniform player) == ""U_ALF_Vegeta"""];
	player addAction ["Cheveux Bleus", {[] spawn {_smoke = createVehicle ["SmokeShellBlue", (getPos player), [], 0, "CAN_COLLIDE"]; _smoke attachTo [player, [0, 0, -0.1], ""]; uisleep 6; deleteVehicle _smoke; uisleep 2; player setObjectTextureGlobal [0, "\ALF_Perso\textures\T_Chr0010_hair_C_Blue.paa"]; player say3D ["son1", 20, 1,false];}}, "", 1, true, true, "", "(uniform player) == ""U_ALF_Vegeta"""];
};

//SAUVEGARDE TOTAL.
[] call SOCK_fnc_updateRequest;
