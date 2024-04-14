#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_penitSetLevel.sqf
	Author: NANOU
*/
private _mode = _this select 0;
private _cop = _this select 1;
private _msg = "Tu es vire de la Prison.";
private _name = name player;
private _msg2 = format["%1 a ete vire de la Prison.",_name];

if(life_penit isEqualTo _mode) exitWith {["INFO","Cette personne possède dejà ce grade.", "success"] remoteExec ["ALF_fnc_doMsg",_cop];};
if(life_medicLevel > 0) exitWith {["INFO","Cette personne est dejà dans le medical.", "warning"] remoteExec ["ALF_fnc_doMsg",_cop];};
if(life_copLevel > 0) exitWith {["INFO","Cette personne est dejà dans la gendarmerie.", "warning"] remoteExec ["ALF_fnc_doMsg",_cop];};

switch (_mode) do {
	case 0 : {
		life_penit = 0;
	}; 
	case 1 : {
		life_penit = 1;
		_msg = "Tu es promu surveillant stagiaire de prison.";
		_msg2 = format["%1 a ete promu surveillant stagiaire de prison.",_name];
	};
	case 2 : {
		life_penit = 2;
		_msg = "Tu es promu surveillant titulaire de prison.";
		_msg2 = format["%1 a ete promu surveillant titulaire de prison.",_name];
	}; 
	case 3 : {
		life_penit = 3;
		_msg = "Tu es promu surveillant principal de prison.";
		_msg2 = format["%1 a ete promu surveillant principal de prison.",_name];
	};
	case 4 : {
		life_penit = 4;
		_msg = "Tu es promu surveillant brigadier de prison.";
		_msg2 = format["%1 a ete promu surveillant brigadier de prison.",_name];
	}; 
	case 5 : {
		life_penit = 5;
		_msg = "Tu es promu premier surveillant de prison.";
		_msg2 = format["%1 a ete promu premier surveillant de prison.",_name];
	}; 
	case 6 : {
		life_penit = 6;
		_msg = "Tu es promu major de prison.";
		_msg2 = format["%1 a ete promu major de prison.",_name];
	}; 
	case 7 : {
		life_penit = 7;
		_msg = "Tu es promu lieutenant de prison.";
		_msg2 = format["%1 a ete promu lieutenant de prison.",_name];
	}; 
	case 8 : {
		life_penit = 8;
		_msg = "Tu es promu capitaine de prison.";
		_msg2 = format["%1 a ete promu capitaine de prison.",_name];
	};
	case 9 : {
		life_penit = 9;
		_msg = "Tu es promu commandant de prison.";
		_msg2 = format["%1 a ete promu commandant de prison.",_name];
	};
};
[4] call SOCK_fnc_updatePartial;

["INFO",format["%1",_msg],"success"] spawn ALF_fnc_doMsg;

//Annonce pour tous les prisons
["Prison.",format["%1",_msg2]] remoteExecCall ["HC_fnc_doPenitCall",HC_Life];
