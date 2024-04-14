class RscText;
class RscMainMenuSpotlight;
class GroupPicture;
class Picture;
class Video;
class GroupHover;
class Overlay;
class LineLeft;
class LineRight;
class LineTop;
class LineBottom;
class TextBackground;
class Text;
class Button;
class RscActivePictureKeepAspect;
class SpotlightPrev;
class BackgroundBar;
class BackgroundBarLeft;
class Logo;
class RscButtonMenu;
class RscButton;
class RscControlsGroupNoScrollbars;
class RscButtonMenuMain;
class TitleSingleplayer;
class TitleIconSingleplayer;
class GroupSingleplayer;
class Controls;
class RscActivePicture;
class RscControlsGroupNoHScrollbars;
class Background;
class BackgroundIcon;
class Icon;
class Icons;
class RscStandardDisplay;
class RscPicture;
class RscPictureKeepAspect;
class RscVignette;
class RscFrame;
class RscListBox;
class RscButtonMenuCancel;
class RscButtonMenuOK;
class RscTitle;
class RscShortcutButton;
class RscButtonTextOnly;
class RscEdit;

class RscDisplaySetupServer : RscStandardDisplay {
	idd = 132;
	scriptName = "RscDisplayHostSettings";
	scriptPath = GUI;
	onLoad = "[""onLoad"",_this,""RscDisplayHostSettings"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayHostSettings"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	
	class controlsBackground {
		delete TabsBackground;
		delete MainBackground;
		delete TitleBackground;
		delete TileGroup;
		delete Vignette;
	};
	
	class controls {	
		class TabDirectConnect : RscButtonMenu {
			idc = 166;
			shortcuts[] = {};
			text = $STR_A3_RSCDISPLAYMULTIPLAYER_DIRECT_CONNECT;
			x = "16.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(SafezoneX)";
			y = "2.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "7.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = $STR_A3_RSCDISPLAYMULTIPLAYER_DIRECT_CONNECT_TOOLTIP;
		};

		delete Title;
		delete PlayersName;
		delete ButtonLauncherServerBrowser;
		delete Content;
		delete TabServers;
		delete TabSetupServer;
		delete TabQuickPlay;
		
		class ButtonBack : RscButtonMenuCancel {
			y = "SafezoneY + SafezoneH - (2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			text = $STR_DISP_BACK;
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(SafezoneX)";
			w = "6.25 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};

class RscDisplayIPAddress : RscStandardDisplay {
	scriptName = "RscDisplayIPAddress";
	scriptPath = GUI;
	onLoad = "[""onLoad"",_this,""RscDisplayIPAddress"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayIPAddress"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	
	class controlsBackground {
		delete Vignette;
		delete TileGroup;
		delete TitleBackground;
		delete MainBackground;
		delete TabsBackground;
	};
	
	class controls {
		class B_OK {};
		class B_Cancel {};
		class TextPort {};
		class ValuePort {};
		class TextAddress {};
		class ValueAddress {};
		
		class TabServers : RscButtonMenu {
			idc = 165;
			text = $STR_A3_RSCDISPLAYMULTIPLAYER_SERVERS;
			x = "8.7 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(SafezoneX)";
			y = "2.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "7.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = $STR_A3_RSCDISPLAYMULTIPLAYER_SERVERS_TOOLTIP;
		};
		
		delete TabDirectConnect;
		delete TabQuickPlay;
		delete TabSetupServer;
		delete PlayersName;
		delete Title;
		
		class Content : RscControlsGroupNoScrollbars {
			x = "0.5 - 15.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0.5 - 2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 2300;
			w = "23 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			
			class controls {
				class CA_TextAddress : RscText {
					style = 1;
					shadow = 0;
					idc = 1003;
					text = $STR_DISP_IP_ADDRESS;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class CA_ValueAddress : RscEdit {
					idc = 101;
					x = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "15 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class CA_TextPort : CA_TextAddress {
					idc = 1004;
					text = $STR_DISP_IP_PORT;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class CA_ValuePort : CA_ValueAddress {
					idc = 102;
					x = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "15 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class ButtonOk : RscButtonMenuOK {
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", 1};
					
					class TextPos {
						left = "0.25 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						top = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						right = 0.005;
						bottom = 0;
					};
					
					class Attributes {
						font = "PuristaLight";
						color = "#E5E5E5";
						align = "center";
						shadow = "false";
					};
					text = $STR_CA_MULTI_JOIN;
					x = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "15 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		
		delete ButtonLauncherServerBrowser;
		
		class ButtonBack : RscButtonMenuCancel {
			y = "SafezoneY + SafezoneH - (2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			text = $STR_DISP_BACK;
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(SafezoneX)";
			w = "6.25 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};

class RscDisplayMultiplayer : RscStandardDisplay {
	scriptName = "RscDisplayMultiplayer";
	scriptPath = GUI;
	onLoad = "[""onLoad"",_this,""RscDisplayMultiplayer"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayMultiplayer"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	sortUp = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
	sortDown = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_down_ca.paa";
	showPassworded = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\showpassworded_ca.paa";
	hidePassworded = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\hidepassworded_ca.paa";
	showBattlEye = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\showbattleye_ca.paa";
	showNoBattlEye = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\shownobattleye_ca.paa";
	hideBattlEye = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\hidebattleeye_ca.paa";
	showFull = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\showfull_ca.paa";
	hideFull = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\hidefull_ca.paa";
	showExpansions = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\showexpansions_ca.paa";
	hideExpansions = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\hideexpansions_ca.paa";
	modPresent = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_none_ca.paa";
	modMissing = "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_addons_ca.paa";
	colorPingUnknown[] = {0.4, 0.4, 0.4, 1};
	colorPingGood[] = {0, 1, 0, 1};
	colorPingPoor[] = {1, 0.6, 0, 1};
	colorPingBad[] = {1, 0, 0, 1};
	colorVersionGood[] = {1, 1, 1, 1.0};
	colorVersionBad[] = {1, 0, 0, 1};
	
	class controlsbackground {
		delete CA_TextServerDetailLanguage;
		delete CA_TextServerDetailPing;
		delete CA_TextServerDetailSlots;
		delete MainbackTop;
		delete MainbackBottom;
		delete MainbackMiddle;
		delete CA_ServerDetailLanguage;
		delete CA_ServerDetailMission;
		delete CA_ServerDetailPing;
		delete CA_ServerDetailSlots;
		delete CA_ServerDetailState;
		delete CA_TextDetailState;
		delete Vignette;
		delete HeadersBackground;
		delete ServerTabsBackground;
		delete TabsBackground;
		delete MainBackground;
		delete RscTitleBackground;
		delete TileGroup;
	};
	
	class controls {
		class ValueSessions {};
		class B_DPlay {};
		class B_Join {};
		class B_Cancel {};
		
		delete FilterServer;
		delete ServerDetailVersion;
		delete ServerDetailVersionRequired;
		delete ServerDetailMods;
		delete ServerDetailIsland;
		delete ServerDetailDifficulty;
		delete ServerDetailTimeLeft;
		delete ServerDetailType;
		delete ServerDetailMission;
		delete ServerDetailState;
		delete ServerDetailSlots;
		delete ServerDetailPing;
		delete ServerDetailLanguage;
		delete ServerDetailCountry;
		delete ColumnPlayers;
		delete ColumnPing;
		delete ColumnType;
		delete ColumnMission;
		delete ColumnState;
		delete FilterPlayers;
		delete FilterPing;
		delete FilterMission;
		delete FilterType;
		delete Title;
		delete IconPlayers;
		delete IconPing;
		delete FilterFullServers;
		delete FilterPasswordedServers;
		delete FilterBattlEyeServers;
		delete ServerDetailHost;
		delete ServerDetailPassword;
		delete ServerDetailPlayers;
		delete ServerDetailPlatform;
		delete CA_Internet_Lan;
		delete B_New;
		delete Progress;
		delete B_Port;
		delete B_Filter;
		delete B_Refresh;
		delete B_Password;
		delete B_Remote;
		delete B_Internet;
		delete IconServer;
		delete IconMission;
		delete IconState;
		delete IconType;
		delete CA_FramePlayers;
		delete CA_FrameExpansions;
		delete CA_FrameMission;
		delete CA_ServerDetailPassword;
		delete CA_ServerDetailHost;
		delete CA_TextServerDetailIsland;
		delete CA_ServerDetailIsland;
		delete CA_TextServerDetailDifficulty;
		delete CA_ServerDetailDifficulty;
		delete CA_TextServerDetailPlatform;
		delete CA_ServerDetailPlatform;
		delete CA_TextServerDetailCountry;
		delete CA_ServerDetailCountry;
		delete CA_TextServerDetailBE;
		delete CA_ServerDetailBE;
		delete TextServerDetailFilepatching;
		delete ServerDetailFilepatching;
		delete CA_TextServerDetailTimeLeft;
		delete CA_ServerDetailTimeLeft;
		delete TextServerType;
		delete CA_ServerDetailVersion;
		delete CA_ServerDetailVersionRequired;
		delete CA_ServerDetailExpansion;
		delete CA_ServerDetailPlayers;
		delete CA_Refresh;
		delete CA_BFilter;
		delete CA_Title2;
		delete PlayersName;
		delete CA_FilterFullServers;
		delete CA_FilterPasswordedServers;
		delete CA_ServerBEFilter;
		delete CA_ServerExpansionsFilter;
		delete TabServers;
		delete CA_New;
		
		class CA_Cancel : RscButtonMenuCancel {
			y = "SafezoneY + SafezoneH - (2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			text = $STR_DISP_BACK;
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(SafezoneX)";
			w = "6.25 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class CA_BRemote : CA_Cancel {
			idc = 166;
			shortcuts[] = {};
			text = $STR_A3_RSCDISPLAYMULTIPLAYER_DIRECT_CONNECT;
			x = "16.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(SafezoneX)";
			y = "2.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w = "7.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = $STR_A3_RSCDISPLAYMULTIPLAYER_DIRECT_CONNECT_TOOLTIP;
		};
		
		delete TabQuickPlay;
		delete CA_ServerCount;
		delete TabRecent;
		delete TabFriends;
		delete TabOfficialServers;
		delete TabLAN;
		delete TabInternet;
		delete CA_FavoriteColumn;
		delete CA_MissionColumn;
		delete CA_StateColumn;
		delete CA_PingColumn;
		delete CA_ServerColumn;
		delete CA_TypeColumn;
		delete CA_PlayersColumn;
		delete CA_FavoriteIcon;
		delete CA_ServerIcon;
		delete CA_TypeIcon;
		delete CA_MissionIcon;
		delete CA_StateIcon;
		delete CA_PlayersIcon;
		delete CA_PingIcon;
		delete ButtonLauncherServerBrowser;
	};
};

class RscDisplayMain: RscStandardDisplay {
	idd=0;
	scriptName="RscDisplayMain";
	scriptPath="GUI";
	onLoad="[""onLoad"",_this,""RscDisplayMain"",'GUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay');";
	onUnload="[""onUnload"",_this,""RscDisplayMain"",'GUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay');";
	class ControlsBackground {
		class MouseArea: RscText {
			idc=999;
			style=16;
			x="safezoneXAbs";
			y="safezoneY";
			w="safezoneWAbs";
			h="safezoneH";
		};
		class BackgroundLeft: RscText {
			colorBackground[]={0.1,0.1,0.1,1};
			x="-	10";
			y="-	10";
			w="safezoneX + 	10";
			h="2 * 	10";
		};
		class BackgroundRight: BackgroundLeft {
			x="safezoneX + safezoneW";
			w=10;
		};
		class Picture: RscPicture {
			idc=998;
			text="\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\backgroundGrey.jpg";
			x="safezoneX";
			y="safezoneY";
			w="safezoneW";
			h="safezoneW * 4/3";
		};
	};
	class Controls {
		delete ModIcons;
		delete B_Quit;
		delete B_Expansions;
		delete B_Credits;
		delete B_Player;
		delete B_Options;
		delete B_SinglePlayer;
		delete B_MissionEditor;
		delete B_MultiPlayer;
		delete B_SingleMission;
		delete B_Campaign;
		delete Date;
		delete ModList;
		delete TrafficLight;
		delete Version;
		class BackgroundSpotlight: RscPicture {
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.89999998};
			x="0.5 - (1.5 * 10) * (pixelW * pixelGridNoUIScale * 2) - 2 * (2 * pixelW)";
			y="0.5 - (10 / 2) * (pixelH * pixelGridNoUIScale * 2) - (2 * pixelH)";
			w="3 * 10 * (pixelW * pixelGridNoUIScale * 2) + 4 * (2 * pixelW)";
			h="10 * (pixelH * pixelGridNoUIScale * 2) + 2 * (2 * pixelH)";
		};
		class BackgroundSpotlightLeft: BackgroundSpotlight {
			text="\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\gradient_ca.paa";
			angle=180;
			x="safezoneX";
			w="(safezoneW - (3 * 10 * (pixelW * pixelGridNoUIScale * 2) + 4 * (2 * pixelW))) / 2";
		};
		class BackgroundSpotlightRight: BackgroundSpotlightLeft {
			text="\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\gradient_ca.paa";
			angle=0;
			x="0.5 + (1.5 * 10) * (pixelW * pixelGridNoUIScale * 2) + 2 * (2 * pixelW)";
		};
		class Spotlight1 {};
		class Spotlight2 {};
		class Spotlight3: RscMainMenuSpotlight {
			idc=1022;
			x="0.5 - (0.5 * 10) * (pixelW * pixelGridNoUIScale * 2)";
			class Controls: Controls {
				class GroupPicture: GroupPicture {
					class Controls: Controls {
						class Picture: Picture {
							text="\alf_client2\textures\armalife.jpg";
						};
						class Video: Picture {
							text="\alf_client2\textures\armalife.jpg";
						};
					};
				};
				class GroupHover: GroupHover {
					class Controls: Controls {
						class Overlay: Overlay {};
						class LineLeft: LineLeft {};
						class LineRight: LineRight {};
						class LineTop: LineTop {
							text="SE CONNECTER";
						};
						class LineBottom: LineBottom {};
					};
				};
				class TextBackground: TextBackground{};
				class Text: Text {
					text="Se connecter à ALF";
				};
				class Button: Button {
					onbuttonclick="with uiNameSpace do {[_this] call ALF_fnc_join;};";
				};
			};
		};
		class SpotlightPrev {};
		class SpotlightNext {};
		class BackgroundBar: RscText {
			colorBackground[]={0,0,0,0.75};
			x="safezoneX";
			y="safezoneY + 2 * (pixelH * pixelGrid * 2)";
			w="safezoneW";
			h="2 * (pixelH * pixelGrid * 2)";
		};
		class BackgroundCenter {};
		class BackgroundBarLeft {};
		class BackgroundBarRight {};
		class Logo {};
		class LogoApex {};
		class TitleSingleplayer {};
		class TitleIconSingleplayer {};
		class GroupSingleplayer {};
		class TitleMultiplayer: RscButtonMenu {
			idc=1012;
			show=0;
			size="1.25 * (pixelH * pixelGrid * 2)";
			style="0x02 + 0xC0";
			colorBackground[]={0,0,0,0};
			colorBackground2[]={1,1,1,1};
			class Attributes {
				align="center";
				color="#ffffff";
				font="PuristaLight";
				shadow=0;
				size=1;
			};
			class TextPos {
				left="0.1 * 2 * (pixelW * pixelGrid * 2)";
				top="0.18 * 2 * (pixelH * pixelGrid * 2)";
				right="0.1 * 2 * (pixelW * pixelGrid * 2)";
				bottom="0.18 * 2 * (pixelH * pixelGrid * 2)";
			};
			x="0.5 - (5 + 10) * (pixelW * pixelGrid * 2)";
			y="safezoneY + 2 * (pixelH * pixelGrid * 2)";
			w="10 * (pixelW * pixelGrid * 2)";
			h="2 * (pixelH * pixelGrid * 2)";
			text="$STR_A3_RscDisplayMain_TitleMultiplayer_text";
		};
		class TitleIconMultiplayer: RscButton {
			idc=1112;
			show=0;
			style="0x30 + 0x800";
			y="safezoneY + 2 * (pixelH * pixelGrid * 2)";
			w="4 * (pixelW * pixelGrid * 2)";
			h="2 * (pixelH * pixelGrid * 2)";
			x="0.5 - (5 + 4) * (pixelW * pixelGrid * 2)";
			colorText[]={1,1,1,1};
			colorBackground[]={0,0,0,0};
			colorBackgroundActive[]={1,1,1,1};
			colorFocused[]={1,1,1,1};
			onMouseEnter="(_this select 0) ctrlsettextcolor [0,0,0,1];";
			onSetFocus="(_this select 0) ctrlsettextcolor [0,0,0,1];";
			onMouseExit="(_this select 0) ctrlsettextcolor [1,1,1,1];";
			onKillFocus="(_this select 0) ctrlsettextcolor [1,1,1,1];";
			text="\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\menu_multiplayer_ca.paa";
			tooltip="$STR_A3_RscDisplayMain_TitleMultiplayer_text";
		};
		class GroupMultiplayer: RscControlsGroupNoScrollbars {
			idc=1002;
			show=0;
			x="0.5 - (	5 + 	10) * 	(pixelW * pixelGrid * 2)";
			h="(3 * 	1.5) * 	(pixelH * pixelGrid * 2)";
			y="safezoneY + (2 + 		2) * 	(pixelH * pixelGrid * 2)";
			w="10 * 	(pixelW * pixelGrid * 2)";
			class Controls: Controls {
				class QuickPlay: RscButtonMenuMain {
					idc=154;
					text="$STR_A3_RscDisplayMain_GroupMultiplayer_QuickPlay_text";
					tooltip="";
					show=0;
					x=0;
					w="10 * 	(pixelW * pixelGrid * 2)";
					h="1.5 * 	(pixelH * pixelGrid * 2) - 	(pixelH)";
					y="(0 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="";
				};
				class ServerBrowser: QuickPlay {
					idc=105;
					show=0;
					text="$STR_A3_RscDisplayMain_GroupMultiplayer_ServerBrowser_text";
					tooltip="";
					y="(1 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="";
				};
				class ApexProtocol: QuickPlay {
					idc=206;
					show=0;
					text="$STR_A3_CoopCampaignName";
					tooltip="";
					y="(2 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="(finddisplay 0) createMPCampaignDisplay 'Apex';";
					Onload="(_this select 0) ctrlshow isclass (configfile >> 'cfgmissions' >> 'mpmissions' >> 'apex')";
				};
			};
		};
		class TitleTutorials {};
		class TitleIconTutorials {};
		class GroupTutorials {};
		class TitleOptions: TitleMultiplayer {
			idc=1014;
			text="$STR_A3_RscDisplayMain_TitleOptions_text";
			x="0.5 + (	5) * 	(pixelW * pixelGrid * 2)";
		};
		class TitleIconOptions: TitleIconSingleplayer {
			idc=1114;
			text="\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\menu_options_ca.paa";
			tooltip="$STR_A3_RscDisplayMain_TitleOptions_text";
			x="0.5 + (	5) * 	(pixelW * pixelGrid * 2)";
		};
		class GroupOptions: RscControlsGroupNoScrollbars {
			idc=1004;
			y="safezoneY + (2 + 		2) * 	(pixelH * pixelGrid * 2)";
			w="10 * 	(pixelW * pixelGrid * 2)";
			x="0.5 + (	5) * 	(pixelW * pixelGrid * 2)";
			h="(5 * 	1.5) * 	(pixelH * pixelGrid * 2)";
			class Controls: Controls {
				class Video: RscButtonMenuMain {
					idc=301;
					text="$STR_A3_RscDisplayMain_ButtonVideo";
					tooltip="$STR_TOOLTIP_MAIN_VIDEO";
					x=0;
					w="10 * 	(pixelW * pixelGrid * 2)";
					h="1.5 * 	(pixelH * pixelGrid * 2) - 	(pixelH)";
					y="(0 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="";
				};
				class Audio: Video {
					idc=302;
					text="$STR_A3_RscDisplayMain_ButtonAudio";
					tooltip="$STR_TOOLTIP_MAIN_AUDIO";
					y="(1 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="";
				};
				class Controls: Video {
					idc=303;
					text="$STR_A3_RscDisplayMain_ButtonControls";
					tooltip="$STR_TOOLTIP_MAIN_CONTROLS";
					y="(2 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="";
				};
				class Game: Video {
					idc=307;
					text="$STR_A3_RscDisplayMain_ButtonGame";
					tooltip="$STR_TOOLTIP_MAIN_GAME";
					y="(3 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="";
				};
				class Expansions: Video {
					idc=140;
					text="$STR_A3_RscDisplayMain_ButtonExpansions";
					tooltip="$STR_TOOLTIP_MAIN_EXPANSIONS";
					y="(4 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="";
				};
			};
		};
		class TitleSession: RscButton {
			idc=1015;
			text="\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\profile_player_ca.paa";
			style=48;
			colorText[]={1,1,1,0.5};
			colorBackground[]={0,0,0,0};
			colorBackgroundActive[]={1,1,1,1};
			colorFocused[]={0,0,0,0};
			x="safezoneX + safezoneW - 2 * 	2 * (pixelW * pixelGrid * 2)";
			y="safezoneY + 2 * (pixelH * pixelGrid * 2)";
			w="2 * (pixelW * pixelGrid * 2)";
			h="2 * (pixelH * pixelGrid * 2)";
			onMouseEnter="(_this select 0) ctrlsettextcolor [0,0,0,1];";
			onSetFocus="(_this select 0) ctrlsettextcolor [0,0,0,1];";
			onMouseExit="(_this select 0) ctrlsettextcolor [1,1,1,0.5];";
			onKillFocus="(_this select 0) ctrlsettextcolor [1,1,1,0.5];";
		};
		class GroupSession: RscControlsGroupNoScrollbars {
			idc=1005;
			x="safezoneX + safezoneW - (	10 + 		2) * 	(pixelW * pixelGrid * 2) - 	(pixelW)";
			y="safezoneY + (2 + 		2) * 	(pixelH * pixelGrid * 2)";
			w="10 * 	(pixelW * pixelGrid * 2)";
			h="(4 * 	1.5) * 	(pixelH * pixelGrid * 2)";
			class Controls: Controls {
				class Profile: RscButtonMenuMain {
					idc=109;
					text="$STR_A3_RscDisplayMain_ButtonVideo";
					x=0;
					w="10 * 	(pixelW * pixelGrid * 2)";
					h="1.5 * 	(pixelH * pixelGrid * 2) - 	(pixelH)";		
					style=0;
					tooltip="$STR_TOOLTIP_MAIN_PLAYER";
					y="(0 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="";
					class Attributes {
						align="Center";
						color="#ffffff";
						font="PuristaLight";
					};
				};
				class Unit: RscButton {
					idc=155;
					text="\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\profile_unit_ca.paa";
					tooltip="$STR_A3_RscDisplayMain_Profile_Unit_text";
					url="https://units.arma3.com/";
					style="0x02 + 0x30 + 0x800";
					onButtonClick="";
					colorBackground[]={0,0,0,0.75};
					colorBackgroundActive[]={0.37647101,0.53725499,0.21960799,1};
					x=0;
					y="(1 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					w="10 * 	(pixelW * pixelGrid * 2)";
					h="(2 * 	1.5) * 	(pixelH * pixelGrid * 2) - 	(pixelH)";
					onMouseEnter="(_this select 0) ctrlsettextcolor [1,1,1,1];";
					onSetFocus="(_this select 0) ctrlsettextcolor [1,1,1,1];";
					onMouseExit="(_this select 0) ctrlsettextcolor [1,1,1,1];";
					onKillFocus="(_this select 0) ctrlsettextcolor [1,1,1,1];";
				};
			};
		};
		class Exit: RscButton {
			idc=106;
			text="\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\exit_ca.paa";
			tooltip="$STR_TOOLTIP_MAIN_EXIT";
			style=48;
			colorText[]={1,1,1,0.5};
			colorBackground[]={0,0,0,0};
			colorBackgroundActive[]={0.78431398,0.137255,0.062745102,1};
			colorFocused[]={1,1,1,1};
			x="safezoneX + safezoneW - 	2 * (pixelW * pixelGrid * 2)";
			y="safezoneY + 2 * (pixelH * pixelGrid * 2)";
			w="2 * (pixelW * pixelGrid * 2)";
			h="2 * (pixelH * pixelGrid * 2)";
			onMouseEnter="(_this select 0) ctrlsettextcolor [1,1,1,1];";
			onSetFocus="(_this select 0) ctrlsettextcolor [1,1,1,1];";
			onMouseExit="(_this select 0) ctrlsettextcolor [1,1,1,0.5];";
			onKillFocus="(_this select 0) ctrlsettextcolor [1,1,1,0.5];";
		};
		class InfoMods {};
		class InfoDLCsOwned {};
		class InfoDLCs {};
		class InfoNews {};
		class InfoVersion {};
		class Footer {};
		class AllMissions {};
		class ProofsOfConcept {};
	};
	class IconPicture {};
	class DlcOwnedIconPicture {};
	class DlcIconPicture {};
};