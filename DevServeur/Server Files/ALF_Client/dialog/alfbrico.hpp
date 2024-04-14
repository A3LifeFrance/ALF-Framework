class ALF_BRICO_Dialog {
	idd = 13000;
	name= "ALF_BRICO_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class BricoMenu: Life_RscPicture {
			text = "\ALF_Client2\textures\Brico\actionbrico.paa";
			idc = -1;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.836 * safezoneH;
		};
	};

	class controls {
		class BricoList: Life_RscListBox {
			idc = 13001;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			x = 0.371354 * safezoneW + safezoneX;
			y = 0.435185 * safezoneH + safezoneY;
			w = 0.250625 * safezoneW;
			h = 0.146667 * safezoneH;
		};
		class Btn: Life_RscButtonInvisible {
			idc = 13002;
			text = "";
			x = 0.433854 * safezoneW + safezoneX;
			y = 0.606482 * safezoneH + safezoneY;
			w = 0.11625 * safezoneW;
			h = 0.0161115 * safezoneH;
		};
	};
};

class ALF_QBRICO_Dialog {
	idd = 12000;
	name= "ALF_QBRICO_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class BricoMenu: Life_RscPicture {
			text = "\ALF_Client2\textures\Brico\question.paa";
			idc = -1;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.836 * safezoneH;
		};
	};

	class controls {
		class BricoList: Life_RscListBox {
			idc = 12001;
			text = "";
			sizeEx = 0.03;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			x = 0.371354 * safezoneW + safezoneX;
			y = 0.435185 * safezoneH + safezoneY;
			w = 0.250625 * safezoneW;
			h = 0.146667 * safezoneH;
		};
	};
};
