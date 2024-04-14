class Life_Clothing {
	idd = 3100;
	name= "Life_Clothing";
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground {
		class BACKGROUND: Life_RscPicture {
			idc = -1;
			text = "\ALF_Client2\textures\Shop\clothing_background.paa";
			x = 0.00912475 * safezoneW + safezoneX;
			y = 0.1436 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.726 * safezoneH;
		};
		class CLOSE_IMG: Life_RscPicture {
			idc = -1;
			text = "\ALF_Client2\textures\Shop\close.paa";
			x = 0.00984436 * safezoneW + safezoneX;
			y = 0.254874 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.616 * safezoneH;
		};
		class BUY_IMG: Life_RscPicture {
			idc = 3104;
			text = "\ALF_Client2\textures\Shop\buy.paa";
			x = 0.0111879 * safezoneW + safezoneX;
			y = 0.2756 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.594 * safezoneH;
		};
	};

	class controls {
		class PRICE: Life_RscStructuredText {
			idc = 3102;
			text = "";
			x = 0.0514175 * safezoneW + safezoneX;
			y = 0.7706 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class LISTE_CLOTHING: Life_RscListBox {
			idc = 3101;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call life_fnc_changeClothes;";
			x = 0.0555312 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.462 * safezoneH;
		};

		class FILTER: Life_RscCombo {
			idc = 3105;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call life_fnc_clothingFilter";
			x = 0.055531 * safezoneW + safezoneX;
			y = 0.2536 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class CLOSE_BTN: Life_RscButtonInvisible {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; ";
			x = 0.0524374 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class BUY_BTN: Life_RscButtonInvisible {
			idc = 3106;
			text = "";
			onButtonClick = "[] spawn life_fnc_buyClothes;";
			x = 0.137 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class viewAngle: life_RscXSliderH {
			color[] = {1, 1, 1, 0.45};
			colorActive[] = {1, 1, 1, 0.65};
			idc = 3107;
			text = "";
			onSliderPosChanged = "[4,_this select 1] call ALF_fnc_s_onSliderChange;";
			tooltip = "";
			x = 0.25 * safezoneW + safezoneX;
			y = 0.95 * safezoneH + safezoneY;
			w = 0.5 * safezoneW;
			h = 0.02 * safezoneH;
		};
	};
};