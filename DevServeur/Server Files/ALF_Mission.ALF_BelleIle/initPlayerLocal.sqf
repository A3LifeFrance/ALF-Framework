/*
	File: initPlayerLocal.sqf
	Author: ALF Team
*/
if(isServer) exitWith {};

//Headless Clients
if !(hasInterface) exitWith {
	private _name = getText(configFile >> "CfgName" >> "name");
	if(isNil "_name") exitWith {};

	if(_name isEqualTo "hc_1") then {
		[] spawn compile PreprocessFileLineNumbers "\ALF_hc\initHC.sqf";
	};
	if(_name isEqualTo "hc_2") then {
		[] spawn compile PreprocessFileLineNumbers "\ALF_hc2\initHC.sqf";
	};
	if(_name isEqualTo "hc_3") then {
		[] spawn compile PreprocessFileLineNumbers "\ALF_hc3\initHC.sqf";
	};
};

private _vm = getText(configFile >> "CfgPatches" >> "ALF_Client" >> "addonsversion");
if(isNil "_vm") exitWith {failMission "Addons"};
if !(_vm isEqualTo "16.00") exitWith {failMission "Addons"};

[] execVM "\ALF_Client\ALF_System\init.sqf";
