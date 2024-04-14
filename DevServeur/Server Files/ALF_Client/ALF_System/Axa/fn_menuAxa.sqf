#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Team
*/
if !([player] call ALF_fnc_hasEnergy) exitWith {["Info", "Il n'y n'a pas d'électricité.", "danger"] spawn ALF_fnc_doMsg;};

if(!dialog) then {
	createDialog "ALF_AXA_Dialog";
};
disableSerialization;

private _d = findDisplay 14000;
private _txt = _d displayCtrl 14001;
private _btn1 = _d displayCtrl 14002;
private _btn2 = _d displayCtrl 14003;
private _btn3 = _d displayCtrl 14004;
private _btn4 = _d displayCtrl 14005;
private _btn5 = _d displayCtrl 14006;
private _btn6 = _d displayCtrl 14007;
private _btn7 = _d displayCtrl 14008;
private _btn8 = _d displayCtrl 14009;

private _c = "";
private _abo = "";

private _a = life_axa;

if(_a isEqualTo 0) exitWith {
	_c = "#E74C3C";
	_abo = "Aucune";
	_txt ctrlSetStructuredText parseText format["<t color='#000000'></t><t color='%1'>%2</t>",_c,_abo];
	_btn1 ctrlShow true;
	_btn1 buttonSetAction "[1] spawn ALF_fnc_btnAxa;";
	_btn2 ctrlShow true;
	_btn2 buttonSetAction "[2] spawn ALF_fnc_btnAxa;";
	_btn3 ctrlShow true;
	_btn3 buttonSetAction "[3] spawn ALF_fnc_btnAxa;";
	_btn4 ctrlShow false;
	_btn5 ctrlShow false;
	_btn6 ctrlShow false;
	_btn7 ctrlShow false;
	_btn8 ctrlShow true;
	_btn8 buttonSetAction "[7] spawn ALF_fnc_btnAxa;";
};

_btn4 ctrlShow true;
_btn4 buttonSetAction "[0] spawn ALF_fnc_btnAxa;";
switch (life_axabank) do {
	case 0 : {
		_btn5 ctrlShow false;
		_btn6 ctrlShow true;
		_btn6 buttonSetAction "[5] spawn ALF_fnc_btnAxa;";
		_btn7 ctrlShow true;
		_btn7 buttonSetAction "[6] spawn ALF_fnc_btnAxa;";
	};
	case 1 : {
		_btn5 ctrlShow true;
		_btn5 buttonSetAction "[4] spawn ALF_fnc_btnAxa;";
		_btn6 ctrlShow false;
		_btn7 ctrlShow true;
		_btn7 buttonSetAction "[6] spawn ALF_fnc_btnAxa;";
	};
	case 2 : {
		_btn5 ctrlShow true;
		_btn5 buttonSetAction "[4] spawn ALF_fnc_btnAxa;";
		_btn6 ctrlShow true;
		_btn6 buttonSetAction "[5] spawn ALF_fnc_btnAxa;";
		_btn7 ctrlShow false;
	};
};

_c = "#27AE60";
if(_a isEqualTo 1) then {
	_abo = "Offre 1";
	_txt ctrlSetStructuredText parseText format["<t color='#000000'></t><t color='%1'>%2</t>",_c,_abo];
	_btn1 ctrlShow false;
	_btn2 ctrlShow true;
	_btn2 buttonSetAction "[2] spawn ALF_fnc_btnAxa;";
	_btn3 ctrlShow true;
	_btn3 buttonSetAction "[3] spawn ALF_fnc_btnAxa;";
	_btn8 ctrlShow true;
	_btn8 buttonSetAction "[7] spawn ALF_fnc_btnAxa;";
};
if(_a isEqualTo 2) then {
	_abo = "Offre 2";
	_txt ctrlSetStructuredText parseText format["<t color='#000000'></t><t color='%1'>%2</t>",_c,_abo];
	_btn1 ctrlShow false;
	_btn2 ctrlShow false;
	_btn3 ctrlShow true;
	_btn3 buttonSetAction "[3] spawn ALF_fnc_btnAxa;";
	_btn8 ctrlShow true;
	_btn8 buttonSetAction "[7] spawn ALF_fnc_btnAxa;";
};
if(_a isEqualTo 3) then {
	_abo = "Offre 3";
	_txt ctrlSetStructuredText parseText format["<t color='#000000'></t><t color='%1'>%2</t>",_c,_abo];
	_btn1 ctrlShow false;
	_btn2 ctrlShow false;
	_btn3 ctrlShow false;
	_btn8 ctrlShow true;
	_btn8 buttonSetAction "[7] spawn ALF_fnc_btnAxa;";
};
if(_a isEqualTo 4) then {
	_abo = "Premium";
	_txt ctrlSetStructuredText parseText format["<t color='#000000'></t><t color='%1'>%2</t>",_c,_abo];
	_btn1 ctrlShow false;
	_btn2 ctrlShow false;
	_btn3 ctrlShow false;
	_btn8 ctrlShow false;
};
