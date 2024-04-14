/*
	File: fn_menuHautParleur.sqf
	Author: ALF TEAM
*/
disableSerialization;
private _mode = _this select 0;
if(isNil "_mode") exitWith {};
if !(b_16) exitWith {};

switch (_mode) do {
	//On ouvre le dialog
	case 0: {
		if (!(createDialog "ALF_SPEAKERS_PRISON")) exitWith {};
		private _display = findDisplay 654585;
		private _ctrlParlerCour = _display displayCtrl 654586;
		private _ctrlParlerCellule = _display displayCtrl 654587;

		_ctrlParlerCour ctrlSetText "PARLER";
		_ctrlParlerCour buttonSetAction "[1] call ALF_fnc_circuitHautParleur;";
	
		_ctrlParlerCellule ctrlShow false;
	};
	//Parler à la cour
	case 1: {
		if(ALF_Phone_inCall || {ALF_Phone_tryCall} || {airradio_speaking} || {TF_tangent_lr_pressed} || {TF_tangent_sw_pressed}) exitWith {};

		private _display = findDisplay 654585;
		private _ctrlParlerCour = _display displayCtrl 654586;
		
		airradio_speaking = true;
		private _pluginCommand = format [
			"TANGENT_LR	PRESSED	%1%2	%3	%4	%5",
			1616,
			"_bluefor",
			10000  * (call TFAR_fnc_getTransmittingDistanceMultiplicator),
			"airborne",
			"alf_tourctrl"
		];

		["", _pluginCommand, 0] call TFAR_fnc_processTangent;

		_ctrlParlerCour ctrlSetText "MUTER";
		_ctrlParlerCour buttonSetAction "[2] call ALF_fnc_circuitHautParleur;";
		
		[] spawn {
			waitUntil {sleep 0.1; isNull findDisplay 654585 || {!(alive player)} || {ALF_Phone_Ring} || {ALF_Phone_inCall} || {TF_tangent_lr_pressed} || {TF_tangent_sw_pressed}};
			[2] call ALF_fnc_circuitHautParleur;
		};
	};

	//On mute la cour
	case 2: {
		[format[localize "STR_transmit_end",format ["%1<img size='1.5' image='a3\ui_f\data\Map\MapControl\transmitter_CA.paa'/>","Tour de contrôle"], 4, 1616],
		format["TANGENT_LR	RELEASED	%1%2	%3	%4", 1616, "_bluefor", 10000 * (call TFAR_fnc_getTransmittingDistanceMultiplicator), "airborne"]] call TFAR_fnc_ProcessTangent;

		private _display = findDisplay 654585;
		private _ctrlParlerCour = _display displayCtrl 654586;
		
		airradio_speaking = false;

		if !(isNull findDisplay 654585) then {
			_ctrlParlerCour ctrlSetText "PARLER";
			_ctrlParlerCour buttonSetAction "[1] call ALF_fnc_circuitHautParleur;";
		};
	};
};
