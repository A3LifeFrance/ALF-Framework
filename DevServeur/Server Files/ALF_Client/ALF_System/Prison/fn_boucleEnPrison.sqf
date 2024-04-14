/*
	File: fn_boucleEnPrison.sqf
	Author: ALF Team
*/
params [
	["_temps",-1,[0]]
];

if (_temps > 0) then {
	ALF_TimePrison = _temps;
};

private _time = time;

waitUntil {
	if ((time - _time) >= 1) then {
		ALF_TimePrison = ALF_TimePrison - 1;
		_time = time;
	};
	!(player getVariable ["ALF_EnPrison",false]) || {ALF_TimePrison <= 0} || {(player distance [11005.1,3701.35,0.00239563]) >= 500 && {player distance (getMarkerPos "respawn_civilian") > 400}}
};

if (ALF_TimePrison <= 0) exitWith {
	[player] remoteExecCall ["HC_fnc_sortiePrison",HC_Life];
	[4320, player] remoteExecCall ["HC_fnc_braceletElectronique",HC_Life];
	player setVariable ["ALF_EnPrison",false,true];
	ALF_Prison = false;

	private _coffre = call compile format ["alf_coffre_prison_%1",ALF_Prison_Coffre];
	[_coffre,1] remoteExec ["HC_fnc_customCoffre",HC_Life];
	[_coffre,3] remoteExec ["HC_fnc_customCoffre",HC_Life];

	ALF_Prison_Coffre = 0;
	player setPosATL [11014.2,3807.91,0.0014286];
	player setDir 205.515;
};

if ((player distance [11005.1,3701.35,0.00239563]) >= 500) exitWith {
	player setVariable ["ALF_EnPrison",false,true];
	[player] remoteExecCall ["HC_fnc_sortiePrison",HC_Life];
	["Prison", "Evasion d'un prisonnier.", "danger"] remoteExecCall ["HC_fnc_doPenitCall",HC_Life];
	["Prison", "Evasion d'un prisonnier."] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
	ALF_Prison = false;

	private _coffre = call compile format ["alf_coffre_prison_%1",ALF_Prison_Coffre];
	[_coffre,1] remoteExec ["HC_fnc_customCoffre",HC_Life];
	[_coffre,3] remoteExec ["HC_fnc_customCoffre",HC_Life];

	ALF_Prison_Coffre = 0;
};

if (!(player getVariable ["ALF_EnPrison",false]) && {ALF_Prison}) then {
	ALF_Prison = false;

	private _coffre = call compile format ["alf_coffre_prison_%1",ALF_Prison_Coffre];
	[_coffre,1] remoteExec ["HC_fnc_customCoffre",HC_Life];
	[_coffre,3] remoteExec ["HC_fnc_customCoffre",HC_Life];
	
	ALF_Prison_Coffre = 0;
};
