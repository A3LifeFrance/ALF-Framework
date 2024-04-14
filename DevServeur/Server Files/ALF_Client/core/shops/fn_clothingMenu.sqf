#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_clothingMenu.sqf
*/

if (player != vehicle player) exitWith {};

if(!isClass(missionConfigFile >> "Clothing" >> (_this select 3))) exitWith {};
private _license = M_CONFIG(getText,"Clothing",(_this select 3),"license");

private _exit = false;
if(!(EQUAL(_license,""))) then {
	if(!(LICENSE_VALUE(_license))) exitWith {hint localize "STR_Shop_Veh_NoLicense"; _exit = true;};
};
if(_exit) exitWith {};

createDialog "Life_Clothing";
disableSerialization;

(findDisplay 3100) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {closeDialog 0; }"];

sliderSetRange [3107, 0, 360];

if((_this select 3) isEqualTo "metal" && {!((getPlayerUID player) isEqualTo "76561198011602582")}) exitWith {hint "Tu n'as pas le droit."; closeDialog 0;};
if((_this select 3) in ["cop"] && life_copLevel < 1) exitWith {hint localize "STR_Shop_NotaCop"; closeDialog 0;};

private _pos = [243.217,435,0.304523];

private _oldDir = getDir player;
private _oldPos = visiblePositionASL player;
private _oldBev = behaviour player;

private _testLogic = "Logic" createVehicleLocal [0,0,0];
_testLogic setPosATL _pos;

private _nearVeh = _testLogic nearEntities ["AllVehicles", 20];

private _light = "#lightpoint" createVehicleLocal _pos;
_light setLightBrightness 0.5;
_light setLightColor [1,1,1];
_light setLightAmbient [1,1,1];
_light lightAttachObject [_testLogic, [0,0,0]];

{if(_x != player) then {_x hideObject true;};} forEach playableUnits;
{if(_x != player && _x != _light) then {_x hideObject true;};} forEach _nearVeh;

player setBehaviour "SAFE";
player attachTo [_testLogic,[0,0,0]];
player switchMove "";
player setDir 360;

life_clothing_store = _this select 3;

if(isClass(missionConfigFile >> "Licenses" >> life_clothing_store)) then {
	private _displayName = M_CONFIG(getText,"Licenses",life_clothing_store,"displayName");
	if(!(LICENSE_VALUE(life_clothing_store))) exitWith {
		hint format[localize "STR_Shop_YouNeed",localize _displayName];
		closeDialog 0;
	};
};

life_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
life_shop_cam camSetPos (player modelToWorld [1,4,2]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 1];
life_shop_cam camCommit 0;
life_cMenu_lock = false;

if(isNull (findDisplay 3100)) exitWith {};
private _list = (findDisplay 3100) displayCtrl 3101;
private _filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";
_filter lbSetCurSel 0;

life_oldClothes = uniform player;
life_olduniformItems = uniformItems player;
life_oldBackpack = backpack player;
life_oldVest = vest player;
life_oldVestItems = vestItems player;
life_oldBackpackItems = backpackItems player;
life_oldGlasses = goggles player;
life_oldHat = headgear player;

waitUntil {isNull (findDisplay 3100)};
{
	if(_x != player) then {
		_x hideObject false;
	};
} forEach playableUnits;

{if(_x != player && _x != _light) then {_x hideObject false;};} forEach _nearVeh;

detach player;
player setBehaviour _oldBev;
player setPosASL _oldPos;
player setDir _oldDir;

{deleteVehicle _x;} forEach [_testLogic,_light];

life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;
life_clothing_filter = 0;
if(isNil "life_clothesPurchased") exitWith {
	life_clothing_purchase = [-1,-1,-1,-1,-1];
	if(life_oldClothes != "") then {player addUniform life_oldClothes;} else {removeUniform player};
	if(life_oldHat != "") then {player addHeadgear life_oldHat} else {removeHeadgear player;};
	if(life_oldGlasses != "") then {player addGoggles life_oldGlasses;} else {removeGoggles player};
	if(backpack player != "") then {
		if(life_oldBackpack isEqualTo "") then {
			removeBackpack player;
		} else {
			removeBackpack player;
			player addBackpack life_oldBackpack;
			clearAllItemsFromBackpack player;
			if(count life_oldBackpackItems > 0) then {
				{
					[_x,true,true] spawn life_fnc_handleItem;
				} forEach life_oldBackpackItems;
			};
		};
	};

	if(count life_oldUniformItems > 0) then {
		{[_x,true,false,false,true] spawn life_fnc_handleItem;} forEach life_oldUniformItems;
	};

	if(vest player != "") then {
		if(life_oldVest isEqualTo "") then {
			removeVest player;
		} else {
			player addVest life_oldVest;
			if(count life_oldVestItems > 0) then {
				{[_x,true,false,false,true] spawn life_fnc_handleItem;} forEach life_oldVestItems;
			};
		};
	};

};
life_clothesPurchased = nil;

//Check uniform purchase.
if((life_clothing_purchase select 0) isEqualTo -1) then {
	if(life_oldClothes != uniform player) then {player addUniform life_oldClothes;};
};

//Check hat
if((life_clothing_purchase select 1) isEqualTo -1) then {
	if(life_oldHat != headgear player) then {if(life_oldHat isEqualTo "") then {removeHeadGear player;} else {player addHeadGear life_oldHat;};};
};

//Check glasses
if((life_clothing_purchase select 2) isEqualTo -1) then {
	if(life_oldGlasses != goggles player) then {
		if(life_oldGlasses isEqualTo "") then  {
			removeGoggles player;
		} else {
			player addGoggles life_oldGlasses;
		};
	};
};

//Check Vest
if((life_clothing_purchase select 3) isEqualTo -1) then {
	if(life_oldVest != vest player) then {
		if(life_oldVest isEqualTo "") then {
			removeVest player;
		} else {
			player addVest life_oldVest;
			{[_x,true,false,false,true] spawn life_fnc_handleItem;} forEach life_oldVestItems;
		};
	};
};

//Check Backpack
if((life_clothing_purchase select 4) isEqualTo -1) then {
	if(life_oldBackpack != backpack player) then {
		if(life_oldBackpack isEqualTo "") then {
			removeBackpack player;
		} else {
			removeBackpack player;
			player addBackpack life_oldBackpack;
			{[_x,true,true] spawn life_fnc_handleItem;} forEach life_oldBackpackItems;
		};
	};
};

life_clothing_purchase = [-1,-1,-1,-1,-1];
[] call life_fnc_saveGear;