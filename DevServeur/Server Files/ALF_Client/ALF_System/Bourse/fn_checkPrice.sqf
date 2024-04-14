#include "\ALF_Client\script_macros.hpp"
/*
File:
Author: ALF Team
Description:

*/

_price = 0;
_kind = _this select 0;
{
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	if (_curItemName isEqualTo _kind) then {_price=_curItemPrice};
} forEach ALFBOURSE_Prices;
_price;