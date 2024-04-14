[
	[_this,0,objNull,[objNull]] call BIS_fnc_param,
	[
		["RECUPERER",
			"[life_pInact_curObject] spawn ALF_fnc_object_packup;",
			"true"],
		
		["DEPLACER",
			"[life_pInact_curObject] spawn ALF_fnc_object_escort;",
			"true"]
	],
	false,
	true,
	true
] spawn ALF_fnc_interactions_create;
