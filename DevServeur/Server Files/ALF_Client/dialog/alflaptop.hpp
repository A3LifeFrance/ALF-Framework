class ALF_Laptop_Dialog {
	idd = 11500;
	name= "ALF_Laptop_Dialog";
	movingEnable = true;
	enableSimulation = true;
	class controlsBackground {
		class livreta: Life_RscPicture {
			idc = -1;
			text = "\ALF_Client2\textures\Gendarmerie\laptop.paa";
			x = 0.144219 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.690938 * safezoneW;
			h = 1.177 * safezoneH;
		};
	};

	class controls {
		class list: Life_RscListBox {
			idc = 11501;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.045;
			style = 0;
			shadow = 0;
			onLBSelChanged = "[] call ALF_fnc_lbChangedLaptop;";
			x = 0.258333 * safezoneW + safezoneX;
			y = 0.37037 * safezoneH + safezoneY;
			w = 0.225104 * safezoneW;
			h = 0.305926 * safezoneH;
		};
		class texte: Life_RscStructuredText {
			idc = 11502;
			text = "";
			x = 0.572917 * safezoneW + safezoneX;
			y = 0.412963 * safezoneH + safezoneY;
			w = 0.146979 * safezoneW;
			h = 0.365185 * safezoneH;
		};
	};
};
