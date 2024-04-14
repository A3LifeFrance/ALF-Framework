_ammoType = _this select 0;
_posASL = _this select 1;

_thermobaric = getNumber(configFile>>"CfgAmmo">>_ammoType>>"KA_thermobaric");

_above = [_posASL select 0, _posASL select 1, (_posASL select 2) + 7];
_house = objNull;
{
	if(_x isKindOf "House") then
	{
		_house = _x;
	};
} forEach (lineIntersectsWith [_posASL, _above]);
_inHouse = !(isNull _house);
if (_inHouse) then
{
	_houseArmor = getNumber(configFile>>"CfgVehicles">>typeOf _house>>"armor") max 0.0001;
	_hit = getNumber(configFile>>"CfgAmmo">>_ammoType>>"hit");
	_house setDamage ( (_thermobaric * _hit) / _houseArmor + damage _house);
//	systemChat str [_house,_thermobaric * _hit];
};
_range = getNumber(configFile>>"CfgAmmo">>_ammoType>>"indirectHitRange");
{
	if ( (vehicle _x == _x) || { [_x] call KA_fnc_thermobaric_isTurnedOut } ) then
	{
		_dis = (getPosASL _x) distance _posASL;
		if(_inHouse)then
		{
			if( (lineIntersects [ eyePos _x, _posASL, _x]) && {! (_house in (lineIntersectsWith [getPosASL _x, (getPosASL _x) vectorAdd [0,0,7]])) } )then
			{
				_dis = _dis * 2;
			};
		}
		else
		{
			if(lineIntersects [ eyePos _x, _posASL, _x])then
			{
				_dis = _dis * 2;
			};
		};
		if( (vehicle _x != _x) && { (getNumber(configFile>>"CfgVehicle">>typeOf (vehicle _x)>>"KA_thermobaric_isAirTight") > 0) || {! ([_x] call KA_fnc_isTurnedOut) } } )then
		{
			_dis = _dis / 2;
		};
		_tCoef = _range / (_range + _dis);
		if(_tCoef > 0.2)then
		{
			_x setDamage ( ((_tCoef ^ 1.5) * _thermobaric) + damage _x);
			[_x,_tCoef * _thermobaric] call KA_fnc_inflictFatigue;
//			systemChat (str [typeOf _x,(_tCoef ^ 1.5) * _thermobaric,_tCoef * _thermobaric]);
		};
	};
} forEach allUnits;
