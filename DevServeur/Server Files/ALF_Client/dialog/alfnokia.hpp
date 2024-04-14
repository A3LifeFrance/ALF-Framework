class ALF_NokiaMenu_Dialog {
	idd = 20000;
	name= "ALF_NokiaMenu_Dialog";
	onLoad = "uiNamespace setVariable ['nokiamenu',0]";
	movingEnable = false;
	enableSimulation = false;
	class controlsBackground {};

	class controls {
		class menu1sim : Life_RscPicture {
			idc = 200011;
			text = "\ALF_Client2\textures\Nokia\nokia_1.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menu1nosim : Life_RscPicture {
			idc = 200012;
			text = "\ALF_Client2\textures\Nokia\nokia_2.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menu1incall : Life_RscPicture {
			idc = 200013;
			text = "\ALF_Client2\textures\Nokia\nokia_5.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menu1ring : Life_RscPicture {
			idc = 200014;
			text = "\ALF_Client2\textures\Nokia\nokia_4.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menu1try : Life_RscPicture {
			idc = 200015;
			text = "\ALF_Client2\textures\Nokia\nokia_9.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menu1phone : Life_RscPicture {
			idc = 200016;
			text = "\ALF_Client2\textures\Nokia\nokia_10.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class datenokia : Life_RscStructuredText {
			idc = 20001;
			text = "";
			x = 0.732813 * safezoneW + safezoneX;
			y = 0.651222 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class menu1smsbtn : Life_RscButtonInvisible {
			idc = 20002;
			text = "";
			onButtonClick = "uiNamespace setVariable ['nokiamenu',2]; [] call ALF_fnc_menuNokia;";
			x = 0.644792 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.0174815 * safezoneH;
		};
		class menu1contactsbtn : Life_RscButtonInvisible {
			idc = 20003;
			text = "";
			onButtonClick = "uiNamespace setVariable ['nokiamenu',1]; [] call ALF_fnc_menuNokia;";
			x = 0.644792 * safezoneW + safezoneX;
			y = 0.755556 * safezoneH + safezoneY;
			w = 0.0731249 * safezoneW;
			h = 0.0184074 * safezoneH;
		};
		class menu1telephonebtn : Life_RscButtonInvisible {
			idc = 200031;
			text = "";
			onButtonClick = "uiNamespace setVariable ['nokiamenu',3]; [] call ALF_fnc_menuNokia;";
			x = 0.644792 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0731249 * safezoneW;
			h = 0.0184074 * safezoneH;
		};
		class menu1name : Life_RscStructuredText {
			idc = 200041;
			text = "";
			font = "NokiaCellphoneFC";
			x = 0.648438 * safezoneW + safezoneX;
			y = 0.721296 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class menu1num : Life_RscStructuredText {
			idc = 200042;
			text = "";
			font = "NokiaCellphoneFC";
			x = 0.64849 * safezoneW + safezoneX;
			y = 0.746297 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class menu1Time : Life_RscStructuredText {
			idc = 200043;
			text = "";
			font = "NokiaCellphoneFC";
			x = 0.64849 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class menu1decrocher : Life_RscButtonInvisible {
			idc = 20004;
			text = "";
			x = 0.670834 * safezoneW + safezoneX;
			y = 0.85463 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class menu1refuser : Life_RscButtonInvisible {
			idc = 20005;
			text = "";
			x = 0.636979 * safezoneW + safezoneX;
			y = 0.876851 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class menu1raccrocher : Life_RscButtonInvisible {
			idc = 20006;
			text = "";
			x = 0.670834 * safezoneW + safezoneX;
			y = 0.85463 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class menu1quit : Life_RscButtonInvisible {
			idc = 200061;
			text = "";
			onButtonClick = "closeDialog 0;";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class menu1up : Life_RscButtonInvisible {
			idc = 200062;
			text = "";
			x = 0.742344 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class menu1down : Life_RscButtonInvisible {
			idc = 200063;
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class menu2pic : Life_RscPicture {
			idc = 20010;
			text = "\ALF_Client2\textures\Nokia\nokia_6.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menu2contactslist : Life_RscListBox {
			idc = 20011;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "NokiaCellphoneFC";
			sizeEx = 0.02;
			x = 0.647396 * safezoneW + safezoneX;
			y = 0.666666 * safezoneH + safezoneY;
			w = 0.116562 * safezoneW;
			h = 0.0870741 * safezoneH;
		};
		class menu2appeler : Life_RscButtonInvisible {
			idc = 20012;
			text = "";
			x = 0.646875 * safezoneW + safezoneX;
			y = 0.778704 * safezoneH + safezoneY;
			w = 0.0429166 * safezoneW;
			h = 0.0156295 * safezoneH;
		};
		class menu2sms : Life_RscButtonInvisible {
			idc = 20013;
			text = "";
			onButtonClick = "[] spawn ALF_fnc_smsContactNokia;";
			x = 0.646875 * safezoneW + safezoneX;
			y = 0.796296 * safezoneH + safezoneY;
			w = 0.0429166 * safezoneW;
			h = 0.0156295 * safezoneH;
		};
		class menu2supprimer : Life_RscButtonInvisible {
			idc = 20014;
			text = "";
			onButtonClick = "[] spawn ALF_fnc_deleteContactNokia;";
			x = 0.646875 * safezoneW + safezoneX;
			y = 0.758333 * safezoneH + safezoneY;
			w = 0.0392708 * safezoneW;
			h = 0.0147037 * safezoneH;
		};
		class menu2nameedit : Life_RscEdit {
			idc = 20015;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "NokiaCellphoneFC";
			sizeEx = 0.02;
			style = 0;
			lineSpacing = 0;
			shadow = 0;
			x = 0.710417 * safezoneW + safezoneX;
			y = 0.760185 * safezoneH + safezoneY;
			w = 0.0547917 * safezoneW;
			h = 0.0142592 * safezoneH;
		};
		class menu2numedit : Life_RscEdit {
			idc = 20016;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "NokiaCellphoneFC";
			sizeEx = 0.02;
			style = 0;
			lineSpacing = 0;
			shadow = 0;
			x = 0.710417 * safezoneW + safezoneX;
			y = 0.777778 * safezoneH + safezoneY;
			w = 0.0547917 * safezoneW;
			h = 0.0142592 * safezoneH;
		};
		class menu2ajouter : Life_RscButtonInvisible {
			idc = 20017;
			text = "";
			onButtonClick = "[] spawn ALF_fnc_addContactNokia;";
			x = 0.709896 * safezoneW + safezoneX;
			y = 0.793518 * safezoneH + safezoneY;
			w = 0.0340624 * safezoneW;
			h = 0.0165553 * safezoneH;
		};
		class menu2retour : Life_RscButtonInvisible {
			idc = 200171;
			text = "";
			onButtonClick = "uiNamespace setVariable ['nokiamenu',0]; [] call ALF_fnc_menuNokia;";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class menu3pic : Life_RscPicture {
			idc = 20018;
			text = "\ALF_Client2\textures\Nokia\nokia_8.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menu3smsname : Life_RscStructuredText {
			idc = 200181;
			text = "";
			font = "NokiaCellphoneFC";
			x = 0.706771 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.0606249 * safezoneW;
			h = 0.0128518 * safezoneH;
		};
		class menu3numedit : Life_RscEdit {
			idc = 200182;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "NokiaCellphoneFC";
			sizeEx = 0.025;
			style = 0;
			lineSpacing = 0;
			shadow = 0;
			x = 0.706771 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.0606249 * safezoneW;
			h = 0.0128518 * safezoneH;
		};
		class menu3smsedit : Life_RscEdit {
			idc = 20019;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "NokiaCellphoneFC";
			sizeEx = 0.025;
			style = 16;
			shadow = 0;
			x = 0.642188 * safezoneW + safezoneX;
			y = 0.695371 * safezoneH + safezoneY;
			w = 0.123542 * safezoneW;
			h = 0.092963 * safezoneH;
		};
		class menu3smsbtn : Life_RscButtonInvisible {
			idc = 20020;
			text = "";
			x = 0.728125 * safezoneW + safezoneX;
			y = 0.794444 * safezoneH + safezoneY;
			w = 0.035104 * safezoneW;
			h = 0.0137777 * safezoneH;
		};
		class menu3retour : Life_RscButtonInvisible {
			idc = 200201;
			text = "";
			onButtonClick = "uiNamespace setVariable ['nokiamenu',2]; [] call ALF_fnc_menuNokia;";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class menu4pic : Life_RscPicture {
			idc = 200211;
			text = "\ALF_Client2\textures\Nokia\nokia_7.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menu4smslist : Life_RscListBox {
			idc = 20021;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			shadow = 0;
			font = "NokiaCellphoneFC";
			sizeEx = 0.02;
			onLBSelChanged = "[] call ALF_fnc_lbChangedSmsNokia;";
			x = 0.640104 * safezoneW + safezoneX;
			y = 0.668518 * safezoneH + safezoneY;
			w = 0.0533333 * safezoneW;
			h = 0.0887777 * safezoneH;
		};
		class menu4smsview : Life_RscStructuredText {
			idc = 20022;
			text = "";
			x = 0.695312 * safezoneW + safezoneX;
			y = 0.668519 * safezoneH + safezoneY;
			w = 0.073125 * safezoneW;
			h = 0.0887777 * safezoneH;
		};
		class menu4repondre : Life_RscButtonInvisible {
			idc = 20023;
			text = "";
			x = 0.643229 * safezoneW + safezoneX;
			y = 0.766667 * safezoneH + safezoneY;
			w = 0.0507292 * safezoneW;
			h = 0.0174814 * safezoneH;
		};
		class menu4supprimer : Life_RscButtonInvisible {
			idc = 20024;
			text = "";
			x = 0.643229 * safezoneW + safezoneX;
			y = 0.785185 * safezoneH + safezoneY;
			w = 0.0507292 * safezoneW;
			h = 0.0174814 * safezoneH;
		};
		class menu4newsms : Life_RscButtonInvisible {
			idc = 20025;
			text = "";
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.766667 * safezoneH + safezoneY;
			w = 0.0507292 * safezoneW;
			h = 0.0174814 * safezoneH;
		};
		class menu4retour : Life_RscButtonInvisible {
			idc = 20026;
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class menurecent : Life_RscPicture {
			idc = 20027;
			text = "\ALF_Client2\textures\Nokia\nokia_11.paa";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class menunokiarecents : Life_RscListBox {
			idc = 20028;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			shadow = 0;
			font = "NokiaCellphoneFC";
			sizeEx = 0.02;
			x = 0.640625 * safezoneW + safezoneX;
			y = 0.668519 * safezoneH + safezoneY;
			w = 0.125625 * safezoneW;
			h = 0.0883333 * safezoneH;
		};
	};
};