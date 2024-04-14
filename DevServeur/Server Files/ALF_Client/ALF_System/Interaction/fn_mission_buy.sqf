params [
	["_mission", "", [""]]
];
if (_mission isEqualTo "") exitWith {};

private _config = missionConfigFile >> "ALF_MISSIONS" >> _mission;
if (!(isClass(_config))) exitWith {};

private _price = getNumber(_config >> "prix");
if (life_cash < _price) exitWith {
	["ERREUR", format["Vous n'avez pas %1 € sur vous.",_price], "warning"] spawn ALF_fnc_doMsg;
};

uiSleep(random(1) + 0.1);

if ((time - life_action_delay) < 2) exitWith {};
life_action_delay = time;

if (_price > 0) then {
	life_cash = life_cash - _price;
	[0] call SOCK_fnc_updatePartial;
};

private _position = ([getArray(_config >> "positions")] call CBA_fnc_shuffle) call BIS_fnc_selectRandom;

[1,ALF_Phone_Number,ALF_Phone_Number,format["La livraison arrivera en %1 dans 10 minutes environ.", mapGridPosition _position]] remoteExecCall ["HC_fnc_sendSmsPhone",HC3_Life];
["/!\ ALERTE /!\",format["D'après nos informations, une %1 aurait été apperçue.",getText(_config >> "name")]] remoteExec ["ALF_fnc_doBfmCrime",(playableUnits select {alive _x})];
[player, _mission, _position] remoteExec ["HC_fnc_mission", HC2_Life];