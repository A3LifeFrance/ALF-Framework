if(isDedicated) exitWith {};

// Register HUD layer
CRP_var_ThsLayer = "CRPTHSLayer" call BIS_fnc_rscLayer;

// reload mutex, you can't play signal while reloading
CRP_var_ThsReloadMutex = true;

// avilable sounds array
CRP_var_ThsTapShoulderSounds = [
	"CRP_tactical_hand_signals\snd\crp_ths_tap_shoulder_03.ogg",
	"CRP_tactical_hand_signals\snd\crp_ths_tap_shoulder_05.ogg",
	"CRP_tactical_hand_signals\snd\crp_ths_tap_shoulder_09.ogg"
];

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "toggle", localize "STR_CRP_TACTICAL_HAND_SIGNALS_TOGGLE", {call CRP_fnc_toggleThsMod}, {}, [DIK_P, [false, false, false]], false] call cba_fnc_addKeybind;

[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "tap", localize "STR_CRP_TACTICAL_HAND_SIGNALS_TAP_SHOULDER", {["GIVE"] call CRP_fnc_tapShoulder}, {}, [DIK_1, [false, false, false]], false] call cba_fnc_addKeybind;
[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "stop", localize "STR_CRP_TACTICAL_HAND_SIGNALS_STOP", {"CRPTHSStop" call CRP_fnc_playSignal}, {}, [DIK_2, [false, false, false]], false] call cba_fnc_addKeybind;
[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "cover", localize "STR_CRP_TACTICAL_HAND_SIGNALS_COVER", {"CRPTHSCover" call CRP_fnc_playSignal}, {}, [DIK_3, [false, false, false]], false] call cba_fnc_addKeybind;
[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "forward", localize "STR_CRP_TACTICAL_HAND_SIGNALS_FORWARD", {"CRPTHSForward" call CRP_fnc_playSignal}, {}, [DIK_4, [false, false, false]], false] call cba_fnc_addKeybind;
[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "regroup", localize "STR_CRP_TACTICAL_HAND_SIGNALS_REGROUP", {"CRPTHSRegroup" call CRP_fnc_playSignal}, {}, [DIK_5, [false, false, false]], false] call cba_fnc_addKeybind;
[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "engage", localize "STR_CRP_TACTICAL_HAND_SIGNALS_ENGAGE", {"CRPTHSEngage" call CRP_fnc_playSignal}, {}, [DIK_6, [false, false, false]], false] call cba_fnc_addKeybind;
[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "point", localize "STR_CRP_TACTICAL_HAND_SIGNALS_POINT", {"CRPTHSPoint" call CRP_fnc_playSignal}, {}, [DIK_7, [false, false, false]], false] call cba_fnc_addKeybind;
[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "hold", localize "STR_CRP_TACTICAL_HAND_SIGNALS_HOLD", {"CRPTHSHold" call CRP_fnc_playSignal}, {}, [DIK_8, [false, false, false]], false] call cba_fnc_addKeybind;
[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "warning", localize "STR_CRP_TACTICAL_HAND_SIGNALS_WARNING", {"CRPTHSWarning" call CRP_fnc_playSignal}, {}, [DIK_9, [false, false, false]], false] call cba_fnc_addKeybind;

if (56 in (actionKeys "LookAround")) then {
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "tapAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_TAP_SHOULDER_ALT", {["GIVE"] call CRP_fnc_tapShoulder}, {}, [DIK_1, [false, false, true]], false] call cba_fnc_addKeybind;
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "stopAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_STOP_ALT", {"CRPTHSStop" call CRP_fnc_playSignal}, {}, [DIK_2, [false, false, true]], false] call cba_fnc_addKeybind;
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "coverAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_COVER_ALT", {"CRPTHSCover" call CRP_fnc_playSignal}, {}, [DIK_3, [false, false, true]], false] call cba_fnc_addKeybind;
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "forwardAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_FORWARD_ALT", {"CRPTHSForward" call CRP_fnc_playSignal}, {}, [DIK_4, [false, false, true]], false] call cba_fnc_addKeybind;
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "regroupAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_REGROUP_ALT", {"CRPTHSRegroup" call CRP_fnc_playSignal}, {}, [DIK_5, [false, false, true]], false] call cba_fnc_addKeybind;
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "engageAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_ENGAGE_ALT", {"CRPTHSEngage" call CRP_fnc_playSignal}, {}, [DIK_6, [false, false, true]], false] call cba_fnc_addKeybind;
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "pointAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_POINT_ALT", {"CRPTHSPoint" call CRP_fnc_playSignal}, {}, [DIK_7, [false, false, true]], false] call cba_fnc_addKeybind;
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "holdAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_HOLD_ALT", {"CRPTHSHold" call CRP_fnc_playSignal}, {}, [DIK_8, [false, false, true]], false] call cba_fnc_addKeybind;
	[localize "STR_CRP_TACTICAL_HAND_SIGNALS_NAME", "warningAlt", localize "STR_CRP_TACTICAL_HAND_SIGNALS_WARNING_ALT", {"CRPTHSWarning" call CRP_fnc_playSignal}, {}, [DIK_9, [false, false, true]], false] call cba_fnc_addKeybind;
};

[] spawn {
	waitUntil {!(isNull (findDisplay 46))};

	// init
	CRP_var_ThsEnabled = true;

	// handle reloading
	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		if ((_this select 1) in actionKeys "ReloadMagazine") then {
			_weapon = currentWeapon player;

			if (_weapon != "") then {
				CRP_var_ThsReloadMutex = false;

				_weapon spawn {
					_gesture	= getText (configfile >> "CfgWeapons" >> _this >> "reloadAction");
					_isLauncher	= "Launcher" in ([configFile >> "CfgWeapons" >> _this, true] call BIS_fnc_returnParents);
					_config		= if (_isLauncher) then { "CfgMovesMaleSdr" } else { "CfgGesturesMale" };
					_duration	= getNumber (configfile >> _config >> "States" >> _gesture >> "speed");

					if (_duration != 0) then {
						_duration = if (_duration < 0) then { abs _duration } else { 1 / _duration };
					} else {
						_duration = 3;
					};

					sleep _duration;

					CRP_var_ThsReloadMutex = true;
				};
			};
		};

		false
	}];
};