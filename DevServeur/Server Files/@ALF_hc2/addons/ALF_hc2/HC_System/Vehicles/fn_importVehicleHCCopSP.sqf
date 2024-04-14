params [
	["_vid",-1,[0]],
	["_unit",objNull,[objNull]],
	["_garage",0,[0]],
	["_type",-1,[-1]]
];

if (_vid isEqualTo -1) exitWith {};

private _query = format["UPDATE vehicles_cop SET id_garage='%2' WHERE id='%1'",_vid,_garage];
if (_type isEqualTo -2) then {
	_query = format["UPDATE vehicles_med SET id_garage='%2' WHERE id='%1'",_vid,_garage];
};
[_query,1] call HC_fnc_asyncCall;

["INFO","Votre véhicule a été importé dans ce garage.","success"] remoteExec ["ALF_fnc_doMsg",_unit];