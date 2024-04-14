private ["_vehicle", "_config", "_turrets"];
_vehicle = _this select 0;
_config = configFile >> "CfgVehicles" >> typeOf _vehicle;
_turrets = [];
[_config, []] call KA_fnc_addTurret;
_turrets
