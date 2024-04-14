#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lbChangedSmsSony.sqf
	Author: ALF Nanou
*/
disableSerialization;
private _text = ((findDisplay 38999) displayCtrl 39145);
private _data = lbData[39144,lbCurSel (39144)];
private _replyButton = ((findDisplay 38999) displayCtrl 39146);
if(_data isEqualTo "Tu n'as pas de messages.") then {
	_text ctrlSetStructuredText parseText  format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>Tu n'as pas de messages.</t>"];
} else {
	private _data = call compile _data;
	private _number = _data select 0;
	private _name = _data select 1;
	private _msg = _data select 2;
	private _anonyme = _data select 3;
	if(_anonyme isEqualTo "1") then {
		_number = "**********";
		_name = "Anonyme";
		_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%2 - %3 : %1</t>", _msg,_name,_number];
		_replyButton ctrlShow false;
	} else {
		_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%2 - %3 : %1</t>", _msg,_name,_number];
		_replyButton ctrlShow true;
		_replyButton buttonSetAction "uiNamespace setVariable ['sonyp',13]; [] call ALF_fnc_menuSonyP;";
	};
};
