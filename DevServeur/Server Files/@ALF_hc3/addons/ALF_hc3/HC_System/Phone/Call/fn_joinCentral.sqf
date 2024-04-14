/*
	File: fn_joinCentral.sqf
	Author: ALF Team
*/
params [
	["_caller",objNull,[objNull]],
	["_unit",objNull,[objNull]],
	["_callID",0,[0]],
	["_central","",[""]]
];
if(isNull _caller OR {isNull _unit} OR {_central isEqualTo ""}) exitWith {};

//L'appel a déjà été annulé.
if(_caller getVariable ["call_info",0] isEqualTo 0) exitWith {}; //Texte: Appel n'est plus actif.
if(count(_caller getVariable [format["central_%1_data",_central],[]]) isEqualTo 0) exitWith {}; //Texte: Appel n'est plus actif.

//L'appel est en cours, on fait rejoindre la fréquence.
if(_caller getVariable ["call_info",0] isEqualTo 2) exitWith {
	_unit setVariable ["call_info",2];
	_unit setVariable ["central_id",_callID];
	[_callID,true] remoteExec ["ALF_fnc_callInProgress",_unit];
};

//L'appel est en attente, on lance la communication.
if(_caller getVariable ["call_info",0] isEqualTo 1) exitWith {
	//On lance l'appel du joueur.
	_caller setVariable ["call_info",2];
	[_callID] remoteExec ["ALF_fnc_callInProgress",_caller];

	//On lance l'appel du Gendarme/Pompier.
	_unit setVariable ["call_info",2];
	_unit setVariable ["central_id",_callID];
	[_callID,true] remoteExec ["ALF_fnc_callInProgress",_unit];
};
