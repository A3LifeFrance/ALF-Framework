private _item = _this select 0;
private _mode =  _this select 1;

if (_item isEqualTo "") exitWith {};

if !(_mode) then {
	private _config = missionConfigFile >> "ALF_VACCINS" >> _item;
	if (!isClass(_config)) exitWith {};

	player removeMagazine _item;

	private _amount = getNumber(_config >> "time");
	{
		private _desease = configName _x;
		private _index = -1;
		{
			if (_desease in _x) exitWith {_index = _forEachIndex};
		} forEach alf_vaccins;
		
		if (_index isEqualTo -1) then {
			alf_vaccins pushBack [_desease,_amount];
			
			{
				if (_desease in _x) exitWith {_index = _forEachIndex};
			} forEach alf_deseases;
			
			if (_index != -1) then {
				alf_deseases deleteAt _index;
			};
		};
	} forEach ("true" configClasses (_config >> "protect"));
} else {
	private _config = missionConfigFile >> "ALF_MEDECINE" >> _item;
	if (!isClass(_config)) exitWith {};

	player removeMagazine _item;

	private _index = -1;
	{
		if (_item in _x) exitWith {_index = _forEachIndex};
	} forEach alf_medecine;
	
	if (_index isEqualTo -1) then {
		{
			{
				if (_item in _x) exitWith {_index = _forEachIndex};
			} forEach (_x select 1);
			
			if (_index != -1) then {
				_amount = (((_x select 1) select _index) select 1) - 1;
				if (_amount < 1) then {
					((alf_deseases select _forEachIndex) select 1) deleteAt _index;
				} else {
					(((alf_deseases select _forEachIndex) select 1) select _index) set [1,_amount];
				};
			};
		} forEach alf_deseases;

		alf_medecine pushBack [_item,getNumber(_config >> "interval")];
	} else {
		["INFO", "Vous n'avez pas respecté les prescriptions du médecin. Des effets indésirables peuvent survenir.", "warning"] call ALF_fnc_doMsg;
		[0.02] call ALF_fnc_handleDrug;
	};
};