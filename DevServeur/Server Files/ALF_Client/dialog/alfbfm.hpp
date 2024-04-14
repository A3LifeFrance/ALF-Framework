class bfm_dialog {
	idd = 5456;
	name= "bfm_dialog";
	movingEnable = true;
	enableSimulation = true;
	class controlsBackground {
	};

	class controls {
		class menu: Life_RscPicture {
			idc = -1;
			text = "\ALF_Client2\textures\BFM\bfm.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.427969 * safezoneW;
			h = 0.814 * safezoneH;
		};
		class namedit: Life_RscEdit {
			idc = 5457;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.414375 * safezoneW + safezoneX;
			y = 0.377037 * safezoneH + safezoneY;
			w = 0.221979 * safezoneW;
			h = 0.0290741 * safezoneH;
		};
		class bfmcb : Life_Checkbox {
			idc = 5458;
			color[] = {0,0,0,1};
   			colorDisabled[] = {0,0,0,1};
   			colorText[] = {0,0,0,1};
   			colorTextSelect[] = {0,0,0,1};
   			colorPressed[] = {0,0,0,1};
   			colorHover[] = {0,0,0,1};
   			colorFocused[] = {0,0,0,1};
   			colorBackground[] = {0,0,0,0};
   			colorBackgroundDisabled[] = {0,0,0,0};
   			colorBackgroundPressed[] = {0,0,0,0};
   			colorBackgroundHover[]= {0,0,0,0};
   			colorBackgroundFocused[]= {0,0,0,0};
			x = 0.528124 * safezoneW + safezoneX;
			y = 0.417593 * safezoneH + safezoneY;
			w = 0.012604 * safezoneW;
			h = 0.0225926 * safezoneH;
		};
		class txtedit: Life_RscEdit {
			idc = 5459;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			onKeyUP = "[] call ALF_fnc_bfmCaracteres;";
			sizeEx = 0.05;
			style = 16;
			shadow = 0;
			x = 0.382291 * safezoneW + safezoneX;
			y = 0.448149 * safezoneH + safezoneY;
			w = 0.254271 * safezoneW;
			h = 0.283704 * safezoneH;
		};
		class Btn: Life_RscButtonMenu {
			idc = 5460;
			text = "PUBLIER";
			x = 0.454687 * safezoneW + safezoneX;
			y = 0.744444 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.0216667 * safezoneH;
		};
	};
};
