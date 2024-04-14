#include "\ALF_Client\script_macros.hpp"
/*
	deleteKeysTime.sqf
*/
private _obj = _this select 0;
if(isNull _obj) exitWith {};
private _index = life_vehicles find _obj;
if !(_index isEqualTo -1) then {
	life_vehicles deleteAt _index;
};
