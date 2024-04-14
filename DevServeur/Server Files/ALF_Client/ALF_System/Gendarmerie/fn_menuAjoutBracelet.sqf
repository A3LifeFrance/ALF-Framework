/*
	File: fn_menuAjoutBracelet.sqf
	Author: ALF NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_temps",[],[[]]],
	["_unit",objNull,[objNull]]
];
disableSerialization;

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	//Lancement Dialog
	case 0: {
		if (!(createDialog "ALF_Ajout_Bracelet_Elect")) exitWith {};
		ALF_unitAjoutBracelet = _unit;
		waitUntil {!(isNull (findDisplay 87590))};
		_display = findDisplay 87590;
		_textControl = _display displayCtrl 87594;
		_textControl ctrlSetStructuredText parseText "<t valign='middle' align='center' >Si vous voulez mettre un temps indeterminé, veuillez mettre 0 à Jour(s), Heure(s) et Minute(s)</t>";
	};

	//Appuie bouton ajout bracelet
	case 1: {
		_temps params [
			["_jours","",[""]],
			["_heures","",[""]],
			["_minutes","",[""]]
		];

		if !("ALF_Bracelet" in (magazines player)) exitWith {closeDialog 0; ["INFO","Vous n'avez pas de bracelet sur vous","warning"] spawn ALF_fnc_doMsg;};
		if (isNull ALF_unitAjoutBracelet) exitWith {closeDialog 0; ["INFO","Un problème est survenu","warning"] spawn ALF_fnc_doMsg;};
		if (!(_jours call TON_fnc_isnumber) || {!(_heures call TON_fnc_isnumber)} || {!(_minutes call TON_fnc_isnumber)}) exitWith {["INFO","Vous devez indiquer un nombre dans chacune des cases","warning"] spawn ALF_fnc_doMsg;};
		_jours = parseNumber _jours;
		_heures = parseNumber _heures;
		_minutes = parseNumber _minutes;
		if (_heures > 23 || _heures < 0) exitWith {["INFO","Vous devez indiquer un nombre entre 0 et 23 pour le nombre d'heures","warning"] spawn ALF_fnc_doMsg;};
		if (_minutes > 59 || _minutes < 0) exitWith {["INFO","Vous devez indiquer un nombre entre 0 et 59 pour le nombre de minutes","warning"] spawn ALF_fnc_doMsg;};
		private _minutesTotal = _jours * 24 * 60;
		_minutesTotal = _minutesTotal + (_heures * 60);
		_minutesTotal = _minutesTotal + _minutes;

		["ALF_Bracelet",false] spawn life_fnc_handleItem;
		closeDialog 0;
		["INFO",format ["Vous venez d'ajouter un bracelet électronique pour %1 minutes",_minutesTotal],"success"] spawn ALF_fnc_doMsg;

		//Si egale à 0 alors c'est un temps inderterminé, donc a l'infini
		if (_minutesTotal isEqualTo 0) then {
			[-10,ALF_unitAjoutBracelet] remoteExecCall ["HC_fnc_braceletElectronique",HC_Life];
		} else {
			[_minutesTotal,ALF_unitAjoutBracelet] remoteExecCall ["HC_fnc_braceletElectronique",HC_Life];
		};
	};
};