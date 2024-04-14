#include "\ALF_Client\script_macros.hpp"
/*
File: fn_adnMenu.sqf
Author: ALF Team
*/
if(life_copLevel < 6) exitWith {["INFO","Tu n'as pas le grade.","warning"] spawn ALF_fnc_doMsg;};
disableSerialization;
if(!dialog) then {
	createDialog "ALF_CNG";
};
disableSerialization;

private _cng = findDisplay 16500;
private _menu1 = _cng displayCtrl 16501;
private _argent = _cng displayCtrl 16502;
private _edit = _cng displayCtrl 16503;
private _btnretirer = _cng displayCtrl 16504;
private _btndeposer = _cng displayCtrl 16509;
private _btnacc = _cng displayCtrl 16505;
private _btnlist = _cng displayCtrl 16506;
private _menu2 = _cng displayCtrl 16507;
private _list = _cng displayCtrl 16508;

_btnacc buttonSetAction "uiNamespace setVariable ['cngmenu',0]; [] call ALF_fnc_cngMenu;";
_btnlist buttonSetAction "uiNamespace setVariable ['cngmenu',1]; [] call ALF_fnc_cngMenu;";

private _menu = uiNamespace getVariable "cngmenu";
switch (_menu) do {
	case 0 : {
		_menu1 ctrlShow true;
		_argent ctrlShow true;
		_edit ctrlShow true;
		_btnretirer ctrlShow true;
		_btndeposer ctrlShow true;
		_btnacc ctrlShow false;
		_btnlist ctrlShow true;
		_menu2 ctrlShow false;
		_list ctrlShow false;

		private _value = missionNamespace getVariable ["CNG",0];
		_argent ctrlSetStructuredText parseText format["<t color='#000000' size='3' align='center' style='144'>%1€</t>",[_value] call life_fnc_numberText];
		_btnretirer buttonSetAction "[] call ALF_fnc_cngRetirer;";
		_btndeposer buttonSetAction "[] call ALF_fnc_cngDeposer;";
	};
	case 1 : {
		_menu1 ctrlShow false;
		_argent ctrlShow false;
		_edit ctrlShow false;
		_btnretirer ctrlShow false;
		_btndeposer ctrlShow false;
		_btnacc ctrlShow true;
		_btnlist ctrlShow false;
		_menu2 ctrlShow true;
		_list ctrlShow true;

		[player] remoteExec ["HC_fnc_listCNG",HC_Life];
	};
};

