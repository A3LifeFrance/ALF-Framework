#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lockupHouse.sqf
	Author: ALF TEAM
*/
params[
	["_house",objNull,[objNull]]
];
if(isNull _house) exitWith {};

private _numberOfDoors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _house), "numberOfDoors");
if((_numberOfDoors isEqualTo -1) || {_numberOfDoors isEqualTo 0}) exitWith {};

titleText [localize "STR_House_LockingUp","PLAIN"];
uiSleep 3;

for "_i" from 1 to _numberOfDoors do {
	_house animateSource [format ["Door_%1_sound_source",_i],0];
	_house animate [format ["Door_%1",_i],0];
};
_house setVariable ["ALF_PorteFermer",true,true];

titleText[localize "STR_House_LockedUp","PLAIN"];
