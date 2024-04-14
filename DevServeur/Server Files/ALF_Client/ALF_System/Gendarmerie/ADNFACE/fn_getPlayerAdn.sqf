#include "\ALF_Client\script_macros.hpp"
/*
File: fn_getPlayerAdn.sqf
Author: ALF Team
*/
private _c = _this select 0;
if(isNull _c) exitWith {};

private _a = ["Veux-tu récuperer l'ADN de cette personne?","ADN","OUI","NON"] call BIS_fnc_guiMessage;
if !(_a) exitWith {};

private _adn = (_c getVariable ["adnface",0]) select 0;
["ADN","Un gendarme est en train de récupérer ton ADN.","success"] remoteExec ["ALF_fnc_doMsg",_c];
hint format["La séquence ADN de cette personne est: %1",_adn];
