class CfgPatches {
	class ALF_Anims {
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		version = "";
		requiredVersion = 1.50;
		requiredAddons[] = {"A3_Data_F"};
		author[] = {"NiiRoZz"};
	};
};

class CfgMovesBasic {
	class ManActions {
		ALF_Tel = "ALF_Tel";
		ALF_Menotter = "ALF_Menotter";
		ALF_Surrender = "ALF_Surrender";
		ALF_Pistolet_Essence = "ALF_Pistolet_Essence";
	};

	class Actions {
		class NoActions: ManActions {
			ALF_Tel[] = {"ALF_Tel", "Gesture"};
			ALF_Menotter[] = {"ALF_Menotter", "Gesture"};
			ALF_Surrender[] = {"ALF_Surrender", "Gesture"};
			ALF_Pistolet_Essence[] = {"ALF_Pistolet_Essence", "Gesture"};
		};
	};
};

class CfgGesturesMale {
	class Default;

	class BlendAnims {
		ALFRightArm[] = {
			"RightShoulder", 1,
			"RightArm", 1,
			"RightArmRoll", 1,
			"RightForeArm", 1,
			"RightForeArmRoll", 1,
			"RightHand", 1,
			"RightHandIndex1", 1,
			"RightHandIndex2", 1,
			"RightHandIndex3", 1,
			"RightHandMiddle1", 1,
			"RightHandMiddle2", 1,
			"RightHandMiddle3", 1,
			"RightHandPinky1", 1,
			"RightHandMiddle2", 1,
			"RightHandMiddle3", 1,
			"RightHandPinky1", 1,
			"RightHandPinky2", 1,
			"RightHandPinky3", 1,
			"RightHandRing", 1,
			"RightHandRing1", 1,
			"RightHandRing2", 1,
			"RightHandRing3", 1,
			"RightHandThumb1", 1,
			"RightHandThumb2", 1,
			"RightHandThumb3", 1
		};

		ALFRightAndLeftArm[] = {
			"RightShoulder", 1,
			"RightArm", 1,
			"RightArmRoll", 1,
			"RightForeArm", 1,
			"RightForeArmRoll", 1,
			"RightHand", 1,
			"RightHandIndex1", 1,
			"RightHandIndex2", 1,
			"RightHandIndex3", 1,
			"RightHandMiddle1", 1,
			"RightHandMiddle2", 1,
			"RightHandMiddle3", 1,
			"RightHandPinky1", 1,
			"RightHandMiddle2", 1,
			"RightHandMiddle3", 1,
			"RightHandPinky1", 1,
			"RightHandPinky2", 1,
			"RightHandPinky3", 1,
			"RightHandRing", 1,
			"RightHandRing1", 1,
			"RightHandRing2", 1,
			"RightHandRing3", 1,
			"RightHandThumb1", 1,
			"RightHandThumb2", 1,
			"RightHandThumb3", 1,
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
		class ALF_Base_Anim: Default {
			actions = "NoActions";
			canPullTrigger = 0;
			connectAs = "";
			connectFrom[] = {};
			connectTo[] = {};
			disableWeapons = 1;
			enableBinocular = 0;
			enableMissile = 0;
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
			mask = "ALFRightArm";
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
			rightHandIKCurve[] = {0, 1, 0.1, 0, 0.8, 0, 1, 1};
			rightHandIKEnd = 1;
		};

		class ALF_Tel: ALF_Base_Anim {
			file = "\ALF_Anims\rtm\anim_tel.rtm";
			speed = 1;
			looped = 1;
			preload = 1;
		};

		class ALF_Menotter: ALF_Base_Anim {
			file = "\ALF_Anims\rtm\anim_menotter.rtm";
			speed = 1;
			looped = 1;
			preload = 1;
			mask = "ALFRightAndLeftArm";
		};

		class ALF_Surrender: ALF_Base_Anim {
			file = "\ALF_Anims\rtm\anim_surrender.rtm";
			speed = 1;
			looped = 1;
			preload = 1;
			mask = "ALFRightAndLeftArm";
		};

		class ALF_Pistolet_Essence: ALF_Base_Anim {
			file = "\ALF_Anims\rtm\anim_pistolet_essence.rtm";
			speed = 1;
			looped = 1;
			preload = 1;
		};
	};
};
