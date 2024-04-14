#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_restrain2Action.sqf
	Author: Bryan "Tonic" Boardwine
*/
private _unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if ((player distance _unit > 3)) exitWith {};
if ([_unit] call ALF_fnc_checkMenotter) exitWith {};
if (player isEqualTo _unit) exitWith {};
if !(isPlayer _unit) exitWith {};
if !(currentWeapon _unit isEqualTo "") exitWith {["INFO", "Cette personne tient une arme dans la main.", "danger"] spawn ALF_fnc_doMsg;};

["ALF_ZipTies",false] spawn life_fnc_handleItem;

[player] remoteExec ["ALF_fnc_restrain",_unit];
["INFO", "Cette personne est attaché.", "success"] spawn ALF_fnc_doMsg;
