#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneDate.sqf
Author: ALF Team
Description:
Chargement de la date de l'iphone
*/
private["_display","_date","_hour","_min","_dateiphone"];
disableSerialization;
_display = findDisplay 56400;
_dateiphone = _display displayCtrl 564000;

_date = date;
_hour = _date select 3;
_min = _date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
_dateiphone ctrlShow true;

_menu = uiNamespace getVariable "iphonemenu";
switch (_menu) do {
	case 0 : {
		_dateiphone ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#ffffff' font='HelveticaNeueLTStdLt' size='.5'>%1:%2</t>", _hour,_min];
	};
	default {
		_dateiphone ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='.5'>%1:%2</t>", _hour,_min];
	};
};
