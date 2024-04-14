/*
    File: fn_actionRevive.sqf
    Author: ALF - Adam
*/
private _target = lbData[123490,lbCurSel (123490)];
_target = call compile format ["%1", _target];

if (isNil "_target" || isNull _target) exitWith {};
if !(_target getVariable ["ReviveMedic",false]) exitWith {hint "Cette personne n'est pas dans le coma."};

[player] remoteExec ["life_fnc_revived",_target];

ALF_coucou_uid_revive = getPlayerUID _target;
publicVariable "ALF_coucou_uid_revive";

uiSleep 1;

_vehicle = "V_ALF_Sprinter_C_Blue" createVehicle [10,10,0];
_vehicle addMPEventHandler ["MPKilled", {
    if (getPlayerUID player isEqualTo ALF_coucou_uid_revive) then {
        [] spawn ALF_fnc_jesusImAlive;
    };
}];

_vehicle setDamage 1;