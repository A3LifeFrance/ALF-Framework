#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneBackGround2.sqf
Author: ALF Team
Description:
Chargement du fond d'écran
*/
private "_background";
switch (profileNamespace getVariable ["iPhone_Background",0]) do {
	case 0 : {
		_background = 1;
	};
	case 1 : {
		_background = 2;
	};
	case 2 : {
		_background = 3;
	};
	case 3 : {
		_background = 4;
	};
	case 4 : {
		_background = 0;
	};
};

profileNamespace setVariable ["iPhone_Background",_background];
saveProfileNamespace;

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',5];
	[] call ALF_fnc_menuiPhone;
};