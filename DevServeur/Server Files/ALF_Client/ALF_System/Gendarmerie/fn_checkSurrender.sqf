/*
	File: fn_checkSurrender.sqf
	Author: ALF NiiRoZz

	[] spawn {
		player playActionNow "ALF_Surrender";
		player forceWalk true;
		_unit = player;
		while {true} do {
			hintSilent str (((_unit modelToWorld (_unit selectionPosition "head")) distance (_unit modelToWorld (_unit selectionPosition "RightHandMiddle1"))));
		};
	};
*/
params [
	["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {false};

(_unit getVariable ["ALF_MenotterSurrender",[false,false]]) select 1