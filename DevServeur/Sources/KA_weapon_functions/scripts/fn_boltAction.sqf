_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
if(_unit ammo _muzzle == 0) exitwith{};
_sound = getArray(configFile>>"CfgWeapons">>_weapon>>"KA_BoltActionSound");
_isPlayer = isPlayer (_unit getVariable ["BIS_fnc_moduleRemoteControl_owner", _unit]);

//.............................
if ( _isPlayer ) then {waitUntil {(_this select 0) setWeaponReloadingTime [(_this select 0),(_this select 2),1];(inputAction "DefaultAction" == 0)};};
[_unit,_isPlayer,_muzzle] spawn 
{
	_t = if (_this select 1) then {0.5}else{0.35};
	_timeout = time + _t;
	waitUntil {(_this select 0) setWeaponReloadingTime [(_this select 0),(_this select 2),1];time >= _timeout};
};

//.............................


if( alive _unit && {! (_unit getVariable ["ACE_isUnconscious", false] )} && {! (_unit getVariable ["AGM_isUnconscious", false] )} ) then
{

	if(count _sound > 3)then
	{
		playSound3D [_sound select 0, _unit, false, getPosASL _unit, _sound select 1, _sound select 2, _sound select 3];
	};

	if ( (getNumber(configFile>>"CfgWeapons">>_weapon>>"KA_BoltActionUseRHSAnim") == 0) || {! isClass (configFile>>"CfgMovesBasic">>"ManActions">>"gestureBoltAction") } ) then 
	{
		_unit playAction "gestureBoltAction";
	}
	else
	{
		if ( _isPlayer && {cameraView == "Gunner"} ) then
		{
			_unit playAction "gestureBoltAction";
		}
		else
		{
			_unit playAction "gestureBoltActionLying";
		};
	};
sleep 0.25;
	[_unit,_weapon] spawn KA_fnc_boltAction_ejectEffect;

};
