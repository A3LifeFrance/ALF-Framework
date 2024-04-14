class ALF_CNG {
	idd = 16500;
	name= "ALF_CNG";
	onLoad = "uiNamespace setVariable ['cngmenu',0]";
	movingEnable = true;
	enableSimulation = true;
	class controlsBackground {
	};

	class controls {
		class menu1: Life_RscPicture {
			idc = 16501;
			text = "\ALF_Client2\textures\Gendarmerie\cng.paa";
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class argent: Life_RscStructuredText {
			idc = 16502;
			text = "";
			x = 0.368229 * safezoneW + safezoneX;
			y = 0.462963 * safezoneH + safezoneY;
			w = 0.2725 * safezoneW;
			h = 0.0725927 * safezoneH;
		};
		class numedit: Life_RscEdit {
			idc = 16503;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.429688 * safezoneW + safezoneX;
			y = 0.719444 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.032778 * safezoneH;
		};
		class Bntretirer: Life_RscButtonInvisible {
			idc = 16504;
			text = "";
			x = 0.429688 * safezoneW + safezoneX;
			y = 0.762037 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0235188 * safezoneH;
		};
		class Bntacc: Life_RscButtonInvisible {
			idc = 16505;
			text = "";
			x = 0.367708 * safezoneW + safezoneX;
			y = 0.394444 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.017963 * safezoneH;
		};
		class Bntlist: Life_RscButtonInvisible {
			idc = 16506;
			text = "";
			x = 0.391146 * safezoneW + safezoneX;
			y = 0.394445 * safezoneH + safezoneY;
			w = 0.0589583 * safezoneW;
			h = 0.0170371 * safezoneH;
		};
		class menu2: Life_RscPicture {
			idc = 16507;
			text = "\ALF_Client2\textures\Gendarmerie\cng2.paa";
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class cnglist : Life_RscListBox {
			idc = 16508;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			x = 0.372916 * safezoneW + safezoneX;
			y = 0.475926 * safezoneH + safezoneY;
			w = 0.263125 * safezoneW;
			h = 0.328148 * safezoneH;
		};
		class BntDeposer: Life_RscButtonInvisible {
			idc = 16509;
			text = "";
			x = 0.429688 * safezoneW + safezoneX;
			y = 0.792630 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0235188 * safezoneH;
		};
	};
};

class ALF_CNP {
	idd = 17500;
	name= "ALF_CNP";
	onLoad = "uiNamespace setVariable ['cnpmenu',0]";
	movingEnable = true;
	enableSimulation = true;
	class controlsBackground {
	};

	class controls {
		class menu1: Life_RscPicture {
			idc = 17501;
			text = "\ALF_Client2\textures\Gendarmerie\cnp.paa";
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class argent: Life_RscStructuredText {
			idc = 17502;
			text = "";
			x = 0.368229 * safezoneW + safezoneX;
			y = 0.462963 * safezoneH + safezoneY;
			w = 0.2725 * safezoneW;
			h = 0.0725927 * safezoneH;
		};
		class numedit: Life_RscEdit {
			idc = 17503;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.429688 * safezoneW + safezoneX;
			y = 0.719444 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.032778 * safezoneH;
		};
		class Bntretirer: Life_RscButtonInvisible {
			idc = 17504;
			text = "";
			x = 0.429688 * safezoneW + safezoneX;
			y = 0.762037 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0235188 * safezoneH;
		};
		class Bntacc: Life_RscButtonInvisible {
			idc = 17505;
			text = "";
			x = 0.367708 * safezoneW + safezoneX;
			y = 0.394444 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.017963 * safezoneH;
		};
		class Bntlist: Life_RscButtonInvisible {
			idc = 17506;
			text = "";
			x = 0.391146 * safezoneW + safezoneX;
			y = 0.394445 * safezoneH + safezoneY;
			w = 0.0589583 * safezoneW;
			h = 0.0170371 * safezoneH;
		};
		class menu2: Life_RscPicture {
			idc = 17507;
			text = "\ALF_Client2\textures\Gendarmerie\cnp2.paa";
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class cnglist : Life_RscListBox {
			idc = 17508;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			x = 0.372916 * safezoneW + safezoneX;
			y = 0.475926 * safezoneH + safezoneY;
			w = 0.263125 * safezoneW;
			h = 0.328148 * safezoneH;
		};
		class BntDeposer: Life_RscButtonInvisible {
			idc = 17509;
			text = "";
			x = 0.429688 * safezoneW + safezoneX;
			y = 0.792630 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0235188 * safezoneH;
		};
	};
};
