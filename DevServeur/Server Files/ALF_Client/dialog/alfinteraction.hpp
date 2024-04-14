class interactionSystem {
	idd = 25799;
	name= "interactionSystem";
	onLoad = "uiNamespace setVariable ['interactPlayer',0]";
	movingEnable = false;
	enableSimulation = false;
	class controlsBackground {};
	class controls {
		class pic1 : Life_RscPicture {
			idc = 25800;
			text = "\ALF_Client2\textures\Interaction\p_i_1.paa";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.594 * safezoneH;
		};
		class pic2 : Life_RscPicture {
			idc = 25801;
			text = "\ALF_Client2\textures\Interaction\p_i_2.paa";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.594 * safezoneH;
		};
		class btn1: Life_RscButtonMenu {
			idc = 25802;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.335 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn2: Life_RscButtonMenu {
			idc = 25803;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.335 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn3: Life_RscButtonMenu {
			idc = 25804;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.335 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn4: Life_RscButtonMenu {
			idc = 25805;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.335 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn5: Life_RscButtonMenu {
			idc = 25806;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.335 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn6: Life_RscButtonMenu {
			idc = 25807;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.335 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn7: Life_RscButtonMenu {
			idc = 25808;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn8: Life_RscButtonMenu {
			idc = 25809;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn9: Life_RscButtonMenu {
			idc = 25810;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn10: Life_RscButtonMenu {
			idc = 25811;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn11: Life_RscButtonMenu {
			idc = 25812;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn12: Life_RscButtonMenu {
			idc = 25813;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btnmenu: Life_RscButtonInvisible {
			idc = 25814;
			x = 0.663437 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0211979 * safezoneW;
			h = 0.0392592 * safezoneH;
		};
	};
};
