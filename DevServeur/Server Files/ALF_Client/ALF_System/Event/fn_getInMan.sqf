/*
	File: fn_getInMan.sqf
	Author: NiiRoZz
*/
params [
	["_unit",objNull,[objNull]],
	["_pos","",[""]],
	["_veh",objNull,[objNull]],
	["_turret",[],[[]]]
];

if !(isNull ALF_PhoneObject) then {
	[] spawn {
		ALF_PhoneObject hideObject true;
		sleep 2;
		_pos = (vehicle player) worldToModel (player modelToWorldVisual ((player selectionPosition "RightHandMiddle1") vectorAdd [0.02,0.01,0.15]));
		detach ALF_PhoneObject;
		ALF_PhoneObject attachTo [(vehicle player),_pos];
		ALF_PhoneObject setVectorDirAndUp [[-0.21017,0.265195,-0.94101],[-0.949623,0.173499,0.260989]];
		ALF_PhoneObject hideObject false;
	};
};

if ({_x isKindOf "Man"} count (attachedObjects _unit) > 0) exitWith {
	_unit action ["Eject",_veh];
	["Porter", "Tu arrives a rentré dans un vehicule en portant un corps toi.", "danger"] spawn ALF_fnc_doMsg;
	_unit playMoveNow "AcinPercMstpSnonWnonDnon";
};

if (_veh isKindOf "Air" && {ALF_Prison}) exitWith {
	if(ALF_Count_Penit < 5) then {
		_unit action ["Eject",_veh];
		["INFO", "Il n'y a assez pas de gardien, tu ne peux t'évader par les airs.", "danger"] spawn ALF_fnc_doMsg;
	};
};

if (_pos isEqualTo "driver" && {({typeOf _x isEqualTo "ALF_Pistolet_Essence"} count (attachedObjects _veh)) > 0}) then {
	player action ["engineOff", vehicle player];
};
