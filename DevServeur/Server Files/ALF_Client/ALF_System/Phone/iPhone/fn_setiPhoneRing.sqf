#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneRing.sqf
Author: ALF Team
Description:
Chargement de la sonnerie
*/
private "_ring";
switch (profileNamespace getVariable ["iPhone_Ring",0]) do {
	case 0 : {
		_ring = 1;
		playSound "iPhoneRing2";
	};
	case 1 : {
		_ring = 2;
		playSound "iPhoneRing3";
	};
	case 2 : {
		_ring = 0;
		playSound "iPhoneRing1";
	};
};

profileNamespace setVariable ["iPhone_Ring",_ring];
saveProfileNamespace;

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',5];
	[] call ALF_fnc_menuiPhone;
};