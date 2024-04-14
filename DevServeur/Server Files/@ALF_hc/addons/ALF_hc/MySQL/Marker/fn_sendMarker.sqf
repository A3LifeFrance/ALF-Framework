/*
    File: fn_sendMarker.sqf
    Author: NiiRoZz
*/
params [
	["_mode",0,[0]],
	["_markerInfo",[],[[]]],
	["_unit",objNull,[objNull]]
];

switch (_mode) do {
	//Dépanneur
	case 0: {
		ALF_allMarkers_Depanneur pushBack _markerInfo;
		[0,_markerInfo] remoteExecCall ["ALF_fnc_receiveMarker",(playableUnits - [_unit])];
	};

	//DIR
	case 1: {
		ALF_allMarkers_DIR pushBack _markerInfo;
		[1,_markerInfo] remoteExecCall ["ALF_fnc_receiveMarker",(playableUnits - [_unit])];
	};

	//Gendarme
	case 2: {
		ALF_allMarkers_Gendarme pushBack _markerInfo;
		[2,_markerInfo] remoteExecCall ["ALF_fnc_receiveMarker",(playableUnits - [_unit])];
	};

	//Pompier
	case 3: {
		ALF_allMarkers_Pompier pushBack _markerInfo;
		[3,_markerInfo] remoteExecCall ["ALF_fnc_receiveMarker",(playableUnits - [_unit])];
	};
};