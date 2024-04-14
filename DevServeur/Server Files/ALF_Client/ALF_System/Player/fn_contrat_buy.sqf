params [
	["_nbr", 0, [0]]
];
if (_nbr isEqualTo 0) exitWith {};

if (life_cash < 5000) exitWith {
	["ERREUR", "Vous n'avez pas 5000€ sur vous.", "warning"] spawn ALF_fnc_doMsg;
};

if ((time - life_action_delay) < 2) exitWith {};
life_action_delay = time;

life_cash = life_cash - 5000;
[0] call SOCK_fnc_updatePartial;

alf_contrats = alf_contrats + _nbr;

[player, _mission, _position] remoteExec ["HC_fnc_mission", HC2_Life];