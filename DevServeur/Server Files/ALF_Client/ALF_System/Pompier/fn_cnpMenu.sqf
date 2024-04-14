#include "\ALF_Client\script_macros.hpp"
/*
File: fn_adnMenu.sqf
Author: ALF Team
*/
if(life_medicLevel < 9) exitWith {["INFO","Tu n'as pas le grade.","warning"] spawn ALF_fnc_doMsg;};
disableSerialization;
if(!dialog) then {
	createDialog "ALF_CNP";
};
disableSerialization;

private _cng = findDisplay 17500;
private _menu1 = _cng displayCtrl 17501;
private _argent = _cng displayCtrl 17502;
private _edit = _cng displayCtrl 17503;
private _btnretirer = _cng displayCtrl 17504;
private _btndeposer = _cng displayCtrl 17509;
private _btnacc = _cng displayCtrl 17505;
private _btnlist = _cng displayCtrl 17506;
private _menu2 = _cng displayCtrl 17507;
private _list = _cng displayCtrl 17508;

_btnacc buttonSetAction "uiNamespace setVariable ['cnpmenu',0]; [] call ALF_fnc_cnpMenu;";
_btnlist buttonSetAction "uiNamespace setVariable ['cnpmenu',1]; [] call ALF_fnc_cnpMenu;";

private _menu = uiNamespace getVariable "cnpmenu";
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

		private _value = missionNamespace getVariable ["CNP",0];
		_argent ctrlSetStructuredText parseText format["<t color='#000000' size='3' align='center' style='144'>%1€</t>",[_value] call life_fnc_numberText];
		_btnretirer buttonSetAction "[] call ALF_fnc_cnpRetirer;";
		_btndeposer buttonSetAction "[] call ALF_fnc_cnpDeposer;";
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

		[player] remoteExec ["HC_fnc_listCNP",HC_Life];
	};
};

