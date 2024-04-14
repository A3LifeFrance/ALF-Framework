class ALF_Craft_Prison {
	idd = 156532;
	name= "ALF_Craft_Prison";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {};

	class controls {
		class life_RscTitleBackground: Life_RscText
		{
			idc = -1;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28.5 * GUI_GRID_W;
			h = 23 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitreSurMoi: Life_RscTitle
		{
			idc = -1;
			text = "Mes objets sur moi :";
			x = 22.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class TitreGlobale: Life_RscTitle
		{
			idc = -1;
			text = "Table de craft";
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 27.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class TitreSurTable: Life_RscTitle
		{
			idc = -1;
			text = "Mes objets posé sur la table :";
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class MoiListe: Life_RscListBox
		{
			idc = 156533;
			sizeEx = 0.035;
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 20.5 * GUI_GRID_H;
		};
		class TableListe: Life_RscListBox
		{
			idc = 156534;
			sizeEx = 0.035;
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 20.5 * GUI_GRID_H;
		};
		class PutBtn: Life_RscButtonMenu
		{
			idc = 156535;
			text = "Poser";
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class TakeBtn: Life_RscButtonMenu
		{		
			idc = 156536;
			text = "Prendre";
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class CrafterButtonKey: Life_RscButtonMenu
		{
			idc = 156537;
			text = "Cafter";
			sizeEx = 0.02;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 28.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class CloseButtonKey: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			text = "Fermer";
			sizeEx = 0.035;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 28.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};
