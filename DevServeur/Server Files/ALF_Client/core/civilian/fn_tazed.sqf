#include "\ALF_Client\script_macros.hpp"
/*
    File: fn_tazed.sqf
    Author: Bryan "Tonic" Boardwine
*/
private ["_curWep","_curMags","_attach"];
params [
    ["_unit",objNull,[objNull]],
    ["_shooter",objNull,[objNull]]
];

if (isNull _unit || isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if (_shooter isKindOf "Man" && alive player) then {
    if (!life_istazed && !alf_ms_active) then {
        life_istazed = true;

        if(currentWeapon _shooter in ["ALF_X26"]) then {
            playSound3D ["ALF_Client2\sounds\tazer.ogg", player, false, getPosASL player, 3, 1, 35];
        };

        player setUnconscious true;
        disableUserInput true;
        sleep 40;
        player setUnconscious false;
        [player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        detach player;
        life_istazed = false;
        player allowDamage true;
        disableUserInput false;
    };
} else {
    _unit allowDamage true;
    life_istazed = false;
};