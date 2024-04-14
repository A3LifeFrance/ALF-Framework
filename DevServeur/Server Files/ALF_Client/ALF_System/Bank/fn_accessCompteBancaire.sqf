#include "\ALF_Client\script_macros.hpp"
/*
File: fn_accessCompteBancaire.sqf
Author: ALF Team
Description: Bank panel

*/
private["_display"];
_mode = _this select 0;

createDialog "ALF_BankAccess_Dialog";
disableSerialization;

_display = findDisplay 22500;
_textetype = _display displayCtrl 22501;
_textetype2 = _display displayCtrl 225011;
_numbercompte = _display displayCtrl 225011;
_textelivret = _display displayCtrl 22502;
_textecash = _display displayCtrl 22503;
_retirer = _display displayCtrl 22504;
_deposer = _display displayCtrl 22505;
_pictransferlocala = _display displayCtrl 225061;
_transferlocalab = _display displayCtrl 22506;
_transferlocalac = _display displayCtrl 22507;
_pictransferlocalb = _display displayCtrl 225081;
_transferlocalba = _display displayCtrl 22508;
_transferlocalbc = _display displayCtrl 22509;
_pictransferlocalc = _display displayCtrl 225101;
_transferlocalca = _display displayCtrl 22510;
_transferlocalcb = _display displayCtrl 22511;
_transferext = _display displayCtrl 22512;
_textecb = _display displayCtrl 22516;
_textecbactive = "";
_cbBtn = _display displayCtrl 22517;
_name = _display displayCtrl 22515;
_name ctrlSetStructuredText parseText format["<t align='center' size='1.1px'>%1</t>",name player];

_numberaccount = player getVariable "numberBankAccount";
_textetype2 ctrlSetStructuredText parseText format["Mon numéro de compte: %1",_numberaccount];

switch (_mode) do {
	case 0 : {
		_textetype ctrlSetStructuredText parseText "Panel de votre Livret A.";
		if(life_livreta >= 0) then {
			_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livreta] call life_fnc_numberText];
		} else {
			_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#FF0000' size='1.4px'>%1€</t>",[life_livreta] call life_fnc_numberText];
		};
			
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
		_retirer buttonSetAction "[0] call ALF_fnc_retirerCompteBancaire;";
		_deposer buttonSetAction "[0] call ALF_fnc_deposerCompteBancaire;";
		_transferlocalab buttonSetAction "[0] call ALF_fnc_transferCompteBancaire;";
		_transferlocalac buttonSetAction "[1] call ALF_fnc_transferCompteBancaire;";
		_pictransferlocalb ctrlShow false;
		_pictransferlocalc ctrlShow false;
		_transferlocalba ctrlShow false;
		_transferlocalbc ctrlShow false;
		_transferlocalca ctrlShow false;
		_transferlocalcb ctrlShow false;
		_transferext buttonSetAction "[0] call ALF_fnc_transferExtCompteBancaire;";
		_cbBtn buttonSetAction "[0] spawn ALF_fnc_cbParametre;";
	};

	case 1 : {
		_textetype ctrlSetStructuredText parseText "Panel de votre Livret B.";
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livretb] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
		_retirer buttonSetAction "[1] call ALF_fnc_retirerCompteBancaire;";
		_deposer buttonSetAction "[1] call ALF_fnc_deposerCompteBancaire;";
		_transferlocalba buttonSetAction "[2] call ALF_fnc_transferCompteBancaire;";
		_transferlocalbc buttonSetAction "[3] call ALF_fnc_transferCompteBancaire;";
		_pictransferlocala ctrlShow false;
		_pictransferlocalc ctrlShow false;
		_transferlocalab ctrlShow false;
		_transferlocalac ctrlShow false;
		_transferlocalca ctrlShow false;
		_transferlocalcb ctrlShow false;
		_transferext buttonSetAction "[1] call ALF_fnc_transferExtCompteBancaire;";
		_cbBtn buttonSetAction "[1] spawn ALF_fnc_cbParametre;";
	};

	case 2 : {
		_textetype ctrlSetStructuredText parseText "Panel de votre Livret C.";
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livretc] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
		_retirer buttonSetAction "[2] call ALF_fnc_retirerCompteBancaire;";
		_deposer buttonSetAction "[2] call ALF_fnc_deposerCompteBancaire;";
		_transferlocalca buttonSetAction "[4] call ALF_fnc_transferCompteBancaire;";
		_transferlocalcb buttonSetAction "[5] call ALF_fnc_transferCompteBancaire;";
		_pictransferlocala ctrlShow false;
		_pictransferlocalb ctrlShow false;
		_transferlocalba ctrlShow false;
		_transferlocalbc ctrlShow false;
		_transferlocalab ctrlShow false;
		_transferlocalac ctrlShow false;
		_transferext buttonSetAction "[2] call ALF_fnc_transferExtCompteBancaire;";
		_cbBtn buttonSetAction "[2] spawn ALF_fnc_cbParametre;";
	};
};

switch (life_activecb) do {
	case 0 : {
		_textecbactive = "Aucun";
	};
	case 1 : {
		_textecbactive = "Livret A";
	};
	case 2 : {
		_textecbactive = "Livret B";
	};
	case 3 : {
		_textecbactive = "Livret C";
	};
};

_textecb ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1px'>%1</t>",_textecbactive];
