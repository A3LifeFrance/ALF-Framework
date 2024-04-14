/*
	File: fn_pubSetLevel.sqf
	Author: NANOU
*/
private _mode = _this select 0;
private _cop = _this select 1;
private _msg = "Tu es vire du service publique.";
private _name = name player;

if(life_publique isEqualTo _mode) exitWith {["INFO","Cette personne possède dejà ce grade.", "success"] remoteExec ["ALF_fnc_doMsg",_cop];};
if(life_copLevel > 0) exitWith {["INFO","Cette personne est dejà dans la gendarmerie.", "warning"] remoteExec ["ALF_fnc_doMsg",_cop];};
if(life_penit > 0) exitWith {["INFO","Cette personne est dejà dans la prison.", "warning"] remoteExec ["ALF_fnc_doMsg",_cop];};
if(life_medicLevel > 0) exitWith {["INFO","Cette personne est dejà dans les sapeurs pompiers.", "warning"] remoteExec ["ALF_fnc_doMsg",_cop];};

switch (_mode) do {
	case 0 : {
		life_publique = 0;
	}; 
	case 1 : {
		life_publique = 1;
		_msg = "Tu es promu Grade 1.";
	}; 
	case 2 : {
		life_publique = 2;
		_msg = "Tu es promu Grade 2.";
	}; 
	case 3 : {
		life_publique = 3;
		_msg = "Tu es promu Grade 3.";
	}; 
	case 4 : {
		life_publique = 4;
		_msg = "Tu es promu Grade 4.";
	}; 
	case 5 : {
		life_publique = 5;
		_msg = "TTu es promu Grade 5.";
	}; 
	case 6 : {
		life_publique = 6;
		_msg = "Tu es promu Grade 6.";
	}; 
	case 7 : {
		life_publique = 7;
		_msg = "Tu es promu Grade 7.";
	}; 
	case 8 : {
		life_publique = 8;
		_msg = "Tu es promu Grade 8.";
	};
};
[19] call SOCK_fnc_updatePartial;

["INFO",format["%1",_msg],"success"] spawn ALF_fnc_doMsg;
