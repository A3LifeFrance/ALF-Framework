params [
	["_house",objNull,[objNull]],
	["_type","",[""]]
];

if (!isClass (missionConfigFile >> "ALF_GARAGES" >> (typeOf _house))) exitWith {
	diag_log format["%1: ALF_GARAGES class doesn't exist", typeOf _house];
};

life_garage_sp = [(_house modelToWorld getArray(missionConfigFile >> "ALF_GARAGES" >> (typeOf _house) >> "garageSpawnPos")),(getDir _house) - getNumber(missionConfigFile >> "ALF_GARAGES" >> (typeOf _house) >> "garageSpawnDir")];
life_garage_id = 0; 

[getPlayerUID player,_type,player] remoteExec ["HC_fnc_getVehicles",HC2_Life];

createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];