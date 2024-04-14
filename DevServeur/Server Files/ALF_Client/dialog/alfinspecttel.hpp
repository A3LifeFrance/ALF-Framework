class ALF_Inspect_Tel {
  idd = 754720;
  movingEnable = 0;
  enableSimulation = 1;
  onUnload = "if !(ALF_InspectTelMarker isEqualTo """") then {deleteMarkerLocal ALF_InspectTelMarker;};ALF_InspectTelMarker = """";ALF_InspectTelTarget = objNull;";

  class controlsBackground {
    class life_RscTitleBackground: Life_RscText    {
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
      idc = -1;
      x = 0.335 * safezoneW + safezoneX;
      y = 0.335 * safezoneH + safezoneY;
      w = 0.4 * safezoneW;
      h = 0.022 * safezoneH;
    };

    class MainBackground: Life_RscText {
      colorBackground[] = {0,0,0,0.7};
      idc = -1;
      x = 0.335 * safezoneW + safezoneX;
      y = 0.3592 * safezoneH + safezoneY;
      w = 0.4 * safezoneW;
      h = 0.4 * safezoneH;
    };

    class TitreGlobale: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Menu Localisation Telephonique";
      x = 0.334322 * safezoneW + safezoneX;
      y = 0.336111 * safezoneH + safezoneY;
      w = 0.4 * safezoneW;
      h = 0.022 * safezoneH;
    };

    class TitreNumero: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Numero :";
      x = 0.335938 * safezoneW + safezoneX;
      y = 0.364815 * safezoneH + safezoneY;
      w = 0.13375 * safezoneW;
      h = 0.022 * safezoneH;
    };

    class TitreHistorique: Life_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = -1;
      text = "Historique :";
      x = 0.336979 * safezoneW + safezoneX;
      y = 0.436111 * safezoneH + safezoneY;
      w = 0.121771 * safezoneW;
      h = 0.0173704 * safezoneH;
    };

    class MapView : Life_RscMapControl {
		idc = 754721;
		x = 0.46927 * safezoneW + safezoneX;
		y = 0.366667 * safezoneH + safezoneY;
		w = 0.261562 * safezoneW;
		h = 0.382778 * safezoneH;
		maxSatelliteAlpha = 0.75;//0.75;
		alphaFadeStartScale = 1.15;//0.15;
		alphaFadeEndScale = 1.29;//0.29;
    };
  };

  class controls {
    class HistoriqueListe: Life_RscListBox {
		idc = 754722;
		text = "";
		sizeEx = 0.035;
		onLBSelChanged = "[3] call ALF_fnc_menuInspectTel;";
		x = 0.340104 * safezoneW + safezoneX;
    	y = 0.458333 * safezoneH + safezoneY;
    	w = 0.1225 * safezoneW;
    	h = 0.276296 * safezoneH;
    };

    class NumeroEdit: Life_RscEdit {
		idc = 754723;
		sizeEx = 0.036;
		text = "";
		x = 0.338542 * safezoneW + safezoneX;
    	y = 0.390741 * safezoneH + safezoneY;
    	w = 0.125625 * safezoneW;
    	h = 0.0216667 * safezoneH;
    };

    class OKButton: Life_RscButtonMenu {
		idc = -1;
		text = "VALIDER";
		onButtonClick = "[1] call ALF_fnc_menuInspectTel;";
		x = 0.334896 * safezoneW + safezoneX;
    	y = 0.759259 * safezoneH + safezoneY;
    	w = 0.0644531 * safezoneW;
    	h = 0.022 * safezoneH;
	};
	
	class CloseButtonKey: Life_RscButtonMenu {
		idc = -1;
		text = "$STR_Global_Close";
		onButtonClick = "closeDialog 0; ";
		x = 0.334896 * safezoneW + safezoneX;
    	y = 0.792259 * safezoneH + safezoneY;
    	w = 0.0644531 * safezoneW;
    	h = 0.022 * safezoneH;
	};
  };
};

class ALF_SR_SMS_Tel {
	idd = 754721;
	movingEnable = 0;
	enableSimulation = 1;
	onUnload = "ALF_InspectTelTarget = objNull;";

	class controlsBackground {
		class life_RscTitleBackground: Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MainBackground: Life_RscText {
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.3592 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.4 * safezoneH;
		};

		class TitreGlobale: Life_RscTitle {
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Menu Historique SMS";
			x = 0.334322 * safezoneW + safezoneX;
			y = 0.336111 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TitreNumero: Life_RscTitle {
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Numero :";
			x = 0.335938 * safezoneW + safezoneX;
			y = 0.364815 * safezoneH + safezoneY;
			w = 0.13375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TitreHistorique: Life_RscTitle {
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Historique :";
			x = 0.336979 * safezoneW + safezoneX;
			y = 0.436111 * safezoneH + safezoneY;
			w = 0.121771 * safezoneW;
			h = 0.0173704 * safezoneH;
		};

		class SMSText : Life_RscStructuredText {
			idc = 754724;
			x = 0.46927 * safezoneW + safezoneX;
			y = 0.366667 * safezoneH + safezoneY;
			w = 0.261562 * safezoneW;
			h = 0.382778 * safezoneH;
		};
	 };

	class controls {
		class HistoriqueListe: Life_RscListBox {
			idc = 754722;
			text = "";
			sizeEx = 0.035;
			x = 0.340104 * safezoneW + safezoneX;
			y = 0.458333 * safezoneH + safezoneY;
			w = 0.1225 * safezoneW;
			h = 0.276296 * safezoneH;
			onLBSelChanged = "[3] call ALF_fnc_menuSMSSR;";
		};

		class NumeroEdit: Life_RscEdit {
			idc = 754723;
			sizeEx = 0.036;
			text = "";
			x = 0.338542 * safezoneW + safezoneX;
			y = 0.390741 * safezoneH + safezoneY;
			w = 0.125625 * safezoneW;
			h = 0.0216667 * safezoneH;
		};
		
		class OKButton: Life_RscButtonMenu {
			idc = -1;
			text = "VALIDER";
			onButtonClick = "[1,ctrlText 754723] call ALF_fnc_menuSMSSR;";
			x = 0.334896 * safezoneW + safezoneX;
			y = 0.759259 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; ";
			x = 0.334896 * safezoneW + safezoneX;
			y = 0.792259 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class RscHcamDialog {
	idd = 754722;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad="uiNamespace setVariable [""hcam_ui_disp"", _this select 0];uiNamespace setVariable [""hcam_ctrl_pip"", (_this select 0) displayCtrl 0];";
	
	class controls { 
		class life_RscTitleBackground: Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MainBackground: Life_RscText {
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.3592 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.4 * safezoneH;
		};

		class TitreGlobale: Life_RscTitle {
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Caméra discrète";
			x = 0.334322 * safezoneW + safezoneX;
			y = 0.336111 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RscHcamCam: RscPicture {
			idc = 754723;
			type = 0;
			style = 48;
			text = "";
			x = 0.46927 * safezoneW + safezoneX;
			y = 0.366667 * safezoneH + safezoneY;
			w = 0.261562 * safezoneW;
			h = 0.382778 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0, 0, 0, 0.3};
			font = "TahomaB";
			sizeEx = 0;
			lineSpacing = 0;
			fixedWidth = 0;
			shadow = 0;
		};
		class HistoriqueListe: Life_RscListBox {
			idc = 754724;
			text = "";
			sizeEx = 0.035;
			x = 0.340104 * safezoneW + safezoneX;
			y = 0.458333 * safezoneH + safezoneY;
			w = 0.1225 * safezoneW;
			h = 0.276296 * safezoneH;
			onLBSelChanged = "[3] call ;";
		};
		class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; ";
			x = 0.334896 * safezoneW + safezoneX;
			y = 0.792259 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};