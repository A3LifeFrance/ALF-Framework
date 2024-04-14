/*
    File: fn_ambientFire.sqf
    Author: NiiRoZz
*/
while {!(ALF_allAmbianceFeux isEqualTo [])} do {
	{
		if ((nearestObjects [(_x select 0), ["ALF_GrosFeuForet","ALF_MoyenFeuForet"], 10, true]) isEqualTo []) then {
			deleteVehicle (_x select 0);
			deleteVehicle (_x select 1);
		};
	} forEach ALF_allAmbianceFeux;
	ALF_allAmbianceFeux = ALF_allAmbianceFeux - [objNull];
	uiSleep 2;
};

["BRAVO","VOUS AVEZ ETEINT L'INCENDIE DE FORET !!"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];

[100000] remoteExecCall ["HC_fnc_updateCNP",HC_life];

//[1500] remoteExec ["ALF_fnc_addXP",(playableUnits select {_x getVariable ["MedService",false]})];