/*
	File: fn_testGroupeSanguin.sqf
	Author: ALF Team
*/
params [
	["_mode",-1,[0]],
	["_unit",objNull,[objNull]]
];
if(_mode isEqualTo -1 || {isNull _unit}) exitWith {};

switch (_mode) do {
	case 0: {
		life_action_inUse = true;
		private _cP = 0.05;
		for "_i" from 0 to 1 step 0 do {
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			sleep 0.3;
			_cP = _cP + 0.05;
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(life_interrupted) exitWith {};
			if(life_istazed) exitWith {};
		};
		life_action_inUse = false;
		if(!alive player) exitWith {};
		if(life_interrupted) exitWith {life_interrupted = false;["INFO", "Action annulée.", "danger"] spawn ALF_fnc_doMsg;};
		if(life_istazed) exitWith {};
		if(isNull _unit) exitWith {};
		player playActionNow "stop";
		player switchMove "";
		[1,player] remoteExecCall ["ALF_fnc_testGroupeSanguin",_unit];
	};
	
	case 1: {
		_message = ALF_groupeSanguin;
		if ((_message find "_") > -1) then {
			if ((count _message) > 2) then {
				_message = (_message select [0, 2]) + "-";
			} else {
				_message = (_message select [0, 1]) + "-";
			};
		};
		
		["INFO",format ["Groupe sanguin : %1",_message],"warning"] remoteExec ["ALF_fnc_doMsg",_unit];
	};
};
