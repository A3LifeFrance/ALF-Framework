#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setSonyDate.sqf
Author: ALF Team
*/
disableSerialization;
private _display = findDisplay 38999;
private _dateiphone = _display displayCtrl 39035;

private _date = date;
private _hour = _date select 3;
private _min = _date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};

_dateiphone ctrlSetStructuredText parseText format["<t align='center' shadow='0' color='#FFFFFF' font='HelveticaNeueLTStdLt' size='5'>%1:%2</t>", _hour,_min];
