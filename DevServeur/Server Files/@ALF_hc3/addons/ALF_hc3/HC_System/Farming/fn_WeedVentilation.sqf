/*
	This file is for Nanou's HeadlessClient.
*/
params [
	["_object",objNull,[objNull]]
];
if (isNull _object) exitWith {};

private _active = _object getVariable ["ventilation",false];
if(_active) then {
	_object setVariable ["ventilation",false];
} else {
	_object setVariable ["ventilation",true];
	private _first = false;
	for "_i" from 0 to 1 step 0 do {
		_active = _object getVariable ["ventilation",false];
		if(!_active) exitWith {};
		if(!_first) then {
			playSound3D ["ALF_Client2\sounds\ventil1.ogg",_object];
			_first = true;
		} else {
			playSound3D ["ALF_Client2\sounds\ventil2.ogg",_object];
		};
		uiSleep 12;
	};
};	
