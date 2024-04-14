class ALF_Sony_Dialog {
	idd = 32999;
	name= "ALF_Sony_Dialog";
	onLoad = "uiNamespace setVariable ['sony',0]";
	movingEnable = true;
	enableSimulation = false;
	class controlsBackground {};

	class controls {
		class SonyMenu : Life_RscPicture {
			idc = 33001;
			text = "\ALF_Client2\textures\Sony\Sony_Menu.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyMenuBtnAppel : Life_RscButtonInvisible {
			idc = 33002;
			text = "";
			onButtonClick = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyMenuBtnSms : Life_RscButtonInvisible {
			idc = 33003;
			text = "";
			onButtonClick = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyMenuBtnContact : Life_RscButtonInvisible {
			idc = 33004;
			text = "";
			onButtonClick = "";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyMenuBtnRegl : Life_RscButtonInvisible {
			idc = 33005;
			text = "";
			onButtonClick = "";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyMenuBtnRadio : Life_RscButtonInvisible {
			idc = 33006;
			text = "";
			onButtonClick = "";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class SonyAppel : Life_RscPicture {
			idc = 33007;
			text = "\ALF_Client2\textures\Sony\Sony_Appel.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyAppelBtn : Life_RscButtonInvisible {
			idc = 33008;
			text = "";
			onButtonClick = "";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.65863 * safezoneH + safezoneY;
			w = 0.0407292 * safezoneW;
			h = 0.068889 * safezoneH;
		};
		class SonyAppelEdit : Life_RscEdit {
			idc = 33009;
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
			idc = 33010;
			text = "\ALF_Client2\textures\Sony\Sony_MenuLock.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCall : Life_RscPicture {
			idc = 33011;
			text = "\ALF_Client2\textures\Sony\Sony_InCall.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCallHP : Life_RscPicture {
			idc = 33012;
			text = "\ALF_Client2\textures\Sony\Sony_InCall_HP.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCallMute : Life_RscPicture {
			idc = 33013;
			text = "\ALF_Client2\textures\Sony\Sony_InCall_Mute.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCallBtnVolp : Life_RscButtonInvisible {
			idc = 33014;
			text = "";
			onButtonClick = "";
			x = 0.437604 * safezoneW + safezoneX;
			y = 0.465148 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyInCallBtnVolm : Life_RscButtonInvisible {
			idc = 33015;
			text = "";
			onButtonClick = "";
			x = 0.497969 * safezoneW + safezoneX;
			y = 0.465148 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyInCallBtnHP : Life_RscButtonInvisible {
			idc = 33016;
			text = "";
			onButtonClick = "";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.465148 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyInCallBtnMute : Life_RscButtonInvisible {
			idc = 33017;
			text = "";
			onButtonClick = "";
			x = 0.379167 * safezoneW + safezoneX;
			y = 0.465148 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyRingCall : Life_RscPicture {
			idc = 33018;
			text = "\ALF_Client2\textures\Sony\Sony_ringCall.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyInCallName : Life_RscStructuredText {
			idc = 33019;
			text = "";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.292852 * safezoneH + safezoneY;
			w = 0.326146 * safezoneW;
			h = 0.0707407 * safezoneH;
		};
		class SonyInCallNumber : Life_RscStructuredText {
			idc = 33020;
			text = "";
			x = 0.272917 * safezoneW + safezoneX;
			y = 0.37037 * safezoneH + safezoneY;
			w = 0.211563 * safezoneW;
			h = 0.0587037 * safezoneH;
		};
		class SonyInCallTime : Life_RscStructuredText {
			idc = 33021;
			text = "";
			x = 0.603646 * safezoneW + safezoneX;
			y = 0.314815 * safezoneH + safezoneY;
			w = 0.110521 * safezoneW;
			h = 0.0957408 * safezoneH;
		};
		class SonyInCallBtnRefuse : Life_RscButtonInvisible {
			idc = 33022;
			text = "";
			onButtonClick = "";
			x = 0.467188 * safezoneW + safezoneX;
			y = 0.649074 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0911111 * safezoneH;
		};
		class SonyRingCallBtnDecrocher : Life_RscButtonInvisible {
			idc = 33023;
			text = "";
			onButtonClick = "";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.050625 * safezoneW;
			h = 0.0864815 * safezoneH;
		};
		class SonyRingCallBtnRacrocher : Life_RscButtonInvisible {
			idc = 33024;
			text = "";
			onButtonClick = "";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.050625 * safezoneW;
			h = 0.0864815 * safezoneH;
		};
		class SonyRegl : Life_RscPicture {
			idc = 33025;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglON1 : Life_RscPicture {
			idc = 33026;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_ON1.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglOFF1 : Life_RscPicture {
			idc = 33027;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_OFF1.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglON2 : Life_RscPicture {
			idc = 33028;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_ON2.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglOFF2 : Life_RscPicture {
			idc = 33029;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_OFF2.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglON3 : Life_RscPicture {
			idc = 33030;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_ON3.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglOFF3 : Life_RscPicture {
			idc = 33031;
			text = "\ALF_Client2\textures\Sony\Sony_Reglages_OFF3.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyReglBtnAvion : Life_RscButtonInvisible {
			idc = 33032;
			text = "";
			onButtonClick = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SonyReglBtnSilence : Life_RscButtonInvisible {
			idc = 33033;
			text = "";
			onButtonClick = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.443518 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SonyReglBtnAnon : Life_RscButtonInvisible {
			idc = 33034;
			text = "";
			onButtonClick = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SonyDate : Life_RscStructuredText {
			idc = 33035;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class SonyRadio : Life_RscPicture {
			idc = 33036;
			text = "\ALF_Client2\textures\Sony\Sony_Radio.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyRadioBtn1 : Life_RscButtonInvisible {
			idc = 33037;
			text = "";
			onButtonClick = "";
			x = 0.277136 * safezoneW + safezoneX;
			y = 0.294444 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn2 : Life_RscButtonInvisible {
			idc = 33038;
			text = "";
			onButtonClick = "";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.37963 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn3 : Life_RscButtonInvisible {
			idc = 33039;
			text = "";
			onButtonClick = "";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.464815 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn4 : Life_RscButtonInvisible {
			idc = 33040;
			text = "";
			onButtonClick = "";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.550926 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn5 : Life_RscButtonInvisible {
			idc = 33041;
			text = "";
			onButtonClick = "";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.635185 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn6 : Life_RscButtonInvisible {
			idc = 33042;
			text = "";
			onButtonClick = "";
			x = 0.360937 * safezoneW + safezoneX;
			y = 0.29537 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn7 : Life_RscButtonInvisible {
			idc = 33043;
			text = "";
			onButtonClick = "";
			x = 0.360417 * safezoneW + safezoneX;
			y = 0.380556 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn8 : Life_RscButtonInvisible {
			idc = 33044;
			text = "";
			onButtonClick = "";
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.464815 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn9 : Life_RscButtonInvisible {
			idc = 33045;
			text = "";
			onButtonClick = "";
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.549074 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn10 : Life_RscButtonInvisible {
			idc = 33046;
			text = "";
			onButtonClick = "";
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.636111 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn11 : Life_RscButtonInvisible {
			idc = 33047;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.29537 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn12 : Life_RscButtonInvisible {
			idc = 33048;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.380556 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn13 : Life_RscButtonInvisible {
			idc = 33049;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.465741 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn14 : Life_RscButtonInvisible {
			idc = 33050;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn15 : Life_RscButtonInvisible {
			idc = 33051;
			text = "";
			onButtonClick = "";
			x = 0.445833 * safezoneW + safezoneX;
			y = 0.635185 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn16 : Life_RscButtonInvisible {
			idc = 33052;
			text = "";
			onButtonClick = "";
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.294444 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn17 : Life_RscButtonInvisible {
			idc = 33053;
			text = "";
			onButtonClick = "";
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn18 : Life_RscButtonInvisible {
			idc = 33054;
			text = "";
			onButtonClick = "";
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.464815 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn19 : Life_RscButtonInvisible {
			idc = 33055;
			text = "";
			onButtonClick = "";
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn20 : Life_RscButtonInvisible {
			idc = 33056;
			text = "";
			onButtonClick = "";
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.635185 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn21 : Life_RscButtonInvisible {
			idc = 33057;
			text = "";
			onButtonClick = "";
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.29537 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioBtn22 : Life_RscButtonInvisible {
			idc = 33058;
			text = "";
			onButtonClick = "";
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0735185 * safezoneH;
		};
		class SonyRadioCo1 : Life_RscStructuredText {
			idc = 33059;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo2 : Life_RscStructuredText {
			idc = 33060;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo3 : Life_RscStructuredText {
			idc = 33061;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo4 : Life_RscStructuredText {
			idc = 33062;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.576852 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo5 : Life_RscStructuredText {
			idc = 33063;
			text = "";
			onButtonClick = "";
			x = 0.282395 * safezoneW + safezoneX;
			y = 0.662037 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo6 : Life_RscStructuredText {
			idc = 33064;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo7 : Life_RscStructuredText {
			idc = 33065;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo8 : Life_RscStructuredText {
			idc = 33066;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo9 : Life_RscStructuredText {
			idc = 33067;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.576852 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo10 : Life_RscStructuredText {
			idc = 33068;
			text = "";
			onButtonClick = "";
			x = 0.366667 * safezoneW + safezoneX;
			y = 0.662037 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo11 : Life_RscStructuredText {
			idc = 33069;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo12 : Life_RscStructuredText {
			idc = 33070;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo13 : Life_RscStructuredText {
			idc = 33071;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo14 : Life_RscStructuredText {
			idc = 33072;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.576852 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo15 : Life_RscStructuredText {
			idc = 33073;
			text = "";
			onButtonClick = "";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.662037 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo16 : Life_RscStructuredText {
			idc = 33074;
			text = "";
			onButtonClick = "";
			x = 0.533854 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo17 : Life_RscStructuredText {
			idc = 33075;
			text = "";
			onButtonClick = "";
			x = 0.533854 * safezoneW + safezoneX;
			y = 0.407407 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo18 : Life_RscStructuredText {
			idc = 33076;
			text = "";
			onButtonClick = "";
			x = 0.533854 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo19 : Life_RscStructuredText {
			idc = 33077;
			text = "";
			onButtonClick = "";
			x = 0.533854 * safezoneW + safezoneX;
			y = 0.576852 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo20 : Life_RscStructuredText {
			idc = 33078;
			text = "";
			onButtonClick = "";
			x = 0.533854 * safezoneW + safezoneX;
			y = 0.662037 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo21 : Life_RscStructuredText {
			idc = 33079;
			text = "";
			onButtonClick = "";
			x = 0.617708 * safezoneW + safezoneX;
			y = 0.322148 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioCo22 : Life_RscStructuredText {
			idc = 33080;
			text = "";
			onButtonClick = "";
			x = 0.617708 * safezoneW + safezoneX;
			y = 0.407408 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.017037 * safezoneH;
		};
		class SonyRadioNb1 : Life_RscStructuredText {
			idc = 33081;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb2 : Life_RscStructuredText {
			idc = 33082;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb3 : Life_RscStructuredText {
			idc = 33083;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb4 : Life_RscStructuredText {
			idc = 33084;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.596296 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb5 : Life_RscStructuredText {
			idc = 33085;
			text = "";
			onButtonClick = "";
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.681481 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb6 : Life_RscStructuredText {
			idc = 33086;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb7 : Life_RscStructuredText {
			idc = 33087;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb8 : Life_RscStructuredText {
			idc = 33088;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb9 : Life_RscStructuredText {
			idc = 33089;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.596296 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb10 : Life_RscStructuredText {
			idc = 33090;
			text = "";
			onButtonClick = "";
			x = 0.379166 * safezoneW + safezoneX;
			y = 0.681481 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb11 : Life_RscStructuredText {
			idc = 33091;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb12 : Life_RscStructuredText {
			idc = 33092;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb13 : Life_RscStructuredText {
			idc = 33093;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb14 : Life_RscStructuredText {
			idc = 33094;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.596296 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb15 : Life_RscStructuredText {
			idc = 33095;
			text = "";
			onButtonClick = "";
			x = 0.463542 * safezoneW + safezoneX;
			y = 0.681481 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb16 : Life_RscStructuredText {
			idc = 33096;
			text = "";
			onButtonClick = "";
			x = 0.548437 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb17 : Life_RscStructuredText {
			idc = 33097;
			text = "";
			onButtonClick = "";
			x = 0.548437 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb18 : Life_RscStructuredText {
			idc = 33098;
			text = "";
			onButtonClick = "";
			x = 0.548437 * safezoneW + safezoneX;
			y = 0.511111 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb19 : Life_RscStructuredText {
			idc = 33099;
			text = "";
			onButtonClick = "";
			x = 0.548437 * safezoneW + safezoneX;
			y = 0.596296 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb20 : Life_RscStructuredText {
			idc = 33100;
			text = "";
			onButtonClick = "";
			x = 0.548437 * safezoneW + safezoneX;
			y = 0.681481 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb21 : Life_RscStructuredText {
			idc = 33101;
			text = "";
			onButtonClick = "";
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.341666 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyRadioNb22 : Life_RscStructuredText {
			idc = 33102;
			text = "";
			onButtonClick = "";
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.230208 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class SonyReglagesBtnVolp1 : Life_RscButtonInvisible {
			idc = 33103;
			text = "";
			onButtonClick = "";
			x = 0.353177 * safezoneW + safezoneX;
			y = 0.625222 * safezoneH + safezoneY;
			w = 0.0211458 * safezoneW;
			h = 0.0376296 * safezoneH;
		};
		class SonyReglagesBtnVolm1 : Life_RscButtonInvisible {
			idc = 33104;
			text = "";
			onButtonClick = "";
			x = 0.377605 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0211458 * safezoneW;
			h = 0.0376296 * safezoneH;
		};
		class SonyMenuBtnPlaque : Life_RscButtonInvisible {
			idc = 33107;
			text = "";
			onButtonClick = "";
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class SonyMenuBtnInterpol : Life_RscButtonInvisible {
			idc = 33108;
			text = "";
			onButtonClick = "";
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class SonyMenuBtnCentral : Life_RscButtonInvisible {
			idc = 33109;
			text = "";
			onButtonClick = "";
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class SonyContacts : Life_RscPicture {
			idc = 33110;
			text = "\ALF_Client2\textures\Sony\Sony_Contacts.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyContactsAdd : Life_RscButtonInvisible {
			idc = 33111;
			text = "";
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SonyContactsTexte : Life_RscStructuredText {
			idc = 33112;
			text = "";
			x = 0.310156 * safezoneW + safezoneX;
			y = 0.345 * safezoneH + safezoneY;
			w = 0.408959 * safezoneW;
			h = 0.0466666 * safezoneH;
		};
		class SonyContactsList : Life_RscListBox {
			idc = 33113;
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
			idc = 33114;
			text = "\ALF_Client2\textures\Sony\Sony_Fiche.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyFicheName : Life_RscStructuredText {
			idc = 33115;
			text = "";
			x = 0.269792 * safezoneW + safezoneX;
			y = 0.333334 * safezoneH + safezoneY;
			w = 0.449063 * safezoneW;
			h = 0.041111 * safezoneH;
		};
		class SonyFicheNum : Life_RscStructuredText {
			idc = 33116;
			text = "";
			x = 0.270051 * safezoneW + safezoneX;
			y = 0.395889 * safezoneH + safezoneY;
			w = 0.136563 * safezoneW;
			h = 0.0318518 * safezoneH;
		};
		class SonyFicheBtnSms : Life_RscButtonInvisible {
			idc = 33117;
			text = "";
			x = 0.269791 * safezoneW + safezoneX;
			y = 0.538889 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		class SonyFicheBtnAppel : Life_RscButtonInvisible {
			idc = 33118;
			text = "";
			x = 0.269791 * safezoneW + safezoneX;
			y = 0.571296 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		class SonyFicheBtnSupprimer : Life_RscButtonInvisible {
			idc = 33119;
			text = "";
			x = 0.26875 * safezoneW + safezoneX;
			y = 0.693519 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.0272222 * safezoneH;
		};

		class SonyCentral : Life_RscPicture {
			idc = 33120;
			text = "\ALF_Client2\textures\Sony\Sony_Central.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyCentralList : Life_RscListBox {
			idc = 33121;
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
			idc = 33122;
			text = "";
			x = 0.5875 * safezoneW + safezoneX;
			y = 0.306482 * safezoneH + safezoneY;
			w = 0.102708 * safezoneW;
			h = 0.0337037 * safezoneH;
		};
		class SonyCentralBtnRaf : Life_RscButtonInvisible {
			idc = 33123;
			text = "";
			x = 0.5875 * safezoneW + safezoneX;
			y = 0.35463 * safezoneH + safezoneY;
			w = 0.102708 * safezoneW;
			h = 0.0337037 * safezoneH;
		};
		class SonyCentralBtnRac : Life_RscButtonInvisible {
			idc = 33124;
			text = "";
			x = 0.586979 * safezoneW + safezoneX;
			y = 0.462963 * safezoneH + safezoneY;
			w = 0.102708 * safezoneW;
			h = 0.0337037 * safezoneH;
		};
		class SonyNewContact : Life_RscPicture {
			idc = 33125;
			text = "\ALF_Client2\textures\Sony\Sony_NewContact.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyNewContactAnn : Life_RscButtonInvisible {
			idc = 33126;
			text = "";
			x = 0.666666 * safezoneW + safezoneX;
			y = 0.287037 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0401852 * safezoneH;
		};
		class SonyNewContactAdd : Life_RscButtonInvisible {
			idc = 33127;
			text = "";
			x = 0.275 * safezoneW + safezoneX;
			y = 0.687037 * safezoneH + safezoneY;
			w = 0.05375 * safezoneW;
			h = 0.0401852 * safezoneH;
		};
		class SonyNewContactName : Life_RscEdit {
			idc = 33128;
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
			idc = 33129;
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
			idc = 33130;
			text = "";
			x = 0.648958 * safezoneW + safezoneX;
			y = 0.703704 * safezoneH + safezoneY;
			w = 0.063125 * safezoneW;
			h = 0.0346296 * safezoneH;
		};
		class SonyRecents : Life_RscPicture {
			idc = 33131;
			text = "\ALF_Client2\textures\Sony\Sony_Recents.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyRecentsList : Life_RscListBox {
			idc = 33132;
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
			idc = 33133;
			text = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0593228 * safezoneW;
			h = 0.0367037 * safezoneH;
		};
		class SonyRecentsApp : Life_RscButtonInvisible {
			idc = 33134;
			text = "";
			x = 0.270834 * safezoneW + safezoneX;
			y = 0.702778 * safezoneH + safezoneY;
			w = 0.0593228 * safezoneW;
			h = 0.0367037 * safezoneH;
		};
		class SonyRecentsSms : Life_RscButtonInvisible {
			idc = 33135;
			text = "";
			x = 0.65 * safezoneW + safezoneX;
			y = 0.703704 * safezoneH + safezoneY;
			w = 0.0593228 * safezoneW;
			h = 0.0367037 * safezoneH;
		};
		class SonyAppelRecents : Life_RscButtonInvisible {
			idc = 33136;
			text = "";
			x = 0.666407 * safezoneW + safezoneX;
			y = 0.70737 * safezoneH + safezoneY;
			w = 0.0553125 * safezoneW;
			h = 0.0346296 * safezoneH;
		};
		class SonyReglagesFg : Life_RscButtonInvisible {
			idc = 33137;
			text = "";
			x = 0.598958 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesFm : Life_RscButtonInvisible {
			idc = 33138;
			text = "";
			x = 0.628125 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesFd : Life_RscButtonInvisible {
			idc = 33139;
			text = "";
			x = 0.657812 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesF2g : Life_RscButtonInvisible {
			idc = 33140;
			text = "";
			x = 0.598958 * safezoneW + safezoneX;
			y = 0.658333 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesF2m : Life_RscButtonInvisible {
			idc = 33141;
			text = "";
			x = 0.628125 * safezoneW + safezoneX;
			y = 0.658333 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyReglagesF2d : Life_RscButtonInvisible {
			idc = 33142;
			text = "";
			x = 0.657812 * safezoneW + safezoneX;
			y = 0.658333 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0161111 * safezoneH;
		};
		class SonyMessages : Life_RscPicture {
			idc = 33143;
			text = "\ALF_Client2\textures\Sony\Sony_SmsList.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyMessagesLb : Life_RscListBox {
			idc = 33144;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			onLBSelChanged = "[] call ALF_fnc_lbChangedSmsSony;";
			x = 0.267708 * safezoneW + safezoneX;
			y = 0.32963 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.155926 * safezoneH;
		};
		class SonyMessagesTexte : Life_RscStructuredText {
			idc = 33145;
			text = "";
			x = 0.267708 * safezoneW + safezoneX;
			y = 0.484259 * safezoneH + safezoneY;
			w = 0.453229 * safezoneW;
			h = 0.210556 * safezoneH;
		};
		class SonyMessagesBtnRep : Life_RscButtonInvisible {
			idc = 33146;
			text = "";
			x = 0.271042 * safezoneW + safezoneX;
			y = 0.699963 * safezoneH + safezoneY;
			w = 0.0641667 * safezoneW;
			h = 0.0411111 * safezoneH;
		};
		class SonyMessagesBtnSup : Life_RscButtonInvisible {
			idc = 33147;
			text = "";
			x = 0.651042 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.0641667 * safezoneW;
			h = 0.0411111 * safezoneH;
		};
		class SonyMessagesBtnNew : Life_RscButtonInvisible {
			idc = 33148;
			text = "";
			x = 0.669271 * safezoneW + safezoneX;
			y = 0.287037 * safezoneH + safezoneY;
			w = 0.0511459 * safezoneW;
			h = 0.042037 * safezoneH;
		};
		class SonyNewMessages : Life_RscPicture {
			idc = 33149;
			text = "\ALF_Client2\textures\Sony\Sony_NewSms.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyNewMessagesNameTexte : Life_RscStructuredText {
			idc = 33150;
			text = "";
			style = 0;
			x = 0.295312 * safezoneW + safezoneX;
			y = 0.334259 * safezoneH + safezoneY;
			w = 0.160521 * safezoneW;
			h = 0.0355555 * safezoneH;
		};
		class SonyNewMessagesNumEdit : Life_RscEdit {
			idc = 33151;
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
			idc = 33152;
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
			idc = 33153;
			text = "";
			x = 0.669271 * safezoneW + safezoneX;
			y = 0.287037 * safezoneH + safezoneY;
			w = 0.0511459 * safezoneW;
			h = 0.042037 * safezoneH;
		};
		class SonyNewMessagesBtnSend : Life_RscButtonInvisible {
			idc = 33154;
			text = "";
			x = 0.661458 * safezoneW + safezoneX;
			y = 0.426704 * safezoneH + safezoneY;
			w = 0.0511458 * safezoneW;
			h = 0.0355555 * safezoneH;
		};

		class SonyPlaque : Life_RscPicture {
			idc = 33155;
			text = "\ALF_Client2\textures\Sony\Sony_Plaque.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyPlaque1Edit : Life_RscEdit {
			idc = 33156;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.276666 * safezoneW + safezoneX;
			y = 0.398222 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class SonyPlaque2Edit : Life_RscEdit {
			idc = 33157;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.301562 * safezoneW + safezoneX;
			y = 0.398148 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class SonyPlaque3Edit : Life_RscEdit {
			idc = 33158;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.335417 * safezoneW + safezoneX;
			y = 0.398149 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class SonyPlaque4Edit : Life_RscEdit {
			idc = 33159;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.359375 * safezoneW + safezoneX;
			y = 0.398148 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class SonyPlaque5Edit : Life_RscEdit {
			idc = 33160;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.383854 * safezoneW + safezoneX;
			y = 0.398148 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class SonyPlaque6Edit : Life_RscEdit {
			idc = 33161;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.417708 * safezoneW + safezoneX;
			y = 0.398148 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class SonyPlaque7Edit : Life_RscEdit {
			idc = 33162;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.05;
			style = 0;
			shadow = 0;
			x = 0.443229 * safezoneW + safezoneX;
			y = 0.398148 * safezoneH + safezoneY;
			w = 0.0214583 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class SonyPlaqueBtn : Life_RscButtonInvisible {
			idc = 33163;
			text = "";
			x = 0.654167 * safezoneW + safezoneX;
			y = 0.475 * safezoneH + safezoneY;
			w = 0.0594792 * safezoneW;
			h = 0.0272223 * safezoneH;
		};
		class SonyPlaqueTexte : Life_RscStructuredText {
			idc = 33164;
			text = "";
			style = 0;
			x = 0.327083 * safezoneW + safezoneX;
			y = 0.513889 * safezoneH + safezoneY;
			w = 0.392292 * safezoneW;
			h = 0.226296 * safezoneH;
		};

		class SonyMenuBtnTaj : Life_RscButtonInvisible {
			idc = 33165;
			text = "";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class SonyFip : Life_RscPicture {
			idc = 33166;
			text = "\ALF_Client2\textures\Sony\Sony_fip1.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyFipRech : Life_RscEdit {
			idc = 33167;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.275 * safezoneW + safezoneX;
			y = 0.339815 * safezoneH + safezoneY;
			w = 0.152187 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		class SonyFip1BtnRech : Life_RscButtonInvisible {
			idc = 33168;
			text = "";
			x = 0.275 * safezoneW + safezoneX;
			y = 0.376852 * safezoneH + safezoneY;
			w = 0.0636458 * safezoneW;
			h = 0.0281482 * safezoneH;
		};
		class SonyFipText1 : Life_RscStructuredText {
			idc = 33169;
			text = "";
			style = 0;
			x = 0.360937 * safezoneW + safezoneX;
			y = 0.463889 * safezoneH + safezoneY;
			w = 0.0797916 * safezoneW;
			h = 0.0281482 * safezoneH;
		};
		class SonyFipText2 : Life_RscStructuredText {
			idc = 33170;
			text = "";
			style = 0;
			x = 0.275 * safezoneW + safezoneX;
			y = 0.510185 * safezoneH + safezoneY;
			w = 0.152187 * safezoneW;
			h = 0.224445 * safezoneH;
		};
		class SonyFipNameEdit : Life_RscEdit {
			idc = 33171;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.541146 * safezoneW + safezoneX;
			y = 0.418519 * safezoneH + safezoneY;
			w = 0.151666 * safezoneW;
			h = 0.0272223 * safezoneH;
		};
		class SonyFipMotifEdit : Life_RscEdit {
			idc = 33172;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 16;
			shadow = 0;
			x = 0.494792 * safezoneW + safezoneX;
			y = 0.454629 * safezoneH + safezoneY;
			w = 0.19802 * safezoneW;
			h = 0.241112 * safezoneH;
		};
		class SonyFip2BtnRech : Life_RscButtonInvisible {
			idc = 33173;
			text = "";
			x = 0.663021 * safezoneW + safezoneX;
			y = 0.707407 * safezoneH + safezoneY;
			w = 0.0501041 * safezoneW;
			h = 0.0281482 * safezoneH;
		};
		class SonyFipBtnListe : Life_RscButtonInvisible {
			idc = 33174;
			text = "";
			x = 0.665103 * safezoneW + safezoneX;
			y = 0.288889 * safezoneH + safezoneY;
			w = 0.0547916 * safezoneW;
			h = 0.0374075 * safezoneH;
		};
		class SonyFip2 : Life_RscPicture {
			idc = 33175;
			text = "\ALF_Client2\textures\Sony\Sony_fip2.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyFip2lb : Life_RscListBox {
			idc = 33176;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			onLBSelChanged = "[] call ALF_fnc_fipSonyLb;";
			x = 0.275156 * safezoneW + safezoneX;
			y = 0.381667 * safezoneH + safezoneY;
			w = 0.175625 * safezoneW;
			h = 0.347593 * safezoneH;
		};
		class SonyFip2Text : Life_RscStructuredText {
			idc = 33177;
			text = "";
			style = 0;
			x = 0.465416 * safezoneW + safezoneX;
			y = 0.410037 * safezoneH + safezoneY;
			w = 0.240729 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class SonyTaj1 : Life_RscPicture {
			idc = 33178;
			text = "\ALF_Client2\textures\Sony\Sony_taj1.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyTaj1NameEdit : Life_RscEdit {
			idc = 33179;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.352187 * safezoneW + safezoneX;
			y = 0.347408 * safezoneH + safezoneY;
			w = 0.150312 * safezoneW;
			h = 0.0266296 * safezoneH;
		};
		class SonyTaj1cbdelit : Life_Checkbox {
			idc = 33180;
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
			x = 0.301511 * safezoneW + safezoneX;
			y = 0.390926 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		class SonyTaj1cbcrime : Life_Checkbox {
			idc = 33181;
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
			x = 0.433333 * safezoneW + safezoneX;
			y = 0.391667 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		class SonyTaj1LieuEdit : Life_RscEdit {
			idc = 33182;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.308229 * safezoneW + safezoneX;
			y = 0.434815 * safezoneH + safezoneY;
			w = 0.195104 * safezoneW;
			h = 0.0266299 * safezoneH;
		};
		class SonyTaj1DateEdit : Life_RscEdit {
			idc = 33183;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.353646 * safezoneW + safezoneX;
			y = 0.484259 * safezoneH + safezoneY;
			w = 0.149271 * safezoneW;
			h = 0.0266299 * safezoneH;
		};
		class SonyTaj1InfraEdit : Life_RscEdit {
			idc = 33184;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 16;
			shadow = 0;
			x = 0.275521 * safezoneW + safezoneX;
			y = 0.562037 * safezoneH + safezoneY;
			w = 0.227396 * safezoneW;
			h = 0.117371 * safezoneH;
		};
		class SonyTaj1btncreate : Life_RscButtonInvisible {
			idc = 33185;
			text = "";
			x = 0.274999 * safezoneW + safezoneX;
			y = 0.693519 * safezoneH + safezoneY;
			w = 0.0818749 * safezoneW;
			h = 0.0281481 * safezoneH;
		};
		class SonyTaj2 : Life_RscPicture {
			idc = 33186;
			text = "\ALF_Client2\textures\Sony\Sony_taj2.paa";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 1 * safezoneH;
		};
		class SonyTaj2NameEdit : Life_RscEdit {
			idc = 33187;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 0;
			shadow = 0;
			x = 0.352187 * safezoneW + safezoneX;
			y = 0.347408 * safezoneH + safezoneY;
			w = 0.150312 * safezoneW;
			h = 0.0266296 * safezoneH;
		};
		class SonyTaj2btnRech : Life_RscButtonInvisible {
			idc = 33188;
			text = "";
			x = 0.530729 * safezoneW + safezoneX;
			y = 0.346297 * safezoneH + safezoneY;
			w = 0.081562 * safezoneW;
			h = 0.0266296 * safezoneH;
		};
		class SonyTaj2lb : Life_RscListBox {
			idc = 33189;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			onLBSelChanged = "[] call ALF_fnc_lbChangedTajSony;";
			x = 0.276719 * safezoneW + safezoneX;
			y = 0.397407 * safezoneH + safezoneY;
			w = 0.212292 * safezoneW;
			h = 0.311815 * safezoneH;
		};
		class SonyTaj2Text : Life_RscStructuredText {
			idc = 33190;
			text = "";
			style = 16;
			x = 0.500521 * safezoneW + safezoneX;
			y = 0.39637 * safezoneH + safezoneY;
			w = 0.211042 * safezoneW;
			h = 0.313333 * safezoneH;
		};
		class SonyTaj2btnSupr : Life_RscButtonInvisible {
			idc = 33191;
			text = "";
			x = 0.615625 * safezoneW + safezoneX;
			y = 0.714815 * safezoneH + safezoneY;
			w = 0.0956245 * safezoneW;
			h = 0.0266296 * safezoneH;
		};

		class HomeBtn : Life_RscButtonInvisible {
			idc = 33000;
			text = "";
			onButtonClick = "uiNamespace setVariable ['sony',0]; [] call ALF_fnc_menuSony;";
			x = 0.48401 * safezoneW + safezoneX;
			y = 0.744778 * safezoneH + safezoneY;
			w = 0.0209375 * safezoneW;
			h = 0.0235186 * safezoneH;
		};
	};
};
