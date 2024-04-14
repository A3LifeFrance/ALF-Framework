class ALF_Ajout_Bracelet_Elect {
  idd = 87590;
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
    	h = 0.2816 * safezoneH;
    };

    class TitreGlobale: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Menu ajout bracelet electroniquee";
      x = 0.335 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.2 * safezoneW;
    	h = 0.022 * safezoneH;
    };

    class TitreJour: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Jour(s) :";
      x = 0.341666 * safezoneW + safezoneX;
    	y = 0.388889 * safezoneH + safezoneY;
    	w = 0.069375 * safezoneW;
    	h = 0.0216666 * safezoneH;
    };

    class TitreHeure: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Heure(s) :";
      x = 0.408333 * safezoneW + safezoneX;
    	y = 0.388889 * safezoneH + safezoneY;
    	w = 0.069375 * safezoneW;
    	h = 0.0216666 * safezoneH;
    };

    class TitreMinute: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Minute(s) :";
      x = 0.47552 * safezoneW + safezoneX;
    	y = 0.388889 * safezoneH + safezoneY;
    	w = 0.069375 * safezoneW;
    	h = 0.0216666 * safezoneH;
    };

    class InfoTexte: Life_RscStructuredText {
      colorBackground[] = {0,0,0,0};
      idc = 87594;
      text = "";
      x = 0.341146 * safezoneW + safezoneX;
    	y = 0.450926 * safezoneH + safezoneY;
    	w = 0.185 * safezoneW;
    	h = 0.174444 * safezoneH;
    };
  };

  class controls {
    class JourEdit: Life_RscEdit {
      idc = 87591;
      sizeEx = 0.038;
      text = "0";
      x = 0.342708 * safezoneW + safezoneX;
    	y = 0.413889 * safezoneH + safezoneY;
    	w = 0.0459375 * safezoneW;
    	h = 0.0272222 * safezoneH;
    };

    class HeureEdit: Life_RscEdit {
      idc = 87592;
      sizeEx = 0.038;
      text = "0";
      x = 0.410417 * safezoneW + safezoneX;
    	y = 0.413889 * safezoneH + safezoneY;
    	w = 0.0459375 * safezoneW;
    	h = 0.0272222 * safezoneH;
    };

    class MinuteEdit: Life_RscEdit {
      idc = 87593;
      sizeEx = 0.038;
      text = "0";
      x = 0.477083 * safezoneW + safezoneX;
    	y = 0.413889 * safezoneH + safezoneY;
    	w = 0.0459375 * safezoneW;
    	h = 0.0272222 * safezoneH;
    };

    class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; ";
      x = 0.334896 * safezoneW + safezoneX;
    	y = 0.6412 * safezoneH + safezoneY;
    	w = 0.0644531 * safezoneW;
    	h = 0.022 * safezoneH;
		};

    class AjoutBraceletButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "Ajout Bracelet";
			onButtonClick = "[1,[ctrlText 87591,ctrlText 87592,ctrlText 87593]] call ALF_fnc_menuAjoutBracelet;";
      x = 0.444272 * safezoneW + safezoneX;
    	y = 0.6412 * safezoneH + safezoneY;
    	w = 0.0904947 * safezoneW;
    	h = 0.022 * safezoneH;
		};
  };
};
