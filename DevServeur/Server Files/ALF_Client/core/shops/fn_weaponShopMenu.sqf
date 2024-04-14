#include "\ALF_Client\script_macros.hpp"
/*
File: fn_weaponshopMenu.sqf
Author: Bryan "tonic" Boardwine

Description:
Something
*/
private _exit = false;
private _shopTitle = M_CONFIG(gettext, "weaponshops", (_this select 3), "name");
private _license = M_CONFIG(gettext, "weaponshops", (_this select 3), "license");

if (_shopTitle isEqualto "Pharmacie" && {
    ((alf_ordonnance select 0) isEqualto 0) || ((alf_ordonnance select 1) isEqualto 0)
}) exitwith {
    ["Pharmacien", "Il vous faut une ordonnance. Veuillez consulter un médecin", "danger"] spawn ALF_fnc_doMsg;
    _exit = true;
};
if !(_license isEqualto "") then {
    if !(LICENSE_VALUE(_license)) exitwith {
        ["inFO", "Tu n'as pas la licence pour acceder a ce magasin.", "danger"] spawn ALF_fnc_doMsg;
        _exit = true;
    };
};
if (_exit) exitwith {};

uiNamespace setVariable ["Weapon_Shop", (_this select 3)];

if (!(createdialog "life_weapon_shop")) exitwith {};
if (!isClass(missionConfigFile >> "weaponshops" >> (_this select 3))) exitwith {};
// Bad config entry.

disableSerialization;

ctrlsettext[38401, _shopTitle];

private _filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd localize "str_Shop_Weapon_Shopinv";
_filters lbAdd localize "str_Shop_Weapon_Yourinv";

_filters lbsetCurSel 0;