#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_copSetLic.sqf
	Author: NANOU
*/
private _mode = _this select 0;
private _cop = _this select 1;
private _msg = "";
private _msg2 = "";
private _name = name player;

if(life_copLevel isEqualTo 0) exitWith {["INFO","Cette personne n'est pas Gendarme.", "success"] remoteExec ["ALF_fnc_doMsg",_cop];};

private _level = LICENSE_VALUE(_mode);
if(_level) exitWith {["INFO","Cette personne a déjà cette licence.", "success"] remoteExec ["ALF_fnc_doMsg",_cop];};

switch (_mode) do {
	case "PMO" : {
		license_PMO = true;
		_msg = "Tu es promu PMO.";
		_msg2 = format["%1 a ete promu au PMO.",_name];
	}; 
	case "NOPMO" : {
		license_PMO = false;
		_msg = "Tu es viré du PMO.";
		_msg2 = format["%1 a ete viré du PMO.",_name];
	};
	case "SR" : {
		license_SR = true;
		_msg = "Tu es promu SR.";
		_msg2 = format["%1 a ete promu a la SR.",_name];
	}; 
	case "NOSR" : {
		license_SR = false;
		_msg = "Tu es viré de la SR.";
		_msg2 = format["%1 a ete viré de la SR.",_name];
	};
	case "TIC" : {
		license_TIC = true;
		_msg = "Tu es promu TIC.";
		_msg2 = format["%1 a ete promu TIC.",_name];
	}; 
	case "NOTIC" : {
		license_TIC = false;
		_msg = "Tu es viré des TIC.";
		_msg2 = format["%1 a ete viré des TIC.",_name];
	};
	case "PSIG" : {
		license_PSIG = true;
		_msg = "Tu es promu PSIG.";
		_msg2 = format["%1 a ete promu PSIG.",_name];
	}; 
	case "NOPSIG" : {
		license_PSIG = false;
		_msg = "Tu es viré du PSIG.";
		_msg2 = format["%1 a ete viré du PSIG.",_name];
	};
	case "GIGN" : {
		license_GIGN = true;
		_msg = "Tu es promu GIGN.";
		_msg2 = format["%1 a ete promu GIGN.",_name];
	}; 
	case "NOGIGN" : {
		license_GIGN = false;
		_msg = "Tu es viré du GIGN.";
		_msg2 = format["%1 a ete viré du GIGN.",_name];
	};
	case "CYNO" : {
		license_CYNO = true;
		_msg = "Tu es promu CYNOPHILE.";
		_msg2 = format["%1 a ete promu CYNOPHILE.",_name];
	};
	case "NOCYNO" : {
		license_CYNO = false;
		_msg = "Tu es viré de la CYNOPHILE.";
		_msg2 = format["%1 a ete viré de la CYNOPHILE.",_name];
	};
};
[1] call SOCK_fnc_updatePartial;

["INFO",format["%1",_msg],"success"] spawn ALF_fnc_doMsg;

//Annonce pour tous les Gendarmes
["Gendarmerie.",format["%1",_msg2]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
