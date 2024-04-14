#include "\ALF_Client\script_macros.hpp"
/*
File: fn_adnUpdate.sqf
Author: ALF Team
*/
disableSerialization;
if(isNull (findDisplay 12500)) exitWith {};
private _texte = _this select 0;
if(_texte isEqualTo "") then {_texte = "Aucun résultat."};
private _text = (findDisplay 12500) displayCtrl 12502;
_text ctrlSetStructuredText parseText format["<t color='#000000'>%1</t>",_texte];
