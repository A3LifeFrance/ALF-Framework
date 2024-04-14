_weaponType = _this select 0;
_projectile = _this select 1;
_ammoType = _this select 2;

_posASL = getPosASL _projectile;
_vCheck = true;
if ( toLower _weaponType == "throw" ) then
{
	_vCheck = false;
};
while{ (alive _projectile) && { !(_vCheck && (((velocity _projectile) call BIS_fnc_magnitude) == 0)) } }do
{
	_p = getPosASL _projectile;
	if(alive _projectile)then
	{
		_posASL = _p;
	};
};
[_ammoType,_posASL] call KA_fnc_thermobaric;
