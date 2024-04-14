private ["_unit","_vehicle","_airTight","_ret"];
_unit = _this select 0;
_vehicle = vehicle _unit;
_airTight = 0;
_ret = false;
if( (_vehicle isKindOf "Car_F") || {_vehicle isKindOf "Tank"} || {_vehicle isKindOf "Car"} )then
{
	_airTight = getNumber(configFile>>"CfgVehicle">>typeOf _vehicle>>"KA_thermobaric_isAirTight");
	if(_airTight > 0)then
	{
		{
			if(isTurnedOut _x)then
			{
				_airTight = 0;
			};
		} forEach crew _vehicle;
	};
	_ret = (_airTight == 0);
}
else
{
	_ret = [_unit] call KA_fnc_isTurnedOut;
};
_ret
