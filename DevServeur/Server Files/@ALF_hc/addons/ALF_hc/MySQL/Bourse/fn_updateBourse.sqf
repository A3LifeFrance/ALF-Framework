#include "\ALF_hc\hc_macros.hpp"
/*
	File:
	Author:

	This file is for Nanou's HeadlessClient.

	Description:

*/
params [
	["_itemArray",[],[[]]]
];

if (count _itemArray < 1) exitWith {};

{
	private _itemName = _x select 0;
	private _itemAmountSold = _x select 1;
	private _index = -1;
	{
		_index = _index + 1;
		private _curItemName = _x select 0;
		if (_curItemName isEqualTo _itemName) then {
			ALFMARKET_Items_PriceArr set [_index,[_curItemName,(_x select 1),(_x select 2)+_itemAmountSold]];
		};
	} forEach ALFMARKET_Items_PriceArr;
} forEach _itemArray;