/*
	File: fn_nextPoints.sqf
	Author: ALF Team
*/

private["_val","_u"];
_u = _this select 0;
_val = _this select 1;
if(isNull _u) exitWith {};

private _sum = life_permis - _val;
if(_sum < 0) then {
	_sum = 0;
};
life_permis = _sum;
[14] call SOCK_fnc_updatePartial;

if(life_permis isEqualTo 0) then {
	["Permis",format["Tu viens de perdre %1 point(s). Il te reste 0 point sur ton permis. Il a été retiré.",_val], "warning", false] spawn ALF_fnc_doMsg;
	license_driver = false;
	life_permis_time = true;
	[getPlayerUID player] remoteExec ["HC_fnc_permisTime",HC_Life];
	[1] call SOCK_fnc_updatePartial;
} else {
	["Permis",format["Tu viens de perdre %1 point(s). Il te reste %2 point(s) sur ton permis.",_val,life_permis], "warning", false] spawn ALF_fnc_doMsg;
};

["INFO","Les points ont bien été retirés.","success"] remoteExec ["ALF_fnc_doMsg",_u];
