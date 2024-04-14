/*
	File: fn_houseMenu.sqf
	Author: ALF TEAM
*/
if !(isNull (findDisplay 25799)) exitWith {};

params[
	["_curTarget",objNull,[objNull]]
];
if(isNull _curTarget) exitWith {};
if !(_curTarget isKindOf "House") exitWith {};

private _houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
if(count(_houseCfg) isEqualTo 0) exitWith {};

life_pInact_curTarget = _curTarget;

disableSerialization;
if(!dialog) then {
	createDialog "interactionSystem";
};

private _display = findDisplay 25799;
private _Pic1 = _display displayCtrl 25800;
private _Pic2 = _display displayCtrl 25801;
private _Btn1 = _display displayCtrl 25802;
private _Btn2 = _display displayCtrl 25803;
private _Btn3 = _display displayCtrl 25804;
private _Btn4 = _display displayCtrl 25805;
private _Btn5 = _display displayCtrl 25806;
private _Btn6 = _display displayCtrl 25807;
private _Btn7 = _display displayCtrl 25808;
private _Btn8 = _display displayCtrl 25809;
private _Btn9 = _display displayCtrl 25810;
private _Btn10 = _display displayCtrl 25811;
private _Btn11 = _display displayCtrl 25812;
private _Btn12 = _display displayCtrl 25813;
private _BtnMenu = _display displayCtrl 25814;

{_x ctrlShow false;} forEach [_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10,_Btn11,_Btn12,_BtnMenu,_Pic2];

_Btn1 ctrlSetText "RECEPTION DES DONNEES..";
_Btn1 ctrlEnable false;

ALF_House_Data = [];
[_curTarget] remoteExecCall ["HC_fnc_recupHouseData",HC2_Life];
waitUntil {count(ALF_House_Data) isEqualTo 2 OR {isNull (findDisplay 25799)}};
if(isNull (findDisplay 25799)) exitWith {};

ALF_House_Data params [
	["_house_owner",[],[[]]],
	["_sonnette",0,[0]]
];

if(count(_house_owner) isEqualTo 0) then {
	_Btn1 ctrlSetText "ACHETER MAISON";
	_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyHouse;";
	_Btn1 ctrlShow true;
	_Btn1 ctrlEnable true;
} else {
	if ((_house_owner select 0) isEqualTo (getPlayerUID player) OR {_curTarget in life_vehicles}) then {
		
		if ((_house_owner select 0) isEqualTo (getPlayerUID player)) then {
			_Btn1 ctrlSetText "VENDRE MAISON";
			_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
			_Btn1 ctrlShow true;
			_Btn1 ctrlEnable true;
		};

		if(isNull (_curTarget getVariable ["lightSource",objNull])) then {
			_Btn3 ctrlSetText "ALLUMER LUMIERES";
		} else {
			_Btn3 ctrlSetText "ETEINDRE LUMIERES";
		};
		_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlShow true;

		_Btn4 ctrlSetText "BOITE AUX LETTRES";
		_Btn4 buttonSetAction "[life_pInact_curTarget] call ALF_fnc_menuMailbox;";
		_Btn4 ctrlShow true;

		if((typeOf _curTarget) in ["Land_ALF_Caravane"] && {"ALF_Barrel_boite" in (magazines player)} && {(_house_owner select 0) isEqualTo (getPlayerUID player)}) then {
			_Btn5 ctrlSetText "POSER BARIL EN BOIS";
			_Btn5 buttonSetAction "[life_pInact_curTarget,player] remoteExecCall [""HC_fnc_poserBaril"",HC2_Life]; closeDialog 0;";
			_Btn5 ctrlShow true;
		};

		if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then {
			_Btn5 ctrlSetText "ACCEDER AU GARAGE";
			_Btn5 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
			_Btn5 ctrlShow true;

			_Btn6 ctrlSetText "RANGER VEHICULE";
			_Btn6 buttonSetAction "[life_pInact_curTarget,player,[],[0,""CAR""]] spawn life_fnc_storeVehicle; closeDialog 0;";
			_Btn6 ctrlShow true;
		};

		if("ALF_Sonnette4G" in (magazines player) && {_sonnette isEqualTo 0} && {(_house_owner select 0) isEqualTo (getPlayerUID player)}) then {
			_Btn12 ctrlSetText "INSTALLER SONNETTE";
			_Btn12 buttonSetAction "[life_pInact_curTarget,player] remoteExecCall [""HC_fnc_sonnetteHouse"",HC2_Life]; closeDialog 0;";
			_Btn12 ctrlShow true;
		};
	} else {
		_Btn1 ctrlSetText "VENDU";
		_Btn1 ctrlEnable false;

		if (_sonnette isEqualTo 1) then {
			_Btn2 ctrlSetText "SONNER";
			_Btn2 buttonSetAction "
				if (isNull life_pInact_curTarget) exitWith {};
				[life_pInact_curTarget] remoteExecCall [""HC_fnc_playSonnetteHouse"",HC2_Life];
				closeDialog 0;
			";
			_Btn2 ctrlShow true;
		};
	};
};

//GENDARMERIE
if(life_gendarme_service) then {
	if(count(_house_owner) > 0) then {
		_Btn7 ctrlSetText "[G] VERIFIER PROPRIO";
		_Btn7 buttonSetAction "[] call life_fnc_copHouseOwner;";
		_Btn7 ctrlShow true;

		_Btn8 ctrlSetText "[G] ENFONCER LA PORTE";
		_Btn8 buttonSetAction "[life_pInact_curTarget,0] spawn life_fnc_copBreakDoor; closeDialog 0;";
		_Btn8 ctrlShow true;

		_Btn10 ctrlSetText "[G] VERROUILLER MAISON";
		_Btn10 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
		_Btn10 ctrlShow true;
	};
};
