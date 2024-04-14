private _taux = [_this, 0, 0, [0]] call BIS_fnc_param;

if (alf_drug isEqualTo 0) then {
	alf_drug = _taux;
	[13] spawn SOCK_fnc_updatePartial;
	[] spawn {
		private _effect = ppEffectCreate ["ChromAberration", 3500];
		"radialBlur" ppEffectEnable true;
		"radialBlur" ppEffectAdjust[random 0.09,random 0.09,0.25,0.25];
		"radialBlur" ppEffectCommit 2;
		_effect ppEffectEnable true;
		_effect ppEffectForceInNVG true;

		private _animated = false;
		private _i = 10;
		while {_i > 1} do {
			_effect ppEffectAdjust [alf_drug, alf_drug, true];
			_effect ppEffectCommit 5;
			waitUntil {ppEffectCommitted _effect};
			_i = _i - 1;
		};

		enableCamShake true;
		while {alf_drug > 0} do {
			private _reduce = 0.01;
			
			player enableFatigue false;

			if (!(player getVariable ["ReviveMedic", false])) then {
				if (alf_drug > 4) then {
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
			
			addcamShake[random 3, 1, random 3];
			
			if (alf_drug > 1.82) then {
				player setAnimSpeedCoef 1.4;
			} else {
				if (alf_drug > 1.3) then {
					player setAnimSpeedCoef alf_drug/1.3;
				} else {
					player setAnimSpeedCoef 1;
				};
			};
			
			_effect ppEffectAdjust [alf_drug, alf_drug, true];
			_effect ppEffectCommit 10;
			waitUntil {ppEffectCommitted _effect};
			alf_drug = alf_drug - 0.01;
		};

		if (alf_drug < 0) then {alf_drug = 0};
		resetCamShake;
		player enableFatigue true;
		_effect ppEffectEnable false;
		ppEffectDestroy _effect;
		"radialBlur" ppEffectEnable false;
		player setAnimSpeedCoef 1;
	};
} else {
	alf_drug = alf_drug + _taux;
	if (alf_drug < 0) then {alf_drug = 0};
};