/*
	File: fn_initHC.sqf
	Author: Nanou
*/
ALF_hc1_extDB_notLoaded = "";

diag_log "-------------------------------------------------------------------------------------------------------------------";
diag_log "-------------------------------- Starting initialization of 'extDB3-HC1' ------------------------------------------";
diag_log "-------------------------------------------------------------------------------------------------------------------";

if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	life_sql_id = compileFinal (if(life_sql_id isEqualType "") then {life_sql_id} else {str(life_sql_id)});

	uiNamespace setVariable ["life_sql_id",life_sql_id];

	try {
		private _result = "extDB3" callExtension format["9:ADD_DATABASE:%1",getText(missionConfigFile >> "CfgServer" >> "DatabaseName")];
		if !(_result isEqualTo "[1]") then {throw "extDB3 HC_1: Error with Database Connection"};
		_result = "extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",call life_sql_id,getText(missionConfigFile >> "CfgServer" >> "DatabaseName")];
		if !(_result isEqualTo "[1]") then {throw "extDB3 HC_1: Error with Database Connection"};
	} catch {
		ALF_hc1_extDB_notLoaded = [true, _exception];
	};

	publicVariable "ALF_hc1_extDB_notLoaded";
	if(ALF_hc1_extDB_notLoaded isEqualType []) exitWith {};
	"extDB3" callExtension "9:LOCK";
	diag_log "extDB3 HC_1: Connected to Database";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
};
if(ALF_hc1_extDB_notLoaded isEqualType []) exitWith {};

HC_Life = clientOwner;
publicVariable "HC_Life";

["CALL deleteDeadVehicles",1] call HC_fnc_asyncCall;
["CALL deleteOldForfait",1] call HC_fnc_asyncCall;
["CALL deleteOldSms",1] call HC_fnc_asyncCall;

//[] call HC_fnc_dynamicMarkers_init;
[] spawn HC_fnc_initCNG;
[] spawn HC_fnc_initCNP;
[] spawn HC_fnc_initCoffre;
[] spawn HC_fnc_initBanqueSang;

[] spawn HC_fnc_countService;
[] spawn HC_fnc_startEventFire;
[] spawn HC_fnc_startEventOrgane;
[] spawn HC_fnc_randomEvent;

[] execVM "\ALF_hc\MySQL\Bourse\fn_initBourse.sqf";

ALF_allMarkers_Depanneur = [];
ALF_allMarkers_DIR = [];
ALF_allMarkers_Gendarme = [];
ALF_allMarkers_Pompier = [];
alf_GN_Command = objNull;
ALF_fireON = false;

disableRemoteSensors true;

ALF_hc1_ready = true;
publicVariable "ALF_hc1_ready";

diag_log "---------------------------- HC1 is Ready -------------------------------";
diag_log "-------------------------------------------------------------------------";
