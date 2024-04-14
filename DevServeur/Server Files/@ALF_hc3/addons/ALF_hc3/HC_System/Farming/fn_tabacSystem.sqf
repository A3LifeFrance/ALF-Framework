/*
	File: fn_tabacSystem.sqf
	ALF NiiRoZz
*/
params [
	["_object",objNull,[objNull]],
	["_speed","",[""]]
];

if(_speed isEqualTo "FAST") then {
	uiSleep (random(60)+75);
} else {
	uiSleep (random(60)+100);
};

for "_i" from 2 to 4 do {
	_pos = getPosWorld _object;
	deleteVehicle _object;
	_object = createSimpleObject [format ["ALF_Objects\ALF_Tabac\ALF_Tabac_%1.p3d",_i], _pos];

	if (_speed isEqualTo "FAST") then {
		uiSleep (random(80)+75);
	} else {
		uiSleep (random(80)+110);
	};
};
