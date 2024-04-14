/*
	File: fn_menuRadarAerien.sqf
	Author: ALF NiiRoZz
*/
if !([player] call ALF_fnc_hasEnergy) exitWith {["Info", "Il n'y n'a pas d'électricité.", "danger"] spawn ALF_fnc_doMsg;};

private ["_listeHelico","_mapControl","_ctrlParler"];
params [
	["_mode",-1,[0]],
	["_target",objNull,[objNull]]
];
disableSerialization;

if (life_copLevel isEqualTo 0 && {!(b_15)}) exitWith {};
if (_mode isEqualTo -1) exitWith {};

private _display = findDisplay 845760;
if !(isNull _display) then {
	_listeHelico = _display displayCtrl 845762;
	_mapControl = _display displayCtrl 845761;
	_ctrlParler = _display displayCtrl 845763;
};

switch (_mode) do {
	//Lancement Dialog
	case 0: {
		if (!(createDialog "ALF_Radar_Aerien")) exitWith {};
		lbClear 845762;
		ALF_ListeMarkerHelicoRadarAerien = [];
		ALF_ListeHelicoRadarAerien = [];
		ALF_curTargetRadar = objNull;
		ALF_curTargetFreq = 0;
		ALF_libreRadar = "";

		[] spawn {
			waitUntil {sleep 0.1; !(isNull findDisplay 845760)};
			((findDisplay 845760) displayCtrl 845763) buttonSetAction "[3] call ALF_fnc_menuRadarAerien;";
		};
		
		ALF_ListeHelicoRadarAerien = entities [["Air"], [], false, true];

		if (ALF_ListeHelicoRadarAerien isEqualTo []) then {
			private _index = lbAdd [845762, "Aucun helico."];
			lbSetData [845762, _index, "Aucun helico."];
		} else {
			{
				if !(isNull _x) then {
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
					private "_index";
					if ((typeOf _x) in ["V_ALF_EC135_Gendarmerie","V_ALF_PW207_Pompier"]) then {
						if (((getPosATL _x) select 2) > 5) then {
							_index = lbAdd [845762, format ["%2 %1",_pf,["[SP]","[GD]"] select (_x isKindOf "V_ALF_EC135_Gendarmerie")]];
						} else {
							_index = lbAdd [845762, (format ["[Sol] %2 %1",_pf,["[SP]","[GD]"] select (_x isKindOf "V_ALF_EC135_Gendarmerie")])];
						};
					} else {
						if (((getPosATL _x) select 2) > 5) then {
							_index = lbAdd [845762, _pf];
						} else {
							_index = lbAdd [845762, (format ["[Sol] %1",_pf])];
						};
					};
					lbSetData [845762, _index, (str _forEachIndex)];
					_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
					_marker setMarkerTypeLocal "c_air";
					_marker setMarkerColorLocal "ColorRed";
					_marker setMarkerTextLocal _pf;
					ALF_ListeMarkerHelicoRadarAerien pushBack [_marker,_x];
				};
			} forEach ALF_ListeHelicoRadarAerien;
			private _index = lbAdd [845762, "Deplacer Librement."];
			lbSetData [845762, _index, "libre"];
		};

		[] spawn {
			for "_i" from 0 to 1 step 0 do {
				disableSerialization;
				_display = findDisplay 845760;
				if (isNull _display) exitWith {};
				_mapControl = _display displayCtrl 845761;

				if !(isNull ALF_curTargetRadar) then {
					_mapControl ctrlMapAnimAdd [1.25,0.05,ALF_curTargetRadar];
					ctrlMapAnimCommit _mapControl;
				};

				{
					if (isNull (_x select 1)) then {
						deleteMarkerLocal (_x select 0);
						ALF_ListeMarkerHelicoRadarAerien set [_forEachIndex,objNull];
					} else {
						(_x select 0) setMarkerPosLocal (visiblePosition (_x select 1));
					};
				} forEach ALF_ListeMarkerHelicoRadarAerien;
				ALF_ListeMarkerHelicoRadarAerien = ALF_ListeMarkerHelicoRadarAerien - [objNull];
				uiSleep 2;
			};
		};
	};

	//onLBSelChanged EventHandler sur la liste
	case 1: {
		_index = lbCurSel _listeHelico;
		if (_index isEqualTo -1) exitWith {ALF_curTargetRadar = objNull; ALF_libreRadar = "";};
		_data = lbData [845762, _index];
		if (_data in ["Aucun helico.","libre"]) exitWith {ALF_curTargetRadar = objNull; if (_data isEqualTo "libre") then {ALF_libreRadar = "libre";};};
		ALF_curTargetRadar = ALF_ListeHelicoRadarAerien select (parseNumber _data);
		ALF_libreRadar = "";

		if !(isNull ALF_curTargetRadar) then {
			_mapControl ctrlMapAnimAdd [1.25,0.05,ALF_curTargetRadar];
			ctrlMapAnimCommit _mapControl;
		};
	};

	// Rafraichir la liste
	case 2: {
		_listeHelico lbSetCurSel -1;
		lbClear _listeHelico;
		_listeHelico lbSetCurSel -1;
		{
			deleteMarkerLocal (_x select 0);
		} forEach ALF_ListeMarkerHelicoRadarAerien;

		ALF_ListeHelicoRadarAerien = entities [["Air"], [], false, true];

		if (ALF_ListeHelicoRadarAerien isEqualTo []) then {
			private _index = lbAdd [845762, "Aucun helico."];
			lbSetData [845762, _index, "Aucun helico."];
		} else {
			{
				if !(isNull _x) then {
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
					private "_index";
					if ((typeOf _x) in ["V_ALF_EC135_Gendarmerie","V_ALF_PW207_Pompier"]) then {
						if (((getPosATL _x) select 2) > 5) then {
							_index = lbAdd [845762, format ["%2 %1",_pf,["[SP]","[GD]"] select (_x isKindOf "V_ALF_EC135_Gendarmerie")]];
						} else {
							_index = lbAdd [845762, (format ["[Sol] %2 %1",_pf,["[SP]","[GD]"] select (_x isKindOf "V_ALF_EC135_Gendarmerie")])];
						};
					} else {
						if (((getPosATL _x) select 2) > 5) then {
							_index = lbAdd [845762, _pf];
						} else {
							_index = lbAdd [845762, (format ["[Sol] %1",_pf])];
						};
					};
					lbSetData [845762, _index, (str _forEachIndex)];
					_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
					_marker setMarkerTypeLocal "c_air";
					_marker setMarkerColorLocal "ColorRed";
					_marker setMarkerTextLocal _pf;
					ALF_ListeMarkerHelicoRadarAerien pushBack [_marker,_x];
				};
			} forEach ALF_ListeHelicoRadarAerien;
			private _index = lbAdd [845762, "Deplacer Librement."];
			lbSetData [845762, _index, "libre"];
		};
	};

	//On parle a l'hélico sélectionné.
	case 3: {
		if(ALF_Phone_inCall || {ALF_Phone_tryCall} || {life_radio_connected}) exitWith {};
		if(isNull ALF_curTargetRadar) exitWith {};
		ALF_curTargetFreq = ALF_curTargetRadar getVariable ["helicofreq",0];
		if(ALF_curTargetFreq isEqualTo 0) exitWith {};
		private _curTarget = ALF_curTargetRadar;

		airradio_speaking = true;
		
		/*
		[format[localize "STR_transmit",format ["%1<img size='1.5' image='a3\ui_f\data\Map\MapControl\transmitter_CA.paa'/>","Tour de contrôle"], 4, ALF_curTargetFreq],
		format["TANGENT_LR	PRESSED	%1%2	%3	%4", ALF_curTargetFreq, "_bluefor", 10000  * (call TFAR_fnc_getTransmittingDistanceMultiplicator), "airborne"],-1] call TFAR_fnc_ProcessTangent;
		*/
		
		_radio = call TFAR_fnc_activeLrRadio;
		[
			format[localize "STR_transmit",format ["%1<img size='1.5' image='a3\ui_f\data\Map\MapControl\transmitter_CA.paa'/>","Tour de contrôle"], 4, ALF_curTargetFreq], 
			format[
				"TANGENT_LR	PRESSED	%1%2	%3	%4	%5", 
				ALF_curTargetFreq, "_bluefor",
				10000  * (call TFAR_fnc_getTransmittingDistanceMultiplicator), 
				[_radio select 0, "tf_subtype"] call TFAR_fnc_getLrRadioProperty, typeOf (_radio select 0)
			]
		] call TFAR_fnc_processTangent;

		[_curTarget] spawn {
			_curTarget = _this select 0;
			waitUntil {sleep 0.1; !(_curTarget isEqualTo ALF_curTargetRadar) || {ALF_libreRadar isEqualTo "libre"} || {isNull findDisplay 845760} || {!(alive player)} || {ALF_Phone_Ring} || {ALF_Phone_inCall} || {life_radio_connected} || {!(airradio_speaking)}};
			if !(airradio_speaking) exitWith {};
			if (ALF_libreRadar isEqualTo "libre") exitWith {
				[4] call ALF_fnc_menuRadarAerien;
				[5,_curTarget] call ALF_fnc_menuRadarAerien;
			};
			if (!(_curTarget isEqualTo ALF_curTargetRadar) && {!(isNull ALF_curTargetRadar)}) exitWith {
				[4] call ALF_fnc_menuRadarAerien;
				[3] call ALF_fnc_menuRadarAerien;
			};
			[4] call ALF_fnc_menuRadarAerien;
		};

		_ctrlParler ctrlSetText "MUTER";
		_ctrlParler buttonSetAction "[4] call ALF_fnc_menuRadarAerien;";
	};

	//On force mute dans tout les cas.
	case 4: {
		[format[localize "STR_transmit_end",format ["%1<img size='1.5' image='a3\ui_f\data\Map\MapControl\transmitter_CA.paa'/>","Tour de contrôle"], 4, ALF_curTargetFreq],
		format["TANGENT_LR	RELEASED	%1%2	%3	%4", ALF_curTargetFreq, "_bluefor", 10000 * (call TFAR_fnc_getTransmittingDistanceMultiplicator), "airborne"]] call TFAR_fnc_ProcessTangent;
		
		ALF_curTargetFreq = 0;
		airradio_speaking = false;

		if !(isNull findDisplay 845760) then {
			_ctrlParler ctrlSetText "PARLER";
			_ctrlParler buttonSetAction "[3] call ALF_fnc_menuRadarAerien;";
		};
	};

	//Si il selectionne librement
	case 5: {
		if(ALF_Phone_inCall || {ALF_Phone_tryCall} || {life_radio_connected}) exitWith {};
		if (isNull _target) exitWith {};
		ALF_curTargetFreq = _target getVariable ["helicofreq",0];
		if(ALF_curTargetFreq isEqualTo 0) exitWith {};
		private _curTarget = _target;

		airradio_speaking = true;
		[format[localize "STR_transmit",format ["%1<img size='1.5' image='a3\ui_f\data\Map\MapControl\transmitter_CA.paa'/>","Tour de contrôle"], 4, ALF_curTargetFreq],
		format["TANGENT_LR	PRESSED	%1%2	%3	%4", ALF_curTargetFreq, "_bluefor", 10000  * (call TFAR_fnc_getTransmittingDistanceMultiplicator), "airborne"],-1] call TFAR_fnc_ProcessTangent;

		[_curTarget] spawn {
			_curTarget = _this select 0;
			waitUntil {sleep 0.1; (isNull _curTarget) || {ALF_libreRadar isEqualTo ""} || {isNull findDisplay 845760} || {!(alive player)} || {ALF_Phone_Ring} || {ALF_Phone_inCall} || {life_radio_connected} || {!(airradio_speaking)}};
			if !(airradio_speaking) exitWith {};
			if ((ALF_libreRadar isEqualTo "") && {!(isNull ALF_curTargetRadar)}) exitWith {
				[4] call ALF_fnc_menuRadarAerien;
				[3] call ALF_fnc_menuRadarAerien;
			};
			[4] call ALF_fnc_menuRadarAerien;
		};

		_ctrlParler ctrlSetText "MUTER";
		_ctrlParler buttonSetAction "[4] call ALF_fnc_menuRadarAerien;";
	};
};
