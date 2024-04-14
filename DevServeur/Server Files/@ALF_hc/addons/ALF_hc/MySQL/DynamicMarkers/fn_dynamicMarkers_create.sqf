params [
	["_name","",[""]],
	["_pos",[],[[]]]
];

if (_pos isEqualTo []) exitWith {};

private _config = missionConfigFile >> "ALF_DYN_MARKERS" >> _name;
if (!isClass _config) exitWith {};

private _marker = createmarker [_name, _pos select 0];
diag_log format["[DM] Création marker : %1", _name];

_marker setMarkerShape getText(_config >> "shape");
_marker setMarkerType getText(_config >> "type");
_marker setMarkerColor getText(_config >> "color");
_marker setMarkerText getText(_config >> "text");
_marker setMarkerSize [getNumber(_config >> "size"), getNumber(_config >> "size")];

private _linked = getText(_config >> "linked");
if (_linked != "") then {
	private "_object";
	_object = call compile _linked;
	if (isNil "_object") then {
		diag_log format["[DM] Objet introuvable %1", _name];
	} else {
		if (isNull _object) then {
			diag_log format["[DM] Objet introuvable %1", _name];
		} else {
			_object setPosATL (_pos select 0);
			_object setDir (_pos select 1);
			missionNamespace setVariable [format["dyn_marker_linked_%1", _marker], _object];
			diag_log format["[DM] Objet placé %1", _name];
		};
	};
};

_marker;