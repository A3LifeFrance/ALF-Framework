/*
	File : mobilierMenu.sqf
	Author: ALF Team
*/
if !(isNull (findDisplay 37400)) exitWith {};

params[
	["_mobilier",objNull,[objNull]]
];
if(isNull _mobilier) exitWith {};

disableSerialization;
if(!dialog) then {
	createDialog "pInteraction_Menu";
};

private _display = findDisplay 37400;
private _Btn1 = _display displayCtrl 37450;
private _Btn2 = _display displayCtrl 37451;
private _Btn3 = _display displayCtrl 37452;
private _Btn4 = _display displayCtrl 37453;
private _Btn5 = _display displayCtrl 37454;
private _Btn6 = _display displayCtrl 37455;
private _Btn7 = _display displayCtrl 37456;
private _Btn8 = _display displayCtrl 37457;

{_x ctrlShow false;} forEach [_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8];

_Btn1 ctrlSetText "RECEPTION DES DONNEES..";
_Btn1 ctrlEnable false;

private _name = (getModelInfo _mobilier) select 1;
if(isNil "_name") exitWith {};

ALF_Mobilier_Data = [];
[_mobilier] remoteExecCall ["HC_fnc_recupMobilierData",HC2_Life];
waitUntil {count(ALF_Mobilier_Data) isEqualTo 6 OR {isNull (findDisplay 37400)}};
if(isNull (findDisplay 37400)) exitWith {};

life_pInact_mobilier = _mobilier;

if (ALF_Mobilier_Data isEqualTo [-1,0,0,0,0,0]) exitWith {
	//CHAISES
	if (!(jesuisassis) && {(typeOf(_mobilier) isEqualTo "Land_OfficeChair_01_F") || (_name in ["alf_mobiliers\alf_batterie\alf_batterie.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_5.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_4.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_3.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_2.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_1.p3d","alf_mobiliers\alf_chaise\alf_chaise_5.p3d","alf_mobiliers\alf_chaise\alf_chaise_4.p3d","alf_mobiliers\alf_chaise\alf_chaise_3.p3d","alf_mobiliers\alf_chaise\alf_chaise_2.p3d","alf_mobiliers\alf_chaise\alf_chaise_1.p3d"])}) then {
		_Btn1 ctrlSetText "S'ASSOIR";
		_Btn1 buttonSetAction "closeDialog 37400; [life_pInact_mobilier,""action""] call ALF_fnc_sitDown;";
		_Btn1 ctrlShow true;
		_Btn1 ctrlEnable true;
	} else {
		closeDialog 37400;
	};
};

ALF_Mobilier_Data params [
	["_owner","",[""]],
	["_id",-1,[0]],
	["_classname","",[""]],
	["_house",objNull,[objNull]],
	["_safe","",[""]],
	["_locked",false,[false]]
];

if(_owner isEqualTo "" OR {_id isEqualTo -1} OR {_classname isEqualTo ""} OR {isNull _house} OR {_safe isEqualTo ""}) exitWith {
	_Btn1 ctrlSetText "ERREUR..";
	_Btn1 ctrlEnable false;
};

private _perced = _mobilier getVariable ["perced",false];

//BTN 1
if((typeOf _house) isEqualTo "Land_ALF_Entreprise") then {
	private _owner2 = _house getVariable["business",[""]] select 0;
	if (_owner2 isEqualTo (getPlayerUID player)) then {
		_Btn1 ctrlSetText "Retirer le mobilier";
		_Btn1 buttonSetAction "[life_pInact_mobilier] spawn life_fnc_removeMobilier; closeDialog 37400;";
		_Btn1 ctrlShow true;
		_Btn1 ctrlEnable true;
	} else {
		if (life_coplevel > 5) then {
			_Btn1 ctrlSetText "Detruire le mobilier";
			_Btn1 buttonSetAction "[life_pInact_mobilier] spawn life_fnc_copRemovemobilier; closeDialog 37400;";
			_Btn1 ctrlShow true;
			_Btn1 ctrlEnable true;
		} else {
			_Btn1 ctrlShow false;
			_Btn1 ctrlEnable false;
		};
	};
} else {
	if (_owner isEqualTo (getPlayerUID player)) then {
		_Btn1 ctrlSetText "Retirer le mobilier";
		_Btn1 buttonSetAction "[life_pInact_mobilier] spawn life_fnc_removeMobilier; closeDialog 37400;";
		_Btn1 ctrlShow true;
		_Btn1 ctrlEnable true;
	} else {
		if (life_coplevel > 5) then {
			_Btn1 ctrlSetText "Detruire le mobilier";
			_Btn1 buttonSetAction "[life_pInact_mobilier] spawn life_fnc_copRemovemobilier; closeDialog 37400;";
			_Btn1 ctrlShow true;
			_Btn1 ctrlEnable true;
		} else {
			_Btn1 ctrlShow false;
			_Btn1 ctrlEnable false;
		};
	};
};

//BTN 2
if(_name isEqualTo "alf_objects\table_weed\table_weed.p3d" && {{_x isEqualTo "ALF_Weed"} count (magazines player) >= 5}) then {
	_Btn2 ctrlSetText "Couper OG Kush";
	_Btn2 buttonSetAction "[0] spawn ALF_fnc_couperWeed; closeDialog 37400;";
	_Btn2 ctrlShow true;
};
if(_name isEqualTo "alf_objects\table_weed\table_weed.p3d" && {{_x isEqualTo "ALF_Weed_2"} count (magazines player) >= 5}) then {
	_Btn2 ctrlSetText "Couper White Widow";
	_Btn2 buttonSetAction "[1] spawn ALF_fnc_couperWeed; closeDialog 37400;";
	_Btn2 ctrlShow true;
};
if(_name isEqualTo "alf_objects\table_weed\table_weed.p3d" && {{_x isEqualTo "ALF_Weed_3"} count (magazines player) >= 5}) then {
	_Btn2 ctrlSetText "Couper Amnesia";
	_Btn2 buttonSetAction "[2] spawn ALF_fnc_couperWeed; closeDialog 37400;";
	_Btn2 ctrlShow true;
};
if(_name isEqualTo "alf_mobiliers\alf_security\alf_security.p3d" && {player distance _mobilier < 2} && {speed player isEqualto 0} && {"ALF_laptop_unfolded_f" in (magazines player)}) then {
	_Btn2 ctrlSetText "Brancher ASUS Portable GX11";
	_Btn2 buttonSetAction "[life_pInact_mobilier] spawn ALF_fnc_checkSecurityCam;";
	_Btn2 ctrlShow true;
};
if(_name in ["alf_mobiliers\alf_barrel\barrel.p3d","alf_mobiliers\alf_chest\alf_chest.p3d","alf_mobiliers\alf_tv_2\alf_tv_2.p3d","alf_mobiliers\alf_tv_1\alf_tv_1.p3d","alf_mobiliers\alf_stock_2\alf_stock_2.p3d","alf_mobiliers\alf_stock_1\alf_stock_1.p3d","alf_mobiliers\alf_lit_2\alf_lit_5.p3d","alf_mobiliers\alf_lit_2\alf_lit_4.p3d","alf_mobiliers\alf_lit_2\alf_lit_3.p3d","alf_mobiliers\alf_lit_2\alf_lit_1.p3d","alf_mobiliers\alf_lit_2\alf_lit_2.p3d","alf_mobiliers\alf_lit_1\alf_lit_5.p3d","alf_mobiliers\alf_lit_1\alf_lit_4.p3d","alf_mobiliers\alf_lit_1\alf_lit_3.p3d","alf_mobiliers\alf_lit_1\alf_lit_1.p3d","alf_mobiliers\alf_lit_1\alf_lit_2.p3d","a3\structures_f_heli\items\electronics\fridge_01_f.p3d","alf_items_2019\alf_frigo_basique.p3d","alf_mobiliers\alf_canap_2\alf_canap_2.p3d","alf_mobiliers\alf_canap_1\alf_canap_5.p3d","alf_mobiliers\alf_canap_1\alf_canap_4.p3d","alf_mobiliers\alf_canap_1\alf_canap_3.p3d","alf_mobiliers\alf_canap_1\alf_canap_1.p3d","alf_mobiliers\alf_canap_1\alf_canap_2.p3d","a3\structures_f_heli\items\electronics\fridge_01_f.p3d","alf_mobiliers\alf_frigo\alf_frigo.p3d","alf_items_2019\alf_cavevin.p3d"]) then {
	_Btn2 ctrlSetText "INVENTAIRE";
	_Btn2 buttonSetAction "[life_pInact_mobilier] call life_fnc_mobilierInv;";
	_Btn2 ctrlShow true;
};

//CHAISES
if(!(jesuisassis) && {_name in ["alf_mobiliers\alf_batterie\alf_batterie.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_5.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_4.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_3.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_2.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_1.p3d","alf_mobiliers\alf_chaise\alf_chaise_5.p3d","alf_mobiliers\alf_chaise\alf_chaise_4.p3d","alf_mobiliers\alf_chaise\alf_chaise_3.p3d","alf_mobiliers\alf_chaise\alf_chaise_2.p3d","alf_mobiliers\alf_chaise\alf_chaise_1.p3d"]}) then {
	_Btn2 ctrlSetText "S'ASSOIR";
	_Btn2 buttonSetAction "closeDialog 37400; [life_pInact_mobilier,""action""] call ALF_fnc_sitDown;";
	_Btn2 ctrlShow true;
};

//CANAPE
if(!(jesuisassis) && {_name in ["alf_mobiliers\alf_canap_2\alf_canap_2.p3d","alf_mobiliers\alf_canap_1\alf_canap_5.p3d","alf_mobiliers\alf_canap_1\alf_canap_4.p3d","alf_mobiliers\alf_canap_1\alf_canap_3.p3d","alf_mobiliers\alf_canap_1\alf_canap_1.p3d","alf_mobiliers\alf_canap_1\alf_canap_2.p3d"]}) then {
	_Btn3 ctrlSetText "S'ASSOIR GAUCHE";
	_Btn3 buttonSetAction "closeDialog 37400; [life_pInact_mobilier,""action""] call ALF_fnc_sitDown;";
	_Btn3 ctrlShow true;
};
if(!(jesuisassis) && {_name in ["alf_mobiliers\alf_canap_2\alf_canap_2.p3d","alf_mobiliers\alf_canap_1\alf_canap_5.p3d","alf_mobiliers\alf_canap_1\alf_canap_4.p3d","alf_mobiliers\alf_canap_1\alf_canap_3.p3d","alf_mobiliers\alf_canap_1\alf_canap_1.p3d","alf_mobiliers\alf_canap_1\alf_canap_2.p3d"]}) then {
	_Btn4 ctrlSetText "S'ASSOIR MILIEU";
	_Btn4 buttonSetAction "closeDialog 37400; [life_pInact_mobilier,""action2""] call ALF_fnc_sitDown;";
	_Btn4 ctrlShow true;
};
if(!(jesuisassis) && {_name in ["alf_mobiliers\alf_canap_2\alf_canap_2.p3d","alf_mobiliers\alf_canap_1\alf_canap_5.p3d","alf_mobiliers\alf_canap_1\alf_canap_4.p3d","alf_mobiliers\alf_canap_1\alf_canap_3.p3d","alf_mobiliers\alf_canap_1\alf_canap_1.p3d","alf_mobiliers\alf_canap_1\alf_canap_2.p3d"]}) then {
	_Btn5 ctrlSetText "S'ASSOIR DROITE";
	_Btn5 buttonSetAction "closeDialog 37400; [life_pInact_mobilier,""action3""] call ALF_fnc_sitDown;";
	_Btn5 ctrlShow true;
};

//COFFRE SECURISER
if(_name isEqualTo "alf_mobiliers\alf_safe_1\alf_safe_1.p3d" && {!(_safe isEqualTo "0000")}) then {
	_Btn2 ctrlSetText "ENTRER CODE";
	_Btn2 buttonSetAction "[life_pInact_mobilier,0] call life_fnc_paramSafe;";
	_Btn2 ctrlShow true;
};

//PROPRIO DU COFFRE
if((typeOf _house) isEqualTo "Land_ALF_Entreprise") then {
	if(_name isEqualTo "alf_mobiliers\alf_safe_1\alf_safe_1.p3d") then {
		private _owner2 = _house getVariable["business",[""]] select 0;
		if (_owner2 isEqualTo (getPlayerUID player)) then {
			_Btn3 ctrlSetText "PARAMETRER";
			_Btn3 buttonSetAction "[life_pInact_mobilier,1] call life_fnc_paramSafe;";
			_Btn3 ctrlShow true;
		};
	};
} else {
	if(_name isEqualTo "alf_mobiliers\alf_safe_1\alf_safe_1.p3d" && {_owner isEqualTo (getPlayerUID player)}) then {
		_Btn3 ctrlSetText "PARAMETRER";
		_Btn3 buttonSetAction "[life_pInact_mobilier,1] call life_fnc_paramSafe;";
		_Btn3 ctrlShow true;
	};
};

//COFFRE PERCE
if(_name isEqualTo "alf_mobiliers\alf_safe_1\alf_safe_1.p3d" && {_perced}) then {
	_Btn4 ctrlSetText "INVENTAIRE";
	_Btn4 buttonSetAction "[life_pInact_mobilier] call life_fnc_mobilierInv;";
	_Btn4 ctrlShow true;
};

////BTN 7 & 8
if(life_gendarme_service) then {
	_Btn7 ctrlSetText "[G] Forcer coffre";
	_Btn7 buttonSetAction "[life_pInact_mobilier,0] spawn life_fnc_mobilierInvSearch; closeDialog 37400;";
	_Btn7 ctrlShow true;

	_Btn8 ctrlSetText "[G] Recueillir ADN";
	_Btn8 buttonSetAction "[life_pInact_mobilier] spawn ALF_fnc_adnMobilier; closeDialog 37400;";
	_Btn8 ctrlShow true;
} else {
	if("ALF_Lockpick" in (magazines player)) then {
		_Btn7 ctrlSetText "Forcer coffre";
		_Btn7 buttonSetAction "[life_pInact_mobilier,1] spawn life_fnc_mobilierInvSearch; closeDialog 37400;";
		_Btn7 ctrlShow true;
	};
};
