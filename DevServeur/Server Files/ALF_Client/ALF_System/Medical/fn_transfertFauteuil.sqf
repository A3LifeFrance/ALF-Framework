#include "\ALF_Client\script_macros.hpp"
/*
Author: transfertFauteuil
*/
private _b = _this select 0;

private _f = nearestObject [position _b,"ALF_WheelChair_P"];
if(isNull _f OR {isNil "_f"}) exitWith {["INFO", "Il n'y a pas de fauteuil a proximité.", "warning"] spawn ALF_fnc_doMsg;};
if((_f distance _b) > 5) exitWith {["INFO", "Il n'y a pas de fauteuil a proximité.", "warning"] spawn ALF_fnc_doMsg;};
if(count (crew _f) > 0) exitWith {["INFO", "Le fauteuil est déjà utilisé.", "warning"] spawn ALF_fnc_doMsg;};

{
	[_f,player] remoteExec ["ALF_fnc_actionTransfertF",_x];
} forEach (crew _b);
