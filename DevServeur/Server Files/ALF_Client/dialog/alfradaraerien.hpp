class ALF_Radar_Aerien {
  idd = 845760;
  movingEnable = 0;
  enableSimulation = 1;
  onUnload = "ALF_curTargetRadar = objNull; { deleteMarkerLocal (_x select 0); } forEach ALF_ListeMarkerHelicoRadarAerien; ALF_ListeMarkerHelicoRadarAerien = []; ALF_ListeHelicoRadarAerien = [];";

  class controlsBackground {
    class life_RscTitleBackground: Life_RscText    {
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
      idc = -1;
      x = 0.335 * safezoneW + safezoneX;
      y = 0.335 * safezoneH + safezoneY;
      w = 0.472396 * safezoneW;
      h = 0.022 * safezoneH;
    };

    class MainBackground: Life_RscText {
      colorBackground[] = {0,0,0,0.7};
      idc = -1;
      x = 0.335 * safezoneW + safezoneX;
    	y = 0.3592 * safezoneH + safezoneY;
    	w = 0.472396 * safezoneW;
    	h = 0.52037 * safezoneH;
    };

    class TitreGlobale: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Menu Radar Aerien";
      x = 0.334278 * safezoneW + safezoneX;
    	y = 0.3361 * safezoneH + safezoneY;
    	w = 0.472396 * safezoneW;
    	h = 0.022 * safezoneH;
    };

    class TitreHelico: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Helico :";
      x = 0.336959 * safezoneW + safezoneX;
    	y = 0.36583 * safezoneH + safezoneY;
    	w = 0.121771 * safezoneW;
    	h = 0.0173704 * safezoneH;
    };

    class MapView : Life_RscMapControl {
      idc = 845761;
      x = 0.469269 * safezoneW + safezoneX;
    	y = 0.36668 * safezoneH + safezoneY;
    	w = 0.333437 * safezoneW;
    	h = 0.505926 * safezoneH;
      maxSatelliteAlpha = 0.75;//0.75;
      alphaFadeStartScale = 1.15;//0.15;
      alphaFadeEndScale = 1.29;//0.29;
    };
  };

  class controls {
    class HelicoListe: Life_RscListBox {
      idc = 845762;
      text = "";
      sizeEx = 0.035;
      onLBSelChanged = "[1] call ALF_fnc_menuRadarAerien";
      x = 0.340574 * safezoneW + safezoneX;
    	y = 0.389901 * safezoneH + safezoneY;
    	w = 0.121458 * safezoneW;
    	h = 0.481852 * safezoneH;
    };

    class RafraichirButton: Life_RscButtonMenu {
			idc = -1;
			text = "RAFRAICHIR LA LISTE";
			onButtonClick = "[2] call ALF_fnc_menuRadarAerien";
      x = 0.40625 * safezoneW + safezoneX;
    	y = 0.879531 * safezoneH + safezoneY;
    	w = 0.0826823 * safezoneW;
    	h = 0.022 * safezoneH;
		};

    class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
      x = 0.335418 * safezoneW + safezoneX;
    	y = 0.879531 * safezoneH + safezoneY;
    	w = 0.0644531 * safezoneW;
    	h = 0.022 * safezoneH;
		};

    class ParlerButtonKey: Life_RscButtonMenu {
			idc = 845763;
			text = "PARLER";
      x = 0.495832 * safezoneW + safezoneX;
    	y = 0.879531 * safezoneH + safezoneY;
    	w = 0.0342448 * safezoneW;
    	h = 0.022 * safezoneH;
		};
  };
};
