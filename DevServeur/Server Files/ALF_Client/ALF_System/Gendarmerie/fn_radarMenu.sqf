#include "\ALF_Client\script_macros.hpp"
/*
File: fn_radarMenu.sqf
Author: ALF Team
*/
if(life_copLevel isEqualTo 0) exitWith {};
private _load = false;
private _radar = _this select 0;
if(!dialog) then {
	createDialog "ALF_RadarM_Dialog";
	_load = true;
};
disableSerialization;
private _display = findDisplay 18550;
private _menu1 = _display displayCtrl 18551;
private _speededit = _display displayCtrl 18552;
private _amendeedit = _display displayCtrl 18553;
private _texte1 = _display displayCtrl 18554;
private _texte2 = _display displayCtrl 18555;
private _btnact = _display displayCtrl 18556;
private _menu2 = _display displayCtrl 18557;
private _lb = _display displayCtrl 18558;
private _btnres = _display displayCtrl 18559;

private _mode = _radar getVariable "RadarM" select 0;
if(_mode isEqualTo 0) then {
	_menu1 ctrlShow true;
	_speededit ctrlShow true;
	_amendeedit ctrlShow true;
	_texte1 ctrlShow true;
	_texte2 ctrlShow true;
	_btnact ctrlShow true;
	_menu2 ctrlShow false;
	_lb ctrlShow false;
	_btnres ctrlShow false;
	
	pInActRadar = _radar;
	_btnact buttonSetAction "[pInActRadar] spawn ALF_fnc_setRadarM";
} else {
	_menu1 ctrlShow false;
	_speededit ctrlShow false;
	_amendeedit ctrlShow false;
	_texte1 ctrlShow false;
	_texte2 ctrlShow false;
	_btnact ctrlShow false;
	_menu2 ctrlShow true;
	_lb ctrlShow true;
	_btnres ctrlShow true;

	lbClear _lb;
	_data = _radar getVariable "RadarM" select 2;
	if (count _data > 0) then {
		{
			_time = _x select 0;
			_plaque = _x select 1;
			_speedlimit = _x select 2;
			_speed = _x select 3;
			_lb lbAdd format["[%1] %2 - Flashé à %4Km/h / %3Km/h",_time,_plaque,_speedlimit,_speed];
		} forEach _data;
	};

	pInActRadar = _radar;
	_btnres buttonSetAction "[pInActRadar] spawn ALF_fnc_resetRadarM";
};

_mode = _radar getVariable "RadarM" select 0;

if(_load) then {
	for "_i" from 0 to 1 step 0 do {
		if(isNull (findDisplay 18550)) exitWith {};
		private _newmode = _radar getVariable "RadarM" select 0;
		if !(_mode isEqualTo _newmode) exitWith {closeDialog 0;};
		if (isNull _radar) exitWith {closeDialog 0;};
		uiSleep 1;
	};
};
