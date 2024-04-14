/*
    File: fn_seatSwitchedMan.sqf
    Author: NiiRoZz
*/

if !(isNull ALF_PhoneObject) then {
	[] spawn {
		ALF_PhoneObject hideObject true;
		sleep 2;
		_pos = (vehicle player) worldToModel (player modelToWorldVisual ((player selectionPosition "RightHandMiddle1") vectorAdd [0.02,0.01,0.15]));
		detach ALF_PhoneObject;
		ALF_PhoneObject attachTo [(vehicle player),_pos];
		ALF_PhoneObject setVectorDirAndUp [[-0.21017,0.265195,-0.94101],[-0.949623,0.173499,0.260989]];
		ALF_PhoneObject hideObject false;
		[{player playActionNow "ALF_Tel";}] call CBA_fnc_execNextFrame;
	};
};

if (((assignedVehicleRole player) select 0) isEqualTo "Driver" && {({typeOf _x isEqualTo "ALF_Pistolet_Essence"} count (attachedObjects (vehicle player))) > 0}) then {
	player action ["engineOff", vehicle player];
};