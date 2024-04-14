#include "\ALF_Client\script_macros.hpp"
/*
File: fn_recupererMailBox.sqf
Author: ALF Team
*/
if((time - life_action_delay) < 0.3) exitWith {["INFO","Tu appuis trop vite.","warning"] spawn ALF_fnc_doMsg;};
life_action_delay = time;

private ["_house","_count","_cible","_item","_itemcount","_details"];
_house = _this select 0;
life_pInact_curTarget = _house;
if((lbCurSel 25503) isEqualTo -1) exitWith {};
_ctrl = lbData[25503,lbCurSel(25503)];
if(_ctrl isEqualTo "Vide.") exitWith {};
_num = ctrlText 25504;
if !([_num] call TON_fnc_isnumber) exitWith {};
_num = parseNumber(_num);
if(_num < 1) exitWith {};

_index = [_ctrl,_house getVariable "courrier"] call TON_fnc_index;
_data = _house getVariable "courrier";
if (_index isEqualTo -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {["INFO","Tu n'as pas autant dans ta boite aux lettres.","warning"] spawn ALF_fnc_doMsg;};
if !(player canAdd [_ctrl,_num]) exitWith {["INFO","Tu n'as pas assez de places.","warning"] spawn ALF_fnc_doMsg;};

if (_num isEqualTo _value) then {
	_data deleteAt _index;
} else {
	_data set[_index,[_ctrl,(_value - _num)]];
};

_house setVariable ["courrier",_data,true];
for "_i" from 1 to _num step 1 do {
	[_ctrl,true] spawn life_fnc_handleItem;
};

disableSerialization;
private _display = findDisplay 25500;
private _yes = _display displayCtrl 25501;
private _no = _display displayCtrl 25502;
private _maillist = _display displayCtrl 25503;
private _mailbtn = _display displayCtrl 25505;

_courrier = _house getVariable ["courrier",[]];
if(count _courrier isEqualTo 0) then {
	_yes ctrlShow false;
	_no ctrlShow true;
	_mailbtn ctrlEnable false;

	lbClear _maillist;
	_maillist lbAdd "Vide.";
	_maillist lbSetdata [(lbSize _maillist)-1,"Vide."];
	((findDisplay 25500) displayCtrl 25503) lbSetCurSel 0;
} else {
	_yes ctrlShow true;
	_no ctrlShow false;

	private ["_itemInfo"];
	lbClear _maillist;
	{
		_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
		_maillist lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		_maillist lbSetdata [(lbSize _maillist)-1,format["%1",_x select 0]];
	} forEach _courrier;
};