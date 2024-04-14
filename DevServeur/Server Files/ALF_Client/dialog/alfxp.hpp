class xpmenu {
	idd = 98765;
	name= "xpmenu";
	onLoad = "";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class FondMenu: Life_RscPicture {
			idc = -1;
			text = "\ALF_Client2\textures\XP\fondmenu.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
	};
	class controls {
		class FondRecolte: Life_RscPicture {
			idc = 98760;
			text = "\ALF_Client2\textures\XP\menurécolte1.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class FondMinage: Life_RscPicture {
			idc = 98761;
			text = "\ALF_Client2\textures\XP\menuminage1.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class FondPeche: Life_RscPicture {
			idc = 98762;
			text = "\ALF_Client2\textures\XP\menupêche1.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class FondIllegal: Life_RscPicture {
			idc = 98763;
			text = "\ALF_Client2\textures\XP\menuillégale1.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};

		class BTN_Recolte: Life_RscButtonInvisible {
			idc = 98764;
			text = "";
			onButtonClick = "uiNamespace setVariable ['xpmenu',0]; [] call ALF_fnc_menuXP;";
			x = 0.341188 * safezoneW + safezoneX;
			y = 0.1986 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class BTN_Minage: Life_RscButtonInvisible {
			idc = 98765;
			text = "";
			onButtonClick = "uiNamespace setVariable ['xpmenu',1]; [] call ALF_fnc_menuXP;";
			x = 0.420594 * safezoneW + safezoneX;
			y = 0.1986 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class BTN_Peche: Life_RscButtonInvisible {
			idc = 98766;
			text = "";
			onButtonClick = "uiNamespace setVariable ['xpmenu',2]; [] call ALF_fnc_menuXP;";
			x = 0.501012 * safezoneW + safezoneX;
			y = 0.1986 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class BTN_Illegal: Life_RscButtonInvisible {
			idc = 98767;
			text = "";
			onButtonClick = "uiNamespace setVariable ['xpmenu',3]; [] call ALF_fnc_menuXP;";
			x = 0.581468 * safezoneW + safezoneX;
			y = 0.1986 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class TXT_Xp: Life_RscStructuredText {
			idc = 98768;
			text = "";
			x = 0.380375 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class XP1: Life_RscPicture {
			idc = 98769;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP2: Life_RscPicture {
			idc = 98770;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP3: Life_RscPicture {
			idc = 98771;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP4: Life_RscPicture {
			idc = 98772;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP5: Life_RscPicture {
			idc = 98773;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP6: Life_RscPicture {
			idc = 98774;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP7: Life_RscPicture {
			idc = 98775;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP8: Life_RscPicture {
			idc = 98776;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP9: Life_RscPicture {
			idc = 98777;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
		class XP10: Life_RscPicture {
			idc = 98778;
			text = "";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.759 * safezoneH;
		};
	};
};