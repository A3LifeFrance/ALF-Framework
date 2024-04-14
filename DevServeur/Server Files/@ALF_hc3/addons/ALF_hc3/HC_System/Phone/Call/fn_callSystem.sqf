/*
	File: fn_callSystem.sqf
	Author: ALF Team
	Input : ALF_Phone_Anonyme,ALF_Phone_Number,_numbercalling,player
	Call_info = 0 - reset / 1 - trycall / 2 - en appel
*/
params [
	["_Anonyme",false,[false]],
	["_playerNumber","",[""]],
	["_cibleNumber","",[""]],
	["_unit",objNull,[objNull]]
];

if(_playerNumber isEqualTo "" OR {_cibleNumber isEqualTo ""} OR {isNull _unit}) exitWith {};

[format["INSERT INTO tel_appel (anonyme, expediteur, destinataire, position) VALUES('%1','%2','%3','%4')",parseNumber(_Anonyme),_playerNumber,_cibleNumber,str(getPos _unit)],1] call HC_fnc_asyncCall;

//CENTRAL D'APPEL
if(_cibleNumber isEqualTo "17") exitWith {
	private _cops = playableUnits select {_x getVariable ["CopService",false]};
	if !(_cops isEqualTo []) then {
	if(_Anonyme) then {
			["Central de la Gendarmerie.","Un numéro anonyme tente de joindre la Gendarmerie. Merci de bien vouloir vous connecter au central."] remoteExec ["ALF_fnc_doCopCall",_cops];
		} else {
			["Central de la Gendarmerie.",format["Le numéro %1 tente de joindre la Gendarmerie. Merci de bien vouloir vous connecter au central.",_playerNumber]] remoteExec ["ALF_fnc_doCopCall",_cops];
		};
	};
	[_unit,_playerNumber,_Anonyme,_cibleNumber] spawn HC_fnc_centralSystem;
};
if(_cibleNumber isEqualTo "18") exitWith {
	private _meds = playableUnits select {_x getVariable ["MedService",false]};
	if !(_meds isEqualTo []) then {
		if(_Anonyme) then {
			["Central des Pompiers.","Un numéro anonyme tente de joindre les Pompiers. Merci de bien vouloir vous connecter au central."] remoteExec ["ALF_fnc_doMedCall",_meds];
		} else {
			["Central des Pompiers.",format["Le numéro %1 tente de joindre les Pompiers. Merci de bien vouloir vous connecter au central.",_playerNumber]] remoteExec ["ALF_fnc_doMedCall",_meds];
		};
	};
	[_unit,_playerNumber,_Anonyme,_cibleNumber] spawn HC_fnc_centralSystem;
};
if(_cibleNumber isEqualTo "124") exitWith {
	/*private _meds = playableUnits select {_x getVariable ["MedService",false]};
	if !(_meds isEqualTo []) then {
		if(_Anonyme) then {
			["Central depanneur.","Un numéro anonyme tente de joindre les Depanneurs. Merci de bien vouloir vous connecter au central."] remoteExec ["ALF_fnc_doMedCall",_meds];
		} else {
			["Central depanneur.",format["Le numéro %1 tente de joindre les Depanneurs. Merci de bien vouloir vous connecter au central.",_playerNumber]] remoteExec ["ALF_fnc_doMedCall",_meds];
		};
	};
	*/
	[_unit,_playerNumber,_Anonyme,_cibleNumber] spawn HC_fnc_centralSystem;
};

//On cherche le joueur qu'on appel
private _cible = playableUnits param [playableUnits findIf {(_x getVariable ["phoneNumber",""]) isEqualTo _cibleNumber}, objNull];
if(isNull _cible) exitWith {};

//On vérifie si la personne est capable de recevoir un appel.
if !(_cible getVariable ["call_info",0] isEqualTo 0) exitWith {}; //Plus tard: Exit sur un ajout dans l'historique.

//On parametre les variables
_unit setVariable ["call_info",2]; //Lancement de l'appel
_cible setVariable ["call_info",1]; //Recoit l'appel

//On envoit l'appel a la cible.
[_Anonyme,_playerNumber] remoteExec ["ALF_fnc_ringPlayer",_cible];

for "_i" from 0 to 1 step 0 do {
	if(isNull _unit OR {isNull _cible}) exitWith {};
	if(_unit getVariable ["call_info",0] isEqualTo 0) exitWith {};
	if(_cible getVariable ["call_info",0] isEqualTo 0) exitWith {};
	if((_cible getVariable ["call_info",0]) isEqualTo (_unit getVariable ["call_info",0])) exitWith {
		//On lance l'appel
		[_unit,_cible] spawn HC_fnc_inCallSystem;
	};
	uiSleep 0.01;
};
