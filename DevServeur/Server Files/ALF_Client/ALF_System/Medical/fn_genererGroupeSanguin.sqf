/*
	File : fn_genererGroupeSanguin.sqf
	Author: ALF Team
*/
private _random = random 100;

switch (true) do {
	case (_random <= 38): {
		ALF_groupeSanguin = "A+";
	};
	case (_random > 38 && _random <= 74): {
		ALF_groupeSanguin = "O+";
	};
	case (_random > 74 && _random <= 82): {
		ALF_groupeSanguin = "B+";
	};
	case (_random > 82 && _random <= 89): {
		ALF_groupeSanguin = "A_";
	};
	case (_random > 89 && _random <= 95): {
		ALF_groupeSanguin = "O_";
	};
	case (_random > 95 && _random <= 98): {
		ALF_groupeSanguin = "AB+";
	};
	default {
		ALF_groupeSanguin = selectRandom ["B_","AB_"];
	};
};

[20] call SOCK_fnc_updatePartial;