/*
	File: fn_civMarkers.sqf
	Author: Nanou
*/
private _markers = [];

sleep 0.5;
if(visibleMap) then {
	if(alf_admin_btn) then {
		private _gend = missionNamespace getVariable ["ALF_AllGendarmes",[]];
		{
			if !(_x isEqualTo player) then {
				private _name = name _x;
				private _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
				_marker setMarkerTypeLocal "Mil_dot";
				if (_x getVariable ["adminmarker",false] && {life_adminlevel > 2}) then {
					_marker setMarkerColorLocal "ColorOrange";
					_marker setMarkerTextLocal format["ADMIN MARKER - %1 - %2",_name, _x getVariable ["ALF_CurrentNameTFAR", ""]];
				} else {
					if (_x getvariable["ReviveMedic",false]) then {
						_marker setMarkerColorLocal "colorCivilian";
						_marker setMarkerTextLocal format["MORT | %1 - %2",_name, _x getVariable ["ALF_CurrentNameTFAR", ""]];
					} else {
						_marker setMarkerColorLocal "ColorRed";
						_marker setMarkerTextLocal format["%1 - %2",_name, _x getVariable ["ALF_CurrentNameTFAR", ""]];
					};
				};
				_markers pushBack [_marker,_x];
			};
		} forEach playableUnits;
	};
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
				_markers pushBack [_marker,_x];
			};
		} forEach _array;
		if !(count _array isEqualTo count (missionNamespace getVariable ["VehiculeImmobiliser",[]])) then {
			missionNamespace setVariable ["VehiculeImmobiliser",_array,true];
		};
	};

	if(life_penit_service) then {
		_array = missionNamespace getVariable ["ALF_AllBracelets",[]];
		{
			if (isNull _x) then {
				_array deleteAt _forEachIndex;
			} else {
				private _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
				if (_x getVariable ["ALF_EnPrison",false]) then {
					_marker setMarkerColorLocal "ColorKhaki";
				} else {
					_marker setMarkerColorLocal "ColorRed";
				};
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format ["Bracelet Electronique : %1",name _x];
				_markers pushBack [_marker,_x];
			};
		} forEach _array;
		if !((count _array) isEqualTo (count (missionNamespace getVariable ["ALF_AllBracelets",[]]))) then {
			missionNamespace setVariable ["ALF_AllBracelets",_array,true];
		};
	};

	for "_i" from 0 to 1 step 0 do {
		if !(visibleMap) exitWith {};
		if (_markers isEqualTo []) exitWith {};
		{
			private _marker = _x select 0;
			private _unit = _x select 1;
			if(!isNil "_unit" && {!isNull _unit}) then {
				_marker setMarkerPosLocal (visiblePosition _unit);
			};
		} forEach _markers;
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} forEach _markers;
	_markers = [];
};
