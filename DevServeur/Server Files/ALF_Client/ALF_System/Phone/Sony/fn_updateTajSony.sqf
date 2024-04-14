#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_update2FipSony.sqf
	Author: ALF Team
*/
private["_data","_texte1","_texte2"];
disableSerialization;
if(isNull (findDisplay 32999)) exitWith {};

_data = _this select 0;
_data = call compile format["%1",_data];

_playerList = ((findDisplay 32999) displayCtrl 33189);

lbClear _playerList;
if(count _data < 1) then
{
	_playerList lbAdd format["/"];
	_playerList lbSetdata [(lbSize _playerList)-1, "Casier vierge."];
}
else
{
	{
		_type = _x select 0;
		_lieu = _x select 1;
		_date = _x select 2;
		_infra = _x select 3;
		_strtype = "Délit";
		if(_type isEqualTo 1) then {_strtype = "Crime"};

		_infoToPass = format["[""%1"",""%2"",""%3""]",_lieu,_infra,_date];
		_playerList lbAdd format["%1 - %2",_date,_strtype];
		_playerList lbSetdata [(lbSize _playerList)-1,_infoToPass];
	} foreach _data;
};
((findDisplay 32999) displayCtrl 33189) lbSetCurSel 0;
