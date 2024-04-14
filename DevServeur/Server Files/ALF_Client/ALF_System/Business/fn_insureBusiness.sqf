#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_insureBusiness.sqf
	Author: ALF Team

	Description:
	Insure a vehicle from the garage.
*/
params [
	["_mode",-1,[0]]
];

if (_mode isEqualTo -1) exitWith {};
disableSerialization;

switch (_mode) do {
	case 0: {
		if(lbCurSel 2802 isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
		private _vehicle = lbData[2802,(lbCurSel 2802)];
		_vehicle = (call compile format["%1",_vehicle]) select 0;
		private _vid = lbValue[2802,(lbCurSel 2802)];
		private _uid = getPlayerUID player;

		private _building = life_garage_sp select 2;
		private _var = _building getVariable ["business",[]];
		private _capitalstr = _var select 3;
		private _siretstr = _var select 2;

		if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
		private _price = floor((M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicle,"assurance")) * 1.5);

		private _action = [format["Es-tu sur de vouloir assurer ce véhicule? Prix d'assurance: %1€.",_price],"Entreprise","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};

		if(_capitalstr < _price) exitWith {["INFO", "Tu n'as pas assez d'argent dans l'entreprise.", "warning"] spawn ALF_fnc_doMsg; closeDialog 0;};

		_capitalstr = _capitalstr - _price;
		_var set[3,_capitalstr];
		_building setVariable ["business",_var,true];
		
		[name player,_pid,"ASSURANCE",format["A assurer son véhicule ent. numéro #%1 pour %2€.",_vid,_price]] remoteExec ["HC_fnc_logIt",HC3_Life];

		[_siretstr,_capitalstr] remoteExec ["HC_fnc_capitalBusiness",HC2_life];
		[4,_vid,_uid,player] remoteExecCall ["HC_fnc_insureVehicles",HC2_Life];

		closeDialog 0;
	};

	case 1: {
		private _vid = lbValue[2802,(lbCurSel 2802)];
		private _uid = getPlayerUID player;

		[5,_vid,_uid,player] remoteExecCall ["HC_fnc_insureVehicles",HC2_Life];

		closeDialog 0;
	};
};
