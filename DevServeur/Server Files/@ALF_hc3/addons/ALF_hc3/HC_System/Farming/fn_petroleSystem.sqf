/*
	petrolesystem
*/
params [
	["_obj",objNull,[objNull]],
	["_uid","",[""]],
	["_unit",objNull,[objNull]]
];
if(isNull _obj OR {isNull _unit}) exitWith {};

if !("ALF_Barile_P_E" in (magazines _unit)) exitWith {["INFO","Tu n'as pas de barile vide.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(_obj getVariable ["wip",false]) exitWith {["INFO","La machine est déjà en cours d'utilisation.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(_obj getVariable ["stuff",false]) exitWith {["INFO","La machine est pleine.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

["ALF_Barile_P_E",false] remoteExec ["life_fnc_handleItem",_unit];
_obj setVariable ["wip",_uid];
playSound3D ["ALF_Client2\sounds\drive.ogg",_obj];
_obj animateSource ["axe_2_source",1];
uiSleep random(5);

playSound3D ["ALF_Client2\sounds\wip.ogg",_obj];
_obj animateSource ["axe_3_source",1];
uiSleep 5;
_obj animateSource ["axe_3_source",0];
uiSleep 5;
_obj animateSource ["axe_3_source",1];
uiSleep 5;
_obj animateSource ["axe_3_source",0];
uiSleep 5;
_obj animateSource ["axe_3_source",1];
uiSleep 5;
_obj animateSource ["axe_2_source",0];
_obj animateSource ["axe_3_source",0];
uiSleep 5;

_obj setVariable ["stuff",true];
_obj setVariable ["wip",nil];

[1,4] remoteExec ["ALF_fnc_addXP",_unit];
