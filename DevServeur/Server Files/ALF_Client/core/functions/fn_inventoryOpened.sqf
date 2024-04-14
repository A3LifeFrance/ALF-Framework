#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_inventoryOpened.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cursorObject","_unit","_list"];
if(EQUAL(count _this,1)) exitWith {false};
_unit = SEL(_this,0);
_cursorObject = SEL(_this,1);

_isPack = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,typeOf _cursorObject,"isBackpack");
if(EQUAL(_isPack,1)) exitWith {
	hint "Tu ne peux pas fouiller les gens comme ça.";
	true;
};

_list = ["LandVehicle","Ship","Air"];
if(KINDOF_ARRAY(_cursorObject,_list)) exitWith {
	if (!(_cursorObject in life_vehicles) && {(locked _cursorObject) isEqualTo 2}) exitWith {
		hint "Le véhicule est vérouillé.";
		true;
	};
};

if ([_unit] call ALF_fnc_checkMenotter) exitWith {
	true;
};

if(_cursorObject isKindOf "Man" && !alive _cursorObject) exitWith {
	true;
};

//Coffre de prison
if(_cursorObject in [alf_coffre_prison_1,alf_coffre_prison_2,alf_coffre_prison_3,alf_coffre_prison_4,alf_coffre_prison_5,alf_coffre_prison_6,alf_coffre_prison_7,alf_coffre_prison_8,alf_coffre_prison_9,alf_coffre_prison_10,alf_coffre_prison_11,alf_coffre_prison_12,alf_coffre_prison_13,alf_coffre_prison_14,alf_coffre_prison_15,alf_coffre_prison_16,alf_coffre_prison_17,alf_coffre_prison_18,alf_coffre_prison_19,alf_coffre_prison_20]) exitWith {
	if((_cursorObject animationSourcePhase "safe_source") < 0.5) exitWith {
		switch (ALF_Prison_Coffre) do {
			case 0 : {hint "Ce coffre est cadnasé."; true;};
			case 1 : {if !(_cursorObject isEqualTo alf_coffre_prison_1) then {hint "Ce coffre est cadnasé."; true;};};
			case 2 : {if !(_cursorObject isEqualTo alf_coffre_prison_2) then {hint "Ce coffre est cadnasé."; true;};};
			case 3 : {if !(_cursorObject isEqualTo alf_coffre_prison_3) then {hint "Ce coffre est cadnasé."; true;};};
			case 4 : {if !(_cursorObject isEqualTo alf_coffre_prison_4) then {hint "Ce coffre est cadnasé."; true;};};
			case 5 : {if !(_cursorObject isEqualTo alf_coffre_prison_5) then {hint "Ce coffre est cadnasé."; true;};};
			case 6 : {if !(_cursorObject isEqualTo alf_coffre_prison_6) then {hint "Ce coffre est cadnasé."; true;};};
			case 7 : {if !(_cursorObject isEqualTo alf_coffre_prison_7) then {hint "Ce coffre est cadnasé."; true;};};
			case 8 : {if !(_cursorObject isEqualTo alf_coffre_prison_8) then {hint "Ce coffre est cadnasé."; true;};};
			case 9 : {if !(_cursorObject isEqualTo alf_coffre_prison_9) then {hint "Ce coffre est cadnasé."; true;};};
			case 10 : {if !(_cursorObject isEqualTo alf_coffre_prison_10) then {hint "Ce coffre est cadnasé."; true;};};
			case 11 : {if !(_cursorObject isEqualTo alf_coffre_prison_11) then {hint "Ce coffre est cadnasé."; true;};};
			case 12 : {if !(_cursorObject isEqualTo alf_coffre_prison_12) then {hint "Ce coffre est cadnasé."; true;};};
			case 13 : {if !(_cursorObject isEqualTo alf_coffre_prison_13) then {hint "Ce coffre est cadnasé."; true;};};
			case 14 : {if !(_cursorObject isEqualTo alf_coffre_prison_14) then {hint "Ce coffre est cadnasé."; true;};};
			case 15 : {if !(_cursorObject isEqualTo alf_coffre_prison_15) then {hint "Ce coffre est cadnasé."; true;};};
			case 16 : {if !(_cursorObject isEqualTo alf_coffre_prison_16) then {hint "Ce coffre est cadnasé."; true;};};
			case 17 : {if !(_cursorObject isEqualTo alf_coffre_prison_17) then {hint "Ce coffre est cadnasé."; true;};};
			case 18 : {if !(_cursorObject isEqualTo alf_coffre_prison_18) then {hint "Ce coffre est cadnasé."; true;};};
			case 19 : {if !(_cursorObject isEqualTo alf_coffre_prison_19) then {hint "Ce coffre est cadnasé."; true;};};
			case 20 : {if !(_cursorObject isEqualTo alf_coffre_prison_20) then {hint "Ce coffre est cadnasé."; true;};};
		};
	};

	if((_cursorObject animationSourcePhase "piege_source") < 0.5) exitWith {
		switch (ALF_Prison_Coffre) do {
			case 0 : {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};
			case 1 : {if !(_cursorObject isEqualTo alf_coffre_prison_1) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 2 : {if !(_cursorObject isEqualTo alf_coffre_prison_2) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 3 : {if !(_cursorObject isEqualTo alf_coffre_prison_3) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 4 : {if !(_cursorObject isEqualTo alf_coffre_prison_4) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 5 : {if !(_cursorObject isEqualTo alf_coffre_prison_5) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 6 : {if !(_cursorObject isEqualTo alf_coffre_prison_6) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 7 : {if !(_cursorObject isEqualTo alf_coffre_prison_7) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 8 : {if !(_cursorObject isEqualTo alf_coffre_prison_8) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 9 : {if !(_cursorObject isEqualTo alf_coffre_prison_9) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 10 : {if !(_cursorObject isEqualTo alf_coffre_prison_10) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 11 : {if !(_cursorObject isEqualTo alf_coffre_prison_11) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 12 : {if !(_cursorObject isEqualTo alf_coffre_prison_12) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 13 : {if !(_cursorObject isEqualTo alf_coffre_prison_13) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 14 : {if !(_cursorObject isEqualTo alf_coffre_prison_14) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 15 : {if !(_cursorObject isEqualTo alf_coffre_prison_15) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 16 : {if !(_cursorObject isEqualTo alf_coffre_prison_16) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 17 : {if !(_cursorObject isEqualTo alf_coffre_prison_17) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 18 : {if !(_cursorObject isEqualTo alf_coffre_prison_18) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 19 : {if !(_cursorObject isEqualTo alf_coffre_prison_19) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
			case 20 : {if !(_cursorObject isEqualTo alf_coffre_prison_20) then {true; private _bomb = "Bo_GBU12_LGB" createVehicle (getpos _cursorObject); [_cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];};};
		};
	};
	
	if(life_penit isEqualTo 0 && {!life_gendarme_service}) then {
		switch (ALF_Prison_Coffre) do {
			case 0 : {hint "Ce n'est pas ta cellule."; true;};
			case 1 : {if !(_cursorObject isEqualTo alf_coffre_prison_1) then {hint "Ce n'est pas ta cellule."; true;};};
			case 2 : {if !(_cursorObject isEqualTo alf_coffre_prison_2) then {hint "Ce n'est pas ta cellule."; true;};};
			case 3 : {if !(_cursorObject isEqualTo alf_coffre_prison_3) then {hint "Ce n'est pas ta cellule."; true;};};
			case 4 : {if !(_cursorObject isEqualTo alf_coffre_prison_4) then {hint "Ce n'est pas ta cellule."; true;};};
			case 5 : {if !(_cursorObject isEqualTo alf_coffre_prison_5) then {hint "Ce n'est pas ta cellule."; true;};};
			case 6 : {if !(_cursorObject isEqualTo alf_coffre_prison_6) then {hint "Ce n'est pas ta cellule."; true;};};
			case 7 : {if !(_cursorObject isEqualTo alf_coffre_prison_7) then {hint "Ce n'est pas ta cellule."; true;};};
			case 8 : {if !(_cursorObject isEqualTo alf_coffre_prison_8) then {hint "Ce n'est pas ta cellule."; true;};};
			case 9 : {if !(_cursorObject isEqualTo alf_coffre_prison_9) then {hint "Ce n'est pas ta cellule."; true;};};
			case 10 : {if !(_cursorObject isEqualTo alf_coffre_prison_10) then {hint "Ce n'est pas ta cellule."; true;};};
			case 11 : {if !(_cursorObject isEqualTo alf_coffre_prison_11) then {hint "Ce n'est pas ta cellule."; true;};};
			case 12 : {if !(_cursorObject isEqualTo alf_coffre_prison_12) then {hint "Ce n'est pas ta cellule."; true;};};
			case 13 : {if !(_cursorObject isEqualTo alf_coffre_prison_13) then {hint "Ce n'est pas ta cellule."; true;};};
			case 14 : {if !(_cursorObject isEqualTo alf_coffre_prison_14) then {hint "Ce n'est pas ta cellule."; true;};};
			case 15 : {if !(_cursorObject isEqualTo alf_coffre_prison_15) then {hint "Ce n'est pas ta cellule."; true;};};
			case 16 : {if !(_cursorObject isEqualTo alf_coffre_prison_16) then {hint "Ce n'est pas ta cellule."; true;};};
			case 17 : {if !(_cursorObject isEqualTo alf_coffre_prison_17) then {hint "Ce n'est pas ta cellule."; true;};};
			case 18 : {if !(_cursorObject isEqualTo alf_coffre_prison_18) then {hint "Ce n'est pas ta cellule."; true;};};
			case 19 : {if !(_cursorObject isEqualTo alf_coffre_prison_19) then {hint "Ce n'est pas ta cellule."; true;};};
			case 20 : {if !(_cursorObject isEqualTo alf_coffre_prison_20) then {hint "Ce n'est pas ta cellule."; true;};};
		};
	};
};
