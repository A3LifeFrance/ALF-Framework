#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_update2FipSony.sqf
	Author: ALF Team
*/
private["_texte1","_texte2"];
disableSerialization;
if(isNull (findDisplay 32999)) exitWith {};
private _motif = _this select 0;

_texte1 = ((findDisplay 32999) displayCtrl 33169);
_texte2 = ((findDisplay 32999) displayCtrl 33170);

if(_motif isEqualTo "") then {
	_texte1 ctrlSetStructuredText parseText format["<t color='#000000'>NON</t>"];
	_texte2 ctrlShow false;
} else {
	_texte1 ctrlSetStructuredText parseText format["<t color='#000000'>OUI</t>"];
	_texte2 ctrlShow true;
	_texte2 ctrlSetStructuredText parseText format["<t color='#000000'>%1</t>",_motif];
};
