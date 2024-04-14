/*
	File: fn_SonyPMedMarkers.sqf
	Author: Nanou
*/
if(!visibleMap) exitWith {};
if !(life_pompier_service && {[(call TFAR_fnc_activeSwRadio),"alf_sony_1"] call TFAR_fnc_isSameRadio}) exitWith {};

params [
	["_data",[],[[]]]
];
if(_data isEqualTo []) exitWith {};

private _markers = [];

{
	_x params [
		["_unit",objNull,[objNull]],
		["_name","",[""]]
	];
	private _marker = createMarkerLocal [format["%1_marker",_unit],visiblePosition _unit];
	_marker setMarkerColorLocal "ColorIndependent";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format["%1",_name];
	_markers pushBack [_marker,_unit];
} forEach _data;

for "_i" from 0 to 1 step 0 do {
	if(!visibleMap) exitWith {};
	{
		_x params [
			["_marker","",[""]],
			["_med",objNull,[objNull]]
		];
		if !(isNull _med) then {
			_marker setMarkerPosLocal (visiblePosition _med);
		};
	} forEach _markers;
	sleep 0.02;
};

{deleteMarkerLocal (_x select 0);} forEach _markers;
_markers = [];
