/*
	File: fn_checkMenotter.sqf
	Author: ALF NiiRoZz

	[] spawn {
		player playActionNow "ALF_Menotter";
		player forceWalk true;
		_unit = player;
		while {true} do {
			hintSilent str (((_unit modelToWorld (_unit selectionPosition "leaning_axis")) distance (_unit modelToWorld (_unit selectionPosition "RightHandMiddle1"))));
		};
	};
*/
params [
	["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {false};

(_unit getVariable ["ALF_MenotterSurrender",[false,false]]) select 0