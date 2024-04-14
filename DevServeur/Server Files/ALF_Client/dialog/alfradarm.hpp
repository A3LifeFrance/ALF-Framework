class ALF_RadarM_Dialog {
	idd = 18550;
	name= "ALF_RadarM_Dialog";
	movingEnable = false;
	enableSimulation = false;
	class controlsBackground {};

	class controls {
		class RadarM1 : Life_RscPicture {
			idc = 18551;
			text = "\ALF_Client2\textures\Gendarmerie\RadarM1.paa";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.572 * safezoneH;
		};
		class RadarMSpeedLimit : Life_RscEdit {
			idc = 18552;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.465625 * safezoneW + safezoneX;
			y = 0.461111 * safezoneH + safezoneY;
			w = 0.0771875 * safezoneW;
			h = 0.0438889 * safezoneH;
		};
		class RadarMAmende : Life_RscEdit {
			idc = 18553;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			onKeyDown = "[] call ALF_fnc_updateRadarM;";
			x = 0.465625 * safezoneW + safezoneX;
			y = 0.54537 * safezoneH + safezoneY;
			w = 0.0771875 * safezoneW;
			h = 0.0438889 * safezoneH;
		};
		class RadarMText1 : Life_RscStructuredText {
			idc = 18554;
			text = "";
			x = 0.483854 * safezoneW + safezoneX;
			y = 0.62037 * safezoneH + safezoneY;
			w = 0.0959375 * safezoneW;
			h = 0.0179629 * safezoneH;
		};
		class RadarMText2 : Life_RscStructuredText {
			idc = 18555;
			text = "";
			x = 0.483854 * safezoneW + safezoneX;
			y = 0.639815 * safezoneH + safezoneY;
			w = 0.0959375 * safezoneW;
			h = 0.0179629 * safezoneH;
		};
		class RadarMBtnAct: Life_RscButtonInvisible {
			idc = 18556;
			text = "";
			x = 0.514584 * safezoneW + safezoneX;
			y = 0.696297 * safezoneH + safezoneY;
			w = 0.0490625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RadarM2 : Life_RscPicture {
			idc = 18557;
			text = "\ALF_Client2\textures\Gendarmerie\RadarM2.paa";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.572 * safezoneH;
		};
		class RadarMlb : Life_RscListBox {
			idc = 18558;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			x = 0.358333 * safezoneW + safezoneX;
			y = 0.42963 * safezoneH + safezoneY;
			w = 0.290208 * safezoneW;
			h = 0.254074 * safezoneH;
		};
		class RadarMBtnReset: Life_RscButtonInvisible {
			idc = 18559;
			text = "";
			x = 0.486458 * safezoneW + safezoneX;
			y = 0.685185 * safezoneH + safezoneY;
			w = 0.0261458 * safezoneW;
			h = 0.0392592 * safezoneH;
		};
	};
};