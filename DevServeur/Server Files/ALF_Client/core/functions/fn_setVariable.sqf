#include "\ALF_Client\script_macros.hpp"
/*
    File: fn_setVariable.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Saves the players gear for syncing to the database for persistence..
*/
params [
  "_space",
  ["_name","",[""]],
  "_value",
  ["_global",false,[false]]
];

if (_name isEqualTo "") exitWith {};

_space setVariable [_name,_value,_global];
