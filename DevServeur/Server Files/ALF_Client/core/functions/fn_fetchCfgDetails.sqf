#include "\ALF_Client\script_macros.hpp"
/*
	@version: 1.7
	@file_name: fn_fetchCfgDetails.sqf
	@file_author: TAW_Tonic
	@file_edit: 8/2/2013
	@file_description: Fetch information about the entities config

	USAGE:
	[Classname,Cfg* (Optional)] call VAS_fnc_fetchCfgDetails;

	Return:
	0: classname
	1: displayname
	2: picture
	3: scope
	4: type
	5: itemInfo Type (if any, -1 means none)
	6: Cfg Location i.e CfgWeapons
	7: Magazines
	8: Muzzles
	9: Short Description
	10: acc_Pointers
	11: acc_Optics
	12: acc_Muzzles
	13: Base (Superclass)
	14: New compatibleItems Structure
	15: Mass
	16: isBackPack
*/
params [
	["_className","",[""]],
    ["_section","",[""]]
];
if (_className isEqualTo "") exitWith {[]};
if !((missionNamespace getVariable [_className + "_cfgDetails",[]]) isEqualTo []) exitWith {missionNamespace getVariable [_className + "_cfgDetails",[]]};

private _type = -1;
private _accPointer = [];
private _accOptic = [];
private _accMuzzle = [];
private _classes = [];
private _scope = 0;
private _itemInfo = -1;
private _muzzles = [];
private _magazines = [];
private _mass = 0;
private _isBackPack = 0;

if (_section isEqualTo "") then {
	_section = switch(true) do {
		case (isClass(configFile >> CONFIG_MAGAZINES >> _className)): {CONFIG_MAGAZINES};
		case (isClass(configFile >> CONFIG_WEAPONS >> _className)): {CONFIG_WEAPONS};
		case (isClass(configFile >> CONFIG_VEHICLES >> _className)): {CONFIG_VEHICLES};
		case (isClass(configFile >> CONFIG_GLASSES >> _className)): {CONFIG_GLASSES};
	};
};

if(!(_section isEqualType "") || {!isClass(configFile >> _section >> _className)} || {_section isEqualTo ""}) exitWith {[]};
private _config = configFile >> _section >> _className;
private _displayName = getText(_config >> "displayName");
private _picture = getText(_config >> "picture");
private _desc = getText(_config >> "descriptionshort");
private _base = inheritsFrom _config;

switch (_section) do
{
	case CONFIG_GLASSES: {
		_mass = getNumber(_config  >> "mass");
	};

	case CONFIG_VEHICLES: {
		_type = getText(_config >> "vehicleClass");
		_scope = getNumber(_config >> "scope");
		_mass = getNumber(_config  >> "mass");
		_isBackPack = getNumber(_config  >> "isbackpack");
	};

	case CONFIG_WEAPONS: {
		_scope = getNumber(_config >> "scope");
		_type = getNumber(_config >> "type");
		_desc = getText(_config >> "descriptionshort");

		//Compatible attachments
		if(isClass (_config >> "WeaponSlotsInfo")) then
		{
			_accPointer = getArray(_config >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
			_accOptic = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			_accMuzzle = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
			_mass = getNumber(_config >> "WeaponSlotsInfo" >> "mass");

			{	private "_thiscfgitem";
				for "_i" from 0 to (count(_x) - 1) do {
					_thiscfgitem = _x select _i;
					if (isClass _thiscfgitem) then {
						if !((configName _thiscfgitem) in _classes) then {
							_classes pushBack configName _thiscfgitem;
						};
					};
				};
			} forEach ([_config>>"WeaponSlotsInfo"] call BIS_fnc_returnParents);
		};

		if(isClass (_config >> "ItemInfo")) then {
			_itemInfo = getNumber(_config >> "ItemInfo" >> "Type");
			_mass = getNumber(_config >> "ItemInfo" >> "mass");
		};

		_muzzles = getArray(_config >> "muzzles");
		_magazines = getArray(_config >> "magazines");
		if(!isNil {_muzzles}) then {
			private["_tmp"];
			{
				if(_x != "this") then {
					_tmp = getArray(_base >> _x >> "magazines"); {
						_magazines pushBack _x;
					} forEach (_tmp);
				};
			} forEach _muzzles;
		};
	};

	case CONFIG_MAGAZINES: {
		_scope = getNumber(_config >> "scope");
		_mass = getNumber(_config >> "mass");
	};
};

if !(isNil "_classes") then {
	_classes = _classes - ["MuzzleSlot"];
	_classes = _classes - ["CowsSlot"];
	_classes = _classes - ["PointerSlot"];
};

private _array = [_className,_displayName,_picture,_scope,_type,_itemInfo,_section,_magazines,_muzzles,_desc,_accPointer,_accOptic,_accMuzzle,_base,_classes,_mass,_isBackPack];
missionNamespace setVariable [_className + "_cfgDetails",_array];

_array
