#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_insureSystem.sqf
	Author: ALF Team

	Description:
	Insure a vehicle from the garage.
*/

disableSerialization;
if(lbCurSel 2802 isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
private _vehicle = lbData[2802,(lbCurSel 2802)];
private _data = parseSimpleArray _vehicle;
_vehicle = (call compile format["%1",_vehicle]) select 0;
private _vid = lbValue[2802,(lbCurSel 2802)];
private _pid = getPlayerUID player;
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if (_data isEqualTo []) exitWith {["INFO","Erreur lors de la demande d'assurance du vehicule.","warning"] spawn ALF_fnc_doMsg;};

private _insurecount = _data select 4;

private "_p";
if (_insurecount isEqualTo 0) then {
	_p = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicle,"assurance");
} else {
	_p = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicle,"assurance") * (_insurecount + 1);
};

private _exit = false;
private _m = _this select 0;
switch (_m) do {
	case 0 : {
		life_axacount = life_axacount - 1;
		[0,_vid,_pid,player] remoteExecCall ["HC_fnc_insureVehicles",HC2_Life];
		[name player,_pid,"ASSURANCE",format["A résilié assurance de son véhicule perso. numéro #%1.",_vid]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};
	case 1 : {
		private _action = [format["Es-tu sur de vouloir assurer ce véhicule? Frais d'assurance: %1€.",_p],"AXA","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};

		if(_p > life_cash) then {
			private _handle = [_p,false] call ALF_fnc_handleCB;
			if(_handle) exitWith {_exit = true;};
		} else {
			life_cash = life_cash - _p;
			[0] call SOCK_fnc_updatePartial;
		};
		if(_exit) exitWith {};

		life_axacount = life_axacount + 1;
		[1,_vid,_pid,player] remoteExecCall ["HC_fnc_insureVehicles",HC2_Life];
		[name player,_pid,"ASSURANCE",format["A assurer son véhicule perso. numéro #%1 pour %2€.",_vid,_p]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};
	case 2 : {
		life_axaprocount = life_axaprocount - 1;
		[2,_vid,_pid,player] remoteExecCall ["HC_fnc_insureVehicles",HC2_Life];
		[name player,_pid,"ASSURANCE",format["A résilié assurance de son véhicule pro. numéro #%1.",_vid]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};
	case 3 : {
		_p = (M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicle,"assurance")) / 2;
		private _action = [format["Es-tu sur de vouloir assurer ton vehicule professionelle ? Frais d'assurance: %1€.",_p],"AXA","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};

		if(_p > life_cash) then {
			private _handle = [_p,false] call ALF_fnc_handleCB;
			if(_handle) exitWith {_exit = true;};
		} else {
			life_cash = life_cash - _p;
			[0] call SOCK_fnc_updatePartial;
		};
		if(_exit) exitWith {};

		life_axaprocount = life_axaprocount + 1;
		[3,_vid,_pid,player] remoteExecCall ["HC_fnc_insureVehicles",HC2_Life];
		[name player,_pid,"ASSURANCE",format["A assurer son véhicule pro. numéro #%1 pour %2€.",_vid,_p]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};
};
if(_exit) exitWith {};

[15] call SOCK_fnc_updatePartial;
[17] call SOCK_fnc_updatePartial;
closeDialog 0;
