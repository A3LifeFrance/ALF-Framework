/*
	File: fn_donDuSang.sqf
	Author: ALF Team
*/
params [
	["_mode",-1,[0]]
];

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	//Lancer la perfusion
	case 0: {
		private _chaise = param [1, objNull, [objNull]];

		_chaise setObjectTextureGlobal [0, "ALF_CentrePompier\ALF_Don_Sang\Sang\Perfusion_neuve.paa"];

		_chaise setVariable ["ALF_player_usingChaise",true,true];
		[_chaise] remoteExec ["HC_fnc_donDuSang",HC3_Life];

		["Medical", "Vous avez lancé la perfusion", "success", false] spawn ALF_fnc_doMsg;
	};

	//Recuperer la perfusion
	case 1: {
		private _chaise = param [1, objNull, [objNull]];
		private _playerInsideChaise = (fullCrew [_chaise, "cargo", false] select 0) select 0;

		if (isNil "_playerInsideChaise" || {isNull _playerInsideChaise}) exitWith {["Medical", "La personne n'est plus dans la chaise, elle faut qu'elle remonte dedans", "danger", false] spawn ALF_fnc_doMsg;};

		private _action = ["Veux-tu retirer la perfusion?","MEDICAL","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};

		ALF_groupeSanguinTarget = "coucou";
		[2,clientOwner] remoteExecCall ["ALF_fnc_donDuSang",_playerInsideChaise];
		waitUntil {!(ALF_groupeSanguinTarget isEqualTo "coucou")};

		private _groupeSanguinTarget = ALF_groupeSanguinTarget;
		if ((_groupeSanguinTarget find "+") > -1) then {
			if ((count _groupeSanguinTarget) > 2) then {
				_groupeSanguinTarget = (_groupeSanguinTarget select [0, 2]) + "p";
			} else {
				_groupeSanguinTarget = (_groupeSanguinTarget select [0, 1]) + "p";
			};
		};

		private _finClassname = ((((((toLower ((getObjectTextures _chaise) select 0)) splitString "\") select 3) splitString ".") select 0) splitString "_") select 1;
		
		if (_finClassname isEqualTo "neuve") exitWith {};
		
		private _classNamePoche = "ALF_PocheDeSang_" + _groupeSanguinTarget + "_" + _finClassname;

		if !(player canAdd _classNamePoche) exitWith {["Medical", "Vous n'avez pas assez de place pour récuperer la poche de sang", "danger", false] spawn ALF_fnc_doMsg;};

		_chaise setVariable ["ALF_player_usingChaise",false,true];
		[_classNamePoche,true] spawn life_fnc_handleItem;
		_chaise setObjectTextureGlobal [0, "ALF_CentrePompier\ALF_Don_Sang\Sang\Perfusion_neuve.paa"];
		
		["Medical", "Vous avez récupéré la poche de sang", "success", false] spawn ALF_fnc_doMsg;
		[3] remoteExecCall ["ALF_fnc_donDuSang",_playerInsideChaise];
	};

	//Recuperer le groupe sanguin
	case 2: {
		private _targetOwner = param [1, -1, [0]];
		if (_targetOwner isEqualTo -1) exitWith {};

		ALF_groupeSanguinTarget = ALF_groupeSanguin;
		_targetOwner publicVariableClient "ALF_groupeSanguinTarget";
	};

	//Lorsqu'il a fini de se faire prendre le sang on lui enelve bouffe et faim
	case 3: {
		life_hunger = life_hunger - (20 / 100 * life_hunger);
		life_thirst = life_thirst - (20 / 100 * life_thirst);
	};
};