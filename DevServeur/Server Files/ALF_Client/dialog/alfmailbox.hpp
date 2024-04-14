class ALF_MailBox_Dialog {
	idd = 25500;
	name= "ALF_MailBox_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class mailbox: Life_RscPicture {
			text = "\ALF_Client2\textures\mailbox\mailbox.paa";
			idc = -1;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.869 * safezoneH;
		};
	};
	class controls {
		class yes: Life_RscPicture {
			text = "\ALF_Client2\textures\mailbox\yes.paa";
			idc = 25501;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.869 * safezoneH;
		};
		class no: Life_RscPicture {
			text = "\ALF_Client2\textures\mailbox\no.paa";
			idc = 25502;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.869 * safezoneH;
		};
		class maillist : Life_RscListBox {
			idc = 25503;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			x = 0.379323 * safezoneW + safezoneX;
			y = 0.421148 * safezoneH + safezoneY;
			w = 0.114167 * safezoneW;
			h = 0.0948148 * safezoneH;
		};
		class mailedit : Life_RscEdit {
			idc = 25504;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.41927 * safezoneW + safezoneX;
			y = 0.531481 * safezoneH + safezoneY;
			w = 0.0381253 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class mailbtn : Life_RscButtonInvisible {
			idc = 25505;
			text = "";
			x = 0.375521 * safezoneW + safezoneX;
			y = 0.566666 * safezoneH + safezoneY;
			w = 0.082917 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
	};
};

class ALF_Cop_Fouille {
	idd = 69697;
	name= "ALF_Cop_Fouille";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class pic: Life_RscPicture {
			text = "\ALF_Client2\textures\mailbox\fouilleanal.paa";
			idc = -1;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.869 * safezoneH;
		};
	};
	class controls {
		class list : Life_RscListBox {
			idc = 6969778;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.03;
			x = 0.396354 * safezoneW + safezoneX;
			y = 0.344444 * safezoneH + safezoneY;
			w = 0.166771 * safezoneW;
			h = 0.372593 * safezoneH;
		};
		class btn : Life_RscButtonInvisible {
			idc = 6969779;
			text = "";
			x = 0.569271 * safezoneW + safezoneX;
			y = 0.571296 * safezoneH + safezoneY;
			w = 0.0501043 * safezoneW;
			h = 0.0216671 * safezoneH;
		};
	};
};

class ALF_Blue_Print {
	idd = 1125;
	name= "ALF_Blue_Print";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class pic: Life_RscPicture {
			text = "\ALF_Client2\textures\mailbox\blue_print.paa";
			idc = -1;
			x = 0.0565625 * safezoneW + safezoneX;
			y = -0.303 * safezoneH + safezoneY;
			w = 0.892031 * safezoneW;
			h = 1.639 * safezoneH;
		};
	};
	class controls {};
};

class ALF_Parchemin_Ouvert {
	idd = 65789;
	name= "ALF_Parchemin_Ouvert";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class pic: Life_RscPicture {
			text = "\ALF_Halloween_2019\ALF_Parchemin\cartejerry.paa";
			idc = -1;
			x = 0.0565625 * safezoneW + safezoneX;
			y = -0.303 * safezoneH + safezoneY;
			w = 0.892031 * safezoneW;
			h = 1.639 * safezoneH;
		};
	};
	class controls {};
};
