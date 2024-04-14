#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneBackGround.sqf
Author: ALF Team
Description:
Chargement du fond d'écran
*/
private["_display"];
disableSerialization;
_display = findDisplay 56400;
_bg1 = _display displayCtrl 564001;
_bg2 = _display displayCtrl 564002;
_bg3 = _display displayCtrl 564003;
_bg4 = _display displayCtrl 564004;
_bg5 = _display displayCtrl 564005;

switch (profileNamespace getVariable ["iPhone_Background",0]) do {
	case 0 : {
		_bg1 ctrlShow true;
		_bg2 ctrlShow false;
		_bg3 ctrlShow false;
		_bg4 ctrlShow false;
		_bg5 ctrlShow false;
	};
	case 1 : {
		_bg1 ctrlShow false;
		_bg2 ctrlShow true;
		_bg3 ctrlShow false;
		_bg4 ctrlShow false;
		_bg5 ctrlShow false;
	};
	case 2 : {
		_bg1 ctrlShow false;
		_bg2 ctrlShow false;
		_bg3 ctrlShow true;
		_bg4 ctrlShow false;
		_bg5 ctrlShow false;
	};
	case 3 : {
		_bg1 ctrlShow false;
		_bg2 ctrlShow false;
		_bg3 ctrlShow false;
		_bg4 ctrlShow true;
		_bg5 ctrlShow false;
	};
	case 4 : {
		_bg1 ctrlShow false;
		_bg2 ctrlShow false;
		_bg3 ctrlShow false;
		_bg4 ctrlShow false;
		_bg5 ctrlShow true;
	};
};
