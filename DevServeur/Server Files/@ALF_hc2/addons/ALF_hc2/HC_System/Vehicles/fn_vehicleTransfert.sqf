/*
  Name: HC_fnc_vehicleTransfert

  Author: ALF - Adam

  Arguments:
    0 : _vid <NUM>
	1 : _pid <STRING>
	2 : _ownerid <STRING>
	3 : _siret <STRING>

  Return Value:
    <none>

  Example:
    [_vid,_pid,_ownerid,_siret] call HC_fnc_vehicleTransfert
*/

params [
	["_vid",-1,[0]],
	["_pid","",[""]],
	["_ownerid","",[""]],
	["_siret","",[""]]
];

if(_vid isEqualTo -1 || {_pid isEqualTo ""} || {_ownerid isEqualTo ""} || {_siret isEqualTo ""}) exitWith {};

[format["UPDATE vehicles SET pid='%1', type='%2' WHERE pid='%3' AND id='%4'",_ownerid,_siret,_pid,_vid],1] call HC_fnc_asyncCall;
[format["DELETE FROM keysTime WHERE mode='0' AND idobj='%1'",_vid],1] call HC_fnc_asyncCall;