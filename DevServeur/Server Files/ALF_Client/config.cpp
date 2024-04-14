class CfgPatches {
	class ALF_Client {
		author = "ALF Team";
		name = "Arma 3 Life France Mission File";
		url = "https://www.arma3lifefrance.fr/";
		requiredAddons[] = {"A3_Data_F","a3_ui_f","A3_BaseConfig_F","A3_Sounds_F","A3_Anims_F","A3_Anims_F_Config_Sdr","A3_Weapons_F","A3_Structures_F_Naval","A3_Characters_F","A3_Structures_F_Heli_Items_Electronics","A3_Structures_F","A3_Functions_F","ALF_Pompiers","A3_Data_F_ParticleEffects","A3_Animals_F_Beta_Dog"};
		requiredVersion = 1.64;
		units[] = {};
		weapons[] = {};
		addonsversion = "16.00";
	};
};

#include "ALF_Items2.hpp"
#include "ALF_Vehicles2.hpp"
#include "Config_Interaction.hpp"

class Mode_SemiAuto;
class Mode_FullAuto;
class WeaponSlotsInfo;
class MuzzleSlot;
class CowsSlot;
class PointerSlot;
class UnderBarrelSlot;

class CfgFunctions {
	class A3_Structures {
		class Scripts {
			class Door {
				file = "\ALF_Client\ALF_System\Door\fn_Door.sqf";
			};
		};
	};
};

class CfgVideoOptions {
	class Particles
	{
		class High2
		{
			text = "Ultra";
			particlesSoftLimit = 16000;
			particlesHardLimit = 18000;
			smokeGenMinDist = 400;
			smokeGenMaxDist = 1600;
			smokeSizeCoef = 2.6;
			smokeIntervalCoef = 4;
			smokeZoomCoef = 1.42857;
			highQualityShader = 1;
			numFullSizeParticles = 120;
		};
	};

	class DynamicLights
	{
		class VeryUltra
		{
			text = "Ultra+";
			value = 40;
		};
		class Extreme
		{
			text = "Extreme";
			value = 65;
		};
	};

	class TextureQuality
	{
		class VeryLow2
		{
			text = "Super Faible";
			mipBias = 13;
			vramNeeded = 0;
		};
		class VeryHigh2
		{
			text = "Ultra+";
			mipBias = -1;
			vramNeeded = 796;
		};
	};

	class ObjectsQuality
	{
		class VeryLow2
		{
			text = "Super Faible";
			value = 100000;
		};
		class VeryHigh2
		{
			text = "Ultra+";
			value = 2600000;
		};
	};

	class TerrainQuality
	{
		class VeryHigh2
		{
			text = "Next level";
			terrainGrid = 2.9;
		};
		class VeryLow2
		{
			text = "Super Faible";
			terrainGrid = 100;
		};
	};

	class WaterSSReflectionsQuality
	{
		class High2
		{
			text = "Splendide";
			value = 1.5;
		};
	};
};

class CfgActions {
	class None;
	class OpenBag: None
	{
		show = 0;
	};
	class TakeBag: None
	{
		show = 0;
	};
	class TakeWeapon: None
	{
		show = 0;
	};
	class TakeItemFromBody: None
	{
		show = 0;
	};
	class TakeWeaponFromBody: None
	{
		show = 0;
	};
	class TakeBackpackFromBody: None
	{
		show = 0;
	};
	class TakeMine: None
	{
		show = 0;
	};
	class Repair: None {
		show = 0;
	};
	class RepairVehicle: None {
		show = 0;
	};
	class HealSoldier: None {
		show = 0;
	};
	class Heal: None {
		show = 0;
	};
	class FirstAid: None {
		show = 0;
	};
	class HealSoldierSelf: None {
		show = 0;
	};
	class HealBleedingSelfOnly: None {
		show = 0;
	};
	class HealSoldierAuto: None {
		show = 0;
	};
	class HealBleedingAuto: None {
		show = 0;
	};
	class GetInDriver: None {
		show = 0;
	};
	class GetInCargo: None {
		show = 0;
	};
};

class ALF_EauPompier {
	class ALF_EauPompier {
		intensity = 1;
		interval = 1;
		lifeTime = -1;
		position[] = {0,0,0};
		simulation = "particles";
		type = "ALF_EauPompier";
	};
};

class CfgAmmo {
	class Bulletbase;
	class ALF_FireNozzle_Ammo: Bulletbase {
		effectFly = "ALF_EauPompier";
		deflecting = 0;
		hitArmor[] = {};
		hitArmorInt[] = {};
		hitBuilding[] = {};
		hitConcrete[] = {};
		hitDefault[] = {};
		hitFoliage[] = {};
		hitGlass[] = {};
		hitGlassArmored[] = {};
		hitGround[] = {};
		hitGroundHard[] = {};
		hitGroundSoft[] = {};
		hitIron[] = {};
		hitMan[] = {};
		hitMetal[] = {};
		hitMetalInt[] = {};
		hitMetalplate[] = {};
		hitPlastic[] = {};
		hitRubber[] = {};
		hitTyre[] = {};
		hitWood[] = {};
		impactGlass[] = {};
		impactGlassArmored[] = {};
	};
};

class CfgWeapons {
	class ItemCore;
	class SlotInfo;
	class InventoryOpticsItem_Base_F;
	
	class HeadgearItem;
	class H_PilotHelmetHeli_B;
	class ALF_H_PilotHelmetHeli_B : H_PilotHelmetHeli_B {
		scope = 2;
		displayName = "Casque de Pilote";
		model = "A3\Characters_F\Common\headgear_helmet_heli";
		picture = "\A3\characters_f\Data\UI\icon_H_Pilot_Helmet_Heli_B_CA.paa";
		hiddenSelectionsTextures[] = {"\A3\Characters_F\Common\Data\helmet_heli_blk_co.paa"};
		
		class ItemInfo : HeadgearItem {
			mass = 1;
			uniformModel = "A3\Characters_F\Common\headgear_helmet_heli";
			modelSides[] = {3, 1};
			armor = 3*0.5;
		};
	};

	class Rifle;
	class Rifle_Base_F: Rifle {
		class GunParticles;
		class WeaponSlotsInfo;
	};
	class ALF_FakePrimaryWeapon: Rifle_Base_F {
		scope = 1;
		scopeCurator = 1;
		scopeArsenal = 1;
		displayName = "";
		model = "\A3\Weapons_f\empty";
		picture = "";
		magazines[] = {"ALF_FakeMagazine"};
		discreteDistance[] = {};
		discreteDistanceInitIndex = 0;
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 0;
		};
	};

	class V_Rangemaster_belt;
	class ALF_Rangemaster_belt: V_Rangemaster_belt {
		class ItemInfo {
			_generalMacro = "VestItem";
			armor = "5*0";
			author = "Bohemia Interactive";
			containerClass = "Supply20";
			hiddenSelections[] = {};
			hitpointName = "HitBody";
			mass = 5;
			overlaySelectionsInfo[] = {"Ghillie_hide"};
			passThrough = 1;
			scope = 0;
			showHolsteredPistol = 0;
			type = 701;
			uniformModel = "\A3\Characters_F\BLUFOR\equip_b_belt";
			uniformType = "Default";
		};
	};

	class arifle_AKS_F;
	class base_ALF_W_AKS : arifle_AKS_F {
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_W_AKS: base_ALF_W_AKS {
		_generalMacro = "ALF_W_AKS";
		baseWeapon = "ALF_W_AKS";
		scope = 2;
		magazines[] = {"ALF_30Rnd_545x39_Mag_Tracer_F"};
		class WeaponSlotsInfo: WeaponSlotsInfo	{
			mass = 25;
		};
	};

	class ItemGPS;
	class ALF_GPS: ItemGPS {
		displayName = "GPS Belle Ile";
		descriptionUse = "Permet d'utiliser le GPS de ALF";
		descriptionShort = "Permet d'utiliser le GPS de ALF.";
	};

	class hgun_Pistol_01_F;
	class ALF_Pistol_01_F_base: hgun_Pistol_01_F {
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_hgun_Pistol_01_F : ALF_Pistol_01_F_base {
		scope = 2;
		magazines[] = {"ALF_10Rnd_9x21_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class hgun_Pistol_heavy_01_F;
	class ALF_Pistol_heavy_01_F_base: hgun_Pistol_heavy_01_F {
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_hgun_Pistol_heavy_01_F : ALF_Pistol_heavy_01_F_base {
		scope = 2;
		magazines[] = {"ALF_11Rnd_45ACP_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class hgun_Pistol_heavy_02_F;
	class ALF_Pistol_heavy_02_F_base: hgun_Pistol_heavy_02_F {
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_hgun_Pistol_heavy_02_F : ALF_Pistol_heavy_02_F_base {
		scope = 2;
		magazines[] = {"ALF_6Rnd_45ACP_Cylinder"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class hgun_P07_F;
	class ALF_P07_F_base: hgun_P07_F {
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_hgun_P07_F : ALF_P07_F_base {
		scope = 2;
		magazines[] = {"ALF_16Rnd_9x21_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class hgun_ACPC2_F;
	class ALF_ACPC2_F_base: hgun_ACPC2_F {
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_hgun_ACPC2_F : ALF_ACPC2_F_base {
		scope = 2;
		magazines[] = {"ALF_9Rnd_45ACP_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class SMG_05_F;
	class ALF_SMG_05_F_base: SMG_05_F {
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_SMG_05_F : ALF_SMG_05_F_base {
		scope = 2;
		magazines[] = {"ALF_30Rnd_9x21_Mag_SMG_02"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class SMG_01_F;
	class ALF_SMG_01_F_base: SMG_01_F	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_SMG_01_F : ALF_SMG_01_F_base {
		scope = 2;
		magazines[] = {"ALF_30Rnd_45ACP_Mag_SMG_01"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class hgun_PDW2000_F;
	class ALF_PDW2000_F_base: hgun_PDW2000_F	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_PDW2000_F : ALF_PDW2000_F_base {
		scope = 2;
		magazines[] = {"ALF_30Rnd_9x21_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_mk1_virtual;
	class ALF_bnae_mk1_virtual_base: bnae_mk1_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_mk1_virtual : ALF_bnae_mk1_virtual_base {
		scope = 2;
		magazines[] = {"ALF_10Rnd_303_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class arifle_KA_SKS_F;
	class ALF_arifle_KA_SKS_F_base: arifle_KA_SKS_F	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_arifle_KA_SKS_F : ALF_arifle_KA_SKS_F_base {
		scope = 2;
		magazines[] = {"ALF_10Rnd_M43_762x39_Ball"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_spr220_virtual;
	class ALF_bnae_spr220_virtual_base: bnae_spr220_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_spr220_virtual : ALF_bnae_spr220_virtual_base {
		scope = 2;
		magazines[] = {"ALF_2Rnd_00_Buckshot_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class KA_M1014;
	class ALF_KA_M1014_base: KA_M1014	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_KA_M1014 : ALF_KA_M1014_base {
		scope = 2;
		magazines[] = {"ALF_6Rnd_M1014_buck","ALF_6Rnd_M1014_PPA","ALF_6Rnd_M1014_slug"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_m97_virtual;
	class ALF_bnae_m97_virtual_base: bnae_m97_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_m97_virtual : ALF_bnae_m97_virtual_base {
		scope = 2;
		magazines[] = {"ALF_2Rnd_00_Buckshot_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class R3F_MP5A5;
	class ALF_R3F_MP5A5_base: R3F_MP5A5	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_R3F_MP5A5 : ALF_R3F_MP5A5_base {
		scope = 2;
		magazines[] = {"ALF_R3F_30Rnd_9x19_MP5"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_uspm;
	class ALF_RH_uspm_base: RH_uspm	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_uspm : ALF_RH_uspm_base {
		scope = 2;
		magazines[] = {"ALF_RH_16Rnd_40cal_usp"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class KA_Glock_17_Single;
	class ALF_KA_Glock_17_Single_base: KA_Glock_17_Single	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_KA_Glock_17_Single : ALF_KA_Glock_17_Single_base {
		scope = 2;
		magazines[] = {"ALF_KA_17Rnd_9x19_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class RH_vp70;
	class ALF_RH_vp70_base: RH_vp70	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_vp70 : ALF_RH_vp70_base {
		scope = 2;
		magazines[] = {"ALF_RH_18Rnd_9x19_VP"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class RH_cz75;
	class ALF_RH_cz75_base: RH_cz75	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_cz75 : ALF_RH_cz75_base {
		scope = 2;
		magazines[] = {"ALF_RH_16Rnd_9x19_CZ"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class RH_m9;
	class ALF_RH_m9_base: RH_m9	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_m9 : ALF_RH_m9_base {
		scope = 2;
		magazines[] = {"ALF_RH_15Rnd_9x19_M9"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class RH_kimber;
	class ALF_RH_kimber_base: RH_kimber	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_kimber : ALF_RH_kimber_base {
		scope = 2;
		magazines[] = {"ALF_RH_7Rnd_45cal_m1911"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class RH_kimber_nw;
	class ALF_RH_kimber_nw_base: RH_kimber_nw	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_kimber_nw : ALF_RH_kimber_nw_base {
		scope = 2;
		magazines[] = {"ALF_RH_7Rnd_45cal_m1911"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class bnae_r1_virtual;
	class ALF_bnae_r1_virtual_base: bnae_r1_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_r1_virtual : ALF_bnae_r1_virtual_base {
		scope = 2;
		magazines[] = {"ALF_8Rnd_45GAP_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_r1_c_virtual;
	class ALF_bnae_r1_c_virtual_base: bnae_r1_c_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_r1_c_virtual : ALF_bnae_r1_c_virtual_base {
		scope = 2;
		magazines[] = {"ALF_8Rnd_45GAP_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_r1_e_virtual;
	class ALF_bnae_r1_e_virtual_base: bnae_r1_e_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_r1_e_virtual : ALF_bnae_r1_e_virtual_base {
		scope = 2;
		magazines[] = {"ALF_8Rnd_45GAP_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_r1_m_virtual;
	class ALF_bnae_r1_m_virtual_base: bnae_r1_m_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_r1_m_virtual : ALF_bnae_r1_m_virtual_base {
		scope = 2;
		magazines[] = {"ALF_8Rnd_45GAP_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_r1_t_virtual;
	class ALF_bnae_r1_t_virtual_base: bnae_r1_t_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_r1_t_virtual : ALF_bnae_r1_t_virtual_base {
		scope = 2;
		magazines[] = {"ALF_8Rnd_45GAP_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_bull;
	class ALF_RH_bull_base: RH_bull	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_bull : ALF_RH_bull_base {
		scope = 2;
		magazines[] = {"ALF_RH_6Rnd_454_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_bullb;
	class ALF_RH_bullb_base: RH_bullb	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_bullb : ALF_RH_bullb_base {
		scope = 2;
		magazines[] = {"ALF_RH_6Rnd_454_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_python;
	class ALF_RH_python_base: RH_python	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_python : ALF_RH_python_base {
		scope = 2;
		magazines[] = {"ALF_RH_6Rnd_357_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class RH_mp412;
	class ALF_RH_mp412_base: RH_mp412	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_mp412 : ALF_RH_mp412_base {
		scope = 2;
		magazines[] = {"ALF_RH_6Rnd_357_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_mateba;
	class ALF_RH_mateba_base: RH_mateba	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_mateba : ALF_RH_mateba_base {
		scope = 2;
		magazines[] = {"ALF_RH_6Rnd_44_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_saa_c_virtual;
	class ALF_bnae_saa_c_virtual_base: bnae_saa_c_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_saa_c_virtual : ALF_bnae_saa_c_virtual_base {
		scope = 2;
		magazines[] = {"ALF_6Rnd_357M_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_Deagles;
	class ALF_RH_Deagles_base: RH_Deagles	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_Deagles : ALF_RH_Deagles_base {
		scope = 2;
		magazines[] = {"ALF_RH_7Rnd_50_AE"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class Desert_Eagle;
	class ALF_Desert_Eagle_base: Desert_Eagle	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_Desert_Eagle : ALF_Desert_Eagle_base {
		scope = 2;
		magazines[] = {"ALF_7Rnd_50_AE"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class KA_Px4;
	class ALF_KA_Px4_base: KA_Px4	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_KA_Px4 : ALF_KA_Px4_base {
		scope = 2;
		magazines[] = {"ALF_KA_Px4_17Rnd_9x19_FMJ_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class KA_Px4_Black;
	class ALF_KA_Px4_Black_base: KA_Px4_Black	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_KA_Px4_Black : ALF_KA_Px4_Black_base {
		scope = 2;
		magazines[] = {"ALF_KA_Px4_17Rnd_9x19_FMJ_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class bnae_l35_c_virtual;
	class ALF_bnae_l35_c_virtual_base: bnae_l35_c_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_l35_c_virtual : ALF_bnae_l35_c_virtual_base {
		scope = 2;
		magazines[] = {"ALF_8Rnd_9x19_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class RH_sw659;
	class ALF_RH_sw659_base: RH_sw659	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_sw659 : ALF_RH_sw659_base {
		scope = 2;
		magazines[] = {"ALF_RH_14Rnd_9x19_sw"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class RH_tec9;
	class ALF_RH_tec9_base: RH_tec9	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_tec9 : ALF_RH_tec9_base {
		scope = 2;
		magazines[] = {"ALF_RH_32Rnd_9x19_tec"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	class KA_PP19_MTK83;
	class ALF_KA_PP19_MTK83_base: KA_PP19_MTK83	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_KA_PP19_MTK83 : ALF_KA_PP19_MTK83_base {
		scope = 2;
		magazines[] = {"ALF_KA_64Rnd_9x18_PMM_FMJ_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_saa_virtual;
	class ALF_bnae_saa_virtual_base: bnae_saa_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_saa_virtual : ALF_bnae_saa_virtual_base {
		scope = 2;
		magazines[] = {"ALF_6Rnd_357M_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_m1911;
	class ALF_RH_m1911_base: RH_m1911	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_m1911 : ALF_RH_m1911_base {
		scope = 2;
		magazines[] = {"ALF_RH_7Rnd_45cal_m1911"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_tt33;
	class ALF_RH_tt33_base: RH_tt33	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_tt33 : ALF_RH_tt33_base {
		scope = 2;
		magazines[] = {"ALF_RH_8Rnd_762_tt33"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class bnae_spr220_so_virtual;
	class ALF_bnae_spr220_so_virtual_base: bnae_spr220_so_virtual	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_bnae_spr220_so_virtual : ALF_bnae_spr220_so_virtual_base {
		scope = 2;
		magazines[] = {"ALF_2Rnd_00_Buckshot_Magazine"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
	class RH_vz61;
	class ALF_RH_vz61_base: RH_vz61	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_RH_vz61 : ALF_RH_vz61_base {
		scope = 2;
		magazines[] = {"ALF_RH_20Rnd_32cal_vz61"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 15;
		};
	};
	//GN
	class KA_FNP45;
	class ALF_KA_FNP45_base: KA_FNP45	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_KA_FNP45 : ALF_KA_FNP45_base {
		scope = 2;
		magazines[] = {"ALF_KA_15Rnd_45ACP_Mag"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
			class CowsSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				displayName = "";
				compatibleItems[] = {"optic_Arco","optic_aco", "optic_ACO_grn","optic_hamr","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"};
				iconPicture="\A3\Weapons_F\Data\UI\attachment_top.paa";
				iconPinpoint="Bottom";
 			};
			class PointerSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				displayName = "";
				compatibleItems[] = {"KA_FNP45_Flashlight","acc_pointer_IR"}; 
 			};
		};
	};
	class hlc_smg_mp5a4;
	class ALF_hlc_smg_mp5a4_base: hlc_smg_mp5a4	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_hlc_smg_mp5a4 : ALF_hlc_smg_mp5a4_base {
		scope = 2;
		magazines[] = {"ALF_hlc_30Rnd_9x19_B_MP5"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
			class CowsSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				displayName = "";
				compatibleItems[] = {"optic_Arco","optic_aco", "optic_ACO_grn","optic_hamr","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"};
				iconPicture="\A3\Weapons_F\Data\UI\attachment_top.paa";
				iconPinpoint="Bottom";
 			};
			class PointerSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				displayName = "";
				compatibleItems[] = {"KA_UMP45_Flashlight","acc_pointer_IR","hlc_acc_Surefiregrip"}; 
 			};
		};
	};
	class hlc_smg_mp5a2;
	class ALF_hlc_smg_mp5a2_base: hlc_smg_mp5a2	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_hlc_smg_mp5a2 : ALF_hlc_smg_mp5a2_base {
		scope = 2;
		magazines[] = {"ALF_hlc_30Rnd_9x19_B_MP5"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
			class CowsSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				displayName = "";
				compatibleItems[] = {"optic_Arco","optic_aco", "optic_ACO_grn","optic_hamr","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"};
				iconPicture="\A3\Weapons_F\Data\UI\attachment_top.paa";
				iconPinpoint="Bottom";
 			};
			class PointerSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				displayName = "";
				compatibleItems[] = {"KA_UMP45_Flashlight","acc_pointer_IR","hlc_acc_Surefiregrip"}; 
 			};
		};
	};
	class hlc_smg_mp510;
	class ALF_hlc_smg_mp510_base: hlc_smg_mp510	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_hlc_smg_mp510 : ALF_hlc_smg_mp510_base {
		scope = 2;
		magazines[] = {"ALF_hlc_30Rnd_10mm_B_MP5"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
			class MuzzleSlot : MuzzleSlot {
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {"hlc_muzzle_Agendasix10mm"};
			};
			class CowsSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				displayName = "";
				compatibleItems[] = {"optic_Arco","optic_aco", "optic_ACO_grn","optic_hamr","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"};
				iconPicture="\A3\Weapons_F\Data\UI\attachment_top.paa";
				iconPinpoint="Bottom";
 			};
			class PointerSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				displayName = "";
				compatibleItems[] = {"acc_flashlight","acc_pointer_IR"}; 
 			};
		};
	};
	class R3F_Famas_F1;
	class ALF_R3F_Famas_F1_base: R3F_Famas_F1	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_R3F_Famas_F1 : ALF_R3F_Famas_F1_base {
		scope = 2;
		magazines[] = {"ALF_R3F_25Rnd_556x45_FAMAS"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
			class MuzzleSlot : MuzzleSlot {
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {"R3F_SILENCIEUX_HK416"};
			};
			class CowsSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				displayName = "";
				compatibleItems[] = {"R3F_AIMPOINT","optic_Arco","optic_aco", "optic_ACO_grn","optic_hamr","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"};
				iconPicture="\A3\Weapons_F\Data\UI\attachment_top.paa";
				iconPinpoint="Bottom";
 			};
			class PointerSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				displayName = "";
				compatibleItems[] = {"R3F_LAMPE_SURB","R3F_BIPIED_HK417","acc_flashlight"}; 
 			};
		};
	};
	class R3F_Famas_F1_HG;
	class ALF_R3F_Famas_F1_HG_base: R3F_Famas_F1_HG	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_R3F_Famas_F1_HG : ALF_R3F_Famas_F1_HG_base {
		scope = 2;
		magazines[] = {"ALF_R3F_25Rnd_556x45_FAMAS"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
			class MuzzleSlot : MuzzleSlot {
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {"R3F_SILENCIEUX_HK416"};
			};
			class CowsSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				displayName = "";
				compatibleItems[] = {"R3F_AIMPOINT","optic_Arco","optic_aco", "optic_ACO_grn","optic_hamr","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"};
				iconPicture="\A3\Weapons_F\Data\UI\attachment_top.paa";
				iconPinpoint="Bottom";
 			};
			class PointerSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				displayName = "";
				compatibleItems[] = {"R3F_LAMPE_SURB","R3F_BIPIED_HK417","acc_flashlight"}; 
 			};
		};
	};
	class R3F_HK416S_HG;
	class ALF_R3F_HK416S_HG_base: R3F_HK416S_HG	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_R3F_HK416S_HG : ALF_R3F_HK416S_HG_base {
		scope = 2;
		magazines[] = {"ALF_R3F_30Rnd_556x45_HK416"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
			class MuzzleSlot : MuzzleSlot {
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {"R3F_SILENCIEUX_HK416"};
			};
			class CowsSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				displayName = "";
				compatibleItems[] = {"R3F_AIMPOINT","optic_Arco","optic_aco", "optic_ACO_grn","optic_hamr","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"};
				iconPicture="\A3\Weapons_F\Data\UI\attachment_top.paa";
				iconPinpoint="Bottom";
 			};
			class PointerSlot : SlotInfo {
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				displayName = "";
				compatibleItems[] = {"R3F_LAMPE_SURB","R3F_BIPIED_HK417","acc_flashlight"}; 
 			};
		};
	};
	class KA_KSG_Black;
	class ALF_KA_KSG_Black_base: KA_KSG_Black	{
		scope = 0;
		class WeaponSlotsInfo;
	};
	class ALF_KA_KSG_Black : ALF_KA_KSG_Black_base {
		scope = 2;
		magazines[] = {"ALF_R3F_30Rnd_556x45_HK416"};
		class WeaponSlotsInfo : WeaponSlotsInfo {
			mass = 25;
		};
	};
};

class CfgSounds {
	sounds[] = {};
	class guardian
	{
		name = "guardian";
		sound[] = {"\ALF_Client2\sounds\guardian.ogg", 1.0, 1, 50};
		titles[] = {};
	};
	class defib
	{
		name = "defib";
		sound[] = {"\ALF_Client2\sounds\defib.ogg", 1.0, 1, 75};
		titles[] = {};
	};
	class ventil1
	{
		name = "ventil1";
		sound[] = {"\ALF_Client2\sounds\ventil1.ogg", 1.0, 1, 75};
		titles[] = {};
	};
	class ventil2
	{
		name = "ventil2";
		sound[] = {"\ALF_Client2\sounds\ventil2.ogg", 1.0, 1, 75};
		titles[] = {};
	};
	class pompier
	{
		name = "pompier";
		sound[] = {"\ALF_Client2\sounds\pompier.ogg", 0.8, 1, 150};
		titles[] = {};
	};
	class flashRadarM
	{
		name = "flashRadarM";
		sound[] = {"\ALF_Client2\sounds\flashRadarM.ogg", 2.0, 1, 25};
		titles[] = {};
	};
	class ALF_CarAlarm1
	{
		name = "ALF_CarAlarm1";
		sound[] = {"\ALF_Client2\sounds\ALF_CarAlarm1.ogg", 1.0, 1, 150};
		titles[] = {};
	};
	class ALF_CarAlarm2
	{
		name = "ALF_CarAlarm2";
		sound[] = {"\ALF_Client2\sounds\ALF_CarAlarm2.ogg", 1.0, 1, 150};
		titles[] = {};
	};
	class ALF_Menottes
	{
		name = "ALF_Menottes";
		sound[] = {"\ALF_Client2\sounds\menottes.ogg", db+0, 1};
		titles[] = {};
	};
	class ALF_Sifler
	{
		name = "ALF_Sifler";
		sound[] = {"\ALF_Client2\sounds\sifler.ogg", db+0, 1};
		titles[] = {};
	};
	class ALF_Sifflet
	{
		name = "ALF_Sifflet";
		sound[] = {"\ALF_Client2\sounds\sifflet.ogg", db+0, 1};
		titles[] = {};
	};
	class ALF_action_refuel
	{
		name = "ALF_action_refuel";
		sound[] = {"\ALF_Client2\sounds\action_refuel.ogg", db+0, 1};
		titles[] = {};
	};
	class ALF_knock_door
	{
		name = "ALF_knock_door";
		sound[] = {"\ALF_Client2\sounds\knock_door.ogg", db+0, 1};
		titles[] = {};
	};
	class ALF_launch1
	{
		name = "ALF_launch1";
		sound[] = {"\ALF_Client2\sounds\launch1.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_launch2
	{
		name = "ALF_launch2";
		sound[] = {"\ALF_Client2\sounds\launch2.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_whistling1
	{
		name = "ALF_whistling1";
		sound[] = {"\ALF_Client2\sounds\whistling1.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_whistling2
	{
		name = "ALF_whistling2";
		sound[] = {"\ALF_Client2\sounds\whistling2.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_bang01
	{
		name = "ALF_bang01";
		sound[] = {"\ALF_Client2\sounds\bang01.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_bang02
	{
		name = "ALF_bang02";
		sound[] = {"\ALF_Client2\sounds\bang02.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_fizz_single_type1_1
	{
		name = "ALF_fizz_single_type1_1";
		sound[] = {"\ALF_Client2\sounds\fizz_single_type1_1.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_fizz_single_type1_2
	{
		name = "ALF_fizz_single_type1_2";
		sound[] = {"\ALF_Client2\sounds\fizz_single_type1_2.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_fizz_group1
	{
		name = "ALF_fizz_group1";
		sound[] = {"\ALF_Client2\sounds\fizz_group1.ogg", 5, 1};
		titles[] = {};
	};
	class ALF_fizz_group2
	{
		name = "ALF_fizz_group2";
		sound[] = {"\ALF_Client2\sounds\fizz_group2.ogg", 5, 1};
		titles[] = {};
	};
	
	class ALF_CB1
	{
		name = "ALF_CB1";
		sound[] = {"\ALF_Client2\sounds\ALF_CB1.ogg", 1.0, 1};
		titles[] = {};
	};
	class phone_call
	{
		name = "phone_call";
		sound[] = {"\ALF_Client2\sounds\phone_call.ogg", 1.0, 1};
		titles[] = {};
	};
	class sms_vibreur {
		name = "sms_vibreur";
		sound[] = {"\ALF_Client2\sounds\sms_vibreur.ogg", 2.0, 1};
		titles[] = {};
	};
	class ring_vibreur {
		name = "ring_vibreur";
		sound[] = {"\ALF_Client2\sounds\ring_vibreur.ogg", 2.0, 1, 30};
		titles[] = {};
	};
	class iPhone_sms {
		name = "iPhone_sms";
		sound[] = {"\ALF_Client2\sounds\iPhone_sms.ogg", 2.0, 1, 60};
		titles[] = {};
	};
	class Sony_sms {
		name = "Sony_sms";
		sound[] = {"\ALF_Client2\sounds\Sony_sms.ogg", 1.8, 1, 60};
		titles[] = {};
	};
	class coin_drop {
		name = "coin_drop";
		// filename, volume, pitch, distance (optional)
		sound[] = { "\ALF_Client2\sounds\coin_drop.ogg", 3, 1, 10 };
		titles[] = {};
	};
	class active_levier {
		name = "active_levier";
		sound[] = { "\ALF_Client2\sounds\active_levier.ogg", db+5, 1, 10 };
		titles[] = {};
	};
	class SonyRing {
		name = "SonyRing";
		sound[] = {"\ALF_Client2\sounds\SonyRing.ogg", 1.2, 1, 50};
		titles[] = {};
	};
	class iPhoneRing1 {
		name = "iPhoneRing1";
		sound[] = {"\ALF_Client2\sounds\iPhoneRing1.ogg", 2.0, 1, 60};
		titles[] = {};
	};
	class iPhoneRing2 {
		name = "iPhoneRing2";
		sound[] = {"\ALF_Client2\sounds\iPhoneRing2.ogg", 1.5, 1, 50};
		titles[] = {};
	};
	class iPhoneRing3 {
		name = "iPhoneRing3";
		sound[] = {"\ALF_Client2\sounds\iPhoneRing3.ogg", 1.5, 1, 50};
		titles[] = {};
	};
	class nokia_sms {
		name = "nokia_sms";
		sound[] = {"\ALF_Client2\sounds\nokia_sms.ogg", 1.8, 1, 40};
		titles[] = {};
	};
	class nokia_bip
	{
		name = "nokia_bip";
		sound[] = {"\ALF_Client2\sounds\nokia_bip.ogg", 1.0, 1};
		titles[] = {};
	};
	class nokia_ring
	{
		name = "nokia_ring";
		sound[] = {"\ALF_Client2\sounds\nokia_ring.ogg", 2.0, 1, 60};
		titles[] = {};
	};
	class nokia_end
	{
		name = "nokia_end";
		sound[] = {"\ALF_Client2\sounds\nokia_end.ogg", 1.0, 1};
		titles[] = {};
	};
	class message_sent
	{
		name = "message_sent";
		sound[] = {"\ALF_Client2\sounds\message_sent.ogg", 1.0, 1};
		titles[] = {};
	};
	class nokia_echec
	{
		name = "nokia_echec";
		sound[] = {"\ALF_Client2\sounds\nokia_echec.ogg", 1.0, 1};
		titles[] = {};
	};
	class ALF_Four {
		name = "ALF_Four";
		sound[] = {"\ALF_Client2\sounds\ALF_Four.ogg", 1.0, 1, 35};
		titles[] = {};
	};

	class medicSiren {
		name = "medicSiren";
		sound[] = {"\ALF_Client2\sounds\medic_siren.ogg", 2.0, 1, 400};
		titles[] = {};
	};
	class rhume_1
	{
		name = "rhume_1";
		sound[] = {"\ALF_Client2\sounds\rhume_1.ogg", 2.0, 1, 30};
		titles[] = {};
	};
	class rhume_2
	{
		name = "rhume_2";
		sound[] = {"\ALF_Client2\sounds\rhume_2.ogg", 2.0, 1, 30};
		titles[] = {};
	};
	class cough_0
	{
		name = "cough_0";
		sound[] = {"\ALF_Client2\sounds\cough_0.ogg", 2.0, 1, 30};
		titles[] = {};
	};
	class cough_1
	{
		name = "cough_1";
		sound[] = {"\ALF_Client2\sounds\cough_1.ogg", 2.0, 1, 30};
		titles[] = {};
	};
	class cough_2
	{
		name = "cough_2";
		sound[] = {"\ALF_Client2\sounds\cough_0.ogg", 2.0, 1, 30};
		titles[] = {};
	};

	class tazersound {
		name = "tazersound";
		sound[] = {"\ALF_Client2\sounds\tazer.ogg", 1, 1, 35};
		titles[] = {};
	};

	class flashbang {
		name = "flashbang";
		sound[] = {"\ALF_Client2\sounds\flashbang.ogg", 0.8, 1};
		titles[] = {};
	};

	class mining {
		name = "mining";
		sound[] = {"\ALF_Client2\sounds\mining.ogg", 1.0, 1};
		titles[] = {};
	};

	class harvest {
		name = "harvest";
		sound[] = {"\ALF_Client2\sounds\harvest.ogg", 1.0, 1};
		titles[] = {};
	};

	class LockCarSound {
		name = "LockCarSound";
		sound[] = {"\ALF_Client2\sounds\car_lock.ogg", 1.0, 1, 35};
		titles[] = {};
	};

	class UnlockCarSound {
		name = "UnlockCarSound";
		sound[] = {"\ALF_Client2\sounds\unlock.ogg", 1.0, 1, 35};
		titles[] = {};
	};

	class pompe_wip
	{
		name = "pompe_wip";
		sound[] = {"\ALF_Client2\sounds\pompe_wip.ogg", 1.0, 1, 75};
		titles[] = {0, ""};
	};

	class truck_wip
	{
		name = "truck_wip";
		sound[] = {"\ALF_Client2\sounds\truck_wip.ogg", 1.0, 1, 100};
		titles[] = {0, ""};
	};

	////////////////////////////////////////////////////////////////////////////////////////////////

	class t_close_1
	{
		name = "t_close_1";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_1.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_2
	{
		name = "t_close_2";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_2.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_3
	{
		name = "t_close_3";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_3.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_5
	{
		name = "t_close_5";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_5.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_8
	{
		name = "t_close_8";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_8.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_9
	{
		name = "t_close_9";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_9.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_10
	{
		name = "t_close_10";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_10.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_12
	{
		name = "t_close_12";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_12.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_14
	{
		name = "t_close_14";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_14.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_15
	{
		name = "t_close_15";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_15.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_17
	{
		name = "t_close_17";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_17.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};
	class t_close_18
	{
		name = "t_close_18";
		sound[] = {"\ALF_Client2\thunderbolt\t_close_18.ogg", db+20, 1.0};
		titles[] = {0, ""};
	};

// far f
	class t_far_1
	{
		name = "t_far_1";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_1.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_3
	{
		name = "t_far_3";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_3.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_4
	{
		name = "t_far_4";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_4.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_5
	{
		name = "t_far_5";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_5.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_6
	{
		name = "t_far_6";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_6.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_8
	{
		name = "t_far_8";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_8.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_9
	{
		name = "t_far_9";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_9.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_10
	{
		name = "t_far_10";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_10.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_15
	{
		name = "t_far_15";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_15.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_18
	{
		name = "t_far_18";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_18.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_19
	{
		name = "t_far_19";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_19.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_20
	{
		name = "t_far_20";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_20.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_21
	{
		name = "t_far_21";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_21.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class t_far_22
	{
		name = "t_far_22";
		sound[] = {"\ALF_Client2\thunderbolt\t_far_22.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
};

class CfgSFX {
	class C2GIGN
	{
    	sound0[] = {"\ALF_Client2\sounds\banque_activeC4.ogg", 2.5, 1.0, 35, 1, 0, 0, 0};
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
	class SirenLong
	{
    	sound0[] = {"\ALF_Client2\sounds\Siren_Long.ogg", 2.5, 1.0, 500, 1, 0, 0, 0};  // path to addon sound
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class medicSiren
	{
    	sound0[] = {"\ALF_Client2\sounds\medic_siren.ogg", 2.5, 1.0, 500, 1, 0, 0, 0};  // path to addon sound
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class penitSiren
	{
    	sound0[] = {"\ALF_Client2\sounds\Siren_Long.ogg", 2.5, 1.0, 500, 1, 0, 0, 0};  // path to addon sound
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class feuForet
	{
    	sound0[] = {"\ALF_Client2\sounds\feuForet.ogg", 3.5, 1.0, 75, 1, 0, 0, 0};  // path to addon sound
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
	
	class suspens {
    	sound0[] = {"\ALF_Client2\sounds\suspens.ogg", 8, 1.0, 15, 1, 0, 0, 0};
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
	class jackpot {
    	sound0[] = {"\ALF_Client2\sounds\jackpot.ogg", 10, 1.0, 20, 1, 0, 0, 0};
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
	class alarme_win {
    	sound0[] = {"\ALF_Client2\sounds\alarme_win.ogg", 10, 1.0, 20, 1, 0, 0, 0};
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
};

class CfgMovesBasic {
	class DefaultDie;
	
	class ManActions {
		ALF_ComRadio2 = "ALF_ComRadio2";
	};
	
	class Actions {
		class Default;
		
		class NoActions : ManActions {
			ALF_ComRadio2[] = {"ALF_ComRadio2", "Gesture"};
		};
	};
};

class CfgGesturesMale {
	skeletonName = "OFP2_ManSkeleton";
	
	class ManActions {};
	
	class Actions {
		class NoActions {
			turnSpeed = 0;
			upDegree = 0;
			limitFast = 1;
			useFastMove = 0;
			stance = "ManStanceUndefined";
		};
	};
	
	class Default {
		actions = "NoActions";
		file = "";
		looped = 1;
		speed = 0.5;
		static = 0;
		relSpeedMin = 1;
		relSpeedMax = 1;
		soundEnabled = 0;
		soundOverride = "";
		soundEdge[] = {0.5, 1};
		terminal = 0;
		ragdoll = 0;
		equivalentTo = "";
		connectAs = "";
		connectFrom[] = {};
		connectTo[] = {};
		interpolateWith[] = {};
		interpolateTo[] = {};
		interpolateFrom[] = {};
		mask = "empty";
		interpolationSpeed = 6;
		interpolationRestart = 0;
		preload = 0;
		disableWeapons = 1;
		enableOptics = 0;
		showWeaponAim = 0;
		enableMissile = 1;
		enableBinocular = 1;
		showItemInHand = 0;
		showItemInRightHand = 0;
		showHandGun = 0;
		canPullTrigger = 1;
		Walkcycles = 1;
		headBobMode = 0;
		headBobStrength = 0;
		leftHandIKBeg = 1;
		leftHandIKEnd = 1;
		rightHandIKBeg = 1;
		rightHandIKEnd = 1;
		leftHandIKCurve[] = {1};
		rightHandIKCurve[] = {1};
		forceAim = 0;
	};
	
	class States {
		class ALF_base : Default {
			canPullTrigger = 0;
			connectAs = "";
			connectFrom[] = {};
			connectTo[] = {};
			disableWeapons = 0;
			enableBinocular = 1;
			enableMissile = 1;
			enableOptics = 0;
			equivalentTo = "";
			forceAim = 0;
			headBobMode = 0;
			headBobStrength = 0;
			interpolateFrom[] = {};
			interpolateTo[] = {};
			interpolateWith[] = {};
			interpolationRestart = 0;
			interpolationSpeed = 6;
			looped = 1;
			mask = "";
			minPlayTime = 0.5;
			preload = 0;
			ragdoll = 0;
			relSpeedMax = 1;
			relSpeedMin = 1;
			showHandGun = 0;
			showItemInHand = 0;
			showItemInRightHand = 0;
			showWeaponAim = 1;
			soundEdge[] = {0.5, 1};
			soundEnabled = 1;
			soundOverride = "";
			speed = -2;
			static = 0;
			terminal = 0;
			Walkcycles = 1;
			leftHandIKBeg = 0;
			leftHandIKCurve[] = {0};
			leftHandIKEnd = 0;
			rightHandIKBeg = 1;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = 1;
		};
		
		class ALF_ComRadio2 : ALF_base {
			file = "a3\anims_f_bootcamp\data\anim\sdr\cts\acts_kore_talkingoverradio_loop.rtm";
			speed = 0.3;
			looped = 0;
			mask = "ALF_UpperBodyNoRArm";
			disableWeapons = 0;
			disableWeaponsLong = 0;
			weaponLowered = 0;
			showWeaponAim = 1;
			showHandGun = 0;
			canPullTrigger = 1;
			canReload = 1;
			terminal = 0;
			limitGunMovement = 0;
			preload = 1;
			headBobMode = 1;
			headBobStrength = 0.001;
			interpolateTo[] = {};
		};
	};
	
	class BlendAnims {
		ALF_UpperBodyNoRArm[] = {"Weapon", 0, "Pelvis", 0, "Spine", 0, "Spine1", 0, "Spine2", 1, "Spine3", 1, "Camera", 0, "launcher", 0, "weapon", 0, "launcher", 0, "neck", 1, "neck1", 0, "head", 0, "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, "RightShoulder", 0, "RightArm", 0, "RightArmRoll", 0, "RightForeArm", 0, "RightForeArmRoll", 0, "RightHand", 0, "LeftUpLeg", 0, "LeftUpLegRoll", 0, "LeftLeg", 0, "LeftLegRoll", 0, "LeftFoot", 0, "LeftToeBase", 0, "RightUpLeg", 0, "RightUpLegRoll", 0, "RightLeg", 0, "RightLegRoll", 0, "RightFoot", 0, "RightToeBase", 0, "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1, "LeftHankka3ing", 1, "LeftHankka3ing1", 1, "LeftHankka3ing2", 1, "LeftHankka3ing3", 1, "LeftHandThumb", 1, "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1, "RightHandIndex1", 0, "RightHandIndex2", 0, "RightHandIndex3", 0, "RightHandMiddle1", 0, "RightHandMiddle2", 0, "RightHandMiddle3", 0, "RightHandPinky1", 0, "RightHandPinky2", 0, "RightHandPinky3", 0, "RightHankka3ing", 0, "RightHankka3ing1", 0, "RightHankka3ing2", 0, "RightHankka3ing3", 0, "RightHandThumb", 0, "RightHandThumb1", 0, "RightHandThumb2", 0, "RightHandThumb3", 0};
	};
};

class CfgCloudlets {
	class HouseDestrSmokeLongMed;
	class ALF_flametrail;

	class ALFFeuForetAmbiance: HouseDestrSmokeLongMed {
		color[] = {{0.2,0.2,0.2,0.4},{0.2,0.2,0.2,0.32},{0.2,0.2,0.2,0.24},{0.2,0.2,0.2,0.2},{0.2,0.2,0.2,1},{0.2,0.2,0.2,0.8},{0.2,0.2,0.2,0.4},{0.2,0.2,0.2,0.01}};
	};
	
	class ALFFeuNoirBas: HouseDestrSmokeLongMed {
		color[] = {{0,0,0,0.6},{0,0,0,0.6},{0,0,0,0.6}};
		colorCoef[] = {1.2,1.2,1.2,1.2};
		colorVar[] = {0.1,0.1,0.1,0};
		coreDistance = 1;
		coreIntensity = 1;
		damageTime = 0;
		interval = 0.005;
		lifeTime = 50;
		lifeTimeVar = 0;
		moveVelocity[] = {1,0,1};
		MoveVelocityVar[] = {3,0.15,3};
		MoveVelocityVarConst[] = {0,0,0};
		particleShape = "\A3\data_f\cl_basic";
		particleType = "Billboard";
		position[] = {0,0,0};
		positionVar[] = {0,0,0};
		positionVarConst[] = {0,0,0};
		randomDirectionPeriod = 1;
		randomDirectionPeriodVar = 0;
		rotationVelocity = 10;
		rotationVelocityVar = 0;
		rubbing = 0;
		size[] = {5,5,5};
		sizeCoef = 1;
		sizeVar = 0;
		timerPeriod = 0.01;
		volume = 0.942;
		weight = 1.2;
	};
	
	class ALFFeuNoirHaut: ALFFeuNoirBas {
		moveVelocity[] = {1,0.15,1};
		MoveVelocityVar[] = {2,0.2,2};
		volume = 0.94;
		weight = 1.1;
	};
	
	class ALFGaz: HouseDestrSmokeLongMed {
		angle = 0;
		angleVar = 10;
		animationName = "";
		animationSpeed[] = {1,1,2};
		animationSpeedCoef = 1;
		beforeDestroyScript = "";
		blockAIVisibility = 0;
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		color[] = {{0, 0.03, 0, 0.4},{0, 0.03, 0, 0.4},{0, 0.03, 0, 0.4}};
		colorCoef[] = {1.2,1.2,1.2,1.2};
		colorVar[] = {0.1,0.3,0.1,0.1};
		coreDistance = 1;
		coreIntensity = 1;
		damageTime = 0;
		interval = 0.005;
		lifeTime = 70;
		lifeTimeVar = 10;
		moveVelocity[] = {0,0,0.5};
		MoveVelocityVar[] = {3,0.2,3};
		MoveVelocityVarConst[] = {0,0,0};
		onTimerScript = "";
		particleFSFrameCount = 1;
		particleFSIndex = 0;
		particleFSLoop = 1;
		particleFSNtieth = 1;
		particleShape = "\A3\data_f\cl_basic";
		particleType = "Billboard";
		position[] = {0,0,0};
		positionVar[] = {0,0,0};
		positionVarConst[] = {0,0,0};
		randomDirectionIntensity = 0;
		randomDirectionIntensityVar = 0;
		randomDirectionPeriod = 1;
		randomDirectionPeriodVar = 0;
		rotationVelocity = 10;
		rotationVelocityVar = 0;
		rubbing = 0;
		size[] = {3,3,5};
		sizeCoef = 1;
		sizeVar = 0;
		timerPeriod = 0.01;
		volume = 0.942;
		weight = 1.2;
	};
	
	class ALF_EauPompier: ALF_flametrail {
		angle = 0;
		angleVar = 1;
		animationName = "";
		animationSpeed[] = {1,1,2};
		animationSpeedCoef = 1;
		beforeDestroyScript = "";
		blockAIVisibility = 0;
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		color[] = {{1,1,1,0.35},{1,1,1,0.2},{1,1,1,0.05}};
		colorCoef[] = {1.2,1.2,1.2,1.2};
		colorVar[] = {0,0,0,0};
		coreDistance = 1;
		coreIntensity = 1;
		damageTime = 0;
		interval = 0.01;
		lifeTime = 0.5;
		lifeTimeVar = 0;
		moveVelocity[] = {0,0,0};
		MoveVelocityVar[] = {1.5,2,1.5};
		MoveVelocityVarConst[] = {0,0,0};
		onTimerScript = "";
		particleFSFrameCount = 1;
		particleFSIndex = 0;
		particleFSLoop = 0;
		particleFSNtieth = 1;
		particleShape = "\A3\data_f\cl_water";
		particleType = "Billboard";
		position[] = {0,0,0};
		positionVar[] = {0,0,0};
		positionVarConst[] = {0,0,0};
		randomDirectionIntensity = 0;
		randomDirectionIntensityVar = 0;
		randomDirectionPeriod = 0;
		randomDirectionPeriodVar = 0;
		rotationVelocity = 1;
		rotationVelocityVar = 0.1;
		rubbing = 0.310;
		size[] = {0.5,0.5,0.5};
		sizeCoef = 1;
		sizeVar = 0.25;
		timerPeriod = 1;
		volume = 40000;
		weight = 0.0001;
	};
};

//References
class RscPicture;
class ShortcutPos;
class RscTrafficLight;
class RscFeedback;
class RscStandardDisplay;
class RscText;
class RscLineBreak;
class RscButton;
class RscButtonMenu;
class RscButtonMenuOK;
class RscList;
class RscXListBox;
class RscPictureKeepAspect;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;
class RscStructuredText;
class RscControlsGroup;
class RscHTML;
class RscVignette;
class RscFrame;
class RscTitle;
class CA_Mainback;
class CA_Back;
class CA_Title_Back;
class CA_Logo_Small;
class CA_RscButton_dialog;
class CA_IGUI_Title;
class RscGearShortcutButton;
class RscIGUIListNBox;
class RscActiveText;
class RscProgress;
class RscProgressNotFreeze;
class RscButtonTextOnly;
class CA_Title;
class RscShortcutButton;
class CA_Black_Back;
class RscMapControl;
class IGUIBack;
class RscObject;
class RscDisplayGetReady;
class RscListBox;
class RscIGUIShortcutButton;
class RscCombo;
class RscIGUIListBox;
class RscButtonMenuCancel;
class VScrollbar;
class HScrollbar;
class RscListBoxKeys;
class RscXSliderH;
class RscXSliderV;
class RscTextCheckBox;
class RscEdit;
class RscButtonMenuSteam;
class RscBackgroundGUI;
class RscBackgroundGUITop;
class RscBackgroundGUILeft;
class RscBackgroundGUIRight;
class RscBackgroundGUIBottom;
class RscCheckBox;
class RscTree;
class RscDebugConsole;
class RscMessageBox;
class Attributes;
class RscDisplayInventory_DLCTemplate;
class RscGearTemplates;

class RscDisplayInventory
{
	scriptName = "RscDisplayInventory";
	scriptPath = "IGUI";
	onLoad = "[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	idd = 602;
	enableSimulation = 1;
	class Colors
	{
		dragValidBgr[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",0.5};
		dragInvalidBgr[] = {"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])","(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])","(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])",0.5};
		dragValidBar[] = {"(profilenamespace getvariable ['IGUI_WARNING_RGB_R',0.8])","(profilenamespace getvariable ['IGUI_WARNING_RGB_G',0.5])","(profilenamespace getvariable ['IGUI_WARNING_RGB_B',0.0])",0.5};
		dragInvalidBar[] = {"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])","(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])","(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])",0.5};
		progressBar[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",1};
		progressBarBgr[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",0.75};
		highlight[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",0.5};
	};
	class controlsBackground{};
	class controls
	{
		delete Background;
		delete Title;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_ContainerBackground: RscText
		{
			idc = 1001;
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "23 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class CA_PlayerBackground: RscText
		{
			idc = 1002;
			x = "14.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "24.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "22 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class TitleBackground: RscText
		{
			idc = 1020;
			x = "14.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "24.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class PlayersName: RscText
		{
			idc = 111;
			text = "$STR_DIARY_PLAYER_NAME";
			x = "15.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "19.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RankBackground: RscText
		{
			idc = 1014;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.25 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {1,1,1,0.2};
		};
		class RankPicture: RscPicture
		{
			idc = 1203;
			text = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.25 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonBack: RscActiveText
		{
			idc = 2;
			style = 48;
			color[] = {1,1,1,0.7};
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			x = "38 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {1,1,1,0.7};
			colorActive[] = {1,1,1,1};
			tooltip = "$STR_DISP_CLOSE";
		};
		class BackgroundSlotPrimary: RscPicture
		{
			idc = 1242;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryMuzzle: BackgroundSlotPrimary
		{
			idc = 1243;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryUnderBarrel: BackgroundSlotPrimary
		{
			idc = 1200;
			x = "28.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryFlashlight: BackgroundSlotPrimary
		{
			idc = 1244;
			x = "30.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryOptics: BackgroundSlotPrimary
		{
			idc = 1245;
			x = "32.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryMagazineGL: BackgroundSlotPrimary
		{
			idc = 1267;
			x = "34.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryMagazine: BackgroundSlotPrimary
		{
			idc = 1246;
			x = "36.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondary: BackgroundSlotPrimary
		{
			idc = 1247;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryMuzzle: BackgroundSlotPrimary
		{
			idc = 1248;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryUnderBarrel: BackgroundSlotPrimary
		{
			idc = 1266;
			x = "29 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryFlashlight: BackgroundSlotPrimary
		{
			idc = 1249;
			x = "31.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryOptics: BackgroundSlotPrimary
		{
			idc = 1250;
			x = "33.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryMagazine: BackgroundSlotPrimary
		{
			idc = 1251;
			x = "36.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgun: BackgroundSlotPrimary
		{
			idc = 1252;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "17 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunMuzzle: BackgroundSlotPrimary
		{
			idc = 1253;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunUnderBarrel: BackgroundSlotPrimary
		{
			idc = 1268;
			x = "29 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunFlashlight: BackgroundSlotPrimary
		{
			idc = 1254;
			x = "31.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunOptics: BackgroundSlotPrimary
		{
			idc = 1255;
			x = "33.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunMagazine: BackgroundSlotPrimary
		{
			idc = 1256;
			x = "36.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHeadgear: BackgroundSlotPrimary
		{
			idc = 1257;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotGoggles: BackgroundSlotPrimary
		{
			idc = 1258;
			x = "29.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHMD: BackgroundSlotPrimary
		{
			idc = 1259;
			x = "32.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotBinoculars: BackgroundSlotPrimary
		{
			idc = 1260;
			x = "35.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotMap: BackgroundSlotPrimary
		{
			idc = 1261;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotGPS: BackgroundSlotPrimary
		{
			idc = 1262;
			x = "17.32 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotCompass: BackgroundSlotPrimary
		{
			idc = 1263;
			x = "21.76 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotRadio: BackgroundSlotPrimary
		{
			idc = 1264;
			x = "19.54 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotWatch: BackgroundSlotPrimary
		{
			idc = 1265;
			x = "23.98 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ExternalContainerBackground: RscPicture
		{
			colorText[] = {1,1,1,0.1};
			idc = 1240;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PlayerContainerBackground: ExternalContainerBackground
		{
			idc = 1241;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "14 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundTab: RscActiveText
		{
			idc = 6321;
			colorBackgroundSelected[] = {1,1,1,1};
			colorFocused[] = {1,1,1,0};
			soundDoubleClick[] = {"",0.1,1};
			color[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SoldierTab: GroundTab
		{
			idc = 6401;
			x = "7 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundContainer: RscListBox
		{
			class DLCTemplate: RscDisplayInventory_DLCTemplate
			{
				class Controls;
			};
			idc = 632;
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx2 = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			rowHeight = "2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			canDrag = 1;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			itemSpacing = 0.001;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SoldierContainer: GroundContainer
		{
			idc = 640;
		};
		class GroundFilter: RscCombo
		{
			idc = 6554;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundLoad: RscProgress
		{
			idc = 6307;
			texture = "";
			textureExt = "";
			colorBar[] = {0.9,0.9,0.9,0.9};
			colorExtBar[] = {1,1,1,1};
			colorFrame[] = {1,1,1,1};
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "22.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SlotPrimary: GroundTab
		{
			class DLCTemplate: RscDisplayInventory_DLCTemplate
			{
				class Controls;
			};
			idc = 610;
			style = "0x30 + 0x800";
			color[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			colorBackgroundSelected[] = {1,1,1,0.1};
			colorFocused[] = {0,0,0,0};
			canDrag = 1;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotPrimaryMuzzle: SlotPrimary
		{
			idc = 620;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotPrimaryUnderBarrel: SlotPrimary
		{
			idc = 641;
			x = "28.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotPrimaryFlashlight: SlotPrimary
		{
			idc = 622;
			x = "30.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotPrimaryOptics: SlotPrimary
		{
			idc = 621;
			x = "32.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotPrimaryMagazineGL: SlotPrimary
		{
			idc = 644;
			x = "34.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotPrimaryMagazine: SlotPrimary
		{
			idc = 623;
			x = "36.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotSecondary: SlotPrimary
		{
			idc = 611;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotSecondaryMuzzle: SlotPrimary
		{
			idc = 624;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotSecondaryUnderBarrel: SlotPrimary
		{
			idc = 642;
			x = "29 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.59 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotSecondaryFlashlight: SlotPrimary
		{
			idc = 626;
			x = "31.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotSecondaryOptics: SlotPrimary
		{
			idc = 625;
			x = "33.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotSecondaryMagazine: SlotPrimary
		{
			idc = 627;
			x = "36.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotHandgun: SlotPrimary
		{
			idc = 612;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "17 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotHandgunMuzzle: SlotPrimary
		{
			idc = 628;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotHandgunUnderBarrel: SlotPrimary
		{
			idc = 643;
			x = "29 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotHandgunFlashlight: SlotPrimary
		{
			idc = 630;
			x = "31.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotHandgunOptics: SlotPrimary
		{
			idc = 629;
			x = "33.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotHandgunMagazine: SlotPrimary
		{
			idc = 631;
			x = "36.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotHeadgear: SlotPrimary
		{
			idc = 6240;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotGoggles: SlotPrimary
		{
			idc = 6216;
			x = "29.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotHMD: SlotPrimary
		{
			idc = 6217;
			x = "32.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
			onMouseButtonDblClick = "_this call ALF_fnc_useHmdSlot;";
		};
		class SlotBinoculars: SlotPrimary
		{
			idc = 6238;
			x = "35.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotMap: SlotPrimary
		{
			idc = 6211;
			x = "15.16 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotGPS: SlotPrimary
		{
			idc = 6215;
			x = "17.38 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotCompass: SlotPrimary
		{
			idc = 6212;
			x = "21.82 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotRadio: SlotPrimary
		{
			idc = 6214;
			x = "19.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class SlotWatch: SlotPrimary
		{
			idc = 6213;
			x = "24.04 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class UniformTab: GroundTab
		{
			idc = 6332;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {1,1,1,0.5};
		};
		class UniformSlot: SlotPrimary
		{
			idc = 6331;
			x = "15.35 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class UniformLoad: GroundLoad
		{
			idc = 6304;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class UniformContainer: GroundContainer
		{
			idc = 633;
			onLBDblClick = "_this spawn ALF_fnc_UseItemAction";
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "14 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class VestTab: UniformTab
		{
			idc = 6382;
			x = "18.85 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class VestSlot: SlotPrimary
		{
			idc = 6381;
			x = "19.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class VestLoad: GroundLoad
		{
			idc = 6305;
			x = "18.85 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class VestContainer: UniformContainer
		{
			idc = 638;
			onLBDblClick = "_this spawn ALF_fnc_UseItemAction";
		};
		class BackpackTab: UniformTab
		{
			idc = 6192;
			x = "22.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackpackSlot: SlotPrimary
		{
			idc = 6191;
			x = "22.85 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,0.5};
		};
		class BackpackLoad: GroundLoad
		{
			idc = 6306;
			x = "22.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackpackContainer: UniformContainer
		{
			idc = 619;
			onLBDblClick = "_this spawn ALF_fnc_UseItemAction";
		};
		class TotalLoad: GroundLoad
		{
			idc = 6308;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "22.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "23.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ContainerMarker: GroundTab
		{
			idc = 6325;
			x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "24 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundMarker: ContainerMarker
		{
			idc = 6385;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "24 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SoldierMarker: ContainerMarker
		{
			idc = 6405;
			x = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "24 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};

class RscDisplayInsertMarker
{
	scriptName = "RscDisplayInsertMarker";
	scriptPath = "GUI";
	onLoad = "[""onLoad"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay'); _this spawn ALF_fnc_insertMarker;";
	onUnload = "[""onUnload"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	idd = 54;
	movingEnable = 0;
	class controlsBackground
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			x = "0 * GUI_GRID_INSERTMARKER_W + GUI_GRID_INSERTMARKER_X";
			y = "0 * GUI_GRID_INSERTMARKER_H + GUI_GRID_INSERTMARKER_Y";
			w = "8 * GUI_GRID_INSERTMARKER_W";
			h = "2.5 * GUI_GRID_INSERTMARKER_H";
			colorBackground[] = {0,0,0,0.5};
		};
	};
	class controls
	{
		delete ButtonOK;
		delete Info;
		delete ButtonMenuInfo;
		delete Picture;
		delete Text;
		class ButtonMenuOK: RscButtonMenuOK
		{
			x = "14 * 			(			((safezoneW / safezoneH) min 1.2) / 40) + 			(safezoneX)";
			y = "13.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 			(safezoneY + safezoneH - 			(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "4.9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonMenuCancel: RscButtonMenuCancel
		{
			x = "19 * 			(			((safezoneW / safezoneH) min 1.2) / 40) + 			(safezoneX)";
			y = "13.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 			(safezoneY + safezoneH - 			(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title: RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			idc = 1001;
			text = "$STR_A3_RscDisplayInsertMarker_Title";
			x = "14 * 			(			((safezoneW / safezoneH) min 1.2) / 40) + 			(safezoneX)";
			y = "8.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 			(safezoneY + safezoneH - 			(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Description: RscStructuredText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = 1100;
			x = "14 * 			(			((safezoneW / safezoneH) min 1.2) / 40) + 			(safezoneX)";
			y = "9.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 			(safezoneY + safezoneH - 			(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class DescriptionChannel: RscStructuredText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = 1101;
			x = "14 * 			(			((safezoneW / safezoneH) min 1.2) / 40) + 			(safezoneX)";
			y = "11.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 			(safezoneY + safezoneH - 			(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class MarkerPicture: RscPicture
		{
			idc = 102;
			x = 0.259984;
			y = 0.4;
			w = 0.05;
			h = 0.0666667;
		};
		class MarkerText: RscEdit
		{
			idc = 101;
			x = "14 * 			(			((safezoneW / safezoneH) min 1.2) / 40) + 			(safezoneX)";
			y = "10.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 			(safezoneY + safezoneH - 			(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class MarkerChannel: RscCombo
		{
			idc = 103;
			x = "14 * 			(			((safezoneW / safezoneH) min 1.2) / 40) + 			(safezoneX)";
			y = "12.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 			(safezoneY + safezoneH - 			(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};

class RscMapSignalBackground;
class RscMapSignalPicture;
class RscMapSignalText;
class RscMapControlTooltip;
class RscListNBox;

class RscDisplayMainMap
{
	scriptName = "RscDiary";
	scriptPath = "GUI";
	onLoad = "[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay'); _this spawn ALF_fnc_mainMap";
	onUnload = "[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	saveParams = 1;
	class controlsBackground
	{
		delete Map;
		class CA_Black: CA_Black_Back{};
		class CA_RscMapSignalBackground: RscMapSignalBackground{};
		class CA_RscMapSignalPicture: RscMapSignalPicture{};
		class CA_RscMapSignalText: RscMapSignalText{};
		class CA_Map: RscMapControl
		{
			idcMarkerColor = 1090;
			idcMarkerIcon = 1091;
		};
	};
	class controls
	{
		delete DiaryIndex;
		delete DiaryAdd;
		delete DiarySort;
		delete DiaryFilter;
		delete Diary;
		class BriefingIntroBackgroundLayer: RscText
		{
			idc = 1102;
			show = 0;
			colorBackground[] = {0,0,0,1};
			x = "safezoneXabs";
			y = "safezoneY";
			w = "safezoneWabs";
			h = "safezoneH";
		};
		class BriefingIntroGraphicsLayer: RscPictureKeepAspect
		{
			idc = 1101;
			show = 0;
			color[] = {1,1,1,1};
			x = "safezoneXabs";
			y = "safezoneY";
			w = "safezoneWabs";
			h = "safezoneH";
		};
		class BriefingIntroVideoLayer: BriefingIntroGraphicsLayer
		{
			idc = 1100;
		};
		class Tooltip: RscMapControlTooltip{};
		class CA_MouseOver: RscText
		{
			style = "0x00 + 0x10";
			x = -10;
			y = -10;
			shadow = 0;
			idc = 1016;
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0.7,0.1,0,1};
			sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CA_MainBackground: RscText
		{
			idc = 1020;
			x = "safezoneXAbs";
			w = "safezoneWAbs";
			y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class CA_MainBackgroundGradient: RscPicture
		{
			x = "safezoneXAbs";
			w = "safezoneWAbs";
			idc = 1200;
			text = "\A3\ui_f\data\map\diary\gradient_gs.paa";
			y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {1,1,1,0.15};
		};
		class CA_TopicsBackground: RscText
		{
			idc = 1021;
			colorbackgroundx[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.1,0.1,0.1,0.8};
		};
		class CA_SubTopicsBackground: RscText
		{
			idc = 1022;
			colorbackgroundx[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
			x = "7.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.1,0.1,0.1,0.8};
		};
		class CA_ContentBackgroundd: RscText
		{
			idc = 1023;
			colorbackgroundx[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
			x = "17.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "21.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.1,0.1,0.1,0.8};
		};
		class ButtonBack: RscActiveText
		{
			idc = 2;
			style = 48;
			color[] = {1,1,1,0.7};
			text = "\A3\ui_f\data\map\diary\back_gs.paa";
			x = "-0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {1,1,1,0.7};
			colorActive[] = {1,1,1,1};
			tooltip = "$STR_DISP_CLOSE";
		};
		class CA_MissionName: RscText
		{
			idc = 112;
			shadow = 0;
			font = "RobotoCondensedLight";
			text = "$STR_DIARY_MISSION_NAME";
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "14 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {1,1,1,1};
			sizeEx = "1.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class TopRight: RscControlsGroup
		{
			x = "safezoneX + safezoneW - (26 * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
			class VScrollbar: VScrollbar
			{
				width = 0;
			};
			class HScrollbar: HScrollbar
			{
				height = 0;
			};
			idc = 2302;
			y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "26 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class controls
			{
				class CA_PlayerName: RscText
				{
					idc = 111;
					style = 1;
					font = "RobotoCondensedLight";
					text = "$STR_DIARY_PLAYER_NAME";
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "10.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ProfileBackground: RscText
				{
					idc = 1014;
					x = "10.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1,1,1,0.2};
				};
				class ProfilePicture: RscPicture
				{
					idc = 116;
					text = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
					x = "10.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class Separator1: RscPicture
				{
					idc = 1205;
					text = "\A3\ui_f\data\map\diary\separator_ca.paa";
					x = "11.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class MarkerColor: RscCombo
				{
					idc = 1090;
					x = "11.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "$STR_A3_rscDiary_MarkerColor_tooltip";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class MarkerIcon: RscCombo
				{
					idc = 1091;
					x = "14.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "$STR_A3_rscDiary_MarkerIcon_tooltip";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonPlayer: RscActiveText
				{
					onbuttonclick = "with uinamespace do {['ButtonPlayer',_this,''] call RscDiary_script};";
					style = 48;
					color[] = {1,1,1,0.7};
					idc = 1202;
					text = "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
					x = "18.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1,1,1,0.7};
					colorActive[] = {1,1,1,1};
					tooltip = "$STR_A3_RSCDIARY_BUTTONPLAYER_TOOLTIP";
				};
				class ButtonTextures: RscActiveText
				{
					onbuttonclick = "with uinamespace do {['ButtonTextures',_this,''] call RscDiary_script};";
					style = 48;
					color[] = {1,1,1,0.7};
					idc = 1201;
					text = "\A3\ui_f\data\map\diary\textures_ca.paa";
					x = "19.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1,1,1,0.7};
					colorActive[] = {1,1,1,1};
					tooltip = "$STR_A3_RSCDIARY_BUTTONTEXTURES_TOOLTIP";
				};
				class Separator2: RscPicture
				{
					idc = 1204;
					text = "\A3\ui_f\data\map\diary\separator_ca.paa";
					x = "20.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class Clock: RscText
				{
					idc = 101;
					style = 0;
					shadow = 0;
					font = "RobotoCondensedLight";
					x = "20.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "-0.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "4.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1,1,1,0.7};
					sizeEx = "1.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class ButtonTexturesReal: RscText
		{
			idc = 107;
			x = -1;
			y = -1;
			w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class DiaryList: RscListNBox
		{
			idc = 1001;
			default = 1;
			h = "safezoneH - 7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {1,1,1,0.2};
			colorSelectBackground2[] = {1,1,1,0.3};
			colorSelectRight[] = {1,1,1,1};
			colorSelect2Right[] = {1,1,1,1};
			columns[] = {0};
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			colorBackground[] = {0,0,0,0};
			sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CA_DiaryIndex: RscListNBox
		{
			idc = 1002;
			h = "safezoneH - 7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			padding = 0.004;
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {1,1,1,0.2};
			colorSelectBackground2[] = {1,1,1,0.3};
			colorSelectRight[] = {1,1,1,1};
			colorSelect2Right[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			shadowPictureLeft = 0;
			shadowPictureRight = 0;
			shadowTextLeft = 0;
			shadowTextRight = 0;
			columns[] = {"7.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)","15.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)"};
			class MuteCheckBoxTemplate: RscCheckBox
			{
				x = 0;
				y = 0;
				w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
				h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				textureChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
				textureUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
				textureFocusedChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
				textureFocusedUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
				textureHoverChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
				textureHoverUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
				texturePressedChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
				texturePressedUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
				textureDisabledChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
				textureDisabledUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
			};
			x = "7.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "3.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonPlayers: RscButtonTextOnly
		{
			idc = 117;
			style = 0;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorFocused[] = {1,1,1,0.5};
			colorFocused2[] = {1,1,1,0.1};
			period = 1.2;
			text = "$STR_A3_RSCDISPLAYMULTIPLAYERSETUP_TEXTPLAYERSPOOL";
			x = "7.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "8.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SortPlayers: RscPicture
		{
			idc = 118;
			sortUp = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
			sortDown = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_down_ca.paa";
			text = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
			x = "15 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class MuteAll: RscCheckBox
		{
			idc = 119;
			textureChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
			textureUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
			textureFocusedChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
			textureFocusedUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
			textureHoverChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
			textureHoverUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
			texturePressedChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
			texturePressedUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
			textureDisabledChecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_ca.paa";
			textureDisabledUnchecked = "\A3\Ui_f\data\IGUI\RscIngameUI\RscDisplayChannel\MuteVON_crossed_ca.paa";
			x = "15.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CA_DiaryGroup: RscControlsGroup
		{
			idc = 1013;
			h = "safezoneH - 7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			x = "17.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "21.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			class controls
			{
				class CA_Diary: RscHTML
				{
					idc = 1003;
					cycleLinks = 0;
					cycleAllLinks = 0;
					colorLink[] = {1,0.72,0.3,1};
					colorLinkActive[] = {1,0.72,0.3,1};
					class H1
					{
						font = "RobotoCondensed";
						fontBold = "RobotoCondensedBold";
						sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
					};
					class P
					{
						font = "RobotoCondensed";
						fontBold = "RobotoCondensedBold";
						sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					};
					shadow = 0;
					h = 100;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "20.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
				};
			};
		};
		class GPS: RscControlsGroup
		{
			idc = 106;
			x = -1;
			y = -1;
			w = 0;
			h = 0;
			class controls
			{
				class GPSSquare: RscText
				{
					idc = 75;
					style = 1;
					font = "RobotoCondensedBold";
					shadow = 2;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class GPSAlt: RscText
				{
					idc = 77;
					style = 1;
					font = "RobotoCondensedBold";
					shadow = 2;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class GPS_ALTMeasurement: RscText
				{
					shadow = 2;
					font = "RobotoCondensedBold";
					idc = 1008;
					x = "2.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class GPSHeading: RscText
				{
					idc = 78;
					style = 1;
					font = "RobotoCondensedBold";
					shadow = 2;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class GPS_HeadingMeasurement: RscText
				{
					shadow = 2;
					font = "RobotoCondensedBold";
					idc = 1015;
					x = "2.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class Copyright: RscText
		{
			style = 1;
			shadow = 2;
			font = "RobotoCondensedBold";
			x = "safezoneX + safezoneW - (12 * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
			y = "safezoneY + safezoneH - (1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			idc = 1005;
			w = "11.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.6*0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class WalkieTalkie: RscControlsGroup
		{
			idc = 103;
			x = -1;
			y = -1;
			w = 0;
			h = 0;
			class controls
			{
				class RadioAlpha: RscActiveText
				{
					idc = 63;
					x = "0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioBravo: RadioAlpha
				{
					idc = 64;
					x = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioCharlie: RadioAlpha
				{
					idc = 65;
					x = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioDelta: RadioAlpha
				{
					idc = 66;
					x = "5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioEcho: RadioAlpha
				{
					idc = 67;
					x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioFoxtrot: RadioAlpha
				{
					idc = 68;
					x = "0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioGolf: RadioAlpha
				{
					idc = 69;
					x = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioHotel: RadioAlpha
				{
					idc = 70;
					x = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioIndia: RadioAlpha
				{
					idc = 71;
					x = "5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RadioJuliet: RadioAlpha
				{
					idc = 72;
					x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class FadeEffect: RscText
		{
			idc = 1099;
			x = "safezoneXAbs";
			y = "safezoneY";
			w = "safezoneWAbs";
			h = "safezoneH";
			colorBackground[] = {0,0,0,1};
		};
		class RespawnControlsGroup: RscControlsGroupNoScrollbars
		{
			fade = 1;
			idc = 88800;
			onLoad = "(_this select 0) ctrlEnable false;_this execVM 'a3\ui_f\scripts\gui\RscRespawnControls.sqf'";
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "(15 - 1.15 ) * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "(9.7 + 1.15 ) * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class controls
			{
				class LocBackground: RscText
				{
					idc = 88802;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(2.9 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "5.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.1,0.1,0.1,0.8};
				};
				class RoleBackground: RscText
				{
					idc = 88803;
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(2.9 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "5.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.1,0.1,0.1,0.8};
				};
				class GearBackground: RscText
				{
					idc = 88804;
					x = "25.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(2.9 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "5.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.1,0.1,0.1,0.8};
				};
				class HeaderBackground: RscText
				{
					idc = 88801;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.2 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "38.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.1,0.1,0.1,0.8};
				};
				class OverHeaderBackground: RscText
				{
					idc = 88870;
					show = 0;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "38.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "(1.15  - 0.1) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.1,0.1,0.1,0.8};
				};
				class OverHeaderLeft: RscStructuredText
				{
					idc = 88871;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					show = 0;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "19.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "(1.15  - 0.3) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class OverHeaderRight: RscStructuredText
				{
					idc = 88872;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					show = 0;
					x = "19.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "19.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "(1.15  - 0.3) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class ButtonSpectate: RscButtonMenu
				{
					idc = 88811;
					class Attributes
					{
						align = "center";
						color = "#E5E5E5";
						font = "PuristaLight";
						shadow = "false";
					};
					text = "$STR_A3_RscRespawnControls_Spectate";
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(8.5 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class LocList: RscListBox
				{
					idc = 88808;
					colorPictureSelected[] = {0,0,0,1};
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
					sizeEx = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RoleList: RscListBox
				{
					idc = 88809;
					colorPictureSelected[] = {0,0,0,1};
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
					sizeEx = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class CounterText: RscStructuredText
				{
					idc = 88826;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "15.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.35 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class Counter: RscStructuredText
				{
					idc = 88806;
					x = "15.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.10 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.55 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class AutoRespawn: RscActiveText
				{
					idc = 88830;
					style = 48;
					color[] = {1,1,1,0.7};
					text = "\a3\ui_f\data\map\respawn\icon_autorespawn_ca.paa";
					x = "20.95 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.75 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.60 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.60 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1,1,1,0.3};
					colorBackground[] = {1,1,1,0.3};
					colorActive[] = {1,1,1,1};
				};
				class TeamText: RscStructuredText
				{
					idc = 88827;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.625 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class Team: RscStructuredText
				{
					idc = 88805;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.375 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.00 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class ReviveInfo: RscText
				{
					idc = 88874;
					show = 0;
					x = "12.2 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.5 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class ReviveInfoTitle: RscStructuredText
				{
					idc = 88875;
					show = 0;
					x = "6.3 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.625 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class ReviveInfoOption: RscStructuredText
				{
					idc = 88876;
					show = 0;
					x = "6.3 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.475 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class TicketsText: RscStructuredText
				{
					idc = 88828;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "30.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.625 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class Tickets: RscStructuredText
				{
					idc = 88807;
					x = "30.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.375 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.00 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class RespawnInfo: RscText
				{
					idc = 88877;
					show = 0;
					x = "25.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.5 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class RespawnInfoTitle: RscStructuredText
				{
					idc = 88878;
					show = 0;
					x = "25.9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.625 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class RespawnInfoOption: RscStructuredText
				{
					idc = 88879;
					show = 0;
					x = "25.9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.475 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class HeaderRespawnButton: RscButtonMenu
				{
					idc = 88829;
					class Attributes
					{
						align = "center";
						color = "#E5E5E5";
						font = "PuristaLight";
						shadow = "false";
					};
					class TextPos
					{
						bottom = 0;
						left = "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
						right = 0.005;
						top = "0.65 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					text = "$STR_A3_RscRespawnControls_Respawn";
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.35 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
				};
				class Warning: RscStructuredText
				{
					idc = 88831;
					text = "";
					x = "9.475 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.35 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "19.05 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.7,0,0,1};
				};
				class ComboLoadout: RscCombo
				{
					idc = 88813;
					wholeHeight = 0.22;
					x = "25.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonDetails: RscButtonMenu
				{
					idc = 88814;
					class Attributes
					{
						align = "center";
						color = "#E5E5E5";
						font = "PuristaLight";
						shadow = "false";
					};
					class TextPos
					{
						bottom = 0;
						left = "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
						right = 0.005;
						top = "0.12 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					text = "$STR_A3_RscRespawnControls_Details";
					x = "31.75 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.15 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class BackgroungPrimaryWeapon: RscPicture
				{
					idc = 88822;
					text = "#(argb,8,8,3)color(1,1,1,0.3)";
					x = "25.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(5.55 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.15 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class BackgroungSecondaryWeapon: RscPicture
				{
					idc = 88823;
					text = "#(argb,8,8,3)color(1,1,1,0.3)";
					x = "31.75 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(5.55 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.15 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class BackgroungOptics: RscPicture
				{
					idc = 88824;
					text = "#(argb,8,8,3)color(1,1,1,0.3)";
					x = "25.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3.025 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class BackgroungItem: RscPicture
				{
					idc = 88825;
					text = "#(argb,8,8,3)color(1,1,1,0.3)";
					x = "28.625 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3.025 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class PicturePrimaryWeapon: RscPicture
				{
					idc = 88815;
					x = "27.225 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(5.55 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "2.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class PictureSecondaryWeapon: RscPicture
				{
					idc = 88816;
					x = "33.475 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(5.55 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "2.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class PictureOptics: RscPicture
				{
					idc = 88817;
					x = "26.3375 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.35 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class PictureItem: RscPicture
				{
					idc = 88818;
					x = "29.4625 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.35 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class LocTitle: RscStructuredText
				{
					idc = 88819;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(3.275 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class RoleTitle: RscStructuredText
				{
					idc = 88820;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(3.275 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class GearTitle: RscStructuredText
				{
					idc = 88821;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "25.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(3.275 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class LocDisabled: RscStructuredText
				{
					idc = 88832;
					text = "$STR_A3_RscRespawnControls_LocDisabled";
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class RoleDisabled: RscStructuredText
				{
					idc = 88833;
					text = "$STR_A3_RscRespawnControls_RoleDisabled";
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
				class LoadoutDisabled: RscStructuredText
				{
					idc = 88834;
					text = "$STR_A3_RscRespawnControls_LoadoutDisabled";
					x = "25.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0};
				};
			};
		};
		class RespawnDetailsControlsGroup: RscControlsGroupNoScrollbars
		{
			fade = 1;
			idc = 88850;
			onLoad = "(_this select 0) ctrlEnable false";
			x = "26.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "0.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "12.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class controls
			{
				class BackgroundDetails: RscText
				{
					idc = 88851;
					x = "0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "14.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.1,0.1,0.1,0.8};
				};
				class DetailsTitle: RscStructuredText
				{
					idc = 88852;
					x = "0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "11.85 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0.9};
				};
				class ButtonDetailsClose: RscButton
				{
					idc = 88853;
					x = "11.85 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.75 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1,1,1,1};
				};
				class RespawnDetailsListControlsGroup: RscControlsGroup
				{
					idc = 88860;
					x = "0.1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.05 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "13.45 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					class controls
					{
						class DetailsList: RscStructuredText
						{
							idc = 88861;
							x = "0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
							y = "0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
							w = "11.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
							h = "12.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
							colorBackground[] = {1,1,1,0.3};
						};
					};
				};
			};
		};
		class HC_tooltip_back: IGUIBack
		{
			idc = 1124;
			x = 0.0;
			y = 0.0;
			w = 0.0;
			h = 0.0;
			colorBackground[] = {0.2,0.15,0.1,0.8};
		};
		class HC_tooltip_text: RscStructuredText
		{
			idc = 1125;
			x = 0.0;
			y = 0.0;
			w = 0.0;
			h = 0.0;
			size = 0.035;
			class Attributes
			{
				font = "RobotoCondensedBold";
				color = "#B6F862";
				align = "left";
				shadow = 1;
			};
		};
	};
	class objects
	{
		class Compass: RscObject
		{
			model = "\A3\ui_f\objects\Compass.p3d";
			selectionArrow = "";
			x = 0.16;
			xBack = 0.6;
			y = 0.925;
			yBack = 0.5;
			z = 0.2;
			zBack = 0.1;
			enableZoom = 1;
			direction[] = {1,0,0};
			up[] = {0,1,0};
			scale = 0.35;
		};
		delete Watch;
		delete GPS;
		delete WalkieTalkie;
	};
};
