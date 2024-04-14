/*
	File: fn_changerIdentitee.sqf
	Author: ALF NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_text","",[""]]
];

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	case 0: {
		if(!(createDialog "ALF_IdentiteeSR")) exitWith {};
		ctrlSetText[574382,(name player)];
	};

	case 1: {
		if (_text isEqualTo "") exitWith {};
		player setVariable ["IdentititeFausse",_text];
		["INFO", format ["Vous avez changé votre identité en %1",_text], "warning"] spawn ALF_fnc_doMsg;
		closeDialog 0;
	};
};