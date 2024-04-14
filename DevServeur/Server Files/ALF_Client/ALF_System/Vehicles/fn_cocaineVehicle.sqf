#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_illegalVehicle.sqf
	Author: ALF Nanou
*/
private _v = _this select 0;
if(isNil "_v") exitWith {};
private _vM = getMagazineCargo _v;
private _c = {_x in ["ALF_Cocaine_U","ALF_Cocaine"]} count (_vM select 0);

if(_c > 0) then {
	private _i1 = (_vM select 0) find "ALF_Cocaine_U";
	private _i2 = (_vM select 0) find "ALF_Cocaine";
	private ["_p1","_p2","_c1","_c2"];
	if !(_i1 isEqualTo -1) then {
		_c1 = (_vM select 1) select _i1;
		_p1 = 2;
		_p1 = round(_p1 * _c1);
	} else {
		_p1 = 0;
	};
	if !(_i2 isEqualTo -1) then {
		_c2 = (_vM select 1) select _i2;
		_p2 = ["ALF_Cocaine"] call ALF_fnc_returnPrice;
		_p2 = round(_p2 * _c2);
	} else {
		_p2 = 0;
	};
	private _pf = _p1 + _p2;
	private _cf = _c1 + _c2;

	private _a = [format["Le véhicule est rempli de %1 sachet(s) de cocaine d'une valeur de %2€. Veux-tu les saisir ? Cela enlevera tout ce qu'il y a dans le coffre.",_cf,[_pf] call life_fnc_numberText],"VEHICULE","OUI","NON"] call BIS_fnc_guiMessage;
	if !(_a) exitWith {};
	clearMagazineCargoGlobal _v;
	
	private _cng = missionNamespace getVariable ["CNG",0];
	_cng = _cng + floor(_pf/15);
	[_cng] remoteExec ["HC_fnc_updateCNG",HC_life];
	[name player,getPlayerUID player,"VEHICULE",format["A saisie %1 sachet(s) de cocaine | POS : %2 | VEHICULE : %3 | VALEUR : %5 €.", _cf, getPos _v, typeOf _v,[_pf] call life_fnc_numberText]] remoteExec ["HC_fnc_logIt",HC3_Life];

	private _a = ["Le véhicule a bien été saisie. Veux-tu publier l'enquête sur BFM TV?","BFM TV","OUI","NON"] call BIS_fnc_guiMessage;
	if !(_a) exitWith {};
	["FLASH INFO",format["Après une lourde enquête, l'auteur transportant une cargaison de cocaine vient d'être arrêté par la Gendarmerie. Le préjudice serait d'une valeur de plus de %1€. Pour des raisons confidentielles, le nom de l'auteur des faits ne sera pas divulgué.",[_pf] call life_fnc_numberText]] remoteExec ["ALF_fnc_doBfmO",playableUnits select {alive _x}];
} else {
	["INFO","Il n'y a rien d'illegal dans le véhicule","warning"] spawn ALF_fnc_doMsg;
};
