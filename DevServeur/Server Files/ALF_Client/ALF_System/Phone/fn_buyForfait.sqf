/*
	File: buyForfait
	Author: ALF Team
*/
params[
	["_tel",-1,[0]],
	["_mode",-1,[0]]
];
if(_tel isEqualTo -1 OR {_mode isEqualTo -1}) exitWith {};

private _uid = getPlayerUID player;
private _price = 0;
private _offre = "";

switch (_tel) do {
	case 1 : {
		switch (_mode) do {
			case 1 : {_price = 50;};
			case 2 : {_price = 125;};
			case 3 : {_price = 320;};
			case 4 : {_price = 700;};
		};
		private _action = [format["Veux-tu acheter cette offre pour %1€. La somme sera prélevé en cash.",_price],"Orange","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if (life_cash >= _price) then {
			life_cash = life_cash - _price;
			[_uid,_mode,player] remoteExecCall ["HC_fnc_buyForfait",HC3_Life];
		} else {
			["Orange", "Vous n'avez pas assez de liquide.", "danger", false] spawn ALF_fnc_doMsg;
		};
	};
	case 2 : {
		if !(life_donor) exitWith {["Orange", "Cette option n'est disponible que pour les membres donateurs.", "danger", false] spawn ALF_fnc_doMsg;};
		private _action = ["Veux-tu résilier ton forfait? Ton numéro et tes contacts seront définitivement effacés.","Orange","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if (life_cash >= 999) then {
			life_cash = life_cash - 999;
			ALF_Forfait = -1;
			[_uid,player] remoteExec ["HC_fnc_removeForfait",HC3_Life];
		} else {
			["Orange", "Vous n'avez pas assez de liquide.", "danger", false] spawn ALF_fnc_doMsg;
		};
	};
};
