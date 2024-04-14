class ALF_Internet_Dialog {
	idd = 24500;
	name= "ALF_Internet_Dialog";
	onLoad = "uiNamespace setVariable ['internetmenu',0]";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
	};
	class controls {
		class url: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\url.paa";
			idc = 24501;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class urledit : Life_RscEdit {
			idc = 24502;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.297396 * safezoneW + safezoneX;
			y = 0.52037 * safezoneH + safezoneY;
			w = 0.415208 * safezoneW;
			h = 0.0411111 * safezoneH;
		};
		class urlbtn : Life_RscButtonInvisible {
			idc = 24503;
			text = "";
			onButtonClick = "";
			x = 0.622395 * safezoneW + safezoneX;
			y = 0.569444 * safezoneH + safezoneY;
			w = 0.090208 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class knabis: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\knabis.paa";
			idc = 24504;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class knabisedit : Life_RscEdit {
			idc = 24505;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			onKeyDown = "[] call ALF_fnc_updateKnabis;";
			style = 0;
			shadow = 0;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.0308333 * safezoneW;
			h = 0.0207408 * safezoneH;
		};
		class knabistext : Life_RscStructuredText {
			idc = 24506;
			text = "";
			x = 0.363542 * safezoneW + safezoneX;
			y = 0.686111 * safezoneH + safezoneY;
			w = 0.0553125 * safezoneW;
			h = 0.0225927 * safezoneH;
		};
		class knabisbtn1 : Life_RscButtonInvisible {
			idc = 24507;
			text = "";
			onButtonClick = "";
			x = 0.363021 * safezoneW + safezoneX;
			y = 0.728704 * safezoneH + safezoneY;
			w = 0.0511458 * safezoneW;
			h = 0.0225927 * safezoneH;
		};
		class knabis2: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\knabis2.paa";
			idc = 24508;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class knabislist : Life_RscListBox {
			idc = 24509;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.045;
			x = 0.313021 * safezoneW + safezoneX;
			y = 0.512037 * safezoneH + safezoneY;
			w = 0.26 * safezoneW;
			h = 0.203148 * safezoneH;
		};
		class knabisbtn2 : Life_RscButtonInvisible {
			idc = 24510;
			text = "";
			onButtonClick = "";
			x = 0.418229 * safezoneW + safezoneX;
			y = 0.72963 * safezoneH + safezoneY;
			w = 0.0501041 * safezoneW;
			h = 0.0198146 * safezoneH;
		};

		class bm1: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\blackmarket1.paa";
			idc = 24424;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class bm2: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\blackmarket2.paa";
			idc = 24425;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};

		class armurerie1: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\armurerie1.paa";
			idc = 24511;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class armurerielist : Life_RscListBox {
			idc = 24512;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			onLBSelChanged = "[] call ALF_fnc_lbArmurerie;";
			sizeEx = 0.035;
			x = 0.279167 * safezoneW + safezoneX;
			y = 0.446296 * safezoneH + safezoneY;
			w = 0.206354 * safezoneW;
			h = 0.373519 * safezoneH;
		};
		class armurerieedit : Life_RscEdit {
			idc = 24513;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.601042 * safezoneW + safezoneX;
			y = 0.741666 * safezoneH + safezoneY;
			w = 0.0537498 * safezoneW;
			h = 0.0281487 * safezoneH;
		};
		class armureriepicture : Life_RscStructuredText {
			idc = 24514;
			text = "";
			x = 0.488541 * safezoneW + safezoneX;
			y = 0.44537 * safezoneH + safezoneY;
			w = 0.268854 * safezoneW;
			h = 0.287408 * safezoneH;
		};
		class countpanier : Life_RscStructuredText {
			idc = 24515;
			text = "";
			x = 0.738542 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.0198958 * safezoneW;
			h = 0.0198153 * safezoneH;
		};
		class panier : Life_RscButtonInvisible {
			idc = 24516;
			text = "";
			onButtonClick = "";
			x = 0.693229 * safezoneW + safezoneX;
			y = 0.320371 * safezoneH + safezoneY;
			w = 0.0657291 * safezoneW;
			h = 0.0559264 * safezoneH;
		};
		class addpanier : Life_RscButtonInvisible {
			idc = 24517;
			text = "";
			x = 0.560417 * safezoneW + safezoneX;
			y = 0.782408 * safezoneH + safezoneY;
			w = 0.137083 * safezoneW;
			h = 0.0374073 * safezoneH;
		};
		class armurerie2: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\armurerie2.paa";
			idc = 24518;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class delete : Life_RscButtonInvisible {
			idc = 24519;
			text = "";
			onButtonClick = "";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class prixcommande : Life_RscStructuredText {
			idc = 24520;
			text = "";
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.458223 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class livraison : Life_RscListBox {
			idc = 24521;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.045;
			x = 0.506249 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.237552 * safezoneW;
			h = 0.197815 * safezoneH;
		};
		class validerpayer : Life_RscButtonInvisible {
			idc = 24522;
			text = "";
			onButtonClick = "";
			x = 0.545885 * safezoneW + safezoneX;
			y = 0.783333 * safezoneH + safezoneY;
			w = 0.16776 * safezoneW;
			h = 0.0357778 * safezoneH;
		};
		class armurerieplist : Life_RscListBox {
			idc = 24523;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			x = 0.279167 * safezoneW + safezoneX;
			y = 0.446296 * safezoneH + safezoneY;
			w = 0.206354 * safezoneW;
			h = 0.373519 * safezoneH;
		};
		class bourse: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\boursedirect.paa";
			idc = 24524;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class bourselist : Life_RscListBox {
			idc = 24525;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			onLBSelChanged = "[] call ALF_fnc_listboxPrice;";
			sizeEx = 0.055;
			x = 0.279167 * safezoneW + safezoneX;
			y = 0.446296 * safezoneH + safezoneY;
			w = 0.206354 * safezoneW;
			h = 0.373519 * safezoneH;
		};
		class prixbourse : Life_RscStructuredText {
			idc = 24526;
			text = "";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class changebourse : Life_RscStructuredText {
			idc = 24527;
			text = "";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class lbc1: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\lbc1.paa";
			idc = 24528;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class lbc2: Life_RscPicture {
			text = "\ALF_Client2\textures\internet\lbc2.paa";
			idc = 24529;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class btnlbc1 : Life_RscButtonInvisible {
			idc = 24530;
			text = "";
			onButtonClick = "";
			x = 0.557292 * safezoneW + safezoneX;
			y = 0.289815 * safezoneH + safezoneY;
			w = 0.0620829 * safezoneW;
			h = 0.0568515 * safezoneH;
		};
		class btnlbc2 : Life_RscButtonInvisible {
			idc = 24531;
			text = "";
			onButtonClick = "";
			x = 0.629687 * safezoneW + safezoneX;
			y = 0.288889 * safezoneH + safezoneY;
			w = 0.11677 * safezoneW;
			h = 0.0577774 * safezoneH;
		};
		class lbc1lb : Life_RscListBox {
			idc = 24532;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			onLBSelChanged = "[] call ALF_fnc_lbLeboncoin;";
			sizeEx = 0.045;
			x = 0.257813 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.289687 * safezoneW;
			h = 0.42537 * safezoneH;
		};
		class lbctxt1 : Life_RscStructuredText {
			idc = 24533;
			text = "";
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.367593 * safezoneH + safezoneY;
			w = 0.0527074 * safezoneW;
			h = 0.0262959 * safezoneH;
		};
		class lbctxt2 : Life_RscStructuredText {
			idc = 24534;
			text = "";
			x = 0.552083 * safezoneW + safezoneX;
			y = 0.399074 * safezoneH + safezoneY;
			w = 0.205312 * safezoneW;
			h = 0.280926 * safezoneH;
		};
		class lbctxt3 : Life_RscStructuredText {
			idc = 24535;
			text = "";
			x = 0.588541 * safezoneW + safezoneX;
			y = 0.682407 * safezoneH + safezoneY;
			w = 0.168853 * safezoneW;
			h = 0.0281478 * safezoneH;
		};
		class lbctxt4 : Life_RscStructuredText {
			idc = 24536;
			text = "";
			x = 0.652084 * safezoneW + safezoneX;
			y = 0.716667 * safezoneH + safezoneY;
			w = 0.105311 * safezoneW;
			h = 0.0262959 * safezoneH;
		};
		class lbctxt5 : Life_RscStructuredText {
			idc = 24537;
			text = "";
			x = 0.665104 * safezoneW + safezoneX;
			y = 0.742593 * safezoneH + safezoneY;
			w = 0.0922901 * safezoneW;
			h = 0.0262959 * safezoneH;
		};
		class btn2lbc : Life_RscButtonInvisible {
			idc = 24538;
			text = "";
			onButtonClick = "";
			x = 0.618229 * safezoneW + safezoneX;
			y = 0.776851 * safezoneH + safezoneY;
			w = 0.0683318 * safezoneW;
			h = 0.0568515 * safezoneH;
		};
		class lbcedit1 : Life_RscEdit {
			idc = 24539;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.562552 * safezoneW + safezoneX;
			y = 0.398963 * safezoneH + safezoneY;
			w = 0.190207 * safezoneW;
			h = 0.0281478 * safezoneH;
		};
		class lbcedit2 : Life_RscEdit {
			idc = 24540;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 16;
			shadow = 0;
			x = 0.5625 * safezoneW + safezoneX;
			y = 0.457407 * safezoneH + safezoneY;
			w = 0.189792 * safezoneW;
			h = 0.22463 * safezoneH;
		};
		class lbcedit3 : Life_RscEdit {
			idc = 24541;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.590625 * safezoneW + safezoneX;
			y = 0.689814 * safezoneH + safezoneY;
			w = 0.162709 * safezoneW;
			h = 0.0227781 * safezoneH;
		};
		class lbcedit4 : Life_RscEdit {
			idc = 24542;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.590625 * safezoneW + safezoneX;
			y = 0.717593 * safezoneH + safezoneY;
			w = 0.162709 * safezoneW;
			h = 0.0227781 * safezoneH;
		};
		class lbccb : Life_Checkbox {
			idc = 24543;
			color[] = {0,0,0,1};
   			colorDisabled[] = {0,0,0,1};
   			colorText[] = {0,0,0,1};
   			colorTextSelect[] = {0,0,0,1};
   			colorPressed[] = {0,0,0,1};
   			colorHover[] = {0,0,0,1};
   			colorFocused[] = {0,0,0,1};
   			colorBackground[] = {0,0,0,0};
   			colorBackgroundDisabled[] = {0,0,0,0};
   			colorBackgroundPressed[] = {0,0,0,0};
   			colorBackgroundHover[]= {0,0,0,0};
   			colorBackgroundFocused[]= {0,0,0,0};
			x = 0.678126 * safezoneW + safezoneX;
			y = 0.749075 * safezoneH + safezoneY;
			w = 0.0152083 * safezoneW;
			h = 0.0272223 * safezoneH;
		};
		class btn3lbc : Life_RscButtonInvisible {
			idc = 24544;
			text = "";
			onButtonClick = "";
			x = 0.617187 * safezoneW + safezoneX;
			y = 0.779629 * safezoneH + safezoneY;
			w = 0.0798965 * safezoneW;
			h = 0.0561115 * safezoneH;
		};
		class btn4lbc : Life_RscButtonMenu {
			idc = 24545;
			text = "ANNULER";
			onButtonClick = "";
			x = 0.689219 * safezoneW + safezoneX;
			y = 0.793407 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn5lbc : Life_RscButtonMenu {
			idc = 24546;
			text = "SUPPRIMER";
			onButtonClick = "";
			x = 0.550469 * safezoneW + safezoneX;
			y = 0.794333 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
