/*
	File : fn_fetchPlayerHouses.sqf
	Author: ALF TEAM
*/
params [
	["_unit",objNull,[objNull]],
	["_uid","",[""]]
];
if(_uid isEqualTo "" OR {isNull _unit}) exitWith {};

private _hs = [format["SELECT pid, pos FROM houses WHERE pid='%1'",_uid],2,true] call HC_fnc_asyncCall;

private _houses = [];
private _rtn = [];
{
	private _pos = call compile format["%1",_x select 1];
	private _h = nearestObject [_pos, "House"];
	private _fixpos = getPosATL _h;
	_h allowDamage false;
	_rtn pushBack (str(_fixpos));
	_houses pushBack (_h);
} forEach _hs;
missionNamespace setVariable [format["houses_%1",_uid],_rtn];

[(missionNamespace getVariable[format["houses_%1",_uid],[]])] remoteExecCall ["life_fnc_initHouses",_unit];

private _count = ([format ["SELECT COUNT(*) FROM mobiliers WHERE pid='%1'",_uid],2] call HC_fnc_asyncCall) select 0;
if (_count isEqualTo 0) exitWith {};

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	_queryResult = [format["SELECT pid, pos, classname, gear, dir, id, code FROM mobiliers WHERE pid='%2' LIMIT %1,10",_x,_uid],2,true] call HC_fnc_asyncCall;
	if(_queryResult isEqualTo []) exitWith {};
	{
		private _pid = _x select 0;
		private _pos = call compile format["%1",_x select 1];

		private _house = [_houses,_pos] call BIS_fnc_nearestPosition;

		if !(isNull _house) then {
			private _index = ALF_Mobiliers_Objects find (_x select 2);
			if (_index > -1) then {
				private _data = ALF_Mobiliers_Objects_Data select _index;
	
				//EXEPTION POUR LA WEED (CAUSE ANIMATION)
				private "_obj";
				if((_x select 2) isEqualTo "Land_ALF_Plante_W_2") then {
					_obj = (_x select 2) createVehicle [0,0,0];
					_obj allowDammage false;
					[_obj,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
				} else {
					if((_x select 2) isEqualTo "Land_ALF_Coco") then {
						_obj = (_x select 2) createVehicle [0,0,0];
						_obj allowDammage false;
						[_obj,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
					} else {
						_obj = createSimpleObject [_data, _pos];
					};
				};
				_obj setPosWorld (call compile format["%1",_x select 1]);
				_obj setDir (call compile format["%1",_x select 4]);
	
				//Mobilier data variable local HC_2
				// 0) UID OWNER: STRING
				// 1) ID: NUMBER
				// 2) CLASSNAME: STRING
				// 3) HOUSE: OBJECT
				// 4) SAFE: STRING
				// 5) LOCKED: BOOL
				_obj setVariable ["mobilier_data",[_pid,(_x select 5),(_x select 2),_house,(_x select 6),true]];
	
				//Gear variable global
				private _gear = [_x select 3] call HC_fnc_mresToArray;
				if(_gear isEqualType "") then {
					_gear = call compile format["%1", _gear];
				};
				_obj setVariable ["gear",_gear,true];
	
				private _var = _house getVariable ["mobiliers",[]];
				_var pushBack _obj;
				_house setVariable ["mobiliers",_var];
			};
		};
	} forEach _queryResult;
};
