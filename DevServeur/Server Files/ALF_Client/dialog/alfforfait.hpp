class ALF_Forfait_Dialog {
	idd = 15000;
	name= "ALF_Forfait_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class ForfaitMenu: Life_RscPicture {
			text = "\ALF_Client2\textures\Orange\orange.paa";
			idc = -1;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};

	class controls {
		class ForfaitTexte1: Life_RscStructuredText
		{
			idc = 15001;
			text = "";
			style = 0;
			x = 0.553646 * safezoneW + safezoneX;
			y = 0.521297 * safezoneH + safezoneY;
			w = 0.202708 * safezoneW;
			h = 0.0364819 * safezoneH;
		};
		class Offre1: Life_RscButtonInvisible {
			idc = 15002;
			text = "";
			onButtonClick = "[1,1] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.288489 * safezoneW + safezoneX;
			y = 0.585222 * safezoneH + safezoneY;
			w = 0.0797916 * safezoneW;
			h = 0.247593 * safezoneH;
		};
		class Offre2: Life_RscButtonInvisible {
			idc = 15003;
			text = "";
			onButtonClick = "[1,2] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.375521 * safezoneW + safezoneX;
			y = 0.585222 * safezoneH + safezoneY;
			w = 0.0797916 * safezoneW;
			h = 0.247593 * safezoneH;
		};
		class Offre3: Life_RscButtonInvisible {
			idc = 15004;
			text = "";
			onButtonClick = "[1,3] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.463021 * safezoneW + safezoneX;
			y = 0.585222 * safezoneH + safezoneY;
			w = 0.0797916 * safezoneW;
			h = 0.247593 * safezoneH;
		};
		class Offre4: Life_RscButtonInvisible {
			idc = 15005;
			text = "";
			onButtonClick = "[1,4] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.585222 * safezoneH + safezoneY;
			w = 0.0797916 * safezoneW;
			h = 0.247593 * safezoneH;
		};
		class Offre5: Life_RscButtonInvisible {
			idc = 15006;
			text = "";
			onButtonClick = "[2,0] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.671354 * safezoneW + safezoneX;
			y = 0.585222 * safezoneH + safezoneY;
			w = 0.0797916 * safezoneW;
			h = 0.247593 * safezoneH;
		};
	};
};
