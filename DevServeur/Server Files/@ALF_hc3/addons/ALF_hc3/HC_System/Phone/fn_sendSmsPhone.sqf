/*
	File: fn_sendSmsPhone.sqf
	Author: ALF Team
*/
private _anonyme = _this select 0;
private _numberExpediteur = _this select 1;
private _numberCible = _this select 2;
private _msg = _this select 3;
if(isNil "_anonyme" OR {isNil "_numberExpediteur"} OR {isNil "_numberCible"} OR {isNil "_msg"}) exitWith {};

private _length = count (toArray(_numberCible));
if !(_length isEqualTo 10) exitWith {};
private _queryresult = [format["SELECT number FROM phone WHERE number='%1'",_numberCible],2] call HC_fnc_asyncCall;
if((count _queryresult) isEqualTo 0) exitWith {};

private _msgbin = toArray _msg;
[format["INSERT INTO sms (anonyme, expediteur, destinataire, message) VALUES('%1','%2','%3','%4')",_anonyme,_numberExpediteur,_numberCible,_msgbin],1] call HC_fnc_asyncCall;

{
	private _numberunit = _x getVariable ["phoneNumber",""];
	if(_numberunit isEqualTo _numberCible && {!(isNull _x)}) exitWith {
		[_anonyme,_numberExpediteur,_msg] remoteExecCall ["ALF_fnc_receptionSmsPhone",_x];
	};
} forEach playableUnits;
