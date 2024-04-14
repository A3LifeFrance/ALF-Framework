/*
	Author: ALF Team
	File: hud_stats.hpp

*/
class RSC_DOXP
{
	idd = 783278;
	fadein=1;
  fadeout=1;
	duration = 2;
	name="RSC_DOXP";
	onLoad="uiNamespace setVariable ['RSC_DOXP',_this select 0]";
	objects[]={};
	class controls {
		class alf_popup_text1 : Life_RscStructuredText {
			idc = 255465;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.005 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx=0.035;
			text="";
		};
	};
};

class RSC_BFMC
{
	idd = 8738;
	fadein=1;
  fadeout=1;
	duration = 30;
	name="RSC_BFMC";
	onLoad="uiNamespace setVariable ['RSC_BFMC',_this select 0]";
	objects[]={};
	class controlsBackground {
		class picid: Life_RscPicture {
			text = "\ALF_Client2\textures\BFM\bfm1.paa";
			idc = -1;
			x = -0.0723438 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.528 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text1 : Life_RscStructuredText
		{
			type=13;
			idc=14570;
			x = 0.0432292 * safezoneW + safezoneX;
			y = 0.696296 * safezoneH + safezoneY;
			w = 0.11 * safezoneW;
			h = 0.0235185 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text2 : Life_RscStructuredText
		{
			type=13;
			idc=14571;
			x = 0.0625 * safezoneW + safezoneX;
			y = 0.722222 * safezoneH + safezoneY;
			w = 0.0907291 * safezoneW;
			h = 0.0225926 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text3 : Life_RscStructuredText
		{
			type=13;
			idc=14572;
			x = 0.0114584 * safezoneW + safezoneX;
			y = 0.752778 * safezoneH + safezoneY;
			w = 0.14177 * safezoneW;
			h = 0.201296 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_BFMO
{
	idd = 1877876387;
	fadein=1;
  fadeout=1;
	duration = 30;
	name="RSC_BFMO";
	onLoad="uiNamespace setVariable ['RSC_BFMO',_this select 0]";
	objects[]={};
	class controlsBackground {
		class picid: Life_RscPicture {
			text = "\ALF_Client2\textures\BFM\bfm2.paa";
			idc = -1;
			x = -0.0723438 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.528 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text1 : Life_RscStructuredText
		{
			type=13;
			idc=14580;
			x = 0.0119792 * safezoneW + safezoneX;
			y = 0.69537 * safezoneH + safezoneY;
			w = 0.141771 * safezoneW;
			h = 0.0364814 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text2 : Life_RscStructuredText
		{
			type=13;
			idc=14581;
			x = 0.0119792 * safezoneW + safezoneX;
			y = 0.736111 * safezoneH + safezoneY;
			w = 0.14177 * safezoneW;
			h = 0.222592 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_SHOWP
{
	idd = 5737733838;
	fadein=1;
  fadeout=1;
	duration = 15;
	name="RSC_SHOWP";
	onLoad="uiNamespace setVariable ['RSC_SHOWP',_this select 0]";
	objects[]={};
	class controlsBackground {
		class picp: Life_RscPicture {
			text = "\ALF_Client2\textures\showP.paa";
			idc = -1;
			x = 0.262812 * safezoneW + safezoneX;
			y = -0.171 * safezoneH + safezoneY;
			w = 0.479531 * safezoneW;
			h = 0.803 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text1 : Life_RscStructuredText
		{
			type=13;
			idc=12340;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.099 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text2 : Life_RscStructuredText
		{
			type=13;
			idc=12341;
			x = 0.55677 * safezoneW + safezoneX;
			y = 0.152778 * safezoneH + safezoneY;
			w = 0.118698 * safezoneW;
			h = 0.0341852 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text3 : Life_RscStructuredText
		{
			type=13;
			idc=12342;
			x = 0.55677 * safezoneW + safezoneX;
			y = 0.202778 * safezoneH + safezoneY;
			w = 0.118698 * safezoneW;
			h = 0.0341852 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text4 : Life_RscStructuredText
		{
			type=13;
			idc=12343;
			x = 0.55677 * safezoneW + safezoneX;
			y = 0.254629 * safezoneH + safezoneY;
			w = 0.118698 * safezoneW;
			h = 0.0341852 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text5 : Life_RscStructuredText
		{
			type=13;
			idc=12344;
			x = 0.55677 * safezoneW + safezoneX;
			y = 0.305555 * safezoneH + safezoneY;
			w = 0.118698 * safezoneW;
			h = 0.0341852 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text6 : Life_RscStructuredText
		{
			type=13;
			idc=12345;
			x = 0.55677 * safezoneW + safezoneX;
			y = 0.363889 * safezoneH + safezoneY;
			w = 0.118698 * safezoneW;
			h = 0.0341852 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_SHOWID
{
	idd = 3733837783737;
	fadein=1;
  fadeout=1;
	duration = 15;
	name="RSC_SHOWID";
	onLoad="uiNamespace setVariable ['RSC_SHOWID',_this select 0]";
	objects[]={};
	class controlsBackground {
		class picid: Life_RscPicture {
			text = "\ALF_Client2\textures\showID.paa";
			idc = -1;
			x = 0.365937 * safezoneW + safezoneX;
			y = -0.05 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.418 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text1 : Life_RscStructuredText
		{
			type=13;
			idc=13460;
			x = 0.490104 * safezoneW + safezoneX;
			y = 0.0527778 * safezoneH + safezoneY;
			w = 0.0748959 * safezoneW;
			h = 0.0127407 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text2 : Life_RscStructuredText
		{
			type=13;
			idc=13461;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
		class alf_popup_text3 : Life_RscStructuredText
		{
			type=13;
			idc=13462;
			x = 0.382448 * safezoneW + safezoneX;
			y = 0.261704 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.0210741 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCALLPOPUP
{
	idd = 7786873783;
	fadein=1;
  fadeout=1;
	duration = 4;
	name="RSC_DOCALLPOPUP";
	onLoad="uiNamespace setVariable ['RSC_DOCALLPOPUP',_this select 0]";
	objects[]={};
	class controlsBackground {
	};
	class controls
	{
		class alf_popup_text_basic7
		{
			type=13;
			style=0x0c+0x02;
			idc=13451;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.352 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOGPS
{
	idd = 86873453;
	fadein=1;
	fadeout=1;
	duration = 6;
	name="RSC_DOGPS";
	onLoad="uiNamespace setVariable ['RSC_DOGPS',_this select 0]";
	class controlsBackground {
	};
	class controls
	{
		class alf_popup_text_basic7 : Life_RscStructuredText
		{
			idc=13450;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.352 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG7
{
	idd = 768737;
	fadein=1;
  fadeout=1;
	duration = 4;
	name="RSC_DOMSG7";
	onLoad="uiNamespace setVariable ['RSC_DOMSG7',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_info.paa";
			idc = 133771;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic7
		{
			type=13;
			style=0x0c+0x02;
			idc=13377;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.162704 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG6
{
	idd = 7687387;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG6";
	onLoad="uiNamespace setVariable ['RSC_DOMSG6',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_info.paa";
			idc = 133761;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic6
		{
			type=CT_STRUCTURED_TEXT;
			idc=13376;
			style=ST_LEFT;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.637037 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG5
{
	idd = 787678;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG5";
	onLoad="uiNamespace setVariable ['RSC_DOMSG5',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_info.paa";
			idc = 133751;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic5
		{
			type=CT_STRUCTURED_TEXT;
			idc=13375;
			style=ST_LEFT;
			x = 0.0359377 * safezoneW + safezoneX;
			y = 0.560185 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG4
{
	idd = 435737;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG4";
	onLoad="uiNamespace setVariable ['RSC_DOMSG4',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_info.paa";
			idc = 133741;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic4
		{
			type=CT_STRUCTURED_TEXT;
			idc=13374;
			style=ST_LEFT;
			x = 0.0359371 * safezoneW + safezoneX;
			y = 0.482408 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG3
{
	idd = 76837;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG3";
	onLoad="uiNamespace setVariable ['RSC_DOMSG3',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_info.paa";
			idc = 133731;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic3
		{
			type=CT_STRUCTURED_TEXT;
			idc=13373;
			style=ST_LEFT;
			x = 0.035937 * safezoneW + safezoneX;
			y = 0.405555 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG2
{
	idd = 7868387;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG2";
	onLoad="uiNamespace setVariable ['RSC_DOMSG2',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_info.paa";
			idc = 133721;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic2
		{
			type=CT_STRUCTURED_TEXT;
			idc=13372;
			style=ST_LEFT;
			x = 0.0359378 * safezoneW + safezoneX;
			y = 0.327778 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG1
{
	idd = 7683543;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG1";
	onLoad="uiNamespace setVariable ['RSC_DOMSG1',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_info.paa";
			idc = 133711;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic1
		{
			type=CT_STRUCTURED_TEXT;
			idc=13371;
			style=ST_LEFT;
			x = 0.0359372 * safezoneW + safezoneX;
			y = 0.250926 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOSMS4
{
	idd = 789542315;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOSMS4";
	onLoad="uiNamespace setVariable ['RSC_DOSMS4',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_sms.paa";
			idc = 133334;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.428 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic4
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333341;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOSMS3
{
	idd = 8758737;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOSMS3";
	onLoad="uiNamespace setVariable ['RSC_DOSMS3',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_sms.paa";
			idc = 133333;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.527 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic3
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333331;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOSMS2
{
	idd = 47324338;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOSMS2";
	onLoad="uiNamespace setVariable ['RSC_DOSMS2',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_sms.paa";
			idc = 133332;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic2
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333321;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOSMS1
{
	idd = 786321354;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOSMS1";
	onLoad="uiNamespace setVariable ['RSC_DOSMS1',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_sms.paa";
			idc = 133331;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic1
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333311;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMEDCALL4
{
	idd = 86735345;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMEDCALL4";
	onLoad="uiNamespace setVariable ['RSC_DOMEDCALL4',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_medcall.paa";
			idc = 169334;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.428 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic4
		{
			type=CT_STRUCTURED_TEXT;
			idc=1693341;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMEDCALL3
{
	idd = 12334568;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMEDCALL3";
	onLoad="uiNamespace setVariable ['RSC_DOMEDCALL3',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_medcall.paa";
			idc = 169333;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.527 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic3
		{
			type=CT_STRUCTURED_TEXT;
			idc=1693331;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMEDCALL2
{
	idd = 7842546;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMEDCALL2";
	onLoad="uiNamespace setVariable ['RSC_DOMEDCALL2',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_medcall.paa";
			idc = 169332;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic2
		{
			type=CT_STRUCTURED_TEXT;
			idc=1693321;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMEDCALL1
{
	idd = 76753453;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMEDCALL1";
	onLoad="uiNamespace setVariable ['RSC_DOMEDCALL1',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_medcall.paa";
			idc = 169331;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic1
		{
			type=CT_STRUCTURED_TEXT;
			idc=1693311;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCOPCALL4
{
	idd = 5768737;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOCOPCALL4";
	onLoad="uiNamespace setVariable ['RSC_DOCOPCALL4',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_copcall.paa";
			idc = 133334;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.428 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic4
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333341;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCOPCALL3
{
	idd = 56876373;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOCOPCALL3";
	onLoad="uiNamespace setVariable ['RSC_DOCOPCALL3',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_copcall.paa";
			idc = 133333;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.527 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic3
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333331;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCOPCALL2
{
	idd = 789417;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOCOPCALL2";
	onLoad="uiNamespace setVariable ['RSC_DOCOPCALL2',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_copcall.paa";
			idc = 133332;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic2
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333321;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCOPCALL1
{
	idd = 7865345;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOCOPCALL1";
	onLoad="uiNamespace setVariable ['RSC_DOCOPCALL1',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client2\textures\header_copcall.paa";
			idc = 133331;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic1
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333311;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class pokerHUD {
	idd = 544150;
	duration = 10e10;
	movingEnable = 0;
	fadein = 1;
	fadeout = 1;
	name = "pokerHUD";
	onLoad = "uiNamespace setVariable ['pokerHUD',_this select 0]";
	objects[] = {};

	class controls {
		class carte1 : Life_RscPicture {
			idc = 544151;
			text = "";
			x = 0.00994998 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0902083 * safezoneW;
			h = 0.34852 * safezoneH;
		};
		class carte2 : Life_RscPicture {
			idc = 544152;
			text = "";
			x = 0.106269 * safezoneW + safezoneX;
			y = 0.6749 * safezoneH + safezoneY;
			w = 0.0902083 * safezoneW;
			h = 0.34852 * safezoneH;
		};
	};
};

class playerHUD {
	idd = 96315542;
	duration = 10e10;
	movingEnable = 0;
	fadein = 1;
	fadeout = 1;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};

	class controls {

		class ALF_EarPlug {
			type=CT_STRUCTURED_TEXT;
			idc = 11108;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Tfr {
			type=CT_STRUCTURED_TEXT;
			idc = 11109;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Health {
			type=CT_STRUCTURED_TEXT;
			idc = 11110;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Drink {
			type=CT_STRUCTURED_TEXT;
			idc = 11111;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Food {
			type=CT_STRUCTURED_TEXT;
			idc = 11112;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_CallOff {
			type=CT_STRUCTURED_TEXT;
			idc = 11113;
			fadein=1;
			fadeout=1;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Sms {
			type=CT_STRUCTURED_TEXT;
			idc = 11114;
			fadein=1;
			fadeout=1;
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_ViberMode {
			type=CT_STRUCTURED_TEXT;
			idc = 11115;
			fadein=1;
			fadeout=1;
			x = 0.881562 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_InCall {
			type=CT_STRUCTURED_TEXT;
			idc = 11116;
			fadein=1;
			fadeout=1;
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		class ALF_Anonyme {
			type=CT_STRUCTURED_TEXT;
			idc = 11117;
			fadein=1;
			fadeout=1;
			x = 0.922813 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Bracelet {
			type=CT_STRUCTURED_TEXT;
			idc = 11118;
			fadein=1;
			fadeout=1;
			x = 0.703 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
	};
};
