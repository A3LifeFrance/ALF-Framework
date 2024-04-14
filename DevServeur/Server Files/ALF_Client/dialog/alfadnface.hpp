class ALF_ADN_Dialog {
	idd = 12500;
	name= "ALF_ADN_Dialog";
	movingEnable = true;
	enableSimulation = true;
	class controlsBackground {
		class livreta: Life_RscPicture {
			idc = -1;
			text = "\ALF_Client2\textures\Gendarmerie\adn.paa";
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};

	class controls {
		class codeadn: Life_RscEdit {
			idc = 12501;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.297917 * safezoneW + safezoneX;
			y = 0.535185 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class result: Life_RscStructuredText {
			idc = 12502;
			text = "";
			x = 0.297917 * safezoneW + safezoneX;
			y = 0.641667 * safezoneH + safezoneY;
			w = 0.143854 * safezoneW;
			h = 0.187407 * safezoneH;
		};
		class codeadn2: Life_RscEdit {
			idc = 12503;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.55625 * safezoneW + safezoneX;
			y = 0.535185 * safezoneH + safezoneY;
			w = 0.144896 * safezoneW;
			h = 0.0318518 * safezoneH;
		};
		class info: Life_RscEdit {
			idc = 12504;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 16;
			shadow = 0;
			x = 0.55625 * safezoneW + safezoneX;
			y = 0.607407 * safezoneH + safezoneY;
			w = 0.144896 * safezoneW;
			h = 0.189259 * safezoneH;
		};
		class Bnt1: Life_RscButtonInvisible {
			idc = 12505;
			text = "";
			x = 0.427604 * safezoneW + safezoneX;
			y = 0.572222 * safezoneH + safezoneY;
			w = 0.0152085 * safezoneW;
			h = 0.0170369 * safezoneH;
		};
		class Bnt2: Life_RscButtonInvisible {
			idc = 12506;
			text = "";
			x = 0.55625 * safezoneW + safezoneX;
			y = 0.809259 * safezoneH + safezoneY;
			w = 0.144896 * safezoneW;
			h = 0.0216665 * safezoneH;
		};
	};
};

class ALF_FACE_Dialog {
	idd = 13500;
	name= "ALF_FACE_Dialog";
	movingEnable = true;
	enableSimulation = true;
	class controlsBackground {
		class livreta: Life_RscPicture {
			idc = -1;
			text = "\ALF_Client2\textures\Gendarmerie\face.paa";
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};

	class controls {
		class codeface: Life_RscEdit {
			idc = 13501;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.297917 * safezoneW + safezoneX;
			y = 0.535185 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class result: Life_RscStructuredText {
			idc = 13502;
			text = "";
			x = 0.297917 * safezoneW + safezoneX;
			y = 0.641667 * safezoneH + safezoneY;
			w = 0.143854 * safezoneW;
			h = 0.187407 * safezoneH;
		};
		class codeface2: Life_RscEdit {
			idc = 13503;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.55625 * safezoneW + safezoneX;
			y = 0.535185 * safezoneH + safezoneY;
			w = 0.144896 * safezoneW;
			h = 0.0318518 * safezoneH;
		};
		class info: Life_RscEdit {
			idc = 13504;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 16;
			shadow = 0;
			x = 0.55625 * safezoneW + safezoneX;
			y = 0.607407 * safezoneH + safezoneY;
			w = 0.144896 * safezoneW;
			h = 0.189259 * safezoneH;
		};
		class Bnt1: Life_RscButtonInvisible {
			idc = 13505;
			text = "";
			x = 0.427604 * safezoneW + safezoneX;
			y = 0.572222 * safezoneH + safezoneY;
			w = 0.0152085 * safezoneW;
			h = 0.0170369 * safezoneH;
		};
		class Bnt2: Life_RscButtonInvisible {
			idc = 13506;
			text = "";
			x = 0.55625 * safezoneW + safezoneX;
			y = 0.809259 * safezoneH + safezoneY;
			w = 0.144896 * safezoneW;
			h = 0.0216665 * safezoneH;
		};
	};
};
