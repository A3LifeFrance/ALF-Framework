private _vehicle = cursorObject;
private _speed = round speed _vehicle;

if((_vehicle isKindOf "Car") && (currentWeapon player) isEqualTo "ALF_Rangefinder") then {
	_plaque = [_vehicle] call ALF_fnc_getPlaque;
	if(isNil "_plaque") exitWith {};
	_p1 = _plaque select 0;
	_p2 = _plaque select 1;
	_p3 = _plaque select 2;
	_p4 = _plaque select 3;
	_p5 = _plaque select 4;
	_p6 = _plaque select 5;
	_p7 = _plaque select 6;
	_p8 = _plaque select 7;
	_p9 = _plaque select 8;
	_pf = format["%1%2%3%4%5%6%7%8%9",_p1,_p2,_p3,_p4,_p5,_p6,_p7,_p8,_p9];
	
	if (typeOf(_vehicle) isEqualTo "V_ALF_Kx") then {_pf = "Inconnue"};
	
	switch (true) do {
		case (_speed <= 55) : {
			hint parseText format ["<t color='#ffffff'><t size='1.8'><t align='center'>%1</t><br/><t color='#33CC33' align='center' size='1.5'>%2</t>",_pf,round  _speed];
		};

		case (_speed > 55) : {
			hint parseText format ["<t color='#ffffff'><t size='1.8'><t align='center'>%1</t><br/><t color='#FF0000'><t align='center'><t size='1.5'>%2</t>",_pf,round  _speed];
		};
	};
};
