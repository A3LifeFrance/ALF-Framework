/*
	File: fn_pickupAction.sqf
*/
params [
	["_obj",objNull,[objNull]],
	["_client",objNull,[objNull]],
	["_cash",false,[true]]
];

if(isNull _obj OR {isNull _client}) exitWith {};
if(!(_obj getVariable ["inUse",false])) exitWith {
	_obj setVariable ["inUse",true,true];
	if(_cash) then {
		_obj remoteExec ["life_fnc_pickupMoney",_client];
	};
};