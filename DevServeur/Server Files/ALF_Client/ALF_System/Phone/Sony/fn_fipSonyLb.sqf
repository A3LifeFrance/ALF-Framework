#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lbChangedSmsSony.sqf
	Author: ALF Nanou
*/
private["_text","_data","_delButton","_name","_motif"];
disableSerialization;
_text = ((findDisplay 32999) displayCtrl 33177);
_data = lbData[33176,lbCurSel (33176)];
_delButton = ((findDisplay 32999) displayCtrl 33173);
_delButton ctrlShow false;
if(_data isEqualTo "La liste est vide.") then {
	_text ctrlSetStructuredText parseText  format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>La liste est vide.</t>"];
} else {
	_data = call compile _data;
	_motif = _data select 0;

	_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_motif];

	_delButton ctrlShow true;
	_delButton buttonSetAction "[] call ALF_fnc_fipSonyDel;";
};
