class ALF_All_Prisonniers {
  idd = 87680;
  movingEnable = 0;
  enableSimulation = 1;

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
    	h = 0.4 * safezoneH;
    };

    class TitreGlobale: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Menu pour voir tous les prisonniers";
    	x = 0.334278 * safezoneW + safezoneX;
    	y = 0.3361 * safezoneH + safezoneY;
    	w = 0.2 * safezoneW;
    	h = 0.022 * safezoneH;
    };

    class TitrePrisonniers: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Prisonnier(s) :";
    	x = 0.336979 * safezoneW + safezoneX;
    	y = 0.37 * safezoneH + safezoneY;
    	w = 0.2 * safezoneW;
    	h = 0.0173704 * safezoneH;
    };
  };

  class controls {
    class PrisonniersListe: Life_RscListBox {
      idc = 87681;
      text = "";
      sizeEx = 0.035;
      x = 0.340569 * safezoneW + safezoneX;
    	y = 0.39352 * safezoneH + safezoneY;
    	w = 0.190209 * safezoneW;
    	h = 0.357777 * safezoneH;
    };

    class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; ";
      x = 0.334897 * safezoneW + safezoneX;
    	y = 0.75916 * safezoneH + safezoneY;
    	w = 0.0644531 * safezoneW;
    	h = 0.022 * safezoneH;
		};
  };
};
