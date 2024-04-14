class CfgPatches {
	class ALF_Poker {
		author = "ALF - TEAM";
		name = "Arma 3 Life France Poker";
		url = "https://www.arma3lifefrance.fr/";
		requiredAddons[] = {"A3_Data_F"};
		requiredVersion = 0.1;
		units[] = {"Land_ALF_Poker_P"};
	};
};

class CfgMovesBasic {
    class DefaultDie;
	
    class ManActions {
        cargoPokerTable="cargoPokerTable";
    };
};
class CfgMovesMaleSdr: CfgMovesBasic {
	skeletonName = "OFP2_ManSkeleton";
	gestures = "CfgGesturesMale";
	
    class States {
        class Crew;
        class cargoPokerTable: Crew {
            file="ALF_Poker\anims\pokertable.rtm";
        };
    };
};

class CfgVehicles {
	class Car_F;	// External class reference
	
	class Land_ALF_Poker : Car_F {
		model = "\ALF_Poker\ALF_Poker.p3d";
		picture = "\ALF_Vehicules\ALF_Q7\map_suv_01_ca.paa";
		Icon = "\ALF_Vehicules\ALF_Q7\map_suv_01_ca.paa";
		author = "NiiRoZz";
		displayName = "Table poker";
		disableInventory = 1;
		canFloat = 0;
		terrainCoef = 0;
		turnCoef = 5;
		precision = 5;
		brakeDistance = 1;	// vehicle movement precision
		acceleration = 1;
		maxSpeed = 0;	// max speed on level road, km/h
		fireResistance = 10000;
		armor = 10000;
		cost = 50000;
		transportMaxBackpacks = 0;
		simulation = "carx";
		transportSoldier = 8;
		cargoAction[] = {"cargoPokerTable","cargoPokerTable","cargoPokerTable","cargoPokerTable","cargoPokerTable","cargoPokerTable","cargoPokerTable","cargoPokerTable"};
		hiddenSelections[] = {"carte1","carte2","carte3","carte4","carte5"};
		hiddenSelectionTextures[] = {"","","","",""};
		
		class Turrets {};
		
		class UserActions {};
	};
	
	class Land_ALF_Poker_P : Land_ALF_Poker {
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = CIV_F;
		displayName = "Table poker";
	};
};
