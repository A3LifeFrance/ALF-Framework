_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_array = [_this, 1, [], [[]]] call BIS_fnc_param;
_check_target_coma = [_this, 2, true, [true]] call BIS_fnc_param;
_check_player_restrained = [_this, 3, true, [true]] call BIS_fnc_param;
_check_player_surrender = [_this, 4, true, [true]] call BIS_fnc_param;
_recup_house = [_this, 5, false, [false]] call BIS_fnc_param;

if (_array isEqualTo [])  exitWith {};
if (isNull _target) then {
	if (isNull life_pInact_curObject) exitWith {};
	_target = life_pInact_curObject
};

life_pInact_curObject = _target;

if (dialog) then {
	closeDialog 0;
	waitUntil {!dialog};
};

if (!(createDialog "interactionSystem")) exitWith {};
disableSerialization;

if (_recup_house) then {
	ALF_House_Data = [];
	[_target] remoteExecCall ["HC_fnc_recupHouseData",HC2_Life];
	waitUntil {count(ALF_House_Data) isEqualTo 2 OR {isNull (findDisplay 25799)}};
	if(isNull (findDisplay 25799)) exitWith {};
};

private _data = [];
{
	if (call compile format["%1", (_x select 2)]) then {_data pushBack [(_x select 0), (_x select 1)]};
} forEach _array;
diag_log str(_data);
if (_data isEqualTo []) exitWith {closeDialog 0;};

private _dataf = _data select [0, 12];
private _data_trop = [];
if (count _data > 12) then {
	_data_trop = _data select [11, (count _data) - 11];
};
diag_log str(_data_trop);

private _display = findDisplay 25799;
if (isNull _display) exitWith {};

_idc_actual = 25802;
{
	(_display displayCtrl _idc_actual) ctrlSetStructuredText parseText format["<t align='center'>%1</t>", (_x select 0)];
	(_display displayCtrl _idc_actual) buttonSetAction format["closeDialog 0; %1", (_x select 1)];
	
	_idc_actual = _idc_actual + 1;
} forEach _dataf;

if (_idc_actual < 25813) then {
	for "_i" from _idc_actual to 25813 do {ctrlShow[_i, false]};
};

private _pic2 = _display displayCtrl 25801;
(_display displayCtrl 25814) ctrlShow true;

if !(_data_trop isEqualTo []) then {
	(_display displayCtrl 25814) buttonSetAction (["closeDialog 0; [_target,", _data_trop, format[",%1,%2,%3] spawn ALF_fnc_interactions_create;",_check_target_coma, _check_player_restrained, _check_player_surrender]] joinString "");
	diag_log (["closeDialog 0; [objNull,", _data_trop, format[",%1,%2,%3] spawn ALF_fnc_interactions_create;",_check_target_coma, _check_player_restrained, _check_player_surrender]] joinString "");
	(_display displayCtrl 25801) ctrlShow false;
	(_display displayCtrl 25800) ctrlShow true;
} else {
	(_display displayCtrl 25814) buttonSetAction "closeDialog 0;";
	(_display displayCtrl 25801) ctrlShow true;
	(_display displayCtrl 25800) ctrlShow false;
};

while {!(isNull _display)} do {
	if ((player distance life_pInact_curObject) > ((((boundingBox life_pInact_curObject) select 1) select 0) + 3.5)) exitWith {
		closeDialog 0;
	};

	if (_check_target_coma && (life_pInact_curObject getVariable ["ReviveMedic", false])) exitWith {
		closeDialog 0;
	};

	if (isNull life_pInact_curObject) exitWith {
		closeDialog 0;
	};

	if (player getVariable ["ReviveMedic", false]) exitWith {
		closeDialog 0;
	};

	if (_check_player_restrained && ([player] call ALF_fnc_checkMenotter)) exitWith {
		closeDialog 0;
	};

	if (_check_player_surrender && ([player] call ALF_fnc_checkSurrender)) exitWith {
		closeDialog 0;
	};

	uiSleep 1;
};
