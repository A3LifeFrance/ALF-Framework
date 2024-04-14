#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_copSetLevel.sqf
	Author: NANOU
*/
private _mode = _this select 0;
private _cop = _this select 1;
private _msg = "Tu es vire de la Gendarmerie.";
private _name = name player;
private _msg2 = format["%1 a ete vire de la Gendarmerie.",_name];

if(life_copLevel isEqualTo _mode) exitWith {["INFO","Cette personne possède dejà ce grade.", "success"] remoteExec ["ALF_fnc_doMsg",_cop];};

switch (_mode) do {
	case 0 : {
		life_copLevel = 0;
		license_cop = false;
	}; 
	case 1 : {
		life_copLevel = 1;
		license_cop = true;
		_msg = "Tu es promu 1.";
		_msg2 = format["%1 a ete promu Elève Gendarme.",_name];
	}; 
	case 2 : {
		life_copLevel = 2;
		license_cop = true;
		_msg = "Tu es promu Gendarme.";
		_msg2 = format["%1 a ete promu Gendarme.",_name];
	}; 
	case 3 : {
		life_copLevel = 3;
		license_cop = true;
		_msg = "Tu es promu Marechal des logis chef.";
		_msg2 = format["%1 a ete promu Marechal des logis chef.",_name];
	}; 
	case 4 : {
		life_copLevel = 4;
		license_cop = true;
		_msg = "Tu es promu Adjudant.";
		_msg2 = format["%1 a ete promu Adjudant.",_name];
	}; 
	case 5 : {
		life_copLevel = 5;
		license_cop = true;
		_msg = "Tu es promu Adjudant-Chef.";
		_msg2 = format["%1 a ete promu Adjudant-Chef.",_name];
	}; 
	case 6 : {
		life_copLevel = 6;
		license_cop = true;
		_msg = "Tu es promu Major.";
		_msg2 = format["%1 a ete promu Major.",_name];
	}; 
	case 7 : {
		life_copLevel = 7;
		
		license_cop = true;
		_msg = "Tu es promu Sous-Lieutenant.";
		_msg2 = format["%1 a ete promu Sous-Lieutenant.",_name];
	}; 
	case 8 : {
		life_copLevel = 8;
		license_cop = true;
		_msg = "Tu es promu Lieutenant.";
		_msg2 = format["%1 a ete promu Lieutenant.",_name];
	}; 
	case 9 : {
		life_copLevel = 9;
		license_cop = true;
		_msg = "Tu es promu Capitaine.";
		_msg2 = format["%1 a ete promu Capitaine.",_name];
	}; 
	case 10 : {
		life_copLevel = 10;
		license_cop = true;
		_msg = "Tu es promu Commandant.";
		_msg2 = format["%1 a ete promu Commandant.",_name];
	}; 
	case 11 : {
		life_copLevel = 11;
		license_cop = true;
		_msg = "Tu es promu Lieutenant-Colonnel.";
		_msg2 = format["%1 a ete promu Lieutenant-Colonnel.",_name];
	}; 
};
[1] call SOCK_fnc_updatePartial;
[11] call SOCK_fnc_updatePartial;

["INFO",format["%1",_msg],"success"] spawn ALF_fnc_doMsg;

//Annonce pour tous les Gendarmes
["Gendarmerie.",format["%1",_msg2]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
