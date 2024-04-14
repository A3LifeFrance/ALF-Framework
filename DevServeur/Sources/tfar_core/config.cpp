#define private		0
#define protected		1
#define public		2

#define VSoft		0
#define VArmor		1
#define VAir		2

#define true	1
#define false	0

class CfgPatches {
	class tfar_core {
		name = "TFAR - Core";
		units[] = {"tfar_ModuleTaskForceRadioEnforceUsage", "tfar_ModuleTaskForceRadio", "tfar_ModuleTaskForceRadioFrequencies"};
		weapons[] = {};
		requiredVersion = 1.72;
		requiredAddons[] = {"A3_Modules_F", A3_UI_F, "cba_main", "cba_ui", "cba_xeh", "cba_settings", "A3_Soft_F_Offroad_01"};
		author = "$STR_tfar_core_AUTHORS";
		server_api = 1;
	};

	class task_force_radio {
		name = "TFAR - Legacy Compatibility";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.72;
		requiredAddons[] = {};
		author = "$STR_tfar_core_AUTHORS";
	};

	class task_force_radio_items {
		name = "TFAR - Legacy Compatibility";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.72;
		requiredAddons[] = {};
		author = "$STR_tfar_core_AUTHORS";
	};
};

class CfgMods {
	class tfar {
		dir = "@task_force_radio";
		name = "Task Force Arrowhead Radio";
		tooltip = "Task Force Arrowhead Radio";
		overview = "Task Force Arrowhead Radio";
		picture = "\z\tfar\addons\core\task_force_arrowhead_logo.paa";
		contentBrowserPicture = "\z\tfar\addons\core\task_force_arrowhead_logo.paa";
		logo = "\z\tfar\addons\core\task_force_arrowhead_logo.paa";
		logoOver = "\z\tfar\addons\core\task_force_arrowhead_logo.paa";
		logoSmall = "\z\tfar\addons\core\task_force_arrowhead_logo.paa";
		hidePicture = 0;
		hideName = 1;
		requiresRestart = 0;
		action = "https://github.com/michail-nikolaev/task-force-arma-3-radio";
		actionName = "Website";
		description = "$STR_tfar_core_main_desc";
	};
};

class CfgSettings {
	class CBA {
		class Versioning {
			class TFAR {
				main_addon = "tfar_core";

				class Dependencies {
					CBA[] = {"cba_main", {3, 1, 0}, "true"};
				};
			};
		};
	};
};

class CfgEditorCategories {
	class TFAR {
		displayName = "$STR_tfar_core_CATEGORY";
	};
};

class CfgUIGrids {
	class IGUI {
		class Presets {
			class Arma3 {
				class Variables {
					grid_TFAR_Volume[] = {{"0.85 * safezoneW + safezoneX", "0.9 * safezoneH + safezoneY", "(4 * (2 * (((safezoneW / safezoneH) min 1.2) / 50)))", "(4 * (2 * (((safezoneW / safezoneH) min 1.2) / 50)))"}, "(1 * (((safezoneW / safezoneH) min 1.2) / 50))", "(1 * (((safezoneW / safezoneH) min 1.2) / 50))"};
				};
			};
		};

		class Variables {
			class grid_TFAR_Volume {
				displayName = "$STR_tfar_core_VolumeIndicator";
				description = "$STR_tfar_core_VolumeIndicator";
				preview = "\z\tfar\addons\core\ui\tfar_volume_normal.paa";
				saveToProfile[] = {0, 1, 2, 3};
				canResize = 1;
			};
		};
	};
};

class ace_arsenal_stats {
	class statBase;	// External class reference

	class TFAR_radioRangeSR : statBase {
		scope = public;
		priority = 1;
		stats[] = {"tf_range"};
		displayName = "$STR_a3_rscdisplayarsenal_stat_range";
		showBar = 1;
		showText = 1;
		barStatement = "[(_this select 0) select 0,_this select 1,[[0,10000],[0.01,1],false]] call ace_arsenal_fnc_statBarStatement_default";
		textStatement = "params ['_stat','_config']; private _rng = getNumber (_config >> _stat select 0); format ['%1m',_rng]";
		condition = "getNumber (_this select 1 >> (_this select 0) select 0) > 0";
		tabs[] = {{12}, {}};
	};

	class TFAR_radioRangeLR : statBase {
		scope = public;
		priority = 1;
		stats[] = {"tf_range"};
		displayName = "$STR_a3_rscdisplayarsenal_stat_range";
		showBar = 1;
		showText = 1;
		barStatement = "[(_this select 0) select 0,_this select 1,[[0,100000],[0.01,1],false]] call ace_arsenal_fnc_statBarStatement_default";
		textStatement = "params ['_stat','_config']; private _rng = getNumber (_config >> _stat select 0); format ['%1m',_rng]";
		condition = "(getNumber (_this select 1 >> 'tf_hasLRradio') > 0) && getNumber (_this select 1 >> (_this select 0) select 0) > 0";
		tabs[] = {{5}, {}};
	};

	class TFAR_encryptionCode : statBase {
		scope = public;
		priority = 1;
		stats[] = {"tf_encryptionCode"};
		displayName = "Encryption Code";
		showText = 1;
		textStatement = "params ['_stat','_config']; private _enc = getText (_config >> _stat select 0); _enc";
		condition = "params ['_stat','_config']; isText (_config >> _stat select 0) && (getText (_config >> _stat select 0) != '')";
		tabs[] = {{12, 5}, {}};
	};
};

class Cfg3DEN {
	class Object {
		class AttributeCategories {
			class TFAR_attributes {
				displayName = "$STR_tfar_core_3DEN_Properties";
				collapsed = 1;

				class Attributes {
					class TFAR_freq_sr {
						displayName = "$STR_tfar_settings_DefaultRadioFrequencies_SR";
						tooltip = "$STR_tfar_settings_DefaultRadioFrequencies_SR_desc";
						property = "TFAR_freq_sr";
						control = "Edit";
						expression = "if (_value isEqualTo '' || _value isEqualTo []) exitWith {}; if (_value isEqualType '') then { _value = [_value,8,512,30,10] call tfar_fnc_parseFrequenciesInput; _this setVariable ['%s',_value,true]; } else { _value = [str _value,8,512,30,10] call tfar_fnc_parseFrequenciesInput; _this setVariable ['%s',_value,true]; }";
						defaultValue = "''";
						typeName = STRING;
						unique = 0;
						condition = "objectControllable + logicModule";
					};

					class TFAR_freq_lr {
						displayName = "$STR_tfar_settings_DefaultRadioFrequencies_LR";
						tooltip = "$STR_tfar_settings_DefaultRadioFrequencies_LR_desc";
						property = "TFAR_freq_lr";
						control = "Edit";
						expression = "if (_value isEqualTo '' || _value isEqualTo []) exitWith {}; if (_value isEqualType '') then { _value = [_value,9,87,30,10] call tfar_fnc_parseFrequenciesInput; _this setVariable ['%s',_value,true]; } else { _value = [str _value,9,87,30,10] call tfar_fnc_parseFrequenciesInput; _this setVariable ['%s',_value,true]; }";
						defaultValue = "''";
						typeName = STRING;
						unique = 0;
						condition = "objectControllable + logicModule";
					};

					class TFAR_CuratorCamEars {
						property = "TFAR_CuratorCamEars";
						control = "Checkbox";
						displayName = "$STR_tfar_core_Att_CuratorCamEars";
						tooltip = "$STR_tfar_core_Att_CuratorCamEars_tooltip";
						expression = "if (_value) then {_this setVariable ['%s',_value,true]};";
						typeName = BOOL;
						condition = "objectBrain";
						defaultValue = "false";
					};

					class TFAR_VehicleIDOverride {
						property = "TFAR_VehicleIDOverride";
						control = "EditShort";
						displayName = "Vehicle ID override";
						tooltip = "Vehicles that share the same Vehicle ID share the same Intercom system.";
						expression = "if !(_value isEqualTo '') then {_this setVariable ['TFAR_vehicleIDOverride',_value]};";
						typeName = STRING;
						validate = "none";
						condition = "objectVehicle";
						defaultValue = "''";
					};

					class TFAR_defaultIntercomSlot {
						property = "TFAR_defaultIntercomSlot";
						control = "EditShort";
						displayName = "Default Intercom Channel";
						tooltip = "Default Intercom Channel when entering vehicle. Overwrites global setting. (-1 means Intercom disabled by default, -2 means this setting is ignored)";
						expression = "diag_log ['defaultIntercomSlot',_value]; if (_value != -2) then {_this setVariable ['TFAR_defaultIntercomSlot',_value]};";
						typeName = NUMBER;
						validate = "number";
						condition = "objectVehicle";
						defaultValue = "-2";
					};
				};
			};
		};
	};

	class Group {
		class AttributeCategories {
			class TFAR_attributes {
				displayName = "$STR_tfar_core_3DEN_Properties";
				collapsed = 1;

				class Attributes {
					class TFAR_freq_sr {
						displayName = "$STR_tfar_settings_DefaultRadioFrequencies_SR";
						tooltip = "$STR_tfar_settings_DefaultRadioFrequencies_SR_desc";
						property = "TFAR_freq_sr";
						expression = "if (_value isEqualTo '' || _value isEqualTo []) exitWith {}; if (_value isEqualType '') then { _value = [_value,8,512,30,10] call tfar_fnc_parseFrequenciesInput; _this setVariable ['%s',_value,true]; } else { _value = [str _value,8,512,30,10] call tfar_fnc_parseFrequenciesInput; _this setVariable ['%s',_value,true]; }";
						control = "Edit";
						defaultValue = "''";
						typeName = STRING;
						unique = 0;
					};

					class TFAR_freq_lr {
						displayName = "$STR_tfar_settings_DefaultRadioFrequencies_LR";
						tooltip = "$STR_tfar_settings_DefaultRadioFrequencies_LR_desc";
						property = "TFAR_freq_lr";
						expression = "if (_value isEqualTo '' || _value isEqualTo []) exitWith {}; if (_value isEqualType '') then { _value = [_value,9,87,30,10] call tfar_fnc_parseFrequenciesInput; _this setVariable ['%s',_value,true]; } else { _value = [str _value,9,87,30,10] call tfar_fnc_parseFrequenciesInput; _this setVariable ['%s',_value,true]; }";
						control = "Edit";
						defaultValue = "''";
						typeName = STRING;
						unique = 0;
					};
				};
			};
		};
	};
};

class Extended_PreStart_EventHandlers {
	class tfar_core {
		init = "call compile preProcessFileLineNumbers '\z\tfar\addons\core\XEH_preStart.sqf'";
	};
};

class Extended_PreInit_EventHandlers {
	class tfar_core {
		init = "call compile preProcessFileLineNumbers '\z\tfar\addons\core\XEH_preInit.sqf'";
		disableModuload = 1;
	};
};

class Extended_PostInit_EventHandlers {
	class tfar_core {
		init = "call compile preProcessFileLineNumbers '\z\tfar\addons\core\XEH_postInit.sqf'";
		disableModuload = 1;
	};
};

class Extended_DisplayLoad_EventHandlers {
	class RscDisplayArsenal {
		TFAR_ArsenalOpened = "'PreOpen' call TFAR_fnc_onArsenal";
	};

	class RscDisplayCurator {
		TFAR_CuratorInterfaceOpened = "[_this select 0, 'Open'] call TFAR_fnc_onCuratorInterface";
	};

	class RscDisplayEGSpectator {
		TFAR_RscDisplayEGSpectator = "[player, true] call TFAR_fnc_forceSpectator;";
	};
};

class Extended_DisplayUnload_EventHandlers {
	class RscDisplayMission {
		TFAR_MissionEnded = "call TFAR_fnc_onMissionEnd";
	};

	class RscDisplayCurator {
		TFAR_CuratorInterfaceOpened = "[_this select 0, 'Close'] call TFAR_fnc_onCuratorInterface";
	};

	class RscDisplayEGSpectator {
		TFAR_RscDisplayEGSpectator = "[player, false] call TFAR_fnc_forceSpectator;";
	};
};
class RscListBox;	// External class reference

class RscDisplayArsenal {
	class Controls {
		class ListBackpack : RscListBox {
			onLoad = "'PrePreOpen' call TFAR_fnc_onArsenal";
		};
	};
};

class RscBackPicture {
	type = VSoft;
	idc = -1;
	style = 48;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = false;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};

class RscEditLCD {
	type = VAir;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {0, 0, 0, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", 1};
	autocomplete = "";
	text = "";
	size = "0.2 * (0.7 / (getResolution select 5))";
	style = 0x00 + 0x40 + 0x200;
	font = "TFAR_font_segments";
	shadow = true;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (0.7 / (getResolution select 5))";
};

class HiddenButton {
	type = VArmor;
	text = "";
	colorText[] = {0, 0, 0, 1};
	colorDisabled[] = {0, 0, 0, 0};
	colorBackground[] = {0, 0, 0, 0};
	colorBackgroundDisabled[] = {0, 0, 0, 0};
	colorBackgroundActive[] = {0, 0, 0, 0};
	colorFocused[] = {0, 0, 0, 0};
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] = {"\z\tfar\addons\core\sounds\softPush", 0.5, 1};
	soundClick[] = {"\z\tfar\addons\core\sounds\softClick", 0.5, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class HiddenRotator : HiddenButton {
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.5, 1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.5, 1};
};

class HiddenFlip : HiddenButton {
	soundPush[] = {"\z\tfar\addons\core\sounds\switchPush", 0.5, 1};
	soundClick[] = {"\z\tfar\addons\core\sounds\switchClick", 0.5, 1};
};
class RscStructuredText;	// External class reference
class RscPictureKeepAspect;	// External class reference

class RscTitles {
	class RscTaskForceHint {
		idd = 30040;
		onLoad = "uiNamespace setVariable ['TFAR_Hint_Display', _this select 0]";
		onUnload = "uiNamespace setVariable ['TFAR_Hint_Display', displayNull]";
		fadeIn = 0.2;
		fadeOut = 0.2;
		movingEnable = 0;
		duration = "10e10";
		name = "RscTaskForceHint";

		class controls {
			class InformationText : RscStructuredText {
				idc = 1100;
				text = "";
				type = 13;
				style = 0;
				x = "0.85 * safezoneW + safezoneX";
				y = "0.9 * safezoneH + safezoneY";
				w = "0.15 * safezoneW";
				h = "0.1 * safezoneH";
				colorText[] = {1, 1, 1, 1};
				colorBackground[] = {0.1, 0.1, 0.1, 0.5};
				sizeEx = 1;
				size = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * (0.55 / (getResolution select 5)))";
			};
		};
	};

	class tfar_core_HUDVolumeIndicatorRsc {
		idd = -1;
		movingEnable = 1;
		duration = 9999999;
		fadein = 0;
		fadeout = 0;
		onLoad = "uiNamespace setVariable [""tfar_core_HUDVolumeIndicatorRscDisplay"",_this select 0];";

		class controls {
			class VolumeIndicator : RscPictureKeepAspect {
				idc = 1112;
				type = VSoft;
				style = 0x30 + 0x800;
				colorText[] = {1, 1, 1, 1};
				colorBackground[] = {0, 0, 0, 0};
				font = "PuristaMedium";
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
				text = "\z\tfar\addons\core\ui\tfar_volume_normal.paa";
				x = "(profilenamespace getvariable [""IGUI_grid_TFAR_Volume_X"", 0.85 * safezoneW + safezoneX])";
				y = "(profilenamespace getvariable [""IGUI_grid_TFAR_Volume_Y"", 0.9 * safezoneH + safezoneY])";
				w = "(profilenamespace getvariable [""IGUI_grid_TFAR_Volume_W"",  2 * (((safezoneW / safezoneH) min 1.2) / 50)])";
				h = "(profilenamespace getvariable [""IGUI_grid_TFAR_Volume_W"",  2 * (((safezoneW / safezoneH) min 1.2) / 50)])";
			};
		};
	};
};

class CfgSounds {
	class TFAR_rotatorPush {
		name = "TFAR - Rotator Switch (Push)";
		sound[] = {"\z\tfar\addons\core\sounds\hardPush.wss", 0.5, 1};
		titles[] = {};
	};

	class TFAR_rotatorClick {
		name = "TFAR - Rotator Switch (Click)";
		sound[] = {"\A3\ui_f\data\sound\RscButton\soundEscape.wss", 0.5, 1};
		titles[] = {};
	};
};

class CfgFontFamilies {
	class TFAR_font_dots {
		fonts[] = {"\z\tfar\addons\core\fonts\dots\dots36"};
		spaceWidth = 0.6;
		spacing = 0.15;
	};

	class TFAR_font_segments {
		fonts[] = {"\z\tfar\addons\core\fonts\segments\segments46"};
		spaceWidth = 0.8;
		spacing = 0.3;
	};
};

class CfgVehicles {
	class Module_F;	// External class reference

	class TFAR_ModuleTaskForceRadioEnforceUsage : Module_F {
		scope = protected;
		author = "$STR_tfar_core_AUTHORS";
		displayName = "$STR_tfar_CORE_DEPRECATED";
		category = TFAR;
		function = "";
		functionPriority = 0;
		isGlobal = 0;
	};

	class TFAR_ModuleTaskForceRadio : TFAR_ModuleTaskForceRadioEnforceUsage {};

	class TFAR_ModuleTaskForceRadioFrequencies : TFAR_ModuleTaskForceRadioEnforceUsage {};
	class VirtualMan_F;	// External class reference

	class VirtualCurator_F : VirtualMan_F {
		class Attributes {
			class TFAR_freq_sr {
				displayName = "$STR_tfar_settings_DefaultRadioFrequencies_SR";
				tooltip = "$STR_tfar_settings_DefaultRadioFrequencies_SR_desc";
				property = "TFAR_freq_sr";
				control = "EditArray";
				expression = "if !(_value isEqualTo []) then {_value=[str _value,8,512,30,10] call tfar_fnc_parseFrequenciesInput;_this setVariable ['%s',_value,true];}";
				defaultValue = "[]";
				unique = 0;
				condition = "1";
			};

			class TFAR_freq_lr {
				displayName = "$STR_tfar_settings_DefaultRadioFrequencies_LR";
				tooltip = "$STR_tfar_settings_DefaultRadioFrequencies_LR_desc";
				property = "TFAR_freq_lr";
				control = "EditArray";
				expression = "if !(_value isEqualTo []) then {_value=[str _value,9,87,30,10] call tfar_fnc_parseFrequenciesInput;_this setVariable ['%s',_value,true];}";
				defaultValue = "[]";
				unique = 0;
				condition = "1";
			};
		};
	};
	class All;	// External class reference

	class AllVehicles : All {
		tf_hasLRradio = 0;
		tf_isolatedAmount = 0;
	};

	class Air : AllVehicles {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.1;
	};
	class Land;	// External class reference

	class LandVehicle : Land {
		tf_range = 30000;
		class ACE_SelfActions;	// External class reference
	};

	class Car : LandVehicle {
		tf_isolatedAmount = 0.1;
	};

	class Tank : LandVehicle {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 1;

		class ACE_SelfActions : ACE_SelfActions {
			class TFAR_IntercomChannel {
				displayName = "$STR_tfar_core_Intercom_ACESelfAction_Name";
				condition = "true";
				statement = "";
				icon = "";

				class TFAR_IntercomChannel_1 {
					displayName = "$STR_tfar_core_Intercom_ACESelfAction_Channel1";
					condition = "true";
					statement = "(vehicle ACE_Player) setVariable [format ['TFAR_IntercomSlot_%1',(netID ACE_Player)],0,true];";
				};

				class TFAR_IntercomChannel_2 {
					displayName = "$STR_tfar_core_Intercom_ACESelfAction_Channel2";
					condition = "true";
					statement = "(vehicle ACE_Player) setVariable [format ['TFAR_IntercomSlot_%1',(netID ACE_Player)],1,true];";
				};
			};
		};
		TFAR_hasIntercom = 1;
	};
	class Helicopter;	// External class reference

	class ParachuteBase : Helicopter {
		tf_hasLRradio = 0;
		tf_isolatedAmount = 0;
	};
	class Helicopter_Base_F;	// External class reference

	class Heli_Attack_02_base_F : Helicopter_Base_F {
		tf_isolatedAmount = 0.7;
	};

	class Heli_Attack_01_base_F : Helicopter_Base_F {
		tf_isolatedAmount = 0.7;
	};
	class Helicopter_Base_H;	// External class reference

	class Heli_Light_02_base_F : Helicopter_Base_H {
		tf_isolatedAmount = 0.7;
	};

	class Heli_Transport_01_base_F : Helicopter_Base_H {
		tf_isolatedAmount = 0.3;
	};

	class Heli_Transport_02_base_F : Helicopter_Base_H {
		tf_isolatedAmount = 0.8;
	};
	class Car_F;	// External class reference

	class Wheeled_Apc_F : Car_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.6;
	};

	class MRAP_01_base_F : Car_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.7;
	};

	class MRAP_02_base_F : Car_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.7;
	};

	class MRAP_03_base_F : Car_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.7;
	};
	class Truck_F;	// External class reference

	class Truck_01_base_F : Truck_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.4;
	};

	class Truck_02_base_F : Truck_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.4;
	};

	class Truck_03_base_F : Truck_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.4;
	};
	class Offroad_01_military_base_F;	// External class reference

	class Offroad_01_armed_base_F : Offroad_01_military_base_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.25;
	};
	class Boat_F;	// External class reference

	class SDV_01_base_F : Boat_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.1;
	};

	class Boat_Armed_01_base_F : Boat_F {
		tf_hasLRradio = 1;
		tf_isolatedAmount = 0.1;
	};
	class Boat_Civil_01_base_F;	// External class reference

	class C_Boat_Civil_01_police_F : Boat_Civil_01_base_F {
		tf_hasLRradio = 1;
	};

	class C_Boat_Civil_01_rescue_F : Boat_Civil_01_base_F {
		tf_hasLRradio = 1;
	};
	class Man;	// External class reference

	class CAManBase : Man {
		class ACE_SelfActions {
			class TFAR_Radio {
				displayName = "$STR_tfar_core_RADIOS";
				condition = "(([] call TFAR_fnc_haveSWRadio)||([] call TFAR_fnc_haveLRRadio))";
				exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming"};
				statement = "";
				icon = "\z\tfar\addons\core\ui\ACE_Interaction_Radio_Icon.paa";
				insertChildren = "[_player] call tfar_core_fnc_getOwnRadiosChildren";
			};
		};

		class ACE_Actions {
			class ACE_MainActions {
				class TFAR_Radio {
					displayName = "$STR_tfar_core_RADIOS";
					distance = 2;
					condition = "_player call TFAR_fnc_hasRadio";
					exceptions[] = {};
					statement = "";
					icon = "\z\tfar\addons\core\ui\ACE_Interaction_Radio_Icon.paa";
					insertChildren = "_this call tfar_core_fnc_getRadiosChildren";
				};
			};
		};
	};
};
