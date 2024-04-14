/*
	File: fn_menuCamera.sqf
	Author: Adam
*/
private ["_listeHistorique","_mapControl"];
params [
	["_mode",-1,[0]],
	["_cam",[],[[]]]
];
disableSerialization;

if (_mode isEqualTo -1) exitWith {};

private _display = findDisplay 754722;
if !(isNull _display) then {
	_listeHistorique = _display displayCtrl 754724;
};

switch (_mode) do {
	//Lancement Dialog
	case 0: {
		if (!(createDialog "RscHcamDialog")) exitWith {};
	};

	//Return Camera
	case 2: {
		lbClear _listeHistorique;
		if !((_cam select 0) isEqualTo []) then {
			{
				private _unit = _x select 0;
				private _index = _listeHistorique lbAdd format["%1",name _unit];
				_listeHistorique lbSetdata [(lbSize _listeHistorique)-1, str([_unit])];
			} forEach _cam;
		} else {
			private _index = _listeHistorique lbAdd "Aucun historique.";
			_listeHistorique lbSetData [_index,str([])];
		};
	};
};