class ALF_Mobiler_Inv {
	idd = 157532;
	name= "ALF_Mobiler_Inv";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {};
	class controls {
		class life_RscTitleBackground: Life_RscText
		{
			idc = -1;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitreSurMoi: Life_RscTitle
		{
			idc = -1;
			text = "Mes objets sur moi :";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class TitreGlobale: Life_RscTitle
		{
			idc = -1;
			text = "Inventaire mobilier";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class TitreSurTable: Life_RscTitle
		{
			idc = -1;
			text = "Inventaire:";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class MoiListe: Life_RscListBox
		{
			idc = 157533;
			sizeEx = 0.035;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.451 * safezoneH;
		};
		class TableListe: Life_RscListBox
		{
			idc = 157534;
			sizeEx = 0.035;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.451 * safezoneH;
		};
		class PutBtn: Life_RscButtonMenu
		{
			idc = 157535;
			text = "Poser";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class TakeBtn: Life_RscButtonMenu
		{
			idc = 157536;
			text = "Prendre";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class CloseButtonKey: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			text = "Fermer";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class Edit: Life_RscEdit
		{
			idc = 157537;
			text = "1";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class MassText: Life_RscText
		{
			idc = 157538;
			text = "Poids: ** / ** kg";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};
};

class ALF_Mobilier_Safe {
	idd = 158532;
	name= "ALF_Mobilier_Safe";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {};
	class controls {
		class life_RscTitleBackground: Life_RscText
		{
			idc = -1;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitreGlobale: Life_RscTitle
		{
			idc = -1;
			text = "Coffre blindé";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class TakeBtn: Life_RscButtonMenu
		{
			idc = 158533;
			text = "OUVRIR";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class Edit: Life_RscEdit
		{
			idc = 158534;
			text = "0000";
			sizeEx = 0.5;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.22 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};
