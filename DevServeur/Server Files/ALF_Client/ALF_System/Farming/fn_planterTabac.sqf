#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_planterTabac.sqf
	ALF NiiRoZz
*/
params [
	["_item","",[""]]
];
if (_item isEqualTo "") exitWith {};

if (alf_niv_recolte < 7) exitWith {["INFO", "Tu ne sais pas comment t'y prendre..", "warning"] spawn ALF_fnc_doMsg;};

private _objects = allSimpleObjects [];

if !(vehicle player isEqualTo player) exitWith {["Tabac", "Il faut sortir du véhicule, prend un bain de boue.", "warning", false] spawn ALF_fnc_doMsg;};
if (player distance (getMarkerPos "champ_tabac") > 100) exitWith {["Tabac", "Tu n'es pas dans un champ réservé à la plantation de Tabac.", "warning", false] spawn ALF_fnc_doMsg;};
if (({_x distance player <= 1.5} count _objects) > 0) exitWith {["Tabac", "Tu es trop prêt d'un autre plant de Tabac.", "warning", false] spawn ALF_fnc_doMsg;};
if (({_x distance player <= 200} count _objects) > 500) exitWith {["Tabac", "Le champ de tabac ne supporte pas plus de 500 plants.", "warning", false] spawn ALF_fnc_doMsg;};

[_item,false] spawn life_fnc_handleItem;

private _object = createSimpleObject ["ALF_Objects\ALF_Tabac\ALF_Tabac_1.p3d", getPosWorld player];

[_object,"FAST"] remoteExec ["HC_fnc_tabacSystem",HC3_Life];