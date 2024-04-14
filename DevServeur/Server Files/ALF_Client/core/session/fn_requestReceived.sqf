#include "\ALF_Client\script_macros.hpp"
/*
File: fn_requestreceived.sqf
Author: ALF Team
*/
if !(hasinterface) exitwith {};
life_session_tries = life_session_tries + 1;
if (life_session_completed) exitwith {};
if (life_session_tries > 3) exitwith {
    failMission "NoBDD";
};

private _data = _this select 0;
if(isnil "_data" || {
    count _data isEqualto 0
}) exitwith {
    failMission "NoBDD";
};

if !(name player isEqualto (_data select 1)) exitwith {
    cuttext[format["ton profil (%1) n'a pas le meme nom que ton personnage enregistré. Visa: %2.", name player, (_data select 1)], "BLACK FADED"];
    0 cutFadeOut 999999999; sleep 8; failMission "Badname";
};
if !(_data select 31) exitwith {
    failMission "BadVisa";
};

life_cash = parseNumber(_data select 2);

life_adminlevel = parseNumber(_data select 3);

life_donor = _data select 4;

life_coplevel = parseNumber(_data select 5);

life_medicLevel = parseNumber(_data select 6);

if(life_coplevel > 0 && {
    !license_cop
}) then {
    license_cop = true;
};
if(life_mediclevel > 0 && {
    !license_med
}) then {
    license_med = true;
};
if(life_coplevel isEqualto 0 && {
    license_cop
}) then {
    license_cop = false;
};
if(life_mediclevel isEqualto 0 && {
    license_med
}) then {
    license_med = false;
};

if (count (_data select 7) > 0) then {
    {
        SVAR_MNS [SEL(_x, 0), SEL(_x, 1)];
    } forEach (_data select 7);
};

[(_data select 8)] call life_fnc_loadGear;

life_hunger = (_data select 9) select 0;
life_thirst = (_data select 9) select 1;
if (((_data select 9) select 2) != 0) then {
    [(_data select 9) select 2] call ALF_fnc_handleAlcool;
};
alf_drug = (_data select 9) select 3;
// player setDamage ((_data select 9) select 3);

life_is_alive = _data select 10;

life_civ_position = _data select 11;

if(count(life_civ_position) != 3 or {
    life_civ_position distance (getmarkerPos "respawn_civilian") < 500
}) then {
    // ERREUR DE position ON REset LA position A L AEROPorT
    life_is_alive = true;
    life_civ_position = [5260.2, 7075.4, 0.002];
};

life_playerfirstjoinserver = _data select 12;

ALF_Playtime = parseNumber(_data select 13);

if(parseNumber(_data select 14) isEqualto 0 or {
    parseNumber(_data select 15) isEqualto 0
}) then {
    [player] remoteExec ["HC_fnc_createAdnface", HC_Life];
} else {
    player setVariable["adnface", [(_data select 14), (_data select 15)], true];
};

life_permis = parseNumber(_data select 16);

life_axa = parseNumber(_data select 17);

life_axabank = parseNumber(_data select 18);

life_axacount = parseNumber(_data select 19);

if ((parseNumber(_data select 20)) isEqualto 0) then {
    life_permis_time = false;
} else {
    life_permis_time = true;
};

life_duredon = parseNumber(_data select 21);

life_publique = parseNumber(_data select 22);

alf_xp_recolte = (_data select 23) select 0;
if (isnil 'alf_xp_recolte') then {
    alf_xp_recolte = 0;
};
alf_xp_minage = (_data select 23) select 1;
if (isnil 'alf_xp_minage') then {
    alf_xp_minage = 0;
};
alf_xp_peche = (_data select 23) select 2;
if (isnil 'alf_xp_peche') then {
    alf_xp_peche = 0;
};
alf_xp_illegal = (_data select 23) select 3;
if (isnil 'alf_xp_illegal') then {
    alf_xp_illegal = 0;
};
alf_niv_recolte = (_data select 23) select 4;
if (isnil 'alf_niv_recolte') then {
    alf_niv_recolte = 0;
};
alf_niv_minage = (_data select 23) select 5;
if (isnil 'alf_niv_minage') then {
    alf_niv_minage = 0;
};
if (alf_niv_minage isEqualto -1) then {
    alf_niv_minage = 0;
};
alf_niv_peche = (_data select 23) select 6;
if (isnil 'alf_niv_peche') then {
    alf_niv_peche = 0;
};
if (alf_niv_peche isEqualto -1) then {
    alf_niv_peche = 0;
};
alf_niv_illegal = (_data select 23) select 7;
if (isnil 'alf_niv_illegal') then {
    alf_niv_illegal = 0;
};
if (alf_niv_illegal isEqualto -1) then {
    alf_niv_illegal = 0;
};

life_axaprocount = parseNumber(_data select 24);

if (_data select 25) then {
    ALF_Bracelet = true;
    private _array = missionnamespace getVariable ["ALF_AllBracelets", []];
    _array pushBack player;
    missionnamespace setVariable ["ALF_AllBracelets", _array, true];
    ALF_timeBracelet = parseNumber(_data select 26) * 60;
    [] execFSM "\ALF_Client\core\fsm\bracelet.fsm";
};

if (_data select 27) then {
    player setVariable ["ALF_EnPrison", true, true];
    ALF_Prison = true;
    ALF_timePrison = (parseNumber(_data select 28)) * 60;
    ALF_Prison_Coffre = parseNumber(_data select 29);
};

life_penit = parseNumber(_data select 30);

// groupe Sanguin
ALF_groupeSanguin = _data select 32;
if (ALF_groupeSanguin isEqualto "") then {
    [] call ALF_fnc_generergroupeSanguin;
};

// Medical
alf_deseases = ((_data select 33) select 0);
if (isnil "alf_deseases") then {
    alf_deseases = [];
};
alf_medecine = ((_data select 33) select 1);
if (isnil "alf_medecine") then {
    alf_medecine = [];
};
alf_vaccins = ((_data select 33) select 2);
if (isnil "alf_vaccins") then {
    alf_vaccins = [];
};

// Jobtime 34
if ((parseNumber(_data select 34)) isEqualto 0) then {
    if (license_eboueur) then {
        license_eboueur = false;
        [1] call SOCK_fnc_updatePartial;
    };
};

// ordonnance 35 36
alf_ordonnance = [parseNumber(_data select 35), parseNumber(_data select 36)];

// Phone
if !(count (_data select 37) isEqualto 0) then {
    ALF_forfait = parseNumber((_data select 37) select 0);
    ALF_Phone_Number = (_data select 37) select 1;
    life_contacts = (_data select 37) select 2;
};

// Bank System
if !(count(_data select 38) isEqualto 0) then {
    player setVariable ["numberBankAccount", ((_data select 38) select 0)];
    life_livreta = parseNumber((_data select 38) select 1);
    life_laactive = (_data select 38) select 2;
    life_livretb = parseNumber((_data select 38) select 3);
    life_lbactive = (_data select 38) select 4;
    life_livretc = parseNumber((_data select 38) select 5);
    life_lcactive = (_data select 38) select 6;
    life_activecb = parseNumber((_data select 38) select 7);
};

if !(count(_data select 39) isEqualto 0) then {
    if (count(_data select 39) isEqualto 3) then {
        [0, (_data select 39) select 0, (_data select 39) select 1, (_data select 39) select 2] call ALF_fnc_initBusinessplayer;
    } else {
        [0, (_data select 39) select 0, (_data select 39) select 1, []] call ALF_fnc_initBusinessplayer;
    };
};

if !(count(_data select 40) isEqualto 0) then {
    [(_data select 40)] call ALF_fnc_initKeystime;
};

if !(count(_data select 41) isEqualto 0) then {
    {
        _marker = createMarkerlocal [(_x select 0), (_x select 2)];
        _marker setMarkertextLocal (_x select 1);
        _marker setMarkerDirLocal (_x select 3);
        _marker setMarkersizeLocal (_x select 4);
        _marker setMarkertypeLocal (_x select 5);
        _marker setMarkerShapeLocal (_x select 6);
        _marker setMarkerBrushLocal (_x select 7);
        _marker setMarkerColorLocal (_x select 8);
        _marker setMarkerAlphaLocal (_x select 9);
    } forEach (_data select 41);
};

life_session_completed = true;