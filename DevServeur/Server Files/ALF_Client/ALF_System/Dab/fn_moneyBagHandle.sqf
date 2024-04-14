/*
	File: fn_moneyBagHandle.sqf
	Author: ALF Dev Team
*/

params [
	["_obj",objNull,[objNull]]
];

if (!(isNull _obj) && !(isNull(attachedTo _obj))) exitWith {
	["ERREUR", "Quelqu'un porte déjà cette valise.", "danger"] spawn ALF_fnc_doMsg;
};

if ((currentWeapon player) != "") exitWith {
	["ERREUR", "Vous avez les mains encombrées.", "danger"] spawn ALF_fnc_doMsg;
};

if (isNull _obj) then {
	_obj = "Land_Suitcase_F" createVehicle (getPos player);
};
_obj attachTo [player, [-0.03, -0.05, -0.25], "rightHandMiddle1"];
_obj setDir 90;

player setVariable ["wallet_obj", _obj];

_action_1 = player addAction [format["Déposer la valise"],
{
	if (!life_action_inUse && !(isNull (player getVariable ["wallet_obj", objNull]))) then {
		detach (player getVariable ["wallet_obj", objNull]);
		(player getVariable ["wallet_obj", objNull]) setVariable ["money", true, true];
		player setVariable ["wallet_obj", objNull];
	};
}, "", 9999992, true, true, "",'!(isNull (player getVariable ["wallet_obj", objNull]))'];

while {!(isNull _obj) && !(isNull (attachedTo _obj))} do {
	if (	life_istazed || ALF_ActivePrisePistolet || ALF_Phone_tryCall || ALF_Phone_inCall || 
			[player] call ALF_fnc_checkMenotter || [player] call ALF_fnc_checkSurrender ||
			(lifeState player isEqualTo "INCAPACITATED") || 
			(!alive player) || (player getVariable ["ReviveMedic",false]) ||
			((currentWeapon player) != "")
	) exitWith {detach _obj};
	uiSleep 0.5;
};

player removeAction _action_1;