/*
	File: fn_menuMettrePrison.sqf
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
		if (!(createDialog "ALF_Mettre_En_Prison")) exitWith {};
		ALF_unitMettrePrison = _unit;
		waitUntil {!(isNull (findDisplay 455160))};
		_display = findDisplay 455160;
		_textControl = _display displayCtrl 455164;
		_textControl ctrlSetStructuredText parseText "<t valign='middle' align='center'>Lorsque vous allez le mettre en prison, le joueur sera détaché automatiquement.</t>";
	};

	//Appuie bouton mettre prison
	case 1: {
		_temps params [
			["_jours","",[""]],
			["_heures","",[""]],
			["_minutes","",[""]]
		];

		if (isNull ALF_unitMettrePrison) exitWith {closeDialog 0; ["INFO","Un problème est survenu","warning"] spawn ALF_fnc_doMsg;};
		if (!(_jours call TON_fnc_isnumber) || {!(_heures call TON_fnc_isnumber)} || {!(_minutes call TON_fnc_isnumber)}) exitWith {["INFO","Vous devez indiquer un nombre dans chacune des cases","warning"] spawn ALF_fnc_doMsg;};
		_jours = parseNumber _jours;
		_heures = parseNumber _heures;
		_minutes = parseNumber _minutes;
		if (_heures > 23 || _heures < 0) exitWith {["INFO","Vous devez indiquer un nombre entre 0 et 23 pour le nombre d'heures","warning"] spawn ALF_fnc_doMsg;};
		if (_minutes > 59 || _minutes < 0) exitWith {["INFO","Vous devez indiquer un nombre entre 0 et 59 pour le nombre de minutes","warning"] spawn ALF_fnc_doMsg;};
		private _minutesTotal = _jours * 24 * 60;
		_minutesTotal = _minutesTotal + (_heures * 60);
		_minutesTotal = _minutesTotal + _minutes;

		if (_minutesTotal <= 0) exitWith {["INFO","Vous devez indiquer des nombres strictement positif dans chacune des cases","warning"] spawn ALF_fnc_doMsg;};

		closeDialog 0;
		["INFO",format ["Vous venez de mettre en prison %2 pour %1 minutes",_minutesTotal, name ALF_unitMettrePrison],"success"] spawn ALF_fnc_doMsg;

		detach ALF_unitMettrePrison;

		//On envoie a l'HC comme quoi, il a été mis en prison
		[_minutesTotal,ALF_unitMettrePrison] remoteExecCall ["HC_fnc_mettrePrison",HC_Life];
	};

	//Il a été mis en prison
	case 2: {
		ALF_Prison = true;
		ALF_Prison_Coffre = 0;
		life_cash = 100;
		removeAllWeapons player;
		{player removeMagazineGlobal _x;} forEach (magazines player);
		removeGoggles player;
		removeHeadGear player;
		removeVest player;
		removeBackpack player;

		player addWeapon "ALF_Pioche";
		player addBackpack "ALF_AssaultPack_khk";

		{
			player unassignItem _x;
			player removeItem _x;
		} forEach (assignedItems player);

		if(hmd player != "") then {
			player unlinkItem (hmd player);
		};

		if (life_copLevel > 0) then {
			life_gendarme_service = false;
			player setVariable ["CopService",life_gendarme_service,[HC_Life,HC3_Life]];
			[0] remoteExecCall ["HC_fnc_priseService",HC3_Life];
		};

		if (life_medicLevel > 0) then {
			life_pompier_service = false;
			player setVariable ["MedService",life_pompier_service,[HC_Life,HC3_Life]];
			[1] remoteExecCall ["HC_fnc_priseService",HC3_Life];
		};

		if (life_publique > 0) then {
			life_publique_service = false;
		};

		_array = missionNamespace getVariable ["ALF_AllBracelets",[]];
		if (player in _array) then {
			_index = _array find player;
			_array set [_index, objNull];
			_array = _array - [objNull];
			missionNamespace setVariable ["ALF_AllBracelets",_array,true];
			[player] remoteExecCall ["HC_fnc_enleverBracelet",HC_Life];
		};
		
		[] call SOCK_fnc_updateRequest;
		["PRISON","Vous êtes maintenant en prison.","warning"] spawn ALF_fnc_doMsg;
	};
	//Il a été REMIS en prison
	case 3: {
		ALF_TimePrison = _temps select 0;
		["PRISON",format["Votre peine est maintenant de %1.",[ALF_TimePrison] call BIS_fnc_secondsToString],"warning"] spawn ALF_fnc_doMsg;
	};

	//On lance le menu pour param une cellule
	case 4: {
		if (!(createDialog "ALF_Mettre_En_Prison_C")) exitWith {};
		ALF_unitMettrePrison = _unit;
		waitUntil {!(isNull (findDisplay 456160))};
		_display = findDisplay 456160;
		_textControl = _display displayCtrl 456164;
		_textControl ctrlSetStructuredText parseText "<t valign='middle' align='center'>Assignez une cellule.</t>";
	};
	//Appuie bouton mettre Cellule
	case 5: {
		_temps params [
			["_cellule","",[""]]
		];

		if (isNull ALF_unitMettrePrison) exitWith {closeDialog 0; ["INFO","Un problème est survenu.","warning"] spawn ALF_fnc_doMsg;};
		if (!(_cellule call TON_fnc_isnumber)) exitWith {["INFO","Vous devez indiquer un nombre.","warning"] spawn ALF_fnc_doMsg;};
		_cellule = parseNumber _cellule;
		if (_cellule > 20 || _cellule < 1) exitWith {["INFO","Vous devez indiquer un nombre entre 1 et 20.","warning"] spawn ALF_fnc_doMsg;};

		closeDialog 0;
		["INFO",format ["Vous venez d'assigner la cellule %1 pour %2.",_cellule, name ALF_unitMettrePrison],"success"] spawn ALF_fnc_doMsg;

		//On envoie a l'HC
		[_cellule,ALF_unitMettrePrison] remoteExecCall ["HC_fnc_mettreCellule",HC_Life];
	};
	case 6: {
		ALF_Prison_Coffre = _temps select 0;
		["INFO",format ["Votre cellule est la numero %1.",_temps select 0],"success"] spawn ALF_fnc_doMsg;
	};
};