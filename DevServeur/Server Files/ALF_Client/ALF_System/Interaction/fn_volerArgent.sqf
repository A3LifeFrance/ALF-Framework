/*
	File: fn_volerArgent.sqf
	Author: ALF - NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_target",objNull,[objNull]]
];

if (_mode isEqualTo -1 || {isNull _target}) exitWith {};

switch (_mode) do {
	case 0: {
		[1,player] remoteExecCall ["ALF_fnc_volerArgent",_target];
	};

	case 1: {
		private _cash = floor (life_cash / 2);
		life_cash = life_cash - _cash;
		[2,player,_cash] remoteExecCall ["ALF_fnc_volerArgent",_target];
	};

	case 2: {
		private _cash = param [2, -1, [0]];
		if (_cash isEqualTo -1) exitWith {["Criminel", "Erreur lors du vol", "warning", false] spawn ALF_fnc_doMsg;};

		life_cash = life_cash + _cash;
		[name player,getPlayerUID player,"VOL",format["A volé %1€ en liquide à %2 | CASH = %3€",_cash,name _target,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		["Criminel", format["Tu as volé %1€.",_cash], "success", false] spawn ALF_fnc_doMsg;
	};
};