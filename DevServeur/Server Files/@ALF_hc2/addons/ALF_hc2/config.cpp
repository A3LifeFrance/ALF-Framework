class CfgPatches {
	class ALF_HC_2 {
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F"};
		author[] = {"Nanou"};
	};
};

class CfgName {
	name = "hc_2";
};

class CfgFunctions {
	class Headless_Client {
		tag = "HC";
		class MySQL {
			file = "\ALF_hc2\HC_System\MySQL";
			class asyncCall {};
			class bool {};
			class mresArray {};
			class mresString {};
			class mresToArray {};
			class numberSafe {};
		};
		class Depanneur {
			file = "\ALF_hc2\HC_System\Depanneur";
			class startDiagnostic {};
			class startElevator {};
			class startRepair {};
		};
		class FireWorks {
			file = "\ALF_hc2\HC_System\FireWorks";
			class fire {};
		};
		class Casino {
			file = "\ALF_hc2\HC_System\Casino";
			class getStock {};
			class payerDance {};
			class setparam {};
			class playSlotMachine {};
			class switchSlotMachine {};
		};
		class Vehicles {
			file = "\ALF_hc2\HC_System\Vehicles";
			class axa {};
			class checkAxa {};
			class insertVehicle {};
			class getJobCar {};
			class insertVehicleCopSP {};
			class importVehicleHC {};
			class importVehicleHCCopSP {};
			class getVehicles {};
			class getVehiclesCopSP {};
			class getVehiclesLock {};
			class spawnVehicle {};
			class spawnVehicleCopSP {};
			class spawnVehicleLock {};
			class spawnVehicleLaunch {};
			class vehicleStore {};
			class vehicleJobStore {};
			class vehicleStoreCopSP {};
			class vehicleCreate {};
			class vehicleDelete {};
			class vehicleStockAfterSell {};
			class vehicleUpdate {};
			class vehicleTransfert {};
			class vehicleAutoSync {};
			class insureVehicles {};
			class recherchePlaque {};
			class dispoVehicle {};
			class permisVerif {};
			class copStoreVehicle {};
			class changerPlaque {};
			class createFireVehicle {};
			class getBoundingBox {};
			class peintureVehicule {};
		};
		class Housing {
			file = "\ALF_hc2\HC_System\Housing";
			class addMobilier {};
			class addHouse {};
			class deleteDBMobilier {};
			class fetchPlayerHouses {};
			class houseCleanup {};
			class sonnetteHouse {};
			class sellHouse {};
			class sellHouseMobilier {};
			class initHouses {};
			class initLocaux {};
			class updateMobilierInv {};
			class editSafeCode {};
			class recupHouseData {};
			class recupMobilierData {};
			class copHouseMarker {};
			class playSonnetteHouse {};
			class copBreakDoor {};
			class poserBaril {};
			class createHouseLeboncoin {};
		};
		class DAB {
			file = "\ALF_hc2\HC_System\DAB";
			class initDAB {};
			class bag_vehicle {};
			class updateDABDispo {};
		};
		class Mission {
			file = "\ALF_hc2\HC_System\Mission";
			class mission {};
		};
		class Business {
			file = "\ALF_hc2\HC_System\Business";
			class getVehiclesBusiness {};
			class spawnVehicleBusiness {};
			class vehicleCreateBusiness {};
			class vehicleStoreBusiness {};
			class putInFourriere {};
			class initBusiness {};
			class createBusiness {};
			class agrandirBusiness {};
			class capitalBusiness {};
			class recruterBusiness {};
			class BusinessToFisc {};
			class PayToFisc {};
			class fiscToPlayer {};
		};
		class LaPoste {
			file = "\ALF_hc2\HC_System\Business\Poste";
			class livraisonSystem {};
			class internetLivSystem {};
		};
		class Items {
			file = "\ALF_hc2\HC_System\Items";
			class setRadarM {};
			class spikeStrip {};
		};
		class Keys {
			file = "\ALF_hc2\HC_System\Keys";
			class getVehiclesKeys {};
			class keyGiveTime {};
			class keyGiveDef {};
			class keyManagement {};
		};
		class Station {
			file = "\ALF_hc2\HC_System\Station";
			class initStation {};
			class updateStation {};
		};
	};
};

class ALF_REPAIR {
	class HitFuel {
		name = "Réservoir";
		item = "ALF_Reservoir";
	};

	class HitEngine {
		name = "Moteur";
		item = "ALF_Moteur";
	};
	class HitEngine1 {
		name = "Moteur";
		item = "";
	};
	class HitEngine2: HitEngine1 {};
	class HitEngine3: HitEngine1 {};

	class HitBody {
		name = "Carrosserie";
		item = "ALF_Caross";
	};

	class HitLFWheel {
		name = "Roue";
		item = "ALF_Roue";
	};
	class HitLF2Wheel: HitLFWheel {};
	class HitLMWheel: HitLFWheel {};
	class HitLBWheel: HitLFWheel {};
	class HitRFWheel: HitLFWheel {};
	class HitRF2Wheel: HitLFWheel {};
	class HitRMWheel: HitLFWheel {};
	class HitRBWheel: HitLFWheel {};
	class HitFWheel: HitLFWheel {};
	class HitBWheel: HitLFWheel {};

	class HitGlass1 {
		name = "Vitre";
		item = "ALF_Vitre";
	};
	class HitGlass2: HitGlass1 {};
	class HitGlass3: HitGlass1 {};
	class HitGlass4: HitGlass1 {};
	class HitGlass5: HitGlass1 {};
	class HitGlass6: HitGlass1 {};
	class HitGlass7: HitGlass1 {};
	class HitGlass8: HitGlass1 {};
	class HitGlass9: HitGlass1 {};
	class HitGlass10: HitGlass1 {};
	class HitRGlass: HitGlass1 {};
	class HitLGlass: HitGlass1 {};

	class HitTurret {
		item = "";
	};
	class HitGun: HitTurret {};
	class HitAmmo: HitTurret {};
	class HitHull: HitTurret {};
	class HitAvionics: HitTurret {};
	class HitHRotor: HitTurret {};
	class HitVRotor: HitTurret {};
	class HitWinch: HitTurret {};
	class HitTransmission: HitTurret {};
	class HitLight: HitTurret {};
	class HitHydraulics: HitTurret {};
	class HitGear: HitTurret {};
	class HitHStabilizerL1: HitTurret {};
	class HitHStabilizerR1: HitTurret {};
	class HitVStabilizer1: HitTurret {};
	class HitTail: HitTurret {};
	class HitPitotTube: HitTurret {};
	class HitStaticPort: HitTurret {};
	class HitStarter1: HitTurret {};
	class HitStarter2: HitTurret {};
	class HitStarter3: HitTurret {};
};