#include "script_component.hpp"

/*
  Name: TFAR_fnc_eyeDepth

  Author: Garth de Wet (L-H)
    returns the eyepos of a unit

  Arguments:
    unit <OBJECT>

  Return Value:
    Position ASLW <ARRAY>

  Example:
    player call TFAR_fnc_eyeDepth;

  Public: Yes
*/

private _return = -2;
if !(TFAR_currentUnit getVariable ["ReviveMedic",false]) then {
	_return = ((eyepos _this) select 2) + ((getPosASLW _this) select 2) - ((getPosASL _this) select 2);
};
_return