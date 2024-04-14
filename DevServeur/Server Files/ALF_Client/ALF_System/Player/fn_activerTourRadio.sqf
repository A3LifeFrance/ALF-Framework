#include "\ALF_Client\script_macros.hpp"
/*
File: fn_activerTourRadio.sqf
Author: ALF Team
*/
private _obj = _this select 0;
if(isNull _obj) exitWith {};
if (life_copLevel isEqualTo 0 && {!(b_15)}) exitWith {};
if(_obj getVariable ["tourradio_speakers",false]) exitWith {["INFO","La tour de controle est déjà activé.","warning"] spawn ALF_fnc_doMsg;};

//Speaker ON
_obj setVariable ["tourradio_speakers",true,true];

["INFO","La tour de controle est activé.","success"] spawn ALF_fnc_doMsg;
