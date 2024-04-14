/*
	File: fn_medSetLevel.sqf
	Author: NANOU
*/
private _mode = _this select 0;
private _cop = _this select 1;
private _msg = "Tu es vire des pompiers.";
private _name = name player;
private _msg2 = format["%1 a ete vire des pompiers.",_name];

if(life_medicLevel isEqualTo _mode) exitWith {["INFO","Cette personne possède dejà ce grade.", "success"] remoteExec ["ALF_fnc_doMsg",_cop];};
if(life_copLevel > 0) exitWith {["INFO","Cette personne est dejà dans la gendarmerie.", "warning"] remoteExec ["ALF_fnc_doMsg",_cop];};
if(life_penit > 0) exitWith {["INFO","Cette personne est dejà dans la prison.", "warning"] remoteExec ["ALF_fnc_doMsg",_cop];};

switch (_mode) do {
	case 0 : {
		life_medicLevel = 0;
		license_med = false;
	}; 
	case 1 : {
		life_medicLevel = 1;
		license_med = true;
		_msg = "Tu es promu Sapeur.";
		_msg2 = format["%1 a ete promu Sapeur.",_name];
	}; 
	case 2 : {
		life_medicLevel = 2;
		license_med = true;
		_msg = "Tu es promu Sapeur 1ere Cl.";
		_msg2 = format["%1 a ete promu Sapeur 1ere Cl.",_name];
	}; 
	case 3 : {
		life_medicLevel = 3;
		license_med = true;
		_msg = "Tu es promu Caporal.";
		_msg2 = format["%1 a ete promu Caporal.",_name];
	}; 
	case 4 : {
		life_medicLevel = 4;
		license_med = true;
		_msg = "Tu es promu Caporal chef.";
		_msg2 = format["%1 a ete promu Caporal chef.",_name];
	}; 
	case 5 : {
		life_medicLevel = 5;
		license_med = true;
		_msg = "Tu es promu Sergent.";
		_msg2 = format["%1 a ete promu Sergent.",_name];
	}; 
	case 6 : {
		life_medicLevel = 6;
		license_med = true;
		_msg = "Tu es promu Sergent chef.";
		_msg2 = format["%1 a ete promu Sergent chef.",_name];
	}; 
	case 7 : {
		life_medicLevel = 7;
		license_med = true;
		_msg = "Tu es promu Adjudant.";
		_msg2 = format["%1 a ete promu Adjudant.",_name];
	}; 
	case 8 : {
		life_medicLevel = 8;
		license_med = true;
		_msg = "Tu es promu Adjudant chef.";
		_msg2 = format["%1 a ete promu Adjudant chef.",_name];
	}; 
	case 9 : {
		life_medicLevel = 9;
		license_med = true;
		_msg = "Tu es promu Lieutenant.";
		_msg2 = format["%1 a ete promu Lieutenant.",_name];
	}; 
	case 10 : {
		life_medicLevel = 10;
		license_med = true;
		_msg = "Tu es promu Capitaine.";
		_msg2 = format["%1 a ete promu Capitaine.",_name];
	};
	case 11 : {
		if(license_SAMU) then {
			license_SAMU = false;
			_msg = "Tu n'es plus SAMU.";
			_msg2 = format["%1 n'est plus SAMU.",_name];
		} else {
			license_SAMU = true;
			_msg = "Tu es promu SAMU.";
			_msg2 = format["%1 a ete promu SAMU.",_name];
		};
	};
};
[1] call SOCK_fnc_updatePartial;
[12] call SOCK_fnc_updatePartial;

["INFO",format["%1",_msg],"success"] spawn ALF_fnc_doMsg;

//Annonce pour tous les Pompiers
["Pompier.",format["%1",_msg2]] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
