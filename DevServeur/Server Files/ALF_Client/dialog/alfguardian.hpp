class ALF_GUARDIAN_Dialog {
	idd = 18000;
	name= "ALF_GUARDIAN_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class GuardianMenu: Life_RscPicture {
			text = "\ALF_Client2\textures\Guardian\guardian.paa";
			idc = -1;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.562031 * safezoneW;
			h = 0.88 * safezoneH;
		};
	};
	class controls {
		class BpmTxt: Life_RscStructuredText
		{
			idc = 18001;
			text = "";
			sizeEx = 0.035;
			style = 18;
			x = 0.592813 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class mmHgTxt1: Life_RscStructuredText
		{
			idc = 18002;
			text = "";
			sizeEx = 0.035;
			style = 18;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class mmHgTxt2: Life_RscStructuredText
		{
			idc = 18003;
			text = "";
			sizeEx = 0.035;
			style = 18;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class spo2Txt: Life_RscStructuredText
		{
			idc = 18004;
			text = "";
			sizeEx = 0.035;
			style = 18;
			x = 0.592813 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class respTxt: Life_RscStructuredText
		{
			idc = 18005;
			text = "";
			sizeEx = 0.035;
			style = 18;
			x = 0.592813 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn1: Life_RscButtonMenu {
			idc = 18006;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.13 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.0266295 * safezoneH;
		};
		class btn2: Life_RscButtonMenu {
			idc = 18007;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.321457 * safezoneW + safezoneX;
			y = 0.808926 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.0266295 * safezoneH;
		};
		class btn3: Life_RscButtonMenu {
			idc = 18008;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.321457 * safezoneW + safezoneX;
			y = 0.84074 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.0266295 * safezoneH;
		};
		class btn4: Life_RscButtonMenu {
			idc = 18009;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.321457 * safezoneW + safezoneX;
			y = 0.872223 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.0266295 * safezoneH;
		};
		class btn5: Life_RscButtonMenu {
			idc = 18010;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.510416 * safezoneW + safezoneX;
			y = 0.809852 * safezoneH + safezoneY;
			w = 0.140624 * safezoneW;
			h = 0.0257036 * safezoneH;
		};
		class btn6: Life_RscButtonMenu {
			idc = 18011;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.510416 * safezoneW + safezoneX;
			y = 0.840741 * safezoneH + safezoneY;
			w = 0.140624 * safezoneW;
			h = 0.0257036 * safezoneH;
		};
		class btn7: Life_RscButtonMenu {
			idc = 18012;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.510416 * safezoneW + safezoneX;
			y = 0.872222 * safezoneH + safezoneY;
			w = 0.140624 * safezoneW;
			h = 0.0257036 * safezoneH;
		};
		class edit1: Life_RscEdit {
			idc = 18013;
			text = "0";
			x = 0.659375 * safezoneW + safezoneX;
			y = 0.840999 * safezoneH + safezoneY;
			w = 0.0386458 * safezoneW;
			h = 0.0265185 * safezoneH;
		};
		class btn8: Life_RscButtonMenu {
			idc = 18014;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.0266295 * safezoneH;
		};
	};
};
