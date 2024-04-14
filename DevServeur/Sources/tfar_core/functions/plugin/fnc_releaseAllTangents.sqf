#include "script_component.hpp"

/*
  Name: TFAR_fnc_releaseAllTangents

  Author: Dedmen
    Stops all outgoing radio transmissions

  Arguments:
    the player <OBJECT>

  Return Value:
    None

  Example:
    player call TFAR_fnc_releaseAllTangents;

  Public: Yes
*/
private _name = name _this;

if !(_this getVariable ["ALF_CurrentNameTFAR",""] isEqualTo "") then
{
    _name = _this getVariable ["ALF_CurrentNameTFAR",""];
};

"task_force_radio_pipe" callExtension (format ["RELEASE_ALL_TANGENTS	%1~", _name]);//Async call will always return "OK"
