#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit"];
_unit = _this select 0;

if(life_cash > 0) then {
	_pos = _unit modelToWorld[0,3,0];
	_pos = [SEL(_pos,0), SEL(_pos,1), 0];
	_obj = "Land_Money_F" createVehicle [0,0,0];
	_obj setVariable ["item",["money",life_cash,name player],true];
	_obj setPos _pos;
	[_obj,false] remoteExecCall ["enableSimulationGlobal", 2];
	SVAR_MNS ["life_cash",0];
};
