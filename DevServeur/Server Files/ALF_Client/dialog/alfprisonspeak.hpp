class ALF_SPEAKERS_PRISON {
  idd = 654585;
  movingEnable = 0;
  enableSimulation = 1;
  class controlsBackground {};
  class controls {
    class life_RscTitleBackground: Life_RscText
    {
      idc = -1;
      x = 0.407187 * safezoneW + safezoneX;
      y = 0.412 * safezoneH + safezoneY;
      w = 0.165 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
    };
    class MainBackground: Life_RscText
    {
      idc = -1;
      x = 0.407187 * safezoneW + safezoneX;
      y = 0.434 * safezoneH + safezoneY;
      w = 0.165 * safezoneW;
      h = 0.165 * safezoneH;
      colorBackground[] = {0,0,0,0.7};
    };
    class TitreGlobale: Life_RscTitle
    {
      idc = -1;
      text = "Menu Haut Parleur";
      x = 0.407187 * safezoneW + safezoneX;
      y = 0.412 * safezoneH + safezoneY;
      w = 0.165 * safezoneW;
      h = 0.022 * safezoneH;
      colorText[] = {0.95,0.95,0.95,1};
    };
    class TitreHelico: Life_RscButtonMenu
    {
      idc = 654586;
      text = "Parler cour";
      x = 0.43 * safezoneW + safezoneX;
      y = 0.467 * safezoneH + safezoneY;
      w = 0.12 * safezoneW;
      h = 0.022 * safezoneH;
      colorText[] = {0.95,0.95,0.95,1};
    };
    class CloseButtonKey: Life_RscButtonMenu
    {
      onButtonClick = "closeDialog 0;";
      idc = -1;
      text = "FERMER";
      x = 0.407187 * safezoneW + safezoneX;
      y = 0.599 * safezoneH + safezoneY;
      w = 0.0644531 * safezoneW;
      h = 0.022 * safezoneH;
      colorText[] = {1,1,1,1};
      colorBackground[] = {0,0,0,0.8};
    };
    class RscText_1004: Life_RscButtonMenu
    {
      idc = 654587;
      text = "Parler cellules";
      x = 0.43 * safezoneW + safezoneX;
      y = 0.533 * safezoneH + safezoneY;
      w = 0.12 * safezoneW;
      h = 0.022 * safezoneH;
      colorText[] = {0.95,0.95,0.95,1};
    };
  };
};
