#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lbChangedMessagesNokia.sqf
	Author: ALF Team
	Description:

*/
private["_text","_data","_delButton","_replyButton","_msg"];
disableSerialization;
_text = ((findDisplay 20000) displayCtrl 20022);
_data = lbData[20021,lbCurSel (20021)];
_replyButton = ((findDisplay 20000) displayCtrl 20023);
if(_data isEqualTo "Tu n'as pas de messages.") then {
	_text ctrlSetStructuredText parseText  format["<t shadow='0' color='#000000' font='NokiaCellphoneFC' size='.45'>Tu n'as pas de messages.</t>"];
} else {
	_data = call compile _data;
	private _number = _data select 0;
	private _name = _data select 1;
	_msg = _data select 2;
	private _anonyme = _data select 3;
	if(_anonyme isEqualTo "1") then {_number = "**********"; _name = "Anonyme";};
	_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='NokiaCellphoneFC' size='.45'>%2 - %3 : %1</t>", _msg,_name,_number];
	_replyButton ctrlShow true;
	_replyButton buttonSetAction "[] spawn ALF_fnc_replySmsNokia;";
};
