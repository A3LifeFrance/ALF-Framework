class Socket_Reciever {
	tag = "SOCK";
	class SQL_Socket {
		file = "\ALF_Client\core\session";
		class noBDD {};
		class dataQuery {};
		class insertPlayerInfo {};
		class syncData {};
		class updatePartial {};
		class updateRequest {};
		class requestReceived {};
	};
};

class ALF_System {
	tag = "ALF";

	class Master_Directory {
		file = "\ALF_Client\ALF_System";
		class initPlayer {};
		class setupEVH {};
		class survival {};
		class setupKeyBinding {};
	};

	class Axa {
		file = "\ALF_Client\ALF_System\Axa";
		class menuAxa {};
		class btnAxa {};
		class removeAxaCount {};
	};

	class Essence {
		file = "\ALF_Client\ALF_System\Essence";
		class pistoletEssence {};
		class pistoletVehicule {};
	};

	class Anims {
		file = "\ALF_Client\ALF_System\Anims";
		class ambientAnim {};
	};
	
	class FireWorks2 {
		file = "\ALF_Client\ALF_System\FireWorks";
		class fireworksLaunch {};
	};

	class Radar {
		file = "\ALF_Client\ALF_System\Radar";
		class menuRadarAerien {};
	};

	class Barbecue {
		file = "\ALF_Client\ALF_System\Barbecue";
		class poseViande {};
		class barbecue {};
		class recupViande {};
	};

	class BIE {
		file = "\ALF_Client\ALF_System\BIE";
		class hasEnergy {};
		class biePoserPc {};
		class biePoserC4 {};
		class bieReparer {};
		class bieReparerSystem {};
		class bieAllumer {};
		class bieEteindre {};
	};

	class Medical {
		file = "\ALF_Client\ALF_System\Medical";
		class actionMedicalItems {};
		class soin {};
		class medicalItems {};
		class deadOnBreak {};
		class stabilize {};
		class jesusImAlive {};
		class menuGuardian {};
		class medHautParleur {};
		class transfertScanner {};
		class handleDesease {};
		class handleMedecine {};
		class transfertFauteuil {};
		class scannerSystem {};
		class actionTransfertF {};
		class porterMort {};
		class voitureMort {};
		class drapMort {};
		class transfertLit {};
		class genererGroupeSanguin {};
		class testGroupeSanguin {};
		class donDuSang {};
	};
	
	class Door {
		file = "\ALF_Client\ALF_System\Door";
		class teleportDoor {};
	};
	
	class Casino {
		file = "\ALF_Client\ALF_System\Casino";
		class playMachineSlot {};
		class returnCoins {};
		class giveMoneyDance {};
	};
	
	class Blackjack {
		file = "\ALF_Client\ALF_System\Blackjack";
		class playBJ {};
	};
	
	class Combats {
		file = "\ALF_Client\ALF_System\Combat";
		class combat {};
		class combatEffect {};
	};
	
	class DynamicObjects {
		file = "\ALF_Client\ALF_System\dynamicObjects";
		class object_deploy {};
		class object_escort {};
		class object_packup {};
	};

	class Event {
		file = "\ALF_Client\ALF_System\Event";
		class getInMan {};
		class insertMarker {};
		class insertMarkerOK {};
		class receiveMarker {};
		class mainMap {};
		class useHmdSlot {};
		class onTake {};
		class getOutMan {};
		class seatSwitchedMan {};
	};

	class Prison {
		file = "\ALF_Client\ALF_System\Prison";
		class menuCraft {};
		class putInCraft {};
		class takeInCraft {};
		class craftItem {};
		class penitService {};
		class penitSetLevel {};
		class couperBarbele {};
		class adnBarbele {};
		class penitHautParleur {};
		class penitSetLic {};
		class boucleEnPrison {};
		class menuAllPrisonnier {};
		class poserSafe {};
		class poserPiege {};
	};
	
	class Poker {
		file = "\ALF_Client\ALF_System\Poker";
		class playPoker {};
		class recupPokerTexture {};
	};
	
	class Tags {
		file = "\ALF_Client\ALF_System\Tag";
		class createTag {};
		class tag {};
	};

	class Reboot {
		file = "\ALF_Client\ALF_System\Reboot";
		class thunderone {};
		class thundertwo {};
		class weathereffect {};
	};

	class Pompier {
		file = "\ALF_Client\ALF_System\Pompier";
		class createRope {};
		class fireNozzle {};
		class soignerPompier {};
		class cnpMenu {};
		class cnpRetirer {};
		class cnpDeposer {};
		class updateCNPList {};
		class createBrancard {};
		class createWheelchair {};
		class trainingFire {};
		class fireIsDone {};
		class chargerBrancard {};
		class dechargerBrancard {};
		class takeOrgane {};
		class giveOrgane {};
		class giveOrdonnance {};
		class updateRope {};
		class serviceIncendie {};
	};

	class Bank {
		file = "\ALF_Client\ALF_System\Bank";
		class menuCompteBancaire {};
		class achatCompteBancaire {};
		class accessCompteBancaire {};
		class deposerCompteBancaire {};
		class retirerCompteBancaire {};
		class transferCompteBancaire {};
		class transferExtCompteBancaire {};
		class afterTransferCompteBancaire {};
		class badTransferCompteBancaire {};
		class infoTransferCompteBancaire {};
		class updateCompteBancaire {};
		class cbParametre {};
	};

	class Interaction {
		file = "\ALF_Client\ALF_System\Interaction";
		class interactionSystem {};
		class interactions_create {};
		class interactions_player_to_player_basics {};
		class interactions_player_to_trash {};
		class interactions_player_to_house {};
		class interactions_player_to_objects {};
		class mission_buy {};
		class putInCar {};
		class viderTrash {};
		class restrain {};
		class restrainAction {};
		class restrain2Action {};
		class unrestrain {};
		class unrestrain2 {};
		class verifCash {};
		class saisieCash {};
		class copSetLevel {};
		class medSetLevel {};
		class ticketGive {};
		class ticketPaid {};
		class ticketPay {};
		class ticketPrompt {};
		class ticketAction {};
		class fouilleAnal {};
		class saisirThisItem {};
		class actionPoints {};
		class enleverPoints {};
		class nextPoints {};
		class retirerPermis {};
		class verifParmes {};
		class copSetLic {};
		class testAlcoolemie {};
		class testStup {};
		class payEntreprise {};
		class enleverBracelet {};
		class Parmes {};
		class sitDown {};
		class standUp {};
		class pilot {};
		class interaction3D {};
		class reparerObjet {};
		class reparerFeuTricolore {};
		class bucheronnageDIR {};
		class recupBois {};
		class pubSetLevel {};
		class volerArgent {};
	};

	class Business {
		file = "\ALF_Client\ALF_System\Business";
		class initBusinessPlayer {};
		class menuBusiness {};
		class createBusiness {};
		class btnCreateBusiness {};
		class agrandirBusiness {};
		class deposerBusiness {};
		class recruterBusiness {};
		class payerBusiness {};
		class virerBusiness {};
		class getPaidBusiness {};
		class businessGarage {};
		class unimpoundBusiness {};
		class impoundMenuBusiness {};
		class garageLBBusiness {};
		class BusinessCarShop {};
		class BusinessCarShopBuy {};
		class BusinessRangerGarage {};
		class BusinessStoreVehicle {};
		class insureBusiness {};
		class sellGarageBusiness {};
		class BusinessClothes {};
		class BusinessGstore {};
		class BusinessGarageGlitch {};
		class repairCarWithTruck {};
		class putInFourriere {};
		class dialogFisc {};
		class circuitHautParleur {};
	};

	class Mailbox {
		file = "\ALF_Client\ALF_System\Mailbox";
		class menuMailbox {};
		class recupererMailbox {};
	};

	class Internet {
		file = "\ALF_Client\ALF_System\Internet";
		class menuInternet {};
		class returnSearchURLDN {};
		class searchUrl {};
		class detectingBad {};
		class knabisList {};
		class knabisLivraison {};
		class updateKnabis {};
		class knabisBuy {};
		class lbArmurerie {};
		class addPArmurerie {};
		class delPArmurerie {};
		class payerArmurerie {};
		class payerBM {};
		class loadLeboncoin {};
		class loadAnnonceLeboncoin {};
		class vendreLeboncoin {};
		class lbLeboncoin {};
		class annulerLeboncoin {};
		class achatLeboncoin {};
		class buyLeboncoin {};
		class moneyLeboncoin {};
		class supprimerLeboncoin {};
	};

	class Gendarmerie {
		file = "\ALF_Client\ALF_System\Gendarmerie";
		class placeCam {};
		class selectCamera {};
		class flashRadar {};
		class menuPlaque {};
		class menuCamera {};
		class menuSMSSR {};
		class copHautParleur {};
		class checkSecurityCam {};
		class recherchePlaque {};
		class resultPlaque {};
		class getFlashed {};
		class placeRadarM {};
		class radarMenu {};
		class setRadarM {};
		class prendreRadarM {};
		class reprendreRadarM {};
		class reposerRadarM {};
		class updateRadarM {};
		class resetRadarM {};
		class poserTracker {};
		class laptopMenu {};
		class lbChangedLaptop {};
		class setVehSpeaker {};
		class onMegaphonePressed {};
		class onMegaphoneReleased {};
		class cngMenu {};
		class cngRetirer {};
		class cngDeposer {};
		class updateCNGList {};
		class copEnter {};
		class copStoreVehicle {};
		class questionBrico {};
		class copQuestionDealer {};
		class copHouseMarker {};
		class adnMobilier {};
		class changerIdentitee {};
		class menuInspectTel {};
		class menuAjoutBracelet {};
		class menuMettrePrison {};
		class flashbang {};
		class iem {};
		class stunGrenade {};
		class poserChargePorte {};
		class poserPerceuse {};
		class checkMenotter {};
		class checkSurrender {};
		class returnCommand {};
	};
	class AdnFace {
		file = "\ALF_Client\ALF_System\Gendarmerie\ADNFACE";
		class adnMenu {};
		class adnCreate {};
		class adnRecherche {};
		class adnUpdate {};
		class faceMenu {};
		class faceCreate {};
		class faceRecherche {};
		class faceUpdate {};
		class getPlayerAdn {};
		class getPlayerFace {};
	};
	class Chien {
		file = "\ALF_Client\ALF_System\Gendarmerie\Chien";
		class dogChercherStup {};
		class dogAttack {};
		class dogFollowDoucement {};
		class dogFollowVite {};
		class dogGetInVehicle {};
		class dogGetOutVehicle {};
		class dogSit {};
		class dogStop {};
		class getDog {};
		class deleteDog {};
	};

	class Hsbc {
		file = "\ALF_Client\ALF_System\Hsbc";
		class menuHsbc {};
		class achatHsbc {};
		class accessHsbc {};
		class deposerHsbc {};
		class retirerHsbc {};
		class transferExtHsbc {};
		class afterTransferHsbc {};
		class badTransferHsbc {};
		class infoTransferHsbc {};
		class updateHsbc {};
		class conversionHsbc {};
	};

	class Dab {
		file = "\ALF_Client\ALF_System\Dab";
		class menuDab {};
		class retirerDab {};
		class deposerDab {};
		class updateDab {};
		class bag_deposit {};
		class bag_get {};
		class bag_stock {};
		class bag_unstock {};
		class moneyBagHandle {};
	};

	class Hud {
		file = "\ALF_Client\ALF_System\Hud";
		class doCallIn {};
		class doXP {};
		class doMsg {};
		class doSms {};
		class doGps {};
		class doCopCall {};
		class doMedCall {};
		class doQuickMsg {};
		class hudSetup {};
		class showIDcard {};
		class showPcard {};
		class doBfmO {};
		class doBfmCrime {};
		class doBfmC {};
		class menuXP {};
	};
	class YMenu {
		file = "\ALF_Client\ALF_System\Hud\Y";
		class menuY {};
		class receiveMoney {};
		class giveMoney {};
		class keyGive {};
		class keyGiveTime {};
		class keyGiveDef {};
		class keyDrop {};
		class s_onChar {};
		class s_onCheckedChange {};
		class s_onSliderChange {};
		class settingsMenu {};
		class updateViewDistance {};
		class bfmOfficiel {};
		class annonceBFM {};
		class bfmCitoyen {};
		class bfmCaracteres {};
		class adminMSG {};
		class adminRevived {};
		class actionSoinAdmin {};
		class adminTP {};
		class adminTP2 {};
		class adminTP3 {};
		class adminTpHere {};
		class adminSpec {};
		class adminCamera {};
		class actionFreeze {};
		class actionRevive {};
		class actionTP {};
		class actionTP2 {};
		class addXP {};
	};

	class Player {
		file = "\ALF_Client\ALF_System\Player";
		class useItemAction {};
		class prefHautParleur {};
		class fadeSound {};
		class headbag_take_action {};
		class headbag_put_target {};
		class headbag_put_action {};
		class handleAlcool {};
		class handleDrug {};
		class permisCar {};
		class methzone {};
		class contrat_buy {};
		class permisMoto {};
		class permisTruck {};
		class handleCB {};
		class switchMove {};
		class firstViewCombat {};
		class paycheck {};
		class publiqueService {};
		class CopService {};
		class MedService {};
		class recupIDcard {};
		class recupPermis {};
		class buyHomeLicense {};
		class buyEboueurLicense {};
		class buyGunLicense {};
		class buyShipLicense {};
		class buyPilotLicense {};
		class spawnVideo {};
		class checkPermis {};
		class freezePlayer {};
		class stagePermis {};
		class kickSystem {};
		class poserBBQ {};
		class fixUniform {};
		class initKeysTime {};
		class deleteKeysTime {};
		class activerTourRadio {};
		class desactiverTourRadio {};
		class animate {};
		class remonterFaim {};
		class remonterSoif {};
		class buyBFMCrime {};
	};

	class Farming {
		file = "\ALF_Client\ALF_System\Farming";
		class minageSystem {};
		class planterMais {};
		class takeMais {};
		class woodSystem {};
		class woodSystemDIR {};
		class getLookAt {};
		class couperWeed {};
		class interactMeth {};
		class planterWeed {};
		class planterWeed2 {};
		class takeWeed {};
		class puiserPetrole {};
		class recupererPetrole {};
		class cocaine {};
		class Anubis {};
		class farmingVin {};
		class farmingPinot {};
		class farmingXxX {};
		class transformWhisky {};
		class farmingPlanche {};
		class transformPetrol {};
		class planterTabac {};
		class takeTabac {};
		class sechageTabac {};
		class createCigare {};
		class createCigarette {};
		class peche {};
	};

	class Phone {
		file = "\ALF_Client\ALF_System\Phone";
		class menuForfait {};
		class updateForfait {};
		class buyForfait {};
		class receptionSmsPhone {};
		class setPhoneNumber {};
	};

	class Calling {
		file = "\ALF_Client\ALF_System\Phone\Call";
		class endCall {};
		class resetCall {};
		class ringPlayer {};
		class callInProgress {};
		class callTime {};
		class callForceEnd {};
		class callSetVolume {};
		class callDisablePhone {};
		class callSetSpeaker {};
	};

	class Nokia {
		file = "\ALF_Client\ALF_System\Phone\Nokia";
		class menuNokia {};
		class addContactNokia {};
		class deleteContactNokia {};
		class smsContactNokia {};
		class sendSmsNokia {};
		class sendNewSmsNokia {};
		class replySmsNokia {};
		class deleteSmsNokia {};
		class updateSmsNokia {};
		class lbChangedSmsNokia {};
		class setViberNokia {};
		class smsNokia {};
		class callRecentNokia {};
		class callContactNokia {};
		class callCustomNokia {};
		class smsRecentNokia {};
	};

	class iPhone {
		file = "\ALF_Client\ALF_System\Phone\iPhone";
		class menuiPhone {};
		class iPhoneCallCustom {};
		class iPhoneCallContact {};
		class iPhoneSmsContact {};
		class iPhoneSmsContactSend {};
		class iPhoneNewSmsSend {};
		class iPhoneaddContact {};
		class iPhonedeleteContact {};
		class iPhoneMute {};
		class iPhoneUnmute {};
		class iPhoneRing {};
		class iPhoneSetVolume {};
		class iPhoneSpeakers {};
		class setiPhoneBackGround {};
		class setiPhoneDate {};
		class setiPhoneAnonyme {};
		class setiPhoneBackGround2 {};
		class setiPhoneRing {};
		class setiPhoneViber {};
		class iPhoneRadioConnect {};
		class iPhoneRadioDisconnect {};
		class updateSmsiPhone {};
		class lbChangedSmsiPhone {};
		class deleteSmsiPhone {};
		class iPhoneReplySms {};
		class iPhoneSmsSend {};
		class iPhoneCallRecent {};
		class iPhoneSmsRecent {};
	};
	class Sony {
		file = "\ALF_Client\ALF_System\Phone\Sony";
		class menuSony {};
		class setSonyDate {};
		class setupRadioSony {};
		class connectRadioSony {};
		class sonyRadioDisconnect {};
		class SonySetVolume {};
		class SonyRadioSetVolume {};
		class SonyCallCustom {};
		class SonyCallContact {};
		class SonyCallRecent {};
		class SonyUnmute {};
		class SonyMute {};
		class SonySpeakers {};
		class terminateCallCentral {};
		class joinCallCentral {};
		class SonyDeleteContact {};
		class SonyAddContact {};
		class SonySetStereo {};
		class SonySendNewSms {};
		class SonySendSmsContact {};
		class lbChangedSmsSony {};
		class updateSmsSony {};
		class SonySendReplySms {};
		class SonyPlaque {};
		class SonyResultPlaque {};
		class update1FipSony {};
		class update2FipSony {};
		class fipSonyRech {};
		class fipSonyAdd {};
		class fipSonyLb {};
		class fipSonyDel {};
		class createTajSony {};
		class rechercheTajSony {};
		class updateTajSony {};
		class lbChangedTajSony {};
		class TajSonyDel {};
		class deleteSmsSony {};
		class SonyLoadCentral {};
	};
	class SonyP {
		file = "\ALF_Client\ALF_System\Phone\SonyP";
		class menuSonyP {};
		class setSonyPDate {};
		class setupRadioSonyP {};
		class connectRadioSonyP {};
		class SonyPRadioDisconnect {};
		class SonyPSetVolume {};
		class SonyPRadioSetVolume {};
		class SonyPCallCustom {};
		class SonyPCallContact {};
		class SonyPCallRecent {};
		class SonyPUnmute {};
		class SonyPMute {};
		class SonyPSpeakers {};
		class terminateCallCentralP {};
		class joinCallCentralP {};
		class SonyPDeleteContact {};
		class SonyPAddContact {};
		class SonyPSetStereo {};
		class SonyPSendNewSms {};
		class SonyPSendSmsContact {};
		class lbChangedSmsSonyP {};
		class updateSmsSonyP {};
		class SonyPSendReplySms {};
		class deleteSmsSonyP {};
		class SonyPLoadCentral {};
	};
	class Bourse {
		file = "\ALF_Client\ALF_System\Bourse";
		class checkPrice {};
		class achatNombre {};
		class listboxPrice {};
		class loadlbPrice {};
		class updateClientBourse {};
		class returnPrice {};
	};

	class Vehicles {
		file = "\ALF_Client\ALF_System\Vehicles";
		class insureSystem {};
		class peint_onChar {};
		class getJobCarClient {};
		class importVehicle {};
		class importVehicleCopSP {};
		class menuVehicles {};
		class showCarStats {};
		class showCarBtn {};
		class showHeliStats {};
		class showHeliBtn {};
		class showTruckStats {};
		class showTruckBtn {};
		class showMotoStats {};
		class showMotoBtn {};
		class showBoatStats {};
		class showBoatBtn {};
		class showCivBtn {};
		class showCopBtn {};
		class showMedBtn {};
		class repairCar {};
		class repairHeli {};
		class repairBoat {};
		class repairMoto {};
		class repairTruck {};
		class refuelCar {};
		class siphonageVehicles {};
		class inspectVehicle {};
		class getADN {};
		class setHPD {};
		class cannabisVehicle {};
		class cocaineVehicle {};
		class changerPlaque {};
		class btnChangerPlaque {};
		class storeVehicleJob {};
		class deployerJetSki {};
		class getPlaque {};
		class immobiliserVehicle {};
		class setAirRadio {};
		class businessTransfertVeh {};
		class onAirRadioPressed {};
		class onAirRadioReleased {};
		class setVehiclesKeys {};
		class menuPeinture {};
	};

	class Station {
		file = "\ALF_Client\ALF_System\Station";
		class refuelStation {};
	};

	class FeuForet {
		file = "\ALF_Client\ALF_System\FeuForet";
		class createFeu {};
	};
};

class Life_Client_Core {
	tag = "life";

	class Actions {
		file = "\ALF_Client\core\actions";
		class buyLicense {};
		class gutAnimal {};
		class packupSpikes {};
		class pickupMoney {};
		class pulloutAction {};
		class removemobilier {};
		class copRemovemobilier {};
		class searchAction {};
		class searchVehAction {};
		class storeVehicle {};
		class storeVehicleCopSP {};
		class surrender {};
	};

	class Civilian {
		file = "\ALF_Client\core\civilian";
		class civLoadout {};
		class civMarkers {};
		class knockedOut {};
		class knockoutAction {};
		class tazed {};
	};

	class Config {
		file = "\ALF_Client\core\config";
		class houseConfig {};
	};

	class Cop {
		file = "\ALF_Client\core\cop";
		class copMarkers {};
		class radar {};
		class spikeStripEffect {};
	};

	class Dialog_Controls {
		file = "\ALF_Client\dialog\function";
		class garageLBChange {};
		class garageLBChangeCopSP {};
		class garageLBChangeLock {};
		class impoundMenu {};
		class impoundMenuCopSP {};
		class impoundMenuLock {};
		class sellGarage {};
		class spawnMenu {};
		class unimpound {};
		class unimpoundCopSP {};
		class unimpoundLock {};
		class vehicleGarage {};
	};

	class Functions	{
		file = "\ALF_Client\core\functions";
		class actionKeyHandler {};
		class animSync {};
		class accType {};
		class clearVehicleAmmo {};
		class dropItems {};
		class escInterupt {};
		class fetchCfgDetails {};
		class fetchDeadGear {};
		class fetchVehInfo {};
		class handleDamage {};
		class handleItem {};
		class hideObj {};
		class inventoryClosed {};
		class inventoryOpened {};
		class silentGearSave {};
		class keyHandler {};
		class loadDeadGear {};
		class loadGear {};
		class nearestDoor {};
		class nearUnits {};
		class numberText {};
		class onFired {};
		class pullOutVeh {};
		class pushObject {};
		class receiveItem {};
		class revealObjects {};
		class saveGear {};
		class searchPosEmpty {};
		class stripDownPlayer {};
		class tazeSound {};
		class DateToString {};
		class setVariable {};
	};

	class Housing {
		file = "\ALF_Client\core\housing";
		class buyHouse {};
		class mobilierMenu {};
		class copBreakDoor {};
		class copHouseOwner {};
		class getBuildingPositions {};
		class mobilierInvSearch {};
		class houseMenu {};
		class initHouses {};
		class lightHouse {};
		class sonnetteHouse {};
		class lightHouseAction {};
		class lockHouse {};
		class lockupHouse {};
		class placeMobilier {};
		class placeDrugSystem {};
		class PlayerInBuilding {};
		class sellHouse {};
		class MobilierInBuilding {};
		class paramSafe {};
		class mobilierInv {};
		class putInMobilier {};
		class takeInMobilier {};
		class mobilierSystem {};
	};

	class Items	{
		file = "\ALF_Client\core\items";
		class jerryRefuel {};
		class lockpick {};
		class spikeStrip {};
		class placeMobilierAction {};
		class setDirMobilier {};
	};

	class Medical_System {
		file = "\ALF_Client\core\medical";
		class deathScreen {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class requestMedic {};
		class respawned {};
		class revived {};
		class revivePlayer {};
	};

	class Network {
		file = "\ALF_Client\core\functions\network";
		class say3D {};
		class setFuel {};
	};

	class Shops	{
		file = "\ALF_Client\core\shops";
		class buyClothes {};
		class changeClothes {};
		class clothingFilter {};
		class clothingMenu {};
		class vehicleShop3DPreview {};
		class vehicleColor3DRefresh {};
		class vehicleShopBuy {};
		class vehicleShopBuyCopSP {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
		class vehicleShopLBChange {};
		class vehicleShopMenu {};
		class weaponShopBuySell {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopFilter {};
		class dispoVehicle {};
		class itemsVenteMenu {};
		class itemsVenteLoad {};
		class itemsVenteSelection {};
		class itemsVente {};
	};

	class Vehicle {
		file = "\ALF_Client\core\vehicle";
		class addVehicle2Chain {};
		class lockVehicle {};
	};
};
