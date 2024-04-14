#include "\ALF_Client\script_macros.hpp"
/*
File: fn_lbLeboncoin.sqf
Author: ALF Team
*/
if !(uiNamespace getVariable ['internetmenu',0] isEqualTo 8) exitWith {};

private["_data","_txt1","_txt2","_txt3","_txt4","_txt5"];
_data = lbData[24532,lbCurSel(24532)];
_data = call compile format["%1",_data];

_txt1 = (findDisplay 24500) displayCtrl 24533;
_txt1 ctrlSetStructuredText parseText format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_data select 2];

_txt2 = (findDisplay 24500) displayCtrl 24534;
_txt2 ctrlSetStructuredText parseText format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='0.8'>%2</t><br/><t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_data select 5,_data select 9];

_txt3 = (findDisplay 24500) displayCtrl 24535;
_txt3 ctrlSetStructuredText parseText format["<t shadow='0' color='#000000' size='1'>%1€</t>",[_data select 6] call life_fnc_numberText];

_txt4 = (findDisplay 24500) displayCtrl 24536;
_txt4 ctrlSetStructuredText parseText format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_data select 7];

_txt5 = (findDisplay 24500) displayCtrl 24537;
if((_data select 8) isEqualTo "0") then {
	_txt5 ctrlSetStructuredText parseText format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>","**********"];
} else {
	_txt5 ctrlSetStructuredText parseText format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_data select 8];
};

private _btnlbcan = (findDisplay 24500) displayCtrl 24545;
private _btnlbsup = (findDisplay 24500) displayCtrl 24546;
private _btn3lbc = (findDisplay 24500) displayCtrl 24538;
if((_data select 1) isEqualTo (getPlayerUID player)) then {
	_btnlbcan ctrlShow true;
	_btn3lbc ctrlShow false;
	_btnlbcan buttonSetAction "[] spawn ALF_fnc_annulerLeboncoin;";
} else {
	_btnlbcan ctrlShow false;
	_btn3lbc ctrlShow false;
	_btn3lbc buttonSetAction "[] spawn ALF_fnc_achatLeboncoin;";
};
if(life_copLevel > 3 OR {life_adminlevel > 0}) then {
	_btnlbsup ctrlShow true;
	_btnlbsup buttonSetAction "[] spawn ALF_fnc_supprimerLeboncoin;";
} else {
	_btnlbsup ctrlShow false;
};
