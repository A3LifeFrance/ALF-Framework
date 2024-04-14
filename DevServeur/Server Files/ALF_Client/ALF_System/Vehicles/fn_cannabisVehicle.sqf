#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_illegalVehicle.sqf
	Author: ALF Nanou
*/
private _v = _this select 0;
if(isNil "_v") exitWith {};
private _vM = getMagazineCargo _v;
private _c = {_x in ["ALF_Graine_W","ALF_Weed","ALF_Weed_2","ALF_Weed_3","ALF_Weed_P","ALF_Weed_P_2","ALF_Weed_P_3"]} count (_vM select 0);

if(_c > 0) then {
	private _i1 = (_vM select 0) find "ALF_Graine_W";
	private _i2 = (_vM select 0) find "ALF_Weed";
	private _i3 = (_vM select 0) find "ALF_Weed_2";
	private _i4 = (_vM select 0) find "ALF_Weed_3";
	private _i5 = (_vM select 0) find "ALF_Weed_P";
	private _i6 = (_vM select 0) find "ALF_Weed_P_2";
	private _i7 = (_vM select 0) find "ALF_Weed_P_3";
	private ["_p1","_p2","_p3","_p4","_p5","_p6","_p7","_c1","_c2","_c3","_c4","_c5","_c6","_c7"];
	if !(_i1 isEqualTo -1) then {
		_c1 = (_vM select 1) select _i1;
		_p1 = 2;
		_p1 = round(_p1 * _c1);
	} else {
		_p1 = 0;
		_c1 = 0;
	};
	if !(_i2 isEqualTo -1) then {
		_c2 = (_vM select 1) select _i2;
		_p2 = ["ALF_Weed"] call ALF_fnc_returnPrice;
		_p2 = round(_p2 * _c2);
	} else {
		_p2 = 0;
		_c2 = 0;
	};
	if !(_i3 isEqualTo -1) then {
		_c3 = (_vM select 1) select _i3;
		_p3 = ["ALF_Weed_2"] call ALF_fnc_returnPrice;
		_p3 = round(_p3 * _c3);
	} else {
		_p3 = 0;
		_c3 = 0;
	};
	if !(_i4 isEqualTo -1) then {
		_c4 = (_vM select 1) select _i4;
		_p4 = ["ALF_Weed_3"] call ALF_fnc_returnPrice;
		_p4 = round(_p4 * _c4);
	} else {
		_p4 = 0;
		_c4 = 0;
	};
	if !(_i5 isEqualTo -1) then {
		_c5 = (_vM select 1) select _i5;
		_p5 = ["ALF_Weed_P"] call ALF_fnc_returnPrice;
		_p5 = round(_p5 * _c5);
	} else {
		_p5 = 0;
		_c5 = 0;
	};
	if !(_i6 isEqualTo -1) then {
		_c6 = (_vM select 1) select _i6;
		_p6 = ["ALF_Weed_P_2"] call ALF_fnc_returnPrice;
		_p6 = round(_p6 * _c6);
	} else {
		_p6 = 0;
		_c6 = 0;
	};
	if !(_i7 isEqualTo -1) then {
		_c7 = (_vM select 1) select _i7;
		_p7 = ["ALF_Weed_P_3"] call ALF_fnc_returnPrice;
		_p7 = round(_p7 * _c7);
	} else {
		_p7 = 0;
		_c7 = 0;
	};
	private _pf = _p1 + _p2 + _p3 + _p4 + _p5 + _p6 + _p7;
	private _cf = _c1 + _c2 + _c3 + _c4 + _c5 + _c6 + _c7;

	private _a = [format["Le véhicule est rempli de %1 sachet(s) de cannabis d'une valeur de %2€. Veux-tu les saisir? Cela enlevera tout ce qu'il y a dans le coffre.",_cf,[_pf] call life_fnc_numberText],"VEHICULE","OUI","NON"] call BIS_fnc_guiMessage;
	if !(_a) exitWith {};
	clearMagazineCargoGlobal _v;

	private _cng = missionNamespace getVariable ["CNG",0];
	_cng = _cng + floor(_pf/15);
	[_cng] remoteExec ["HC_fnc_updateCNG",HC_life];

	private _a = ["Le véhicule a bien été saisie. Veux-tu publier l'enquête sur BFM TV?","BFM TV","OUI","NON"] call BIS_fnc_guiMessage;
	if !(_a) exitWith {};
	["FLASH INFO",format["Après une lourde enquête, l'auteur transportant une cargaison de cannabis vient d'être arrêté par la Gendarmerie. Le préjudice serait d'une valeur de plus de %1€. Pour des raisons confidentielles, le nom de l'auteur des faits ne sera pas divulgué.",[_pf] call life_fnc_numberText]] remoteExec ["ALF_fnc_doBfmO",(playableUnits select {alive _x})];
} else {
	["INFO","Il n'y a rien d'illegal dans le véhicule","warning"] spawn ALF_fnc_doMsg;
};
