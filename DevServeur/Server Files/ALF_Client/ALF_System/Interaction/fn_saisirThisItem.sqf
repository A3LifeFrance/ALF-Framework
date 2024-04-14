#include "\ALF_Client\script_macros.hpp"
/*
	File: sairThisItem.sqf
	Author: NANOU
*/
private _curObj = _this select 0;
if(isNil "_curObj") exitWith {};
disableSerialization;
private _btn = (findDisplay 69697) displayCtrl 6969779;
_btn ctrlEnable false;

private _item = lbData[6969778,(lbCurSel 6969778)];

[_item,false] remoteExec ["life_fnc_handleItem",_curObj];
private _itemInfo = [_item] call life_fnc_fetchCfgDetails;
private _itemStr = _itemInfo select 1;
["INFO", format["Tu as été saisie de: %1.",_itemStr], "warning"] remoteExec ["ALF_fnc_doMsg",_curObj];

private _holder = nearestObjects [player,["groundweaponholder"],4];

if (_holder isEqualTo []) then {
	_holder = createVehicle [ "GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE" ];
} else {
	_holder = _holder select 0;
};

switch (true) do {
	case (isClass(configFile >> "CfgMagazines" >> _item)): {
		_holder addMagazineCargoGlobal [_item,1];
	};
	case (isClass(configFile >> "CfgWeapons" >> _item)): {
		_holder addWeaponCargoGlobal [_item,1];
	};
	case (isClass(configFile >> "CfgVehicles" >> _item)): {
		_holder addBackpackCargoGlobal [_item,1];
	};
	default {
		_holder addItemCargoGlobal [_item,1];
	};
};

sleep 0.5;

private _items = [(goggles _curObj)] + [(headgear _curObj)] + [(uniform _curObj)] + [(vest _curObj)] + [(backpack _curObj)] + (assignedItems _curObj) + (uniformItems _curObj) + (vestItems _curObj) + (backPackItems _curObj) + [(primaryWeapon _curObj)] + [(secondaryWeapon _curObj)] + [(handgunWeapon _curObj)];

private _list = (findDisplay 69697) displayCtrl 6969778;
lbClear _list;

if(({!(_x isEqualTo "")} count _items) isEqualTo 0) then {

	_list lbAdd "Vide.";
	_list lbSetdata [(lbSize _list)-1,"Vide."];
	((findDisplay 69697) displayCtrl 6969778) lbSetCurSel 0;
	_btn ctrlEnable false;
} else {
	{
		if !(_x in ["","sharp_swing"]) then {
			private _itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_list lbAdd format["%1",_itemInfo select 1];
			_list lbSetPicture [(lbSize _list)-1,_itemInfo select 2];
			_list lbSetdata [(lbSize _list)-1,format["%1",_x]];
		};
	} forEach _items;
	_btn ctrlEnable true;
};