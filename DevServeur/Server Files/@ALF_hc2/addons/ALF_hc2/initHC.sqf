/*
	File: fn_initHC.sqf
	Author: Nanou
*/
ALF_hc2_extDB_notLoaded = "";

diag_log "-------------------------------------------------------------------------------------------------------------------";
diag_log "-------------------------------- Starting initialization of 'extDB3-HC2' ------------------------------------------";
diag_log "-------------------------------------------------------------------------------------------------------------------";

if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	life_sql_id = compileFinal (if(life_sql_id isEqualType "") then {life_sql_id} else {str(life_sql_id)});
	
	uiNamespace setVariable ["life_sql_id",life_sql_id];

	try {
		private _result = "extDB3" callExtension format["9:ADD_DATABASE:%1",getText(missionConfigFile >> "CfgServer" >> "DatabaseName")];
		if !(_result isEqualTo "[1]") then {throw "extDB3 HC_2: Error with Database Connection"};
		_result = "extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",call life_sql_id,getText(missionConfigFile >> "CfgServer" >> "DatabaseName")];
		if !(_result isEqualTo "[1]") then {throw "extDB3 HC_2: Error with Database Connection"};
	} catch {
		ALF_hc2_extDB_notLoaded = [true, _exception];
	};

	publicVariable "ALF_hc2_extDB_notLoaded";
	if(ALF_hc2_extDB_notLoaded isEqualType []) exitWith {};
	"extDB3" callExtension "9:LOCK";
	diag_log "extDB3 HC_2: Connected to Database";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
};
if(ALF_hc2_extDB_notLoaded isEqualType []) exitWith {};

HC2_Life = clientOwner;
publicVariable "HC2_Life";

/********************** FONCTIONS ************************/

[] call HC_fnc_checkAxa;
[] call HC_fnc_initHouses;
[] call HC_fnc_initLocaux;
[] call HC_fnc_initBusiness;
[] call HC_fnc_initStation;
[] call HC_fnc_initDAB;
[] call HC_fnc_spawnVehicleLaunch;

[] spawn HC_fnc_vehicleAutoSync;
[] execFSM "\ALF_hc2\HC_System\FSM\cleanup.fsm";

disableRemoteSensors true;

/********************************************************/
ALF_hc2_ready = true;
publicVariable "ALF_hc2_ready";

diag_log "---------------------------- HC2 is Ready -------------------------------";
diag_log "-------------------------------------------------------------------------";
