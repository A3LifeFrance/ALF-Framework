if(!hasInterface)exitWith{};
waitUntil{!(isNull player)};
/*
["MouseButtonDown","if(_this select 1 ==0) then {Bolt_buttonReleased = false; Bolt_keepReloading = false;};"] call cba_fnc_addDisplayHandler;
["MouseButtonUp","if(_this select 1 ==0) then {Bolt_buttonReleased = true;};"] call cba_fnc_addDisplayHandler;

Some CBA keybinds might not appear in the controls menu...
[] spawn {
["KA PLA MOD","PLA_opticsMode", ["optics Mode",""], {2 call KA_item_Weapon}, {}, [181, [false, false, false]]] call CBA_fnc_addKeybind;
["KA PLA MOD","PLA_headlights", ["flashlight / laser  mode", ""], {1 call KA_item_Weapon}, {}, [38, [false, true, false]]] call cba_fnc_addKeybind;
};
*/



//ˢ��һ����Ͳ�ӵ�ҩ...
/*
[] spawn {
_Weapon =[];
{if(getnumber(_x >> "scope") == 2 && gettext(_x >> "KA_usedTube") != "") then{_Weapon = _Weapon + [configName _x]};}foreach ("isclass _x" configclasses (configfile >> "CfgWeapons"));
	waitUntil
	{
		_unitsArray = if (isServer) then {allUnits} else {units (group player)};
		_t = if((count _unitsArray)>0)then{(sqrt (count _unitsArray) / 10)}else{0};
		sleep 1 + _t;
		{
			if ((local _x)&&(alive _x)&&(secondaryWeapon _x in _Weapon))then
			{
				_preloadMag = (getArray (configFile >> "CfgWeapons" >> secondaryWeapon _x >> "magazines")) select 0;
				if (_preloadMag != "") then
				{
					if(_preloadMag in magazines _x) then{_x removeMagazines _preloadMag;};
					if(_x ammo (secondaryWeapon _x) == 0)then
					{
						if(_x == player) then
						{
						_listGW = player nearSupplies 10;
						_objcount = count _listGW;
							if(_objcount > 0)then
							{
								for "_n" from 0 to (_objcount - 1) do
								{
									_getlist = ((getMagazineCargo (_listGW select _n)) select 0);
									_getlist_index = ((getMagazineCargo (_listGW select _n)) select 1);
									if(_preloadMag in _getlist)then
									{
										clearMagazineCargoGlobal (_listGW select _n);
										if (({_x != _preloadMag} count _getlist) > 0)then
										{
											{if(_x != _preloadMag)then
									 		{
												(_listGW select _n) addMagazineCargoGlobal [_x, (_getlist_index select _forEachIndex)];
									 		};
											}foreach _getlist;
										};
									};
								};
							};
						};
						_x addSecondaryWeaponItem _preloadMag;
					};
				};
			};
		} forEach _unitsArray;
		false;
	};
};
*/



if(isClass (configFile >> "CfgPatches" >> "cba_main") && isClass (configFile >> "CfgPatches" >> "MRT_AccFncs"))exitWith{};

//�������������л�����ctrl+headlights(L),�龵:opticsMode(NUM:/)+ctrl;
KA_item_Weapon = {
if((currentWeapon player == primaryWeapon player)&&((primaryWeaponItems player) select _this) != "" )then
	{
	_value = (configfile >> "CfgWeapons" >> (primaryWeaponItems player) select _this >> "MRT_SwitchItemNextClass") call BIS_fnc_getCfgData;
		if (!(isNil "_value")) then
		{
		player removePrimaryWeaponItem _value;
		player addPrimaryWeaponItem _value;
		_Text = getText (configfile >> "CfgWeapons" >> _value >> "MRT_SwitchItemHintText");
		if((primaryWeaponItems player) select _this == _value)then{hintSilent format["%1",_Text ];};
		};
	};
	true;
};

KA_fnc_keyUnbind = {
	params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
	private _handled = false;
	if(!(player getVariable ["ACE_isUnconscious",false]) && {!(player getVariable ["AGM_isUnconscious",false])}) then
	{
		if (_dikCode in (actionKeys "headlights")&&_ctrlKey) then {1 call KA_item_Weapon;_handled = true;};
		if ((_dikCode == 181)&&_ctrlKey) then {2 call KA_item_Weapon;_handled = true;};
	};
	_handled;
};
[] spawn {
waitUntil {!isNull (findDisplay 46)};
_myEH =(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call KA_fnc_keyUnbind}];
};
