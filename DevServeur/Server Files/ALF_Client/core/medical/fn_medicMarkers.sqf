/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks downed players on the map when it's open.
*/
private _markers = [];
private _markerf = [];
private _markersMedecin = [];
private _units = [];

sleep 0.25;
if(visibleMap) then {
	if(alf_admin_btn) then {
		{
			if !(_x isEqualTo player) then {
				_name = name _x;
				_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
				if (_x getVariable ["adminmarker",false] && {life_adminlevel > 2}) then {
					_marker setMarkerColorLocal "ColorOrange";
					_marker setMarkerTypeLocal "Mil_dot";
					_marker setMarkerTextLocal format["ADMIN MARKER - %1 - %2",_name, _x getVariable ["ALF_CurrentNameTFAR", ""]];
				} else {
					_marker setMarkerColorLocal "ColorRed";
					_marker setMarkerTypeLocal "Mil_dot";
					_marker setMarkerTextLocal format["%1 - %2",_name, _x getVariable ["ALF_CurrentNameTFAR", ""]];
				};
				_markersMedecin pushBack [_marker,_x];
			};
		} forEach playableUnits;
	};
	if(life_pompier_service) then {
		{
			private _rL = _x call TFAR_fnc_radiosList;
			private _n = false;
			{if([_x,"alf_sony_1"] call TFAR_fnc_isSameRadio) then {_n = true;};} forEach _rL;
			if (_n && {!(_x isEqualTo player)}) then {
				private _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
				_marker setMarkerColorLocal "ColorIndependent";
				_marker setMarkerTypeLocal "Mil_dot";
				private _name = switch (_x getVariable ["SonyFreq",0]) do {
					case 61 : {"Pompier (VSAV 1)";};
					case 62 : {"Pompier (VSAV 2)";};
					case 63 : {"Pompier (VSAV 3)";};
					case 64 : {"Pompier (VSAV 4)";};
					case 65 : {"Pompier (FPT 1)";};
					case 66 : {"Pompier (FPT 2)";};
					case 67 : {"Pompier (FPT 3)";};
					case 68 : {"Pompier (EPA 1)";};
					case 69 : {"Pompier (EPA 2)";};
					case 70 : {"Pompier (DRAGON)";};
					case 71 : {"Pompier (BRIG. NAUT)";};
					case 72 : {"Pompier (SMUR 1)";};
					case 73 : {"Pompier (SMUR 2)";};
					case 74 : {"Pompier (SMUR 3)";};
					case 75 : {"Pompier (OP 1)";};
					case 76 : {"Pompier (OP 2)";};
					case 77 : {"Pompier (OFF. PERM)";};
					default{"Pompier (Sans unité)"};
				};
				_marker setMarkerTextLocal format["%1",_name];
				_markersMedecin pushBack [_marker,_x];
			};
		} forEach (missionNamespace getVariable ["ALF_AllMedics",[]]);

		_units = playableUnits select {(_x getVariable ["ReviveMedic",false]) && (_x getVariable ["requestMedic",false])};
		{
			_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "loc_Hospital";
			_marker setMarkerTextLocal "Civil mourant";
			_markers pushBack _marker;
		} forEach _units;
		//Feu incendie
		{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal "!! INCENDIE !!";
			_markerf pushBack _marker;
		} forEach ALF_HC_Fire;
	} else {
		if (b_4) then {
			_array = missionNamespace getVariable ["VehiculeImmobiliser",[]];
			{
				if (isNull _x) then {
					_array deleteAt _forEachIndex;
				} else {
					private _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
					_marker setMarkerColorLocal "ColorOrange";
					_marker setMarkerTypeLocal "Mil_dot";
					_plaque = [_x] call ALF_fnc_getPlaque;
					_p1 = _plaque select 0;
					_p2 = _plaque select 1;
					_p3 = _plaque select 2;
					_p4 = _plaque select 3;
					_p5 = _plaque select 4;
					_p6 = _plaque select 5;
					_p7 = _plaque select 6;
					_p8 = _plaque select 7;
					_p9 = _plaque select 8;
					_pf = format["%1%2%3%4%5%6%7%8%9",_p1,_p2,_p3,_p4,_p5,_p6,_p7,_p8,_p9];
					_marker setMarkerTextLocal format ["Vehicule Immobilisé : %1",_pf];
					_markersMedecin pushBack [_marker,_x];
				};
			} forEach _array;
			if !(count _array isEqualTo count (missionNamespace getVariable ["VehiculeImmobiliser",[]])) then {
				missionNamespace setVariable ["VehiculeImmobiliser",_array,true];
			};
		};
	};
	for "_i" from 0 to 1 step 0 do {
		if(!visibleMap) exitWith {};
		{
			private["_marker","_unit"];
			_markersss = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_markersss setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} forEach _markersMedecin;
		sleep 0.02;
	};
	waitUntil {sleep 0.3; !visibleMap};
	{deleteMarkerLocal (_x select 0);} forEach _markersMedecin;
	{deleteMarkerLocal _x;} forEach (_markers + _markerf);
	_markers = [];
	_markerf = [];
	_markersMedecin = [];
	_units = [];
};
