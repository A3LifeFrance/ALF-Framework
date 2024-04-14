/*
	File: fn_startRepair.sqf
	Author: ALF TEAM
*/
params [
	["_elevator", [], [[]]],
	["_unit", objNull, [objNull]]
];

private _garage = (nearestObjects [_unit,["Land_ALF_AtelierMecanique"],30]) select 0;
if (isNull (_garage getVariable [(_elevator select 0) + "_veh_charge", objNull])) exitWith {};

if (_garage getVariable [(_elevator select 0) + "_in_repair", false]) exitWith {
	private _time = time - (_garage getVariable [(_elevator select 0) + "_repairTime", 0]);
	_time = 1200 - _time;
	["GARAGE", format["Le véhicule est déjà en cours de réparation. Il reste %1 de réparation.",[_time] call BIS_fnc_secondsToString], "warning"] remoteExec ["ALF_fnc_doMsg",_unit];
};

if ((_garage animationSourcePhase (_elevator select 1)) < 0.5) exitWith {};

private _veh = _garage getVariable [(_elevator select 0) + "_veh_charge", objNull];

if (isNull _veh) exitWith {
	["GARAGE", "Il n'y a aucun véhicule sur le pont élévateur.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];
};

if ((_garage getVariable [(_elevator select 0) + "_diag", 0]) != 2) exitWith {
	["GARAGE", "Vous devez d'abord lancer le diagnostic.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];
};

if (!("ALF_KitMecatechnic" in magazines _unit)) exitWith {
	["GARAGE", "Vous devez posséder une caisse de réparation.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];
};

private _damages = [];
private _allBackpack = true;
{

	_part = configName _x;
	_config = configFile >> "ALF_Repair" >> _part;

	if (isClass(_config)) then {
		if ((_veh getHitPointDamage _part) > 0) then {

			_item = getText(_config >> "item");

			if (!(_item isEqualTo "") && !(_item in magazines player)) then {
				_allBackpack = false;
			};
			_damages pushBack [_part, _item];
		};
	};
} foreach ("true" configClasses (configFile >> "CfgVehicles" >> typeOf(_veh) >> "HitPoints"));

if (_damages isEqualTo []) then {
	["Info", "Le véhicule ne semble pas endommagé.", "danger"] spawn ALF_fnc_doMsg;
} else {
	if (!(_allBackpack)) then {
		["GARAGE", "Vous n'avez pas toutes les pièces sur vous. Le véhicule ne sera pas réparé entièrement.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];
	};

	_garage setVariable[(_elevator select 0) + "_in_repair", true];
	_garage setVariable[(_elevator select 0) + "_repairTime", time];
	private _final_damages = [];
		
	{
			
		if ((_x select 1) != "") then {
			if ((_x select 1) in magazines _unit) then {
				_unit removeItem (_x select 1);
				_final_damages pushBack _x;
			};
		} else {
			_final_damages pushBack _x;
		};
	} forEach _damages;

	["GARAGE", "Vous avez lancé la réparation.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];

	uiSleep 1200;

	if (
		((_garage getVariable[(_elevator select 0) + "_veh_charge", objNull]) == _veh) && 
		((_garage animationSourcePhase (_elevator select 1)) > 0.5) 
		) then {

		playSound3D ["ALF_Client2\sounds\bip.ogg", _garage, false, _garage modelToWorld (_garage selectionPosition [(_elevator select 0), "Memory"]), 2, 1, 20];
		{
			if(!(local _veh)) then {
				[_veh,(_x select 0),0] remoteExecCall ["ALF_fnc_setHPD",_veh];
			} else {
				_veh setHitPointDamage [(_x select 0),0];
			};
		} foreach _final_damages;
			
		if (_allBackpack) then {
			_veh setDamage 0;
			private _parts = getAllHitPointsDamage _veh;

			{
				_veh setHitPointDamage [format["%1",(_x select _forEachIndex)],0];
			} forEach (_parts select 0);
		};
	};

	_garage setVariable [(_elevator select 0) + "_in_repair", false];
};