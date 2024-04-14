#include "script_component.hpp"

/*
  Name: TFAR_fnc_hasVehicleRadio

  Author: NKey
    Checks for LW radio presence

  Arguments:
    0: Vehicle to check <OBJECT>

  Return Value:
    has a LR <BOOL>

  Example:
    _present = (vehicle player) call TFAR_fnc_hasVehicleRadio;

  Public: Yes
*/
params [["_vehicle", objNull, [objNull]]];

((typeOf _vehicle) find "Gendarmerie" > -1) || {_vehicle isKindOf "Air"}