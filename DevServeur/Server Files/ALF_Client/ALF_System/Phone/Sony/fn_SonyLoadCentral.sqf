/*
	File: fn_SonyLoadCentral.sqf
	Author: ALF Team
*/
if (isNull (findDisplay 32999)) exitWith {};
if !(uiNamespace setVariable ['sony',0] isEqualTo 8) exitWith {};

disableSerialization;
private _display = findDisplay 32999;
private _SonyCentralList = _display displayCtrl 33121;

params [
	["_data1",[],[[]]],
	["_data2",[],[[]]]
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
	_SonyCentralList lbAdd format["%1 - En attente: %2",_number,[_time] call BIS_fnc_secondsToString];
	_SonyCentralList lbSetData [(lbSize _SonyCentralList)-1,str(_central_data)];
	_SonyCentralList lbSetValue [(lbSize _SonyCentralList)-1,_callID];
} forEach _data1;

{
	_x params [
		["_central_data",[],[[]]],
		["_count",0,[0]]
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
	_SonyCentralList lbAdd format["%1 - %2 gendarmes connecté(s)",_number,_count];
	_SonyCentralList lbSetData [(lbSize _SonyCentralList)-1,str(_central_data)];
	_SonyCentralList lbSetValue [(lbSize _SonyCentralList)-1,_callID];
} forEach _data2;
