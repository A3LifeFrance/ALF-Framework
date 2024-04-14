#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_payEntreprise.sqf
	Author: ALF NiiRoZz

	Description:
	Demande de paiement pour les employés des entreprises
*/
params [
	["_mode",-1,[0]]
];
if(_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	case 0: {
		private _amount = param [1,"",[""]];

		if !([_amount] call TON_fnc_isnumber) exitWith {};
		_amount = parseNumber(_amount);

		if (_amount <= 0) exitWith {};

		[1,_amount, b_23] remoteExec ["ALF_fnc_payEntreprise",life_pInact_curObject];
		closeDialog 0;
		
		[name player,getPlayerUID player,"BANK",format["A donné une facture de %1€ à %2.",_amount, name life_pInact_curObject]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};

	//Demande au client si il veut payer la somme
	case 1: {
		private _amount = param [1,-1,[0]];
		private _trib = param [2,false,[false]];

	 	if (_amount <= 0) exitWith {};
		private _action = [format["Veux-tu payer la demande de paiement ? Le montant est de %1€.",[_amount] call life_fnc_numberText],"Entreprise","OUI","NON"] call BIS_fnc_guiMessage;

		if (_action) then {
			private _exit = false;
			private _handle = false;

			if (life_cash >= _amount) then {
				life_cash = life_cash - _amount;
				[0] call SOCK_fnc_updatePartial;
			} else {
				if (_trib) then {
					life_livreta = life_livreta - _amount;
					["INFO", format["Le prélèvement du tribunal a été effectué sur ton livret A pour %1 €.", _amount],"success"] spawn ALF_fnc_doMsg;
				} else {
					private _handle = [_amount,false] call ALF_fnc_handleCB;
					if (_handle) then {closeDialog 0; _exit = true;};
				};
			};
			
			if (_exit) then {
				[3] remoteExecCall ["ALF_fnc_payEntreprise",remoteExecutedOwner];
			} else {
				[2,_amount,player] remoteExecCall ["ALF_fnc_payEntreprise",remoteExecutedOwner];
			};
		} else {
			[3] remoteExecCall ["ALF_fnc_payEntreprise",remoteExecutedOwner];
		};
	};

	//Le client a accepté de payer la somme
	case 2: {
		private _amount = param [1,-1,[0]];
		private _unit = param [2,objNull,[objNull]];

	 	if (_amount <= 0 || isNull _unit) exitWith {};

		private _building = objNull;
		{
		  if (((_x getVariable ["business",["","",""]]) select 2) isEqualTo (player getVariable ["isEmployed",""])) exitWith {
				_building = _x;
			};
		} forEach ALF_allBusinesss;

		if (isNull _building) exitWith {};

		["INFO","Le client a accepté de payer la somme demandée.","warning"] spawn ALF_fnc_doMsg;

		private _var = _building getVariable ["business",[]];
		private _capitalstr = _var select 3;
		private _siretstr = _var select 2;

		private _newvalue = floor(_capitalstr + _amount);
		_var set[3,_newvalue];

		_building setVariable ["business",_var,true];

		[_siretstr,_newvalue] remoteExec ["HC_fnc_capitalBusiness",HC2_life];

		[name _unit,getPlayerUID _unit,"BANK",format["A payé une facture de %1€ à %2.",_amount, name player]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[(player getVariable ["isEmployed",""]),name _unit,_amount] remoteExec ["HC_fnc_PayToFisc",HC2_life];
	};

	//Le client n'a pas accepté de payer la somme
	case 3: {
	    ["INFO","Le client n'a pas accepté de payer la somme demandée.","warning"] spawn ALF_fnc_doMsg;
	};
};
