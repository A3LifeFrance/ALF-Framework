/*
	File: fn_setupEVH.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master eventhandler file
*/
player addEventHandler["Killed", {_this call life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["FiredNear", {_this call ALF_fnc_firstViewCombat}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler["GetInMan", {_this call ALF_fnc_getInMan;}];
player addEventHandler["GetOutMan", {_this call ALF_fnc_getOutMan;}];
player addEventHandler["SeatSwitchedMan", {_this call ALF_fnc_seatSwitchedMan}];
player addEventHandler["Put", {_this spawn life_fnc_silentGearSave;}];
player addEventHandler["Take", {_this spawn ALF_fnc_onTake; _this spawn life_fnc_silentGearSave;}];
player addEventHandler["HandleRating", {0}];

["player", "OnBeforeTangent", 
{
	if (_this select 4) then {
		if (player getVariable["ALF_comRadio",false]) exitWith {};
		player setVariable ["ALF_comRadio", true];
		if (alive player) then {
			if ((vest player) in ["V_ALF_GIGN_Leger_3", "V_ALF_GIGN_Leger_4", "V_ALF_GIGN_Leger_5", "V_ALF_GIGN_Leger_6", "V_ALF_GIGN_Leger_7", "V_ALF_GIGN_Leger_8", "V_ALF_GIGN_Leger_9", "V_ALF_GIGN_Leger_10", "V_ALF_GIGN_Leger_11",
			"V_ALF_GIGN_Leger_12", "V_ALF_Gdep_1", "V_ALF_Gdep_2", "V_ALF_Gdep_3", "V_ALF_Gdep_4", "V_ALF_Gdep_5", "V_ALF_Gdep_6", "V_ALF_Gdep_7", "V_ALF_Gdep_8", "V_ALF_Gdep_9", "V_ALF_Gdep_10", "V_ALF_Gdep_11",
			"V_ALF_Gdep_12", "V_ALF_Nego_2", "V_ALF_Nego_3", "V_ALF_Nego_4", "V_ALF_Nego_5", "V_ALF_Nego_6","V_ALF_Nego_7", "V_ALF_Nego_8", "V_ALF_Nego_9", "V_ALF_Nego_10", "V_ALF_Nego_11", "V_ALF_Nego_12", "V_ALF_Psig_2",
			"V_ALF_Psig_3", "V_ALF_Psig_4", "V_ALF_Psig_5", "V_ALF_Psig_6", "V_ALF_Psig_7", "V_ALF_Psig_8", "V_ALF_Psig_9", "V_ALF_Psig_10", "V_ALF_Psig_11", "V_ALF_Psig_12", "V_ALF_sr_4", "V_ALF_sr_5", "V_ALF_sr_6",
			"V_ALF_sr_7", "V_ALF_sr_8", "V_ALF_sr_9",  "V_ALF_sr_10", "V_ALF_sr_11", "V_ALF_sr_12", "V_ALF_Gilet_AP"]) then {
				player playActionNow "ALF_ComRadio2";
			} else {
				player playActionNow "ALF_comradio";
			};
		};
	} else {
		player playActionNow "GestureNod"; 
		player setVariable ["ALF_comRadio", false];
	};
}, Player] call TFAR_fnc_addEventHandler;
