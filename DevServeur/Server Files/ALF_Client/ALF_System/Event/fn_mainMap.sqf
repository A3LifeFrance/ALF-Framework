#include "\A3\ui_f\hpp\defineResincl.inc"
/*
    File: fn_mainMap.sqf
    Author: NiiRoZz
*/
disableSerialization;
params [
	["_display",displayNull,[displayNull,controlNull]]
];

_display displayAddEventHandler ["KeyDown",{
	if ((_this select 1) isEqualTo 211) exitWith {
		private _info = ctrlMapMouseOver (findDisplay 12 displayCtrl 51);

		if (_info isEqualTo []) exitWith {};
		
		private _marker = _info select 1;
		if ((_info select 0) isEqualTo "marker" && {_marker find "depanneur_placed" > -1 || {_marker find "dir_placed" > -1} || {_marker find "gendarme_placed" > -1} || {_marker find "pompier_placed" > -1}}) then {
			[_marker] remoteExecCall ["HC_fnc_removeMarker",HC_Life];
		};
		
		true
	};
	if (visibleMap) then {call CBA_EVENTS_fnc_keyHandlerDown};
}];
