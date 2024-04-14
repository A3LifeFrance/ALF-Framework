#include "\ALF_Client\script_macros.hpp"
/*
File: vendreLeboncoin.sqf
Author: ALF Nanou
*/
disableSerialization;
if((lbCurSel 24532) isEqualTo -1) exitWith {hint "Tu n'as rien selectionne."};

private _data = CONTROL_DATA(24532);
_data = call compile format["%1",_data];

private _txt1 = ctrlText 24539;
private _txt2 = ctrlText 24540;
private _txt3 = ctrlText 24542;
if(_txt1 isEqualTo "" OR {_txt2 isEqualTo ""} OR {_txt3 isEqualTo ""}) exitWith {};

private _exit = false;

private _c = toArray(_txt1);
private _l = count _c;
if (_l > 30) exitWith {hint "Tu ne peux ecrire que 30 caractères en titre."};
private _a = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]éàç€!?;:êè)(=+&<>*$ ");
{if(!(_x in _a)) exitWith {_exit = true;};} forEach _c;
if(_exit) exitWith {hint "Certains caractères sont incorrects dans le titre.";};

private _c = toArray(_txt2);
private _l = count _c;
if (_l > 400) exitWith {hint "Tu ne peux ecrire que 400 caractères en description."};
private _a = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]éàç€!?;:êè)(=+&<>*$ ");
{if(!(_x in _a)) exitWith {_exit = true;};} forEach _c;
if(_exit) exitWith {hint "Certains caractères sont incorrects dans la description.";};

private _c = toArray(_txt3);
private _l = count _c;
if (_l > 20) exitWith {hint "Tu ne peux ecrire que 20 caractères en nom."};
private _a = toArray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
{if(!(_x in _a)) exitWith {_exit = true;};} forEach _c;
if(_exit) exitWith {hint "Certains caractères sont incorrects dans le nom.";};

private _num = ctrlText 24541;
if !([_num] call TON_fnc_isnumber) exitWith {};
_num = parseNumber(_num);
if(_num < 0) exitWith {["INFO","Le prix est inférieur à 0€.","warning"] spawn ALF_fnc_doMsg;};

//private _cb = (findDisplay 24500) displayCtrl 24543;
//private _number = cbChecked _cb;
private _myNumber = 0;
//if(_number) then {
_myNumber = ALF_Phone_Number;
//};

private _action = ["Es-tu certain de vouloir vendre ce véhicule/maison. La vente n'a pas de retour possible.","Leboncoin","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

closeDialog 0;

private _uid = getPlayerUID player;

if(count _data isEqualTo 3) then {
	private _house = nearestObject[_data,"House"];

	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable ["uid",nil];

	private _index = life_vehicles find _house;

	if(_index != -1) then {
		life_vehicles deleteAt _index;
	};

	private _index = life_houses find (str(getPosATL _house));
	if(_index != -1) then {
		life_houses deleteAt _index;
	};

	_house setVariable ["ALF_PorteFermer",true,true];
	
	[_house,_txt1,_txt2,_txt3,_num,_myNumber,_uid,player] remoteExec ["HC_fnc_createHouseLeboncoin",HC2_Life];
} else {
	//if((_data select 1) in ["V_ALF_1400GTR","V_ALF_Scania_P"]) exitWith {["Leboncoin","Tu ne peux pas vendre ce type de véhicule.","warning"] spawn ALF_fnc_doMsg;};
	[_data select 0,_data select 1,_txt1,_txt2,_txt3,_num,_myNumber,_uid,player] remoteExec ["HC_fnc_createVehiculeLeboncoin",HC_Life];

	if((_data select 2) isEqualTo 1) then {
		life_axacount = life_axacount - 1;
		[15] call SOCK_fnc_updatePartial;
	};
	if((_data select 2) isEqualTo 2) then {
		life_axaprocount = life_axaprocount - 1;
		[17] call SOCK_fnc_updatePartial;
	};
};
