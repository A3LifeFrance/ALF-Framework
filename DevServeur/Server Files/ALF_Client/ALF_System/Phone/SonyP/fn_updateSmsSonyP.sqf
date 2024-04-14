#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_updateSmsSony.sqf
	Author: ALF Team
*/
private _data = _this select 0;

disableSerialization;
waitUntil {sleep 0.1; !isNull (findDisplay 38999)};
private _playerList = ((findDisplay 38999) displayCtrl 39144);
private _replyButton = ((findDisplay 38999) displayCtrl 39146);
private _delButton = ((findDisplay 38999) displayCtrl 39147);
_replyButton ctrlShow false;

lbClear _playerList;
if(count _data < 1) then
{
	_playerList lbAdd format["Boite vide."];
	_playerList lbSetdata [(lbSize _playerList)-1, "Tu n'as pas de messages."];
	_delButton ctrlShow false;
}
else
{
	{
		private _anonyme = _x select 0;
		private _number = _x select 1;
		private _msg = _x select 2;
		private _id = _x select 3;
		private _name = "Inconnu";
		if (count life_contacts > 0) then {
			{
				if (_x select 1 isEqualTo _number) exitWith {
					_name = _x select 0;
				};
			} foreach life_contacts;
		};
		private _infoToPass = format["[""%1"",""%2"",""%3"",""%4"",""%5""]",_number,_name,_msg,_anonyme,_id];
		if(_anonyme isEqualTo 1) then {_name = "Anonyme"; _number = "**********";};
		_playerList lbAdd format["%1 - %2",_name,_number];
		_playerList lbSetdata [(lbSize _playerList)-1, _infoToPass];
	} foreach _data;
	_delButton ctrlShow true;
	_delButton buttonSetAction "[] spawn ALF_fnc_deleteSmsSonyP;";
};
((findDisplay 38999) displayCtrl 39144) lbSetCurSel 0;
