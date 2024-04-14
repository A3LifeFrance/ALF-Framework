/*
	File: fn_changeClothes.sqf
*/

disableSerialization;

private _control = (_this select 0) select 0;
private _selection = (_this select 0) select 1;
private _price = (findDisplay 3100) displayCtrl 3102;

if(_selection isEqualTo -1) exitWith {};
if(isNull _control) exitWith {};
if(life_cMenu_lock) exitWith {};
life_cMenu_lock = true;

life_clothing_purchase set[life_clothing_filter,(_control lbValue _selection)];
private _data = _control lbData _selection;

if(_data isEqualTo "NONE") then {
	private _item = switch(life_clothing_filter) do {
		case 0: {uniform player};
		case 1: {headGear player};
		case 2: {goggles player};
		case 3: {vest player};
		case 4: {backpack player};
	};
	
	[_item,false] spawn life_fnc_handleItem;
} else {
	[_data,true,nil,nil,nil,nil,nil,true] spawn life_fnc_handleItem;
};

life_cMenu_lock = false;

_totalPrice = 0;
{
	if(_x != -1) then {
		_totalPrice = _totalPrice + _x;
	};
} forEach life_clothing_purchase;

_price ctrlSetStructuredText parseText format ["Unité : <t color='#8cff9b'>%1 €</t>" + " <t color='#8cff9b'>Total :%2 €</t>",[(_control lbValue _selection)] call life_fnc_numberText,[_totalPrice] call life_fnc_numberText];