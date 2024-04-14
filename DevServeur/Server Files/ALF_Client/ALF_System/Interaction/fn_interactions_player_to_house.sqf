private _houseCfg = [(typeOf (_this select 0))] call life_fnc_houseConfig;
if(count(_houseCfg) isEqualTo 0) exitWith {};

[
	[_this,0,objNull,[objNull]] call BIS_fnc_param,
	[
		["ACHETER LE BIEN",
			"[life_pInact_curObject] spawn life_fnc_buyHouse;",
			"count(ALF_House_Data select 0) isEqualTo 0"],
		
		["VENDU",
			"", "!(count(ALF_House_Data select 0) isEqualTo 0) && !(((ALF_House_Data select 0) select 0) isEqualTo (getPlayerUID player) || (life_pInact_curObject in life_vehicles))"],
		
		["VENDRE LE BIEN",
			"[life_pInact_curObject] spawn life_fnc_sellHouse;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {((ALF_House_Data select 0) select 0) isEqualTo (getPlayerUID player)}"],
		["PLACER LE BARIL",
			"[life_pInact_curObject,player] remoteExecCall [""HC_fnc_poserBaril"",HC2_Life];",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {((ALF_House_Data select 0) select 0) isEqualTo (getPlayerUID player)} && {(typeOf life_pInact_curObject) in [""Land_ALF_Caravane""]} && {""ALF_Barrel_boite"" in (magazines player)}"],
			
		["ALLUMER LUMIERES",
			"[life_pInact_curObject] call life_fnc_lightHouseAction;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {[life_pInact_curObject, true] call ALF_fnc_hasEnergy} && {life_pInact_curObject in life_vehicles} && {isNull (life_pInact_curObject getVariable [""lightSource"",objNull])}"],
		["ETEINDRE LUMIERES",
			"[life_pInact_curObject] call life_fnc_lightHouseAction;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {life_pInact_curObject in life_vehicles} && {!(isNull (life_pInact_curObject getVariable [""lightSource"",objNull]))}"],
		
		["BOITE AUX LETTRES",
			"[life_pInact_curObject] call ALF_fnc_menuMailbox;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {life_pInact_curObject in life_vehicles}"],
		
		["ACCEDER AU GARAGE",
			"[life_pInact_curObject,""Car""] spawn life_fnc_vehicleGarage;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {life_pInact_curObject in life_vehicles} && {isClass (missionConfigFile >> ""ALF_GARAGES"" >> (typeOf life_pInact_curObject))}"],
		["RANGER VEHICULE",
			"[life_pInact_curObject,player,[],[0,""CAR""]] spawn life_fnc_storeVehicle;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {life_pInact_curObject in life_vehicles} && {isClass (missionConfigFile >> ""ALF_GARAGES"" >> (typeOf life_pInact_curObject))}"],
		
		["INSTALLER SONNETTE",
			"[life_pInact_curObject,player] remoteExecCall [""HC_fnc_sonnetteHouse"",HC2_Life];",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {((ALF_House_Data select 0) select 0) isEqualTo (getPlayerUID player)} && {""ALF_Sonnette4G"" in (magazines player)} && {(ALF_House_Data select 1) isEqualTo 0}"],
		["SONNER",
			"if (isNull life_pInact_curObject) exitWith {}; [life_pInact_curObject] remoteExecCall [""HC_fnc_playSonnetteHouse"",HC2_Life];",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && !(((ALF_House_Data select 0) select 0) isEqualTo (getPlayerUID player)) && {(ALF_House_Data select 1) isEqualTo 1}"],
		
		["[G] VERIFIER PROPRIO",
			"[] call life_fnc_copHouseOwner;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {life_gendarme_service}"],
		["[G] ENFONCER LA PORTE",
			"[life_pInact_curObject,0] spawn life_fnc_copBreakDoor;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {life_gendarme_service}"],
		["[G] VERROUILLER MAISON",
			"[life_pInact_curObject] spawn life_fnc_lockupHouse;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {life_gendarme_service}"],
			
		["[A] VERIFIER PROPRIO",
			"[] call life_fnc_copHouseOwner;",
			"!(count(ALF_House_Data select 0) isEqualTo 0) && {life_adminlevel > 2} && {!life_gendarme_service}"]
	],
	false,
	true,
	true,
	true
] spawn ALF_fnc_interactions_create;
