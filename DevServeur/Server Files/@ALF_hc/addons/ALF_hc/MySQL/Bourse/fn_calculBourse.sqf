#include "\ALF_hc\hc_macros.hpp"
/*
	File:
	Author:

	This file is for Nanou's HeadlessClient.

	Description:

*/
private["_curItemAmountSold3","_curItemPrice3","_curItemName3","_index","_NEWPRICE","_curItemAmountSold2","_curItemPrice2","_curItemName2","_curItemOldPrice","_curITEMmax","_curITEMmin","_curITEMpriceperunit","_curITEMname","_ITEMSarray","_GROUPITEMSarray","_GROUParray","_exit","_itemFactorOfGroup","_itemGroupName","_itemPriceMax","_itemPriceMin","_itemPricePerUnit","_itemAmountSold","_itemLastPrice","_itemName","_tempArrayHolder"];


_tempArrayHolder = ALFMARKET_Items_PriceArr;
{
	_itemName = _x select 0;
	_itemLastPrice = _x select 1;
	_itemAmountSold = _x select 2;
	_itemPricePerUnit = 0;
	_itemPriceMin = 0;
	_itemPriceMax = 0;
	_itemGroupName = "";
	_itemFactorOfGroup = 0;

	_exit = false;
	if (_itemAmountSold>0) then
	{
		{
			if (!_exit) then {
				_GROUParray = _x;
				_itemGroupName = _GROUParray select 0;
				_GROUPITEMSarray = _GROUParray select 1;
				_itemFactorOfGroup = _GROUParray select 2;
				{
					_ITEMSarray = _x;
					_curITEMname = _ITEMSarray select 0;
					_curITEMpriceperunit = _ITEMSarray select 1;
					_curITEMmin = _ITEMSarray select 2;
					_curITEMmax = _ITEMSarray select 3;
					if (_curITEMname isEqualTo _itemName) then {
						_exit = true;
						_itemPricePerUnit = _curITEMpriceperunit;
						_itemPriceMin = _curITEMmin;
						_itemPriceMax = _curITEMmax;
					};
				} forEach _GROUPITEMSarray;
			};
		} forEach ALFMARKET_Items_Groups;

		//ADJUST THE PRICES
		{
			_GROUParray = _x;
			_GROUPNAME = _GROUParray select 0;
			_GROUPITEMSarray = _GROUParray select 1;
			if (_itemGroupName isEqualTo _GROUPNAME) then
			{
				{
					_ITEMSarray = _x;
					_curITEMname = _ITEMSarray select 0;
					_curITEMpriceperunit = _ITEMSarray select 1;
					_curITEMmin = _ITEMSarray select 2;
					_curITEMmax = _ITEMSarray select 3;
					if (_curITEMname isEqualTo _itemName) then
					{
						// Find old price
						_curItemOldPrice = 0;
						{
							_curItemName2 = _x select 0;
							_curItemPrice2 = _x select 1;
							_curItemAmountSold2 = _x select 2;
							if (_curItemName2 isEqualTo _curITEMname) then {
								_curItemOldPrice = _curItemPrice2;
							};
						} forEach ALFMARKET_Items_PriceArr;
						// Calculate new own price
						_NEWPRICE = _curItemOldPrice-(_itemAmountSold*(_curItemOldPrice/2000)*_itemFactorOfGroup);
						if (_NEWPRICE<_curITEMmin) then {_NEWPRICE=_curITEMmin};
						if (_NEWPRICE>_curITEMmax) then {_NEWPRICE=_curITEMmax};
						_index = -1;
						{
							_index = _index + 1;
							_curItemName3 = _x select 0;
							_curItemPrice3 = _x select 1;
							_curItemAmountSold3 = _x select 2;
							if (_curItemName3 isEqualTo _curITEMname) then {
								ALFMARKET_Items_PriceArr set [_index,[_curITEMname,_NEWPRICE,0]];
							};
						} forEach ALFMARKET_Items_PriceArr;
					} else {
						// Calculate new price
						_index = -1;
						{
							_index = _index + 1;
							_curItemName3 = _x select 0;
							_curItemPrice3 = _x select 1;
							_curItemAmountSold3 = _x select 2;
							if (_curItemName3 isEqualTo _curITEMname) then {
								_NEWPRICE = _curItemPrice3+(_itemAmountSold*(_curItemPrice3/1000)*_itemFactorOfGroup);
								if (_NEWPRICE<_curITEMmin) then {_NEWPRICE=_curITEMmin};
								if (_NEWPRICE>_curITEMmax) then {_NEWPRICE=_curITEMmax};
								ALFMARKET_Items_PriceArr set [_index,[_curITEMname,_NEWPRICE,_curItemAmountSold3]];
							};
						} forEach ALFMARKET_Items_PriceArr;
					};
				} forEach _GROUPITEMSarray;
			};
		} forEach ALFMARKET_Items_Groups;
	};
} forEach ALFMARKET_Items_PriceArr;
ALFMARKET_Items_PriceArr = _tempArrayHolder;

private["_curItemName","_index","_itemNewPrice","_itemName"];
// Translate to sell_array
{
	_itemName = _x select 0;
	_itemNewPrice = _x select 1;

	_index = -1;
	{
		_index = _index + 1;
		_curItemName = _x select 0;
		if (_curItemName isEqualTo _itemName) then {
			ALFMARKET_sellarraycopy set [_index,[_itemName,_itemNewPrice]];
		};
	} forEach ALFMARKET_sellarraycopy;
} forEach ALFMARKET_Items_PriceArr;

[1,ALFMARKET_sellarraycopy] remoteExecCall ["ALF_fnc_updateClientBourse",RANY];
