/*
	File:ALF_Vahicles2.hpp
	Author: ALF - Dev Team
*/
class CfgVehicles {

	class Fin_Base_F;
	class Fin_tricolour_F: Fin_Base_F
	{
		extCameraPosition[] = {0,1.25,-2.25};
	};

	class All;
	class Sound;
	class ALFSirenLong: Sound // class name to be used with createSoundSource
	{
		sound = "SirenLong"; // reference to CfgSFX class
	};
	class ALFmedicSiren: Sound // class name to be used with createSoundSource
	{
		sound = "medicSiren"; // reference to CfgSFX class
	};
	class suspens: Sound {
		sound = "suspens";
	};
	class jackpot: Sound {
		sound = "jackpot";
	};
	class alarme_win: Sound {
		sound = "alarme_win";
	};
    class ALFC2GIGN: Sound // class name to be used with createSoundSource
    {
        sound = "C2GIGN"; // reference to CfgSFX class
    };
    class ALFpenitSiren: Sound // class name to be used with createSoundSource
	{
		sound = "penitSiren"; // reference to CfgSFX class
	};
    class ALFfeuForet: Sound // class name to be used with createSoundSource
	{
		sound = "feuForet"; // reference to CfgSFX class
	};
	
	class B_ALF_GDM_Inv;
	class B_ALF_GDM_Inv2 : B_ALF_GDM_Inv {
		maximumLoad = 170;
	};
	
    //Box Prison
    class Furniture_base_F;
		class ALF_Iphone_Object: Furniture_base_F {
			scope = 2;
			author = "Nanou";
			displayName= "Iphone en Object";
			model = "\ALF_Items\iphone.p3d";
		};
		class ALF_3310_Object: Furniture_base_F {
			scope = 2;
			author = "Nanou";
			displayName= "3310 en Object";
			model = "\ALF_Items\3310.p3d";
		};
    class ALF_Coffre_Prison: Furniture_base_F {
        scope = 2;
        author = "Nanou";
        displayName= "Coffre prison" ;
        model = "\ALF_Items\coffreprison.p3d";
        icon = "iconCrateAmmo";
        maximumLoad = 50;
        vehicleClass = "ALF_A3_Batiments";
        transportMaxWeapons = 12;
        transportMaxMagazines = 50;
        transportMaxBackpacks = 12;
        class AnimationSources {
            class safe_source {
                source = "user";
                initPhase = 1;
                animPeriod = 0.1;
            };
            class piege_source {
                source = "user";
                initPhase = 1;
                animPeriod = 0.1;
            };
        };
        class UserActions {
            class action_1 {
                displayName = "Poser Safe";
                position = "action";
                radius = 1;
                onlyForplayer = "true";
                condition = "((this animationSourcePhase 'safe_source') > 0.9) && {ALF_Prison} && {""ALF_Locker_Artisanal"" in (magazines player)}";
                statement = "[this] call ALF_fnc_poserSafe";
            };
            class action_2 {
                displayName = "Poser Piege";
                position = "action";
                radius = 1;
                onlyForplayer = "true";
                condition = "((this animationSourcePhase 'piege_source') > 0.9) && {ALF_Prison} && {""ALF_LockerC4_Artisanal"" in (magazines player)}";
                statement = "[this] call ALF_fnc_poserPiege";
            };
        };
    };
    
	//Frigo
	class Fridge_01_closed_F;
	class ALF_Frigo: Fridge_01_closed_F {
		maximumLoad = 40;
	};

    class NATO_Box_Base;
    class ALF_Banque_Sang: NATO_Box_Base {
        scope = 2;
        scopeCurator = 2;
        displayName = "ALF Banque Sang";
        icon = "iconObject_1x1";
		destrType = "DestructNo";
        mapSize = 1;
		mass = 150;
        model = "\A3\Structures_F_Heli\Items\Electronics\Fridge_01_F.p3d";
		maximumLoad = 150;
	};
	
	class ALF_CaveVin: Furniture_base_F {
		scope = 2;
		author = "ALF";
		displayName= "Stockage Entreprise";
		model = "alf_items_2019\alf_cavevin.p3d";
		maximumLoad = 500;
	};

    class thing;
	class ALF_GrosFeuForet: thing
	{
		author = "ALF NiiRoZz";
		mapSize = 1;
		_generalMacro = "ALF_GrosFeuForet";
		scope = 1;
		animated = 0;
		side = 4;
		faction = "None";
		editorCategory = "EdCat_TEST";
		editorSubcategory = "EdSubcat_TEST";
		vehicleClass = "Emitters";
		simulation = "thing";
		icon = "iconExplosiveAP";
		displayName = "Gros feu de foret";
		picture = "\A3\weapons_f\ammoBoxes\data\ui\map_AmmoBox_F_CA.paa";
		model = "\A3\Weapons_F\empty.p3d";
		class EventHandlers
		{
			init = "[(_this select 0),0] call ALF_fnc_createFeu;";
			deleted = "{deleteVehicle _x} forEach ((_this select 0) getVariable [""effects"",[]])";
		};
	};

    class ALF_MoyenFeuForet: thing
	{
		author = "ALF NiiRoZz";
		mapSize = 1;
		_generalMacro = "ALF_MoyenFeuForet";
		scope = 1;
		animated = 0;
		side = 4;
		faction = "None";
		editorCategory = "EdCat_TEST";
		editorSubcategory = "EdSubcat_TEST";
		vehicleClass = "Emitters";
		simulation = "thing";
		icon = "iconExplosiveAP";
		displayName = "Moyen feu de foret";
		picture = "\A3\weapons_f\ammoBoxes\data\ui\map_AmmoBox_F_CA.paa";
		model = "\A3\Weapons_F\empty.p3d";
		class EventHandlers
		{
			init = "[(_this select 0),1] call ALF_fnc_createFeu;";
			deleted = "{deleteVehicle _x} forEach ((_this select 0) getVariable [""effects"",[]])";
		};
	};

    class ALF_AmbianceFeuForet: thing
	{
		author = "ALF NiiRoZz";
		mapSize = 1;
		_generalMacro = "ALF_AmbianceFeuForet";
		scope = 1;
		animated = 0;
		side = 4;
		faction = "None";
		editorCategory = "EdCat_TEST";
		editorSubcategory = "EdSubcat_TEST";
		vehicleClass = "Emitters";
		simulation = "thing";
		icon = "iconExplosiveAP";
		displayName = "Ambiance feu de foret";
		picture = "\A3\weapons_f\ammoBoxes\data\ui\map_AmmoBox_F_CA.paa";
		model = "\A3\Weapons_F\empty.p3d";
		class EventHandlers
		{
			init = "[(_this select 0),2] call ALF_fnc_createFeu;";
			deleted = "{deleteVehicle _x} forEach (((_this select 0) getVariable [""effects"",[]]) + (attachedObjects (_this select 0)))";
		};
	};
	
	class House_F;	// External class reference
	
	class Land_MultistoryBuilding_01_F : House_F {
		class UserActions {
			class DES_GetUpBalcony {
				displayName = "Balcon";
				displayNameDefault = "";
				priority = 3;
				radius = 34;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-17.4587,-17.6226,-21.0173] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-12.3358,-17.6931,-14.6502], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony {
				displayName = "Descendre";
				displayNameDefault = "a";
				priority = 3;
				radius = 41;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-12.3358,-17.6931,-14.6502] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-17.4587,-17.6226,-21.0173], this, getDir this, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 32;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-17.512,-12.0719,-21.0165] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [3.0877,13.328,19.2671], this, getDir this, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 30;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-17.4983,6.97291,-21.0165] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [3.0877,13.328,19.2671], this, getDir this, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof3 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 30;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [17.9146,4.36052,-21.0165] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [3.0877,13.328,19.2671], this, getDir this, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 25;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [3.0877,13.328,19.2671] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [10.0984,-11.9656,-21.0165], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_MultistoryBuilding_03_F : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 27;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-7.1592,-1.62682,-24.2182] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.707389,11.0242,25.919], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 31;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.00740668,-13.1225,-25.9038] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.707389,11.0242,25.919], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 30;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.707389,11.0242,25.919] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-1.57538,5.14032,-25.9038], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_MultistoryBuilding_04_F : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 40;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-8.81798,-4.26666,-36.3137] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [5.3093,2.27957,22.3974], this, (getDir this)+270, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 41;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [7.08506,-9.41359,-36.3137] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [5.3093,2.27957,22.3974], this, (getDir this)+270, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 25;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [5.3093,2.27957,22.3974] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-8.81798,-4.26666,-36.3137], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Shop_City_04_F : House_F {
		class UserActions {
			class DES_GetUpBalcony1 {
				displayName = "Balcon";
				displayNameDefault = "";
				priority = 3;
				radius = 12;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [0.293517,-10.1212,-3.96194] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.214312,-10.5859,3.62691], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 14;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [0.214312,-10.5859,3.62691] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.293517,-10.1212,-3.96194], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 11;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [7.99442,2.70278,-3.96194] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [1.26571,3.79288,4.19687], this, (getDir this)+270, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 11;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-8.07868,-1.69372,-3.96194] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-1.22675,-4.99467,7.00576], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [1.25828,3.82576,4.19687] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [7.99677,2.70421,-3.96194], this, (getDir this), 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 11;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-1.22675,-4.99467,7.00576] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-8.07868,-1.69372,-3.96194], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class ALF_Camion_Poubelle;
	class V_ALF_Camion_Poubelle : ALF_Camion_Poubelle {maximumLoad = 0;};
	
	
	class Land_Shop_City_05_F : House_F {
		class UserActions {
			class DES_GetUpBalcony1 {
				displayName = "Balcon (r)";
				displayNameDefault = "";
				priority = 3;
				radius = 21;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-9.18351,15.0192,-7.47618] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-5.20329,15.4759,-3.70688], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpBalcony2 {
				displayName = "Balcon (l)";
				displayNameDefault = "";
				priority = 3;
				radius = 21;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-9.18351,15.0192,-7.47618] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [5.40994,15.4744,-3.70954], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 19;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [5.40994,15.4744,-3.70954] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-9.18351,15.0192,-7.47618], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony2 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 19;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player &&  {this modelToWorld [-5.20329,15.4759,-3.70688] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-9.18351,15.0192,-7.47618], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 18;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [0.983169,14.6631,-7.47618] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.0615847,1.69433,4.11352], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 15;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.332568,-10.4033,-7.30859] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.0615847,1.69433,4.11352], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof3 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 15;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [9.85053,4.94553,-7.47618] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [5.16387,7.26027,4.11352], this, (getDir this)+270, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 6;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.0615847,1.69433,4.11352] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.983169,14.6631,-7.47618], this, (getDir this), 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre ";
				priority = 3;
				radius = 6;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.0615847,1.69433,4.11352] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.332568,-10.4033,-7.30859], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof3 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 12;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [5.16387,7.26027,4.11352] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [9.85053,4.94553,-7.47618], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Hotel_02_F : House_F {
		class UserActions {
			class DES_GetUpBalcony1 {
				displayName = "Balcon";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-6.30013,-0.834253,0.109366] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-8.70617,-3.60269,0.0956259], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony1 {
				displayName = "Descendre";
				displayNameDefault = "a";
				priority = 3;
				radius = 13;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-8.70617,-3.60269,0.0956259] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-6.30013,-0.834253,0.109366], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpBalcony2 {
				displayName = "Balcon";
				displayNameDefault = "";
				priority = 3;
				radius = 6;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [1.69122,-0.82265,0.109366] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [5.00811,-3.9505,0.0956259], this, (getDir this)+270, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony2 {
				displayName = "Descendre";
				displayNameDefault = "a";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [5.00811,-3.9505,0.0956259] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [1.69122,-0.82265,0.109366], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpBalcony3 {
				displayName = "Balcon";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-6.80754,2.73215,0.109366] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-8.70757,5.92076,0.0935259], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony3 {
				displayName = "Descendre";
				displayNameDefault = "a";
				priority = 3;
				radius = 13;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-8.70757,5.92076,0.0935259] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-6.80754,2.73215,0.109366], this, (getDir this), 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpBalcony4 {
				displayName = "Balcon";
				displayNameDefault = "";
				priority = 3;
				radius = 13;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [1.64025,2.73108,0.109366] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [4.99385,5.51732,0.0935259], this, (getDir this)+270, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony4 {
				displayName = "Descendre";
				displayNameDefault = "a";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [4.99385,5.51732,0.0935259] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [1.64025,2.73108,0.109366], this, (getDir this), 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Cathedral_01_F : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "a";
				displayNameDefault = "";
				priority = 3;
				radius = 13;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [7.59095,-5.00461,-9.37976] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [9.19095,-13.0103,11.1967], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "a";
				displayNameDefault = "";
				priority = 3;
				radius = 13;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-7.58171,-4.67861,-9.37976] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-9.20429,-13.4737,11.1967], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 33;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [9.19095,-13.0103,11.1967] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [7.59095,-5.00461,-9.37976], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre";
				displayNameDefault = "Descendre ";
				priority = 3;
				radius = 33;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-9.20429,-13.4737,11.1967] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-7.58171,-4.67861,-9.37976], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_OrlHot : House_F {
		class UserActions {
			class DES_GetUpBalcony1 {
				displayName = "Balcon ";
				displayNameDefault = "";
				priority = 3;
				radius = 7;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.0255127,5.48958,-3.83391] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.00389099,5.24121,0.0881996], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony1 {
				displayName = "Descendre ";
				displayNameDefault = "a";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [0.00389099,5.24121,0.0881996] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.0255127,5.48958,-3.83391], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpBalcony2 {
				displayName = "Balcon ";
				displayNameDefault = "";
				priority = 3;
				radius = 7;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.0255127,5.48958,-3.83391] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [5.53221,-3.07261,-0.08393], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony2 {
				displayName = "Descendre ";
				displayNameDefault = "a";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [5.53221,-3.07261,-0.08393] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.0255127,5.48958,-3.83391], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpBalcony3 {
				displayName = "Balcon ";
				displayNameDefault = "";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-5.47333,-4.0481,-3.83391] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [4.60422,-4.01637,-0.08393], this, (getDir this)+270, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony3 {
				displayName = "Descendre ";
				displayNameDefault = "a";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [4.60422,-4.01637,-0.08393] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-5.47333,-4.0481,-3.83391], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Mil_House : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.05295,6.09406,-5.1429] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.20322,-5.62192,3.37913], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 12;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.20322,-5.62192,3.37913] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.05295,6.09406,-5.1429], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Mil_House_dam : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.594055,7.53996,-5.24809] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.689865,-4.41565,3.40647], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 12;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.689865,-4.41565,3.40647] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.594055,7.53996,-5.24809], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_A_MunicipalOffice : House_F {
		class UserActions {
			class DES_GetUpBalcony1 {
				displayName = "Balcon ";
				displayNameDefault = "";
				priority = 3;
				radius = 23;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.296906,10.1464,-18.4241] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-3.10941,11.3457,-11.5891], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownBalcony1 {
				displayName = "Descendre ";
				displayNameDefault = "a";
				priority = 3;
				radius = 17;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.80463,10.4239,-11.5891] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.296906,10.1464,-18.4241], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_HouseB_Tenement : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 25;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-7.86343,5.70817,-20.7845] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-9.9642,2.70815,18.4924], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "a";
				displayNameDefault = "";
				priority = 3;
				radius = 25;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-10.6301,5.65852,-20.7845] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-9.9642,2.70815,18.4924], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 23;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-9.9642,2.70815,18.4924] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-7.86343,5.70817,-20.7845], this, (getDir this), 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Mil_House_EP1 : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "a";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.05295,6.09406,-5.1429] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.20322,-5.62192,3.37913], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 12;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.20322,-5.62192,3.37913] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.05295,6.09406,-5.1429], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Mil_House_dam_EP1 : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.594055,7.53996,-5.24809] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.689865,-4.41565,3.40647], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 12;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.689865,-4.41565,3.40647] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.594055,7.53996,-5.24809], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan2_01 : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-6.05463,0.171122,-7.36417] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [1.10847,-0.326059,6.28773], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 15;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [1.10847,-0.326059,6.28773] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-6.05463,0.171122,-7.36417], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan2_02 : House_F {
		class UserActions {
			class DES_GetUpRoofR {
				displayName = "a";
				displayNameDefault = "";
				priority = 3;
				radius = 5;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-1.23128,0.0799637,-4.14961] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [6.1339,-9.77591,5.98289], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoofL {
				displayName = "a";
				displayNameDefault = "";
				priority = 3;
				radius = 5;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-1.23128,0.0799637,-4.14961] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [6.48677,9.72869,5.98289], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoofR {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 16;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [6.1339,-9.77591,5.98289] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-1.23128,0.0799637,-4.14961], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoofL {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 16;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [6.48677,9.72869,5.98289] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-1.23128,0.0799637,-4.14961], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan2_03 : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-3.69959,-4.86586,-6.50645] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [1.44265,0.0844555,0.690866], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [6.22047,5.36641,-6.50645] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [1.44265,0.0844555,0.690866], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [1.44265,0.0844555,0.690866] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-3.69959,-4.86586,-6.50645], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [1.44265,0.0844555,0.690866] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [6.22047,5.36641,-6.50645], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan2_03a : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-3.69959,-4.86586,-6.50645] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [1.44265,0.0844555,0.690866], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [6.22047,5.36641,-6.50645] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [1.44265,0.0844555,0.690866], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [1.44265,0.0844555,0.690866] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-3.69959,-4.86586,-6.50645], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [1.44265,0.0844555,0.690866] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [6.22047,5.36641,-6.50645], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan2_04a : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 10;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-1.19003,-7.04561,-3.96176] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [2.5227,-4.17255,2.65847], this, (getDir this), 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 12;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [2.5227,-4.17255,2.65847] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-1.19003,-7.04561,-3.96176], this, (getDir this), 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 7;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-7.23273,2.11963,-3.96176] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.417642,0.67778,2.65847], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 12;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [0.417642,0.67778,2.65847] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-7.23273,2.11963,-3.96176], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan3_hromada : House_F {
		class UserActions {
			class DES_GetUpRoofR {
				displayName = "Monter sur le toit ";
				displayNameDefault = "";
				priority = 3;
				radius = 5;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-3.21511,0.144741,-3.24189] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.51211,1.85963,2.64392], this, (getDir this)+270, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoofL {
				displayName = "Monter sur le toit ";
				displayNameDefault = "";
				priority = 3;
				radius = 5;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-3.21511,0.144741,-3.24189] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-4.83307,-3.1396,2.64392], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoofR {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 11;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.51211,1.85963,2.64392] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-3.21511,0.144741,-3.24189], this, (getDir this), 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoofL {
				displayName = "Descendre";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 11;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-4.83307,-3.1396,2.64392] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-3.21511,0.144741,-3.24189], this, (getDir this), 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_mesto3_istan : House_F {
		class UserActions {
			class DES_GetUpBalcony1 {
				displayName = "Balcon";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-5.65726,0.187855,-3.22397] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.60907,4.00632,0.894894], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpBalcony2 {
				displayName = "Balcon";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [5.98054,-0.182106,-3.22397] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.60907,4.00632,0.894894], this, (getDir this)+90, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.60907,4.00632,0.894894] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.52441,6.06948,-7.29237], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.60907,4.00632,0.894894] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [5.98054,-0.182106,-3.22397], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan4 : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [0.52441,6.06948,-7.29237] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.43475,-0.334198,4.75763], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [2.70084,-2.62489,-4.34236] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.43475,-0.334198,4.75763], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 14;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.43475,-0.334198,4.75763] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.52441,6.06948,-7.29237], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 14;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.43475,-0.334198,4.75763] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [2.70084,-2.62489,-4.34236], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan4_big : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 13;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [0.514347,5.58255,-10.2886] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.4571,-0.432369,7.78447], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [2.72283,-2.90434,-7.33857] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.4571,-0.432369,7.78447], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 20;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.4571,-0.432369,7.78447] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.514347,5.58255,-10.2886], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 20;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.4571,-0.432369,7.78447] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [2.72283,-2.90434,-7.33857], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan4_big_inverse : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 13;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.521198,5.60997,-10.2863] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [2.52451,-0.0461845,7.7867], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.74318,-2.73177,-7.33634] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [2.52451,-0.0461845,7.7867], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 20;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [2.52451,-0.0461845,7.7867] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.521198,5.60997,-10.2863], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 20;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [2.52451,-0.0461845,7.7867] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.74318,-2.73177,-7.33634], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan4_detaily1 : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [0.52441,6.06948,-7.29237] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.43475,-0.334198,4.75763], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [2.70084,-2.62489,-4.34236] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.43475,-0.334198,4.75763], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 14;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.43475,-0.334198,4.75763] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [0.52441,6.06948,-7.29237], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 14;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.43475,-0.334198,4.75763] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [2.70084,-2.62489,-4.34236], this, (getDir this)+270, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
	
	class Land_Dum_istan4_inverse : House_F {
		class UserActions {
			class DES_GetUpRoof1 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 9;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-0.390488,5.68618,-7.28588] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [2.51975,0.278011,4.76412], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetUpRoof2 {
				displayName = "Monter sur le toit";
				displayNameDefault = "";
				priority = 3;
				radius = 8;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [-2.6432,-2.52747,-4.33588] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [2.51975,0.278011,4.76412], this, (getDir this)+180, 1] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof1 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 14;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [2.51975,0.278011,4.76412] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-0.390488,5.68618,-7.28588], this, (getDir this)+180, 0] spawn ALF_fnc_teleportDoor";
			};
			
			class DES_GetDownRoof2 {
				displayName = "Descendre ";
				displayNameDefault = "Descendre";
				priority = 3;
				radius = 14;
				position = "camera";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "vehicle player == player && {this modelToWorld [2.51975,0.278011,4.76412] distance getPosATL player <= 2}";
				statement = "[player, this modelToWorld [-2.6432,-2.52747,-4.33588], this, (getDir this)+90, 0] spawn ALF_fnc_teleportDoor";
			};
		};
	};
};
