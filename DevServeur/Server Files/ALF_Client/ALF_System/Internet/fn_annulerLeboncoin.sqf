#include "\ALF_Client\script_macros.hpp"
/*
File: annulerLeboncoin.sqf
Author: ALF Nanou
*/
disableSerialization;
if((lbCurSel 24532) isEqualTo -1) exitWith {hint "Tu n'as rien selectionne."};

private _data = CONTROL_DATA(24532);
_data = call compile format["%1",_data];

private _action = ["Es-tu certain de vouloir annuler cette annonce?","Leboncoin","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {};

private _nop = false;
private _houseCfg = [_data select 3] call life_fnc_houseConfig;
if((count _houseCfg) > 0) then {
	if(count life_houses >= (LIFE_SETTINGS(getNumber,"house_limit"))) then {_nop = true;};
};
if(_nop) exitWith {hint "Tu ne peux pas, tu as déja 4 maisons."};

closeDialog 0;

[_data select 0,_data select 2,getPlayerUID player,player] remoteExec ["HC_fnc_annulerLeboncoin",HC_Life];
