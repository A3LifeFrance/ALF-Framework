#include "\ALF_Client\script_macros.hpp"
/*
File:
Author: ALF Team
Description:

*/
params [
	["_mode",-1,[0]],
	["_itemArray",[],[[]]]
];
if (isNil "ALFBOURSE_NbAchat") then {ALFBOURSE_NbAchat=[];};

switch (_mode) do {
	case 0: {
		[ALFBOURSE_NbAchat] remoteExecCall ["HC_fnc_updateBourse",HC_Life];
		ALFBOURSE_NbAchat = [];
	};
	case 1: {
		private _needToUpdate = false;
		if (!isNil "ALFBOURSE_Prices") then {ALFBOURSE_PricesOld = ALFBOURSE_Prices;} else {_needToUpdate=true;};
		ALFBOURSE_Prices = _itemArray;
		if (_needToUpdate) then {ALFBOURSE_PricesOld = ALFBOURSE_Prices;};
	};
};