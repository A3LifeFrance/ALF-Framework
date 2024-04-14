#include "\ALF_Client\script_macros.hpp"
/*
File: fn_weaponshopBuySell.sqf
Author: Bryan "tonic" Boardwine

Description:
Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
if ((lbCurSel 38403) isEqualto -1) exitwith {
    ["inFO", "Il faut selectionner quelque chose.", "warning"] spawn ALF_fnc_doMsg;
};
if ((time - life_action_delay) < 0.3) exitwith {
    ["inFO", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;
};
life_action_delay = time;

private _price = lbValue[38403, (lbCurSel 38403)];
if (isnil "_price") then {
    _price = 0;
};
private _item = lbData[38403, (lbCurSel 38403)];
private _iteminfo = [_item] call life_fnc_fetchCfgDetails;

if(_item isEqualto "ALF_CB_Bronze" && {
    !life_laactive
}) exitwith {
    ["inFO", "Tu n'as pas de livret A.", "warning"] spawn ALF_fnc_doMsg;
};
if(_item isEqualto "ALF_CB_Bronze" && {
    life_lbactive
}) exitwith {
    ["inFO", "Tu ne peux pas acheter cette carte.", "warning"] spawn ALF_fnc_doMsg;
};
if(_item isEqualto "ALF_CB_Gold" && {
    !life_lbactive
}) exitwith {
    ["inFO", "Tu n'as pas de livret B.", "warning"] spawn ALF_fnc_doMsg;
};
if(_item isEqualto "ALF_CB_Gold" && {
    life_lcactive
}) exitwith {
    ["inFO", "Tu ne peux pas acheter cette carte.", "warning"] spawn ALF_fnc_doMsg;
};
if(_item isEqualto "ALF_CB_Black" && {
    !life_lcactive
}) exitwith {
    ["inFO", "Tu n'as pas de livret C.", "warning"] spawn ALF_fnc_doMsg;
};
if(_item isEqualto "ALF_3310" && {
    ALF_forfait isEqualto -1
}) exitwith {
    ["inFO", "Tu n'as pas d'abonnement'.", "warning"] spawn ALF_fnc_doMsg;
};
if(_item isEqualto "ALF_iPhone" && {
    ALF_forfait isEqualto -1
}) exitwith {
    ["inFO", "Tu n'as pas d'abonnement.", "warning"] spawn ALF_fnc_doMsg;
};

if(!(player canAdd _item) && {
    (uiNamespace getVariable["Weapon_Shop_Filter", 0]) != 1
}) exitwith {
    ["inFO", "Tu n'as pas la place pour acheter cet item.", "warning"] spawn ALF_fnc_doMsg;
};

private _exit = false;
if ((uiNamespace getVariable["Weapon_Shop_Filter", 0]) isEqualto 1) then {
    life_cash = life_cash + _price;
    
    [] spawn {
        life_query_time = time;
        if !(alf_moneysave) then {
            alf_moneysave = true;
            waitUntil {
                sleep 0.3;
                (time - life_query_time) >= 5
            };
            [0] call SOCK_fnc_updatePartial;
            alf_moneysave = false;
        };
    };
    
    [_item, false] spawn life_fnc_handleItem;
    ["inFO", format["Tu as vendu %1 pour %2€.", _iteminfo select 1, [_price] call life_fnc_numbertext], "success"] spawn ALF_fnc_doMsg;
    [nil, (uiNamespace getVariable["Weapon_Shop_Filter", 0])] call life_fnc_weaponshopFilter;
    // Update the menu.
} else {
    if (ALF_Prison) exitwith {
        if (_price > life_cash) then {
            ["inFO", "Tu n'as pas assez d'argent.", "success"] spawn ALF_fnc_doMsg;
        } else {
            [_item, true] spawn life_fnc_handleItem;
            if (_item in ["ALF_pioche", "ALF_Batte", "ALF_Faux", "ALF_Hache"]) then {
                player addMagazine "sharp_swing";
            };
            
            life_cash = life_cash - _price;
            
            [] spawn {
                life_query_time = time;
                if !(alf_moneysave) then {
                    alf_moneysave = true;
                    waitUntil {
                        sleep 0.3;
                        (time - life_query_time) >= 5
                    };
                    [0] call SOCK_fnc_updatePartial;
                    alf_moneysave = false;
                };
            };
            ["inFO", format["Tu as acheté %1 pour %2€.", _iteminfo select 1, [_price] call life_fnc_numbertext], "success"] spawn ALF_fnc_doMsg;
        };
    };
    if(_item in ["ALF_Medoc_rhume", "ALF_Medoc_toux"] && {
        (alf_ordonnance select 1) < 1
    }) exitwith {
        ["ERREUR", "ton ordonnance n'est plus valide. Tu as acheté trop de médicaments", "danger"] spawn ALF_fnc_doMsg;
    };
    
    if (_price > life_cash) then {
        private _handle = [_price, false] call ALF_fnc_handleCB;
        if (_handle) exitwith {
            _exit = true;
        };
        [_item, true] spawn life_fnc_handleItem;
        ["inFO", format["Tu as acheté %1 pour %2€.", _iteminfo select 1, [_price] call life_fnc_numbertext], "success"] spawn ALF_fnc_doMsg;
        
        if (_item in ["ALF_pioche", "ALF_Batte", "ALF_Faux", "ALF_Hache"]) then {
            player addMagazine "sharp_swing";
        };
        if (_item in ["ALF_Medoc_rhume", "ALF_Medoc_toux"]) then {
            alf_ordonnance = [alf_ordonnance select 0, (alf_ordonnance select 1) - 1];
        };
    } else {
        ["inFO", format["Tu as acheté %1 pour %2€.", _iteminfo select 1, [_price] call life_fnc_numbertext], "success"] spawn ALF_fnc_doMsg;
        life_cash = life_cash - _price;
        
        [] spawn {
            life_query_time = time;
            if !(alf_moneysave) then {
                alf_moneysave = true;
                waitUntil {
                    sleep 0.3;
                    (time - life_query_time) >= 5
                };
                [0] call SOCK_fnc_updatePartial;
                alf_moneysave = false;
            };
        };
        
        [_item, true] spawn life_fnc_handleItem;
        
        if (_item in ["ALF_pioche", "ALF_Batte", "ALF_Faux", "ALF_Hache"]) then {
            player addMagazine "sharp_swing";
        };
        if (_item in ["ALF_Medoc_rhume", "ALF_Medoc_toux"]) then {
            alf_ordonnance = [alf_ordonnance select 0, (alf_ordonnance select 1) - 1];
        };
    };
};