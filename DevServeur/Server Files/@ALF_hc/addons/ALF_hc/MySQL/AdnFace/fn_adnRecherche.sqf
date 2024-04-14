#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_adnRecherche.sqf
	Author: ALF Nanou
*/
private _codeAdn = _this select 0;
private _unit = _this select 1;
private _query = format["SELECT text_info FROM gen_adn WHERE code_adn='%1'",_codeAdn];
private _queryResult = [_query,2] call HC_fnc_asyncCall;
if(count _queryResult > 0) then {
	_queryResult = toString(_queryResult select 0);
} else {
	_queryResult = "";
};
[_queryResult] remoteExec ["ALF_fnc_adnUpdate",_unit];
