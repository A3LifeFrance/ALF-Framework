#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Dev Team
*/
private["_className"];
_className = _this select 0;
if(_className isEqualTo "") exitWith {[]};
_return = [];
_price = 0;
{
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	if (_curItemName isEqualTo _className) then {_price=_curItemPrice};
} forEach ALFBOURSE_Prices;
if(_price isEqualTo -1) exitWith {};

if(_className in ["ALF_Weed_P","ALF_Weed_P_2","ALF_Weed_P_3","ALF_Weed","ALF_Weed_2","ALF_Weed_3","ALF_Cocaine","ALF_Meth50","ALF_Meth90"]) then {
	switch (true) do {
		case (ALF_Count_Cops >= 15) : {_price = _price * 1.8};
		case (ALF_Count_Cops < 15 && ALF_Count_Cops >= 10) : {_price = _price * 1.2};
		case (ALF_Count_Cops < 10 && ALF_Count_Cops >= 5) : {_price = _price};
		case (ALF_Count_Cops < 5 && ALF_Count_Cops >= 1) : {_price = _price * 0.25};
		case (ALF_Count_Cops isEqualTo 0) : {_price = _price * 0.1};
		default {_price = _price * 0.1};
	};
};

_return = (floor _price);
_return;