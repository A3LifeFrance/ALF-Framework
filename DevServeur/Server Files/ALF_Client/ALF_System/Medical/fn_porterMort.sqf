/*
	File : fn_porterMort.sqf
	Author: ALF NiiRoZz
*/
params [
	["_mode",-1,[0]]
];

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	//On fait porter le mec
	case 0: {
		private _target = param [1, objNull, [objNull]];

		if (isNull _target) exitWith {};

		if (primaryWeapon player == "") then {
       		player addWeapon "ALF_FakePrimaryWeapon";
    	};
		player selectWeapon primaryWeapon player;

		[_target,false] remoteExecCall ["setUnconscious",_target];
		
		_target setVariable ["ReviveMedic",true,true];
		
		_target setVariable ["tf_unable_to_use_radio", true];

		_target setVariable ["ALF_estPorter",true];
		[_target,(getDir player + 180)] remoteExecCall ["setDir",_target];
		_target setPosASL (getPosASL player vectorAdd (vectorDir player));
		[player,"AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon"] remoteExecCall ["ALF_fnc_switchMove",-2];
		[_target,""] remoteExecCall ["ALF_fnc_switchMove",-2];
		[_target,"AinjPfalMstpSnonWrflDnon_carried_Up"] remoteExecCall ["playMoveNow",_target];

		uiSleep 15;

		player playMoveNow "AcinPercMstpSnonWnonDnon";
		[_target,"AinjPfalMstpSnonWnonDf_carried_dead"] remoteExecCall ["ALF_fnc_switchMove",-2];
		_target attachTo [player, [0.4,-0.1,-1.25], "LeftShoulder"];
		[_target,195] remoteExecCall ["setDir",_target];

		ALF_ActionID_Blesse = player addAction ["Deposer le blessé", "[1] spawn ALF_fnc_porterMort",nil,1.5,true,true,"","({_x getVariable [""ALF_estPorter"",false]} count (attachedObjects player)) > 0"];
	};

	//On fait porter le mec
	case 1: {
		if (({_x getVariable ["ALF_estPorter",false]} count (attachedObjects player)) isEqualTo 0 || {attachedObjects player isEqualTo []}) exitWith {player removeAction ALF_ActionID_Blesse; ALF_ActionID_Blesse = -1;};

		_target = objNull;
		{
			if (_x getVariable ["ALF_estPorter",false]) exitWith {
				_target = _x;
			};
		} forEach (attachedObjects player);

		if (isNull _target) exitWith {};

		detach _target;
		player removeAction ALF_ActionID_Blesse;
		ALF_ActionID_Blesse = -1;

		[player,""] remoteExecCall ["ALF_fnc_switchMove",-2];

		player removeWeaponGlobal "ALF_FakePrimaryWeapon";
		player selectWeapon primaryWeapon player;

		_target setPosASL ((getPosASL _target) vectorAdd [0, 0, 0.05]);
		_target setVariable ["ALF_estPorter",false];
		[2] remoteExec ["ALF_fnc_porterMort",_target];
	};

	//Test Fix uncouncious
	case 2: {
		uiSleep 0.125;
		player setUnconscious true;
	};
};