#include "\ALF_Client\script_macros.hpp"
/*
File: fn_menuBank.sqf
Author: ALF Team
Description: Bank panel access to check accounts

*/

if !([player] call ALF_fnc_hasEnergy) exitWith {["Info", "Il n'y n'a pas d'électricité.", "danger"] spawn ALF_fnc_doMsg;};

private["_display"];
if(!dialog) then {
	createDialog "ALF_BankMenu_Dialog";
};
disableSerialization;

_display = findDisplay 21500;
_texte1 = _display displayCtrl 21501;
_livreta = _display displayCtrl 21502;
_livretb = _display displayCtrl 21503;
_livretc = _display displayCtrl 21504;
_piclivreta = _display displayCtrl 215021;
_piclivretb = _display displayCtrl 215031;
_piclivretc = _display displayCtrl 215041;
_achatlivreta = _display displayCtrl 21505;
_achatlivretb = _display displayCtrl 21506;
_achatlivretc = _display displayCtrl 21507;
_picachatlivreta = _display displayCtrl 215051;
_picachatlivretb = _display displayCtrl 215061;
_picachatlivretc = _display displayCtrl 215071;
_texte2 = _display displayCtrl 21508;
_name = _display displayCtrl 21509;
_name ctrlSetStructuredText parseText format["<t align='center' size='1.1px'>%1</t>",name player];
_nbcompte = 0;
_texte1 ctrlShow false;

if (life_laactive) then {
	_nbcompte = _nbcompte + 1;
	_livreta ctrlShow true;
	_piclivreta ctrlShow true;
	_livreta buttonSetAction "[0] spawn ALF_fnc_accessCompteBancaire;";
	_achatlivreta ctrlShow false;
	_picachatlivreta ctrlShow false;
	_texte1 ctrlShow true;
	_numberaccount = player getVariable "numberBankAccount";
	_texte1 ctrlSetStructuredText parseText format["Mon numéro de compte: %1",_numberaccount];
} else {
	_livreta ctrlShow false;
	_achatlivreta ctrlShow true;
	_piclivreta ctrlShow false;
	_picachatlivreta ctrlShow true;
	_achatlivreta buttonSetAction "[0] spawn ALF_fnc_achatCompteBancaire;";
};

if (life_lbactive) then {
	_nbcompte = _nbcompte + 1;
	_livretb ctrlShow true;
	_piclivretb ctrlShow true;
	_livretb buttonSetAction "[1] spawn ALF_fnc_accessCompteBancaire;";
	_achatlivretb ctrlShow false;
	_picachatlivretb ctrlShow false;
} else {
	_livretb ctrlShow false;
	_achatlivretb ctrlShow true;
	_piclivretb ctrlShow false;
	_picachatlivretb ctrlShow true;
	_achatlivretb buttonSetAction "[1] spawn ALF_fnc_achatCompteBancaire;";
};

if (life_lcactive) then {
	_nbcompte = _nbcompte + 1;
	_livretc ctrlShow true;
	_piclivretc ctrlShow true;
	_livretc buttonSetAction "[2] spawn ALF_fnc_accessCompteBancaire;";
	_achatlivretc ctrlShow false;
	_picachatlivretc ctrlShow false;
} else {
	_livretc ctrlShow false;
	_achatlivretc ctrlShow true;
	_piclivretc ctrlShow false;
	_picachatlivretc ctrlShow true;
	_achatlivretc buttonSetAction "[2] spawn ALF_fnc_achatCompteBancaire;";
};

if (!life_laactive && !life_lbactive && !life_lcactive) then {
	_texte2 ctrlSetStructuredText parseText "Vous n'avez pas de compte bancaire.";
} else {
	_texte2 ctrlSetStructuredText parseText format["Vous disposez de %1 compte(s) chez nous.",_nbcompte];
};
