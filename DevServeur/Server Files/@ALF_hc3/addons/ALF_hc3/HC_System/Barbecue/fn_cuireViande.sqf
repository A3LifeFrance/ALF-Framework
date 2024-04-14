/*
	File: fn_cuireViande.sqf
	Author: ALF NiiRoZz
*/
params [
	["_viande",objNull,[objNull]],
	["_bbq",objNull,[objNull]]
];
if (isNull _viande || {isNull _bbq}) exitWith {};

private _time = 0;
private _timeCuit = getNumber (configFile >> "CfgVehicles" >> (typeOf _viande) >> "timeCuit");
private _timeBrulee = getNumber (configFile >> "CfgVehicles" >> (typeOf _viande) >> "timeBrulee");
private _textureCuit = getText (configFile >> "CfgVehicles" >> (typeOf _viande) >> "textureCuit");
private _textureBrulee = getText (configFile >> "CfgVehicles" >> (typeOf _viande) >> "textureBrulee");

for "_i" from 0 to 1 step 0 do {
	if (isNull _viande || {isNull _bbq}) exitWith {};

	if ((_bbq animationSourcePhase "chacha_source") isEqualTo 0) then {
		_time = _time + 1;

		if (_time >= _timeCuit && {_time < _timeBrulee} && {!((toLower (getObjectTextures _viande select 0)) isEqualTo (toLower _textureCuit))}) then {
			_viande setObjectTextureGlobal [0,_textureCuit];
		} else {
			if (_time >= _timeBrulee && {!((toLower (getObjectTextures _viande select 0)) isEqualTo (toLower _textureBrulee))}) then {
				_viande setObjectTextureGlobal [0,_textureBrulee];
			};
		};
	};

	uiSleep 1;
};