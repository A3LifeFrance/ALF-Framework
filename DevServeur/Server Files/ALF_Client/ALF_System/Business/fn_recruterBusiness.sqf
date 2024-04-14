#include "\ALF_Client\script_macros.hpp"
/*
File: recruterBusiness.sqf
Author: ALF Nanou
*/
private["_business"];
_business = _this select 0;

private _var = _business getVariable ["business",[]];
private _membres = _var select 5;
private _levelstr = _var select 6;
private _siretstr = _var select 2;
private _secteur = _var select 4;

private _namenew = ctrlText 29513;
private _secunew = ctrlText 29505;

if(_namenew isEqualTo "" OR {_secunew isEqualTo ""}) exitWith {};

private _myuid = getPlayerUID player;
if(_myuid isEqualTo _secunew) exitWith {["INFO","Tu ne peux pas t'ajouter toi même.","warning"] spawn ALF_fnc_doMsg;};

private _exit = false;
{
	private _uidmember = _x select 1;
	if(_secunew isEqualTo _uidmember) exitWith {_exit = true;};
} forEach _membres;
if (_exit) exitWith {["INFO","Cette personne est déjà dans ton personnel.","warning"] spawn ALF_fnc_doMsg;};

private _unit = playableUnits param [playableUnits findIf {getPlayerUID _x isEqualTo _secunew}, objNull];
if (isNull _unit) exitWith {["INFO","Cette personne n'existe pas.","warning"] spawn ALF_fnc_doMsg;};

missionNamespace setVariable ["ALF_DemandeEmployee",""];
[2] remoteExecCall ["ALF_fnc_initBusinessPlayer",_unit];
waitUntil{(missionNamespace getVariable "ALF_DemandeEmployee") isEqualType false};
if (missionNamespace getVariable "ALF_DemandeEmployee") exitWith {
	["INFO","Cette personne est déjà employée.","warning"] spawn ALF_fnc_doMsg;
};

if(_levelstr isEqualTo 0 && {count _membres > 5}) exitWith {["INFO","Il faut agrandir ton batiment si tu veux embaucher plus de monde.","warning"] spawn ALF_fnc_doMsg;};

private _action = [format["Es-tu certain de vouloir recruter %1  dans ton entreprise?",_namenew],"Entreprise","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

_membres pushBack [_namenew,_secunew,1];
_var set[5,_membres];

_business setVariable ["business",_var,true];

private _display = findDisplay 29500;
private _list = _display displayCtrl 29506;

lbClear _list;
{
	private _membername = _x select 0;
	_list lbAdd format["%1",_membername];
	_list lbSetdata [(lbSize _list)-1,format["%1",_x]];
} forEach _membres;

["INFO",format["Tu viens d'etre recruter dans l'entreprise de %1.",name player],"success"] remoteExec ["ALF_fnc_doMsg",_unit];
[0,_secteur,_siretstr] remoteExec ["ALF_fnc_initBusinessPlayer",_unit];
[_siretstr,_membres] remoteExec ["HC_fnc_recruterBusiness",HC2_life];
