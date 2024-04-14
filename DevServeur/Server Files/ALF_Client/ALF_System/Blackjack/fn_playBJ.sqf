/*
	File : fn_playBJ.sqf
	Author: ALF Adam
*/
params [
	["_mode",-1,[0]]
];

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	//Rejoindre la table de BJ
	case 0: {
		private _table = nearestObject [player, "ALF_TableBlackJack"];
		if (isNull _table) exitWith {["Blackjack", "Il te faut une table de blackjack proche de toi.", "warning", false] spawn ALF_fnc_doMsg;};
		
		if (life_cash < 500) exitWith {["Blackjack","La mise minimale est de 500 €. Vous devez avoir, au moins, cette somme sur vous.", "warning"] spawn ALF_fnc_doMsg;};

		if (ALF_Current_Partie isEqualTo -1) then {
			[0,_table,player] remoteExec ["HC_fnc_playBJ",HC_Life];
			ALF_Current_Table = _table;
		} else {
			["BlackJack", "Vous êtes deja dans une partie.", "warning"] spawn ALF_fnc_doMsg;
		};
	};

	//Afficher menu mise
	case 1: {
		if !(createDialog "alfbj") exitWith {["INFO","Une erreur s'est produite lors de la création du dialog du blackjack.","warning"] spawn ALF_fnc_doMsg;};
		["Blackjack","En attente de la mise des joueurs ...", "success"] spawn ALF_fnc_doMsg;
		disableSerialization;
	};
	
	//Appuie bouton miser
	case 2: {
		private _value = ctrlText 5416181;
		if !([_value] call TON_fnc_isnumber) exitWith {["Blackjack","Vous n'avez pas mis un nombre dans la mise.", "warning"] spawn ALF_fnc_doMsg;};

		_value = parseNumber _value;
		if (life_cash < 500) exitWith {["Blackjack","La mise minimale est de 500 €.", "warning"] spawn ALF_fnc_doMsg;};
		if (life_cash < _value) exitWith {["Blackjack","Vous n'avez pas assez d'argent sur vous pour miser ceci.", "warning"] spawn ALF_fnc_doMsg;};

		[2, ALF_Current_Table, player, _value] remoteExec ["HC_fnc_playBJ", HC_Life];
		closeDialog 0;
	};
	
	//Affichage des cartes
	case 3: {
		private _cartes = param [1, [], [[]]];
		private _id = 544151;

		disableSerialization;
		private _display = uiNamespace getVariable ["pokerHUD",displayNull];

		if (isNull _display) then {
			"pokerCarte" cutRsc ["pokerHUD", "PLAIN", 2, false];
			_display = uiNameSpace getVariable ["pokerHUD",displayNull];
		};

		private "_texture";
		{
			_control = _display displayCtrl _id;
			_texture = [_x] call ALF_fnc_recupPokerTexture;
			_control ctrlSetText _texture;
			_id = _id + 1;
		} forEach _cartes;
	};
	
	//Afficher menu demande carte supp.
	case 4: {
		if !(createDialog "alfbj") exitWith {["INFO","Une erreur s'est produite lors de la création du dialog du blackjack.","warning"] spawn ALF_fnc_doMsg;};
		disableSerialization;
	};

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	//Afficher menu mise
	case 2: {
		ALF_Current_Partie = param [1, -1, [0]];
		ALF_Blind_Partie = param [2, -1, [0]];
		
		if (ALF_Current_Partie isEqualTo -1) exitWith {};
		if !(createDialog "alfpoker") exitWith {["INFO","Une erreur s'est produite lors de la création du dialog du poker.","warning"] spawn ALF_fnc_doMsg;};
		disableSerialization;

		private _display = findDisplay 541618;
		private _ctrlSuivre = _display displayCtrl 5416183;

		if (ALF_Blind_Partie isEqualTo -1) then {
			//On cache le bouton suivre
			_ctrlSuivre ctrlShow false;
		};
	};

	//Afficher menu avec la relance a la place de mise
	case 3: {
		ALF_Current_Partie = param [1, -1, [0]];
		ALF_Mise_Partie = missionNamespace getVariable [format ["ALF_Poker%1_CurrentMise",ALF_Current_Partie],-1];
		
		if (ALF_Current_Partie isEqualTo -1) exitWith {};
		if !(createDialog "alfpoker") exitWith {["INFO","Une erreur s'est produite lors de la création du dialog du poker.","warning"] spawn ALF_fnc_doMsg;};
		disableSerialization;

		private _display = findDisplay 541618;
		private _ctrlMiseBtn = _display displayCtrl 5416182;
		private _ctrlSuivre = _display displayCtrl 5416183;
		private _ctrlMiseEnCours = _display displayCtrl 5416185;

		//On met le btn relancer
		_ctrlMiseBtn ctrlSetText "Relancer";
		_ctrlMiseEnCours ctrlSetText (format["mise en cours : %1",[ALF_Mise_Partie] call life_fnc_numberText]);

		if (ALF_Mise_Partie isEqualTo -1) then {
			//On cache le bouton suivre
			_ctrlSuivre ctrlShow false;
		};
	};

	//Appuie bouton suivre
	case 4: {
		if (ALF_Blind_Partie > -1) then {
			if (life_cash < ALF_Blind_Partie) exitWith {["Poker","Tu n'as pas assez d'argent pour suivre.", "danger", false] spawn ALF_fnc_doMsg;};

			life_cash = life_cash - ALF_Blind_Partie;
			missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",ALF_Current_Partie],["suivre",ALF_Mise_Partie],true];
			closeDialog 0;
			ALF_Blind_Partie = -1;
		} else {
			if (ALF_Mise_Partie > -1) then {
				if (life_cash < ALF_Mise_Partie) exitWith {["Poker","Tu n'as pas assez d'argent pour suivre.", "danger", false] spawn ALF_fnc_doMsg;};

				life_cash = life_cash - ALF_Mise_Partie;
				missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",ALF_Current_Partie],["suivre",ALF_Mise_Partie],true];
				closeDialog 0;
				ALF_Mise_Partie = -1;
			};
		};
	};

	//Appuie bouton coucher
	case 5: {
		missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",ALF_Current_Partie],["coucher",-1],true];
		closeDialog 0;
	};

	//Appuie bouton miser ou relancer
	case 6: {
		if ((ctrlText 5416182) isEqualTo "Relancer") then {
			private _value = ctrlText 5416181;
			if !([_value] call TON_fnc_isnumber) exitWith {["Poker","Tu n'as pas mis un nombre dans la relance.", "danger", false] spawn ALF_fnc_doMsg;};

			_value = parseNumber _value;
			if (life_cash < _value) exitWith {["Poker","Tu n'as pas assez d'argent pour la valeur que tu as mis dans relance.", "danger", false] spawn ALF_fnc_doMsg;};

			missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",ALF_Current_Partie],["relancer",_value],true];
			closeDialog 0;
		} else {
			private _value = ctrlText 5416181;
			if !([_value] call TON_fnc_isnumber) exitWith {["Poker","Tu n'as pas mis un nombre dans la mise.", "danger", false] spawn ALF_fnc_doMsg;};

			_value = parseNumber _value;
			if (life_cash < _value) exitWith {["Poker","Tu n'as pas assez d'argent pour la valeur que tu as mis dans mise.", "danger", false] spawn ALF_fnc_doMsg;};

			missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",ALF_Current_Partie],["miser",_value],true];
			closeDialog 0;
		};
	};

	//Fin de la partie, gagnant
	case 7: {
		private _gagnant = param [1, objNull, [objNull]];
		private _cashgagnearray = param [2, [], [[]]];

		if (player isEqualTo _gagnant) then {
			private _cashgagne = 0;
			{
				_cashgagne = _cashgagne + (_x select 1);
			} forEach _cashgagnearray;

			["Poker",format["Vous avez gagné %1",[_cashgagne] call life_fnc_numberText], "success", false] spawn ALF_fnc_doMsg;
			life_cash = life_cash + _cashgagne;
		} else {
			["Poker",format["Le gagnant est : %1",name _gagnant], "danger", false] spawn ALF_fnc_doMsg;
		};

		"pokerCarte" cutText ["","PLAIN"];
	};

	//Fin de la partie, erreur
	case 8: {
		private _casharray = param [1, [], [[]]];

		{
			if (player isEqualTo (_x select 0)) then {
				life_cash = life_cash + (_x select 1);
			};
		} forEach _casharray;

		["Poker","Erreur : partie poker terminé. Une personne s'est levé ou quitté", "danger", false] spawn ALF_fnc_doMsg;

		"pokerCarte" cutText ["","PLAIN"];
	};
};