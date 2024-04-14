/*
	File: fn_priseService.sqf
	ALF NiiRoZz
*/
params [
	["_mode",-1,[0]]
];
if (_mode isEqualTo -1) exitWith {};

if (_mode isEqualTo 0) then {
	private _units = playableUnits select {_x getVariable ["CopService",false]};
	missionNamespace setVariable ["ALF_AllGendarmes",_units,(_units apply {_x getVariable ["ALF_ownerID",HC3_Life]})];
	if (isRemoteExecuted) then {
		{
			_x setVariable ["SonyFreq",(_x getVariable ["SonyFreq",0]),(remoteExecutedOwner)];
			_x setVariable ["SonyFreqAdd",(_x getVariable ["SonyFreqAdd",0]),(remoteExecutedOwner)];
		} forEach _units;
	};
} else {
	private _units = playableUnits select {_x getVariable ["MedService",false]};
	missionNamespace setVariable ["ALF_AllMedics",_units,(_units apply {_x getVariable ["ALF_ownerID",HC3_Life]})];
	if (isRemoteExecuted) then {
		{
			_x setVariable ["SonyFreq",(_x getVariable ["SonyFreq",0]),(remoteExecutedOwner)];
			_x setVariable ["SonyFreqAdd",(_x getVariable ["SonyFreqAdd",0]),(remoteExecutedOwner)];
		} forEach _units;
	};
};