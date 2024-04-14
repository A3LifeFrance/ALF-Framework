#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setSonyDate.sqf
Author: ALF Team
*/
disableSerialization;
private _display = findDisplay 38999;
private _SonyRadioBtn1 = _display displayCtrl 39037;
private _SonyRadioBtn2 = _display displayCtrl 39038;
private _SonyRadioBtn3 = _display displayCtrl 39039;
private _SonyRadioBtn4 = _display displayCtrl 39040;
private _SonyRadioBtn5 = _display displayCtrl 39041;
private _SonyRadioBtn6 = _display displayCtrl 39042;
private _SonyRadioBtn7 = _display displayCtrl 39043;
private _SonyRadioBtn8 = _display displayCtrl 39044;
private _SonyRadioBtn9 = _display displayCtrl 39045;
private _SonyRadioBtn10 = _display displayCtrl 39046;
private _SonyRadioBtn11 = _display displayCtrl 39047;
private _SonyRadioBtn12 = _display displayCtrl 39048;
private _SonyRadioBtn13 = _display displayCtrl 39049;
private _SonyRadioBtn14 = _display displayCtrl 39050;
private _SonyRadioBtn15 = _display displayCtrl 39051;
private _SonyRadioBtn16 = _display displayCtrl 39052;
private _SonyRadioBtn17 = _display displayCtrl 39053;
private _SonyRadioBtn21 = _display displayCtrl 39057;
private _SonyRadioCo1 = _display displayCtrl 39059;
private _SonyRadioCo2 = _display displayCtrl 39060;
private _SonyRadioCo3 = _display displayCtrl 39061;
private _SonyRadioCo4 = _display displayCtrl 39062;
private _SonyRadioCo5 = _display displayCtrl 39063;
private _SonyRadioCo6 = _display displayCtrl 39064;
private _SonyRadioCo7 = _display displayCtrl 39065;
private _SonyRadioCo8 = _display displayCtrl 39066;
private _SonyRadioCo9 = _display displayCtrl 39067;
private _SonyRadioCo10 = _display displayCtrl 39068;
private _SonyRadioCo11 = _display displayCtrl 39069;
private _SonyRadioCo12 = _display displayCtrl 39070;
private _SonyRadioCo13 = _display displayCtrl 39071;
private _SonyRadioCo14 = _display displayCtrl 39072;
private _SonyRadioCo15 = _display displayCtrl 39073;
private _SonyRadioCo16 = _display displayCtrl 39074;
private _SonyRadioCo17 = _display displayCtrl 39075;
private _SonyRadioCo21 = _display displayCtrl 39079;

_SonyRadioBtn1 buttonSetAction "[60] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn2 buttonSetAction "[61] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn3 buttonSetAction "[62] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn4 buttonSetAction "[63] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn5 buttonSetAction "[64] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn6 buttonSetAction "[65] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn7 buttonSetAction "[66] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn8 buttonSetAction "[67] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn9 buttonSetAction "[68] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn10 buttonSetAction "[69] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn11 buttonSetAction "[70] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn12 buttonSetAction "[71] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn13 buttonSetAction "[72] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn14 buttonSetAction "[73] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn15 buttonSetAction "[74] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn16 buttonSetAction "[75] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn17 buttonSetAction "[76] spawn ALF_fnc_connectRadioSonyP;";
_SonyRadioBtn21 buttonSetAction "[77] spawn ALF_fnc_connectRadioSonyP;";

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
_SonyRadioCo21 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#990000' font='HelveticaNeueLTStdLt' size='1'>Déconnecté</t>"];

private _freq = ALF_Sony_Freq;
private _freq2 = ALF_Sony_FreqAdd;

if(_freq2 isEqualTo 60) then {
	_SonyRadioCo1 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b63e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
};
switch (_freq) do {
	case 60 : {
		_SonyRadioCo1 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 61 : {
		_SonyRadioCo2 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 62 : {
		_SonyRadioCo3 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 63 : {
		_SonyRadioCo4 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 64 : {
		_SonyRadioCo5 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 65 : {
		_SonyRadioCo6 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 66 : {
		_SonyRadioCo7 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 67 : {
		_SonyRadioCo8 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 68 : {
		_SonyRadioCo9 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 69 : {
		_SonyRadioCo10 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 70 : {
		_SonyRadioCo11 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 71 : {
		_SonyRadioCo12 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 72 : {
		_SonyRadioCo13 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 73 : {
		_SonyRadioCo14 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 74 : {
		_SonyRadioCo15 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 75 : {
		_SonyRadioCo16 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 76 : {
		_SonyRadioCo17 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
	case 77 : {
		_SonyRadioCo21 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#55b64e' font='HelveticaNeueLTStdLt' size='1'>Connecté</t>"];
	};
};

private _count60 = 0;
private _count61 = 0;
private _count62 = 0;
private _count63 = 0;
private _count64 = 0;
private _count65 = 0;
private _count66 = 0;
private _count67 = 0;
private _count68 = 0;
private _count69 = 0;
private _count70 = 0;
private _count71 = 0;
private _count72 = 0;
private _count73 = 0;
private _count74 = 0;
private _count75 = 0;
private _count76 = 0;
private _count77 = 0;

{
	private _freq2 = _x getVariable ["SonyFreqAdd",0];
	if(_freq2 isEqualTo 60) then {
		_count60 = _count60 + 1;
	};
	private _freq = _x getVariable ["SonyFreq",0];
	switch (_freq) do {
		case 61 : {
			_count61 = _count61 + 1;
		};
		case 62 : {
			_count62 = _count62 + 1;
		};
		case 63 : {
			_count63 = _count63 + 1;
		};
		case 64 : {
			_count64 = _count64 + 1;
		};
		case 65 : {
			_count65 = _count65 + 1;
		};
		case 66 : {
			_count66 = _count66 + 1;
		};
		case 67 : {
			_count67 = _count67 + 1;
		};
		case 68 : {
			_count68 = _count68 + 1;
		};
		case 69 : {
			_count69 = _count69 + 1;
		};
		case 70 : {
			_count70 = _count70 + 1;
		};
		case 71 : {
			_count71 = _count71 + 1;
		};
		case 72 : {
			_count72 = _count72 + 1;
		};
		case 73 : {
			_count73 = _count73 + 1;
		};
		case 74 : {
			_count74 = _count74 + 1;
		};
		case 75 : {
			_count75 = _count75 + 1;
		};
		case 76 : {
			_count76 = _count76 + 1;
		};
		case 77 : {
			_count77 = _count77 + 1;
		};
	};
} forEach playableUnits;

private _SonyRadioNb1 = _display displayCtrl 39081;
private _SonyRadioNb2 = _display displayCtrl 39082;
private _SonyRadioNb3 = _display displayCtrl 39083;
private _SonyRadioNb4 = _display displayCtrl 39084;
private _SonyRadioNb5 = _display displayCtrl 39085;
private _SonyRadioNb6 = _display displayCtrl 39086;
private _SonyRadioNb7 = _display displayCtrl 39087;
private _SonyRadioNb8 = _display displayCtrl 39088;
private _SonyRadioNb9 = _display displayCtrl 39089;
private _SonyRadioNb10 = _display displayCtrl 39090;
private _SonyRadioNb11 = _display displayCtrl 39091;
private _SonyRadioNb12 = _display displayCtrl 39092;
private _SonyRadioNb13 = _display displayCtrl 39093;
private _SonyRadioNb14 = _display displayCtrl 39094;
private _SonyRadioNb15 = _display displayCtrl 39095;
private _SonyRadioNb16 = _display displayCtrl 39096;
private _SonyRadioNb17 = _display displayCtrl 39097;
private _SonyRadioNb21 = _display displayCtrl 39101;

_SonyRadioNb1 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count60];
_SonyRadioNb2 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count61];
_SonyRadioNb3 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count62];
_SonyRadioNb4 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count63];
_SonyRadioNb5 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count64];
_SonyRadioNb6 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count65];
_SonyRadioNb7 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count66];
_SonyRadioNb8 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count67];
_SonyRadioNb9 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count68];
_SonyRadioNb10 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count69];
_SonyRadioNb11 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count70];
_SonyRadioNb12 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count71];
_SonyRadioNb13 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count72];
_SonyRadioNb14 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count73];
_SonyRadioNb15 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count74];
_SonyRadioNb16 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count75];
_SonyRadioNb17 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count76];
_SonyRadioNb21 ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>",_count77];
