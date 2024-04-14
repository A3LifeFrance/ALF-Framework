[
	[_this,0,objNull,[objNull]] call BIS_fnc_param,
	[
		["DEPLACER",
			"[life_pInact_curObject] spawn ALF_fnc_object_escort;",
			"true"],
		["VIDER",
			"[life_pInact_curObject] spawn ALF_fnc_viderTrash;",
			"license_eboueur && {(count(nearestObjects [player, [""V_ALF_Camion_Poubelle""], 10])) > 0}"],
			
		["DELETE ADMIN",
			"deleteVehicle life_pInact_curObject;",
			"life_adminlevel > 0"]
	],
	false,
	true,
	true
] spawn ALF_fnc_interactions_create;
