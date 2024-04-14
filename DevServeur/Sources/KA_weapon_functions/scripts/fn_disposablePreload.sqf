_player = player getVariable ["BIS_fnc_moduleRemoteControl_owner", player];
_weap = currentWeapon _player;

//..........................
if (_weap == getText(configFile>>"CfgWeapons">>_weap>>"KA_usedTube")) exitWith{[_player,_weap] spawn KA_fnc_disposableFired;};
//............................

_preloadMag = (getArray (configFile >> "CfgWeapons" >> _weap >> "magazines")) select 0;
if (_preloadMag != "") then
{
	_player removeMagazines _preloadMag;
	if ( _preloadMag != currentMagazine _player ) then
	{
		if(_weap == secondaryWeapon _player)then
		{
			_player addSecondaryWeaponItem _preloadMag;
		}
		else
		{
			if(_weap ==  handgunWeapon _player)then
			{
				_player addHandgunItem _preloadMag;
			}
			else
			{
				if(_weap == primaryWeapon _player)then
				{
					_player addPrimaryWeaponItem _preloadMag;
				};
			};
		};
	};
};
