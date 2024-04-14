/*
	File: fn_bieEteindre.sqf
	Author: ALF TEAM
*/
params [
	["_object",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if (isNull _object || {isNull _unit}) exitWith {};

if(!(_object getVariable ["broken",false])) exitWith {["BIE","Les réparations des compteurs est impossible pour le moment..","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(_object getVariable ["wip",false]) exitWith {["BIE","Les réparations des compteurs sont en cours..","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(!b_18 && !b_19) exitWith {["BIE","Vous n'avez pas les compétences requises.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

_object setVariable ["wip",true];

["BIE","Les réparations des compteurs sont en cours..","success"] remoteExec ["ALF_fnc_doMsg",_unit];

uiSleep 900;

_object setVariable ["wip",false];

_object animateSource ["damage_source",0,true];

[_object] call HC_fnc_actionLamps;