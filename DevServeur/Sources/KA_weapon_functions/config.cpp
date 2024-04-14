
class CfgPatches
{
	class KA_Weapon_Functions
	{
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		requiredVersion = 1.56;
		requiredAddons[] = {"CBA_MAIN","A3_Weapons_F","asdg_jointrails"};
		author[] = {"KICKASS"};
		versionAct = "";
		version = "1.0.2";
		versionStr = "1.0.2";
		versionAr[] = {1,0,2};
	};
};
class CfgMods
{
	class Mod_Base;
	class KICKASS: Mod_Base
	{
		picture = "\KA_weapon_functions\KA_logo.paa";
		logo = "\KA_weapon_functions\KA_logo.paa";
		logoOver = "\KA_weapon_functions\KA_logo.paa";
		logoSmall = "\KA_weapon_functions\KA_logo.paa";
		name = "KICKASS MOD";
		hideName = "true";
		actionName = "QQ";
		action = "307752601";
		author = "KICKASS";
		timepacked = "1426373691";
		dlcColor[] = {0.19,0.54,0.8,1};
		dir = "KICKASS";
	};
};
class CfgSettings
{
	class CBA
	{
		class Versioning
		{
			class KA
			{
				main_addon = "KA_Weapon_Functions";
			};
		};
	};
};
class Extended_FiredBIS_EventHandlers
{
	class CAManBase
	{
		class KA_Fired
		{
			FiredBIS = "if ( local (_this select 0) ) then { [_this select 0,_this select 1] spawn KA_fnc_disposableFired; if( getText(configFile>>'CfgAmmo'>>_this select 4>>'KA_ASTProjectile') !='' ) then {[_this select 6,_this select 4] spawn KA_fnc_AST}; if(getNumber(configFile>>'CfgAmmo'>>_this select 4>>'KA_thermobaric')>0)then{[_this select 1,_this select 6,_this select 4] spawn KA_fnc_thermobaricFired}; if(getNumber(configFile>>'CfgWeapons'>>_this select 1>>'KA_useBoltAction')>0)then{_this spawn KA_fnc_boltAction}; };";
		};
	};
};
class RscInGameUI
{
	class RscWeaponEmpty;
	class RscWeaponEmpty_KA_Disposable_Preload: RscWeaponEmpty
	{
		onLoad = "_this call KA_fnc_disposablePreload";
	};
};
class Extended_PostInit_EventHandlers
{
	class AGM_Laserpointer
	{
		clientInit = "call compile preprocessFileLineNumbers '\KA_weapon_functions\clientInit.sqf';";
	};
};
class CfgFunctions
{
	class AGM_Laserpointer
	{
		class AGM_Laserpointer
		{
			file = "KA_weapon_functions\functions";
			class drawLaserpoint;
			class onDraw;
		};
	};
	class KA
	{
		tag = "KA";
		class functions
		{
			file = "\KA_weapon_functions\scripts";
			class AST;
			class disableSimulation;
			class disposableFired;
			class disposablePreload;
			class boltAction_postInit
			{
				postInit = 1;
			};
			class boltAction;
			class boltAction_ejectEffect;
			class addTurret;
			class getTurrets;
			class getTurretIndex;
			class isTurnedOut;
			class thermobaric_isTurnedOut;
			class inflictFatigue;
			class thermobaricFired;
			class thermobaric;
		};
	};
};
class CfgVehicles
{
	class Land_TacticalBacon_F;
	class Bolt_eject_127: Land_TacticalBacon_F
	{
		author = "gpgpgpgp";
		model = "\A3\weapons_f\ammo\cartridge_127";
	};
	class Bolt_eject_762: Land_TacticalBacon_F
	{
		author = "gpgpgpgp";
		model = "\A3\weapons_f\ammo\cartridge_762";
	};
	class Bolt_eject_556: Land_TacticalBacon_F
	{
		author = "gpgpgpgp";
		model = "\A3\Weapons_f\ammo\cartridge";
	};
	class Bolt_eject_65: Land_TacticalBacon_F
	{
		author = "gpgpgpgp";
		model = "\A3\weapons_f\ammo\cartridge_65";
	};
	class Bolt_eject_9mm: Land_TacticalBacon_F
	{
		author = "gpgpgpgp";
		model = "\A3\Weapons_f\ammo\cartridge_small";
	};
};
class CfgMovesBasic
{
	class ManActions
	{
		gestureBoltAction = "gestureBoltAction";
	};
	class Actions
	{
		class NoActions: ManActions
		{
			gestureBoltAction[] = {"gestureBoltAction","Gesture"};
		};
		class RifleBaseStandActions;
		class RifleProneActions: RifleBaseStandActions
		{
			gestureBoltAction[] = {"gestureBoltActionLying","Gesture"};
		};
		class RifleAdjustProneBaseActions;
		class RifleAdjustRProneActions: RifleAdjustProneBaseActions
		{
			gestureBoltAction[] = {"gestureBoltActionLying","Gesture"};
		};
		class RifleAdjustLProneActions: RifleAdjustProneBaseActions
		{
			gestureBoltAction[] = {"gestureBoltActionLying","Gesture"};
		};
		class RifleAdjustFProneActions: RifleAdjustProneBaseActions
		{
			gestureBoltAction[] = {"gestureBoltActionLying","Gesture"};
		};
	};
};
class CfgGesturesMale
{
	class Default;
	class States
	{
		class GestureReloadLRR;
		class gestureBoltAction: GestureReloadLRR
		{
			file = "KA_weapon_functions\anims\boltAction.rtm";
			looped = 0;
			speed = 0.55;   //.................
			mask = "handsWeapon";
			enableOptics = 1;
			rightHandIKBeg = 0;
			rightHandIKEnd = 0;
			rightHandIKCurve[] = {0};
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			leftHandIKCurve[] = {1};
			disableWeapons = 0;
			disableWeaponsLong = 0;
		};
		class gestureBoltActionLying: gestureBoltAction
		{
			file = "KA_weapon_functions\anims\boltActionLying.rtm";
		};
	};
};
class CfgMagazines
{
	class KA_SRAW_AT_Mag;
	class KA_SRAW_AT_USED: KA_SRAW_AT_Mag
   	{
		scope = 1;
		count = 0;
		type = 0;
		picture = "";
		model = "";
		displayName = "SRAW AT (Used)";
		descriptionShort = "";
	};
};
class asdg_SlotInfo;
class asdg_FrontSideRail: asdg_SlotInfo
{
	class compatibleItems
	{
		KA_ANPEQ15_Black_IR = 1;
		KA_ANPEQ15_Black_Red = 1;
		KA_ANPEQ15_Black_Green = 1;
		KA_ANPEQ15_Tan_IR = 1;
		KA_ANPEQ15_Tan_Red = 1;
		KA_ANPEQ15_Tan_Green = 1;
	};
};
class CfgWeapons
{
	class KA_SRAW;
	class KA_SRAW_used: KA_SRAW
	{
		displayName = "SRAW USED";
		descriptionShort = "launch_SRAW Cannot be re-used.";
		scope = 1;
		magazines[] = {"KA_SRAW_AT_USED"};
	};
	class ItemCore;
	class InventoryFlashLightItem_Base_F;
        class KA_ANPEQ15_Black_IR: ItemCore
	{
		author="KICKASS";
		dlc = "KICKASS";
		_generalMacro="KA_ANPEQ15_Black_IR";
		scope=2;
		baseWeapon = "KA_ANPEQ15_Black_IR";
		displayName = "ANPEQ15 Black Laser IR";
		descriptionUse = "KA_ANPEQ15_Black_IR";
		picture = "\KA_weapon_functions\Laser\Laser_Black.paa";
		model = "\KA_weapon_functions\Laser\PEQ15_Black.p3d";
		descriptionShort="Laser IR";
                class ItemInfo: InventoryFlashLightItem_Base_F
		{
			mass=6;
			class Pointer
			{
				irLaserPos="laser_pos";
				irLaserEnd="laser_dir";
				irDistance=5;
			};
			class FlashLight
			{
			};
		};
		inertia=0.1;
                MRT_SwitchItemNextClass = "KA_ANPEQ15_Black_Red";
		MRT_SwitchItemPrevClass = "KA_ANPEQ15_Black_Green";
		MRT_SwitchItemHintText = "Laser IR";
	};
	class KA_ANPEQ15_Black_Red: ItemCore
	{
		author="KICKASS";
		dlc = "KICKASS";
		_generalMacro = "KA_ANPEQ15_Black_Red";
		scope = 1;
		baseWeapon = "KA_ANPEQ15_Black_Red";
		displayName = "ANPEQ15 Black Laser Red";
		descriptionUse = "KA_ANPEQ15_Black_Red";
		picture = "\KA_weapon_functions\Laser\Laser_Black.paa";
		model = "\KA_weapon_functions\Laser\PEQ15_Black.p3d";
		descriptionShort = "Laser Red";
		class ItemInfo: InventoryFlashLightItem_Base_F
		{
			mass = 6;
			class Pointer{};
			class FlashLight
			{
				color[] = {0,0,0};
				ambient[] = {0,0,0};
				intensity = 0;
				size = 0;
				innerAngle = 0;
				outerAngle = 0;
				coneFadeCoef = 5;
				position = "flash dir";
				direction = "flash";
				useFlare = 0;
				flareSize = 0;
				flareMaxDistance = "100.0f";
				dayLight = 0;
				class Attenuation
				{
					start = 0;
					constant = 0;
					linear = 0;
					quadratic = 0;
					hardLimitStart = 0;
					hardLimitEnd = 0;
				};
				scale[] = {0};
			};
		};
		inertia = 0.1;
		AGM_SightBearLaser = 1;
                AGM_LaserPointerType = 1;
		AGM_LaserPointerRange = 100;
		MRT_SwitchItemNextClass = "KA_ANPEQ15_Black_Green";
		MRT_SwitchItemPrevClass = "KA_ANPEQ15_Black_IR";
		MRT_SwitchItemHintText = "Laser Red";
	};
	class KA_ANPEQ15_Black_Green: KA_ANPEQ15_Black_Red
	{
		author="KICKASS";
		dlc = "KICKASS";
		_generalMacro = "KA_ANPEQ15_Black_Green";
		scope = 1;
		baseWeapon = "KA_ANPEQ15_Black_Green";
		displayName = "ANPEQ15 Black Laser Green";
		descriptionUse = "KA_ANPEQ15_Black_Green";
		picture = "\KA_weapon_functions\Laser\Laser_Black.paa";
		model = "\KA_weapon_functions\Laser\PEQ15_Black.p3d";
		descriptionShort = "Laser Green";
		AGM_SightBearLaser = 1;
                AGM_LaserPointerType = 2;
		AGM_LaserPointerRange = 100;
		MRT_SwitchItemNextClass = "KA_ANPEQ15_Black_IR";
		MRT_SwitchItemPrevClass = "KA_ANPEQ15_Black_Red";
		MRT_SwitchItemHintText = "Laser Green";
	};
        class KA_ANPEQ15_Tan_IR: KA_ANPEQ15_Black_IR
	{
		author="KICKASS";
		dlc = "KICKASS";
		_generalMacro="KA_ANPEQ15_Tan_IR";
		scope=2;
		baseWeapon = "KA_ANPEQ15_Tan_IR";
		displayName = "ANPEQ15 Tan Laser IR";
		descriptionUse = "KA_ANPEQ15_Tan_IR";
		picture = "\KA_weapon_functions\Laser\Laser_Tan.paa";
		model = "\KA_weapon_functions\Laser\PEQ15_Tan.p3d";
		descriptionShort="Laser IR";
		inertia=0.1;
                MRT_SwitchItemNextClass = "KA_ANPEQ15_Tan_Red";
		MRT_SwitchItemPrevClass = "KA_ANPEQ15_Tan_Green";
		MRT_SwitchItemHintText = "Laser IR";
	};
	class KA_ANPEQ15_Tan_Red: KA_ANPEQ15_Black_Red
	{
		author="KICKASS";
		dlc = "KICKASS";
		_generalMacro = "KA_ANPEQ15_Tan_Red";
		scope = 1;
		baseWeapon = "KA_ANPEQ15_Tan_Red";
		displayName = "ANPEQ15 Tan Laser Red";
		descriptionUse = "KA_ANPEQ15_Tan_Red";
		picture = "\KA_weapon_functions\Laser\Laser_Tan.paa";
		model = "\KA_weapon_functions\Laser\PEQ15_Tan.p3d";
		descriptionShort = "Laser Red";
		inertia = 0.1;
		AGM_SightBearLaser = 1;
                AGM_LaserPointerType = 1;
		AGM_LaserPointerRange = 100;
		MRT_SwitchItemNextClass = "KA_ANPEQ15_Tan_Green";
		MRT_SwitchItemPrevClass = "KA_ANPEQ15_Tan_IR";
		MRT_SwitchItemHintText = "Laser Red";
	};
	class KA_ANPEQ15_Tan_Green: KA_ANPEQ15_Black_Green
	{
		author="KICKASS";
		dlc = "KICKASS";
		_generalMacro = "KA_ANPEQ15_Tan_Green";
		scope = 1;
		baseWeapon = "KA_ANPEQ15_Tan_Green";
		displayName = "ANPEQ15 Tan Laser Green";
		descriptionUse = "KA_ANPEQ15_Tan_Green";
		picture = "\KA_weapon_functions\Laser\Laser_Tan.paa";
		model = "\KA_weapon_functions\Laser\PEQ15_Tan.p3d";
		descriptionShort = "Laser Green";
		AGM_SightBearLaser = 1;
                AGM_LaserPointerType = 2;
		AGM_LaserPointerRange = 100;
		MRT_SwitchItemNextClass = "KA_ANPEQ15_Tan_IR";
		MRT_SwitchItemPrevClass = "KA_ANPEQ15_Tan_Red";
		MRT_SwitchItemHintText = "Laser Green";
	};
};
