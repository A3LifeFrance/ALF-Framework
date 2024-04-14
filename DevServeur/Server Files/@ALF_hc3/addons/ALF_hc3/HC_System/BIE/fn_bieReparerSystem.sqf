/*
	File: fn_bieEteindre.sqf
	Author: ALF TEAM
*/
params [
	["_object",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if (isNull _object || {isNull _unit}) exitWith {};

if(!(_object getVariable ["broken",false])) exitWith {["BIE","La réparation du système est impossible pour le moment..","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(_object getVariable ["wip",false]) exitWith {["BIE","La réparation du système est en cours..","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

_object setVariable ["wip",true];

["BIE","La réparation du système est en cours..","success"] remoteExec ["ALF_fnc_doMsg",_unit];

uiSleep 300;

_object setVariable ["wip",false];

_object animateSource ["pc_source",0,true];

[_object] call HC_fnc_actionLamps;
