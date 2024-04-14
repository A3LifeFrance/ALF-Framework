private _cams = [];

{
	if (_x getVariable ["CameraDiscrete", false]) then {
		_cams pushback _x;
	};
} forEach (player getVariable ["All_Camera",[]]);

[1,_cams] remoteExecCall ["ALF_fnc_menuCamera", remoteExecutedOwner];