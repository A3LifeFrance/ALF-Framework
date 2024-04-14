/*
    File: fn_freezePlayer.sqf
    Author: ALF DEV TEAM
*/
params [
	["_admin",objNull,[objNull]]
];

if (life_adminlevel > 2) exitWith {};

if (userInputDisabled) then {
    ["FREEZE",format["Vous avez défreeze %1.",name player],"success"] remoteExec ["ALF_fnc_doMsg",_admin];
	[name _admin,getPlayerUID _admin,"ADMIN",format["A defreeze %1.",name player]] remoteExec ["HC_fnc_logIt",HC3_Life];
    disableUserInput false;
} else {
    ["FREEZE",format["Vous avez freeze %1.",name player],"success"] remoteExec ["ALF_fnc_doMsg",_admin];
	[name _admin,getPlayerUID _admin,"ADMIN",format["A freeze %1.",name player]] remoteExec ["HC_fnc_logIt",HC3_Life];
    disableUserInput true;
};