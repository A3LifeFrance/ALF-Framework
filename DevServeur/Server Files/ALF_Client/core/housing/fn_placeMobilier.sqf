/*
    File: fn_placeMobilier.sqf
    Author: ALF Team
*/
params [
    ["_mobilier",objNull,[objNull]],
    ["_isFloating",true,[true]]
];
if(isNull _mobilier) exitWith {hint "#PLMO EXIT1";};

private _uid = getPlayerUID player;
private _house = life_mobilier_activeHouse;
private _message = 0;
private _isPlaced = false;

if !(isNull _house) then {
    _message = 1;
    private _check = [player] call life_fnc_PlayerInBuilding;
    if ((_check select 1) && {([_mobilier,_check select 0] call life_fnc_MobilierInBuilding)}) then {
        _isPlaced = true;
        [_uid,_mobilier,_house,life_mobilier_activeName,life_mobilier_activePos,life_mobilier_activeDir,life_mobilier_activeMun] remoteExec ["HC_fnc_addMobilier",HC2_Life];
    };
};
if(_isPlaced) exitWith {life_mobilier_activeMun = ""; life_mobilier_activeHouse = objNull;};

[life_mobilier_activeMun,true] spawn life_fnc_handleItem;
life_mobilier_activeMun = "";
life_mobilier_activeHouse = objNull;

deleteVehicle _mobilier;

if (_message isEqualTo 0) exitWith {
    hint "Tu n'es pas dans une maison. #PLMO1";
};
if (_message isEqualTo 1) exitWith {
    hint "Tu n'es pas dans une maison. #PLMO2";
};
