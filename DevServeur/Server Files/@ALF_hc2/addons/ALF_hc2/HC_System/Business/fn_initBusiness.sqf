/*
	File: fn_initBusiness.sqf
	Author: Nanou
*/
private _count = (["SELECT COUNT(*) FROM business WHERE active='1'",2] call HC_fnc_asyncCall) select 0;

ALF_allBusinesss = [];

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	private _query = format["SELECT owner, pos, name, siret, capital, secteur, membres, level FROM business WHERE active = '1' LIMIT %1,10",_x];
	private _queryResult = [_query,2,true] call HC_fnc_asyncCall;
	diag_log format["ENTREPRISE load : %1",_queryResult];
	if(count _queryResult isEqualTo 0) exitWith {};
	{
		private _owner = _x select 0;
		private _pos = _x select 1;
		_pos = [_pos] call HC_fnc_mresToArray;
		_pos = call compile format["%1", _pos];
		private _name = _x select 2;
		_name = [_name] call HC_fnc_mresToArray;
		private _siret = _x select 3;
		private _capital = _x select 4;
		private _secteur = _x select 5;
		private _membres = _x select 6;
		_membres = [_membres] call HC_fnc_mresToArray;
		private _level = _x select 7;

		private _countVeh = ([format["SELECT COUNT(*) FROM vehicles WHERE type='%1' AND pid='%2'",_siret,_owner],2] call HC_fnc_asyncCall) select 0;
		private _nameownerquery = format["SELECT name FROM players WHERE playerid = '%1'",_owner];
		private _nameowner = [_nameownerquery,2] call HC_fnc_asyncCall;

		private _data = [_owner,_name,_siret,_capital,_secteur,_membres,_level,_countVeh,[_nameowner select 0,"Moi"] select (_nameowner isEqualTo [])];
		
		private _building = _pos nearestObject "Land_ALF_Entreprise";
		ALF_allBusinesss pushBack _building;
		_building setVariable ["business",_data,true];
		diag_log format["ENTREPRISE : %1 | %2",_building,_data];

		_building setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 0]];
		_building setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 1]];
		_building setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 2]];
		_building setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 3]];
		_building setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 4]];
		_building setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 5]];
		_building setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 6]];
		_building setObjectTextureGlobal [8, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 7]];
		_building setObjectTextureGlobal [9, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 8]];
		_building setObjectTextureGlobal [10, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 9]];
		_building setObjectTextureGlobal [11, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 10]];
		_building setObjectTextureGlobal [12, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 11]];
		_building setObjectTextureGlobal [13, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 12]];
		_building setObjectTextureGlobal [14, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 13]];
		_building setObjectTextureGlobal [15, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 14]];
		_building setObjectTextureGlobal [16, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 15]];
		_building setObjectTextureGlobal [17, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 16]];
		_building setObjectTextureGlobal [18, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 17]];
		_building setObjectTextureGlobal [19, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 18]];
		_building setObjectTextureGlobal [20, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 19]];
		_building setObjectTextureGlobal [21, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 20]];
		_building setObjectTextureGlobal [22, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 21]];
		_building setObjectTextureGlobal [23, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 22]];
		_building setObjectTextureGlobal [24, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_name select 23]];

		if(_level isEqualTo 1) then {
			_building animateSource ["level_source",1,true];
		};
		_building animateSource ["av_source",1,true];
		_building setVariable ["ALF_PorteFermer",true,true];

		private _q2 = format["SELECT pid, pos, classname, gear, dir, id, code FROM mobiliers WHERE pid='%1'",_siret];
		private _mobiliers = [_q2,2,true] call HC_fnc_asyncCall;

		if !(count _mobiliers isEqualTo 0) then {
			private "_vms";
			{
				private _pos = call compile format["%1",_x select 1];

				private _gear = [_x select 3] call HC_fnc_mresToArray;
				if(_gear isEqualType "") then {
					_gear = call compile format["%1", _gear];
				};
				
				private _index = ALF_Mobiliers_Objects find (_x select 2);
				if (_index > -1) then {
					private _data = ALF_Mobiliers_Objects_Data select _index;

					//EXEPTION POUR LA WEED et COCO HANGAR (CAUSE ANIMATION)
					private "_obj";
					if((_x select 2) in ["Land_ALF_Plante_W_2","Land_ALF_Coco"]) then {
						_obj = (_x select 2) createVehicle [0,0,0];
						_obj allowDammage false;
						[_obj,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
					} else {
						_obj = createSimpleObject [_data,_pos];
					};
					
					if((_x select 2) isEqualTo "Land_ALF_Coco") then {
						_obj setDir (getDir _building);
						_obj setPos (_building ModelToWorld [2.2168,2.05371,-1.83545])
					} else {
						_obj setPosWorld (call compile format["%1",_x select 1]);
						_obj setDir (call compile format["%1",_x select 4]);
					};
					
					_obj setVariable ["mobilier_data",[(_x select 0),(_x select 5),(_x select 2),_building,(_x select 6),true]];
					_obj setVariable ["gear",_gear,true];

					_vms = _building getVariable ["mobiliers",[]];
					_vms pushBack _obj;
					_building setVariable ["mobiliers",_vms];
				};
			} forEach _mobiliers;
		};
	} forEach _queryResult;
};

publicVariable "ALF_allBusinesss";
