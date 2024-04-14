#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_update2FipSony.sqf
	Author: ALF Team
*/
disableSerialization;
private["_data"];
_data = _this select 0;
_data = call compile format["%1",_data];

_playerList = ((findDisplay 32999) displayCtrl 33176);

lbClear _playerList;
if(count _data < 1) then
{
	_playerList lbAdd format["Liste vide."];
	_playerList lbSetdata [(lbSize _playerList)-1, "La liste est vide."];
}
else
{
	{
		_name = _x select 0;
		_motif = _x select 1;

		_infoToPass = format["[""%1"",""%2""]",_motif,_name];
		_playerList lbAdd format["%1",_name];
		_playerList lbSetdata [(lbSize _playerList)-1,_infoToPass];
	} foreach _data;
};
((findDisplay 32999) displayCtrl 33176) lbSetCurSel 0;
