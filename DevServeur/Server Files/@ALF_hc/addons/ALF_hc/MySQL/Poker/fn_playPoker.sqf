#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_playPoker.sqf
	Author: ALF Team
*/
params [
	["_allPlayers",[],[[]]],
	["_table",objNull,[objNull]]
];

diag_log format["Poker : _allPlayers= %1",_allPlayers];
_table allowDamage false;
private _cards = [[14,"T"],[14,"CO"],[14,"CA"],[14,"P"],[13,"T"],[13,"CO"],[13,"CA"],[13,"P"],[12,"T"],[12,"CO"],[12,"CA"],[12,"P"],[11,"T"],[11,"CO"],[11,"CA"],[11,"P"],[10,"T"],[10,"CO"],[10,"CA"],[10,"P"],[9,"T"],[9,"CO"],[9,"CA"],[9,"P"],[8,"T"],[8,"CO"],[8,"CA"],[8,"P"],[7,"T"],[7,"CO"],[7,"CA"],[7,"P"],[6,"T"],[6,"CO"],[6,"CA"],[6,"P"],[5,"T"],[5,"CO"],[5,"CA"],[5,"P"],[4,"T"],[4,"CO"],[4,"CA"],[4,"P"],[3,"T"],[3,"CO"],[3,"CA"],[3,"P"],[2,"T"],[2,"CO"],[2,"CA"],[2,"P"]];
private _partie = [500,5000000] call BIS_fnc_randomInt;
private _currentPlayersPlay = _allPlayers;

//Distribute Cards
private _exit = false;
for "_i" from 0 to 1 do {
	{
		if (isNull _x || {!(_x in _table)}) exitWith {
			_exit = true;
		};
		_cards = [_x,_cards] call HC_fnc_distributeCards;
		uiSleep 0.25;
	} forEach _currentPlayersPlay;
};
if (_exit) exitWith {["Poker", "Un joueur a subitement quitté la partie. La partie est annulé", "danger", false] remoteExec ["ALF_fnc_doMsg",_allPlayers select {!(isNull _x)}]};

//On selectionne deja les cartes qu'on va mettre sur la table
private _carteTable = [];
for "_i" from 0 to 4 do {
	private _card = _cards deleteAt floor(random (((count _cards) - 1)));
	_carteTable pushBack _card;
};

//On met le dealer et petite blinde et grosse blinde
missionNamespace setVariable [format ["ALF_Poker%1_CurrentDealer",_partie],_currentPlayersPlay select 0];
missionNamespace setVariable [format ["ALF_Poker%1_CurrentPetiteBlinde",_partie],_currentPlayersPlay select 1];
missionNamespace setVariable [format ["ALF_Poker%1_CurrentGrosseBlinde",_partie],_currentPlayersPlay select 2];

//On met le pot à 0
//missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],0];

private _finished = false;

//La on lance le tour a vide + les 5 tours
for "_i" from 0 to 5 do {
	diag_log format["Poker : boucle for _i= %1",_i];
	switch (_i) do {
		case 0: {
			diag_log "Poker : case 0";
			//Là on enleve pour le premier tour, le dealer + petite blinde + grosse blinde
			_tour = _currentPlayersPlay;
			_tour = _tour - [(missionNamespace getVariable [format ["ALF_Poker%1_CurrentDealer",_partie],objNull])];
			_tour = _tour - [(missionNamespace getVariable [format ["ALF_Poker%1_CurrentPetiteBlinde",_partie],objNull])];
			_tour = _tour - [(missionNamespace getVariable [format ["ALF_Poker%1_CurrentGrosseBlinde",_partie],objNull])];

			//Si ils jouent à 3, bas pas besoin de demander on passe le tour à vide direct
			if (_tour isEqualTo []) exitWith {};

			private ["_nouveauTour","_miser","_start"];
			_miser = false;
			_start = objNull;
			private _finish = false;

			//C'est simple on demande une action à tous, si sa mise, on refait un tour
			{
				diag_log "Poker : case 0 _tour="+str(_x);
				private _player = _x;
				if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
				missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
				[2,_partie,_blind] remoteExec ["ALF_fnc_playPoker",_player];
				waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
				private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
				switch (true) do {
					case ((_action select 0) isEqualTo "miser"): {
						diag_log "Poker : case 0 miser";
						_miser = true;
						_start = _player;
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
					case ((_action select 0) isEqualTo "coucher"): {
						diag_log "Poker : case 0 coucher";
						_currentPlayersPlay = _currentPlayersPlay - [_player];
					};
					case ((_action select 0) isEqualTo "suivre"): {
						diag_log "Poker : case 0 suivre";
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
				};
				if (_miser) exitWith {diag_log "Poker : case 0 miser exit 1";};
				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			} forEach _tour;

			//La on arrete si tous le monde se couche
			if ((count _currentPlayersPlay) isEqualTo 1) exitWith {diag_log "Poker : case 0 tous coucher exit";};
			if (_finish) exitWith {};

			private ["_index","_currentMise"];
			/*
				Si sa a miser, on rentre dans ce while, ducoup on demande des actions spécifiques,
				Si on relance on continue le while
				Sinon on finit le tour a vide et on passe au tour suivant
			*/
			while {_miser} do {
				diag_log "Poker : case while miser";
				_miser = false;
				_currentMise = missionNamespace getVariable [format ["ALF_Poker%1_CurrentMise",_partie],0];

				//Cette partie permet juste de recréé un fake tour, dans le bonne ordre, et sans le joueur qui a miser
				_index = (_currentPlayersPlay find _start);
				_tour = _currentPlayersPlay select [((_currentPlayersPlay find _start) + 1), 60];
				if (_index > 0) then {
					_tour = _tour + (_currentPlayersPlay select [0, (_currentPlayersPlay find _start)]);
				};

				//Pareil que avant on demande des actions mais spécifiques et si quelqu'un relance on refait un tour
				{
					diag_log "Poker : case 0 _tour 2="+str(_x);
					private _player = _x;
					if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
					missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
					[3,_partie] remoteExec ["ALF_fnc_playPoker",_player];
					waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
					private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
					switch (true) do {
						case ((_action select 0) isEqualTo "relancer"): {
							diag_log "Poker : case 0 relancer 2";
							_miser = true;
							_start = _player;
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "suivre"): {
							diag_log "Poker : case 0 suivre 2";
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "coucher"): {
							diag_log "Poker : case 0 coucher 2";
							_currentPlayersPlay = _currentPlayersPlay - [_player];
						};
					};
					if (_miser) exitWith {diag_log "Poker : case 0 miser exit 2";};
					if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				} forEach _tour;

				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				if (_finish) exitWith {};
			};
		};

		case 1: {
			//La on definit le tour que les joueurs vont prendre
			_tour = _currentPlayersPlay;

			_table setObjectTextureGlobal [0,([_carteTable select 0] call ALF_fnc_recupPokerTexture)];

			//Ici c'est un copié collé de la case au dessus
			private ["_nouveauTour","_miser","_start"];
			_miser = false;
			_start = objNull;
			private _finish = false;

			//C'est simple on demande une action à tous, si sa mise, on refait un tour
			{
				diag_log format["Poker : case 1 _tour=",_x];
				private _player = _x;
				if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
				missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
				[2,_partie] remoteExec ["ALF_fnc_playPoker",_player];
				waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
				private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
				switch (true) do {
					case ((_action select 0) isEqualTo "miser"): {
						diag_log "Poker : case 1 miser";
						_miser = true;
						_start = _player;
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
					case ((_action select 0) isEqualTo "coucher"): {
						diag_log "Poker : case 1 coucher";
						_currentPlayersPlay = _currentPlayersPlay - [_player];
					};
					case ((_action select 0) isEqualTo "suivre"): {
						diag_log "Poker : case 1 suivre";
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
				};
				if (_miser) exitWith {diag_log "Poker : case 1 miser exit 1";};
				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {diag_log "Poker : case 1 count exit 1";};
			} forEach _tour;

			//La on arrete si tous le monde se couche
			if ((count _currentPlayersPlay) isEqualTo 1) exitWith {diag_log "Poker : case 1 count exit 2";};
			if (_finish) exitWith {diag_log "Poker : case 1 finish exit";};

			private ["_index","_currentMise"];
			/*
				Si sa a miser, on rentre dans ce while, ducoup on demande des actions spécifiques,
				Si on relance on continue le while
				Sinon on finit le tour a vide et on passe au tour suivant
			*/
			while {_miser} do {
				diag_log "Poker : case 1 while miser";
				_miser = false;
				_currentMise = missionNamespace getVariable [format ["ALF_Poker%1_CurrentMise",_partie],0];

				//Cette partie permet juste de recréé un fake tour, dans le bonne ordre, et sans le joueur qui a miser
				_index = (_currentPlayersPlay find _start);
				_tour = _currentPlayersPlay select [((_currentPlayersPlay find _start) + 1), 60];
				if (_index > 0) then {
					_tour = _tour + (_currentPlayersPlay select [0, (_currentPlayersPlay find _start)]);
				};
				diag_log "Poker : case 1 while miser _tour=" +str(_tour);

				//Pareil que avant on demande des actions mais spécifiques et si quelqu'un relance on refait un tour
				{
					diag_log "Poker : case 1 _tour 2="+str(_x);
					private _player = _x;
					if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
					missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
					[3,_partie] remoteExec ["ALF_fnc_playPoker",_player];
					waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
					private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
					switch (true) do {
						case ((_action select 0) isEqualTo "relancer"): {
							diag_log "Poker : case 1 relancer 2";
							_miser = true;
							_start = _player;
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "suivre"): {
							diag_log "Poker : case 1 suivre 2";
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "coucher"): {
							diag_log "Poker : case 1 coucher 2";
							_currentPlayersPlay = _currentPlayersPlay - [_player];
						};
					};
					if (_miser) exitWith {};
					if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				} forEach _tour;

				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				if (_finish) exitWith {};
			};
		};

		case 2: {
			//La on definit le tour que les joueurs vont prendre
			_tour = _currentPlayersPlay;

			_table setObjectTextureGlobal [1,([_carteTable select 1] call ALF_fnc_recupPokerTexture)];

			//Ici c'est un copié collé de la case au dessus
			private ["_nouveauTour","_miser","_start"];
			_miser = false;
			_start = objNull;
			private _finish = false;

			//C'est simple on demande une action à tous, si sa mise, on refait un tour
			{
				private _player = _x;
				if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
				missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
				[2,_partie] remoteExec ["ALF_fnc_playPoker",_player];
				waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
				private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
				switch (true) do {
					case ((_action select 0) isEqualTo "miser"): {
						_miser = true;
						_start = _player;
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
					case ((_action select 0) isEqualTo "coucher"): {
						_currentPlayersPlay = _currentPlayersPlay - [_player];
					};
					case ((_action select 0) isEqualTo "suivre"): {
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
				};
				if (_miser) exitWith {};
				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			} forEach _tour;

			//La on arrete si tous le monde se couche
			if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			if (_finish) exitWith {};

			private ["_index","_currentMise"];
			/*
				Si sa a miser, on rentre dans ce while, ducoup on demande des actions spécifiques,
				Si on relance on continue le while
				Sinon on finit le tour a vide et on passe au tour suivant
			*/
			while {_miser} do {
				_miser = false;
				_currentMise = missionNamespace getVariable [format ["ALF_Poker%1_CurrentMise",_partie],0];

				//Cette partie permet juste de recréé un fake tour, dans le bonne ordre, et sans le joueur qui a miser
				_index = (_currentPlayersPlay find _start);
				_tour = _currentPlayersPlay select [((_currentPlayersPlay find _start) + 1), 60];
				if (_index > 0) then {
					_tour = _tour + (_currentPlayersPlay select [0, (_currentPlayersPlay find _start)]);
				};
				
				["Poker",format["test : %1",_tour],"danger", false] remoteExec ["ALF_fnc_doMsg",_tour];

				//Pareil que avant on demande des actions mais spécifiques et si quelqu'un relance on refait un tour
				{
					private _player = _x;
					if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
					missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
					[3,_partie] remoteExec ["ALF_fnc_playPoker",_player];
					waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
					private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
					switch (true) do {
						case ((_action select 0) isEqualTo "relancer"): {
							_miser = true;
							_start = _player;
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "suivre"): {
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "coucher"): {
							_currentPlayersPlay = _currentPlayersPlay - [_player];
						};
					};
					if (_miser) exitWith {};
					if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				} forEach _tour;

				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				if (_finish) exitWith {};
			};
		};

		case 3: {
			//La on definit le tour que les joueurs vont prendre
			_tour = _currentPlayersPlay;

			_table setObjectTextureGlobal [2,([_carteTable select 2] call ALF_fnc_recupPokerTexture)];

			//Ici c'est un copié collé de la case au dessus
			private ["_nouveauTour","_miser","_start"];
			_miser = false;
			_start = objNull;
			private _finish = false;

			//C'est simple on demande une action à tous, si sa mise, on refait un tour
			{
				private _player = _x;
				if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
				missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
				[2,_partie] remoteExec ["ALF_fnc_playPoker",_player];
				waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
				private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
				switch (true) do {
					case ((_action select 0) isEqualTo "miser"): {
						_miser = true;
						_start = _player;
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
					case ((_action select 0) isEqualTo "coucher"): {
						_currentPlayersPlay = _currentPlayersPlay - [_player];
					};
					case ((_action select 0) isEqualTo "suivre"): {
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
				};
				if (_miser) exitWith {};
				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			} forEach _tour;

			//La on arrete si tous le monde se couche
			if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			if (_finish) exitWith {};

			private ["_index","_currentMise"];
			/*
				Si sa a miser, on rentre dans ce while, ducoup on demande des actions spécifiques,
				Si on relance on continue le while
				Sinon on finit le tour a vide et on passe au tour suivant
			*/
			while {_miser} do {
				_miser = false;
				_currentMise = missionNamespace getVariable [format ["ALF_Poker%1_CurrentMise",_partie],0];

				//Cette partie permet juste de recréé un fake tour, dans le bonne ordre, et sans le joueur qui a miser
				_index = (_currentPlayersPlay find _start);
				_tour = _currentPlayersPlay select [((_currentPlayersPlay find _start) + 1), 60];
				if (_index > 0) then {
					_tour = _tour + (_currentPlayersPlay select [0, (_currentPlayersPlay find _start)]);
				};

				//Pareil que avant on demande des actions mais spécifiques et si quelqu'un relance on refait un tour
				{
					private _player = _x;
					if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
					missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
					[3,_partie] remoteExec ["ALF_fnc_playPoker",_player];
					waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
					private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
					switch (true) do {
						case ((_action select 0) isEqualTo "relancer"): {
							_miser = true;
							_start = _player;
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "suivre"): {
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "coucher"): {
							_currentPlayersPlay = _currentPlayersPlay - [_player];
						};
					};
					if (_miser) exitWith {};
					if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				} forEach _tour;

				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				if (_finish) exitWith {};
			};
		};

		case 4: {
			//La on definit le tour que les joueurs vont prendre
			_tour = _currentPlayersPlay;

			_table setObjectTextureGlobal [3,([_carteTable select 3] call ALF_fnc_recupPokerTexture)];

			//Ici c'est un copié collé de la case au dessus
			private ["_nouveauTour","_miser","_start"];
			_miser = false;
			_start = objNull;
			private _miser = false;

			//C'est simple on demande une action à tous, si sa mise, on refait un tour
			{
				private _player = _x;
				if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
				missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
				[2,_partie] remoteExec ["ALF_fnc_playPoker",_player];
				waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
				private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
				switch (true) do {
					case ((_action select 0) isEqualTo "miser"): {
						_miser = true;
						_start = _player;
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
					case ((_action select 0) isEqualTo "coucher"): {
						_currentPlayersPlay = _currentPlayersPlay - [_player];
					};
					case ((_action select 0) isEqualTo "suivre"): {
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
				};
				if (_miser) exitWith {};
				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			} forEach _tour;

			//La on arrete si tous le monde se couche
			if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			if (_finish) exitWith {};

			private ["_index","_currentMise"];
			/*
				Si sa a miser, on rentre dans ce while, ducoup on demande des actions spécifiques,
				Si on relance on continue le while
				Sinon on finit le tour a vide et on passe au tour suivant
			*/
			while {_miser} do {
				_miser = false;
				_currentMise = missionNamespace getVariable [format ["ALF_Poker%1_CurrentMise",_partie],0];

				//Cette partie permet juste de recréé un fake tour, dans le bonne ordre, et sans le joueur qui a miser
				_index = (_currentPlayersPlay find _start);
				_tour = _currentPlayersPlay select [((_currentPlayersPlay find _start) + 1), 60];
				if (_index > 0) then {
					_tour = _tour + (_currentPlayersPlay select [0, (_currentPlayersPlay find _start)]);
				};

				//Pareil que avant on demande des actions mais spécifiques et si quelqu'un relance on refait un tour
				{
					private _player = _x;
					if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
					missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
					[3,_partie] remoteExec ["ALF_fnc_playPoker",_player];
					waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
					private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
					switch (true) do {
						case ((_action select 0) isEqualTo "relancer"): {
							_miser = true;
							_start = _player;
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "suivre"): {
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "coucher"): {
							_currentPlayersPlay = _currentPlayersPlay - [_player];
						};
					};
					if (_miser) exitWith {};
					if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				} forEach _tour;

				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				if (_finish) exitWith {};
			};
		};
		
		case 5: {
			//La on definit le tour que les joueurs vont prendre
			_tour = _currentPlayersPlay;

			_table setObjectTextureGlobal [4,([_carteTable select 4] call ALF_fnc_recupPokerTexture)];

			//Ici c'est un copié collé de la case au dessus
			private ["_nouveauTour","_miser","_start"];
			_miser = false;
			_start = objNull;
			private _finish = false;

			//C'est simple on demande une action à tous, si sa mise, on refait un tour
			{
				private _player = _x;
				if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
				missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
				[2,_partie] remoteExec ["ALF_fnc_playPoker",_player];
				waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
				private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
				switch (true) do {
					case ((_action select 0) isEqualTo "miser"): {
						_miser = true;
						_start = _player;
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
					case ((_action select 0) isEqualTo "coucher"): {
						_currentPlayersPlay = _currentPlayersPlay - [_player];
					};
					case ((_action select 0) isEqualTo "suivre"): {
						private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
						_currentpot pushBack [_player,(_action select 1)];
						missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
					};
				};
				if (_miser) exitWith {};
				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			} forEach _tour;

			//La on arrete si tous le monde se couche
			if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
			if (_finish) exitWith {};

			private ["_index","_currentMise"];
			/*
				Si sa a miser, on rentre dans ce while, ducoup on demande des actions spécifiques,
				Si on relance on continue le while
				Sinon on finit le tour a vide et on passe au tour suivant
			*/
			while {_miser} do {
				_miser = false;
				_currentMise = missionNamespace getVariable [format ["ALF_Poker%1_CurrentMise",_partie],0];

				//Cette partie permet juste de recréé un fake tour, dans le bonne ordre, et sans le joueur qui a miser
				_index = (_currentPlayersPlay find _start);
				_tour = _currentPlayersPlay select [((_currentPlayersPlay find _start) + 1), 60];
				if (_index > 0) then {
					_tour = _tour + (_currentPlayersPlay select [0, (_currentPlayersPlay find _start)]);
				};

				//Pareil que avant on demande des actions mais spécifiques et si quelqu'un relance on refait un tour
				{
					private _player = _x;
					if (isNull _player || {!(_player in _table)}) exitWith {_finish = true;};
					missionNamespace setVariable [format ["ALF_Poker%1_CurrentAction",_partie],"",true];
					[3,_partie] remoteExec ["ALF_fnc_playPoker",_player];
					waitUntil {!((missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""]) isEqualType "")};
					private _action = missionNamespace getVariable [format ["ALF_Poker%1_CurrentAction",_partie],""];
					switch (true) do {
						case ((_action select 0) isEqualTo "relancer"): {
							_miser = true;
							_start = _player;
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentMise",_partie],(_action select 1),true];
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "suivre"): {
							private _currentpot = missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]];
							_currentpot pushBack [_player,(_action select 1)];
							missionNamespace setVariable [format ["ALF_Poker%1_CurrentPot",_partie],_currentpot];
						};
						case ((_action select 0) isEqualTo "coucher"): {
							_currentPlayersPlay = _currentPlayersPlay - [_player];
						};
					};
					if (_miser) exitWith {};
					if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				} forEach _tour;

				if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
				if (_finish) exitWith {};
			};
		};
	};
	if ((count _currentPlayersPlay) isEqualTo 1) exitWith {};
	if (_finish) exitWith {_finished = true;};
};

for "_i" from 0 to 4 do {
	_table setObjectTextureGlobal [_i,""];
};

//Si finshed alors il y a soit un mec qui c'est deco, soit un mec qui c'est lever de sa chaise
if (_finished) exitWith {[8,(missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]])] remoteExec ["ALF_fnc_playPoker",_allPlayers select {!(isNull _x)}];};

//Si il y a un seul mec c'est sur que c'est le gagnant sinon on doit faire un check complet
if ((count _currentPlayersPlay) isEqualTo 1) then {
	[7,(_currentPlayersPlay select 0),(missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]])] remoteExec ["ALF_fnc_playPoker",_allPlayers];
} else {
	private _allScores = [];
	{
		_allScores pushBack [([_carteTable + (_x getVariable ["ALF_Poker_Hand",[]])] call HC_fnc_checkScore),_x];
	} forEach _currentPlayersPlay;
	_allScores sort false;

	//On check si il n'y a pas d'egalite, si il n'y en a pas direct on donne au gagnant sinon on check qu'elle est le gagnant entre les deux
	if !(((_allScores select 0) select 0) isEqualTo ((_allScores select 1) select 0)) then {
		private _gagnant = (_allScores select 0) select 1;
	} else {

		private _checkPlayerScores = _currentPlayersPlay select {
			private _carteJoueur = ([_carteTable + (_x getVariable ["ALF_Poker_Hand",[]])] call HC_fnc_checkScore);
			((_carteJoueur select 0) select 0) isEqualTo ((_allScores select 0) select 0)
		};

		private _gagnant = objNull;
		switch ((_allScores select 0) select 0) do {
			//Qunite flush royale, je ne sais pas ce qu'on fait en egalité ducoup, boum, un petit selectRandom des familles
			case 9: {
				_gagnant = selectRandom _checkPlayerScores;
			};

			//Qunite flush, on doit check qu'elle est la hauteur la plus élevé
			case 8: {
				private _allScoresPlayers = [];
				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					_combinaison = [];
					{
						_combinaison pushBack (_x select 0);
					} forEach _cardsPlayer;
					_combinaison sort true;

					private _hauteur = -1;
					private _result2 = false;
					{
						_count = -1;
						_hauteur = _x;
						for "_i" from _x to (_x + 4) do {
							_count = {(_x select 0) isEqualTo _i} count _cardsPlayer;
							if !(_count isEqualTo 1) exitWith {};
							if (_i isEqualTo (_x + 4)) exitWith {_result2 = true;};
						};
						if (_result2) exitWith {};
					} forEach _combinaison;
					_allScoresPlayers pushBack [_hauteur,_x];
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 1;
			};

			// Check Carre
			case 7: {
				private _allScoresPlayers = [];
				private _card = -1;
				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					private _found = false;
					{
						_card = _x select 0;
						_count = {(_x select 0) isEqualTo _card} count _cardsPlayer;
						if (_count isEqualTo 4) exitWith {_found = true;};
					} forEach _cardsPlayer;
					_allScoresPlayers pushBack [_card,_x];
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 1;
			};

			//Check Full
			case 6: {
				private _allScoresPlayers = [];

				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					private _hauteur = -1;
					for "_i" from 2 to 14 do {
						_count = {(_x select 0) isEqualTo _i} count _cardsPlayer;
						if (_count isEqualTo 3) exitWith {_hauteur = _i;};
					};
					_allScoresPlayers pushBack [_hauteur,_x];
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 1;
			};

			//Check couleur
			case 5: {
				private _allScoresPlayers = [];

				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					_combinaison = [];
					{
						_combinaison pushBack (_x select 0);
					} forEach _cardsPlayer;
					_combinaison sort false;
					_allScoresPlayers pushBack [(_combinaison select 0),_x];
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 1;
			};

			//Check Quinte
			case 4: {
				private _allScoresPlayers = [];

				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					private _combinaison = [];
					{
						_combinaison pushBack (_x select 0);
					} forEach _cardsPlayer;
					_combinaison sort true;

					private _hauteur = -1;
					private _result = false;
					{
						_count = -1;
						for "_i" from _x to (_x + 4) do {
							_count = {(_x select 0) isEqualTo _i} count _cardsPlayer;
							if !(_count isEqualTo 1) exitWith {};
							if (_i isEqualTo (_x + 4)) exitWith {_result = true;_hauteur = _i;};
						};
						if (_result) exitWith {};
					} forEach _combinaison;
					_allScoresPlayers pushBack [_hauteur,_x];
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 1;
			};

			//Check Brelan
			case 3: {
				private _allScoresPlayers = [];

				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					private _hauteur = -1;
					for "_i" from 2 to 14 do {
						_count = {(_x select 0) isEqualTo _i} count _cards;
						if (_count isEqualTo 3) exitWith {_hauteur = _i;};
					};
					_allScoresPlayers pushBack [_hauteur,_x];
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 1;
			};

			//Check Double Paire
			case 2: {
				private _allScoresPlayers = [];

				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					private _index = 0;
					private _hauteur1 = -1;
					private _hauteur2 = -1;
					for "_i" from 2 to 14 do {
						_count = {(_x select 0) isEqualTo _i} count _cardsPlayer;
						if (_count isEqualTo 2) then {
							_index = _index + 1;
							if (_hauteur1 isEqualTo -1) then {
								_hauteur1 = _i;
							} else {
								_hauteur2 = _i;
							};
						};
					};
					_allScoresPlayers pushBack [_hauteur2,_hauteur1,_x];
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 2;
			};

			//Check Paire
			case 1: {
				private _allScoresPlayers = [];

				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					private _hauteur = -1;
					for "_i" from 2 to 14 do {
						_count = {(_x select 0) isEqualTo _i} count _cardsPlayer;
						if (_count isEqualTo 2) exitWith {
							_hauteur = _i;
						};
					};
					_allScoresPlayers pushBack [_hauteur,_x];
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 1;
			};

			//Check Hauteur
			case 0: {
				private _allScoresPlayers = [];

				{
					private _cardsPlayer = _carteTable + (_x getVariable ["ALF_Poker_Hand",[]]);
					private _array = [];
					for "_i" from 14 to 2 do {
						_count = {(_x select 0) isEqualTo _i} count _cardsPlayer;
						if (_count isEqualTo 1) then {
							_array pushBack _i;
						};
					};
					_allScoresPlayers pushBack (_array + [_x]);
				} forEach _checkPlayerScores;
				_allScoresPlayers sort false;

				//Egale au joueur qui est le gagnant
				_gagnant = (_allScoresPlayers select 0) select 7;
			};
		};

		[7,_gagnant,(missionNamespace getVariable [format ["ALF_Poker%1_CurrentPot",_partie],[]])] remoteExec ["ALF_fnc_playPoker",_allPlayers];
	};
};
