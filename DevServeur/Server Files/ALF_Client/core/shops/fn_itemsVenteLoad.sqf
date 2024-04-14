#include "\ALF_Client\script_macros.hpp"

if(!dialog) exitWith {};
private _itemList = ((findDisplay 39400) displayCtrl 39403);
lbClear _itemList;
private _shop = uiNamespace getVariable ["Items_Vente",""];
private _config = [];
private _listedItems = [];
_config = (assignedItems player) + (uniformItems player) + (vestItems player) + (backPackItems player);
((findDisplay 39400) displayCtrl 39405) ctrlSetText "VENDRE";
ctrlShow [39402,true];
private _itemArray = M_CONFIG(getArray,"ItemsVente",_shop,"items");
{
	if(!(_x in _listedItems) && _x != "") then {
		private _iS = [_x,_itemArray] call TON_fnc_index;
		if(_iS != -1) then {
			private _itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_listedItems pushBack _x;
			private _itemCount = {_x isEqualTo (_itemInfo select 0)} count _config;
			if(_itemCount > 1) then {
				_itemList lbAdd format["[x%2] %1",_itemInfo select 1,_itemCount];
			} else {
				_itemList lbAdd format["%1",_itemInfo select 1];
			};
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
		};
	};
} forEach _config;

((findDisplay 39400) displayCtrl 39403) lbSetCurSel 0;
