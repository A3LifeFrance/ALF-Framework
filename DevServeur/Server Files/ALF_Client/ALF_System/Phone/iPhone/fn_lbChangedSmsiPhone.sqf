#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lbChangedSmsiPhone.sqf
	Author: ALF Nanou
*/
private["_text","_data","_delButton","_replyButton","_msg","_number","_name","_anonyme"];
disableSerialization;
_text = ((findDisplay 56400) displayCtrl 682562);
_data = lbData[682561,lbCurSel (682561)];
_replyButton = ((findDisplay 56400) displayCtrl 682564);
if(_data isEqualTo "Tu n'as pas de messages.") then {
	_text ctrlSetStructuredText parseText  format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>Tu n'as pas de messages.</t>"];
} else {
	_data = call compile _data;
	_number = _data select 0;
	_name = _data select 1;
	_msg = _data select 2;
	_anonyme = _data select 3;
	if(_anonyme isEqualTo "1") then {_number = "**********"; _name = "Anonyme";};
	_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%2 - %3 : %1</t>", _msg,_name,_number];
	_replyButton ctrlShow true;
	_replyButton buttonSetAction "[] spawn ALF_fnc_iPhoneReplySms;";
};
