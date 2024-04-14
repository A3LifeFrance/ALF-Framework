#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_mobilierInvSearch.sqf
*/
params [
	["_container",objNull,[objNull]]
];
if(isNull _container) exitWith {};

private _mode = _this select 1;

/*
if(_container getVariable ["locked",false]) then {
	_container setVariable ["locked",false,true];
	hint "Le meuble est vérrouillé.";
} else {
	_container setVariable ["locked",true,true];
	hint "Le meuble est ouvert.";
};
*/

if(_mode isEqualTo 1) then {
	private _dice = random(1000);
	private _adn = player getVariable "adnface" select 0;
	if(_dice >= 200 && {_dice <= 900}) then {
		private _data = _container getVariable ["ilyadeladn",[]];
		if(count _data isEqualTo 0) then {
			_container setVariable["ilyadeladn",[_adn],true];
		} else {
			_data pushBack _adn;
			_container setVariable["ilyadeladn",_data,true];
		};
	};
};
