#include "BIS_AddonInfo.hpp"
class CfgPatches {
	class CRP_TACTICAL_HAND_SIGNALS {
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		version = "1.2.4";
		requiredVersion = 1.50;
		requiredaddons[] = {"cba_keybinding", "cba_extended_eventhandlers"};
		author[] = {"Emperias", "Zigomarvin"};
	};
};

class Extended_PreInit_EventHandlers {
	CRP_TACTICAL_HAND_SIGNALS_init = "call compile preProcessFileLineNumbers '\crp_tactical_hand_signals\XEH_preClientInit.sqf'";
};

class CfgFunctions {
	class CRP {
		class Gestures {
			file = "\crp_tactical_hand_signals\fnc";
			class toggleThsMod {};
			class tapShoulder {};
			class playSignal {};
		};
	};
};

class CfgMovesBasic {
	class ManActions {
		CRPTHSForward = "CRPTHSForward";
		CRPTHSStop = "CRPTHSStop";
		CRPTHSCover = "CRPTHSCover";
		CRPTHSRegroup = "CRPTHSRegroup";
		CRPTHSEngage = "CRPTHSEngage";
		CRPTHSPoint = "CRPTHSPoint";
		CRPTHSHold = "CRPTHSHold";
		CRPTHSWarning = "CRPTHSWarning";

		CRPTHSForwardStandLowered = "CRPTHSForwardStandLowered";
		CRPTHSStopStandLowered = "CRPTHSStopStandLowered";
		CRPTHSCoverStandLowered = "CRPTHSCoverStandLowered";
		CRPTHSRegroupStandLowered = "CRPTHSRegroupStandLowered";
		CRPTHSEngageStandLowered = "CRPTHSEngageStandLowered";
		CRPTHSPointStandLowered = "CRPTHSPointStandLowered";
		CRPTHSHoldStandLowered = "CRPTHSHoldStandLowered";
		CRPTHSWarningStandLowered = "CRPTHSWarningStandLowered";
	};

	class Actions {
		class NoActions: ManActions {
			CRPTHSForward[] = {"CRPTHSForward", "Gesture"};
			CRPTHSStop[] = {"CRPTHSStop", "Gesture"};
			CRPTHSCover[] = {"CRPTHSCover", "Gesture"};
			CRPTHSRegroup[] = {"CRPTHSRegroup", "Gesture"};
			CRPTHSEngage[] = {"CRPTHSEngage", "Gesture"};
			CRPTHSPoint[] = {"CRPTHSPoint", "Gesture"};
			CRPTHSHold[] = {"CRPTHSHold", "Gesture"};
			CRPTHSWarning[] = {"CRPTHSWarning", "Gesture"};

			CRPTHSForwardStandLowered[] = {"CRPTHSForwardStandLowered", "Gesture"};
			CRPTHSStopStandLowered[] = {"CRPTHSStopStandLowered", "Gesture"};
			CRPTHSCoverStandLowered[] = {"CRPTHSCoverStandLowered", "Gesture"};
			CRPTHSRegroupStandLowered[] = {"CRPTHSRegroupStandLowered", "Gesture"};
			CRPTHSEngageStandLowered[] = {"CRPTHSEngageStandLowered", "Gesture"};
			CRPTHSPointStandLowered[] = {"CRPTHSPointStandLowered", "Gesture"};
			CRPTHSHoldStandLowered[] = {"CRPTHSHoldStandLowered", "Gesture"};
			CRPTHSWarningStandLowered[] = {"CRPTHSWarningStandLowered", "Gesture"};
		};
	};
};

class CfgGesturesMale {
	class Default;

	class BlendAnims {
		CRPTHSLeftArm[] = {
			"LeftShoulder", 1,
			"LeftArm", 1,
			"LeftArmRoll", 1,
			"LeftForeArm", 1,
			"LeftForeArmRoll", 1,
			"LeftHand", 1,
			"LeftHandIndex1", 1,
			"LeftHandIndex2", 1,
			"LeftHandIndex3", 1,
			"LeftHandMiddle1", 1,
			"LeftHandMiddle2", 1,
			"LeftHandMiddle3", 1,
			"LeftHandPinky1", 1,
			"LeftHandMiddle2", 1,
			"LeftHandMiddle3", 1,
			"LeftHandPinky1", 1,
			"LeftHandPinky2", 1,
			"LeftHandPinky3", 1,
			"LeftHandRing", 1,
			"LeftHandRing1", 1,
			"LeftHandRing2", 1,
			"LeftHandRing3", 1,
			"LeftHandThumb1", 1,
			"LeftHandThumb2", 1,
			"LeftHandThumb3", 1
		};
	};

	class States {
		class CRPTHSBase: Default {
			actions = "NoActions";
			canPullTrigger = 0;
			connectAs = "";
			connectFrom[] = {};
			connectTo[] = {};
			disableWeapons = 0;
			enableBinocular = 1;
			enableMissile = 1;
			enableOptics = 0;
			equivalentTo = "";
			file = "\A3\anims_f\Data\Anim\Sdr\gst\GestureHi.rtm";
			forceAim = 0;
			headBobMode = 0;
			headBobStrength = 0;
			interpolateFrom[] = {};
			interpolateTo[] = {};
			interpolateWith[] = {};
			interpolationRestart = 0;
			interpolationSpeed = 6;
			looped = 0;
			mask = "CRPTHSLeftArm";
			minPlayTime = 0.5;
			preload = 0;
			ragdoll = 0;
			relSpeedMax = 1;
			relSpeedMin = 1;
			showHandGun = 0;
			showItemInHand = 0;
			showItemInRightHand = 0;
			showWeaponAim = 1;
			soundEdge[] = {0.5,1};
			soundEnabled = 1;
			soundOverride = "";
			speed = -2;
			static = 0;
			terminal = 0;
			Walkcycles = 1;
			weaponIK = 1;

			leftHandIKBeg = 1;
			leftHandIKCurve[] = {0, 1, 0.1, 0, 0.8, 0, 1, 1};
			leftHandIKEnd = 1;

			rightHandIKBeg = 1;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = 1;
		};

		class CRPTHSForward: CRPTHSBase {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_forward.rtm";
			speed = 1;
		};

		class CRPTHSForwardStandLowered: CRPTHSForward {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_forward_stand_lowered.rtm";
		};

		class CRPTHSStop: CRPTHSForward {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_stop.rtm";
			speed = 0.6;
		};

		class CRPTHSStopStandLowered: CRPTHSStop {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_stop_stand_lowered.rtm";
		};

		class CRPTHSCover: CRPTHSForward {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_cover.rtm";
			speed = 0.8;
		};

		class CRPTHSCoverStandLowered: CRPTHSCover {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_cover_stand_lowered.rtm";
		};

		class CRPTHSRegroup: CRPTHSForward {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_regroup.rtm";
			speed = 0.8;
		};

		class CRPTHSRegroupStandLowered: CRPTHSRegroup {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_regroup_stand_lowered.rtm";
		};

		class CRPTHSEngage: CRPTHSForward {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_engage.rtm";
			speed = 0.9;
		};

		class CRPTHSEngageStandLowered: CRPTHSEngage {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_engage_stand_lowered.rtm";
		};

		class CRPTHSPoint: CRPTHSForward {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_point.rtm";
			speed = 0.8;
		};

		class CRPTHSPointStandLowered: CRPTHSPoint {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_point_stand_lowered.rtm";
		};

		class CRPTHSHold: CRPTHSForward {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_hold.rtm";
			speed = 0.8;
		};

		class CRPTHSHoldStandLowered: CRPTHSHold {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_hold_stand_lowered.rtm";
		};

		class CRPTHSWarning: CRPTHSForward {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_warning.rtm";
			speed = 0.8;
		};

		class CRPTHSWarningStandLowered: CRPTHSWarning {
			file = "\crp_tactical_hand_signals\rtm\crp_ths_warning_stand_lowered.rtm";
		};
	};
};

#define CT_STRUCTURED_TEXT 13
#define ST_LEFT 0x00
#define GUI_FONT_NORMAL PuristaMedium

#define CRP_TACTICAL_HAND_SIGNALS_W 0.25
#define CRP_TACTICAL_HAND_SIGNALS_H 0.12
#define CRP_TACTICAL_HAND_SIGNALS_X 0.5
#define CRP_TACTICAL_HAND_SIGNALS_Y 0.72
#define CRP_TACTICAL_HAND_SIGNALS_RATIO safeZoneH * 0.2
#define CRP_TACTICAL_HAND_SIGNALS_mainDivX safeZoneX + ((1 - CRP_TACTICAL_HAND_SIGNALS_W) * CRP_TACTICAL_HAND_SIGNALS_X) * safeZoneW
#define CRP_TACTICAL_HAND_SIGNALS_mainDivY safeZoneY + ((1 - CRP_TACTICAL_HAND_SIGNALS_H) * CRP_TACTICAL_HAND_SIGNALS_Y) * safeZoneH
#define CRP_TACTICAL_HAND_SIGNALS_mainDivW safeZoneW * CRP_TACTICAL_HAND_SIGNALS_W
#define CRP_TACTICAL_HAND_SIGNALS_mainDivH safeZoneH * CRP_TACTICAL_HAND_SIGNALS_H

class RscStructuredText;

class RscTitles {
	class RscCrpThsMod {
		idd = 124593;
		onLoad = "uiNamespace setVariable ['RscCrpThsMod', _this select 0];";

		fadein = 0;
		duration = 0.25;
		fadeout = 3;

		class Controls {
			class Background: RscStructuredText {
				idc = 25348;
				type = CT_STRUCTURED_TEXT;
				style = ST_LEFT;

				x = CRP_TACTICAL_HAND_SIGNALS_mainDivX;
				y = CRP_TACTICAL_HAND_SIGNALS_mainDivY;
				w = CRP_TACTICAL_HAND_SIGNALS_mainDivW;
				h = CRP_TACTICAL_HAND_SIGNALS_mainDivH;

				size = CRP_TACTICAL_HAND_SIGNALS_RATIO;
				text = "";
				colorbackground[] = {0,0,0,0};

				class Attributes {
					align = "center";
					color = "#ffffff";
					size = CRP_TACTICAL_HAND_SIGNALS_RATIO;
					font = GUI_FONT_NORMAL;
				};
			};
		};
	};
};
