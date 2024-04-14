#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_interactMeth.sqf
  ALF Team
*/
params[
	["_obj",objNull,[objNull]],
	["_mode",0,[0]],
	["_arg","",[""]]
];

if (alf_niv_illegal < 2) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};

switch (_mode) do {
	case 0 : {
		[_obj,player,_arg] remoteExecCall ["HC_fnc_addElement",HC3_Life];
	};
	case 1 : {
		[_obj,player] remoteExec ["HC_fnc_startSynthese",HC3_Life];
	};
	case 2 : {
		[_obj,player] remoteExec ["HC_fnc_startPillon",HC3_Life];
	};
	case 3 : {
		[_obj,player] remoteExec ["HC_fnc_startCrystalise",HC3_Life];
	};
	case 4 : {
		[_obj,player] remoteExecCall ["HC_fnc_recupMeth",HC3_Life];
	};
};