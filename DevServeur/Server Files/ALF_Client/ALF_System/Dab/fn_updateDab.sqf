#include "\ALF_Client\script_macros.hpp"
/*
File: fn_updateDab.sqf
Author: ALF Team
*/
disableSerialization;
private _display = findDisplay 10520;
private _textelivret = _display displayCtrl 10524;
private _textecash = _display displayCtrl 10525;

switch (life_activecb) do {
	case 1 : {
		if(life_livreta >= 0) then {
			_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.2px'>%1€</t>",[life_livreta] call life_fnc_numberText];
		} else {
			_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#FF0000' size='1.2px'>%1€</t>",[life_livreta] call life_fnc_numberText];
		};
		
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.2px'>%1€</t>",[life_cash] call life_fnc_numberText];
	};

	case 2 : {
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.2px'>%1€</t>",[life_livretb] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.2px'>%1€</t>",[life_cash] call life_fnc_numberText];
	};

	case 3 : {
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.2px'>%1€</t>",[life_livretc] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.2px'>%1€</t>",[life_cash] call life_fnc_numberText];
	};
};
