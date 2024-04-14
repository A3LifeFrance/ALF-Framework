params [
	["_unit",objNull,[objNull]],
	["_target",objNull,[objNull]]
];

if (isNull _unit || isNull _target) exitWith {};
if (_target getVariable ["CameraDiscrete", false]) exitWith {["ERREUR","Cette personne est déjà équipé d'une caméra discrète.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

_target setVariable ["CameraDiscrete", true];
["ALF_Camera_Discret",false] remoteExec ["life_fnc_handleItem",_unit];

private _cam = player getVariable ["All_Camera",[]];
_cam pushBack _target;
player setVariable ["All_Camera",_cam];

["Caméra","Installation de la caméra terminée.","success"] remoteExec ["ALF_fnc_doMsg",_unit];