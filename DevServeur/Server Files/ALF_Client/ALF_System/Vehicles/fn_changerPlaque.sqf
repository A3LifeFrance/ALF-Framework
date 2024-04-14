#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_changerPlaque.sqf
	Author: ALF Team
*/
if(!dialog) then {
	createDialog "ALF_BRICO_Dialog";
};
disableSerialization;

private _list = ((findDisplay 13000) displayCtrl 13001);
lbClear _list;

private _vehs = player nearEntities [["Car","Ship","Air"],25];

life_vehicle_action = [];
private _v = -1;

{
	if(_x in life_vehicles) then {
		private _vInfo = [typeOf _x] call life_fnc_fetchVehInfo;
		_list lbAdd (_vInfo select 3);
		_list lbSetPicture [(lbSize _list)-1,_vInfo select 2];
		life_vehicle_action pushBack [_x,_vInfo select 3];
		_v = _v + 1;
		_list lbSetValue [(lbSize _list)-1,_v];
	};
} forEach _vehs;

private _btn = ((findDisplay 13000) displayCtrl 13002);
_btn buttonSetAction "[] spawn ALF_fnc_btnChangerPlaque;";
