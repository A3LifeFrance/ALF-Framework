//systemChat str _this;
_proj = _this select 0;
_ammo = _this select 1;
_spe = 100;
_pos = getPosATL _proj;
_dir = vectorDir _proj;
_dirUp = vectorUp _proj;
_vel = velocity _proj;
while { ! isNull _proj } do
{
	_posNew = getPosATL _proj;
	_dirNew = vectorDir _proj;
	_dirUpNew = vectorUp _proj;
	_velNew = velocity _proj;
	if ( ! isNull _proj ) then
	{
		_pos = _posNew;
		_dir = _dirNew;
		_dirUp = _dirUpNew;
		_vel = _velNew;
	};
};
_AST_barrierBypasser_type = getText(configFile>>"CfgAmmo">>_ammo>>"KA_ASTProjectile");
_AST_barrierBypasser = createVehicle [_AST_barrierBypasser_type,_pos,[],0,"CAN_COLLIDE"];
_AST_barrierBypasser setVectorDir _dir;
_AST_barrierBypasser setVectorUp _dirUp;
_AST_barrierBypasser setVelocity ((vectorNormalized _vel) vectorMultiply _spe);
_AST_barrierBypasser setPosATL _pos;
//systemChat str _AST_barrierBypasser;
_t = time;
waitUntil{_pos distance (getPosATL _AST_barrierBypasser) > 5 || time - _t > 0.5};
_pos = getPosATL _AST_barrierBypasser;
deleteVehicle _AST_barrierBypasser;
{
	_AST_explosion = createVehicle [_x,_pos,[],0,"FLY"];
	_AST_explosion setPosATL _pos;
	if(getNumber(configFile>>"CfgAmmo">>_x>>"KA_thermobaric")>0)then
	{
		_timeToLive = getNumber(configFile>>"CfgAmmo">>_x>>"timeToLive");
		if( getText(configFile>>"CfgAmmo">>_x>>"simulation") == "shotGrenade" )then
		{
			_timeToLive = _timeToLive min getNumber(configFile>>"CfgAmmo">>_x>>"explosionTime")
		};
		if( _timeToLive < 0.1 )then
		{
			[_x,ATLToASL _pos] call KA_fnc_thermobaric;
		}
		else
		{
			["",_AST_explosion,_x] spawn KA_fnc_thermobaricFired;
		};
	};
	//systemChat str _AST_explosion;
} forEach (getArray(configFile>>"CfgAmmo">>_AST_barrierBypasser_type>>"KA_ASTSecondaryExplosions"));
