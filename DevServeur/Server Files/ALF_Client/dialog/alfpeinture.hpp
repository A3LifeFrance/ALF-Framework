class alfpeinture {
	idd = 89770;
	name= "alfpeinture";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	onUnload = "if !(ALF_Peinture_Appliquer) then {ALF_Peinture_NearestVehicle setObjectTextureGlobal [0,ALF_Peinture_Texture]; ALF_Peinture_NearestVehicle setObjectMaterialGlobal [0,ALF_Peinture_Materiel];};";

	class controlsBackground {
		class life_RscTitleBackground: Life_RscText    {
		  colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		  idc = -1;
				x = 0.335 * safezoneW + safezoneX;
				y = 0.335 * safezoneH + safezoneY;
				w = 0.25 * safezoneW;
				h = 0.022 * safezoneH;
		};

		class MainBackground: Life_RscText {
		  colorBackground[] = {0,0,0,0.7};
		  idc = -1;
				x = 0.335 * safezoneW + safezoneX;
				y = 0.3592 * safezoneH + safezoneY;
				w = 0.309375 * safezoneW;
				h = 0.225 * safezoneH;
		};

		class TitreGlobale: Life_RscTitle {
		  colorBackground[] = {0,0,0,0};
		  idc = -1;
		  text = "Menu Peinture";
				x = 0.335412 * safezoneW + safezoneX;
				y = 0.33896 * safezoneH + safezoneY;
				w = 0.25 * safezoneW;
				h = 0.0164445 * safezoneH;
		};

		class Rouge_Titre: Life_RscTitle {
		  colorBackground[] = {0,0,0,0};
		  idc = -1;
		  text = "R";
				x = 0.338593 * safezoneW + safezoneX;
				y = 0.369852 * safezoneH + safezoneY;
				w = 0.0172917 * safezoneW;
				h = 0.0216667 * safezoneH;
		};

		class Vert_Titre: Life_RscTitle {
		  colorBackground[] = {0,0,0,0};
		  idc = -1;
		  text = "V";
				x = 0.338021 * safezoneW + safezoneX;
				y = 0.407407 * safezoneH + safezoneY;
				w = 0.0172917 * safezoneW;
				h = 0.0216667 * safezoneH;
		};

		class Bleue_Titre: Life_RscTitle {
		  colorBackground[] = {0,0,0,0};
		  idc = -1;
		  text = "B";
				x = 0.338541 * safezoneW + safezoneX;
				y = 0.446297 * safezoneH + safezoneY;
				w = 0.0172917 * safezoneW;
				h = 0.0216667 * safezoneH;
		};

		class Rvmat_Titre: Life_RscTitle {
		  colorBackground[] = {0,0,0,0};
		  idc = -1;
		  text = "RVMAT";
				x = 0.339061 * safezoneW + safezoneX;
				y = 0.500926 * safezoneH + safezoneY;
				w = 0.0615625 * safezoneW;
				h = 0.0216667 * safezoneH;
		};

		class Covering_Titre: Life_RscTitle {
		  colorBackground[] = {0,0,0,0};
		  idc = -1;
		  text = "COVERING";
				x = 0.338542 * safezoneW + safezoneX;
				y = 0.547222 * safezoneH + safezoneY;
				w = 0.0615625 * safezoneW;
				h = 0.0216667 * safezoneH;
		};
	};

	class controls {

		class Slider_Rouge
		{
			idc = 89771;
			type = 3;
			style = 1024;
			x = 0.352604 * safezoneW + safezoneX;
			y = 0.373148 * safezoneH + safezoneY;
			w = 0.227708 * safezoneW;
			h = 0.0281482 * safezoneH;
			onSliderPosChanged = "[1] call ALF_fnc_menuPeinture;";
			colorBackground[] = {0,0,0,1};
			color[] = { 1, 1, 1, 1 };
    	coloractive[] = { 1, 1, 1, 1 };
		};

		class Slider_Vert
		{
			idc = 89772;
			type = 3;
			style = 1024;
			x = 0.352604 * safezoneW + safezoneX;
			y = 0.410185 * safezoneH + safezoneY;
			w = 0.227708 * safezoneW;
			h = 0.0281482 * safezoneH;
			onSliderPosChanged = "[1] call ALF_fnc_menuPeinture;";
			colorBackground[] = {0,0,0,1};
			color[] = { 1, 1, 1, 1 };
    	coloractive[] = { 1, 1, 1, 1 };
		};

		class Slider_Bleue
		{
			idc = 89773;
			type = 3;
			style = 1024;
			x = 0.352604 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.227708 * safezoneW;
			h = 0.0281482 * safezoneH;
			onSliderPosChanged = "[1] call ALF_fnc_menuPeinture;";
			colorBackground[] = {0,0,0,1};
			color[] = { 1, 1, 1, 1 };
    	coloractive[] = { 1, 1, 1, 1 };
		};

		class Combo_Rvmat: Life_RscCombo
		{
			idc = 89774;
			x = 0.400521 * safezoneW + safezoneX;
			y = 0.498148 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.0281481 * safezoneH;
			colorBackground[] = {0,0,0,1};
			onLBSelChanged = "[2,_this] call ALF_fnc_menuPeinture;";
		};

		class Combo_Covering: Life_RscCombo
		{
			idc = 89775;
			x = 0.400521 * safezoneW + safezoneX;
			y = 0.544445 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.0281481 * safezoneH;
			colorBackground[] = {0,0,0,1};
			onLBSelChanged = "[3,_this] call ALF_fnc_menuPeinture;";
		};
		
		class edit_red : Life_RscEdit {
			idc = 89776;
			text = "";
			colorBackground[] = {1,1,1,0.8};
			colorText[] = {0,0,0,1};
			shadow = 0;
			sizeEx = 0.05;
			onKeyUp = "[_this select 0, _this select 1,'red'] call ALF_fnc_peint_onChar;";
			x = 0.589718 * safezoneW + safezoneX;
			y = 0.3724 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class edit_green : Life_RscEdit {
			idc = 89777;
			text = "";
			colorBackground[] = {1,1,1,0.8};
			colorText[] = {0,0,0,1};
			shadow = 0;
			sizeEx = 0.05;
			onKeyUp = "[_this select 0, _this select 1,'green'] call ALF_fnc_peint_onChar;";
			x = 0.589718 * safezoneW + safezoneX;
			y = 0.4076 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class edit_blue : Life_RscEdit {
			idc = 89777;
			text = "";
			colorBackground[] = {1,1,1,0.8};
			colorText[] = {0,0,0,1};
			shadow = 0;
			sizeEx = 0.05;
			onKeyUp = "[_this select 0, _this select 1,'blue'] call ALF_fnc_peint_onChar;";
			x = 0.589718 * safezoneW + safezoneX;
			y = 0.4472 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.334896 * safezoneW + safezoneX;
			y = 0.58426 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class AppliquerButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "APPLIQUER";
			onButtonClick = "[4] call ALF_fnc_menuPeinture;";
			x = 0.499479 * safezoneW + safezoneX;
			y = 0.58426 * safezoneH + safezoneY;
			w = 0.0852865 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
