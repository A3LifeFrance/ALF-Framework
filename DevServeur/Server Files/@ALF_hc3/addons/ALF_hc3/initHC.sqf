/*
	File: fn_initHC.sqf
	Author: Nanou
*/
ALF_hc3_extDB_notLoaded = "";

diag_log "-------------------------------------------------------------------------------------------------------------------";
diag_log "-------------------------------- Starting initialization of 'extDB3-HC3' ------------------------------------------";
diag_log "-------------------------------------------------------------------------------------------------------------------";

if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	life_sql_id = compileFinal (if(life_sql_id isEqualType "") then {life_sql_id} else {str(life_sql_id)});

	uiNamespace setVariable ["life_sql_id",life_sql_id];

	try {
		private _result = "extDB3" callExtension format["9:ADD_DATABASE:%1",getText(missionConfigFile >> "CfgServer" >> "DatabaseName")];
		if !(_result isEqualTo "[1]") then {throw "extDB3 HC_3: Error with Database Connection"};
		_result = "extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",call life_sql_id,getText(missionConfigFile >> "CfgServer" >> "DatabaseName")];
		if !(_result isEqualTo "[1]") then {throw "extDB3 HC_3: Error with Database Connection"};
	} catch {
		ALF_hc3_extDB_notLoaded = [true, _exception];
	};

	publicVariable "ALF_hc3_extDB_notLoaded";
	if(ALF_hc3_extDB_notLoaded isEqualType []) exitWith {};
	"extDB3" callExtension "9:LOCK";
	diag_log "extDB3 HC_3: Connected to Database";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
};
if(ALF_hc3_extDB_notLoaded isEqualType []) exitWith {};

HC3_Life = clientOwner;
publicVariable "HC3_Life";

[] spawn HC_fnc_countDownForfait;
[] spawn HC_fnc_countDownBracelet;
[] spawn HC_fnc_countDownPrison;
[] spawn HC_fnc_feuTricolore;
[] spawn HC_fnc_casseFeuTricolore;
[] spawn HC_fnc_appleSystem;
[] spawn HC_fnc_eboueurSystem;
[] spawn HC_fnc_raisinSystem;
[] spawn HC_fnc_cleanup;
[] spawn HC_fnc_initReboot;
[] spawn HC_fnc_feuForet;
[] spawn HC_fnc_tresorSystem;

[] spawn {
	{
		[_x] spawn HC_fnc_ambientAnim;
		[_x,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
	} forEach [gaga_1,croupier_1];
};

/*	Tel Fonction
HC_fnc_hasTel = {
	params [
		["_unit",objNull,[objNull]]
	];

	private _return = false;

	private _allItems = (assignedItems _unit) + ((getItemCargo (uniformContainer _unit)) select 0) + ((getItemCargo (vestContainer _unit)) select 0) + ((getItemCargo (backpackContainer _unit)) select 0);
	_allItems = _allItems arrayIntersect _allItems;

	{
		private _phone = _x;
		{
			if (_x find _phone > -1) exitWith {
				_return = true;
			};
		} forEach _allItems;
		if (_return) exitWith {};
	} forEach ["alf_3310","alf_iphone","alf_neogend","alf_sony"];

	_return
};
*/

//Prison bip bip
private _object = [11006.8,3743.75,0] nearObjects ["Land_ALF_Prison_Part2",20];
_object = _object select 0;
_pos1 = AGLToASL (_object modelToWorld [11.2549,5.49805,-2.15601]);
_pos2 = AGLToASL (_object modelToWorld [11.3213,4.75586,-2.19031]);
[{
	_prison = (_this select 0) select 0;
	_ins = lineIntersectsSurfaces [
		(_this select 0) select 1,
		(_this select 0) select 2,
		_prison,
		objNull,
		true,
		1,
		"GEOM",
		"NONE"
	];
	if (count _ins == 0) exitWith {};
	if (((_ins select 0) select 3) isKindOf "Man" && {(!((weapons ((_ins select 0) select 3)) isEqualTo []))}) then {
        playSound3D ["ALF_Client2\sounds\ALF_CB1.ogg", objNull, false, ((_ins select 0) select 0), 1, 1, 35];
    };
}, 0, [_object,_pos1,_pos2]] call CBA_fnc_addPerFrameHandler;

disableRemoteSensors true;

ALF_allAmbianceFeux = [];
ALF_fireON = false;

ALF_hc3_ready = true;
publicVariable "ALF_hc3_ready";

diag_log "---------------------------- HC3 is Ready -------------------------------";
diag_log "-------------------------------------------------------------------------";
