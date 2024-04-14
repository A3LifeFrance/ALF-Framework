#include "\ALF_Client\script_macros.hpp"
/*
File: fn_getFlashed.sqf
Author: ALF Nanou
*/
if(life_gendarme_service) exitWith {};
if(life_pompier_service) exitWith {};
if(life_penit_service) exitWith {};
private["_speedlimit","_speed","_amende"];
_speedlimit = _this select 0;
_speed = _this select 1;
_amende = _this select 2;

if(life_livreta > _amende) then {
	life_livreta = life_livreta - _amende;
	[6] call SOCK_fnc_updatePartial;

	private _cng = missionNamespace getVariable ["CNG",0];
	_cng = _cng + (_amende/4);
	[_cng] remoteExec ["HC_fnc_updateCNG",HC_life];

} else {
	if(life_livretb > _amende) then {
		life_livretb = life_livretb - _amende;
		[7] call SOCK_fnc_updatePartial;

		private _cng = missionNamespace getVariable ["CNG",0];
		_cng = _cng + (_amende/4);
		[_cng] remoteExec ["HC_fnc_updateCNG",HC_life];
	} else {
		if(life_livretc > _amende) then {
			life_livretc = life_livretc - _amende;
			[8] call SOCK_fnc_updatePartial;

			private _cng = missionNamespace getVariable ["CNG",0];
			_cng = _cng + (_amende/4);
			[_cng] remoteExec ["HC_fnc_updateCNG",HC_life];
		};
	};
};

private _sum = 0;
private _pt = 0;
if((_speed - _speedlimit) < 20) then {
	_sum = life_permis - 1;
	_pt = 1;
};
if((_speed - _speedlimit) >= 20 && {(_speed - _speedlimit) < 30}) then {
	_sum = life_permis - 2;
	_pt = 2;
};
if((_speed - _speedlimit) >= 30 && {(_speed - _speedlimit) < 40}) then {
	_sum = life_permis - 3;
	_pt = 3;
};
if((_speed - _speedlimit) >= 40 && {(_speed - _speedlimit) < 50}) then {
	_sum = life_permis - 4;
	_pt = 4;
};
if((_speed - _speedlimit) >= 50) then {
	_sum = life_permis - 6;
	_pt = 6;
};
if(_sum < 0) then {
	_sum = 0;
};
life_permis = _sum;
[14] call SOCK_fnc_updatePartial;

if(life_permis isEqualTo 0) then {
	license_driver = false;
	[1] call SOCK_fnc_updatePartial;
	["Radar Mobile",format["Tu viens d'être flashé à %2Km/h pour %1Km/h. Amende de %3€ prélevé de ton compte bancaire.",_speedlimit,_speed,_amende], "warning", false] spawn ALF_fnc_doMsg;
	["Permis",format["Tu as perdu %1 point(s). Il te reste 0 point(s) sur ton permis. Il a été retiré.",_pt], "warning", false] spawn ALF_fnc_doMsg;
} else {
	["Radar Mobile",format["Tu viens d'être flashé à %2Km/h pour %1Km/h. Amende de %3€ prélevé de ton compte bancaire.",_speedlimit,_speed,_amende], "warning", false] spawn ALF_fnc_doMsg;
	["Permis",format["Tu as perdu %1 point(s). Il te reste %2 point(s) sur ton permis.",_pt,life_permis], "warning", false] spawn ALF_fnc_doMsg;
};
