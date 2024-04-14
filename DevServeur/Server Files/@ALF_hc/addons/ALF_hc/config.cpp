class CfgPatches {
	class ALF_HC_1 {
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F"};
		author[] = {"Nanou"};
	};
};

class CfgName {
	name = "hc_1";
};

class CfgFunctions
{
	class Headless_Client
	{
		tag = "HC";
		class General
		{
			file = "\ALF_hc\MySQL\General";
			class asyncCall {};
			class bool {};
			class mresArray {};
			class mresString {};
			class mresToArray {};
			class numberSafe {};
			class queryRequest {};
			class updatePartial {};
			class updateRequest {};
			class huntingZone {};
			class jobTime {};
			class FirstJoinServer {};
			class playTime {};
			class createAdnFace {};
			class initCNG {};
			class updateCNG {};
			class retirerCNG {};
			class deposerCNG {};
			class listCNG {};
			class pickupAction {};
			class cleanupRequest {};
			class savePlayerDisconnect {};
			class permisTime {};
			class fetchKeys {};
			class setVariableHC {};
			class doMedCall {};
			class doCopCall {};
			class doPenitCall {};
			class deathScreen {};
			class countService {};
		};
		
		class Pompier
		{
			file = "\ALF_hc\MySQL\Pompier";
			class startEventFire {};
			class checkSoin {};
			class startEventOrgane {};
			class createFire {};
			class listCNP {};
			class retirerCNP {};
			class deposerCNP {};
			class updateCNP {};
			class initCNP {};
			class cocaineInFire {};
			class initBanqueSang {};
			class saveBanqueSang {};
		};

		class Camera
		{
			file = "\ALF_hc\MySQL\Camera";
			class setCameraVar {};
			class getCameraVar {};
		};

		class Prison
		{
			file = "\ALF_hc\MySQL\Prison";
			class mettrePrison {};
			class mettreCellule {};
			class initCoffre {};
			class saveCoffre {};
			class customCoffre {};
			class poserC4Prison {};
			class poserC4Barbed {};
			class sortiePrison {};
			class allPrisonnier {};
		};

		class Poker
		{
			file = "\ALF_hc\MySQL\Poker";
			class checkScore {};
			class distributeCards {};
			class playPoker {};
		};
		
		class Blackjack
		{
			file = "\ALF_hc\MySQL\Blackjack";
			class checkScore {};
			class distributeBJCards {};
			class playBJ {};
		};

		class Gendarmerie
		{
			file = "\ALF_hc\MySQL\Gendarmerie";
			class braceletElectronique {};
			class enleverBracelet {};
			class switchCommand {};
			class placeCamera {};
			class recupCamera {};
		};

		class Leboncoin
		{
			file = "\ALF_hc\MySQL\Leboncoin";
			class getLeboncoin {};
			class getAnnonceLeboncoin {};
			class createVehiculeLeboncoin {};
			class annulerLeboncoin {};
			class checkLeboncoin {};
			class achatLeboncoin {};
			class supprimerLeboncoin {};
		};

		class AdnFace
		{
			file = "\ALF_hc\MySQL\AdnFace";
			class adnCreate {};
			class adnRecherche {};
			class faceCreate {};
			class faceRecherche {};
		};

		class Bank
		{
			file = "\ALF_hc\MySQL\Bank";
			class cbParametre {};
			class achatCompteBancaire {};
			class transferExtCompteBancaire {};
		};

		class BankCentral
		{
			file = "\ALF_hc\MySQL\BankCentral";
			class poserC4 {};
			class poserPc {};
		};

		class Hsbc
		{
			file = "\ALF_hc\MySQL\Hsbc";
			class achatHsbc {};
			class transferHsbc {};
		};

		class Bourse
		{
			file = "\ALF_hc\MySQL\Bourse";
			class calculBourse {};
			class initBourse {};
			class searchURLDN {};
			class saveBourse {};
			class updateBourse {};
			class loggedBourse {};
			class randomEvent {};
		};

		class Marker
		{
			file = "\ALF_hc\MySQL\Marker";
			class fetchMarkers {};
			class sendMarker {};
			class removeMarker {};
		};
	};
};
