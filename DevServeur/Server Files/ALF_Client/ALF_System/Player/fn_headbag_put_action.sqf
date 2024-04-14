/*
	File: fn_headbag_put_action.sqf
	Auhtor: ALF Team
*/
private _target = _this select 0;

if (life_action_inUse) exitWith {};
if (isNull _target) exitWith {};

if (([_target] call ALF_fnc_checkMenotter) || {[_target] call ALF_fnc_checkSurrender}) then {
	if ("ALF_Headbag" in items player) then {
		["ALF_Headbag", false] call life_fnc_handleItem;
		life_action_inUse = true;
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil {((animationState player) isEqualTo "ainvpercmstpsnonwnondnon_putdown_amovpercmstpsnonwnondnon")};
		[] remoteExec ["ALF_fnc_headbag_put_target", _target];
		life_action_inUse = false;
	} else {
		["ERREUR","Vous n'avez pas de cagoule.","warning"] spawn ALF_fnc_doMsg;
	};
} else {
	["ERREUR","La personne doit être attachée ou avoir les mains sur ma tête.","warning"] spawn ALF_fnc_doMsg;
};
