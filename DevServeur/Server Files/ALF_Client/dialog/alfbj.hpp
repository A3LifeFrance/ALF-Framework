class alfbj {
	idd = 541618;
	name= "alfbj";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class life_RscTitleBackground: Life_RscText    {
      		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
      		idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.022 * safezoneH;
    	};

    	class MainBackground: Life_RscText {
      		colorBackground[] = {0,0,0,0.7};
      		idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.3592 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.125 * safezoneH;
    	};

		class TitreGlobale: Life_RscTitle {
      		colorBackground[] = {0,0,0,0};
      		idc = -1;
      		text = "Menu BlackJack";
			x = 0.335417 * safezoneW + safezoneX;
			y = 0.338889 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0164445 * safezoneH;
    	};
	};

	class controls {

		class MiserRelancerEdit: Life_RscEdit
		{
			idc = 5416181;
			text = "";
			x = 0.402604 * safezoneW + safezoneX;
			y = 0.377778 * safezoneH + safezoneY;
			w = 0.125938 * safezoneW;
			h = 0.0155186 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class MiserRelancerButton: Life_RscButtonMenu
		{
			onButtonClick = "[6] spawn ALF_fnc_playPoker;";
			idc = 5416182;
			text = "Miser";
			x = 0.337501 * safezoneW + safezoneX;
			y = 0.376852 * safezoneH + safezoneY;
			w = 0.0353125 * safezoneW;
			h = 0.0164445 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,1};
		};
	};
};
