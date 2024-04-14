#include "\ALF_Client\script_macros.hpp"
/*
    File: fn_reparerObjet.sqf
    Author: ALF - NiiRoZz
*/
_terrainobj = (nearestTerrainObjects [player, [], 10, true] select {damage _x >= 1 && {(str _x find ": t_") isEqualTo -1}}) select 0;

if (isNil "_terrainobj") exitWith {
	_terrainobj = (nearestTerrainObjects [player, [], 20, true] select {damage _x >= 1 && {(str _x find ": t_") > -1} && {!(isObjectHidden _x)}}) select 0;
	if !(isNil "_terrainobj") then {
		[_terrainobj] spawn ALF_fnc_bucheronnageDIR;
	} else {
		["DIR", "Il n'y a aucun objet a réparer autour de vous", "danger", false] spawn ALF_fnc_doMsg;
	};
};

private _upp = "Reparation de l'objet";
life_action_inUse = true;
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = GVAR_UINS "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;
for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.2;
	_cP = _cP + 0.035;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};
life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";

//Verification du bon procédé.
if !(alive player) exitWith {};
if (player != vehicle player) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé.","PLAIN"];};
if (isNull _terrainobj) exitWith {};

_terrainobj setDamage 0;