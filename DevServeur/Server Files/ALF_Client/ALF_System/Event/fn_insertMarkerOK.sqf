/*
    File: fn_insertMarkerOK.sqf
    Author: NiiRoZz
*/
disableSerialization;
params [
	["_mode",0,[0]],
	["_display",displayNull,[displayNull]]
];

waitUntil {isNull _display};

_marker = ((allMapMarkers - ALF_allMarkers) select {_x find "_USER" > -1}) select 0;
ALF_allMarkers = [];

if (isNil "_marker") exitWith {hint "Report a NiiRoZz car tu es trop beau et il t'aime"};

switch (_mode) do {
	//Dépanneur
	case 0: {
		private _name = "_USER_DEFINED depanneur_placed_" + str ([1,9999] call  BIS_fnc_randomInt);
		private _markerInfo = [_name, markerText _marker,markerPos _marker,markerDir _marker,markerSize _marker,markerType _marker,markerShape _marker,markerBrush _marker,markerColor _marker,markerAlpha _marker];
		[0,_markerInfo,player] remoteExec ["HC_fnc_sendMarker",HC_Life];
		deleteMarker _marker;
		_marker = createMarkerLocal [(_markerInfo select 0), (_markerInfo select 2)];
		_marker setMarkerTextLocal (_markerInfo select 1);
		_marker setMarkerDirLocal (_markerInfo select 3);
		_marker setMarkerSizeLocal (_markerInfo select 4);
		_marker setMarkerTypeLocal (_markerInfo select 5);
		_marker setMarkerShapeLocal (_markerInfo select 6);
		_marker setMarkerBrushLocal (_markerInfo select 7);
		_marker setMarkerColorLocal (_markerInfo select 8);
		_marker setMarkerAlphaLocal (_markerInfo select 9);
	};

	//DIR
	case 1: {
		private _name = "_USER_DEFINED dir_placed_" + str ([1,9999] call  BIS_fnc_randomInt);
		private _markerInfo = [_name, markerText _marker,markerPos _marker,markerDir _marker,markerSize _marker,markerType _marker,markerShape _marker,markerBrush _marker,markerColor _marker,markerAlpha _marker];
		[1,_markerInfo,player] remoteExec ["HC_fnc_sendMarker",HC_Life];
		deleteMarker _marker;
		_marker = createMarkerLocal [(_markerInfo select 0), (_markerInfo select 2)];
		_marker setMarkerTextLocal (_markerInfo select 1);
		_marker setMarkerDirLocal (_markerInfo select 3);
		_marker setMarkerSizeLocal (_markerInfo select 4);
		_marker setMarkerTypeLocal (_markerInfo select 5);
		_marker setMarkerShapeLocal (_markerInfo select 6);
		_marker setMarkerBrushLocal (_markerInfo select 7);
		_marker setMarkerColorLocal (_markerInfo select 8);
		_marker setMarkerAlphaLocal (_markerInfo select 9);
	};

	//Gendarme
	case 2: {
		private _name = "_USER_DEFINED gendarme_placed_" + str ([1,9999] call  BIS_fnc_randomInt);
		private _markerInfo = [_name, markerText _marker,getMarkerPos _marker,markerDir _marker,markerSize _marker,markerType _marker,markerShape _marker,markerBrush _marker,markerColor _marker,markerAlpha _marker];
		[2,_markerInfo,player] remoteExec ["HC_fnc_sendMarker",HC_Life];
		deleteMarker _marker;
		_marker = createMarkerLocal [(_markerInfo select 0), (_markerInfo select 2)];
		_marker setMarkerTextLocal (_markerInfo select 1);
		_marker setMarkerDirLocal (_markerInfo select 3);
		_marker setMarkerSizeLocal (_markerInfo select 4);
		_marker setMarkerTypeLocal (_markerInfo select 5);
		_marker setMarkerShapeLocal (_markerInfo select 6);
		_marker setMarkerBrushLocal (_markerInfo select 7);
		_marker setMarkerColorLocal (_markerInfo select 8);
		_marker setMarkerAlphaLocal (_markerInfo select 9);
	};

	//Pompier
	case 3: {
		private _name = "_USER_DEFINED pompier_placed_" + str ([1,9999] call  BIS_fnc_randomInt);
		private _markerInfo = [_name, markerText _marker,markerPos _marker,markerDir _marker,markerSize _marker,markerType _marker,markerShape _marker,markerBrush _marker,markerColor _marker,markerAlpha _marker];
		[3,_markerInfo,player] remoteExec ["HC_fnc_sendMarker",HC_Life];
		deleteMarker _marker;
		_marker = createMarkerLocal [(_markerInfo select 0), (_markerInfo select 2)];
		_marker setMarkerTextLocal (_markerInfo select 1);
		_marker setMarkerDirLocal (_markerInfo select 3);
		_marker setMarkerSizeLocal (_markerInfo select 4);
		_marker setMarkerTypeLocal (_markerInfo select 5);
		_marker setMarkerShapeLocal (_markerInfo select 6);
		_marker setMarkerBrushLocal (_markerInfo select 7);
		_marker setMarkerColorLocal (_markerInfo select 8);
		_marker setMarkerAlphaLocal (_markerInfo select 9);
	};
};