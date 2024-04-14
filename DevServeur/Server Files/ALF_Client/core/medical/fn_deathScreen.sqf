/*
	File: fn_deathScreen.sqf
*/
params[
	["_meds",[],[[]]]
];

disableSerialization;

private _medicsOnline = ((findDisplay 7300) displayCtrl 7304);
private _medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	_nb = if(count(_meds) > 0) then {"Oui"} else {"Non"};
	private _nearby = 20000;
	{
		if(alive _x) then {
			private _distance = (getPosATL player) distance _x;
			if (_distance < _nearby) then {
				_nearby = _distance;
			};
		};
	} foreach _meds;
	_medicsOnline ctrlSetText format["Pompier en ligne: %1",_nb];
	_medicsNear ctrlSetText format["Distance: %1m",round(_nearby)];
	sleep 2.5;
	(isNull (findDisplay 7300))
};