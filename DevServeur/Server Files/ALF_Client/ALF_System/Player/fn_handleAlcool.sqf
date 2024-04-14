private "_amount";
_amount = [_this, 0, 0, [0]] call BIS_fnc_param;

if (life_drunk isEqualTo 0) then {
	life_drunk = _amount;
	[13] spawn SOCK_fnc_updatePartial;
	[] spawn {
		private["_effect", "_i", "_animated"];
		_effect = ppEffectCreate ["ChromAberration", 3500];
		_effect ppEffectEnable true;
		_effect ppEffectForceInNVG true;

		_animated = false;
		_i = 10;
		while {_i > 1} do {
			_effect ppEffectAdjust [life_drunk, life_drunk, true];
			_effect ppEffectCommit 5;
			waitUntil {ppEffectCommitted _effect};
			_i = _i - 1;
		};

		while {life_drunk > 0} do {
			if (!(player getVariable ["ReviveMedic", false])) then {
				if (life_drunk > 5) then {
					if (((vehicle player) isKindOf "Man") && ((animationState player) != "incapacitated")) then {
						player playMove "incapacitated";
						_animated = true;
					};
				} else {
					if (((animationState player) == "incapacitated") && _animated) then {
						player playMoveNow "amovppnemstpsraswrfldnon";
					};
				};
			};

			_effect ppEffectAdjust [life_drunk, life_drunk, true];
			_effect ppEffectCommit 10;
			waitUntil {ppEffectCommitted _effect};
			life_drunk = life_drunk - 0.03;
		};

		if (life_drunk < 0) then {life_drunk = 0};
		_effect ppEffectEnable false;
		ppEffectDestroy _effect;
	};
} else {
	life_drunk = life_drunk + _amount;
	if (life_drunk > 3) then {life_drunk = 3};
	if (life_drunk < 0) then {life_drunk = 0};
};