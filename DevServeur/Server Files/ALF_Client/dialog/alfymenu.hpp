class ymenu_dialog {
	idd = 123450;
	name= "ymenu_dialog";
	onLoad = "uiNamespace setVariable ['ymenu',0]";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {};
	class controls {
		class SyncBtn: Life_RscButtonInvisible {
			idc = -1;
			text = "";
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class PlayerBg: Life_RscPicture {
			idc = 123451;
			text = "\ALF_Client2\textures\Y\menu1.paa";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.803 * safezoneH;
		};
		class PlayerBtn: Life_RscButtonInvisible {
			idc = 1234511;
			text = "";
			onButtonClick = "uiNamespace setVariable ['ymenu',0]; [] call ALF_fnc_menuY;";
			x = 0.319792 * safezoneW + safezoneX;
			y = 0.325 * safezoneH + safezoneY;
			w = 0.0313542 * safezoneW;
			h = 0.0577778 * safezoneH;
		};
		class CashTexte: Life_RscStructuredText {
			idc = 123452;
			text = "";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.465 * safezoneH + safezoneY;
			w = 0.100104 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class CashEdit: Life_RscEdit {
			idc = 123453;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.325 * safezoneW + safezoneX;
			y = 0.512037 * safezoneH + safezoneY;
			w = 0.136562 * safezoneW;
			h = 0.029074 * safezoneH;
		};
		class GiveBtn: Life_RscButtonInvisible {
			idc = 123454;
			text = "";
			onButtonClick = "[] call ALF_fnc_giveMoney;";
			x = 0.357812 * safezoneW + safezoneX;
			y = 0.563889 * safezoneH + safezoneY;
			w = 0.0704167 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class Licenses: Life_RscStructuredText {
			idc = 123455;
			text = "";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.158437 * safezoneW;
			h = 0.204074 * safezoneH;
		};

		class KeyBg: Life_RscPicture {
			idc = 123456;
			text = "\ALF_Client2\textures\Y\menu2.paa";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.803 * safezoneH;
		};
		class KeyMenu: Life_RscButtonInvisible {
			idc = 1234561;
			text = "";
			onButtonClick = "uiNamespace setVariable ['ymenu',1]; [] call ALF_fnc_menuY;";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0313542 * safezoneW;
			h = 0.0577778 * safezoneH;
		};
		class ListKey: Life_RscListBox {
			idc = 123457;
			text = "";
			sizeEx = 0.050;
			x = 0.314063 * safezoneW + safezoneX;
			y = 0.410185 * safezoneH + safezoneY;
			w = 0.375104 * safezoneW;
			h = 0.221667 * safezoneH;
		};
		class GiveKey: Life_RscButtonInvisible {
			idc = 123458;
			text = "";
			onButtonClick = "[] call ALF_fnc_keyGive;";
			x = 0.313021 * safezoneW + safezoneX;
			y = 0.647222 * safezoneH + safezoneY;
			w = 0.0683333 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		class JeterKey: Life_RscButtonInvisible {
			idc = 123459;
			text = "";
			onButtonClick = "[] call ALF_fnc_keyDrop;";
			x = 0.620833 * safezoneW + safezoneX;
			y = 0.646296 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0262963 * safezoneH;
		};

		class GroupBg1: Life_RscPicture {
			idc = 123460;
			text = "\ALF_Client2\textures\Y\menu3.paa";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.803 * safezoneH;
		};
		class GroupBg2: Life_RscPicture {
			idc = 123461;
			text = "\ALF_Client2\textures\Y\menu3b.paa";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.803 * safezoneH;
		};
		class GroupMenu: Life_RscButtonInvisible {
			idc = 1234601;
			text = "";
			onButtonClick = "[] spawn ALF_fnc_fixUniform; closeDialog 0;";
			x = 0.40 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0313542 * safezoneW;
			h = 0.0577778 * safezoneH;
		};
		class ParamBg: Life_RscPicture {
			idc = 123478;
			text = "\ALF_Client2\textures\Y\menu4.paa";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.803 * safezoneH;
		};
		class ParamBtn: Life_RscButtonInvisible {
			idc = 1234781;
			text = "";
			onButtonClick = "uiNamespace setVariable ['ymenu',3]; [] call ALF_fnc_menuY;";
			x = 0.44 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0313542 * safezoneW;
			h = 0.0577778 * safezoneH;
		};
		class RevealONOFF : Life_Checkbox {
			idc = 123479;
			tooltip = "$STR_GUI_PlayerReveal";
			onCheckedChanged = "['objects',_this select 1] call ALF_fnc_s_onCheckedChange;";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0198958 * safezoneW;
			h = 0.0327778 * safezoneH;
		};
		class VD_onfoot_slider: life_RscXSliderH {
			idc = 123480;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call ALF_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.413542 * safezoneW + safezoneX;
			y = 0.439815 * safezoneH + safezoneY;
			w = 0.200625 * safezoneW;
			h = 0.0309259 * safezoneH;
		};

		class VD_onfoot_value: Life_RscEdit {
			idc = 123481;
			text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call ALF_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call ALF_fnc_s_onChar;";
			x = 0.617187 * safezoneW + safezoneX;
			y = 0.439815 * safezoneH + safezoneY;
			w = 0.0454167 * safezoneW;
			h = 0.0309259 * safezoneH;
		};

		class VD_car_slider: life_RscXSliderH {
			idc = 123482;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call ALF_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.413542 * safezoneW + safezoneX;
			y = 0.489815 * safezoneH + safezoneY;
			w = 0.200625 * safezoneW;
			h = 0.0309259 * safezoneH;
		};

		class VD_car_value: Life_RscEdit {
			idc = 123483;
			text = "";
			onChar = "[_this select 0, _this select 1,'vehicle',false] call ALF_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call ALF_fnc_s_onChar;";
			x = 0.617187 * safezoneW + safezoneX;
			y = 0.490741 * safezoneH + safezoneY;
			w = 0.0454167 * safezoneW;
			h = 0.0309259 * safezoneH;
		};

		class VD_air_slider: life_RscXSliderH {
			idc = 123484;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call ALF_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.413541 * safezoneW + safezoneX;
			y = 0.540741 * safezoneH + safezoneY;
			w = 0.200625 * safezoneW;
			h = 0.0309259 * safezoneH;
		};

		class VD_air_value: Life_RscEdit {
			idc = 123485;
			text = "";
			onChar = "[_this select 0, _this select 1,'air',false] call ALF_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call ALF_fnc_s_onChar;";
			x = 0.617188 * safezoneW + safezoneX;
			y = 0.540741 * safezoneH + safezoneY;
			w = 0.0454167 * safezoneW;
			h = 0.0309259 * safezoneH;
		};

		class MapAdmin: Life_RscButtonMenu {
			idc = 123486;
			text = "";
			onButtonClick = "if(alf_admin_btn) then {alf_admin_btn = false; player setVariable ['adminmarker',false,true]; [name player,getPlayerUID player,""ADMIN"",""A desactive le MapAdmin""] remoteExec [""HC_fnc_logIt"",HC3_Life];} else {alf_admin_btn = true; player setVariable ['adminmarker',true,true]; [name player,getPlayerUID player,""ADMIN"",""A active le MapAdmin""] remoteExec [""HC_fnc_logIt"",HC3_Life];}; [] call ALF_fnc_menuY;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class bfmedit1: Life_RscEdit {
			idc = 123487;
			text = "";
			x = 0.3 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class bfmedit2: Life_RscEdit {
			idc = 123488;
			text = "";
			x = 0.4 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class bfmBtn: Life_RscButtonMenu {
			idc = 123489;
			text = "ENVOYER";
			onButtonClick = "";
			x = 0.7 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class ListAdminPlayer: Life_RscListBox {
			idc = 123490;
			text = "";
			sizeEx = 0.035;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.363 * safezoneH;
		};

		class adminbtn1: Life_RscButtonMenu {
			idc = 123491;
			text = "TELEPORT";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn2: Life_RscButtonMenu {
			idc = 123492;
			text = "TP TO ME";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn3: Life_RscButtonMenu {
			idc = 123493;
			text = "TP TO MAP";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn4: Life_RscButtonMenu {
			idc = 123494;
			text = "SPEC";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.790 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn5: Life_RscButtonMenu {
			idc = 123495;
			text = "";
			onButtonClick = "if(alf_admin_invi) then {alf_admin_invi = false; player setVariable ['admininvisible',false,true]; [player,1] remoteExec [""TON_fnc_adminInvisible"",2]; [name player,getPlayerUID player,""ADMIN"",""Est maintenant visible""] remoteExec [""HC_fnc_logIt"",HC3_Life];} else {alf_admin_invi = true; player setVariable ['admininvisible',true,true]; [player,0] remoteExec [""TON_fnc_adminInvisible"",2]; [name player,getPlayerUID player,""ADMIN"",""Est invisible""] remoteExec [""HC_fnc_logIt"",HC3_Life];}; [] call ALF_fnc_menuY;";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn6: Life_RscButtonMenu {
			idc = 123533;
			text = "TP TO LUI";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.760 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn7: Life_RscButtonMenu {
			idc = 123534;
			text = "Godmod ON";
			onButtonClick = "if(isDamageAllowed player) then {player allowDamage false; [name player,getPlayerUID player,""ADMIN"",""GodMod ON""] remoteExec [""HC_fnc_logIt"",HC3_Life];} else {player allowDamage true; [name player,getPlayerUID player,""ADMIN"",""GodMod OFF""] remoteExec [""HC_fnc_logIt"",HC3_Life];}; [] call ALF_fnc_menuY;";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.790 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class keyedit: Life_RscEdit {
			idc = 123496;
			text = "";
			x = 0.44073 * safezoneW + safezoneX;
			y = 0.646592 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.0257038 * safezoneH;
		};
		class GiveKeyTime: Life_RscButtonInvisible {
			idc = 123497;
			text = "";
			onButtonClick = "[] call ALF_fnc_keyGiveTime;";
			x = 0.391146 * safezoneW + safezoneX;
			y = 0.647223 * safezoneH + safezoneY;
			w = 0.0485416 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		class execEdit: Life_RscEdit {
			idc = 123535;
			text = "";
			x = 0.4 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class execBtn: Life_RscButtonMenu {
			idc = 123536;
			text = "SPAWN FNC";
			x = 0.7 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class btnmagique: Life_RscButtonMenu {
			idc = 123537;
			text = "BOUTON MAGIQUE (+FPS)";
			onButtonClick = "removeAllMissionEventHandlers ""EachFrame""; [] spawn ALF_fnc_interaction3D; addMissionEventHandler [""EachFrame"", {call cba_common_fnc_onFrame}]; alf_bouton_magique = true; [] call ALF_fnc_menuY;";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.0262963 * safezoneH;
		};
		class AdminMSG1: Life_RscListBox {
			idc = 123538;
			text = "";
			x = 0.3 * safezoneW + safezoneX;
			y = 0.142 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class AdminMSG2: Life_RscEdit {
			idc = 123539;
			text = "";
			x = 0.4 * safezoneW + safezoneX;
			y = 0.142 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class AdminMSG3: Life_RscButtonMenu {
			idc = 123540;
			text = "ENVOYER";
			x = 0.7 * safezoneW + safezoneX;
			y = 0.142 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class adminbtn8: Life_RscButtonMenu {
			idc = 123541;
			text = "FAIM/SOIF/VIE";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.760 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn9: Life_RscButtonMenu {
			idc = 123542;
			text = "ARSENAL";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.820 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn10: Life_RscButtonMenu {
			idc = 123543;
			text = "FREEZE";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.820 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn11: Life_RscButtonMenu {
			idc = 123544;
			text = "A VENIR";
			onButtonClick = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn12: Life_RscButtonMenu {
			idc = 123545;
			text = "REVIVE";
			onButtonClick = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.850 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn13: Life_RscButtonMenu {
			idc = 123546;
			text = "DELETE CUR.";
			x = 0.4841974 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn14: Life_RscButtonMenu {
			idc = 123547;
			text = "DAMAGE (1) CUR.";
			x = 0.4841974 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn15: Life_RscButtonMenu {
			idc = 123548;
			text = "REPAIR CUR.";
			x = 0.4841974 * safezoneW + safezoneX;
			y = 0.760 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn16: Life_RscButtonMenu {
			idc = 123549;
			text = "SOIGNER";
			onButtonClick = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.883 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn17: Life_RscButtonMenu {
			idc = 123550;
			text = "CREATE BIG FIRE";
			onButtonClick = "";
			x = 0.824843 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn18: Life_RscButtonMenu {
			idc = 123551;
			text = "CREATE MEDIUM FIRE";
			onButtonClick = "";
			x = 0.824843 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn19: Life_RscButtonMenu {
			idc = 123552;
			text = "CREATE BIG SMOKE";
			onButtonClick = "";
			x = 0.824843 * safezoneW + safezoneX;
			y = 0.390 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn20: Life_RscButtonMenu {
			idc = 123553;
			text = "CREATE MEDIUM SMOKE";
			onButtonClick = "";
			x = 0.824843 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn21: Life_RscButtonMenu {
			idc = 123554;
			text = "DELETE BIG FIRE";
			onButtonClick = "";
			x = 0.824843 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn22: Life_RscButtonMenu {
			idc = 123555;
			text = "DELETE MED. FIRE/SMOKE";
			onButtonClick = "";
			x = 0.824843 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn23: Life_RscButtonMenu {
			idc = 123556;
			text = "DESSOUS BTN22";
			onButtonClick = "";
			x = 0.824843 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn24: Life_RscButtonMenu {
			idc = 123557;
			text = "DESSOUS BTN23";
			onButtonClick = "";
			x = 0.824843 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn25: Life_RscButtonMenu {
			idc = 123558;
			text = "PUT IN CURSOR";
			onButtonClick = "";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.850 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminbtn26: Life_RscButtonMenu {
			idc = 123559;
			text = "EJECT OF VEH.";
			onButtonClick = "";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.883 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class adminbtn27: Life_RscButtonMenu {
			idc = 123560;
			text = "CAMERA MODE";
			onButtonClick = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};