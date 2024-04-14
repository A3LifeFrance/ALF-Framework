// by commy2, edited by gp

_brightness = 2 - call AGM_Core_fnc_ambientBrightness;
_isIR = currentVisionMode (call AGM_Core_fnc_player);

if (_isIR == 2) exitWith {};

_isIR = _isIR == 1;

if(_isIR)then
{
	_brightness = _brightness / 2 + 1;
};

{
	_weapon = currentWeapon _x;
	_sightBearLaser = true;
	_laserID = getNumber(ConfigFile>>"CfgWeapons">>(_x weaponAccessories _weapon) select 2>>"AGM_SightBearLaser");	//gp: enabling MARS style LAMs
	/*
		// for eample:
		
		class FHQ_optic_AC12136: ItemCore
		{
			AGM_SightBearLaser = 1;					// does this optic has laser?
			AGM_LaserPointerRange = 50;				// clearly visible range in meters during the day (2 times during nights)
			AGM_LaserPointerType = 0;				// 0 for red & 1 for green
			MRT_SwitchItemNextClass = "FHQ_optic_AC12136_laserOff";		// use of MRT is highly recommended
			MRT_SwitchItemPrevClass = "FHQ_optic_AC12136_laserOff";
			MRT_switchItemHintText = "turn on Laser";
		};
		class FHQ_optic_AC12136_laserOff: FHQ_optic_AC12136		// a replica that has its laser turned off. Don't forget to add this one to ASDG list!
		{
			AGM_SightBearLaser = 0;
			MRT_SwitchItemNextClass = "FHQ_optic_AC12136";		// use of MRT is highly recommended
			MRT_SwitchItemPrevClass = "FHQ_optic_AC12136";
			MRT_switchItemHintText = "turn off Laser";
		};

	*/
	_maxRangeConfig = ConfigFile>>"CfgWeapons">>(_x weaponAccessories _weapon) select 2>>"AGM_LaserPointerRange";
	if (_laserID == 0) then
	{
		_sightBearLaser = false;
		_laserID = getNumber(ConfigFile>>"CfgWeapons">>(_x weaponAccessories _weapon) select 1>>"AGM_LaserPointerType");
		_maxRangeConfig = ConfigFile>>"CfgWeapons">>(_x weaponAccessories _weapon) select 1>>"AGM_LaserPointerRange";
	}
	else
	{
		if(vehicle _x != _x) then
		{
			_laserID = _laserID * getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _x >> "canPullTrigger");
		};
	};
	if ( (_laserID > 0) && {(_x isFlashlightOn _weapon) || {_sightBearLaser} }) then
	{
		_maxRange = 
		if(isNumber(_maxRangeConfig))then
		{
			getNumber(_maxRangeConfig);
		}
		else
		{
			50
		};
		[_x, 2 * _maxRange, _laserID == 2 || _isIR, _sightBearLaser] call AGM_Laserpointer_fnc_drawLaserpoint	// *2 for better view effect
	};

} forEach AGM_Laserpointer_nearUnits;
