#include "\ALF_Client\script_macros.hpp"
/*
File: achatLeboncoin.sqf
Author: ALF Nanou
*/
disableSerialization;
if((lbCurSel 24532) isEqualTo -1) exitWith {hint "Tu n'as rien selectionne."};
private _nop = false;

private _data = CONTROL_DATA(24532);
_data = call compile format["%1",_data];

private _houseCfg = [_data select 3] call life_fnc_houseConfig;
if((count _houseCfg) > 0) then {
	if(count life_houses >= (LIFE_SETTINGS(getNumber,"house_limit"))) then {_nop = true;};
};
if(_nop) exitWith {hint "Tu ne peux pas acheter plus de 3 maisons."};

private _action = [format["Es-tu certain de vouloir acheter ce véhicule/maison d'une valeur de %1€?",[_data select 6] call life_fnc_numberText],"Leboncoin","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

closeDialog 0;

[_data select 0,_data select 2,_data select 6,player,_data select 1] remoteExec ["HC_fnc_checkLeboncoin",HC_Life];
