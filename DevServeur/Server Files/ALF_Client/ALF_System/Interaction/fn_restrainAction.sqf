#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
*/
private _unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if ((player distance _unit > 3)) exitWith {};
if ([_unit] call ALF_fnc_checkMenotter) exitWith {};
if (player isEqualTo _unit) exitWith {};
if !(isPlayer _unit) exitWith {};
if !(currentWeapon _unit isEqualTo "") exitWith {["INFO", "Cette personne tient une arme dans la main.", "danger"] spawn ALF_fnc_doMsg;};

["ALF_Menottes",false] spawn life_fnc_handleItem;
["ALF_cle_M",true] spawn life_fnc_handleItem;

[player] remoteExec ["ALF_fnc_restrain",_unit];
[player,"ALF_Menottes"] remoteExecCall ["life_fnc_say3D",0];
["INFO", "Cette personne est menottée.", "success"] spawn ALF_fnc_doMsg;
