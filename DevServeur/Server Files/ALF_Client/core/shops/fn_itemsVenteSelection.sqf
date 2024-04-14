#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Team
*/

params [
  ["_control",controlNull,[controlNull]],
  ["_index",-1,[-1]]
];
if(isNull _control) exitWith {closeDialog 0;}; //Bad data
if(_index isEqualTo -1) exitWith {}; //Nothing selected

private _priceTag = CONTROL(39400,39404);
private _item = CONTROL_DATAI(_control,_index);
private _price = [_item] call ALF_fnc_returnPrice;
_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Côte en bourse: <t color='#8cff9b'>%1€</t></t>",[(_price)] call life_fnc_numberText];
_control lbSetValue[_index,_price];
