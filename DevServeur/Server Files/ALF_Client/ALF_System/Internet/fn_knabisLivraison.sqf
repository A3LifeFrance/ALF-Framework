#include "\ALF_Client\script_macros.hpp"
/*
File: fn_knabisLivraison.sqf
Author: ALF Team
*/
private["_position","_number","_price","_exit"];
if((time - life_action_delay) < 1) exitWith {["INFO", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;};
life_action_delay = time;

_position = CONTROL_DATA(24509);
_position = call compile format["%1", _position];
_number = parseNumber(ctrlText 24505);

_price = 13;
if(_number > 10 && {_number <= 20}) then {
	_price = 12;
};
if(_number > 20 && {_number <= 30}) then {
	_price = 11;
};
if(_number > 30) then {
	_price = 10;
};
_price = _number * _price;

_exit = false;
if(_price > life_cash) then {
	_handle = [_price,false] call ALF_fnc_handleCB;
	if(_handle) exitWith {_exit = true;};
} else {
	life_cash = life_cash - _price;
	[0] call SOCK_fnc_updatePartial;
};
if(_exit) exitWith {};

[_number,"ALF_Graine_W",_position] remoteExec ["HC_fnc_livraisonSystem",HC2_Life];

["INFO", format["Tu as acheté %1 graine(s) pour %2€. Tu recevras ça chez toi dans peu de temps.",_number,_price], "success"] spawn ALF_fnc_doMsg;
[name player,getPlayerUID player,"INTERNET",format["A acheté %1 graine(s) de Weed sur internet pour %2€",_number,_price]] remoteExec ["HC_fnc_logIt",HC3_Life];

closeDialog 0;
