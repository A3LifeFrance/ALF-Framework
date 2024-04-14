class ALF_SonyP_Dialog {
	idd = 38999;
	name= "ALF_SonyP_Dialog";
	onLoad = "uiNamespace setVariable ['sonyp',0]";
	movingEnable = true;
	enableSimulation = false;
	class controlsBackground {};

	class controls {
		class SonyMenu : Life_RscPicture {
			idc = 39001;
			text = "\ALF_Client2\textures\SonyP\Sony_Menu.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyMenuBtnAppel : Life_RscButtonInvisible {
			idc = 39002;
			text = "";
			onButtonClick = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyMenuBtnSms : Life_RscButtonInvisible {
			idc = 39003;
			text = "";
			onButtonClick = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyMenuBtnContact : Life_RscButtonInvisible {
			idc = 39004;
			text = "";
			onButtonClick = "";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyMenuBtnRegl : Life_RscButtonInvisible {
			idc = 39005;
			text = "";
			onButtonClick = "";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyMenuBtnRadio : Life_RscButtonInvisible {
			idc = 39006;
			text = "";
			onButtonClick = "";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyAppel : Life_RscPicture {
			idc = 39007;
			text = "\ALF_Client2\textures\Sony\Sony_Appel.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyAppelBtn : Life_RscButtonInvisible {
			idc = 39008;
			text = "";
			onButtonClick = "";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.65863 * safezoneH + safezoneY;
			w = 0.0407292 * safezoneW;
			h = 0.068889 * safezoneH;
		};
		class SonyAppelEdit : Life_RscEdit {
			idc = 39009;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.1;
			style = 2;
			shadow = 0;
			x = 0.382291 * safezoneW + safezoneX;
			y = 0.309259 * safezoneH + safezoneY;
			w = 0.223021 * safezoneW;
			h = 0.0596297 * safezoneH;
		};
		class SonyMenuLock : Life_RscPicture {
			idc = 39010;
			text = "\ALF_Client2\textures\Sony\Sony_MenuLock.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCall : Life_RscPicture {
			idc = 39011;
			text = "\ALF_Client2\textures\Sony\Sony_InCall.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCallHP : Life_RscPicture {
			idc = 39012;
			text = "\ALF_Client2\textures\Sony\Sony_InCall_HP.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCallMute : Life_RscPicture {
			idc = 39013;
			text = "\ALF_Client2\textures\Sony\Sony_InCall_Mute.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCallBtnVolp : Life_RscButtonInvisible {
			idc = 39014;
			text = "";
			onButtonClick = "";
			x = 0.437604 * safezoneW + safezoneX;
			y = 0.465148 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyInCallBtnVolm : Life_RscButtonInvisible {
			idc = 39015;
			text = "";
			onButtonClick = "";
			x = 0.497969 * safezoneW + safezoneX;
			y = 0.465148 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyInCallBtnHP : Life_RscButtonInvisible {
			idc = 39016;
			text = "";
			onButtonClick = "";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.465148 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyInCallBtnMute : Life_RscButtonInvisible {
			idc = 39017;
			text = "";
			onButtonClick = "";
			x = 0.379167 * safezoneW + safezoneX;
			y = 0.465148 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyRingCall : Life_RscPicture {
			idc = 39018;
			text = "\ALF_Client2\textures\Sony\Sony_ringCall.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCallName : Life_RscStructuredText {
			idc = 39019;
			text = "";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.292852 * safezoneH + safezoneY;
			w = 0.326146 * safezoneW;
			h = 0.0707407 * safezoneH;
		};
		class SonyInCallNumber : Life_RscStructuredText {
			idc = 39020;
			text = "";
			x = 0.272917 * safezoneW + safezoneX;
			y = 0.37037 * safezoneH + safezoneY;
			w = 0.211563 * safezoneW;
			h = 0.0587037 * safezoneH;
		};
		class SonyInCallTime : Life_RscStructuredText {
			idc = 39021;
			text = "";
			x = 0.603646 * safezoneW + safezoneX;
			y = 0.314815 * safezoneH + safezoneY;
			w = 0.110521 * safezoneW;
			h = 0.0957408 * safezoneH;
		};
		class SonyInCallBtnRefuse : Life_RscButtonInvisible {
			idc = 39022;
			text = "";
			onButtonClick = "";
			x = 0.467188 * safezoneW + safezoneX;
			y = 0.649074 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyRingCallBtnDecrocher : Life_RscButtonInvisible {
			idc = 39023;
			text = "";
			onButtonClick = "";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.050625 * safezoneW;
			h = 0.0864815 * safezoneH;
		};
		class SonyRingCallBtnRacrocher : Life_RscButtonInvisible {
			idc = 39024;
			text = "";
			onButtonClick = "";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.050625 * safezoneW;
			h = 0.0864815 * safezoneH;
		};
		class SonyRegl : Life_RscPicture {
			idc = 39025;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglON1 : Life_RscPicture {
			idc = 39026;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_ON1.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglOFF1 : Life_RscPicture {
			idc = 39027;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_OFF1.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglON2 : Life_RscPicture {
			idc = 39028;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_ON2.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglOFF2 : Life_RscPicture {
			idc = 39029;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_OFF2.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglON3 : Life_RscPicture {
			idc = 39030;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_ON3.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglOFF3 : Life_RscPicture {
			idc = 39031;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_OFF3.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglBtnAvion : Life_RscButtonInvisible {
			idc = 39032;
			text = "";
			onButtonClick = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SonyReglBtnSilence : Life_RscButtonInvisible {
			idc = 39033;
			text = "";
			onButtonClick = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.443518 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SonyReglBtnAnon : Life_RscButtonInvisible {
			idc = 39034;
			text = "";
			onButtonClick = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SonyDate : Life_RscStructuredText {
			idc = 39035;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class SonyRadio : Life_RscPicture {
			idc = 39036;
			text = "\ALF_Client2\textures\SonyP\Sony_Radio.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyRadioBtn1 : Life_RscButtonInvisible {
			idc = 39037;
			text = "";
			onButtonClick = "";
			x = 0.277136 * safezoneW + safezoneX;
			y = 0.294444 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn2 : Life_RscButtonInvisible {
			idc = 39038;
			text = "";
			onButtonClick = "";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.37963 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn3 : Life_RscButtonInvisible {
			idc = 39039;
			text = "";
			onButtonClick = "";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.464815 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn4 : Life_RscButtonInvisible {
			idc = 39040;
			text = "";
			onButtonClick = "";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.550926 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn5 : Life_RscButtonInvisible {
			idc = 39041;
			text = "";
			onButtonClick = "";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.635185 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn6 : Life_RscButtonInvisible {
			idc = 39042;
			text = "";
			onButtonClick = "";
			x = 0.360937 * safezoneW + safezoneX;
			y = 0.29537 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn7 : Life_RscButtonInvisible {
			idc = 39043;
			text = "";
			onButtonClick = "";
			x = 0.360417 * safezoneW + safezoneX;
			y = 0.380556 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn8 : Life_RscButtonInvisible {
			idc = 39044;
			text = "";
			onButtonClick = "";
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.464815 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn9 : Life_RscButtonInvisible {
			idc = 39045;
			text = "";
			onButtonClick = "";
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.549074 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn10 : Life_RscButtonInvisible {
			idc = 39046;
			text = "";
			onButtonClick = "";
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.636111 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn11 : Life_RscButtonInvisible {
			idc = 39047;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.29537 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn12 : Life_RscButtonInvisible {
			idc = 39048;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.380556 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn13 : Life_RscButtonInvisible {
			idc = 39049;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.465741 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn14 : Life_RscButtonInvisible {
			idc = 39050;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn15 : Life_RscButtonInvisible {
			idc = 39051;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.635185 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn16 : Life_RscButtonInvisible {
			idc = 39052;
			text = "";
			onButtonClick = "";
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.294444 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn17 : Life_RscButtonInvisible {
			idc = 39053;
			text = "";
			onButtonClick = "";
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn21 : Life_RscButtonInvisible {
			idc = 39057;
			text = "";
			onButtonClick = "";
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.29537 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioCo1 : Life_RscStructuredText {
			idc = 39059;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo2 : Life_RscStructuredText {
			idc = 39060;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo3 : Life_RscStructuredText {
			idc = 39061;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo4 : Life_RscStructuredText {
			idc = 39062;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.576852 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo5 : Life_RscStructuredText {
			idc = 39063;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.662037 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo6 : Life_RscStructuredText {
			idc = 39064;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo7 : Life_RscStructuredText {
			idc = 39065;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo8 : Life_RscStructuredText {
			idc = 39066;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo9 : Life_RscStructuredText {
			idc = 39067;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.576852 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo10 : Life_RscStructuredText {
			idc = 39068;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.662037 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo11 : Life_RscStructuredText {
			idc = 39069;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo12 : Life_RscStructuredText {
			idc = 39070;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo13 : Life_RscStructuredText {
			idc = 39071;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo14 : Life_RscStructuredText {
			idc = 39072;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.576852 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo15 : Life_RscStructuredText {
			idc = 39073;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.662037 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo16 : Life_RscStructuredText {
			idc = 39074;
			text = "";
			onButtonClick = "";
			x = 0.533854 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo17 : Life_RscStructuredText {
			idc = 39075;
			text = "";
			onButtonClick = "";
			x = 0.533854 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo21 : Life_RscStructuredText {
			idc = 39079;
			text = "";
			onButtonClick = "";
			x = 0.617708 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioNb1 : Life_RscStructuredText {
			idc = 39081;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb2 : Life_RscStructuredText {
			idc = 39082;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb3 : Life_RscStructuredText {
			idc = 39083;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb4 : Life_RscStructuredText {
			idc = 39084;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.596296 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb5 : Life_RscStructuredText {
			idc = 39085;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.681481 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb6 : Life_RscStructuredText {
			idc = 39086;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb7 : Life_RscStructuredText {
			idc = 39087;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb8 : Life_RscStructuredText {
			idc = 39088;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb9 : Life_RscStructuredText {
			idc = 39089;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.596296 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb10 : Life_RscStructuredText {
			idc = 39090;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.681481 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb11 : Life_RscStructuredText {
			idc = 39091;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb12 : Life_RscStructuredText {
			idc = 39092;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb13 : Life_RscStructuredText {
			idc = 39093;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb14 : Life_RscStructuredText {
			idc = 39094;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.596296 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb15 : Life_RscStructuredText {
			idc = 39095;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.681481 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb16 : Life_RscStructuredText {
			idc = 39096;
			text = "";
			onButtonClick = "";
			x = 0.548437 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb17 : Life_RscStructuredText {
			idc = 39097;
			text = "";
			onButtonClick = "";
			x = 0.548437 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb21 : Life_RscStructuredText {
			idc = 39101;
			text = "";
			onButtonClick = "";
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyReglagesBtnVolp1 : Life_RscButtonInvisible {
			idc = 39103;
			text = "";
			onButtonClick = "";
			x = 0.353177 * safezoneW + safezoneX;
			y = 0.625222 * safezoneH + safezoneY;
			w = 0.0211458 * safezoneW;
			h = 0.0376296 * safezoneH;
		};
		class SonyReglagesBtnVolm1 : Life_RscButtonInvisible {
			idc = 39104;
			text = "";
			onButtonClick = "";
			x = 0.377605 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0211458 * safezoneW;
			h = 0.0376296 * safezoneH;
		};
		class SonyMenuBtnCentral : Life_RscButtonInvisible {
			idc = 39109;
			text = "";
			onButtonClick = "";
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class SonyContacts : Life_RscPicture {
			idc = 39110;
			text = "\ALF_Client2\textures\Sony\Sony_Contacts.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyContactsAdd : Life_RscButtonInvisible {
			idc = 39111;
			text = "";
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SonyContactsTexte : Life_RscStructuredText {
			idc = 39112;
			text = "";
			x = 0.310156 * safezoneW + safezoneX;
			y = 0.345 * safezoneH + safezoneY;
			w = 0.408959 * safezoneW;
			h = 0.0466666 * safezoneH;
		};
		class SonyContactsList : Life_RscListBox {
			idc = 39113;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.065;
			x = 0.267709 * safezoneW + safezoneX;
			y = 0.386111 * safezoneH + safezoneY;
			w = 0.453751 * safezoneW;
			h = 0.338333 * safezoneH;
		};
		class SonyFiche : Life_RscPicture {
			idc = 39114;
			text = "\ALF_Client2\textures\Sony\Sony_Fiche.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyFicheName : Life_RscStructuredText {
			idc = 39115;
			text = "";
			x = 0.269792 * safezoneW + safezoneX;
			y = 0.333334 * safezoneH + safezoneY;
			w = 0.449063 * safezoneW;
			h = 0.041111 * safezoneH;
		};
		class SonyFicheNum : Life_RscStructuredText {
			idc = 39116;
			text = "";
			x = 0.270051 * safezoneW + safezoneX;
			y = 0.395889 * safezoneH + safezoneY;
			w = 0.136563 * safezoneW;
			h = 0.0318518 * safezoneH;
		};
		class SonyFicheBtnSms : Life_RscButtonInvisible {
			idc = 39117;
			text = "";
			x = 0.269791 * safezoneW + safezoneX;
			y = 0.538889 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		class SonyFicheBtnAppel : Life_RscButtonInvisible {
			idc = 39118;
			text = "";
			x = 0.269791 * safezoneW + safezoneX;
			y = 0.571296 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		class SonyFicheBtnSupprimer : Life_RscButtonInvisible {
			idc = 39119;
			text = "";
			x = 0.26875 * safezoneW + safezoneX;
			y = 0.693519 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.0272222 * safezoneH;
		};

		class SonyCentral : Life_RscPicture {
			idc = 39120;
			text = "\ALF_Client2\textures\SonyP\Sony_Central.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyCentralList : Life_RscListBox {
			idc = 39121;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			x = 0.278125 * safezoneW + safezoneX;
			y = 0.298148 * safezoneH + safezoneY;
			w = 0.277708 * safezoneW;
			h = 0.424445 * safezoneH;
		};
		class SonyCentralBtnAppel : Life_RscButtonInvisible {
			idc = 39122;
			text = "";
			x = 0.5875 * safezoneW + safezoneX;
			y = 0.306482 * safezoneH + safezoneY;
			w = 0.102708 * safezoneW;
			h = 0.0337037 * safezoneH;
		};
		class SonyCentralBtnRaf : Life_RscButtonInvisible {
			idc = 39123;
			text = "";
			x = 0.5875 * safezoneW + safezoneX;
			y = 0.35463 * safezoneH + safezoneY;
			w = 0.102708 * safezoneW;
			h = 0.0337037 * safezoneH;
		};
		class SonyCentralBtnRac : Life_RscButtonInvisible {
			idc = 39124;
			text = "";
			x = 0.586979 * safezoneW + safezoneX;
			y = 0.462963 * safezoneH + safezoneY;
			w = 0.102708 * safezoneW;
			h = 0.0337037 * safezoneH;
		};
		class SonyNewContact : Life_RscPicture {
			idc = 39125;
			text = "\ALF_Client2\textures\Sony\Sony_NewContact.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyNewContactAnn : Life_RscButtonInvisible {
			idc = 39126;
			text = "";
			x = 0.666666 * safezoneW + safezoneX;
			y = 0.287037 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0401852 * safezoneH;
		};
		class SonyNewContactAdd : Life_RscButtonInvisible {
			idc = 39127;
			text = "";
			x = 0.275 * safezoneW + safezoneX;
			y = 0.687037 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0401852 * safezoneH;
		};
		class SonyNewContactName : Life_RscEdit {
			idc = 39128;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.336563 * safezoneW;
			h = 0.0383333 * safezoneH;
		};
		class SonyNewContactNum : Life_RscEdit {
			idc = 39129;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.392187 * safezoneW + safezoneX;
			y = 0.384259 * safezoneH + safezoneY;
			w = 0.325625 * safezoneW;
			h = 0.0392593 * safezoneH;
		};
		class SonyRadioRaf : Life_RscButtonInvisible {
			idc = 39130;
			text = "";
			x = 0.648958 * safezoneW + safezoneX;
			y = 0.703704 * safezoneH + safezoneY;
			w = 0.063125 * safezoneW;
			h = 0.0346296 * safezoneH;
		};
		class SonyRecents : Life_RscPicture {
			idc = 39131;
			text = "\ALF_Client2\textures\Sony\Sony_Recents.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyRecentsList : Life_RscListBox {
			idc = 39132;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			x = 0.267708 * safezoneW + safezoneX;
			y = 0.330556 * safezoneH + safezoneY;
			w = 0.330556 * safezoneW;
			h = 0.363333 * safezoneH;
		};
		class SonyRecentsVider : Life_RscButtonInvisible {
			idc = 39133;
			text = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0593228 * safezoneW;
			h = 0.0367037 * safezoneH;
		};
		class SonyRecentsApp : Life_RscButtonInvisible {
			idc = 39134;
			text = "";
			x = 0.270834 * safezoneW + safezoneX;
			y = 0.702778 * safezoneH + safezoneY;
			w = 0.0593228 * safezoneW;
			h = 0.0367037 * safezoneH;
		};
		class SonyRecentsSms : Life_RscButtonInvisible {
			idc = 39135;
			text = "";
			x = 0.65 * safezoneW + safezoneX;
			y = 0.703704 * safezoneH + safezoneY;
			w = 0.0593228 * safezoneW;
			h = 0.0367037 * safezoneH;
		};
		class SonyAppelRecents : Life_RscButtonInvisible {
			idc = 39136;
			text = "";
			x = 0.666407 * safezoneW + safezoneX;
			y = 0.70737 * safezoneH + safezoneY;
			w = 0.0553125 * safezoneW;
			h = 0.0346296 * safezoneH;
		};
		class SonyReglagesFg : Life_RscButtonInvisible {
			idc = 39137;
			text = "";
			x = 0.598958 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesFm : Life_RscButtonInvisible {
			idc = 39138;
			text = "";
			x = 0.628125 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesFd : Life_RscButtonInvisible {
			idc = 39139;
			text = "";
			x = 0.657812 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesF2g : Life_RscButtonInvisible {
			idc = 39140;
			text = "";
			x = 0.598958 * safezoneW + safezoneX;
			y = 0.658333 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesF2m : Life_RscButtonInvisible {
			idc = 39141;
			text = "";
			x = 0.628125 * safezoneW + safezoneX;
			y = 0.658333 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesF2d : Life_RscButtonInvisible {
			idc = 39142;
			text = "";
			x = 0.657812 * safezoneW + safezoneX;
			y = 0.658333 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyMessages : Life_RscPicture {
			idc = 39143;
			text = "\ALF_Client2\textures\Sony\Sony_SmsList.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyMessagesLb : Life_RscListBox {
			idc = 39144;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			onLBSelChanged = "[] call ALF_fnc_lbChangedSmsSonyP;";
			x = 0.267708 * safezoneW + safezoneX;
			y = 0.32963 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.155926 * safezoneH;
		};
		class SonyMessagesTexte : Life_RscStructuredText {
			idc = 39145;
			text = "";
			x = 0.267708 * safezoneW + safezoneX;
			y = 0.484259 * safezoneH + safezoneY;
			w = 0.453229 * safezoneW;
			h = 0.210556 * safezoneH;
		};
		class SonyMessagesBtnRep : Life_RscButtonInvisible {
			idc = 39146;
			text = "";
			x = 0.271042 * safezoneW + safezoneX;
			y = 0.699963 * safezoneH + safezoneY;
			w = 0.0641667 * safezoneW;
			h = 0.0411111 * safezoneH;
		};
		class SonyMessagesBtnSup : Life_RscButtonInvisible {
			idc = 39147;
			text = "";
			x = 0.651042 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.0641667 * safezoneW;
			h = 0.0411111 * safezoneH;
		};
		class SonyMessagesBtnNew : Life_RscButtonInvisible {
			idc = 39148;
			text = "";
			x = 0.669271 * safezoneW + safezoneX;
			y = 0.287037 * safezoneH + safezoneY;
			w = 0.0511459 * safezoneW;
			h = 0.042037 * safezoneH;
		};
		class SonyNewMessages : Life_RscPicture {
			idc = 39149;
			text = "\ALF_Client2\textures\Sony\Sony_NewSms.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyNewMessagesNameTexte : Life_RscStructuredText {
			idc = 39150;
			text = "";
			style = 0;
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.334259 * safezoneH + safezoneY;
			w = 0.160521 * safezoneW;
			h = 0.0355555 * safezoneH;
		};
		class SonyNewMessagesNumEdit : Life_RscEdit {
			idc = 39151;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.334259 * safezoneH + safezoneY;
			w = 0.160521 * safezoneW;
			h = 0.0355555 * safezoneH;
		};
		class SonyNewMessagesSmsEdit : Life_RscEdit {
			idc = 39152;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 16;
			shadow = 0;
			x = 0.277239 * safezoneW + safezoneX;
			y = 0.464222 * safezoneH + safezoneY;
			w = 0.435521 * safezoneW;
			h = 0.267964 * safezoneH;
		};
		class SonyNewMessagesBtnAnn : Life_RscButtonInvisible {
			idc = 39153;
			text = "";
			x = 0.669271 * safezoneW + safezoneX;
			y = 0.287037 * safezoneH + safezoneY;
			w = 0.0511459 * safezoneW;
			h = 0.042037 * safezoneH;
		};
		class SonyNewMessagesBtnSend : Life_RscButtonInvisible {
			idc = 39154;
			text = "";
			x = 0.661458 * safezoneW + safezoneX;
			y = 0.426704 * safezoneH + safezoneY;
			w = 0.0511458 * safezoneW;
			h = 0.0355555 * safezoneH;
		};

		class HomeBtn : Life_RscButtonInvisible {
			idc = 39000;
			text = "";
			onButtonClick = "uiNamespace setVariable ['sonyp',0]; [] call ALF_fnc_menuSonyP;";
			x = 0.48401 * safezoneW + safezoneX;
			y = 0.744778 * safezoneH + safezoneY;
			w = 0.0209375 * safezoneW;
			h = 0.0235186 * safezoneH;
		};
	};
};