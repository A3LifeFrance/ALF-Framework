#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_updateRequest.sqf
	Author: ALF TEAM
*/

private _uniform = uniform player;
private _uniformItems = uniformItems player;
private _vest = vest player;
private _vestItems = vestItems player;
private _backpack = backpack player;
private _backpackItems = backpackItems player;

if !(_uniform isEqualTo "") then {
	removeUniform player;
	player forceAddUniform _uniform;
	{[_x,true,false,false,true,true] spawn life_fnc_handleItem;} forEach _uniformItems;
};

if !(_vest isEqualTo "") then {
	removeVest player;
	player addVest _vest;
	{[_x,true,false,false,true,false,true] spawn life_fnc_handleItem;} forEach _vestItems;
};

if !(_backpack isEqualTo "") then {
	removeBackpackGlobal player;
	player addBackpackGlobal _backpack;
	{[_x,true,true,false,true] spawn life_fnc_handleItem;} forEach _backpackItems;
};

private _packet = [getPlayerUID player,life_cash];
private _array = [];

private "_varName";
{
	_varName = LICENSE_VARNAME(configName _x);
	_array pushBack [_varName,LICENSE_VALUE(configName _x)];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array; //2

_packet pushBack ([] call life_fnc_saveGear); //3

_packet pushBack [life_hunger,life_thirst,life_drunk,(damage player)]; //4

_packet pushBack (life_is_alive); //5
_packet pushBack (getPosATL player); //6

_packet pushBack [alf_deseases,alf_medecine,alf_vaccins]; //7

_packet remoteExecCall ["HC_fnc_updateRequest",HC_Life];
