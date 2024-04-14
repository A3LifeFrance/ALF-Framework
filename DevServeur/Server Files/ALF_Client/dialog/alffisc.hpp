class ALF_FISC_Dialog {
	idd = 18540;
	name= "ALF_FISC_Dialog";
	movingEnable = false;
	enableSimulation = true;
	onUnload = "[8] call ALF_fnc_dialogFisc";
	class controlsBackground {
		class BricoMenu: Life_RscPicture {
			text = "\ALF_Client2\textures\Business\fisc.paa";
			idc = -1;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.836 * safezoneH;
		};
	};

	class controls {
		class Filtre1: Life_RscCombo {
			idc = 18541;
			onLBSelChanged = "[3,_this select 1] call ALF_fnc_dialogFisc";
			colorText[] = {0, 0, 0, 1};
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Filtre2: Life_RscCombo {
			idc = 18542;
			onLBSelChanged = "[4,_this select 1] call ALF_fnc_dialogFisc";
			colorText[] = {0, 0, 0, 1};
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ListBox: Life_RscListBox {
			idc = 18543;
			onLBSelChanged = "[7,_this select 1] call ALF_fnc_dialogFisc";
			sizeEx = 0.035;
			colorText[] = {0, 0, 0, 1};
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.297 * safezoneH;
		};

		class ControlGroup1: Life_RscControlsGroupNoHorizontalScrollbars {
			idc = 18544;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.363 * safezoneH;

      class Controls {
				class Text: Life_RscStructuredText {
					idc = 18545;
					colorText[] = {0, 0, 0, 1};
					sizeEx = 0.005;
					x = 0;
					y = 0;
					w = 0.221719 * safezoneW;
					h = 0;
				};
   		};
    };

		class Capital: Life_RscStructuredText {
			idc = 18546;
			colorText[] = {0, 0, 0, 1};
			sizeEx = 0.005;
			x = 0.489062 * safezoneW + safezoneX;
			y = 0.760185 * safezoneH + safezoneY;
			w = 0.211042 * safezoneW;
			h = 0.0253704 * safezoneH;
		};
	};
};
