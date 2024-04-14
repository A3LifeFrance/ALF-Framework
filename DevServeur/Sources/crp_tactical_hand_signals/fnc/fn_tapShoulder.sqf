private ["_handled", "_mod", "_caller", "_target", "_units", "_count", "_dirs", "_i", "_c", "_ctrl", "_text", "_playerEyePos", "_targetEyePos", "_euclideanDist", "_midDist", "_sourcePos"];

_handled = false;

_mod = _this select 0;

switch (_mod) do {
	case "GIVE": {
		if (CRP_var_ThsEnabled) then {
			_units = [nearestObjects [player, ["CAManBase"], 2], { isPlayer _x && ((side _x) == (side player)) }] call BIS_fnc_conditionalSelect;
			_units deleteAt 0;
			_count = count _units;
			_dirs = [];
			_target = objNull;

			switch (true) do {
				case (_count == 1): {
					_target = _units select 0;
				};

				case (_count > 1): {
					// if player is moving
					if (vectorMagnitude (velocity player) > 0.25) then {
						_velDir = [player, (getPosASL player) vectorAdd (velocity player)] call BIS_fnc_dirTo;

						for [{_i = 0}, {_i < _count}, {_i = _i + 1}] do {
							_relDir = [player, _units select _i] call BIS_fnc_dirTo;
							_dirDif = abs (_velDir - _relDir);
							if (_dirDif < 360 && _dirDif >= 180) then { _dirDif = 180 - (_dirDif - 180); };
							_dirs set [_i, _dirDif];
						};
					// if he's static
					} else {
						for [{_i = 0}, {_i < _count}, {_i = _i + 1}] do {
							_dirDif = [player, getposASL (_units select _i)] call BIS_fnc_relativeDirTo;
							if (_dirDif < 360 && _dirDif >= 180) then { _dirDif = 180 - (_dirDif - 180); };
							_dirs set [_i, _dirDif];
						};
					};

					_target = _units select (([_dirs, [_dirs, 0] call BIS_fnc_findExtreme] call BIS_fnc_arrayFindDeep) select 0);
				};
			};

			if !(isNull _target) then {
				// [["TAKE", _target, player], "CRP_fnc_tapShoulder", [_target, player], false, true] call BIS_fnc_MP;
				["TAKE", _target, player] remoteExecCall ["CRP_fnc_tapShoulder", [_target, player]];

				_sourcePos = ((eyePos player) vectorAdd (eyePos _target)) vectorMultiply 0.5;

				playSound3D [CRP_var_ThsTapShoulderSounds call BIS_fnc_selectRandom, _sourcePos, false, _sourcePos, 1.3, 0.9 + random 0.2, 10];
			};

			_handled = true;
		};
	};

	case "TAKE": {
		_target = _this select 1;
		_caller = _this select 2;

		_name = "";
		_image = "";

		if (_target == player) then {
			_name = name _caller;
			_image = "crp_ths_tap_shoulder_take_ca";
		} else {
			_name = name _target;
			_image = "crp_ths_tap_shoulder_give_ca";
		};

		addCamShake [1, 1, 4];

		CRP_var_ThsLayer cutText ["", "PLAIN", 0, false];
		CRP_var_ThsLayer cutRsc ["RscCrpThsMod", "PLAIN", 0, false];

		disableSerialization;

		_ctrl = uiNamespace getVariable "RscCrpThsMod";
		_text = format ["<img image='\crp_tactical_hand_signals\ui\%1.paa' size='0.46' shadow='0' />", _image, [[_name, "<", "&lt;"] call CBA_fnc_replace, ">", "&gt;"] call CBA_fnc_replace];
		(_ctrl displayCtrl 25348) ctrlSetStructuredText parseText _text;
	};
};

_handled