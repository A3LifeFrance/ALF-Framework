/*
	File: fn_menuMailBox.sqf
	Author: ALF Team
*/
params[
	["_house",objNull,[objNull]]
];
if(isNull _house) exitWith {};

life_pInact_curTarget = _house;

disableSerialization;
if(isNull (findDisplay 25500)) then {
	createDialog "ALF_MailBox_Dialog";
};

private _display = findDisplay 25500;
private _yes = _display displayCtrl 25501;
private _no = _display displayCtrl 25502;
private _maillist = _display displayCtrl 25503;
private _mailbtn = _display displayCtrl 25505;

private _courrier = _house getVariable ["courrier",[]];

if(count(_courrier) isEqualTo 0) then {
	_yes ctrlShow false;
	_no ctrlShow true;
	_mailbtn ctrlEnable false;

	lbClear _maillist;
	_maillist lbAdd "Vide.";
	_maillist lbSetdata [(lbSize _maillist)-1,"Vide."];
	((findDisplay 25500) displayCtrl 25503) lbSetCurSel 0;
} else {
	_yes ctrlShow true;
	_no ctrlShow false;

	private "_itemInfo";
	lbClear _maillist;
	{
		_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
		_maillist lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		_maillist lbSetdata [(lbSize _maillist)-1,format["%1",_x select 0]];
	} forEach _courrier;
	_mailbtn buttonSetAction "[life_pInact_curTarget] call ALF_fnc_recupererMailbox;";
};
