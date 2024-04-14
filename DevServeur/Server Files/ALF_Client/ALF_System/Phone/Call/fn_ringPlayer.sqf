/*
	File: fn_ringPlayer.sqf
	Author: ALF Team
	Input: _Anonyme,_Number,_unit
*/
params [
	["_anonyme",false,[false]],
	["_hisNumber","",[""]]
];
if(_hisNumber isEqualTo "") exitWith {player setVariable ["call_info",0,HC3_Life];};

//Si pas de tel, exit.
private _radios = player call TFAR_fnc_radiosList;
if(count _radios isEqualTo 0) exitWith {player setVariable ["call_info",0,HC3_Life];};

//Si en appel ou autre, exit.
if(ALF_Phone_inCall OR {ALF_Phone_Ring} OR {ALF_Phone_tryCall}) exitwith {};

//Si il est en mode avion.
if (ALF_Phone_Avion) exitWith {player setVariable ["call_info",0,HC3_Life];};

//Gendarme: On vérifie si le joueur a une neogend et qu'il n'est pas en service.
if ([(call TFAR_fnc_activeSwRadio),"alf_neogend_1"] call TFAR_fnc_isSameRadio && {!(life_gendarme_service)}) exitWith {player setVariable ["call_info",0,HC3_Life];};

//Pompier: On vérifie si le joueur a une sony et qu'il n'est pas en service.
if ([(call TFAR_fnc_activeSwRadio),"alf_sony_1"] call TFAR_fnc_isSameRadio && {!(life_pompier_service)}) exitWith {player setVariable ["call_info",0,HC3_Life];};

//Tout est bon. On lance la sonnerie.
ALF_Phone_Ring = true;
ALF_Phone_CallNumber = _hisNumber;
ALF_Phone_CallAnonyme = _anonyme;

[] spawn ALF_fnc_doCallIn;

if !(isNull (findDisplay 20000)) then {
	uiNamespace setVariable ['nokiamenu',0];
	[] call ALF_fnc_menuNokia;
};
if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',0];
	[] call ALF_fnc_menuiPhone;
};
if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
};
if !(isNull (findDisplay 38999)) then {
	uiNamespace setVariable ['sonyp',0];
	[] call ALF_fnc_menuSonyP;
};

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,ALF_Phone_CallAnonyme,1,ALF_Phone_CallNumber];
ALF_Phone_Historique pushBack _data;

private _myRadio = call TFAR_fnc_activeSwRadio;

for "_i" from 0 to 5 step 1 do {
	if !(ALF_Phone_Ring) exitWith {};
	if !(life_is_alive) exitWith {};

	private _radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {};

	if !(ALF_Phone_Mute) then {
		if([(call TFAR_fnc_activeSwRadio),"alf_3310_1"] call TFAR_fnc_isSameRadio) then {
			[player,"nokia_ring"] remoteExecCall ["life_fnc_say3D",0];
		};
		if([(call TFAR_fnc_activeSwRadio),"alf_iphone_1"] call TFAR_fnc_isSameRadio) then {
			[] spawn ALF_fnc_iPhoneRing;
		};
		if([(call TFAR_fnc_activeSwRadio),"alf_neogend_1"] call TFAR_fnc_isSameRadio) then {
			[player,"SonyRing"] remoteExecCall ["life_fnc_say3D",0];
		};
		if([(call TFAR_fnc_activeSwRadio),"alf_sony_1"] call TFAR_fnc_isSameRadio) then {
			[player,"SonyRing"] remoteExecCall ["life_fnc_say3D",0];
		};
	} else {
		playSound "ring_vibreur";
	};
	sleep 5;
};
if(ALF_Phone_Ring) exitWith {[] call ALF_fnc_resetcall;};
