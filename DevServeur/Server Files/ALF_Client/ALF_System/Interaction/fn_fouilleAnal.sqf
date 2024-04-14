#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_fouilleAnal.sqf
	Author: NANOU
*/
private _curObj = _this select 0;
life_pInact_curObject = _curObj;
private _load = false;
private _items = [(goggles _curObj)] + [(headgear _curObj)] + [(uniform _curObj)] + [(vest _curObj)] + [(backpack _curObj)] + (assignedItems _curObj) + (uniformItems _curObj) + (vestItems _curObj) + (backPackItems _curObj) + [(primaryWeapon _curObj)] + [(secondaryWeapon _curObj)] + [(handgunWeapon _curObj)];

if(isNull (findDisplay 69697)) then {
	createDialog "ALF_Cop_Fouille";
	_load = true;
	if (life_coplevel isEqualTo 0) then {
		["INFO","Une personne est en train de vous fouiller.","warning"] remoteExec ["ALF_fnc_doMsg",_curObj];
	} else {
		["INFO","Un gendarme est en train de vous fouiller.","warning"] remoteExec ["ALF_fnc_doMsg",_curObj];
	};
};
disableSerialization;

private _list = (findDisplay 69697) displayCtrl 6969778;
private _btn = (findDisplay 69697) displayCtrl 6969779;
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
	_btn buttonSetAction "[life_pInact_curObject] spawn ALF_fnc_saisirThisItem;";
};

if(_load) then {
	for "_i" from 0 to 1 step 0 do {
		if(isNull (findDisplay 69697)) exitWith {};
		if(_curObj distance player > 4) exitWith {closeDialog 69697;};
		uiSleep 1;
	};
};
