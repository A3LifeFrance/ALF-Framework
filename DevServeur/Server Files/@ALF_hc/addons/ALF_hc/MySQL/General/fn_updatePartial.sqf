/*
	File: fn_updatePartial.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Takes partial data of a player and updates it, this is meant to be
	less network intensive towards data flowing through it for updates.
*/
private _uid = param [0,"",[""]];
private _mode = param [2,-1,[0]];

if(_uid isEqualTo "") exitWith {}; //Bad.
_query = "";

switch(_mode) do {
	case 0: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET cash='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 1: {
		private _value = param [1,[],[[]]];
		//Does something license related but I can't remember I only know it's important?
		for "_i" from 0 to count(_value)-1 do {
			_bool = [(_value select _i) select 1] call HC_fnc_bool;
			_value set[_i,[(_value select _i) select 0,_bool]];
		};
		_value = [_value] call HC_fnc_mresArray;
		_query = format["UPDATE players SET licenses='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 2: {
		private _value = param [1,[],[[]]];
		_value = [_value] call HC_fnc_mresArray;
		_query = format["UPDATE players SET gear='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 3: {
		private _value = param [1,false,[false]];
		_value = [_value] call HC_fnc_bool;
		private _value2 = param [3,[],[[]]];
		if !(count _value2 isEqualTo 3) then {
			_value2 = [0,0,0];
		};
		_value2 = [_value2] call HC_fnc_mresArray;
		_query = format["UPDATE players SET alive='%1', position='%2' WHERE playerid='%3'",_value,_value2,_uid];
	};

	case 4: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET penit='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 5: {
		private _array = param [1,[],[[]]];
		[_uid,_array,0] remoteExecCall ["HC_fnc_keyManagement",HC2_Life];
	};

	////////////////// Bank System + Hsbc ///////////////////
	case 6: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE bank SET livreta='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 7: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE bank SET livretb='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 8: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE bank SET livretc='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 9: {
		private _value1 = param [1,0,[0]];
		_value1 = [_value1] call HC_fnc_numberSafe;
		private _value2 = param [3,0,[0]];
		_value2 = [_value2] call HC_fnc_numberSafe;
		private _value3 = param [4,0,[0]];
		_value3 = [_value3] call HC_fnc_numberSafe;
		_query = format["UPDATE bank SET livreta='%1', livretb='%2', livretc='%3' WHERE playerid='%4'",_value1,_value2,_value3,_uid];
	};
	case 10: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE hsbc SET soldehsbc='%1' WHERE playerid='%2'",_value,_uid];
	};
	//////////////////////////////////////////////////
	case 11: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET coplevel='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 12: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET mediclevel='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 13: {
		private _value = param [1,[100,100,0,0],[[]]];
		_value = [_value] call HC_fnc_mresArray;
		_query = format["UPDATE players SET stats='%1' WHERE playerid='%2'",_value,_uid];
	};
	/////////////////// PERMIS //////////////////
	case 14: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET permis='%1' WHERE playerid='%2'",_value,_uid];
	};
	/////////////////// AXA ///////////////////
	case 15: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET axacount='%1' WHERE playerid='%2'",_value,_uid];
	};
	/////////////////// XP ///////////////////
	case 16: {
		private _value = param [1,[0,0,0,0,0],[[]]];
		_value = [_value] call HC_fnc_mresArray;
		_query = format["UPDATE players SET xp='%1' WHERE playerid='%2'",_value,_uid];
	};
	/////////////////// AXA ///////////////////
	case 17: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET axaprocount='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 18: {
		private _value = param [1,false,[false]];
		_value = [_value] call HC_fnc_bool;
		_query = format["UPDATE players SET alive='%1' WHERE playerid='%2'",_value,_uid];
	};
	/////////////////// PUBLIQUE ///////////////////
	case 19: {
		private _value = param [1,0,[0]];
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET publique='%1' WHERE playerid='%2'",_value,_uid];
	};
	/////////////////// GROUPE SANGUIN ///////////////////
	case 20: {
		private _value = param [1,"",[""]];
		_query = format["UPDATE players SET groupeSanguin='%1' WHERE playerid='%2'",_value,_uid];
	};
	/////////////////// ORDONNANCE ///////////////////
	case 21: {
		private _value = param [1,[],[[]]];
		_query = format["UPDATE players SET ordonnance_time='%1', ordonnance_medoc='%2' WHERE playerid='%3'",_value select 0, _value select 1,_uid];
	};
};

if(_query isEqualTo "") exitWith {};

[_query,1] call HC_fnc_asyncCall;
