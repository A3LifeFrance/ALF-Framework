/*
	File: fn_iPhoneLoadCentral.sqf
	Author: ALF Team
*/
if (isNull (findDisplay 32999)) exitWith {}; // A CHANGER
//if !(uiNamespace setVariable ['iphone',0] isEqualTo 8) exitWith {}; A VOIR

disableSerialization;
private _display = findDisplay 32999;  // A CHANGER
private _iPhoneCentralList = _display displayCtrl 33121;  // A CHANGER

params [
	["_data",[],[[]]]
];

{
	_x params [
		["_central_data",[],[[]]],
		["_time",0,[0]]
	];

	_central_data params [
		["_callID",0,[0]],
		["_anonyme",false,[false]],
		["_number","",[""]],
		["_unit",objNull,[objNull]]
	];

	if(_anonyme) then {
		_number = "Anonyme";
	};
	_iPhoneCentralList lbAdd format["%1 - En attente: %2",_number,[_time] call BIS_fnc_secondsToString];
	_iPhoneCentralList lbSetData [(lbSize _iPhoneCentralList)-1,str(_central_data)];
	_iPhoneCentralList lbSetValue [(lbSize _iPhoneCentralList)-1,_callID];
} forEach _data;
