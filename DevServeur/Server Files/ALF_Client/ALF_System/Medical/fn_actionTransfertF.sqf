#include "\ALF_Client\script_macros.hpp"
/*
Author: ScannerSystem
*/
private _s = _this select 0;
if(isNull _s) exitWith {};
private _u = _this select 1;

player setUnconscious false;
player action ["Eject",vehicle player];
waitUntil {sleep 0.3; (vehicle player) isEqualTo player};
player action ["getInCargo",_s];
waitUntil {sleep 0.3; (vehicle player) != player};
player setUnconscious true;

if(isNull _u) exitWith {};
["INFO", "Le patient est transféré sur le fauteuil.", "success"] remoteExec ["ALF_fnc_doMsg",_u];
