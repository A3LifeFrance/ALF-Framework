[
	[_this,0,objNull,[objNull]] call BIS_fnc_param,
	[
		["PRENDRE CARTE IDENTITE",
			"[life_pInact_curObject, name life_pInact_curObject] call ALF_fnc_showIDcard;",
			"'ALF_identite' in (magazines life_pInact_curObject)"],
		["FOUILLER",
			"[life_pInact_curObject] spawn ALF_fnc_fouilleAnal;",
			"true"],
			
		["PORTER LE BLESSE",
			"[0,life_pInact_curObject] spawn ALF_fnc_porterMort;",
			"isNull (attachedTo life_pInact_curObject)"],
		["METTRE DANS LE VEHICULE",
			"[0,life_pInact_curObject] call ALF_fnc_voitureMort;",
			"isNull (attachedTo life_pInact_curObject)"],
		["REANIMER",
			"[life_pInact_curObject] spawn life_fnc_revivePlayer;",
			"'ALF_Defibrilateur' in (magazines player) && {isNull (attachedTo life_pInact_curObject)}"],
		["STABILISER",
			"[life_pInact_curObject] spawn ALF_fnc_stabilize;",
			"!('ALF_Defibrilateur' in (magazines player)) && {isNull (attachedTo life_pInact_curObject)}"],
		
		["METTRE DRAP MORTUAIRE",
			"[0,life_pInact_curObject] spawn ALF_fnc_drapMort;",
			"'ALF_Drap_Cadavre_Item' in (magazines player) && {isNull (attachedTo life_pInact_curObject)}"]
	],
	false
] spawn ALF_fnc_interactions_create;