#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lbChangedSmsSony.sqf
	Author: ALF Nanou
*/
private["_text","_data","_delButton","_name","_motif"];
disableSerialization;
_text = ((findDisplay 32999) displayCtrl 33190);
_data = lbData[33189,lbCurSel (33189)];
_delButton = ((findDisplay 32999) displayCtrl 33191);
_delButton ctrlShow false;
if(_data isEqualTo "Casier vierge.") then {
	_text ctrlSetStructuredText parseText  format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='2'>Casier vierge.</t>"];
} else {
	_data = call compile _data;
	_lieu = _data select 0;
	_infra = _data select 1;
	_date = _data select 2;

	_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t><br/><br/><t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='0.85'>%2</t>",_lieu,_infra];

	_delButton ctrlShow true;
	_delButton buttonSetAction "[] call ALF_fnc_TajSonyDel;";
};
