#include "\ALF_Client\script_macros.hpp"
/*
File: fn_menuPlaque.sqf
Author: ALF Team
Description:

*/
private["_display"];
if(!dialog) then {
	createDialog "ALF_GPlaque_Dialog";
};
disableSerialization;
_display = findDisplay 30560;
_menu1 = _display displayCtrl 30561;
_menu2 = _display displayCtrl 30562;
_menu3 = _display displayCtrl 30563;

_PEdite1 = _display displayCtrl 30590;
_PEdite2 = _display displayCtrl 30591;
_PEdite3 = _display displayCtrl 30592;
_PEdite4 = _display displayCtrl 30593;
_PEdite5 = _display displayCtrl 30594;
_PEdite6 = _display displayCtrl 30595;
_PEdite7 = _display displayCtrl 30596;

_Texte1 = _display displayCtrl 30567;
_Texte2 = _display displayCtrl 30568;
_Texte3 = _display displayCtrl 30569;
_Texte4 = _display displayCtrl 30570;

_Btn1 = _display displayCtrl 30571;

_Load0 = _display displayCtrl 30580;
_Load1 = _display displayCtrl 30581;
_Load2 = _display displayCtrl 30582;
_Load3 = _display displayCtrl 30583;
_Load4 = _display displayCtrl 30584;
_Load5 = _display displayCtrl 30585;
_Load6 = _display displayCtrl 30586;
_Load7 = _display displayCtrl 30587;
_Load8 = _display displayCtrl 30588;

_menu = uiNamespace getVariable "gplaquemenu";
switch (_menu) do {
	case 0 : {
		_menu1 ctrlShow true;
		_menu2 ctrlShow false;
		_menu3 ctrlShow false;
		_PEdite1 ctrlShow true;
		_PEdite2 ctrlShow true;
		_PEdite3 ctrlShow true;
		_PEdite4 ctrlShow true;
		_PEdite5 ctrlShow true;
		_PEdite6 ctrlShow true;
		_PEdite7 ctrlShow true;
		_Texte1 ctrlShow false;
		_Texte2 ctrlShow false;
		_Texte3 ctrlShow false;
		_Texte4 ctrlShow false;
		_Btn1 ctrlShow true;
		_Load0 ctrlShow false;
		_Load1 ctrlShow false;
		_Load2 ctrlShow false;
		_Load3 ctrlShow false;
		_Load4 ctrlShow false;
		_Load5 ctrlShow false;
		_Load6 ctrlShow false;
		_Load7 ctrlShow false;
		_Load8 ctrlShow false;

		_Btn1 buttonSetAction "[] spawn ALF_fnc_recherchePlaque;";
	};
	case 1 : {
		_menu1 ctrlShow false;
		_menu2 ctrlShow false;
		_menu3 ctrlShow true;
		_PEdite1 ctrlShow false;
		_PEdite2 ctrlShow false;
		_PEdite3 ctrlShow false;
		_PEdite4 ctrlShow false;
		_PEdite5 ctrlShow false;
		_PEdite6 ctrlShow false;
		_PEdite7 ctrlShow false;
		_Texte1 ctrlShow false;
		_Texte2 ctrlShow false;
		_Texte3 ctrlShow false;
		_Texte4 ctrlShow false;
		_Btn1 ctrlShow false;
		_Load0 ctrlShow false;
		_Load1 ctrlShow false;
		_Load2 ctrlShow false;
		_Load3 ctrlShow false;
		_Load4 ctrlShow false;
		_Load5 ctrlShow false;
		_Load6 ctrlShow false;
		_Load7 ctrlShow false;
		_Load8 ctrlShow false;
	};
	case 2 : {
		_menu1 ctrlShow false;
		_menu2 ctrlShow true;
		_menu3 ctrlShow false;
		_PEdite1 ctrlShow false;
		_PEdite2 ctrlShow false;
		_PEdite3 ctrlShow false;
		_PEdite4 ctrlShow false;
		_PEdite5 ctrlShow false;
		_PEdite6 ctrlShow false;
		_PEdite7 ctrlShow false;
		_Texte1 ctrlShow true;
		_Texte2 ctrlShow true;
		_Texte3 ctrlShow true;
		_Texte4 ctrlShow true;
		_Btn1 ctrlShow true;
		_Load0 ctrlShow false;
		_Load1 ctrlShow false;
		_Load2 ctrlShow false;
		_Load3 ctrlShow false;
		_Load4 ctrlShow false;
		_Load5 ctrlShow false;
		_Load6 ctrlShow false;
		_Load7 ctrlShow false;
		_Load8 ctrlShow false;

		_Btn1 buttonSetAction "uiNamespace setVariable ['gplaquemenu',0];	[] call ALF_fnc_menuPlaque;";
	};
};
