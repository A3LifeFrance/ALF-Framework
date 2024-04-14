if(isNil "AGM_Core_fnc_getZoom")then	//added by gp, standalone efforts
{
	AGM_Core_fnc_getZoom =
	{
		//by killzone kid
		(
			[0.5,0.5]
			distance
			worldToScreen
			positionCameraToWorld
			[0,1.05,1]
		) * (
			getResolution
			select
			5
		)
	};
};
if(isNil "AGM_Core_fnc_ambientBrightness")then
{
	AGM_Core_fnc_ambientBrightness =
	{
		sunOrMoon * sunOrMoon + moonIntensity/5 min 1
	};
};
if(isNil "AGM_Core_fnc_player")then
{
	AGM_Core_fnc_player =
	{
		missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player]
	};
};


// by commy2, edited by gp
/*
addMissionEventHandler ["Draw3D", {
	call AGM_Laserpointer_fnc_onDraw;
}];

0 spawn {
	sleep 1;
	AGM_Laserpointer_nearUnits = [(call AGM_Core_fnc_player)];

	while {true} do {
		sleep 5;
		_nearUnits = nearestObjects [(call AGM_Core_fnc_player), ["CAManBase"], 50];

		if (count _nearUnits > 10) then {
			_nearUnits resize 10;
		};

		{
			if((alive _x) && {_x distanceSqr (call AGM_Core_fnc_player) < 40000} && {!(_x in _nearUnits)})then
			{
				_nearUnits pushBack _x;
			};
		} forEach allPlayers;

		AGM_Laserpointer_nearUnits = _nearUnits;
	};
};
*/
