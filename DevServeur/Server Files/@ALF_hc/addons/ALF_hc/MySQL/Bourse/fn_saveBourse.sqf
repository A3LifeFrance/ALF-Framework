#include "\ALF_hc\hc_macros.hpp"
/*
	File:
	Author:

	This file is for Nanou's HeadlessClient.

	Description:

*/
private["_switch","_query","_queryResult","_pricearray","_curItemName","_index","_itemNewPrice","_itemName"];

_switch = _this select 0;

switch (_switch) do
{
	case 0:
	{
		_query = format["UPDATE bourse SET items = '%1' WHERE id='1'",ALFMARKET_Items_PriceArr];
		_queryResult = [_query,1] call HC_fnc_asyncCall;
	};

	case 1:
	{
		_query = format["SELECT items FROM bourse WHERE id='1'"];
		_queryResult = [_query,2] call HC_fnc_asyncCall;
		_pricearray = _queryResult select 0;
		if (count _pricearray < 1) then {
			diag_log "ALFMARKET: Erreur de chargement Base de donnée";
		} else {
			ALFMARKET_Items_PriceArr = _pricearray;
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
			diag_log "ALFMARKET: Bourse OK !";
		};
	};
};