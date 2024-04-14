/*
    File: fn_receiveMarker.sqf
    Author: NiiRoZz
*/
if !(hasInterface) exitWith {};
params [
	["_mode",0,[0]],
	["_markerInfo",[],[[]]]
];

switch (_mode) do {
	//Dépanneur
	case 0: {
		if (b_4) then {
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

	//DIR
	case 1: {
		if (b_18) then {
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

	//Gendarme
	case 2: {
		if (life_coplevel > 0) then {
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

	//Pompier
	case 3: {
		if (life_medicLevel > 0) then {
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
};