#include "\ALF_Client\script_macros.hpp"
/*
File: fn_fixUniform.sqf
Author: ALF Team
*/

private _uniform = uniform player;
private _uniformItems = uniformItems player;
private _vest = vest player;
private _vestItems = vestItems player;

if !(_uniform isEqualTo "") then {
	removeUniform player;
	player forceAddUniform _uniform;
	{[_x,true,false,false,true] spawn life_fnc_handleItem;} forEach _uniformItems;
};

if !(_vest isEqualTo "") then {
	removeVest player;
	player addVest _vest;
	{[_x,true,false,false,true] spawn life_fnc_handleItem;} forEach _vestItems;
};

hint "Hop! Tu es de nouveau vêtu.";
