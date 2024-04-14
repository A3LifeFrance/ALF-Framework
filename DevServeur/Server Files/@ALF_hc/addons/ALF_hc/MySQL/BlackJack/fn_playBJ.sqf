/*
	File: fn_playBJ.sqf
	Author: ALF Team
*/
params [
	["_mode",0,[0]],
	["_table",objNull,[objNull]],
	["_player",objNull,[objNull]]
];

private _cards = [[14,"T"],[14,"CO"],[14,"CA"],[14,"P"],[13,"T"],[13,"CO"],[13,"CA"],[13,"P"],[12,"T"],[12,"CO"],[12,"CA"],[12,"P"],[11,"T"],[11,"CO"],[11,"CA"],[11,"P"],[10,"T"],[10,"CO"],[10,"CA"],[10,"P"],[9,"T"],[9,"CO"],[9,"CA"],[9,"P"],[8,"T"],[8,"CO"],[8,"CA"],[8,"P"],[7,"T"],[7,"CO"],[7,"CA"],[7,"P"],[6,"T"],[6,"CO"],[6,"CA"],[6,"P"],[5,"T"],[5,"CO"],[5,"CA"],[5,"P"],[4,"T"],[4,"CO"],[4,"CA"],[4,"P"],[3,"T"],[3,"CO"],[3,"CA"],[3,"P"],[2,"T"],[2,"CO"],[2,"CA"],[2,"P"]];
private _players = _table getVariable ["allPlayers",[]];
_players = _players select {!(isNull _x)};
private _partieID = _table getVariable ["ID",-1];

diag_log format["Init playBJ : %1 %2 ",_players,_partieID];

switch (_mode) do {
	//Rejoindre la table de BJ
	case 0: {
		if (count _players >= 5) exitWith {
			["Blackjack", "Cette table de jeu est complète.", "danger"] remoteExec ["ALF_fnc_doMsg", remoteExecutedOwner];
			diag_log format["Max 5 joueurs : %1",_players];
		};
		if (_partieID != -1) exitWith {
			["Blackjack", "La partie a déjà commencé.", "danger"] remoteExec ["ALF_fnc_doMsg", remoteExecutedOwner];
			diag_log format["Partie deja comm. : %1",_partieID];
		};
		
		if (count _players isEqualTo 0) then {
			_table setVariable ["time",time];
			[_table,_players] spawn {
				diag_log "init loop";
				uiSleep 45;
				private _players2 = (_this select 0) getVariable ["allPlayers",[]];
				_players2 = (_this select 1) select {!(isNull _x)};
				
				if (count _players2 > 0) then {
					diag_log format["launch play : %1",_players2];
					[1,(_this select 0)] remoteExec ["HC_fnc_playBJ", HC_life];
				};
			};
		};
		private _time = _table getVariable ["time",0];
		diag_log format["time : %1",_time];
		
		["Blackjack", format["Vous avez rejoint cette table. Il y a %1 joueur(s) à cette table. Début dans %2 seconde(s).",count(_players)+1,_time+45-time], "danger"] remoteExec ["ALF_fnc_doMsg",remoteExecutedOwner];
		["Blackjack", format["Un joueur a rejoint la table. Il y a %1 joueur(s) à cette table. Début dans %2 seconde(s).",count(_players)+1,_time+45-time], "danger"] remoteExec ["ALF_fnc_doMsg",_players];
		
		_players pushBack _player;
		_table setVariable ["allPlayers",_players];
		diag_log format["final players : %1",_players];
	};
	
	//Start Game
	case 1: {
		private _partie = [500,5000000] call BIS_fnc_randomInt;
		_table setVariable ["ID",_partie];
		
		//Demande des mises
		[1] remoteExec ["ALF_fnc_playBJ",_players];
		
		//Attente des mises
		waitUntil {uiSleep 1; count((_table getVariable ["mises",[0,0,0,0,0]]) select {_x != 0}) isEqualTo count((_table getVariable ["allPlayers",[]]) select {!(isNull _x)})};
		
		_players = _table getVariable ["allPlayers",[]];
		_players = _players select {!(isNull _x)};
		
		//Distribution de 2 cartes chacun
		for "_i" from 0 to 1 do {
			{
				_cards = [_x,_cards] call HC_fnc_distributeBJCards;
				uiSleep 0.25;
			} forEach _players;
		};
		
		//Demande choix joueur
		[4] remoteExec ["ALF_fnc_playBJ",_players];
	};
	
	//Return mise
	case 2: {
		private _mises = _table getVariable ["mises",[0,0,0,0,0]];
		private _mise = _this select 3;
		
		_mises set[_players find _player, _mise];
		
		_table setVariable ["mises",_mises];
	};
	
	//Return action
	case 3: {
		private _action = _this select 3;
		switch (true) do {
			case (_action isEqualTo "rester"): {
				private _playerReste = _table getVariable ["playerReste",[]];
				_playerReste pushBack _player;
				_table setVariable ["playerReste",_playerReste];
			};
			case (_action isEqualTo "tirer"): {
				private _playerTirer = _table getVariable ["playerTirer",[]];
				_playerTirer pushBack _player;
				_table setVariable ["playerTirer",_playerTirer];
			};
			case (_action isEqualTo "doubler"): {
				private _playerDoubler = _table getVariable ["playerDoubler",[]];
				_playerDoubler pushBack _player;
				_table setVariable ["playerDoubler",_playerDoubler];
				
				private _mises = _table getVariable ["mises",[0,0,0,0,0]];
				private _ind = _players find _player;
				_mises set[_ind, (_mises select _ind) * 2];
				
				["Blackjack", format["Votre mise est maintenant de %1 €.",(_mises select _ind)], "success"] remoteExec ["ALF_fnc_doMsg", remoteExecutedOwner];
			};
		};
	};
};