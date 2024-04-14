/*
	serviceIncendie
*/

if (ALF_fireON) then {
	ALF_fireON = false;
	["INCENDIE","Vous n'êtes plus disponible pour les feux !"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
} else {
	ALF_fireON = true;
	["INCENDIE","Vous êtes disponible pour les feux !"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
};

HC_Life publicVariableClient ALF_fireON;