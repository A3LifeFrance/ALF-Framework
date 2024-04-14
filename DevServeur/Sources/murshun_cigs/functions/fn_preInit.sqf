murshun_cigs_fnc_smoke = {
    params ["_unit", "_type"];

    private _multiplier = 1;

    switch (_type) do {
    case "cigarette": { _multiplier = 1 };
    case "cigar": { _multiplier = 2 };
    };

    private _source = "logic" createVehicleLocal (getPos _unit);
    private _fog = "#particleSource" createVehicleLocal getPos _source;
    _fog setParticleParams ["\A3\data_f\cl_basic",
    "",
    "Billboard",
    0.5,
    2,
    [0, 0, 0],
    [0, 0.1, -0.1],
    1,
    1.2,
    1,
    0.1,
    [0.1 * _multiplier, 0.2 * _multiplier, 0.1 * _multiplier],
    [[0.2 * _multiplier, 0.2 * _multiplier, 0.2 * _multiplier, 0.3 * _multiplier], [0, 0, 0, 0.01], [1, 1, 1, 0]],
    [500],
    1,
    0.04,
    "",
    "",
    _source];
    _fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
    _fog setDropInterval 0.005;

    _source attachTo [_unit, [0, 0.06, 0], "head"];
    sleep 0.4;

    deleteVehicle _source;
};

murshun_cigs_fnc_anim = {
    params ["_unit"];

    if (!alive _unit || vehicle _unit != _unit) exitWith {};

    if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};

    private _animation = animationState _unit;

    if (stance _unit == "STAND") then {
        [_unit, "ALF_CIGS_SMOKING"] remoteExec ["switchMove"];

        private _time = time;
        while {time < _time + 3} do {
            if (!alive _unit) exitWith {
                [_unit, ""] remoteExec ["switchMove"];
            };
            sleep (1/60);
        };
    } else {
        private _time = time;
        while {time < _time + 3} do {
            _unit playActionNow "Gear";
            sleep (1/60);
        };
    };

    if (alive _unit && !(_unit getVariable ["ACE_isUnconscious", false])) then {
        [_unit, _animation] remoteExec ["switchMove"];
    };
};

murshun_cigs_removeItemFromMag = {
    params ["_player", "_mag"];

    private _matchesMags = magazinesAmmo _player select {_x select 0 == _mag};

    _player removeMagazineGlobal _mag;

    private _oldMag = _matchesMags select 0;

    if ((_oldMag select 1) > 1) then {
        _player addMagazine [_mag, (_oldMag select 1) - 1];
    } else {
        [format ["%1 is now empty.", getText (configFile >> "CfgMagazines" >> _mag >> "displayName")], 2.5, _player] spawn ace_common_fnc_displayTextStructured;
    };
};

murshun_cigs_playSound = {
    params ["_unit", "_class"];

    [_unit, _class] remoteExec ["say3D"];
};

murshun_cigs_fnc_useItem = {
    params ["_unit", "_player"];

    if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
        [localize "STR_murshun_cigs_no_matches_or_lighter", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
        false
    };

    switch (true) do {
    case ("murshun_cigs_lighter" in (magazines _player)): {
            [_player, "murshun_cigs_lighter"] call murshun_cigs_removeItemFromMag;

            [_unit, "murshun_cigs_lighter_01"] call murshun_cigs_playSound;
        };
    case ("murshun_cigs_matches" in (magazines _player)): {
            [_player, "murshun_cigs_matches"] call murshun_cigs_removeItemFromMag;

            [_unit, "murshun_cigs_matches_01"] call murshun_cigs_playSound;
        };
    };

    true
};

murshun_cigs_fnc_start_cig_your = {
    params ["_player"];

    if !([_player, _player] call murshun_cigs_fnc_useItem) exitWith {};

    [_player] spawn murshun_cigs_fnc_start_cig;
};

murshun_cigs_fnc_start_cig_his = {
    params ["_unit", "_player"];

    if !([_unit, _player] call murshun_cigs_fnc_useItem) exitWith {};

    _player playActionNow "PutDown";

    [_unit] remoteExec ["murshun_cigs_fnc_start_cig", _unit];
};

murshun_cigs_fnc_start_cig = {
    params ["_unit"];

    if (!(local _unit)) exitWith {};

    private _cigTime = 0;
    private _goggles = hmd _unit;

    if !(_goggles in murshun_cigs_cigsArray) exitWith {};

    private _gogglesCurrent = _goggles;

    _cigTime = getNumber (configFile >> "CfgWeapons" >> _goggles >> "immersion_cigs_initStateTime");

    if (_unit getVariable ["murshun_cigs_cigLitUp", false]) exitWith {};
    _unit setVariable ["murshun_cigs_cigLitUp", true];

    [_unit] spawn murshun_cigs_fnc_anim;

    private _cigType = getText (configFile >> "CfgWeapons" >> _goggles >> "immersion_cigs_type");

    sleep (3.5 + random 2);
    [_unit, _cigType] remoteExec ["murshun_cigs_fnc_smoke"];
    sleep (1 + random 1);
    [_unit, _cigType] remoteExec ["murshun_cigs_fnc_smoke"];

    private _maxTime = getNumber (configFile >> "CfgWeapons" >> _goggles >> "immersion_cigs_maxTime");

    if (_maxTime == 0) then {
        _maxTime = 330;
    };

    while ({alive _unit && _gogglesCurrent in murshun_cigs_cigsArray && (_unit getVariable ["murshun_cigs_cigLitUp", false]) && _cigTime <= _maxTime}) do {
        _gogglesCurrent = hmd _unit;
        private _gogglesNew = "";

        _nextCigState = getText (configFile >> "CfgWeapons" >> _gogglesCurrent >> "immersion_cigs_nextState");

        _nextCigStateTime = getNumber (configFile >> "CfgWeapons" >> _nextCigState >> "immersion_cigs_initStateTime");

        if (_cigTime >= _nextCigStateTime) then {
            _gogglesNew = _nextCigState;
        };

        if (_gogglesNew != "") then {
            _unit linkItem _gogglesNew;
            _gogglesCurrent = _gogglesNew;
        };

        private _time = (5.5 + random 2);

        _cigTime = _cigTime + _time;

        [_unit, _cigType] remoteExec ["murshun_cigs_fnc_smoke"];
        _unit setFatigue (getFatigue _unit + 0.01);

        sleep _time;

        if (_gogglesCurrent != hmd _unit) exitWith {};
    };

    _unit setVariable ["murshun_cigs_cigLitUp", false];
    if (_cigTime >= _maxTime) then {
        private _item = hmd _unit;
        _unit unassignItem _item;
        _unit removeItem _item;
    };
};

murshun_cigs_fnc_stop_cig = {
    params ["_player"];

    _player setVariable ["murshun_cigs_cigLitUp", false];
};

murshun_cigs_fnc_take_cig_from_pack = {
    params ["_player"];

    [_player, "murshun_cigs_cigpack"] call murshun_cigs_removeItemFromMag;

    [_player, "murshun_cigs_unwrap"] call murshun_cigs_playSound;

    _player addItem "murshun_cigs_cig0";
};

if !(isClass (configFile >> "CfgPatches" >> "ace_common")) then {
    ace_common_fnc_displayTextStructured = {
        params ["_string"];

        hintSilent _string;
    };
};

if (isNil "immersion_cigs_giveItemsInSP") then {
    immersion_cigs_giveItemsInSP = true;
};

murshun_cigs_cigsArray = ["EWK_Cigar1", "EWK_Cigar2", "EWK_Cig1", "EWK_Cig2", "EWK_Cig3", "EWK_Cig4", "EWK_Glasses_Cig1", "EWK_Glasses_Cig2", "EWK_Glasses_Cig3", "EWK_Glasses_Cig4", "EWK_Glasses_Shemag_GRE_Cig6", "EWK_Glasses_Shemag_NB_Cig6", "EWK_Glasses_Shemag_tan_Cig6", "EWK_Cig5", "EWK_Glasses_Cig5", "EWK_Cig6", "EWK_Glasses_Cig6", "EWK_Shemag_GRE_Cig6", "EWK_Shemag_NB_Cig6", "EWK_Shemag_tan_Cig6", "murshun_cigs_cig0", "murshun_cigs_cig1", "murshun_cigs_cig2", "murshun_cigs_cig3", "murshun_cigs_cig4", "immersion_cigs_cigar0", "immersion_cigs_cigar1", "immersion_cigs_cigar2", "immersion_cigs_cigar3", "immersion_cigs_cigar4"];
