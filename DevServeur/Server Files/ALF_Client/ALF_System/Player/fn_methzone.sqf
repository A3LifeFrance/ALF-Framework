params [
	["_player", objNull, [objNull]]
];

_damage = getDammage _player;
_uniform = uniform _player;

_rad1 = ppEffectCreate ["ChromAberration",200];
_rad2 = ppEffectCreate ["DynamicBlur",500];
_rad3 = ppEffectCreate ["FilmGrain",2000];
 
if (!alive _player || (_damage == 1) || (_player getVariable ["exitRad",true]) || (_player getVariable ["ReviveMedic",false])) exitWith {
    _player setVariable ["exitRad",true];
    _rad1 ppEffectEnable false;
    _rad1 ppEffectAdjust [0,0,true];
    _rad1 ppEffectCommit 1;
    _rad2 ppEffectEnable false;
    _rad2 ppEffectAdjust [0];
    _rad2 ppEffectCommit 1;
    _rad3 ppEffectEnable false;
    _rad3 ppEffectAdjust [0,0,0,0,0,true];
    _rad3 ppEffectCommit 1;
};
 
if (_uniform in ["U_ALF_TenueMeth_Blanc","U_ALF_TenueMeth_GND","U_ALF_TenueMeth_SP"]) then {

    for "_i" from 0 to 4 do {
		_rad1 ppEffectEnable true;
		_rad1 ppEffectAdjust [-0.02,0,true];
		_rad1 ppEffectCommit 1;
		_rad2 ppEffectEnable true;
		_rad2 ppEffectAdjust [0.03];
		_rad2 ppEffectCommit 1;
		_rad3 ppEffectEnable true;
		_rad3 ppEffectAdjust [0.12,1.52,3.54,2,2,true];
		_rad3 ppEffectCommit 1;
	};
    sleep 5;
 
    [_player] remoteExec ["alf_fnc_methzone",_player];
 
} else {

    for "_i" from 0 to 4 do {
		_rad1 ppEffectEnable true;
		_rad1 ppEffectAdjust [-0.02,0,true];
		_rad1 ppEffectCommit 1;
		_rad2 ppEffectEnable true;
		_rad2 ppEffectAdjust [0.03];
		_rad2 ppEffectCommit 1;
		_rad3 ppEffectEnable true;
		_rad3 ppEffectAdjust [0.12,1.52,3.54,2,2,true];
		_rad3 ppEffectCommit 1;
	};
    sleep 5;
 
    _player setDamage (_damage + 0.05);
 
    [_player] remoteExec ["alf_fnc_methzone",_player];
};