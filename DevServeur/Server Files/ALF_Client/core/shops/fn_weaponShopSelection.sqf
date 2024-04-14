#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_weaponShopSelection.sqf
*/

params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];

if(isNull _control || {_index isEqualTo -1}) exitWith {closeDialog 0;};

private _priceTag = CONTROL(38400,38404);
private _shop = uiNamespace getVariable ["Weapon_Shop",""];

if((GVAR_UINS ["Weapon_Shop_Filter",0]) isEqualTo 1) then {
	private _item = CONTROL_DATAI(_control,_index);
	private _itemArray = M_CONFIG(getArray,"WeaponShops",_shop,"items");
	_item = [_item,_itemArray] call TON_fnc_index;
	private _price = SEL(SEL(_itemArray,_item),3);
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix d'achat: <t color='#8cff9b'>%1 €</t></t>",[(_price)] call life_fnc_numberText];
	_control lbSetValue[_index,_price];
} else {
	private _price = _control lbValue _index;
	private _item = CONTROL_DATAI(_control,_index);
	if(_price > CASH) then {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix d'achat: <t color='#ff0000'>%1 €</t><br/>Manque: <t color='#8cff9b'>%2 €</t></t>",[(_price)] call life_fnc_numberText,[(_price - CASH)] call life_fnc_numberText];
	} else {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix d'achat: <t color='#8cff9b'>%1 €</t></t>",[(_price)] call life_fnc_numberText];
	};
};
