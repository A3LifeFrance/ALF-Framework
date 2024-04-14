#include "\ALF_hc\hc_macros.hpp"
/*
	startEventOrgane
*/

for "_i" from 0 to 1 step 0 do {
	private _c = {_x getVariable ["MedService",false]} count playableUnits;
	if(_c >= 8) then {
		private _r = selectRandom [1,2,3,4];
		if(_r isEqualTo 2) then {
			["URGENCE","VOUS AVEZ 20 MINUTES POUR FAIRE UN TRANSPORT D'ORGANE !! ALLEZ A L'HOPITAL DU PALAIS !!"] remoteExec ["ALF_fnc_doMedCall",(playableUnits select {_x getVariable ["MedService",false]})];

			organe_lp setVariable ["active",true,true];
			for "_i" from 0 to 1200 step 1 do {
				if(organe_sz getVariable ["succes",false]) exitWith {};
				uiSleep 1;
			};
			if(organe_sz getVariable ["succes",false]) then {
				["TRANSPORT","LA MISSION EST UN SUCCES !! LA CNP RECUPERE 2.500€ DE DONS !!"] remoteExec ["ALF_fnc_doMedCall",(playableUnits select {_x getVariable ["MedService",false]})];
				organe_sz setVariable ["succes",false,true];
			} else {
				["TRANSPORT","LA MISSION EST UN ECHEC !! LA PERSONNE EST MORTE..."] remoteExec ["ALF_fnc_doMedCall",(playableUnits select {_x getVariable ["MedService",false]})];
			};
		};
		if(_r isEqualTo 3) then {
			["URGENCE","VOUS AVEZ 20 MINUTES POUR FAIRE UN TRANSPORT D'ORGANE !! ALLEZ A L'HOPITAL DE SAUZON !!"] remoteExec ["ALF_fnc_doMedCall",(playableUnits select {_x getVariable ["MedService",false]})];
			organe_sz setVariable ["active",true,true];
			for "_i" from 0 to 1200 step 1 do {
				if(organe_lp getVariable ["succes",false]) exitWith {};
				uiSleep 1;
			};
			if(organe_lp getVariable ["succes",false]) then {
				["TRANSPORT","LA MISSION EST UN SUCCES !! LA CNP RECUPERE 2.500€ DE DONS !!"] remoteExec ["ALF_fnc_doMedCall",(playableUnits select {_x getVariable ["MedService",false]})];
				organe_lp setVariable ["succes",false,true];
			} else {
				["TRANSPORT","LA MISSION EST UN ECHEC !! LA PERSONNE EST MORTE..."] remoteExec ["ALF_fnc_doMedCall",(playableUnits select {_x getVariable ["MedService",false]})];
			};
		};
	};
	uiSleep (20 * 60);
};
