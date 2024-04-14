#include "script_component.hpp"

/*
  Name: TFAR_fnc_sendPlayerKilled

  Author: NKey
    Notifies the plugin that a unit has been killed.

  Arguments:
    killed unit <OBJECT>

  Return Value:
    None

  Example:
    player call TFAR_fnc_sendPlayerKilled;

  Public: Yes
*/

_this setRandomLip false;

_this call TFAR_fnc_releaseAllTangents;

private _name = name _this;

if !(_this getVariable ["ALF_CurrentNameTFAR",""] isEqualTo "") then
{
    _name = _this getVariable ["ALF_CurrentNameTFAR",""];
};

private _request = format["KILLED	%1~", _name];//Async call will always return "OK"
_result = "task_force_radio_pipe" callExtension _request;
