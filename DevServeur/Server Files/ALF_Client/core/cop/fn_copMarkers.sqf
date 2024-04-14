/*
	File: fn_copMarkers.sqf
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
						if (_x in _gend) then {
							_marker setMarkerColorLocal "ColorBLUFOR";
						} else {
							_marker setMarkerColorLocal "ColorRed";
						};
						_marker setMarkerTextLocal format["%1 - %2",_name, _x getVariable ["ALF_CurrentNameTFAR", ""]];
					};
				};
				_markers pushBack [_marker,_x];
			};
		} forEach playableUnits;
	};

	if(life_gendarme_service && {[(call TFAR_fnc_activeSwRadio),"alf_neogend_1"] call TFAR_fnc_isSameRadio}) then {
		if (player distance (nearestObject [position player,"Land_Caserne"]) < 100 || {player distance (nearestObject [position player,"Land_ALF_Comico2"]) < 100} || {alf_gendarmerie_command}) then {
			{
				private _rL = _x call TFAR_fnc_radiosList;
				private _n = false;
				{if([_x,"alf_neogend_1"] call TFAR_fnc_isSameRadio) then {_n = true;};} forEach _rL;
				if (_n && {!(_x isEqualTo player)}) then {
					private _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
					_marker setMarkerColorLocal "ColorBLUFOR";
					_marker setMarkerTypeLocal "Mil_dot";
					private _name = switch (_x getVariable ["SonyFreq",0]) do {
						case 31 : {"Gendarme (PAMI LP)";};
						case 32 : {"Gendarme (PAMI V2)";}; 
						case 33 : {"Gendarme (PAMI V3)";}; 
						case 34 : {"Gendarme (PAM 2 LP)";}; 
						case 35 : {"Gendarme (PAM 2 V2)";}; 
						case 36 : {"Gendarme (PAM 2 V3)";}; 
						case 37 : {"Gendarme (PSIG 1)";}; 
						case 38 : {"Gendarme (PSIG 2)";}; 
						case 39 : {"Gendarme (BRI 1)";}; 
						case 40 : {"Gendarme (BRI 2)";};
						case 41 : {"Gendarme (HELICO 1)";}; 
						case 42 : {"Gendarme (HELICO 2)";}; 
						case 43 : {"Gendarme (BRIG NAUTIQUE 1)";}; 
						case 44 : {"Gendarme (BRIG NAUTIQUE 2)";}; 
						case 45 : {"Gendarme (GIGN 1)";}; 
						case 46 : {"Gendarme (GIGN 2)";}; 
						case 47 : {"Gendarme (SR 1)";}; 
						case 48 : {"Gendarme (SR 2)";}; 
						case 49 : {"Gendarme (OP 1)";};
						case 50 : {"Gendarme (OP 2)";};
						case 51 : {"Gendarme (OP 3)";};
						default {"Gendarme (Sans unité)"};
					};
					_marker setMarkerTextLocal format["%1",_name];
					_markers pushBack [_marker,_x];
				};
			} forEach (missionNamespace getVariable ["ALF_AllGendarmes",[]]);
		};

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
		if !((count _array) isEqualTo (count (missionNamespace getVariable ["VehiculeImmobiliser",[]]))) then {
			missionNamespace setVariable ["VehiculeImmobiliser",_array,true];
		};
		
		if (license_SR) then {
			_array = missionNamespace getVariable ["VehiculeTracker",[]];
			{
				if (isNull _x) then {
					_array deleteAt _forEachIndex;
				} else {
					private _marker = createMarkerLocal [format["%1_trackergps",_x],visiblePosition _x];
					_marker setMarkerColorLocal "ColorRed";
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
					_marker setMarkerTextLocal format ["Tracker GPS : %1",_pf];
					_markers pushBack [_marker,_x];
				};
			} forEach _array;
			if !((count _array) isEqualTo (count (missionNamespace getVariable ["VehiculeTracker",[]]))) then {
				missionNamespace setVariable ["VehiculeTracker",_array,true];
			};
		};

		_array = missionNamespace getVariable ["ALF_AllBracelets",[]];
		{
			if (isNull _x) then {
				_array deleteAt _forEachIndex;
			} else {
				private _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
				_marker setMarkerColorLocal "ColorRed";
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format ["Bracelet Electronique : %1",name _x];
				_markers pushBack [_marker,_x];
			};
		} forEach _array;
		if !((count _array) isEqualTo (count (missionNamespace getVariable ["ALF_AllBracelets",[]]))) then {
			missionNamespace setVariable ["ALF_AllBracelets",_array,true];
		};

		{
			private _marker = createMarkerLocal [format["%1_marker",_x],(_x select 0)];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format ["Position perdue : %1",(_x select 1)];
			_markers pushBack [_marker,objNull];
		} forEach (missionNamespace getVariable ["ALF_AllPositionBracelets",[]]);
	};

	for "_i" from 0 to 1 step 0 do {
		if(!visibleMap) exitWith {};
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
	_cops = [];
};
