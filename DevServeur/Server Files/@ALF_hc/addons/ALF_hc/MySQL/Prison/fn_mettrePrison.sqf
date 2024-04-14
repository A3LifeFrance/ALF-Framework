/*
	File: fn_mettrePrison.sqf
	Author : NiiRoZz
*/
params [
	["_temps",-1,[0]],
	["_unit",objNull,[objNull]]
];

if (isNull _unit || {_temps isEqualTo -1}) exitWith {};

if(_unit getVariable ["ALF_EnPrison",false]) then {
	//IL EST DEJA EN PRISON
	[format["UPDATE players SET jailtime='%2' WHERE playerid='%1'",(getPlayerUID _unit),_temps],1] call HC_fnc_asyncCall;
	[3,[_temps]] remoteExecCall ["ALF_fnc_menuMettrePrison",_unit];
} else {
	//IL N'EST PAS EN PRISON
	[format["UPDATE players SET jail='1', jailtime='%2',jailcoffre='0' WHERE playerid='%1'",(getPlayerUID _unit),_temps],1] call HC_fnc_asyncCall;
	_unit setVariable ["ALF_EnPrison",true,true];
	[2] remoteExecCall ["ALF_fnc_menuMettrePrison",_unit];
	[_temps * 60] remoteExec ["ALF_fnc_boucleEnPrison",_unit];
};
