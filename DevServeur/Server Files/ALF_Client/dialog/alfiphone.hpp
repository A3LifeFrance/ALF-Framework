class ALF_iPhoneMenu_Dialog {
	idd = 56400;
	name= "ALF_iPhoneMenu_Dialog";
	onLoad = "uiNamespace setVariable ['iphonemenu',0]";
	movingEnable = true;
	enableSimulation = false;
	class controlsBackground {};

	class controls {
		class bg1 : Life_RscPicture {
			idc = 564001;
			text = "\ALF_Client2\textures\iPhone\ALF_fond_1.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class bg2 : Life_RscPicture {
			idc = 564002;
			text = "\ALF_Client2\textures\iPhone\ALF_fond_2.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class bg3 : Life_RscPicture {
			idc = 564003;
			text = "\ALF_Client2\textures\iPhone\ALF_fond_3.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class bg4 : Life_RscPicture {
			idc = 564004;
			text = "\ALF_Client2\textures\iPhone\ALF_fond_4.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class bg5 : Life_RscPicture {
			idc = 564005;
			text = "\ALF_Client2\textures\iPhone\ALF_fond_5.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu1sim : Life_RscPicture {
			idc = 56401;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_1.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu1btntel : Life_RscButtonInvisible {
			idc = 564011;
			text = "";
			onButtonClick = "";
			x = 0.597396 * safezoneW + safezoneX;
			y = 0.842593 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0494443 * safezoneH;
		};
		class menu1btnsms : Life_RscButtonInvisible {
			idc = 564012;
			text = "";
			onButtonClick = "";
			x = 0.639583 * safezoneW + safezoneX;
			y = 0.842593 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0494443 * safezoneH;
		};
		class menu1btncontacts : Life_RscButtonInvisible {
			idc = 564013;
			text = "";
			onButtonClick = "";
			x = 0.724479 * safezoneW + safezoneX;
			y = 0.842593 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0494443 * safezoneH;
		};
		class menu1btnreglages : Life_RscButtonInvisible {
			idc = 564014;
			text = "";
			onButtonClick = "";
			x = 0.68125 * safezoneW + safezoneX;
			y = 0.842593 * safezoneH + safezoneY;
			w = 0.02875 * safezoneW;
			h = 0.0494443 * safezoneH;
		};
		class menu1nosim : Life_RscPicture {
			idc = 56402;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_2.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu1nosimOK : Life_RscButtonInvisible {
			idc = 564021;
			text = "";
			onButtonClick = "closeDialog 0;";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0283704 * safezoneH;
		};
		class menu1appelentrant : Life_RscPicture {
			idc = 56403;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_4.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu1appel : Life_RscPicture {
			idc = 56404;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_5.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu1Name : Life_RscStructuredText {
			idc = 564041;
			text = "";
			x = 0.589219 * safezoneW + safezoneX;
			y = 0.416666 * safezoneH + safezoneY;
			w = 0.173385 * safezoneW;
			h = 0.0495556 * safezoneH;
		};
		class menu1Num : Life_RscStructuredText {
			idc = 564042;
			text = "";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.470704 * safezoneH + safezoneY;
			w = 0.137084 * safezoneW;
			h = 0.0320742 * safezoneH;
		};
		class menu1Time : Life_RscStructuredText {
			idc = 564043;
			text = "";
			x = 0.654635 * safezoneW + safezoneX;
			y = 0.506481 * safezoneH + safezoneY;
			w = 0.0469803 * safezoneW;
			h = 0.0228149 * safezoneH;
		};
		class menu1rouge : Life_RscButtonInvisible {
			idc = 564044;
			text = "";
			x = 0.611511 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.0355211 * safezoneW;
			h = 0.0598519 * safezoneH;
		};
		class menu1vert : Life_RscButtonInvisible {
			idc = 564045;
			text = "";
			x = 0.703646 * safezoneW + safezoneX;
			y = 0.794444 * safezoneH + safezoneY;
			w = 0.0355211 * safezoneW;
			h = 0.0598519 * safezoneH;
		};
		class menu1rouge2 : Life_RscButtonInvisible {
			idc = 564046;
			text = "";
			x = 0.657813 * safezoneW + safezoneX;
			y = 0.809259 * safezoneH + safezoneY;
			w = 0.0355211 * safezoneW;
			h = 0.0598519 * safezoneH;
		};
		class menu1volp : Life_RscButtonInvisible {
			idc = 564048;
			text = "";
			x = 0.659375 * safezoneW + safezoneX;
			y = 0.546296 * safezoneH + safezoneY;
			w = 0.0360419 * safezoneW;
			h = 0.0598519 * safezoneH;
		};
		class menu1volm : Life_RscButtonInvisible {
			idc = 564049;
			text = "";
			x = 0.716666  * safezoneW + safezoneX;
			y = 0.54537 * safezoneH + safezoneY;
			w = 0.0360419 * safezoneW;
			h = 0.0598519 * safezoneH;
		};
		class menu2telephone : Life_RscPicture {
			idc = 56405;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_3.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu2btnappel : Life_RscButtonInvisible {
			idc = 564051;
			text = "";
			x = 0.65573 * safezoneW + safezoneX;
			y = 0.786926 * safezoneH + safezoneY;
			w = 0.0370836 * safezoneW;
			h = 0.0589259 * safezoneH;
		};
		class menu2numedit : Life_RscEdit {
			idc = 564052;
			text = "";
			style = 0;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			shadow = 0;
			sizeEx = 0.05;
			x = 0.609896 * safezoneW + safezoneX;
			y = 0.412037 * safezoneH + safezoneY;
			w = 0.126667 * safezoneW;
			h = 0.0367038 * safezoneH;
		};
		class menu3contacts : Life_RscPicture {
			idc = 56406;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_6.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu3contactslist : Life_RscListBox {
			idc = 564061;
			text = "";
			colorText[] = {0,0,0,1};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0.639,0.667,0.706,0.8};
			colorSelectBackground2[] = {0.639,0.667,0.706,0.8};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.065;
			x = 0.583333 * safezoneW + safezoneX;
			y = 0.476852 * safezoneH + safezoneY;
			w = 0.184479 * safezoneW;
			h = 0.398519 * safezoneH;
		};
		class menu3Name : Life_RscStructuredText {
			idc = 564062;
			text = "";
			x = 0.627396 * safezoneW + safezoneX;
			y = 0.421148 * safezoneH + safezoneY;
			w = 0.134479 * safezoneW;
			h = 0.0262963 * safezoneH;
		};
		class menu3Num : Life_RscStructuredText {
			idc = 564063;
			text = "";
			x = 0.627604 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.0881249 * safezoneW;
			h = 0.0216666 * safezoneH;
		};
		class menu3btnadd : Life_RscButtonInvisible {
			idc = 564064;
			text = "";
			x = 0.748958 * safezoneW + safezoneX;
			y = 0.387037 * safezoneH + safezoneY;
			w = 0.0141666 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		class menu3fiche : Life_RscPicture {
			idc = 56407;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_7.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu3fichename : Life_RscStructuredText {
			idc = 564071;
			text = "";
			x = 0.59125 * safezoneW + safezoneX;
			y = 0.40737 * safezoneH + safezoneY;
			w = 0.171458 * safezoneW;
			h = 0.0401853 * safezoneH;
		};
		class menu3fichenum : Life_RscStructuredText {
			idc = 564072;
			text = "";
			x = 0.59177 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0818749 * safezoneW;
			h = 0.0198147 * safezoneH;
		};
		class menu3fichebtnsms : Life_RscButtonInvisible {
			idc = 564073;
			text = "";
			x = 0.731251 * safezoneW + safezoneX;
			y = 0.472222 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.0225924 * safezoneH;
		};
		class menu3fichebtnappel : Life_RscButtonInvisible {
			idc = 564074;
			text = "";
			x = 0.747917 * safezoneW + safezoneX;
			y = 0.473148 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.0225924 * safezoneH;
		};
		class menu3fichebtnsms2 : Life_RscButtonInvisible {
			idc = 564075;
			text = "";
			x = 0.593229 * safezoneW + safezoneX;
			y = 0.63426 * safezoneH + safezoneY;
			w = 0.0704167 * safezoneW;
			h = 0.0235183 * safezoneH;
		};
		class menu3fichebtnfiche : Life_RscButtonInvisible {
			idc = 564076;
			text = "";
			x = 0.59375 * safezoneW + safezoneX;
			y = 0.696741 * safezoneH + safezoneY;
			w = 0.0704167 * safezoneW;
			h = 0.0235183 * safezoneH;
		};
		class menu3retour : Life_RscButtonInvisible {
			idc = 564077;
			text = "";
			x = 0.585416 * safezoneW + safezoneX;
			y = 0.380555 * safezoneH + safezoneY;
			w = 0.0641666 * safezoneW;
			h = 0.0124072 * safezoneH;
		};
		class menu3addcontact : Life_RscPicture {
			idc = 56408;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_8.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu3addname : Life_RscEdit {
			idc = 564081;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.025;
			style = 0;
			shadow = 0;
			x = 0.642708 * safezoneW + safezoneX;
			y = 0.40463 * safezoneH + safezoneY;
			w = 0.121458 * safezoneW;
			h = 0.0207404 * safezoneH;
		};
		class menu3addnum : Life_RscEdit {
			idc = 564082;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.025;
			style = 0;
			shadow = 0;
			x = 0.651562 * safezoneW + safezoneX;
			y = 0.436112 * safezoneH + safezoneY;
			w = 0.112604 * safezoneW;
			h = 0.0188886 * safezoneH;
		};
		class menu3btnOK : Life_RscButtonInvisible {
			idc = 564083;
			text = "";
			x = 0.755208 * safezoneW + safezoneX;
			y = 0.381482 * safezoneH + safezoneY;
			w = 0.0105209 * safezoneW;
			h = 0.013333 * safezoneH;
		};
		class menu3btnannuler : Life_RscButtonInvisible {
			idc = 564084;
			text = "";
			x = 0.586614 * safezoneW + safezoneX;
			y = 0.380852 * safezoneH + safezoneY;
			w = 0.0261458 * safezoneW;
			h = 0.013333 * safezoneH;
		};
		class menuNewMessage : Life_RscPicture {
			idc = 56409;
			text = "\ALF_Client2\textures\iPhone\ALF_iPhone_9.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menuNMbtnannuler : Life_RscButtonInvisible {
			idc = 564091;
			text = "";
			x = 0.732031 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.031875 * safezoneW;
			h = 0.0151852 * safezoneH;
		};
		class menuNMnumedit : Life_RscEdit {
			idc = 564092;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 16;
			shadow = 0;
			x = 0.60625 * safezoneW + safezoneX;
			y = 0.422222 * safezoneH + safezoneY;
			w = 0.155312 * safezoneW;
			h = 0.0198149 * safezoneH;
		};
		class menuNMnum : Life_RscStructuredText {
			idc = 564093;
			text = "";
			x = 0.60625 * safezoneW + safezoneX;
			y = 0.422222 * safezoneH + safezoneY;
			w = 0.155312 * safezoneW;
			h = 0.0198149 * safezoneH;
		};
		class menuNMsmsedit : Life_RscEdit {
			idc = 564094;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.035;
			style = 16;
			shadow = 0;
			x = 0.588021 * safezoneW + safezoneX;
			y = 0.608333 * safezoneH + safezoneY;
			w = 0.137083 * safezoneW;
			h = 0.278148 * safezoneH;
		};
		class menuNMbtnenvoyer : Life_RscButtonInvisible {
			idc = 564095;
			text = "";
			x = 0.728645 * safezoneW + safezoneX;
			y = 0.733334 * safezoneH + safezoneY;
			w = 0.0370829 * safezoneW;
			h = 0.018889 * safezoneH;
		};
		class iPhoneDate : Life_RscStructuredText {
			idc = 564000;
			text = "";
			x = 0.66198 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0124074 * safezoneH;
		};
		class MutePic : Life_RscPicture {
			idc = 564096;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_appel_1.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class MuteBtn : Life_RscButtonInvisible {
			idc = 564097;
			text = "";
			x = 0.601042 * safezoneW + safezoneX;
			y = 0.54537 * safezoneH + safezoneY;
			w = 0.0365625 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class SpeackersPic : Life_RscPicture {
			idc = 564098;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_appel_2.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class SpeackersBtn : Life_RscButtonInvisible {
			idc = 564099;
			text = "";
			x = 0.59948 * safezoneW + safezoneX;
			y = 0.638888 * safezoneH + safezoneY;
			w = 0.0365625 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class menu5 : Life_RscPicture {
			idc = 565050;
			text = "\ALF_Client2\textures\iPhone\ALF_iphone_10.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu5_btn1 : Life_RscPicture {
			idc = 565053;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_reglages_OFF1.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu5_btn2 : Life_RscPicture {
			idc = 565052;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_reglages_ON1.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu5_btn3 : Life_RscPicture {
			idc = 565059;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_reglages_OFF2.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu5_btn4 : Life_RscPicture {
			idc = 565058;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_reglages_ON2.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu5_Anonbtn : Life_RscButtonInvisible {
			idc = 565051;
			text = "";
			x = 0.722708 * safezoneW + safezoneX;
			y = 0.448963 * safezoneH + safezoneY;
			w = 0.0356771 * safezoneW;
			h = 0.0303333 * safezoneH;
		};
		class menu5_viberbtn : Life_RscButtonInvisible {
			idc = 565060;
			text = "";
			x = 0.722916 * safezoneW + safezoneX;
			y = 0.488889 * safezoneH + safezoneY;
			w = 0.0356771 * safezoneW;
			h = 0.0303333 * safezoneH;
		};
		class menu5_febtn : Life_RscButtonInvisible {
			idc = 565055;
			text = "";
			x = 0.583854 * safezoneW + safezoneX;
			y = 0.531481 * safezoneH + safezoneY;
			w = 0.183437 * safezoneW;
			h = 0.0281481 * safezoneH;
		};
		class menu5_ringbtn : Life_RscButtonInvisible {
			idc = 565057;
			text = "";
			x = 0.572223 * safezoneW + safezoneX;
			y = 0.572223 * safezoneH + safezoneY;
			w = 0.183437 * safezoneW;
			h = 0.0281481 * safezoneH;
		};
		class menu5_fetext : Life_RscStructuredText {
			idc = 565054;
			text = "";
			x = 0.681354 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0855208 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		class menu5_ringtext : Life_RscStructuredText {
			idc = 565056;
			text = "";
			x = 0.68125 * safezoneW + safezoneX;
			y = 0.574074 * safezoneH + safezoneY;
			w = 0.0855208 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		class menu5_avionbtn : Life_RscButtonInvisible {
			idc = 565061;
			text = "";
			x = 0.738541 * safezoneW + safezoneX;
			y = 0.612037 * safezoneH + safezoneY;
			w = 0.0219791 * safezoneW;
			h = 0.0290741 * safezoneH;
		};
		class menu5_btn5 : Life_RscPicture {
			idc = 565062;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_reglages_OFF3.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu5_btn6 : Life_RscPicture {
			idc = 565063;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_reglages_ON3.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu_radio : Life_RscPicture {
			idc = 58256;
			text = "\ALF_Client2\textures\iPhone\ALF_iphone_radio_1.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu_radio_pic1 : Life_RscPicture {
			idc = 582500;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_radio_1.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu_radio_pic2 : Life_RscPicture {
			idc = 582501;
			text = "\ALF_Client2\textures\iPhone\ALF_bouton_radio_2.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu_radio_btn1 : Life_RscButtonInvisible {
			idc = 582502;
			text = "";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.0975 * safezoneW;
			h = 0.0265186 * safezoneH;
		};
		class menu_radio_btn2 : Life_RscButtonInvisible {
			idc = 582503;
			text = "";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.0975 * safezoneW;
			h = 0.0265186 * safezoneH;
		};
		class menu_radio_app : Life_RscButtonInvisible {
			idc = 582504;
			text = "";
			x = 0.723282 * safezoneW + safezoneX;
			y = 0.378074 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.0622963 * safezoneH;
		};
		class menu_radio_edit : Life_RscEdit {
			idc = 582505;
			text = "";
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.1;
			style = 2;
			shadow = 0;
			x = 0.592708 * safezoneW + safezoneX;
			y = 0.548148 * safezoneH + safezoneY;
			w = 0.164167 * safezoneW;
			h = 0.0966667 * safezoneH;
		};
		class menu_radio_text : Life_RscStructuredText {
			idc = 582506;
			text = "";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class menu_radio_volp : Life_RscButtonInvisible {
			idc = 582507;
			text = "";
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class menu_radio_volm : Life_RscButtonInvisible {
			idc = 582508;
			text = "";
			x = 0.680469 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class menu6pic : Life_RscPicture {
			idc = 682560;
			text = "\ALF_Client2\textures\iPhone\ALF_iphone_11.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu6smslist : Life_RscListBox {
			idc = 682561;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0,0,0,1};
			colorSelectBackground2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.04;
			onLBSelChanged = "[] call ALF_fnc_lbChangedSmsiPhone;";
			x = 0.58401 * safezoneW + safezoneX;
			y = 0.413852 * safezoneH + safezoneY;
			w = 0.183437 * safezoneW;
			h = 0.146667 * safezoneH;
		};
		class menu6smsview : Life_RscStructuredText {
			idc = 682562;
			text = "";
			x = 0.583855 * safezoneW + safezoneX;
			y = 0.561111 * safezoneH + safezoneY;
			w = 0.182916 * safezoneW;
			h = 0.267037 * safezoneH;
		};
		class menu6_btnnew : Life_RscButtonInvisible {
			idc = 682563;
			text = "";
			x = 0.721198 * safezoneW + safezoneX;
			y = 0.385481 * safezoneH + safezoneY;
			w = 0.0459369 * safezoneW;
			h = 0.0235184 * safezoneH;
		};
		class menu6_btnrep : Life_RscButtonInvisible {
			idc = 682564;
			text = "";
			x = 0.588021 * safezoneW + safezoneX;
			y = 0.834259 * safezoneH + safezoneY;
			w = 0.0459369 * safezoneW;
			h = 0.0235184 * safezoneH;
		};
		class menu6_btndel : Life_RscButtonInvisible {
			idc = 682565;
			text = "";
			x = 0.719791 * safezoneW + safezoneX;
			y = 0.837963 * safezoneH + safezoneY;
			w = 0.0459369 * safezoneW;
			h = 0.0235184 * safezoneH;
		};
		class menu8_recent : Life_RscPicture {
			idc = 682566;
			text = "\ALF_Client2\textures\iPhone\ALF_iphone_12.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.454324 * safezoneW;
			h = 0.766407 * safezoneH;
		};
		class menu8_recentlb : Life_RscListBox {
			idc = 682567;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorSelectBackground[] = {0,0,0,1};
			colorSelectBackground2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			font = "HelveticaNeueLTStdLt";
			sizeEx = 0.04;
			x = 0.583854 * safezoneW + safezoneX;
			y = 0.414815 * safezoneH + safezoneY;
			w = 0.183958 * safezoneW;
			h = 0.414259 * safezoneH;
		};
		class HomeBtn : Life_RscButtonInvisible {
			idc = -1;
			text = "";
			onButtonClick = "uiNamespace setVariable ['iphonemenu',0]; [] call ALF_fnc_menuiPhone;";
			x = 0.661458 * safezoneW + safezoneX;
			y = 0.921704 * safezoneH + safezoneY;
			w = 0.0282295 * safezoneW;
			h = 0.0468889 * safezoneH;
		};
	};
};