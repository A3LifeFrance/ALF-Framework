class ALF_DabMenu_Dialog {
	idd = 10520;
	name= "ALF_DabMenu_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
	};

	class controls {
		class livreta: Life_RscPicture {
			idc = 10521;
			text = "\ALF_Client2\textures\Dab\a.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.902 * safezoneH;
		};
		class livretb: Life_RscPicture {
			idc = 10522;
			text = "\ALF_Client2\textures\Dab\b.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.902 * safezoneH;
		};
		class livretc: Life_RscPicture {
			idc = 10523;
			text = "\ALF_Client2\textures\Dab\c.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.902 * safezoneH;
		};
		class solde : Life_RscStructuredText {
			idc = 10524;
			text = "";
			x = 0.373437 * safezoneW + safezoneX;
			y = 0.548148 * safezoneH + safezoneY;
			w = 0.108437 * safezoneW;
			h = 0.0401851 * safezoneH;
		};
		class cash : Life_RscStructuredText {
			idc = 10525;
			text = "";
			x = 0.538542 * safezoneW + safezoneX;
			y = 0.548148 * safezoneH + safezoneY;
			w = 0.108437 * safezoneW;
			h = 0.0401851 * safezoneH;
		};
		class dabedit : Life_RscEdit {
			idc = 10526;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			style=ST_CENTER;
			shadow = 0;
			x = 0.373438 * safezoneW + safezoneX;
			y = 0.665741 * safezoneH + safezoneY;
			w = 0.10843 * safezoneW;
			h = 0.0401851 * safezoneH;
		};
		class retirer: Life_RscButtonInvisible {
			idc = 10527;
			x = 0.620313 * safezoneW + safezoneX;
			y = 0.653703 * safezoneH + safezoneY;
			w = 0.0938537 * safezoneW;
			h = 0.0596297 * safezoneH;
		};
		class deposer: Life_RscButtonInvisible {
			idc = 10528;
			x = 0.61875 * safezoneW + safezoneX;
			y = 0.726852 * safezoneH + safezoneY;
			w = 0.0938537 * safezoneW;
			h = 0.0596297 * safezoneH;
		};

	};
};
