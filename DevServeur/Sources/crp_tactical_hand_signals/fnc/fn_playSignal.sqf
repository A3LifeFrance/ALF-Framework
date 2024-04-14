private ["_handled", "_gesture"];
_handled = false;

if (CRP_var_ThsEnabled) then {
	if (CRP_var_ThsReloadMutex) then {

		if (ALF_Phone_tryCall || {lifeState player isEqualTo "INCAPACITATED"} || {ALF_Phone_inCall} || {ALF_ActivePrisePistolet} || {ALF_Phone_Ring} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender}) exitWith {};
		
		_gesture = _this;

		if (((animationState player) select [0, 12]) in ["amovpercmstp", "amovpercmwlk", "amovpercmtac"] && weaponLowered player) then {
			_gesture = format ["%1StandLowered", _this];
		};

		player playAction _gesture;
	};

	_handled = true;
};

_handled