/*
	File: fn_menuInspectTel.sqf
	Author: ALF NiiRoZz
*/
private ["_listeHistorique","_mapControl"];
params [
	["_mode",-1,[0]],
	["_msgs",[],[[]]],
	["_text","",[""]]
];
disableSerialization;

if (_mode isEqualTo -1) exitWith {};

private _display = findDisplay 754720;
if !(isNull _display) then {
	_listeHistorique = _display displayCtrl 754722;
	_mapControl = _display displayCtrl 754721;
};

_hasTel = {
	_return = false;
	{
		if (((assignedItems ALF_InspectTelTarget) select 3) find _x > -1) exitWith {
			_return = true;
		};
	} forEach ["alf_3310","alf_iphone","alf_neogend","alf_sony"];
	_return
};

switch (_mode) do {
	//Lancement Dialog
	case 0: {
		if ((time - ALF_InspectTelTime) < 30) exitWith{hint "Veuillez patienter ...";};
		if (!(createDialog "ALF_Inspect_Tel")) exitWith {};
		lbClear 754722;
		ALF_InspectTelTarget = objNull;
		ALF_InspectTelHistorique = [];
	};

	//Valider Button
	case 1: {
		private _text = ctrlText 754723;
		if (count _text < 10 || {count _text > 10}) exitWith {lbClear 754722;ALF_InspectTelTarget = objNull;ALF_InspectTelHistorique = [];if !(ALF_InspectTelMarker isEqualTo "") then {deleteMarkerLocal ALF_InspectTelMarker;};ALF_InspectTelMarker = "";lbSetCurSel [754722, -1];_mapControl ctrlShow false;};
		if !([_text] call TON_fnc_isnumber) exitWith {lbClear 754722;ALF_InspectTelTarget = objNull;ALF_InspectTelHistorique = [];if !(ALF_InspectTelMarker isEqualTo "") then {deleteMarkerLocal ALF_InspectTelMarker;};ALF_InspectTelMarker = "";lbSetCurSel [754722, -1];_mapControl ctrlShow false;};

		[_text] remoteExecCall ["HC_fnc_getUnitFromNumberSR",HC3_Life];
	};

	//On recoit l'historique du mec
	case 2: {
		ALF_InspectTelTime = time;
		ALF_InspectTelTarget = _this select 3;
		
		lbClear _listeHistorique;
		if !((_msgs select 0) isEqualTo []) then {
			{
				private _numberExp = _x select 0;
				private _numberDest = _x select 1;
				private _position = format["%1", _x select 2];
				private _date = _x select 3;
				
				if (_numberExp isEqualTo _text) then {
					private _index = _listeHistorique lbAdd format["%1",_numberDest];
					_listeHistorique lbSetPicture [_index,"\ALF_Client2\icons\out.paa"];
				} else {
					private _index = _listeHistorique lbAdd format["%1",_numberExp];
					_listeHistorique lbSetPicture [_index,"\ALF_Client2\icons\in.paa"];
				};
				_listeHistorique lbSetdata [(lbSize _listeHistorique)-1, str([_position,_date])];
			} forEach _msgs;
		} else {
			private _index = _listeHistorique lbAdd "Aucun historique.";
			_listeHistorique lbSetData [_index,str([])];
		};

		if (isNull ALF_InspectTelTarget) exitWith {["ERREUR", "Localisation impossible ...", "danger"] spawn ALF_fnc_doMsg;};
		if (!(call _hasTel) || (ALF_InspectTelTarget getVariable ["TelephoneOff",false])) exitWith {["ERREUR", "Localisation impossible ...", "danger"] spawn ALF_fnc_doMsg;};
		
		[3] spawn ALF_fnc_menuInspectTel;
	};

	//On affiche la pos du mec
	case 3: {
		if !(lbCurSel(754722) isEqualTo -1) then {
			private _data = call compile format["%1",lbData[754722, lbCurSel(754722)]];
			if (_data isEqualTo []) exitWith {};
			
			_mapControl ctrlShow true;
			
			private _pos =  call compile format["%1",(_data select 0)] getPos [([100,275] call BIS_fnc_randomInt), random 360];
			if (ALF_InspectTelMarker isEqualTo "") then {
				ALF_InspectTelMarker = createMarkerLocal [format["%1_marker",ALF_InspectTelTarget],_pos];
				ALF_InspectTelMarker setMarkerShapeLocal "ELLIPSE";
				ALF_InspectTelMarker setMarkerSizeLocal [550, 550];
				ALF_InspectTelMarker setMarkerColorLocal "ColorGreen";
				ALF_InspectTelMarker setMarkerAlphaLocal 0.75;
			} else {
				ALF_InspectTelMarker setMarkerPosLocal _pos;
			};
			_mapControl ctrlMapAnimAdd [1.5,0.08,_pos];
			ctrlMapAnimCommit _mapControl;	
			
		} else {
		
			if (isNull ALF_InspectTelTarget) exitWith {};
			if (!(call _hasTel) || (ALF_InspectTelTarget getVariable ["TelephoneOff",false])) exitWith {_mapControl ctrlShow false; ["ERREUR", "Localisation impossible ...", "danger"] spawn ALF_fnc_doMsg;};
			_target = ALF_InspectTelTarget;
			_mapControl ctrlShow true;
			_pos = ALF_InspectTelTarget getPos [([100,275] call BIS_fnc_randomInt), random 360];
			if (ALF_InspectTelMarker isEqualTo "") then {
				ALF_InspectTelMarker = createMarkerLocal [format["%1_marker",ALF_InspectTelTarget],_pos];
				ALF_InspectTelMarker setMarkerShapeLocal "ELLIPSE";
				ALF_InspectTelMarker setMarkerSizeLocal [450, 450];
				ALF_InspectTelMarker setMarkerColorLocal "ColorGreen";
				ALF_InspectTelMarker setMarkerAlphaLocal 0.75;
			} else {
				ALF_InspectTelMarker setMarkerPosLocal _pos;
			};
			_mapControl ctrlMapAnimAdd [1.5,0.08,_pos];
			ctrlMapAnimCommit _mapControl;

			for "_i" from 0 to 1 step 0 do { 
				_time = time;
				waitUntil {(time - _time) > 30 || {isNull ALF_InspectTelTarget} || {!(_target isEqualTo ALF_InspectTelTarget)} || {!(call _hasTel)} || {ALF_InspectTelTarget getVariable ["TelephoneOff",false]}};
				
				if (!(call _hasTel) || {ALF_InspectTelTarget getVariable ["TelephoneOff",false]} || {isNull ALF_InspectTelTarget} || {!(_target isEqualTo ALF_InspectTelTarget)}) then {
					_mapControl ctrlShow false;
					deleteMarkerLocal ALF_InspectTelMarker;
					ALF_InspectTelMarker = "";
				} else {
					_mapControl ctrlShow true;
					_pos = ALF_InspectTelTarget getPos [([100,275] call BIS_fnc_randomInt), random 360];
					ALF_InspectTelMarker setMarkerPosLocal _pos;
					_mapControl ctrlMapAnimAdd [1.5,0.08,_pos];
					ctrlMapAnimCommit _mapControl;
				};
				if (isNull ALF_InspectTelTarget || {!(_target isEqualTo ALF_InspectTelTarget)}) exitwith {};
			};
		};
	};
};