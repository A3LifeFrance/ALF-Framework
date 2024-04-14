class ALF_Business_Dialog {
	idd = 29500;
	name= "ALF_Business_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class mailbox: Life_RscPicture {
			text = "\ALF_Client2\textures\Business\menu.paa";
			idc = -1;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};
	class controls {
		class name : Life_RscStructuredText {
			idc = 29501;
			text = "";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.407344 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class siret : Life_RscStructuredText {
			idc = 29502;
			text = "";
			x = 0.412813 * safezoneW + safezoneX;
			y = 0.369445 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class capital : Life_RscStructuredText {
			idc = 29503;
			text = "";
			x = 0.257812 * safezoneW + safezoneX;
			y = 0.493519 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class level : Life_RscStructuredText {
			idc = 29504;
			text = "";
			x = 0.307292 * safezoneW + safezoneX;
			y = 0.636112 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class secusocial : Life_RscEdit {
			idc = 29505;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.045;
			style = 0;
			shadow = 0;
			x = 0.424479 * safezoneW + safezoneX;
			y = 0.522223 * safezoneH + safezoneY;
			w = 0.134479 * safezoneW;
			h = 0.0191115 * safezoneH;
		};
		class maillist : Life_RscListBox {
			idc = 29506;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			x = 0.580208 * safezoneW + safezoneX;
			y = 0.502778 * safezoneH + safezoneY;
			w = 0.160521 * safezoneW;
			h = 0.250593 * safezoneH;
		};
		class agrandir : Life_RscButtonInvisible {
			idc = 29507;
			text = "";
			x = 0.257292 * safezoneW + safezoneX;
			y = 0.688889 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class recruter : Life_RscButtonInvisible {
			idc = 29508;
			text = "";
			x = 0.424479 * safezoneW + safezoneX;
			y = 0.549074 * safezoneH + safezoneY;
			w = 0.0501039 * safezoneW;
			h = 0.0135559 * safezoneH;
		};
		class payer : Life_RscButtonInvisible {
			idc = 29509;
			text = "";
			x = 0.580729 * safezoneW + safezoneX;
			y = 0.785185 * safezoneH + safezoneY;
			w = 0.063125 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		class virer : Life_RscButtonInvisible {
			idc = 29510;
			text = "";
			x = 0.676042 * safezoneW + safezoneX;
			y = 0.762037 * safezoneH + safezoneY;
			w = 0.0646873 * safezoneW;
			h = 0.0191115 * safezoneH;
		};
		class fondedit : Life_RscEdit {
			idc = 29511;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.045;
			style = 0;
			shadow = 0;
			x = 0.42526 * safezoneW + safezoneX;
			y = 0.61737 * safezoneH + safezoneY;
			w = 0.100625 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		class deposer : Life_RscButtonInvisible {
			idc = 29512;
			text = "";
			x = 0.425 * safezoneW + safezoneX;
			y = 0.642593 * safezoneH + safezoneY;
			w = 0.0501042 * safezoneW;
			h = 0.0191115 * safezoneH;
		};
		class nameedit : Life_RscEdit {
			idc = 29513;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.045;
			style = 0;
			shadow = 0;
			x = 0.424479 * safezoneW + safezoneX;
			y = 0.482407 * safezoneH + safezoneY;
			w = 0.133437 * safezoneW;
			h = 0.020740 * safezoneH;
		};
		class payeedit : Life_RscEdit {
			idc = 29514;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.045;
			style = 0;
			shadow = 0;
			x = 0.580729 * safezoneW + safezoneX;
			y = 0.762037 * safezoneH + safezoneY;
			w = 0.063125 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
	};
};
