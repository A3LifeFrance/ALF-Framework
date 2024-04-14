#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callTime.sqf
Author: ALF Team
Description:

*/
disableSerialization;
private _sec = 0;
for "_i" from 0 to 1 step 0 do {
	if(!ALF_Phone_inCall) exitWith {};
	if !(alive player) exitwith {};
	_sec = _sec + 1;
	if !(isNull (findDisplay 20000)) then {
		((findDisplay 20000) displayCtrl 200043) ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.6'>Durée: %1</t>",[_sec,"MM:SS"] call BIS_fnc_secondsToString];
	};
	if !(isNull (findDisplay 56400)) then {
		((findDisplay 56400) displayCtrl 564043) ctrlSetStructuredText parseText format["<t align='center' shadow='0' color='#ffffff' font='HelveticaNeueLTStdLt' size='.85'>%1</t>",[_sec,"MM:SS"] call BIS_fnc_secondsToString];
	};
	if !(isNull (findDisplay 32999)) then {
		((findDisplay 32999) displayCtrl 33021) ctrlSetStructuredText parseText format["<t align='right' style='1' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='2.5'>%1</t>",[_sec,"MM:SS"] call BIS_fnc_secondsToString];
	};
	if !(isNull (findDisplay 38999)) then {
		((findDisplay 38999) displayCtrl 39021) ctrlSetStructuredText parseText format["<t align='right' style='1' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='2.5'>%1</t>",[_sec,"MM:SS"] call BIS_fnc_secondsToString];
	};
	uiSleep 1;
};
