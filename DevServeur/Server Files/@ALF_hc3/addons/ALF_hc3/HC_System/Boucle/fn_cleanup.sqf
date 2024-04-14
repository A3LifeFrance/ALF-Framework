/*
	File: fn_cleanup.sqf
	This file is for Nanou's HeadlessClient.
*/
for "_i" from 0 to 1 step 0 do {
	uiSleep 1440;
	["SERVEUR","LE CLEANUP DU SERVEUR AURA LIEU DANS 5 MINUTES.","warning"] remoteExec ["ALF_fnc_doMsg",playableUnits];
	uiSleep 120;
	["SERVEUR","LE CLEANUP DU SERVEUR AURA LIEU DANS 3 MINUTES.","warning"] remoteExec ["ALF_fnc_doMsg",playableUnits];
	uiSleep 120;
	["SERVEUR","LE CLEANUP DU SERVEUR AURA LIEU DANS 1 MINUTE.","warning"] remoteExec ["ALF_fnc_doMsg",playableUnits];
	uiSleep 15;
	["SERVEUR","LE CLEANUP DU SERVEUR AURA LIEU DANS 45 SECONDES.","warning"] remoteExec ["ALF_fnc_doMsg",playableUnits];
	uiSleep 15;
	["SERVEUR","LE CLEANUP DU SERVEUR AURA LIEU DANS 30 SECONDES.","warning"] remoteExec ["ALF_fnc_doMsg",playableUnits];
	uiSleep 15;
	["SERVEUR","LE CLEANUP DU SERVEUR AURA LIEU DANS 15 SECONDES.","warning"] remoteExec ["ALF_fnc_doMsg",playableUnits];
	uiSleep 5;
	["SERVEUR","LE CLEANUP DU SERVEUR AURA LIEU DANS 10 SECONDES.","warning"] remoteExec ["ALF_fnc_doMsg",playableUnits];
	//SOUND PREVENTION FARMING
	{
		playSound3D ["ALF_Client2\sounds\clean_alarm.ogg",_x];
	} forEach [obj_clean_1,obj_clean_2,obj_clean_3,obj_clean_4];
	uiSleep 15;
	{
		if !("ALF_RoadCone_F" in (magazineCargo _x) || {"ALF_Blue" in (magazineCargo _x)} || {"ALF_Relique_1" in (magazineCargo _x)} || {"ALF_Relique_2" in (magazineCargo _x)} || {"ALF_Relique_3" in (magazineCargo _x)}) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "GroundWeaponHolder");

	{
		deleteVehicle _x;
	} forEach allDeadMen;
};
