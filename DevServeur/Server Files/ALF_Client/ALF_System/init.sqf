
/*
	File: init.sqf
	Author: ALF Team
*/
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "---------------------------- Starting Arma Life France Client Init -----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

disableSerialization;
0 cutRsc ["life_progress","BLACK FADED"];
0 cutFadeOut 9999999;
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;

_titleText ctrlSetText format["Initialisation du serveur... (30%1)...","%"];
_progressBar progressSetPosition 0.3;
0 cutFadeOut 99999999;

waitUntil {uiSleep 0.3; !(isNull (findDisplay 46))};
waitUntil {uiSleep 0.3; !isNull player};

life_firstSpawn = true;
life_session_completed = false;

enableSentences false;
[] call compile PreprocessFileLineNumbers "\ALF_Client\ALF_System\configuration.sqf";
player setVariable ["tf_voiceVolume", 0, true];

//Erreur de connection base de donnée.
waitUntil{sleep 0.3; !isNil "ALF_hc1_extDB_notLoaded" && {!isNil "ALF_hc2_extDB_notLoaded"} && {!isNil "ALF_hc3_extDB_notLoaded"}};
if(ALF_hc1_extDB_notLoaded isEqualType [] OR {ALF_hc2_extDB_notLoaded isEqualType []} OR {ALF_hc3_extDB_notLoaded isEqualType []}) exitWith {
	_titleText ctrlSetText "Erreur base de donnée.";
	_progressBar progressSetPosition 0;
	0 cutFadeOut 99999999;
};

//On attend que les HCs soient prets !
waitUntil{sleep 0.3; !isNil "ALF_hc1_ready" && {!isNil "ALF_hc2_ready"} && {!isNil "ALF_hc3_ready"}};
waitUntil{sleep 0.3; ALF_hc1_ready && {ALF_hc2_ready} && {ALF_hc3_ready}};

//On récupère les informations du joueur.
[] call SOCK_fnc_dataQuery;
waitUntil {sleep 0.3; life_session_completed};

_titleText ctrlSetText format["Initialisation de la mission... (60%1)...","%"];
_progressBar progressSetPosition 0.6;
0 cutFadeOut 9999999;

[] call ALF_fnc_setupEVH;

//Initialize Civilian Settings
private _handle = [] spawn ALF_fnc_initPlayer;
waitUntil {sleep 0.3; scriptDone _handle};

//ClientID pour les HCs.
life_fnc_RequestClientId = player;
publicVariableServer "life_fnc_RequestClientId"; 

ALFBOURSE_NbAchat = [];
[player] remoteExecCall ["HC_fnc_loggedBourse",HC_Life];

//On récupère les maisons du joueur et on place les mobiliers.
[player,getPlayerUID player] remoteExecCall ["HC_fnc_fetchPlayerHouses",HC2_Life];

//On récupère les clés des véhicules présent sur le serveur.
if (life_coplevel > 0) then {
	if (life_mediclevel > 0) then {
		[player,3] remoteExecCall ["HC_fnc_getVehiclesKeys",HC2_Life];
	} else {
		[player,1] remoteExecCall ["HC_fnc_getVehiclesKeys",HC2_Life];
	};
} else {
	if (life_mediclevel > 0) then {
		[player,2] remoteExecCall ["HC_fnc_getVehiclesKeys",HC2_Life];
	} else {
		[player,0] remoteExecCall ["HC_fnc_getVehiclesKeys",HC2_Life];
	};
};

setTerrainGrid 25;
enableEnvironment [false, true];
player allowDamage true;

waitUntil {sleep 0.3; !(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];

life_fnc_moveIn = compileFinal "
	life_disable_getIn = false;
	player moveInCargo (_this select 0);
	life_disable_getOut = true;
";

tf_no_auto_long_range_radio = true;
player setVariable ["tf_unable_to_use_radio",true];

[] spawn ALF_fnc_hudSetup;
[] spawn ALF_fnc_survival;
[] spawn ALF_fnc_interaction3D;
player setVariable ["tf_voiceVolume", 1, true];

ALF_itsTimeToLoadTFAR = true;

_titleText ctrlSetText format["Initialisation de TASK FORCE RADIO... (90%1)...","%"];
_progressBar progressSetPosition 0.9;
0 cutFadeOut 9999999;

waitUntil {sleep 0.3; !(ALF_itsTimeToLoadTFAR)};

0 cutText ["","BLACK IN"];

//Fin de l'init du joueur. Si il se reconnect avec un life_is_alive = false, on le bute!!!!!
if !(life_is_alive) then {
	player setDamage 1;
};

disableRemoteSensors true;
