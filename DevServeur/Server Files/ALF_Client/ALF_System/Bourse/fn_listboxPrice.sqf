#include "\ALF_Client\script_macros.hpp"
/*
File:
Author: ALF Team
Description:

*/
disableSerialization;
_dialog = findDisplay 24500;

_listbox = _dialog  displayCtrl 24525;
_cashdisplay = _dialog displayCtrl 24526;
_cashdisplayold = _dialog displayCtrl 24527;

_data = lbData[24525,lbCurSel(24525)];
_data = call compile format["%1",_data];

_index = _data select 0;
_costOld = 0;
_itemArrayOld = [];

if (!isNil "ALFBOURSE_PricesOld") then {_itemArrayOld = ALFBOURSE_PricesOld select _index;} else {_itemArrayOld=["",0];};

_itemArray = ALFBOURSE_Prices select _index;
_cost = _itemArray select 1;
_costOld = _itemArrayOld select 1;

_cashdisplay ctrlSetStructuredText parseText format ["<t size='2' color='#000000'>%1€<\t>",_cost];
_arrowText = "";
if (_cost<_costOld) then {
	_percent = (100-((_cost/_costOld)*100));
	_arrowText = format ["<t color='#FF0000'>↓ %1%2",_percent,"%"];
} else {
	if (_costOld<_cost) then {
		_percent = (100-((_costOld/_cost)*100));
		_arrowText = format ["<t color='#04B404'>↑ %1%2",_percent,"%"];
	} else {
		_percent = (100-((_costOld/_cost)*100));
		_arrowText = format [""];
	};
};
_cashdisplayold ctrlSetStructuredText parseText format ["<t size='2' color='#000000'>%1<\t>",_arrowText];