class ALF_BankMenu_Dialog {
	idd = 21500;
	name= "ALF_BankMenu_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\icons\creditmut_bg.paa";
			idc = -1;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};

	class controls {

		class Texte: Life_RscStructuredText
		{
			idc = 21501;
			text = "";
			x = 0.446874 * safezoneW + safezoneX;
			y = 0.381481 * safezoneH + safezoneY;
			w = 0.191146 * safezoneW;
			h = 0.0247777 * safezoneH;
		};
		class livreta: Life_RscButtonInvisible {
			idc = 21505;
			text = "";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class piclivreta: Life_RscPicture {
			idc = 215051;
			text = "\ALF_Client2\icons\creditmut_livreta.paa";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class livretaa: Life_RscButtonInvisible {
			idc = 21502;
			text = "";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class piclivretaa: Life_RscPicture {
			idc = 215021;
			text = "\ALF_Client2\icons\creditmut_acces_livreta.paa";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class livretb: Life_RscButtonInvisible {
			idc = 21506;
			text = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class piclivretb: Life_RscPicture {
			idc = 215061;
			text = "\ALF_Client2\icons\creditmut_livretb.paa";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class livretbb: Life_RscButtonInvisible {
			idc = 21503;
			text = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class piclivretbb: Life_RscPicture {
			idc = 215031;
			text = "\ALF_Client2\icons\creditmut_acces_livretb.paa";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class livretc: Life_RscButtonInvisible {
			idc = 21507;
			text = "";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class piclivretc: Life_RscPicture {
			idc = 215071;
			text = "\ALF_Client2\icons\creditmut_livretc.paa";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class livretcc: Life_RscButtonInvisible {
			idc = 21504;
			text = "";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class piclivretcc: Life_RscPicture {
			idc = 215041;
			text = "\ALF_Client2\icons\creditmut_acces_livretc.paa";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class Texte2: Life_RscStructuredText
		{
			idc = 21508;
			text = "";
			x = 0.446875 * safezoneW + safezoneX;
			y = 0.347222 * safezoneH + safezoneY;
			w = 0.191146 * safezoneW;
			h = 0.0247777 * safezoneH;
		};
		class Texte3: Life_RscStructuredText
		{
			idc = 21509;
			text = "";
			x = 0.653229 * safezoneW + safezoneX;
			y = 0.382593 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.0247777 * safezoneH;
		};
	};
};

class ALF_BankAccess_Dialog {
	idd = 22500;
	name= "ALF_BankAccess_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\icons\creditmut_bg2.paa";
			idc = -1;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};

	class controls {

		class TexteType: Life_RscStructuredText
		{
			idc = 22501;
			text = "";
			x = 0.446875 * safezoneW + safezoneX;
			y = 0.347222 * safezoneH + safezoneY;
			w = 0.191146 * safezoneW;
			h = 0.0247777 * safezoneH;
		};
		class TexteType2: Life_RscStructuredText
		{
			idc = 225011;
			text = "";
			x = 0.446874 * safezoneW + safezoneX;
			y = 0.381481 * safezoneH + safezoneY;
			w = 0.191146 * safezoneW;
			h = 0.0247777 * safezoneH;
		};
		class SoldeLivret: Life_RscStructuredText
		{
			idc = 22502;
			text = "";
			colorText[] = {0,0,0,1};
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.485 * safezoneH + safezoneY;
			w = 0.116771 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class SoldeCash: Life_RscStructuredText
		{
			idc = 22503;
			text = "";
			colorText[] = {0,0,0,1};
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.565 * safezoneH + safezoneY;
			w = 0.116771 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class Retirer: Life_RscButtonInvisible {
			idc = 22504;
			text = "";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.101146 * safezoneW;
			h = 0.0392593 * safezoneH;
		};
		class Deposer: Life_RscButtonInvisible {
			idc = 22505;
			text = "";
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.101146 * safezoneW;
			h = 0.0392593 * safezoneH;
		};
		class picTransfertA: Life_RscPicture {
			idc = 225061;
			text = "\ALF_Client2\icons\creditmut_transfert_bc.paa";
			x = 0.496354 * safezoneW + safezoneX;
			y = 0.404704 * safezoneH + safezoneY;
			w = 0.289324 * safezoneW;
			h = 0.520704 * safezoneH;
		};
		class TransfertAB: Life_RscButtonInvisible {
			idc = 22506;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.616667 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class TransfertAC: Life_RscButtonInvisible {
			idc = 22507;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class picTransfertB: Life_RscPicture {
			idc = 225081;
			text = "\ALF_Client2\icons\creditmut_transfert_ac.paa";
			x = 0.496354 * safezoneW + safezoneX;
			y = 0.404704 * safezoneH + safezoneY;
			w = 0.289324 * safezoneW;
			h = 0.520704 * safezoneH;
		};
		class TransfertBA: Life_RscButtonInvisible {
			idc = 22508;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.616667 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class TransfertBC: Life_RscButtonInvisible {
			idc = 22509;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class picTransfertC: Life_RscPicture {
			idc = 225101;
			text = "\ALF_Client2\icons\creditmut_transfert_ab.paa";
			x = 0.496354 * safezoneW + safezoneX;
			y = 0.404704 * safezoneH + safezoneY;
			w = 0.289324 * safezoneW;
			h = 0.520704 * safezoneH;
		};
		class TransfertCA: Life_RscButtonInvisible {
			idc = 22510;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.616667 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class TransfertCB: Life_RscButtonInvisible {
			idc = 22511;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class TransfertExt: Life_RscButtonInvisible {
			idc = 22512;
			text = "";
			x = 0.302083 * safezoneW + safezoneX;
			y = 0.733333 * safezoneH + safezoneY;
			w = 0.101146 * safezoneW;
			h = 0.0392593 * safezoneH;
		};
		class NumberEdit: Life_RscEdit {
			idc = 22513;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.572917 * safezoneW + safezoneX;
			y = 0.488888 * safezoneH + safezoneY;
			w = 0.125625 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class NumberCompte: Life_RscEdit {
			idc = 22514;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.290104 * safezoneW + safezoneX;
			y = 0.697222 * safezoneH + safezoneY;
			w = 0.125625 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class Name: Life_RscStructuredText
		{
			idc = 22515;
			text = "";
			x = 0.653229 * safezoneW + safezoneX;
			y = 0.382593 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.0247777 * safezoneH;
		};
		class TexteActiveCb: Life_RscStructuredText
		{
			idc = 22516;
			text = "";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CBBtn: Life_RscButtonInvisible {
			idc = 22517;
			text = "";
			x = 0.663958 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
