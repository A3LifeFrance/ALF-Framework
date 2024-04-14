class ALF_GPlaque_Dialog {
	idd = 30560;
	name= "ALF_GPlaque_Dialog";
	onLoad = "uiNamespace setVariable ['gplaquemenu',0]";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {};

	class controls {

		class Menu1: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\export_menu1_plaque.paa";
			idc = 30561;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Menu2: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\export_menu2_plaque.paa";
			idc = 30562;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Menu3: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\export_menu3_plaque.paa";
			idc = 30563;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};

		class PlaqueEdit1: Life_RscEdit {
			idc = 30590;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.427291 * safezoneW + safezoneX;
			y = 0.602926 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.029074 * safezoneH;
		};
		class PlaqueEdit2: Life_RscEdit {
			idc = 30591;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.444791 * safezoneW + safezoneX;
			y = 0.602926 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.029074 * safezoneH;
		};
		class PlaqueEdit3: Life_RscEdit {
			idc = 30592;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.471864 * safezoneW + safezoneX;
			y = 0.602926 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.029074 * safezoneH;
		};
		class PlaqueEdit4: Life_RscEdit {
			idc = 30593;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.490604 * safezoneW + safezoneX;
			y = 0.602926 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.029074 * safezoneH;
		};
		class PlaqueEdit5: Life_RscEdit {
			idc = 30594;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.509354 * safezoneW + safezoneX;
			y = 0.602926 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.029074 * safezoneH;
		};
		class PlaqueEdit6: Life_RscEdit {
			idc = 30595;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.535948 * safezoneW + safezoneX;
			y = 0.602926 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.029074 * safezoneH;
		};
		class PlaqueEdit7: Life_RscEdit {
			idc = 30596;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.554167 * safezoneW + safezoneX;
			y = 0.602926 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.029074 * safezoneH;
		};

		class Texte1: Life_RscStructuredText
		{
			idc = 30567;
			text = "";
			x = 0.45052 * safezoneW + safezoneX;
			y = 0.50926 * safezoneH + safezoneY;
			w = 0.13552 * safezoneW;
			h = 0.0253704 * safezoneH;
		};
		class Texte2: Life_RscStructuredText
		{
			idc = 30568;
			text = "";
			x = 0.491719 * safezoneW + safezoneX;
			y = 0.534741 * safezoneH + safezoneY;
			w = 0.187084 * safezoneW;
			h = 0.0253704 * safezoneH;
		};
		class Texte3: Life_RscStructuredText
		{
			idc = 30569;
			text = "";
			x = 0.504688 * safezoneW + safezoneX;
			y = 0.561111 * safezoneH + safezoneY;
			w = 0.174063 * safezoneW;
			h = 0.0253704 * safezoneH;
		};
		class Texte4: Life_RscStructuredText
		{
			idc = 30570;
			text = "";
			x = 0.465104 * safezoneW + safezoneX;
			y = 0.588889 * safezoneH + safezoneY;
			w = 0.213646 * safezoneW;
			h = 0.0253704 * safezoneH;
		};

		class Bnt1: Life_RscButtonInvisible {
			idc = 30571;
			text = "";
			x = 0.575 * safezoneW + safezoneX;
			y = 0.710185 * safezoneH + safezoneY;
			w = 0.0792708 * safezoneW;
			h = 0.0531481 * safezoneH;
		};

		class Loading1: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_0.paa";
			idc = 30580;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Loading2: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_1.paa";
			idc = 30581;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Loading3: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_2.paa";
			idc = 30582;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Loading4: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_3.paa";
			idc = 30583;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Loading5: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_4.paa";
			idc = 30584;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Loading6: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_5.paa";
			idc = 30585;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Loading7: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_6.paa";
			idc = 30586;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Loading8: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_7.paa";
			idc = 30587;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class Loading9: Life_RscPicture {
			text = "\ALF_Client2\textures\Gendarmerie\Plaque\loading_8.paa";
			idc = 30588;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};
};
