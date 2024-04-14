#include "\ALF_Client\script_macros.hpp"
/*
Author: transfertScanner
*/
private _wc = _this select 0;

private _sc = nearestObject [position _wc,"Land_ALF_IRM"];
if(isNull _sc OR {isNil "_sc"}) exitWith {["INFO", "Il n'y a pas de Scanner a proximité.", "warning"] spawn ALF_fnc_doMsg;};
if((_sc distance _wc) > 5) exitWith {["INFO", "Il n'y a pas de Scanner a proximité.", "warning"] spawn ALF_fnc_doMsg;};
if(_sc getVariable ["wip",false]) exitWith {["INFO", "Le Scanner est déjà utilisé.", "warning"] spawn ALF_fnc_doMsg;};

{
	if(count (_x getVariable ["MedicalStats",[]]) > 0 && {alive _x}) exitWith {
		[_sc,player] remoteExec ["ALF_fnc_scannerSystem",_x];
	};
} forEach (crew _wc);
