/*
	File: fn_centralSystem.sqf
	Author: ALF Team
*/
params [
	["_unit",objNull,[objNull]],
	["_playerNumber","",[""]],
	["_Anonyme",false,[false]],
	["_cible","",[""]]
];
if(isNull _unit OR {_playerNumber isEqualTo ""}) exitWith {};
	
_unit setVariable ["call_info",1]; //En attente dans le central

private _callID = random[10000000,50000000,99999999]; //ID de l'appel (frequence TFAR)
_unit setVariable [format["central_%1_data",_cible],[_callID,_Anonyme,_playerNumber,_unit]]; //data central

private _attente = 0;
for "_i" from 0 to 1 step 0 do {
	if(isNull _unit) exitWith {};
	if(_unit getVariable ["call_info",0] isEqualTo 0) exitWith {}; //Il a annulé l'appel.
	if(_unit getVariable ["call_info",0] isEqualTo 1) then { //En attente.
		_attente = _attente + 0.025;
		_unit setVariable ["central_time",floor(_attente)]; //On set le temps d'attente avant prise en charge.
	};
	uiSleep 0.01;
};

//L'hote a annuler l'appel ou est déconnecté.
if(isNull _unit OR {_unit getVariable ["call_info",0] isEqualTo 0}) then {
	//On reset les variables liées au central d'appel.
	if !(isNull _unit) then {
		_unit setVariable [format["central_%1_data",_cible],[]];
		_unit setVariable ["central_time",0];
	};
	private _units = playableUnits select {_x getVariable ["central_id",0] isEqualTo _callID};
	if(count(_units) > 0) then {
		// On ferme à toutes les personnes qui sont sur l'appel.
		[] remoteExecCall ["ALF_fnc_endCall",_units];
	};
};
