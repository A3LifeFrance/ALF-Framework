class CfgPatches {
	class ALF_HC_3 {
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F"};
		author[] = {"Nanou"};
	};
};

class CfgName {
	name = "hc_3";
};

class CfgFunctions {
	class Headless_Client {
		tag = "HC";
		class MySQL {
			file = "\ALF_hc3\HC_System\MySQL";
			class asyncCall {};
			class bool {};
			class mresArray {};
			class mresString {};
			class mresToArray {};
			class numberSafe {};
		};

		class Boucle {
			file = "\ALF_hc3\HC_System\Boucle";
			class countDownBracelet {};
			class countDownForfait {};
			class countDownPrison {};
			class feuTricolore {};
			class appleSystem {};
			class eboueurSystem {};
			class raisinSystem {};
			class cleanup {};
			class initReboot {};
			class casseFeuTricolore {};
			class feuForet {};
			class tresorSystem {};
		};

		class Log {
			file = "\ALF_hc3\HC_System\Log";
			class copLogIt {};
			class logIt {};
			class medLogIt {};
		};

		class Essence {
			file = "\ALF_hc3\HC_System\Essence";
			class fuelVehicule {};
		};

		class Barbecue {
			file = "\ALF_hc3\HC_System\Barbecue";
			class cuireViande {};
		};

		class DIR {
			file = "\ALF_hc3\HC_System\DIR";
			class reparerFeu {};
		};

		class Phone {
			file = "\ALF_hc3\HC_System\Phone";
			class buyForfait {};
			class removeForfait {};
			class createPhoneNumber {};
			class updateContactsPhone {};
			class sendSmsPhone {};
			class getUnitFromNumber {};
			class getUnitFromNumberSR {};
			class getMSGFromNumber {};
		};

		class Call {
			file = "\ALF_hc3\HC_System\Phone\Call";
			class callSystem {};
			class inCallSystem {};
			class centralSystem {};
			class joinCentral {};
		};

		class Nokia {
			file = "\ALF_hc3\HC_System\Phone\Nokia";
			class loadSmsNokia {};
			class deleteSmsNokia {};
		};

		class iPhone {
			file = "\ALF_hc3\HC_System\Phone\iPhone";
			class loadSmsiPhone {};
			class deleteSmsiPhone {};
		};

		class SonyCop {
			file = "\ALF_hc3\HC_System\Phone\Sony";
			class loadSmsSony {};
			class deleteSmsSony {};
			class SonyRecherchePlaque {};
			class loadFipSony {};
			class addFipSony {};
			class selectFipSony {};
			class deleteFipSony {};
			class createTajSony {};
			class selectTajSony {};
			class deleteTajSony {};
			class loadCopCentral {};
		};

		class SonyMed {
			file = "\ALF_hc3\HC_System\Phone\SonyP";
			class loadSmsSonyP {};
			class deleteSmsSonyP {};
			class loadMedCentral {};
		};

		class Service {
			file = "\ALF_hc3\HC_System\Service";
			class disconnectService {};
			class priseService {};
		};

		class Farming {
			file = "\ALF_hc3\HC_System\Farming";
			class fonderieFer;
			class fonderieCuivre;
			class systemeDiamant;
			class MaisSystem;
			class WeedSystem;
			class WeedSystem2;
			class WeedVentilation;
			class petroleSystem;
			class farmingVin;
			class farmingPinot;
			class farmingXxX;
			class farmingPlanche;
			class transformPetrol;
			class cocaine;
			class recupererPetrole;
			class takeWeed;
			class systemeSaphir;
			class tabacSystem;
		};
		
		class FarmingMeth {
			file = "\ALF_hc3\HC_System\Farming\Meth";
			class addElement;
			class recupMeth;
			class startCrystalise;
			class startPillon;
			class startSynthese;
		};

		class Fire {
			file = "\ALF_hc3\HC_System\Fire";
			class createFire;
			class createFeuForet;
			class ambientFire;
			class expansionFire;
			class serviceIncendie;
		};

		class Medical {
			file = "\ALF_hc3\HC_System\Medical";
			class medicalo2 {};
			class drapMortCheck {};
			class donDuSang {};
		};

		class Anim {
			file = "\ALF_hc3\HC_System\Anim";
			class getAnimGear {};
			class ambientAnim {};
		};

		class BIE {
			file = "\ALF_hc3\HC_System\BIE";
			class actionLamps {};
			class bieAllumer {};
			class bieEteindre {};
			class biePoserC4 {};
			class biePoserPc {};
			class bieReparer {};
			class bieReparerSystem {};
		};
	};
};
