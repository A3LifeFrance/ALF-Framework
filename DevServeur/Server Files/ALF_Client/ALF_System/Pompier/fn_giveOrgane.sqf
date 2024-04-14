/*
	takeOrgane
	Nanou
*/
private _p = _this select 0;
if(_p getVariable ["succes",false]) exitWith {["INFO", "L'organe a deja été donné.", "warning"] spawn ALF_fnc_doMsg;};
_p setVariable ["succes",true,true];
alf_organe = 0;
["INFO", "Tu viens de donner l'organe.", "warning"] spawn ALF_fnc_doMsg;
