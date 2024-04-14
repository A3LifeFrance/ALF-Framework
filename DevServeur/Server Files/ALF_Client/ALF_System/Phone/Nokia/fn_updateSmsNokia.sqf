#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_updateSmsNokia.sqf
	Author: ALF Team
	Description:

*/
private _data = _this select 0;

disableSerialization;
waitUntil {sleep 0.1; !isNull (findDisplay 20000)};
private _playerList = ((findDisplay 20000) displayCtrl 20021);
private _replyButton = ((findDisplay 20000) displayCtrl 20023);
_replyButton ctrlShow false;

lbClear _playerList;
if(count _data < 1) then
{
	_playerList lbAdd format["Boite vide."];
	_playerList lbSetdata [(lbSize _playerList)-1, "Tu n'as pas de messages."];
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
	private _delButton = ((findDisplay 20000) displayCtrl 20024);
	_delButton ctrlShow true;
	_delButton buttonSetAction "[] spawn ALF_fnc_deleteSmsNokia;";
};
((findDisplay 20000) displayCtrl 20021) lbSetCurSel 0;
