#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_penitSetLic.sqf
	Author: ALF Team Dev
*/
private _mode = _this select 0;
private _cop = _this select 1;
private _msg = "";
private _msg2 = "";
private _name = name player;

if(life_penit isEqualTo 0) exitWith {["INFO","Cette personne n'est pas Agent penitencier.", "success"] remoteExec ["ALF_fnc_doMsg",_cop];};

private _level = LICENSE_VALUE(_mode);
if(_level) exitWith {["INFO","Cette personne a déjà cette licence.", "success"] remoteExec ["ALF_fnc_doMsg",_cop];};

switch (_mode) do {
	case "medWork" : {
		license_medWork = true;
		_msg = "Tu es devenu Medécin du travail.";
		_msg2 = format["%1 est devenu Medécin du travail.",_name];
	}; 
	case "NOmedWork" : {
		license_medWork = false;
		_msg = "Tu n'est plus Medécin du travail.";
		_msg2 = format["%1 n'est plus Medécin du travail.",_name];
	};
	case "eris" : {
		license_eris = true;
		_msg = "Tu es devenu ERIS.";
		_msg2 = format["%1 est devenu ERIS.",_name];
	}; 
	case "NOeris" : {
		license_eris = false;
		_msg = "Tu n'est plus ERIS.";
		_msg2 = format["%1 n'est plus ERIS.",_name];
	};
	case "cynoAP" : {
		license_cynoAP = true;
		_msg = "Tu es devenu CYNO.";
		_msg2 = format["%1 est devenu CYNO.",_name];
	}; 
	case "NOcynoAP" : {
		license_cynoAP = false;
		_msg = "Tu n'est plus CYNO.";
		_msg2 = format["%1 n'est plus CYNO.",_name];
	};
};
[1] call SOCK_fnc_updatePartial;

["INFO",format["%1",_msg],"success"] spawn ALF_fnc_doMsg;

//Annonce pour tous les AP
["Corps de direction.",format["%1",_msg2]] remoteExecCall ["HC_fnc_doPenitCall",HC_Life];
