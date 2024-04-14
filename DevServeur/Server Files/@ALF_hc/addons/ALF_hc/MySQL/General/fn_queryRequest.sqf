#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_queryRequest.sqf
	Author: ALF TEAM

	This file is for Nanou's HeadlessClient.
*/
params [
	["_uid","",[""]],
	["_ownerID",objNull,[objNull]]
];
if(_uid isEqualTo "" || {isNull _ownerID}) exitWith {};

diag_log format ["uid tell : %1",_uid];

//QUERY TABLE JOUEUR             0       1     2      3         4             5         6           7       8     9      10       11        12          13     14    15    16     17     18       19          20         21       22      23     24          25            26       27      28       29        30        31           32           33       34           35                  36
private _q1 = format["SELECT playerid, name, cash, adminlevel, isPremium, coplevel, mediclevel, licenses, gear, stats, alive, position, firstspawn, playtime, adn, face, permis, axa, axabank, axacount, permis_time, duredon, publique, xp, axaprocount, bracelet, bracelettime, jail, jailtime, jailcoffre, penit, isValidate, groupeSanguin, medical, job_time, ordonnance_time, ordonnance_medoc FROM players WHERE playerid='%1'",_uid];
private _data = [_q1,2] call HC_fnc_asyncCall;
diag_log str(_data);
if(_data isEqualType "" OR {_data isEqualTo []}) exitWith {[] remoteExecCall ["SOCK_fnc_noBDD",_ownerID];};
diag_log "uid tell3";

//RESET LASTPLAYED
[format["UPDATE players SET lastPlayed='0' WHERE playerid='%1'",_uid],1] call HC_fnc_asyncCall;

//playerid 0

//name 1

//cash 2
_data set[2,([_data select 2] call HC_fnc_numberSafe)];

//adminlevel 3
_data set[3,([_data select 3] call HC_fnc_numberSafe)];

//premium 4
_data set[4,([_data select 4,1] call HC_fnc_bool)];

//coplevel 5
_data set[5,([_data select 5] call HC_fnc_numberSafe)];

//mediclevel 6
_data set[6,([_data select 6] call HC_fnc_numberSafe)];

//licenses 7
private _new = [(_data select 7)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_data set[7,_new];
//Convert tinyint to boolean
_old = _data select 7;
for "_i" from 0 to (count _old)-1 do {
	_conv = _old select _i;
	_old set[_i,[_conv select 0, ([_conv select 1,1] call HC_fnc_bool)]];
};
_data set[7,_old];

//gear 8
_new = [(_data select 8)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_data set[8,_new];

//stats 9
_new = [(_data select 9)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_data set[9,_new];
_ownerID setDamage ((_data select 9) select 3);

//alive 10
_data set[10,([_data select 10,1] call HC_fnc_bool)];

//position 11
_new = [(_data select 11)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_data set[11,_new];

//FirstJoin 12
_data set[12,([_data select 12,1] call HC_fnc_bool)];

//playtime 13
_data set[13,([_data select 13] call HC_fnc_numberSafe)];

//adn 14
_data set[14,([_data select 14] call HC_fnc_numberSafe)];

//face 15
_data set[15,([_data select 15] call HC_fnc_numberSafe)];

//permis 16
_data set[16,([_data select 16] call HC_fnc_numberSafe)];

//axa 17
_data set[17,([_data select 17] call HC_fnc_numberSafe)];

//axabank 18
_data set[18,([_data select 18] call HC_fnc_numberSafe)];

//axacount 19
_data set[19,([_data select 19] call HC_fnc_numberSafe)];

//permis time 20
_data set[20,([_data select 20] call HC_fnc_numberSafe)];

//duredon 21
_data set[21,([_data select 21] call HC_fnc_numberSafe)];

//publique 22
_data set[22,([_data select 22] call HC_fnc_numberSafe)];

//xp 23
_new = [(_data select 23)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_data set[23,_new];

//axaprocount 24
_data set[24,([_data select 24] call HC_fnc_numberSafe)];

//bracelet 25
_data set[25,([_data select 25,1] call HC_fnc_bool)];

//bracelettime 26
_data set[26,([_data select 26] call HC_fnc_numberSafe)];

//jail 27
_data set[27,([_data select 27,1] call HC_fnc_bool)];

//jailtime 28
_data set[28,([_data select 28] call HC_fnc_numberSafe)];

//jailcoffre 29
_data set[29,([_data select 29] call HC_fnc_numberSafe)];

//penit 30
_data set[30,([_data select 30] call HC_fnc_numberSafe)];

//isValidate 31
_data set[31,([_data select 31,1] call HC_fnc_bool)];

//groupeSanguin 32

//medical 33
_new = [(_data select 33)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_data set[33,_new];

//job time 34
_data set[34,([_data select 34] call HC_fnc_numberSafe)];

//Ordonnance 35  36
_data set[35,([_data select 35] call HC_fnc_numberSafe)];
_data set[36,([_data select 36] call HC_fnc_numberSafe)];

//phone 37
private _q2 = format ["SELECT number, contacts, time FROM phone WHERE playerid='%1'",_uid];
private _qr2 = [_q2,2] call HC_fnc_asyncCall;
diag_log str(_qr2);
if(count _qr2 > 0) then {
	_conv = [(_qr2 select 1)] call HC_fnc_mresToArray;
	if(_conv isEqualType "") then {_conv = call compile format["%1", _conv];};
	_data pushback ([([_qr2 select 2] call HC_fnc_numberSafe),(_qr2 select 0),_conv]);
	_ownerID setVariable ["phoneNumber",(_qr2 select 0),HC3_Life];
} else {
	_data pushback [];
};

//Bank 38
_q3 = format ["SELECT numacc, livreta, laactive, livretb, lbactive, livretc, lcactive, activecb FROM bank WHERE playerid='%1'",_uid];
_qr3 = [_q3,2] call HC_fnc_asyncCall;
diag_log str(_qr3);
if(count _qr3 > 0) then {
	_qr3 set[1,([_qr3 select 1] call HC_fnc_numberSafe)];
	_qr3 set[2,([_qr3 select 2,1] call HC_fnc_bool)];
	_qr3 set[3,([_qr3 select 3] call HC_fnc_numberSafe)];
	_qr3 set[4,([_qr3 select 4,1] call HC_fnc_bool)];
	_qr3 set[5,([_qr3 select 5] call HC_fnc_numberSafe)];
	_qr3 set[6,([_qr3 select 6,1] call HC_fnc_bool)];
	_qr3 set[7,([_qr3 select 7] call HC_fnc_numberSafe)];
	_data pushback _qr3;
} else {
	_data pushback [];
};

//Business 39
_q5 = format["SELECT secteur, siret, membres FROM business WHERE active='1' AND membres LIKE '%2%1%2'",_uid,"%"];
_qr5 = [_q5,2] call HC_fnc_asyncCall;
if (count _qr5 > 0) then {
	private _new = [(_qr5 select 2)] call HC_fnc_mresToArray;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_qr5 set[2,_new];
	_data pushback _qr5;
} else {
	_data pushback [];
};

//KeyTime 40
_data pushBack ([_uid] call HC_fnc_fetchKeys);

//Markers 41
_data pushBack ([_qr5,_data select 5,_data select 6] call HC_fnc_fetchMarkers);

diag_log "uid tell4";

if !(isNull _ownerID) then {
	[_data] remoteExec ["SOCK_fnc_requestReceived",_ownerID];
};
