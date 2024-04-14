class ALF_AXA_Dialog {
	idd = 14000;
	name= "ALF_AXA_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class AxaMenu: Life_RscPicture {
			text = "\ALF_Client2\textures\Orange\axa.paa";
			idc = -1;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};

	class controls {
		class ForfaitTexte1: Life_RscStructuredText
		{
			idc = 14001;
			text = "";
			style = 0;
			x = 0.668229 * safezoneW + safezoneX;
			y = 0.295185 * safezoneH + safezoneY;
			w = 0.0902083 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class Offre1: Life_RscButtonInvisible {
			idc = 14002;
			text = "";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.429 * safezoneH;
		};
		class Offre2: Life_RscButtonInvisible {
			idc = 14003;
			text = "";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.429 * safezoneH;
		};
		class Offre3: Life_RscButtonInvisible {
			idc = 14004;
			text = "";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.429 * safezoneH;
		};
		class Offre4: Life_RscButtonInvisible {
			idc = 14005;
			text = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.429 * safezoneH;
		};
		class LivretA: Life_RscButtonInvisible {
			idc = 14006;
			text = "";
			x = 0.611875 * safezoneW + safezoneX;
			y = 0.36163 * safezoneH + safezoneY;
			w = 0.0386458 * safezoneW;
			h = 0.017963 * safezoneH;
		};
		class LivretB: Life_RscButtonInvisible {
			idc = 14007;
			text = "";
			x = 0.655729 * safezoneW + safezoneX;
			y = 0.362037 * safezoneH + safezoneY;
			w = 0.0386458 * safezoneW;
			h = 0.017963 * safezoneH;
		};
		class LivretC: Life_RscButtonInvisible {
			idc = 14008;
			text = "";
			x = 0.698959 * safezoneW + safezoneX;
			y = 0.362037 * safezoneH + safezoneY;
			w = 0.0386458 * safezoneW;
			h = 0.017963 * safezoneH;
		};
		class Offre5: Life_RscButtonInvisible {
			idc = 14009;
			text = "";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.429 * safezoneH;
		};
	};
};
