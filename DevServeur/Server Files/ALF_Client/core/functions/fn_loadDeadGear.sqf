#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_loadDeadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	BLAH
*/
params [
	["_loadout",[],[[]]]
];

_primary = SEL(_loadout,0);
_launcher = SEL(_loadout,1);
_handgun = SEL(_loadout,2);
_magazines = SEL(_loadout,3);
_uniform = SEL(_loadout,4);
_vest = SEL(_loadout,5);
_backpack = SEL(_loadout,6);
_items = SEL(_loadout,7);
_primitems = SEL(_loadout,8);
_secitems = SEL(_loadout,9);
_handgunitems = SEL(_loadout,10);
_uitems = SEL(_loadout,11);
_vitems = SEL(_loadout,12);
_bitems = SEL(_loadout,13);
_headgear = SEL(_loadout,14);
_goggles = SEL(_loadout,15);

//Strip the unit down
RemoveAllWeapons player;
{player removeMagazineGlobal _x;} forEach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} forEach (assignedItems player);

//Add the gear
if(!(EQUAL(_uniform,""))) then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {sleep 0.3; scriptDone _handle};};
if(!(EQUAL(_vest,""))) then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {sleep 0.3; scriptDone _handle};};
if(!(EQUAL(_backpack,""))) then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {sleep 0.3; scriptDone _handle};};
{
	_handle = [_x,true,false,false,false] spawn life_fnc_handleItem;
	waitUntil {sleep 0.3; scriptDone _handle};
} forEach _magazines;

if(!(EQUAL(_primary,""))) then {[_primary,true,false,false,false] spawn life_fnc_handleItem;};
if(!(EQUAL(_launcher,""))) then {[_launcher,true,false,false,false] spawn life_fnc_handleItem;};
if(!(EQUAL(_handgun,""))) then {[_handgun,true,false,false,false] spawn life_fnc_handleItem;};

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {sleep 0.3; scriptDone _handle};} forEach _items;
{[_x,true,false,false,true] call life_fnc_handleItem;} forEach (_uitems);
{[_x,true,false,false,true] call life_fnc_handleItem;} forEach (_vitems);
{[_x,true,true,false,false] call life_fnc_handleItem;} forEach (_bitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} forEach (_primitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} forEach (_secitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} forEach (_handgunitems);  

if(!(EQUAL(_headgear,""))) then {player addHeadGear _headgear};
if(!(EQUAL(_goggles,""))) then {player addGoggles _goggles};