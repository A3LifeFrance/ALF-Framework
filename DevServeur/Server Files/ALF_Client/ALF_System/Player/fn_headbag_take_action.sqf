/*
	File: fn_headbag_take_action.sqf
	Auhtor: ALF Team
*/
private _target = _this select 0;

if (isNull _target) exitWith {};

if ((headgear _target) isEqualTo "ALF_Headbag") then {
	if (player canAdd "ALF_Headbag") then {
		["ALF_Headbag", true] call life_fnc_handleItem;
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		_target remoteExec ["removeHeadgear", _target];
	} else {
		["ERREUR","Vous n'avez pas assez de place sur vous.","warning"] spawn ALF_fnc_doMsg;
	};
};