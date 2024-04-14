private _color = _this select 0;
private _pos = _this select 1;
private _type = _this select 2;

if (_type isEqualTo "") then {
	private _type = selectRandom ["fizzer","normal"]; 
};

private _initial_velocity = selectRandom [[(random 50) -5,(random 200)-5, (random 200) + 50], [(random 50) -5, -((random 200)-5), (random 200) + 50]]; 

private _explosion_power = ((random 50) + 20); 
private _glitter_count = ((random 30) + 10);

private _explosion_fragments_array = [];
private _explosion_subfragments_array = [];

private _rand_expl_power1 = 0;
private _rand_expl_power2 = 0;
private _rand_expl_power3 = 0;

switch (_color) do {
	case "random": {_color = selectRandom [[0.42,0.81,0.1],[0.8,0.1,0.1],[0.2,0.73,0.85],[0.882,0.322,0.078],[0.459,0.11,0.463],[0.875,0.843,0.122],[1,1,1]]};
    case "green": {_color = [0.42,0.81,0.1]};
    case "red": {_color = [0.8,0.1,0.1]};
    case "blue": {_color = [0.2,0.73,0.85]};
    case "orange": {_color = [0.882,0.322,0.078]};
    case "purple": {_color = [0.459,0.11,0.463]};
    case "jaune": {_color = [0.875,0.843,0.122]};
    case "white": {_color = [1,1,1]};
    default {_color = [1,1,1]};
}; 

private _launchSound = [
    "launch1",
    "launch2"
] call BIS_fnc_selectRandom;

private _whistlingSound = [
    "whistling1",
    "whistling2"
] call BIS_fnc_selectRandom;

private _bangSound = [
    "bang01",
    "bang02"
] call BIS_fnc_selectRandom;

private _singleFizz = [
    "fizz_single_type1_1",
    "fizz_single_type1_2"
];

private _groupFizz = [
    "fizz_group1",
    "fizz_group2"
];

if (_type isEqualTo "normal") then {
    _glitter_count = _glitter_count * 2;
	_explosion_power = _explosion_power / 2;
};

For [{_i=0},{_i < _glitter_count},{_i=_i+1}] do { 
    _rand_expl_power1 = ((random _explosion_power)*2) - _explosion_power;
    _rand_expl_power2 = ((random _explosion_power)*2) - _explosion_power;
    _rand_expl_power3 = ((random _explosion_power)*2) - _explosion_power;
    _explosion_fragments_array = _explosion_fragments_array + [[(_rand_expl_power1) -_rand_expl_power1/2,(_rand_expl_power2) -_rand_expl_power2/2, (_rand_expl_power3) -_rand_expl_power3/2]];

    if (_i < _glitter_count/3) then {
		_rand_subexpl_power1 = ((random _explosion_power)/2) - _explosion_power/2;
		_rand_subexpl_power2 = ((random _explosion_power)/2) - _explosion_power/2;
		_rand_subexpl_power3 = ((random _explosion_power)/2) - _explosion_power/2;
		_explosion_subfragments_array = _explosion_subfragments_array + [[(_rand_subexpl_power1/4) -_rand_subexpl_power1/8,(_rand_subexpl_power2/4) -_rand_subexpl_power2/8, (_rand_subexpl_power3/4) -_rand_subexpl_power3/8]];
    };
};

if (_type isEqualTo "rain") then {
    For [{_i=0},{_i < _glitter_count},{_i=_i+1}] do { 
		_rand_expl_power1 = ((random _explosion_power)*2) - _explosion_power;
		_rand_expl_power2 = ((random _explosion_power)*2) - _explosion_power;
		_rand_expl_power3 = ((random _explosion_power)*2);
		_explosion_fragments_array = _explosion_fragments_array + [[(_rand_expl_power1) -_rand_expl_power1/2,(_rand_expl_power2) -_rand_expl_power2/2, (_rand_expl_power3) -_rand_expl_power3/2]];

		if (_i < _glitter_count/3) then {
			_rand_subexpl_power1 = ((random _explosion_power)/2) - _explosion_power/2;
			_rand_subexpl_power2 = ((random _explosion_power)/2) - _explosion_power/2;
			_rand_subexpl_power3 = ((random _explosion_power)/2);
			_explosion_subfragments_array = _explosion_subfragments_array + [[(_rand_subexpl_power1/4) -_rand_subexpl_power1/8,(_rand_subexpl_power2/4) -_rand_subexpl_power2/8, (_rand_subexpl_power3/4) -_rand_subexpl_power3/8]];
        };
    };
};

[
    _type,
    _initial_velocity,
    _explosion_power,
    _glitter_count,
    _color,
    _explosion_fragments_array,
    _explosion_subfragments_array,
    _launchSound,
    _whistlingSound,
    _bangSound,
    _singleFizz,
    _groupFizz,
	_pos
] remoteExec ["ALF_fnc_fireWorksLaunch", 0];

/*
private _explosion_power = ((random 50) + 20); 
private _explosion_fragments_array = [];
private _explosion_subfragments_array = [];
private _rand_expl_power1 = 0;
private _rand_expl_power2 = 0;
private _rand_expl_power3 = 0;

For [{_i=0},{_i < 30},{_i=_i+1}] do { 
    _rand_expl_power1 = ((random _explosion_power)*2) - _explosion_power;
    _rand_expl_power2 = ((random _explosion_power)*2) - _explosion_power;
    _rand_expl_power3 = ((random _explosion_power)*2) - _explosion_power;
    _explosion_fragments_array = _explosion_fragments_array + [[(_rand_expl_power1) -_rand_expl_power1/2,(_rand_expl_power2) -_rand_expl_power2/2, (_rand_expl_power3) -_rand_expl_power3/2]];

    if (_i < 30/3) then {
		_rand_subexpl_power1 = ((random _explosion_power)/2) - _explosion_power/2;
		_rand_subexpl_power2 = ((random _explosion_power)/2) - _explosion_power/2;
		_rand_subexpl_power3 = ((random _explosion_power)/2) - _explosion_power/2;
		_explosion_subfragments_array = _explosion_subfragments_array + [[(_rand_subexpl_power1/4) -_rand_subexpl_power1/8,(_rand_subexpl_power2/4) -_rand_subexpl_power2/8, (_rand_subexpl_power3/4) -_rand_subexpl_power3/8]];
    };
};

[
    "normal",
    selectRandom [[(random 50) -5,(random 200)-5, (random 200) + 50], [(random 50) -5, -((random 200)-5), (random 200) + 50]],
    _explosion_power,
    30,
    [0.8,0.1,0.1],
    _explosion_fragments_array,
    _explosion_subfragments_array,
    "launch1",
    "whistling1",
    "bang01",
    "fizz_single_type1_1",
    "fizz_group1"
] spawn ALF_fnc_fireworksLaunch;

["red", getPos player,"fizzer"] remoteExec ["HC_fnc_fire",HC2_Life];
*/