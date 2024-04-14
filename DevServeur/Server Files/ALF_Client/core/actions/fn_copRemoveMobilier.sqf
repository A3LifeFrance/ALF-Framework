#include "\ALF_Client\script_macros.hpp"
/*
	File : copRemoveMobilier.sqf
	Author: ALF Team

	Description:
	Delete mobilier from house storage
*/
private["_action","_mobilier","_mobiliers"];
_mobilier = param [0,objNull,[objNull]];

private _allHouse = nearestObjects[position player,["House"],20];
private _house = objNull;
if(count _allHouse > 0) then {
	{
		if !(isNil {_x getVariable "ALF_PorteFermer"}) exitWith {
			_house = _x;
		};
		if (count (_x getVariable ["business",[]]) > 0) exitWith {
			_house = _x;
		};
	} forEach _allHouse;
};
if (isNull _house) exitWith {};

_action = ["Veux-tu détruire ce mobilier?","Mobilier","OUI","NON"] call BIS_fnc_guiMessage;

if(_action) then {
	[_mobilier,_house] remoteExecCall ["HC_fnc_deleteDBmobilier",HC2_Life];
	[name player,getPlayerUID player,"MAISON",format["(Gendarme) A détruit %3 | POS : %1 | MAISON : %2", getPos _mobilier, typeOf _house, typeOf _mobilier]] remoteExec ["HC_fnc_logIt",HC3_Life];
};