#include "\ALF_Client\script_macros.hpp"
/*
File: fn_addPArmurerie.sqf
Author: ALF Team
*/
private["_item","_texte","_num","_classname","_price","_pricef"];
if((lbCurSel 24512) isEqualTo -1) exitWith {};
_item = lbData[24512,lbCurSel(24512)];
_item = call compile format["%1",_item];

_num = ctrlText 24513;
if !([_num] call TON_fnc_isnumber) exitWith {};
_num = parseNumber(_num);
if(_num < 1) exitWith {};

_classname = _item select 0;
_price = parseNumber(_item select 1);

_pricef = _price * _num;

alf_shop_panier pushBack [_classname,_num,_pricef];

_texte = (findDisplay 24500) displayCtrl 24515;
_texte ctrlSetStructuredText parseText format["<t color='#000000'>%1</t>",count alf_shop_panier];
