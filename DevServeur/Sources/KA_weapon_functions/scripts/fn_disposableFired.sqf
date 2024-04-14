	_unit = _this select 0;
	_weap = _this select 1;
	_usedLauncher = getText(configFile>>"CfgWeapons">>_weap>>"KA_usedTube");
	_isHandHeld = getNumber(configFile>>"CfgWeapons">>_weap>>"KA_isHandHeldLauncher");
	_useAlternativeDropPos = getNumber(configFile>>"CfgWeapons">>_weap>>"KA_usedTubeUseAlternativeDropPos") > 0;
	if(_usedLauncher=="")exitWith{};
 
//.............................................
	if((_usedLauncher != _weap) && isClass (configFile >> "CfgWeapons" >> _usedLauncher))then
	{
	_unit addWeapon _usedLauncher;
	_unit removeWeapon _weap;
	_unit selectWeapon _usedLauncher;
	};
	_weap = if(currentWeapon _unit == _usedLauncher)then{_usedLauncher}else{_weap};
//.............................................

	while
	{
		(currentWeapon _unit == _weap) && {vehicle _unit == _unit}
	}
	do
	{
		sleep 0.125;
	};

	_cond = "secondaryWeapon _unit == _weap";
	if (_isHandHeld > 0)then { _cond = "handgunWeapon _unit == _weap"; };
	if ( call compile _cond ) then
	{
		if (vehicle _unit == _unit) then
		{
			_unit removeWeapon _weap;

			_dropLauncher = _usedLauncher createVehicle[0, 0, 0];
			_dropLauncher setVectorUP [0, 0, 0.001];
			_dropLauncher setDir((getDir _unit) + 90);
			if (_isHandHeld > 0) then
			{
				_dropLauncher setPos(_unit modelToWorld(_unit selectionPosition "RightHand"));
			}
			else
			{
				if(_useAlternativeDropPos)then
				{
					_worldPosition = (_unit modelToWorld(_unit selectionPosition "RightShoulder"));
					_dropLauncher setPos [(_worldPosition select 0) + ((cos (getDir _unit)) / 3), (_worldPosition select 1) - ((sin (getDir _unit)) / 3), _worldPosition select 2];
				}
				else
				{
					_dropLauncher setPos(_unit modelToWorld(_unit selectionPosition "RightShoulder"));
				};
			};
			_dropLauncher setVelocity[(sin((getDir _unit) + 90)) * 1, (cos((getDir _unit) + 90)) * 1, 0];
			WaitUntil {
				((getPos _dropLauncher select 2) < 0.005)
			};
			_dropLauncher setVelocity [0, 0, 1];
			WaitUntil {
				((str(velocity _dropLauncher) == "[0,0,0]") or((getPos _dropLauncher select 2) > 0.5))
			};
			_dropLauncher setVelocity [0, 0, 0];
			WaitUntil {
				(str(velocity _dropLauncher) == "[0,0,0]")
			};
			sleep 1;
			if (isMultiplayer) then
			{
				[
					[_dropLauncher], "KA_fnc_disableSimulation", false, false
				] spawn BIS_fnc_MP;
			}
			else
			{
				_dropLauncher enableSimulation false;
				[ _dropLauncher ] spawn 
				{
					sleep 300;
					deleteVehicle (_this select 0);
				}
			};
		}
		else
		{
			//_unit removeWeapon _weap;
		};
	};