#include "\ALF_Client\script_macros.hpp"
/*
File: fn_payerArmurerie.sqf
Author: ALF Team
*/
if((time - life_action_delay) < 1) exitWith {["INFO", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;};
life_action_delay = time;

if(count alf_shop_panier isEqualTo 0) exitWith {["INFO", "Ton panier est vide.", "warning"] spawn ALF_fnc_doMsg;};
if(count life_houses isEqualTo 0) exitWith {["INFO", "Tu n'as pas de domicile.", "warning"] spawn ALF_fnc_doMsg;};
	
private _pricett = 0;
{
	private _itemPrice = _x select 2;
	_pricett = _pricett + _itemPrice;
} forEach alf_shop_panier;

private _handle = [_pricett,false] call ALF_fnc_handleCB;
if(_handle) exitWith {};

private _position = CONTROL_DATA(24521);
_position = call compile format["%1", _position];

[alf_shop_panier,_position] remoteExec ["HC_fnc_internetLivSystem",HC2_Life];

["INFO", format["Tu as acheté pour %1€ sur Intranet. Tu recevras ça chez toi dans peu de temps.",_pricett], "success"] spawn ALF_fnc_doMsg;
[name player,getPlayerUID player,"INTERNET",format["A acheté %1€ sur internet (DarkNet).",_pricett]] remoteExec ["HC_fnc_logIt",HC3_Life];

alf_shop_panier = [];
closeDialog 0;
