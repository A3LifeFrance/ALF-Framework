#include "\ALF_Client\script_macros.hpp"
/*
File: fn_delPArmurerie.sqf
Author: ALF Team
*/
private["_index","_texte","_num","_classname","_price","_pricef"];
if((lbCurSel 24523) isEqualTo -1) exitWith {};
_index = lbCurSel((findDisplay 24500) displayCtrl 24523);
if (_index isEqualTo -1) exitWith {};
alf_shop_panier deleteAt _index;

private _display = findDisplay 24500;
private _armurerie2plist = _display displayCtrl 24523;
private _armurerie2price = _display displayCtrl 24520;

lbClear _armurerie2plist;
private _pricett = 0;
{
	private _itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
	private _itemPrice = _x select 2;
	_pricett = _pricett + _itemPrice;
	_armurerie2plist lbAdd format["%1 - [x%2]",_itemInfo select 1,_x select 1];
	_armurerie2plist lbSetPicture[(lbSize _armurerie2plist)-1,_itemInfo select 2];
} forEach alf_shop_panier;
_armurerie2price ctrlSetStructuredText parseText format["<t color='#000000'>%1€</t>",[_pricett] call life_fnc_numberText];
