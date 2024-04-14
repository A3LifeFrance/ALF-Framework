#include "\ALF_Client\script_macros.hpp"
/*
File: menuBusiness.sqf
Author: ALF Nanou
_data = [_owner,_name,_siret,_capital,_secteur,_membres,_level];
*/
private _building = _this select 0;
private _var = _building getVariable ["business",[]];
if(count _var isEqualTo 0) exitWith {[_building] call ALF_fnc_createBusiness;};
life_pInact_curTarget = _building;

private _owner = _var select 0;
private _namestr = _var select 1;
private _siretstr = _var select 2;
private _capitalstr = _var select 3;
private _secteur = _var select 4;
private _membres = _var select 5;
private _levelstr = _var select 6;

private _uid = getPlayerUID player;
if !(_uid isEqualTo _owner) exitWith {["INFO","N'étant pas le propriétaire, tu n'as pas accès au système.","warning"] spawn ALF_fnc_doMsg;};

if(!dialog) then {
	createDialog "ALF_Business_Dialog";
};
disableSerialization;

private _display = findDisplay 29500;
private _name = _display displayCtrl 29501;
private _siret = _display displayCtrl 29502;
private _capital = _display displayCtrl 29503;
private _level = _display displayCtrl 29504;
private _list = _display displayCtrl 29506;
private _agrandir = _display displayCtrl 29507;
private _recruter = _display displayCtrl 29508;
private _payer = _display displayCtrl 29509;
private _virer = _display displayCtrl 29510;
private _deposer = _display displayCtrl 29512;

private _l1 = _namestr select 0;
private _l2 = _namestr select 1;
private _l3 = _namestr select 2;
private _l4 = _namestr select 3;
private _l5 = _namestr select 4;
private _l6 = _namestr select 5;
private _l7 = _namestr select 6;
private _l8 = _namestr select 7;
private _l9 = _namestr select 8;
private _l10 = _namestr select 9;
private _l11 = _namestr select 10;
private _l12 = _namestr select 11;
private _l13 = _namestr select 12;
private _l14 = _namestr select 13;
private _l15 = _namestr select 14;
private _l16 = _namestr select 15;
private _l17 = _namestr select 16;
private _l18 = _namestr select 17;
private _l19 = _namestr select 18;
private _l20 = _namestr select 19;
private _l21 = _namestr select 20;
private _l22 = _namestr select 21;
private _l23 = _namestr select 22;
private _l24 = _namestr select 23;

private _namefinal = format["%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24",_l1,_l2,_l3,_l4,_l5,_l6,_l7,_l8,_l9,_l10,_l11,_l12,_l13,_l14,_l15,_l16,_l17,_l18,_l19,_l20,_l21,_l22,_l23,_l24];
_name ctrlSetStructuredText parseText format["<t align='center' shadow='0' color='#000000' size='2.5'>%1</t>",_namefinal];
_siret ctrlSetStructuredText parseText format["<t align='center' shadow='0' color='#000000' size='1'>SIRET: %1</t>",_siretstr];
_capital ctrlSetStructuredText parseText format["<t style='0' align='left' shadow='0' color='#000000' size='1'>%1€</t>",[_capitalstr] call life_fnc_numberText];

private _levelfinal = "Niveau 1";
if(_levelstr isEqualTo 1) then {
	_levelfinal = "Niveau 2";
};
_level ctrlSetStructuredText parseText format["<t style='0' align='left' shadow='0' color='#000000' size='1'>%1</t>",_levelfinal];

lbClear _list;
{
	private _membername = _x select 0;
	_list lbAdd format["%1",_membername];
	_list lbSetdata [(lbSize _list)-1,format["%1",_x]];
} forEach _membres;

_agrandir buttonSetAction "[life_pInact_curTarget] spawn ALF_fnc_agrandirBusiness";
_recruter buttonSetAction "[life_pInact_curTarget] spawn ALF_fnc_recruterBusiness";
_payer buttonSetAction "[life_pInact_curTarget] spawn ALF_fnc_payerBusiness";
_virer buttonSetAction "[life_pInact_curTarget] spawn ALF_fnc_virerBusiness";
_deposer buttonSetAction "[life_pInact_curTarget] spawn ALF_fnc_deposerBusiness";
