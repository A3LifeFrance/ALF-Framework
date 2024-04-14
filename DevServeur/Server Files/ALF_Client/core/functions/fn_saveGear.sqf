/*
    File: fn_saveGear.sqf
    Author: ALF TEAM
*/
private _return = getUnitLoadout player;
private _item = ((_return select 9) select 2);

if (_item call TFAR_fnc_isRadio) then {
    private _array = (_return select 9);
    _array set [2,((_item splitString "_") select 0) + "_" + ((_item splitString "_") select 1)];
    _return set [9,_array];
};

_return