#include "\ALF_Client\script_macros.hpp"
/*
File: virerBusiness.sqf
Author: ALF Nanou
*/
private["_business"];
_business = _this select 0;

if((lbCurSel 29506) isEqualTo -1) exitWith {};
_ctrl = lbData[29506,lbCurSel(29506)];
_data = call compile format["%1",_ctrl];
private _namemember = _data select 0;
private _uidmember = _data select 1;

private _myUid = getPlayerUID player;
if(_uidmember isEqualTo _myUid) exitWith {["INFO","Tu ne peux pas te virer toi même.","warning"] spawn ALF_fnc_doMsg;};

private _var = _business getVariable ["business",[]];
private _membres = _var select 5;
private _secteur = _var select 4;
private _siretstr = _var select 2;

private _action = [format["Es-tu certain de vouloir virer %1 de ton entreprise?",_namemember],"Entreprise","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

_index = [_uidmember,_membres] call TON_fnc_index;
_membres deleteAt _index;

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

[_siretstr,_membres] remoteExec ["HC_fnc_recruterBusiness",HC2_life];

private _unit = playableUnits param [playableUnits findIf {getPlayerUID _x isEqualTo _uidmember}, objNull];
if(isNull _unit) exitWith {};

[1,_secteur,_siretstr] remoteExec ["ALF_fnc_initBusinessPlayer",_unit];
