/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

// Configuration file for the navigation script

class maverick_navigation_cfg {

	class bindings {
		keyCode		= 49; // Keycodes can be found at https://community.bistudio.com/wiki/DIK_KeyCodes
		reqShift	= 0;
		reqAlt		= 0;
		reqCtrl		= 1;
	};

	option_list[] = {
		{"Route actuelle", "maverick\navigation\data\currentroute.paa", "!isNil 'mav_gps_v_markers'", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationCurrent';"},
		{"Nouvelle route", "maverick\navigation\data\newroute.paa", "isNil 'mav_gps_v_markers'", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationNew';"},
		{"Itinéraires enregistres", "maverick\navigation\data\savedroutes.paa", "true", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationSaved';"},
		{"Paramètres GPS", "maverick\navigation\data\mapsettings.paa", "true", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationSettings';"}
	};

	class presets {
		class Altis {
			presetLocations[] = {

			};
		};
		class Malden {
			presetLocations[] = {

			};
		};
		class Stratis {
			presetLocations[] = {

			};
		};
		class Tanoa {
			presetLocations[] = {

			};
		};
	};

	class localization {

		// Display messages from around the navigation system
		msgStartPosInvalid = 		"La position de départ était invalide";
		msgEndPosInvalid = 			"La position finale était invalide";
		msgCheckpointInvalid = 		"Une position de point de contrôle était invalide";
		msgNoRoadsegmentFound = 	"Impossible de trouver le segment de route au sein de %1 meters à la position %2, avortement...";
		msgAbortCurrentRoute = 		"Vous devez terminer votre itinéraire actuel pour accéder à cette fonctionnalité!";
		msgSettingsSaved = 			"Paramètres de navigation enregistrés avec succès!";
		msgPositionReset = 			"La position de l'interface GPS a été réinitialisée avec succès!";
		msgCalcRoadDirs = 			"Calcule de la route";
		msgCalcRoadDirsProgress = 	"Calcule de la route (%1/%2)";
		msgOneMinute = 				"&lt; 1 min";
		msgSmallerThanMinute = 		"< 1 min";
		msgMinutesLeft = 			"%1 min";
		msgReachDestination = 		"Vous atteindrez votre destination dans %1";
		msgFollowThenTurnLeft = 	"Suivez la route sur %1, puis tournez à gauche";
		msgFollowThenTurnRight = 	"Suivez la route sur %1, puis tournez à droite";
		msgArrivedFormatted = 		"<t align='center'>Arrivée!</t>";
		msgReachedDestination = 	"Vous avez atteint votre destination";
		msgNoRoadsFound = 			"Aucune route trouvée";
		msgInvalidRoadSegment = 	"Aucun itinéraire disponible sur cette route";
		msgCurrentLocation = 		"Localisation actuelle";
		msgStart = 					"Début";
		msgCheckpoint = 			"Mid-Point";
		msgDestination = 			"Destination";
		msgPressSpace = 			"Appuyez sur [ESPACE] pour enregistrer la position de l'interface graphique";
		msgGpsPosSaved = 			"La position de l'interface GPS a été enregistrée avec succès!";
		msgNoRouteFound = 			"Aucune route trouvée";
		msgTimedOut = 				"Erreur ... Réessayez!";
		msgRouteFound = 			"Itinéraire trouvé";
		msgRouteInfo = 				"Informations sur l'itinéraire";
		msgFrom = 					"De";
		msgTo = 					"Vers";
		msgTotalDistance = 			"Distance totale";
		msgTotalravelTime = 		"Temps total de voyage";
		msgRoadPreference = 		"Préférence routière";
		msgRouteCalculate = 		"La route est en cours de calcul ...";
		msgCancelConfirm = 			"Êtes-vous sûr de vouloir annuler votre itinéraire actuel?";
		msgCancelRoute = 			"Annuler la route";
		msgCancel = 				"Annuler";
		msgProceed = 				"Procéder";
		msgNoRouteNameGiven = 		"Aucun nom de route donné.";
		msgRouteNameLimit = 		"Nom de l'itinéraire supérieur à 30chars!";
		msgIllegalChars = 			"Le nom de l'itinéraire contient des caractères restreints!";
		msgRouteLimit = 			"Vous avez atteint la limite de vos itinéraires sauvegardés! Vous devrez supprimer un itinéraire.";
		msgRouteSaved = 			"Itinéraire enregistré avec succès!";
		msgRouteDeleted = 			"La route a été supprimée avec succès!";
		msgFinishRouteFirst = 		"Vous devez soit terminer votre itinéraire actuel ou l'annuler!";
		msgNoSavedRoutes = 			"Aucun itinéraire enregistré ...";
		msgTurnNow =				"Tournez maintenant";

		// Localization for the dialogs
		#define dialogMainMenu 		"GPS - Menu"
		#define dialogClose 		"Fermer"
		#define dialogCurrentRoute 	"GPS - Route actuelle"
		#define dialogResetRoute 	"Annuler la route"
		#define dialogRecalculate	"Recalculer la route"
		#define dialogNewRoute 		"GPS - Nouvelle route"
		#define dialogCalcRoute		"Calculer l'itinéraire"
		#define dialogBack 			"Arrière"
		#define dialogStart 		"Début"
		#define dialogLoad 			"Charge"
		#define dialogCheckpoint 	"Mid-Point"
		#define dialogDestination 	"Destination"
		#define dialogCommonDest	"Points de destination communs"
		#define dialogSavedRouts	"Itinéraires enregistrés"
		#define dialogMenuSettings	"GPS - Parametres"
		#define dialogSave			"Sauvegarder"
		#define dialogUnitSpeed		"Unité de vitesse"
		#define dialogPreference	"Chemin préféré"
		#define dialogGpsPos		"GPS GUI Position"
		#define dialogCustomize		"Personnaliser"
		#define dialogReset			"Reset"
		#define dialogGpsColor		"GPS Couleur"
		#define dialogDragHere		"DRAG HERE"
		#define dialogSavedTitle	"GPS - Itinéraires enregistrés"
		#define dialogDelete		"Effacer"
		#define dialogCalcProgress	"<t size='1.2' align='center'>La route est en cours de calcul...</t>"
		#define dialogNavigation	"GPS"
		#define dialogSaveRoute		"GPS - Enregistrer la route"
		#define dialogRouteName		"Entrez le nom de l'itinéraire"
		#define dialogCalculating	"Calcul en cours..."
		#define dialogRouteInfo		"Informations sur l'itinéraire"
		#define dialogRouteMapPrev	"Aperçu de la route"
		#define dialogVoiceSetting	"Annonces vocales"
		#define dialogCalculationH	"GPS - Calcul d'itinéraire"
	};

	/*
		You should only add / remove / edit any of these parameters if you were advised to do so by Maverick Applications
		Unauthorized Changes can lead to a complete failure of the navigation system!
	*/
	class AlgorithmParameters {

		class Chernarus_Summer {
			greedy = 3.2;
		};

		class australia {
			greedy = 3.2;
		};

		class ALF_BelleIle {
			greedy = 0.9;
		};

		class Malden {
			radius = 45;
		};

		class Sara {
			radius = 66;
		};
	};

	// Do not touch below
	#include "sounds\voicepacks\config.cpp"
};

//Do not touch below
#include "gui\gps_gui_master.cpp"
