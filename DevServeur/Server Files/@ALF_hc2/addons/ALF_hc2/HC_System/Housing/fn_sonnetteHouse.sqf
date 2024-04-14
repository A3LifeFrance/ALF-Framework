/*
	File: fn_sonnetteHouse.sqf
*/
params [
	["_house",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if(isNull _house OR {isNull _unit}) exitWith {};

private _id = _house getVariable ["house_id",-1];
if(_id isEqualTo -1) exitWith {};

[format["UPDATE houses SET sonnette='1' WHERE id='%1'",_id],1] call HC_fnc_asyncCall;
_house setVariable ["sonnette",1];

["ALF_Sonnette4G",false] remoteExec ["life_fnc_handleItem",_unit];
["MAISON","La sonnette a bien été installée.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
