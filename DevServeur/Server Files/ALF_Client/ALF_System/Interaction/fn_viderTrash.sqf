/*
    File: fn_viderTrash.sqf
    Author: ALF Dev Team
*/
params [
	["_obj",objNull,[objNull]]
];

if (isNull _obj) exitWith {};

private _c = {_x isEqualTo "ALF_Dechets"} count (magazineCargo _obj);
if(_c < 2) exitWith {["INFO", "La poubelle a déjà été vidée récemment.", "danger"] spawn ALF_fnc_doMsg;};

if ((count(nearestObjects [player, ["V_ALF_Camion_Poubelle"], 10])) < 1) exitWith {["ERREUR", "Il n'y a aucun camion poubelle à proximité.", "danger"] spawn ALF_fnc_doMsg;};
private _camion = (nearestObjects [player, ["V_ALF_Camion_Poubelle"], 10]) select 0;

titleText["La poubelle se fait vider ....","PLAIN"];
clearMagazineCargoGlobal _obj;

uiSleep 2;

private _gain = _c * 250;
life_cash = life_cash + _gain;

[0,15] spawn ALF_fnc_addXP;

["INFO", format["La poubelle est maintenant vide. Vous avez reçu %1€ en liquide.",_gain], "success"] spawn ALF_fnc_doMsg;