#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Team
*/
private _u = _this select 0;
life_pInact_curObject = _u;

if(!dialog) then {
	createDialog "ALF_GUARDIAN_Dialog";
};
disableSerialization;

private _d = findDisplay 18000;
private _bpm = _d displayCtrl 18001;
private _mmHg1 = _d displayCtrl 18002;
private _mmHg2 = _d displayCtrl 18003;
private _spo2 = _d displayCtrl 18004;
private _resp = _d displayCtrl 18005;

private _btn1 = _d displayCtrl 18006;
private _btn2 = _d displayCtrl 18007;
private _btn3 = _d displayCtrl 18008;
private _btn4 = _d displayCtrl 18009;
private _btn5 = _d displayCtrl 18010;
private _btn6 = _d displayCtrl 18011;
private _btn7 = _d displayCtrl 18012;

private _btn8 = _d displayCtrl 18014;

private _edit = _d displayCtrl 18013;

_btn1 ctrlSetText "METTRE DANS LE BRANCARD";
_btn1 buttonSetAction "[life_pInact_curObject,""ALF_Brancard_P""] call ALF_fnc_putInCar; closeDialog 0;";

_btn8 ctrlSetText "METTRE DANS LE FAUTEUIL";
_btn8 buttonSetAction "[life_pInact_curObject,""ALF_Wheelchair_P""] call ALF_fnc_putInCar; closeDialog 0;";

_btn2 ctrlSetText "APPLIQUER BANDAGE";
_btn2 buttonSetAction "[0,life_pInact_curObject] spawn ALF_fnc_actionMedicalItems;";

_btn3 ctrlSetText "TRANSFUSION DE SALINE";
_btn3 buttonSetAction "[1,life_pInact_curObject] spawn ALF_fnc_actionMedicalItems;";

_btn4 ctrlSetText "METTRE SOUS O2";
_btn4 buttonSetAction "[2,life_pInact_curObject] spawn ALF_fnc_actionMedicalItems;";

_btn5 ctrlSetText "INJECTER ADRENALINE";
_btn5 buttonSetAction "[3,life_pInact_curObject] spawn ALF_fnc_actionMedicalItems;";

_btn6 ctrlSetText "INJECTER ATROPINE";
_btn6 buttonSetAction "[4,life_pInact_curObject] spawn ALF_fnc_actionMedicalItems;";

_btn7 ctrlSetText "INJECTER MORPHINE";
_btn7 buttonSetAction "[5,life_pInact_curObject] spawn ALF_fnc_actionMedicalItems;";

if("ALF_Bandage" in magazines player) then {
	_btn2 ctrlEnable true;
} else {
	_btn2 ctrlEnable false;
};

if("ALF_M_Oxy9L" in magazines player) then {
	_btn4 ctrlEnable true;
} else {
	_btn4 ctrlEnable false;
};
	
if(license_samu) then {
	if (({_x find "ALF_PocheDeSang_" > -1} count (magazines player)) > 0) then {
		_btn3 ctrlSetText "TRANSFUSION DE POCHE DE SANG";
		_btn3 buttonSetAction "[6,life_pInact_curObject] spawn ALF_fnc_actionMedicalItems;";
		_btn3 ctrlEnable true;
	} else {
		if("ALF_Saline" in magazines player) then {
			_btn3 ctrlSetText "TRANSFUSION DE SALINE";
			_btn3 buttonSetAction "[1,life_pInact_curObject] spawn ALF_fnc_actionMedicalItems;";
			_btn3 ctrlEnable true;
		} else {
			_btn3 ctrlEnable false;
		};
	};
	if("ALF_Adrenaline" in magazines player) then {
		_btn5 ctrlEnable true;
	} else {
		_btn5 ctrlEnable false;
	};
	if("ALF_Atropine" in magazines player) then {
		_btn6 ctrlEnable true;
	} else {
		_btn6 ctrlEnable false;
	};
	if("ALF_Morphine" in magazines player) then {
		_btn7 ctrlEnable true;
	} else {
		_btn7 ctrlEnable false;
	};
} else {
	_btn3 ctrlEnable false;
	_btn5 ctrlEnable false;
	_btn6 ctrlEnable false;
	_btn7 ctrlEnable false;
};

private _obj = createSimpleObject ["ALF_Medical\ALF_Guardian\ALF_Guardian.p3d", [0,0,0]];
_obj setPosATL (player modelToWorld [0,0.3,0]);

for "_i" from 0 to 1 step 0 do {
	if(isNull _u) exitWith {deletevehicle _obj;};
	if !(alive _u) exitWith {deletevehicle _obj;};
	if !(alive player) exitWith {deletevehicle _obj;};
	if(isNull (findDisplay 18000)) exitWith {deletevehicle _obj;};

	private _medvar = _u getVariable ["MedicalStats",[]];
	if(count _medvar isEqualTo 0) then {
		_bpm ctrlSetStructuredText parseText "<t color='#AA0000'>NC</t>";
		_mmHg1 ctrlSetStructuredText parseText "<t color='#1D6642'>NC</t>";
		_mmHg2 ctrlSetStructuredText parseText "<t color='#1D6642'>NC</t>";
		_spo2 ctrlSetStructuredText parseText "<t color='#0054BC'>NC</t>";
		_resp ctrlSetStructuredText parseText "<t color='#8A8A3D'>NC</t>";
	} else {
		private _ubpm = _medvar select 0;
		private _ummHg1 = _medvar select 1;
		private _ummHg2 = ceil(_ummHg1 * 0.92);
		private _uspo2 = _medvar select 3;
		private _uresp = _medvar select 2;
		_bpm ctrlSetStructuredText parseText format["<t color='#AA0000'>%1</t>",_ubpm];
		_mmHg1 ctrlSetStructuredText parseText format["<t color='#1D6642'>%1</t>",_ummHg1];
		_mmHg2 ctrlSetStructuredText parseText format["<t color='#1D6642'>%1</t>",_ummHg2];
		_spo2 ctrlSetStructuredText parseText format["<t color='#0054BC'>%1</t>",_uspo2];
		_resp ctrlSetStructuredText parseText format["<t color='#8A8A3D'>%1</t>",_uresp];
		playSound "guardian";
	};

	if(count (nearestObjects[position player,["ALF_Brancard_P"],5]) > 0 && {isNull objectParent life_pInact_curObject}) then {
		_btn1 ctrlEnable true;
	} else {
		_btn1 ctrlEnable false;
	};
	if(count (nearestObjects[position player,["ALF_Wheelchair_P"],5]) > 0 && {isNull objectParent life_pInact_curObject}) then {
		_btn8 ctrlEnable true;
	} else {
		_btn8 ctrlEnable false;
	};
	sleep 5;
};
