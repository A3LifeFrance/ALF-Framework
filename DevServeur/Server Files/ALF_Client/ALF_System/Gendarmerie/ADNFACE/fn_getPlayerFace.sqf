#include "\ALF_Client\script_macros.hpp"
/*
File: fn_getPlayerFace.sqf
Author: ALF Team
*/
private _c = _this select 0;
if(isNull _c) exitWith {};

private _a = ["Veux-tu récuperer le code faciès de cette personne?","Faciès","OUI","NON"] call BIS_fnc_guiMessage;
if !(_a) exitWith {};

private _adn = (_c getVariable ["adnface",0]) select 1;
["ADN","Un gendarme est en train de récupérer ton code faciès.","success"] remoteExec ["ALF_fnc_doMsg",_c];
hint format["Le code faciès de cette personne est: %1",_adn];
