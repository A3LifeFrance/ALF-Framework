/*
	File : fn_recupPokerTexture.sqf
	Author: ALF NiiRoZz
*/
params [
	["_carte",[],[[]]]
];

if (_carte isEqualTo []) exitWith {};

private _texture = "\ALF_Poker\data\";

switch (_carte select 1) do {
	case "T": {
		if ((_carte select 0) <= 10) then {
			_texture = _texture + format ["%1_trefle.paa",(_carte select 0)];
		} else {
			switch (_carte select 0) do {
				case 11: {
					_texture = _texture + "valet_trefle.paa";
				};
				case 12: {
					_texture = _texture + "reine_trefle.paa";
				};
				case 13: {
					_texture = _texture + "roi_trefle.paa";
				};
				case 14: {
					_texture = _texture + "as_trefle.paa";
				};
			};
		};
	};
	case "CO": {
		if ((_carte select 0) <= 10) then {
			_texture = _texture + format ["%1_coeur.paa",(_carte select 0)];
		} else {
			switch (_carte select 0) do {
				case 11: {
					_texture = _texture + "valet_coeur.paa";
				};
				case 12: {
					_texture = _texture + "reine_coeur.paa";
				};
				case 13: {
					_texture = _texture + "roi_coeur.paa";
				};
				case 14: {
					_texture = _texture + "as_coeur.paa";
				};
			};
		};
	};
	case "CA": {
		if ((_carte select 0) <= 10) then {
			_texture = _texture + format ["%1_carreau.paa",(_carte select 0)];
		} else {
			switch (_carte select 0) do {
				case 11: {
					_texture = _texture + "valet_carreau.paa";
				};
				case 12: {
					_texture = _texture + "reine_carreau.paa";
				};
				case 13: {
					_texture = _texture + "roi_carreau.paa";
				};
				case 14: {
					_texture = _texture + "as_carreau.paa";
				};
			};
		};
	};
	case "P": {
		if ((_carte select 0) <= 10) then {
			_texture = _texture + format ["%1_pique.paa",(_carte select 0)];
		} else {
			switch (_carte select 0) do {
				case 11: {
					_texture = _texture + "valet_pique.paa";
				};
				case 12: {
					_texture = _texture + "reine_pique.paa";
				};
				case 13: {
					_texture = _texture + "roi_pique.paa";
				};
				case 14: {
					_texture = _texture + "as_pique.paa";
				};
			};
		};
	};
};

_texture