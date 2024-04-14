/*
	trainingFire
*/
if(life_medicLevel < 5) exitWith {["INFO","Tu n'as pas le grade pour demarrer un incendie d'entrainement.","warning"] spawn ALF_fnc_doMsg;};

private _h = nearestObjects [position player, ["Land_i_House_Big_01_V1_F"],50];
private _hs = selectRandom _h;

if(_hs getVariable ["trainingfire",false]) exitWith {["INFO","Un incendie d'entrainement est deja en cours.","warning"] spawn ALF_fnc_doMsg;};
_hs setVariable ["trainingfire",true,true];

private _f1 = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
_f1 setPosATL (_hs modelToWorld [-2,2,0.85]);
_f1 setVariable ["firealf",150,true];

private _f2 = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
_f2 setPosATL (_hs modelToWorld [-4.5,-2.9,0.88]);
_f2 setVariable ["firealf",150,true];

private _f3 = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
_f3 setPosATL (_hs modelToWorld [0,-5.5,-2.6]);
_f3 setVariable ["firealf",150,true];

private _f4 = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
_f4 setPosATL (_hs modelToWorld [2.6,4.8,-2.6]);
_f4 setVariable ["firealf",150,true];

["ENTRAINEMENT","L'EXERCICE INCENDIE EST COMMENCE !!"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
