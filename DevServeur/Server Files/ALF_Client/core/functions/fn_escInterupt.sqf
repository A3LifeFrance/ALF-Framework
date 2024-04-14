#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync"];
disableSerialization;
params [
	["_display",displayNull,[displayNull]]
];

if (isNull _display) exitWith {};

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;

	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = CONTROL(49,104);
		_timeStamp = time + 10;

		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};

		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};

	_abortButton = CONTROL(49,104);

	_thread = [] spawn _syncManager;
	waitUntil{scriptDone _thread || {isNull (findDisplay 49)}};
	_abortButton ctrlEnable true;
};

_abortButton = _display displayCtrl 104;
_abortButton buttonSetAction "if(life_session_completed) then {[] call SOCK_fnc_updateRequest;}; [player] remoteExec [""HC_fnc_cleanupRequest"",HC_Life];";
_respawnButton = _display displayCtrl 1010;
_fieldManual = _display displayCtrl 122;

//Block off our buttons first.
_abortButton ctrlEnable false;
_respawnButton ctrlEnable false;
_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.

[] spawn _escSync;
