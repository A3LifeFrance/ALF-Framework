/*
	File: fn_inCallSystem.sqf
	Author: ALF Team
*/
params [
	["_player1",objNull,[objNull]],
	["_player2",objNull,[objNull]]
];
if(isNull _player1 OR {isNull _player2}) exitWith {};

//Start call
private _callID = random[10000000,50000000,99999999];
[_callID] remoteExec ["ALF_fnc_callInProgress",_player1];
[_callID] remoteExec ["ALF_fnc_callInProgress",_player2];

for "_i" from 0 to 1 step 0 do {
	if(isNull _player1 OR {isNull _player2}) exitWith {};
	if(_player1 getVariable ["call_info",0] isEqualTo 0) exitWith {};
	if(_player2 getVariable ["call_info",0] isEqualTo 0) exitWith {};
	uiSleep 0.01;
};

if(isNull _player1 OR {_player1 getVariable ["call_info",0] isEqualTo 0}) exitWith {
	if !(isNull _player2) then {
		[] remoteExecCall ["ALF_fnc_endCall",_player2];
	};
};
if(isNull _player2 OR {_player2 getVariable ["call_info",0] isEqualTo 0}) exitWith {
	if !(isNull _player1) then {
		[] remoteExecCall ["ALF_fnc_endCall",_player1];
	};
};
