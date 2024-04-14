/*
	File: fn_retirerPermis.sqf
	Author: ALF Team
*/
private _u = _this select 0;
if(isNull _u) exitWith {};

license_driver = false;
[1] call SOCK_fnc_updatePartial;

life_permis_time = true;
[getPlayerUID player] remoteExec ["HC_fnc_permisTime",HC_Life];

["Permis","Ton permis a été retiré.", "warning", false] spawn ALF_fnc_doMsg;
["INFO","Le permis a bien été retirés.","success"] remoteExec ["ALF_fnc_doMsg",_u];
