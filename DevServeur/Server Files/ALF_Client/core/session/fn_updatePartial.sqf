#include "\ALF_Client\script_macros.hpp"
/*
File: fn_updatePartial.sqf
Author: Bryan "tonic" Boardwine

Description:
Sends specific information to the server to update on the player,
meant to keep the network traffic down with large sums of data flowing
through remoteExec
*/
private _mode = param [0, 0, [0]];
private _packet = [getplayerUID player, nil, _mode];
private _array = [];
private _exit = false;

switch(_mode) do {
    case 0: {
        _packet set[1, life_cash];
    };
    
    case 1: {
        {
            _varname = LICENSE_VARname(configname _x);
            _array pushBack [_varname, LICENSE_VALUE(configname _x)];
        } forEach ("true" configClasses (missionConfigFile >> "Licenses"));
        _packet set[1, _array];
    };
    
    case 2: {
        _packet set[1, ([] call life_fnc_saveGear)];
    };
    
    case 3: {
        _packet set[1, life_is_alive];
        life_civ_position = getPosATL player;
        _packet set[3, life_civ_position];
    };
    case 4: {
        _packet set[1, life_penit];
    };
    case 6: {
        _packet set[1, life_livreta];
    };
    case 7: {
        _packet set[1, life_livretb];
    };
    case 8: {
        _packet set[1, life_livretc];
    };
    case 9: {
        _packet set[1, life_livreta];
        _packet set[3, life_livretb];
        _packet set[4, life_livretc];
    };
    case 10: {
        _packet set[1, life_hsbc];
    };
    case 11: {
        _packet set[1, life_copLevel];
    };
    case 12: {
        _packet set[1, life_medicLevel];
    };
    case 13: {
        _packet set[1, [life_hunger, life_thirst, life_drunk, (damage player), alf_drug]];
    };
    case 14: {
        _packet set[1, life_permis];
    };
    case 15: {
        _packet set[1, life_axacount];
    };
    case 16: {
        _packet set[1, [alf_xp_recolte, alf_xp_minage, alf_xp_peche, alf_xp_illegal, alf_niv_recolte, alf_niv_minage, alf_niv_peche, alf_niv_illegal, alf_contrats]];
        
        if ((str (_packet select 1)) find "any" > -1) then {
            _exit = true;
        };
    };
    case 17: {
        _packet set[1, life_axaprocount];
    };
    case 18: {
        _packet set[1, life_is_alive];
    };
    case 19: {
        _packet set[1, life_publique];
    };
    case 20: {
        _packet set[1, ALF_groupeSanguin];
    };
    case 21: {
        _packet set[1, alf_ordonnance];
    };
};

/*if (_exit) exitwith {
    "XPBug" cuttext ["Nous avons detecté un bug sur la sauvegarde de votre xp, pour éviter de tout perdre. Veuillez déco reco.", "BLACK FADED"];
};
*/

_packet remoteExecCall ["HC_fnc_updatePartial", HC_Life];