/*
	File: fn_createAdnFace.sqf
*/
private["_unit"];
_unit = _this select 0;
if(isNil "_unit" OR isNull _unit) exitWith {};

private _uid = getPlayerUID _unit;
private _adn = random[10000000, 50000000, 99999999];
_adn = [_adn] call HC_fnc_numberSafe;
private _face = random[10000000, 50000000, 99999999];
_face = [_face] call HC_fnc_numberSafe;

private _count1 = ([format["SELECT COUNT(*) FROM players WHERE adn='%1'",_adn],2] call HC_fnc_asyncCall) select 0;
private _count2 = ([format["SELECT COUNT(*) FROM players WHERE face='%1'",_face],2] call HC_fnc_asyncCall) select 0;

if(_count1 isEqualTo 0 && {_count2 isEqualTo 0}) then {
	private _query = format["UPDATE players SET adn='%1', face='%2' WHERE playerid='%3'",_adn,_face,_uid];
	[_query,1] call HC_fnc_asyncCall;
	_unit setVariable ["adnface",[_adn,_face],true];
} else {
	[_unit] call HC_fnc_createAdnFace;
};
