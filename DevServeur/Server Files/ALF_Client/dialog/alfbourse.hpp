class alfboursebase {
	idd = 17100;
	name= "alf_bourse_base";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {sleep 1;[] call ALF_fnc_loadlbPrice;};";

	class controlsBackground {

	};

	class controls {

		class BourseFrame: Life_RscText
		{
			idc = 17050;

			x = 0.276563 * safezoneW + safezoneX;
			y = 0.390043 * safezoneH + safezoneY;
			w = 0.446875 * safezoneW;
			h = 0.219914 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class ItemsList: Life_RscListBox
		{
			idc = 17051;
			onLBSelChanged = "[] spawn {[] call ALF_fnc_listboxPrice;};";

			x = 0.282292 * safezoneW + safezoneX;
			y = 0.398839 * safezoneH + safezoneY;
			w = 0.211979 * safezoneW;
			h = 0.202321 * safezoneH;
			sizeEx = 0.035;
		};

		class BourseTexte: Life_RscText
		{
			idc = 17052;
			text = "Prix actuel"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.401039 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
		};

		class BourseTexte2: Life_RscText
		{
			idc = 17053;
			text = "Merci de selectionner un item"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.420831 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0549786 * safezoneH;
			sizeEx = 0.060;
		};

		class BourseTexte3: Life_RscText
		{
			idc = 17054;

			text = "Nombre de fois vendu par vous"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
		};

		class BourseTexte4: Life_RscText
		{
			idc = 17055;

			text = "XXXX"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.513195 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0549786 * safezoneH;
			sizeEx = 0.060;
		};

		class BourseButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 17056;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.57697 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,1};
		};

		class BourseTexte5: Life_RscStructuredText
		{
			idc = 17057;
			text = ""; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			//y = 0.447221 * safezoneH + safezoneY;
			y = 0.460221 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorText[] = {0.33,0.33,0.33,1};
		};

	};
};