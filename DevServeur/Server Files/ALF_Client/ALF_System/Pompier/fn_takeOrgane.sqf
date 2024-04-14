/*
	takeOrgane
	Nanou
*/
private _p = _this select 0;
private _m = _this select 3;
if !(_p getVariable ["active",false]) exitWith {["INFO", "Il n'y a pas d'organe disponible.", "warning"] spawn ALF_fnc_doMsg;};
_p setVariable ["active",false,true];

switch (_m) do {
	case 0: {["INFO", "Tu viens de récupérer l'organe, tu dois le transporter au plus vite à Sauzon.", "warning"] spawn ALF_fnc_doMsg; alf_organe = 1;};
	case 1: {["INFO", "Tu viens de récupérer l'organe, tu dois le transporter au plus vite à Le Palais.", "warning"] spawn ALF_fnc_doMsg; alf_organe = 2;};
};
