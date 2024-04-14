params [
	["_marker","",[""]]
];

if (_marker isEqualTo "") exitWith {};
if ((player distance (getMarkerPos _marker)) <= 20) then {
	if ([format["Vous êtes sur le point de détruire : %1.", (markerText _marker)], "Validation", "Valider", "Annuler"] call BIS_fnc_guiMessage) then {
		if ((player distance (getMarkerPos _marker)) < 20) then {
			["COG",format["%1 a détruit %2.", name player, markerText _marker]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
			[_marker] remoteExec ["HC_fnc_dynamicMarkers_update", HC1_Life];
		} else {
			["ERREUR", "Vous êtes trop loin.", "warning"] spawn ALF_fnc_doMsg;
		};
	};
};