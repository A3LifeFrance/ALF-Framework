class CfgPatches {
	class ALF_Peche {
		author = "ALF - TEAM";
		name = "Arma 3 Life France Mission File";
		url = "https://www.arma3lifefrance.fr/";
		requiredAddons[] = {"A3_Data_F","A3_Weapons_F"};
		requiredVersion = 0.1;
	};
};

class CfgMovesBasic
{
	class DefaultDie;
	class ManActions
	{
		ALF_peche_jeteligne[] = {"ALF_peche_jeteligne","Gesture"};
		ALF_peche_strike[] = {"ALF_peche_strike","Gesture"};
	};
	class Actions
	{
		class NoActions: ManActions{};
	};
};

class CfgGesturesMale
{
	class Default;
	class States
	{
		class ALF_peche_jeteligne: Default
		{
			file = "\ALF_Peche\anims\peche\jeteLigne.rtm";
			looped = 0;
			speed = -1.3;
			mask = "CanneAPecheMask";
		};
		class ALF_peche_strike: Default
		{
			file = "\ALF_Peche\anims\peche\pecheStrike.rtm";
			looped = 0;
			speed = -1;
			mask = "CanneAPecheMask";
		};
	};
	class BlendAnims
	{
		class MaskStart
		{
			weight = 0.85;
		};
		empty[] = {};
		CanneAPecheMask[] = {"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"MaskStart"};
	};
};

class CfgVehicles {
	class FloatingStructure_F;
	class ALF_BouchonPeche: FloatingStructure_F
	{
		mapSize = 0.34;
		author = "NiiRoZz";
		scope = 2;
		scopeCurator = 2;
		displayName = "Bouchon pour la pêche";
		model = "\ALF_Peche\bouchonPeche.p3d";
		cost = 3000;
		accuracy = 1000;
		icon = "iconObject_circle";
		destrType = "DestructNo";
		vehicleClass = "Submerged";
		class AnimationSources {
			class esconder {
				source = "user";
				initPhase = 0;
				animPeriod = 0.01;
			};
		};
	};
};

class CfgMagazines {
	class CA_Magazine;
	class ALF_appat: CA_Magazine
	{
		scope = 2;
		displayName = "Appat pour la pêche";
		picture = "\ALF_Peche\data\appat.paa";
		ammo = "ALF_appatAmmo";
		count = 1;
		initSpeed = 10;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "Appat qui permet de faire de la pêche";
	};
};

class CfgAmmo {
	class BulletBase;
	class ALF_appatAmmo: BulletBase
	{
		hit = 0;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "FxCartridge_65_caseless";
		visibleFire = 5;
		audibleFire = 8;
		cost = 1.2;
		aiAmmoUsageFlags = "64 + 128 + 256";
		typicalSpeed = 20;
		caliber = 0.3;
		model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		tracerScale = 1;
		tracerStartTime = 0;
		tracerEndTime = 0;
		airFriction = 2;
		dangerRadiusBulletClose = 8;
		dangerRadiusHit = 12;
		suppressionRadiusBulletClose = 6;
		suppressionRadiusHit = 8;
		shootDistraction = 10;
		timeToLive = 0.3;
		class CamShakeFire
		{
			power = 0;
			duration = 0;
			frequency = 0;
			distance = 0;
		};
		class CamShakePlayerFire
		{
			power = 0;
			duration = 0;
			frequency = 0;
			distance = 0;
		};
		soundDefault1[] = {};
		soundDefault2[] = {};
		soundDefault3[] = {};
		soundDefault4[] = {};
		soundDefault5[] = {};
		soundHitBody1[] = {};
		soundHitBody2[] = {};
		soundConcrete1[] = {};
		soundConcrete2[] = {};
		soundConcrete3[] = {};
		soundGlass1[] = {};
		soundGlass2[] = {};
		soundGlass3[] = {};
		soundGlass4[] = {};
		soundGroundHard1[] = {};
		soundGroundHard2[] = {};
		soundRubber1[] = {};
		soundRubber2[] = {};
		soundWater1[] = {};
		bulletFly1[] = {};
		bulletFly2[] = {};
		bulletFly3[] = {};
		bulletFly4[] = {};
		bulletFly5[] = {};
		bulletFly6[] = {};
		bulletFly7[] = {};
		bulletFly8[] = {};
		bulletFly[] = {};
		hitDefault[] = {};
		hitGlass[] = {};
		hitGroundHard[] = {};
		hitConcrete[] = {};
		hitRubber[] = {};
		hitWater[] = {"soundWater1",0};
		hitMan[] = {};
		supersonicCrackNear[] = {"",0,0,0};
		supersonicCrackFar[] = {"",0,0,0};
	};
};

class Mode_SemiAuto;
class WeaponSlotsInfo;
class MuzzleSlot;
class CowsSlot;
class PointerSlot;
class UnderBarrelSlot;
class CfgWeapons {
	class Rifle;
  class Rifle_Base_F: Rifle {
    class WeaponSlotsInfo;
  };

	class ALF_CanneAPeche: Rifle
	{
		scope = 2;
		magazines[] = {"ALF_appat"};
		displayName = "Canne à Peche";
		model = "\ALF_Peche\canneAPeche.p3d";
		picture = "\ALF_Peche\data\fishing_ui.paa";
		weaponInfoType = "RscWeaponZeroing";
		reloadAction = "GestureReloadMX";
		magazineReloadSwitchPhase = 0.4;
		discreteDistanceInitIndex = 0;
		maxRecoilSway = 0.0125;
		swayDecaySpeed = 1.25;
		inertia = 0.5;
		initSpeed = -1;
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			mass = 4;
			class MuzzleSlot: MuzzleSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {};
				iconPosition[] = {0,0.45};
				iconScale = 0.2;
				iconPicture = "\A3\Weapons_F\Data\UI\attachment_muzzle.paa";
				iconPinpoint = "Center";
			};
			class CowsSlot: CowsSlot
			{
				iconPosition[] = {0.5,0.35};
				compatibleItems[] = {};
				iconScale = 0.2;
			};
			class PointerSlot: PointerSlot
			{
				iconPosition[] = {0.2,0.45};
				compatibleItems[] = {};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: UnderBarrelSlot
			{
				iconPosition[] = {0.2,0.7};
				iconScale = 0.2;
				compatibleItems[] = {};
			};
		};
		distanceZoomMin = 50;
		distanceZoomMax = 50;
		descriptionShort = "Canne à peche";
		handAnim[] = {"OFP2_ManSkeleton","\ALF_Peche\anims\peche\AnimMain_CanneAPeche.rtm"};
		dexterity = 1.8;
		caseless[] = {"",1,1,1};
		soundBullet[] = {"caseless",1};
		modes[] = {"Single"};
		class Single: Mode_SemiAuto
		{
			sounds[] = {"StandardSound"};
			class BaseSoundModeType
			{
				weaponSoundEffect = "DefaultRifle";
				closure1[] = {"ALF_CanneAPeche",1.4125376,1,10};
				closure2[] = {"ALF_CanneAPeche",1.4125376,1,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
			};
			class StandardSound: BaseSoundModeType
			{
				begin1[] = {"\ALF_Peche\sounds\swing.wav",1.4125376,1,1600};
				begin2[] = {"\ALF_Peche\sounds\swing.wav",1.4125376,1,1600};
				soundBegin[] = {"begin1",0.5,"begin2",0.5};
			};
			reloadTime = 3;
			dispersion = 0.00087;
			recoil = "recoil_single_primary_prone_3outof10";
			recoilProne = "recoil_single_primary_prone_3outof10";
			minRange = 2;
			minRangeProbab = 0.5;
			midRange = 200;
			midRangeProbab = 0.7;
			maxRange = 400;
			maxRangeProbab = 0.3;
		};
		aiDispersionCoefY = 6;
		aiDispersionCoefX = 4;
		drySound[] = {"A3\sounds_f\weapons\Other\dry_1",0.56234133,1,10};
		reloadMagazineSound[] = {"A3\sounds_f\weapons\reloads\new_MX",0.39810717,1,30};
		muzzleend = "konec hlavne";
		muzzlepos = "usti hlavne";
	};
};
