#include "\ALF_Client\script_macros.hpp"
/*
File: fn_updateCompteBancaire.sqf
Author: ALF Team
Description: Bank panel

*/
private["_display"];
_mode = _this select 0;

disableSerialization;

_display = findDisplay 22500;
_textelivret = _display displayCtrl 22502;
_textecash = _display displayCtrl 22503;
_textecb = _display displayCtrl 22516;
_textecbactive = "";

switch (_mode) do {
	case 0 : {
		if(life_livreta >= 0) then {
			_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livreta] call life_fnc_numberText];
		} else {
			_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#FF0000' size='1.4px'>%1€</t>",[life_livreta] call life_fnc_numberText];
		};
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
	};

	case 1 : {
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livretb] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
	};

	case 2 : {
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livretc] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
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
