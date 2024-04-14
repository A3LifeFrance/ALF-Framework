#include "\ALF_Client\script_macros.hpp"
/*
File: fn_desactiverTourRadio.sqf
Author: ALF Team
*/
private _obj = _this select 0;
if(isNull _obj) exitWith {};
if (life_copLevel isEqualTo 0 && {!(b_15)}) exitWith {};
if !(_obj getVariable ["tourradio_speakers",false]) exitWith {["INFO","La tour de controle n'est pas activé.","warning"] spawn ALF_fnc_doMsg;};

//Speaker OFF
_obj setVariable ["tourradio_speakers",false,true];

["INFO","La tour de controle est desactivé.","warning"] spawn ALF_fnc_doMsg;
