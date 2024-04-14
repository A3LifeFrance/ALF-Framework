/*
	File: fn_callInProgress.sqf
	Author: ALF Team
*/
params [
	["_callID",0,[0]],
	["_central",false,[false]]
];

ALF_Phone_Ring = false;
ALF_Phone_tryCall = false;

player setVariable ["callFrequence",_callID];

ALF_Phone_inCall = true;
player setVariable ["tf_unable_to_use_radio",true];

if(_central) then {
	ALF_Central = true;
};

if !(isNull ALF_PhoneObject) then {
	switch (true) do {
		case ([(call TFAR_fnc_activeSwRadio),"alf_3310_1"] call TFAR_fnc_isSameRadio): {
			player playActionNow "ALF_Tel";
			//ALF_PhoneObject = "ALF_3310_Object" createVehicle [0,0,1000];
			//[ALF_PhoneObject,false] remoteExecCall ["enableSimulationGlobal",2];
			[] spawn {
				uiSleep 0.3;
				if (vehicle player isEqualTo player) then {
					ALF_PhoneObject attachTo [player, [0.02,0.01,0.15], "RightHandMiddle1"];
					ALF_PhoneObject setVectorDirAndUp [[-0.21017,0.265195,-0.94101],[-0.949623,0.173499,0.260989]];
				} else {
					ALF_PhoneObject attachTo [(vehicle player),((vehicle player) worldToModel (player modelToWorldVisual ((player selectionPosition "RightHandMiddle1") vectorAdd [0.02,0.01,0.15])))];
					ALF_PhoneObject setVectorDirAndUp [[-0.21017,0.265195,-0.94101],[-0.949623,0.173499,0.260989]];
				};
			};
		};
		case ([(call TFAR_fnc_activeSwRadio),"alf_iphone_1"] call TFAR_fnc_isSameRadio): {
			player playActionNow "ALF_Tel";
			//ALF_PhoneObject = "ALF_Iphone_Object" createVehicle [0,0,1000];
			//[ALF_PhoneObject,false] remoteExecCall ["enableSimulationGlobal",2];
			[] spawn {
				uiSleep 0.3;
				if (vehicle player isEqualTo player) then {
					ALF_PhoneObject attachTo [player, [0.02,0.01,0.15], "RightHandMiddle1"];
					ALF_PhoneObject setVectorDirAndUp [[-0.21017,0.265195,-0.94101],[-0.949623,0.173499,0.260989]];
				} else {
					ALF_PhoneObject attachTo [(vehicle player),((vehicle player) worldToModel (player modelToWorldVisual ((player selectionPosition "RightHandMiddle1") vectorAdd [0.02,0.01,0.15])))];
					ALF_PhoneObject setVectorDirAndUp [[-0.21017,0.265195,-0.94101],[-0.949623,0.173499,0.260989]];
				};
			};
		};
	};
};

//On actualise les menus.
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

//On connecte la radio TFAR.
private _radio = call TFAR_fnc_activeSwRadio;
[_radio, 1, _callID] call TFAR_fnc_SetChannelFrequency;
[_radio, 2] call TFAR_fnc_setSwStereo;

//Radio additionnel? On bypass le temps de l'appel.
if !(ALF_Sony_FreqAdd isEqualTo 0) then {
	[_radio, 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
};

private _pluginCommand = format [
	"TANGENT	PRESSED	%1%2	%3	%4	%5",
	call TFAR_fnc_currentSWFrequency,
	_radio call TFAR_fnc_getSwRadioCode,
	([_radio, "tf_range", 0] call TFAR_fnc_getWeaponConfigProperty) * (call TFAR_fnc_getTransmittingDistanceMultiplicator),
	([_radio, "tf_subtype", "digital"] call TFAR_fnc_getWeaponConfigProperty),
	_radio
];

["", _pluginCommand, 0] call TFAR_fnc_processTangent;

//On lance le temps de l'appel
[] spawn ALF_fnc_callTime;

//On lance la boucle de vérification.
private _myRadio = call TFAR_fnc_activeSwRadio;
private _myFrequence = call TFAR_fnc_currentSWFrequency;
private _myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
private _myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;

if(_myRadio call TFAR_fnc_getSwSpeakers) then {
	[_myRadio] call TFAR_fnc_setSwSpeakers;
};
[_myRadio,5] call TFAR_fnc_setSwVolume;

for "_i" from 0 to 1 step 0 do {
	if !(ALF_Phone_inCall) exitWith {};
	if !(life_is_alive) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};

	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	private _radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	if !(currentWeapon player isEqualTo "") then {
        life_curWep_h = currentWeapon player;
        player action ["SwitchWeapon", player, player, 100];
        player switchCamera cameraView;
        player playActionNow "ALF_Tel";
    };
	uiSleep 0.1;
};
