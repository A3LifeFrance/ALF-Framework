/*
	File : fn_drapMort.sqf
	Author: ALF Dev Team
*/
params [
	["_mode",0,[0]],
	["_player",objNull,[objNull]],
	["_obj",objNull,[objNull]]
];

if (_mode isEqualTo 0) then {
	if (isNull _player) exitWith {};
	if (!(_player getVariable ["ReviveMedic",false])) exitWith {};
	if (!("ALF_Drap_Cadavre_Item" in (magazines player))) exitWith {};

	["ALF_Drap_Cadavre_Item",false] spawn life_fnc_handleItem;

	//[_player] remoteExecCall ["hideObjectGlobal",2];

	private _obj = "ALF_Drap_Cadavre" createVehicle [0,0,1000];
	[_obj,false] remoteExecCall ["enableSimulationGlobal",2];

	_obj setPos (getPos _player);
	_obj setDir (getDir _player);

	[_player, _obj] remoteExec ["HC_fnc_drapMortCheck",HC3_Life];
	[1,objNull, _obj] remoteExec ["ALF_fnc_drapMort",_player];
} else {
	waitUntil{!(player getVariable ["ReviveMedic",false]) || (isNull _obj)};

	if (!(isNull _obj)) exitWith {
		deleteVehicle _obj;
	};
};