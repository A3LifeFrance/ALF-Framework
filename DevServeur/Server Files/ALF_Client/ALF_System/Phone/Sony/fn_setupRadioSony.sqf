#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setSonyDate.sqf
Author: ALF Team
*/
disableSerialization;
private _display = findDisplay 32999;
private _SonyRadioBtn1 = _display displayCtrl 33037;
private _SonyRadioBtn2 = _display displayCtrl 33038;
private _SonyRadioBtn3 = _display displayCtrl 33039;
private _SonyRadioBtn4 = _display displayCtrl 33040;
private _SonyRadioBtn5 = _display displayCtrl 33041;
private _SonyRadioBtn6 = _display displayCtrl 33042;
private _SonyRadioBtn7 = _display displayCtrl 33043;
private _SonyRadioBtn8 = _display displayCtrl 33044;
private _SonyRadioBtn9 = _display displayCtrl 33045;
private _SonyRadioBtn10 = _display displayCtrl 33046;
private _SonyRadioBtn11 = _display displayCtrl 33047;
private _SonyRadioBtn12 = _display displayCtrl 33048;
private _SonyRadioBtn13 = _display displayCtrl 33049;
private _SonyRadioBtn14 = _display displayCtrl 33050;
private _SonyRadioBtn15 = _display displayCtrl 33051;
private _SonyRadioBtn16 = _display displayCtrl 33052;
private _SonyRadioBtn17 = _display displayCtrl 33053;
private _SonyRadioBtn18 = _display displayCtrl 33054;
private _SonyRadioBtn19 = _display displayCtrl 33055;
private _SonyRadioBtn20 = _display displayCtrl 33056;
private _SonyRadioBtn21 = _display displayCtrl 33057;
private _SonyRadioBtn22 = _display displayCtrl 33058;
private _SonyRadioCo1 = _display displayCtrl 33059;
private _SonyRadioCo2 = _display displayCtrl 33060;
private _SonyRadioCo3 = _display displayCtrl 33061;
private _SonyRadioCo4 = _display displayCtrl 33062;
private _SonyRadioCo5 = _display displayCtrl 33063;
private _SonyRadioCo6 = _display displayCtrl 33064;
private _SonyRadioCo7 = _display displayCtrl 33065;
private _SonyRadioCo8 = _display displayCtrl 33066;
private _SonyRadioCo9 = _display displayCtrl 33067;
private _SonyRadioCo10 = _display displayCtrl 33068;
private _SonyRadioCo11 = _display displayCtrl 33069;
private _SonyRadioCo12 = _display displayCtrl 33070;
private _SonyRadioCo13 = _display displayCtrl 33071;
private _SonyRadioCo14 = _display displayCtrl 33072;
private _SonyRadioCo15 = _display displayCtrl 33073;
private _SonyRadioCo16 = _display displayCtrl 33074;
private _SonyRadioCo17 = _display displayCtrl 33075;
private _SonyRadioCo18 = _display displayCtrl 33076;
private _SonyRadioCo19 = _display displayCtrl 33077;
private _SonyRadioCo20 = _display displayCtrl 33078;
private _SonyRadioCo21 = _display displayCtrl 33079;
private _SonyRadioCo22 = _display displayCtrl 33080;

_SonyRadioBtn1 buttonSetAction "[30] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn2 buttonSetAction "[31] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn3 buttonSetAction "[32] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn4 buttonSetAction "[33] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn5 buttonSetAction "[34] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn6 buttonSetAction "[35] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn7 buttonSetAction "[36] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn8 buttonSetAction "[37] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn9 buttonSetAction "[38] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn10 buttonSetAction "[39] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn11 buttonSetAction "[40] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn12 buttonSetAction "[41] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn13 buttonSetAction "[42] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn14 buttonSetAction "[43] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn15 buttonSetAction "[44] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn16 buttonSetAction "[45] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn17 buttonSetAction "[46] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn18 buttonSetAction "[47] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn19 buttonSetAction "[48] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn20 buttonSetAction "[49] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn21 buttonSetAction "[50] spawn ALF_fnc_connectRadioSony;";
_SonyRadioBtn22 buttonSetAction "[51] spawn ALF_fnc_connectRadioSony;";

_SonyRadioCo1 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo2 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo3 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo4 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo5 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo6 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo7 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo8 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo9 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo10 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo11 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo12 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo13 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo14 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo15 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo16 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo17 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo18 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo19 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo20 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo21 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];
_SonyRadioCo22 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];

private _freq = ALF_Sony_Freq;
private _freq2 = ALF_Sony_FreqAdd;

if(_freq2 isEqualTo 30) then {
	_SonyRadioCo1 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
};
switch (_freq) do {
	case 31 : {
		_SonyRadioCo2 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 32 : {
		_SonyRadioCo3 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 33 : {
		_SonyRadioCo4 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 34 : {
		_SonyRadioCo5 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 35 : {
		_SonyRadioCo6 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 36 : {
		_SonyRadioCo7 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 37 : {
		_SonyRadioCo8 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 38 : {
		_SonyRadioCo9 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 39 : {
		_SonyRadioCo10 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 40 : {
		_SonyRadioCo11 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 41 : {
		_SonyRadioCo12 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 42 : {
		_SonyRadioCo13 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 43 : {
		_SonyRadioCo14 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 44 : {
		_SonyRadioCo15 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 45 : {
		_SonyRadioCo16 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 46 : {
		_SonyRadioCo17 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 47 : {
		_SonyRadioCo18 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 48 : {
		_SonyRadioCo19 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 49 : {
		_SonyRadioCo20 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 50 : {
		_SonyRadioCo21 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 51 : {
		_SonyRadioCo22 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
};

private _count30 = 0;
private _count31 = 0;
private _count32 = 0;
private _count33 = 0;
private _count34 = 0;
private _count35 = 0;
private _count36 = 0;
private _count37 = 0;
private _count38 = 0;
private _count39 = 0;
private _count40 = 0;
private _count41 = 0;
private _count42 = 0;
private _count43 = 0;
private _count44 = 0;
private _count45 = 0;
private _count46 = 0;
private _count47 = 0;
private _count48 = 0;
private _count49 = 0;
private _count50 = 0;
private _count51 = 0;

{
	private _freq = _x getVariable ["SonyFreq",0];
	private _freq2 = _x getVariable ["SonyFreqAdd",0];
	switch (_freq) do {
		case 31 : {
			_count31 = _count31 + 1;
		};
		case 32 : {
			_count32 = _count32 + 1;
		};
		case 33 : {
			_count33 = _count33 + 1;
		};
		case 34 : {
			_count34 = _count34 + 1;
		};
		case 35 : {
			_count35 = _count35 + 1;
		};
		case 36 : {
			_count36 = _count36 + 1;
		};
		case 37 : {
			_count37 = _count37 + 1;
		};
		case 38 : {
			_count38 = _count38 + 1;
		};
		case 39 : {
			_count39 = _count39 + 1;
		};
		case 40 : {
			_count40 = _count40 + 1;
		};
		case 41 : {
			_count41 = _count41 + 1;
		};
		case 42 : {
			_count42 = _count42 + 1;
		};
		case 43 : {
			_count43 = _count43 + 1;
		};
		case 44 : {
			_count44 = _count44 + 1;
		};
		case 45 : {
			_count45 = _count45 + 1;
		};
		case 46 : {
			_count46 = _count46 + 1;
		};
		case 47 : {
			_count47 = _count47 + 1;
		};
		case 48 : {
			_count48 = _count48 + 1;
		};
		case 49 : {
			_count49 = _count49 + 1;
		};
		case 50 : {
			_count50 = _count50 + 1;
		};
		case 51 : {
			_count51 = _count51 + 1;
		};
	};

	if(_freq2 isEqualTo 30) then {
		_count30 = _count30 + 1;
	};
} forEach playableUnits;

private _SonyRadioNb1 = _display displayCtrl 33081;
private _SonyRadioNb2 = _display displayCtrl 33082;
private _SonyRadioNb3 = _display displayCtrl 33083;
private _SonyRadioNb4 = _display displayCtrl 33084;
private _SonyRadioNb5 = _display displayCtrl 33085;
private _SonyRadioNb6 = _display displayCtrl 33086;
private _SonyRadioNb7 = _display displayCtrl 33087;
private _SonyRadioNb8 = _display displayCtrl 33088;
private _SonyRadioNb9 = _display displayCtrl 33089;
private _SonyRadioNb10 = _display displayCtrl 33090;
private _SonyRadioNb11 = _display displayCtrl 33091;
private _SonyRadioNb12 = _display displayCtrl 33092;
private _SonyRadioNb13 = _display displayCtrl 33093;
private _SonyRadioNb14 = _display displayCtrl 33094;
private _SonyRadioNb15 = _display displayCtrl 33095;
private _SonyRadioNb16 = _display displayCtrl 33096;
private _SonyRadioNb17 = _display displayCtrl 33097;
private _SonyRadioNb18 = _display displayCtrl 33098;
private _SonyRadioNb19 = _display displayCtrl 33099;
private _SonyRadioNb20 = _display displayCtrl 33100;
private _SonyRadioNb21 = _display displayCtrl 33101;
private _SonyRadioNb22 = _display displayCtrl 33102;

_SonyRadioNb1 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count30];
_SonyRadioNb2 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count31];
_SonyRadioNb3 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count32];
_SonyRadioNb4 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count33];
_SonyRadioNb5 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count34];
_SonyRadioNb6 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count35];
_SonyRadioNb7 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count36];
_SonyRadioNb8 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count37];
_SonyRadioNb9 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count38];
_SonyRadioNb10 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count39];
_SonyRadioNb11 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count40];
_SonyRadioNb12 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count41];
_SonyRadioNb13 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count42];
_SonyRadioNb14 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count43];
_SonyRadioNb15 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count44];
_SonyRadioNb16 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count45];
_SonyRadioNb17 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count46];
_SonyRadioNb18 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count47];
_SonyRadioNb19 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count48];
_SonyRadioNb20 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count49];
_SonyRadioNb21 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count50];
_SonyRadioNb22 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count51];

