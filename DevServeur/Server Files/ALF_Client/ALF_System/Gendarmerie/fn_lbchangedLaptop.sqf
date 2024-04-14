#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lbChangedLaptop.sqf
	Author: ALF Nanou
*/
disableSerialization;
private _text = (findDisplay 11500) displayCtrl 11502;
private _data = lbData[11501,lbCurSel (11501)];

if(_data isEqualTo "Aucune donnée") then {
	_text ctrlSetStructuredText parseText  format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>La liste est vide.</t>"];
} else {
	_data = call compile _data;
	private _struct = [];
	private _count = 0;
	{
		_count = _count + 1;
		_struct pushBack (format["%1) %2<br/>",_count,_x select 0]);
	} forEach _data;
	_struct = _struct joinString "";
	_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_struct];
};
