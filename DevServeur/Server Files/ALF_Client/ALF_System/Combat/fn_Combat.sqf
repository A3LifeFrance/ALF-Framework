private _target = _this select 0;

if (alive player && (isNull (attachedTo player))) then {
    private _animationAssets = [];

    switch (currentWeapon player) do {
        case "": {
            _animationAssets = [["MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct", 0.8],["MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct", 0.8]];
        };
        case (primaryWeapon player): {
            _animationAssets = [["MOCAP_Man_Act_Rfl_Stroke_DirectCurve", 1.5],["MOCAP_Man_Act_Rfl_Stroke_RightCurve", 1.5]];
        };
        case (handgunWeapon player): {
            _animationAssets = [["MOCAP_Man_Act_Pstl_Stroke_RightCurve", 1.0],["MOCAP_Man_Act_Pstl_Stroke_LeftCurve", 1.4]];
        };
    };

    if ((count _animationAssets) > 0) then {
        private _animationAsset = _animationAssets select (floor (random (count _animationAssets)));

		player playActionNow (_animationAsset select 0);
        sleep (_animationAsset select 1);
        if ((!isNull _target) && {(alive player) && (alive _target)}) then {
            _dir = [player, _target] call BIS_fnc_relativeDirTo;

            if (((_target distance player) <= 1.75) && (abs (180-(_dir+180)%360) < 40) && (isPlayer _target)) then {
                _target setDamage ((damage _target) + 0.01);
				[] remoteExecCall ["ALF_fnc_CombatEffect",_target];
             };
        };
    };
};