private ["_unit", "_fatigue"];

_unit = _this select 0;
_fatigue = _this select 1;

if !(local _unit) exitWith
{
  _this remoteExec ["KA_fnc_inflictFatigue", _unit ,false];
};

_unit setFatigue ((_fatigue + (getFatigue _unit)) min 1);
