/*
	File: fn_soin.sqf
	Author: ALF Adam
*/
params[
	["_mode",0,[0]],
	["_meds",[],[[]]]
];

if (getDammage player isEqualTo 0) exitWith {["SECRETAIRE", "Vous n'êtes pas blessé.", "danger"] spawn ALF_fnc_doMsg;};

if (_mode isEqualTo 1) then {
	if (life_action_inUse) exitWith {};
	if(count(_meds) > 0) exitWith {["SECRETAIRE", "Veuillez contacter les services de secours au numéro suivant : 18.", "danger"] spawn ALF_fnc_doMsg;};
	
	if (5000 > life_cash) then {
	
		private _handle = [5000,false] call ALF_fnc_handleCB;
		if(_handle) exitWith {_exit = true;};
		
		life_action_inUse = true;
	
		private _pos = getPos player;
		titleText ["Soin en cours. Veuillez patienter et ne pas bouger !", "PLAIN"];
		
		uiSleep 5;
		
		if (_pos distance player > 3) exitWith {["SECRETAIRE", "Vous avez bougé les soins n'ont pas été appliqués.", "danger"] spawn ALF_fnc_doMsg; life_cash = life_cash + 5000;};
		player setDamage 0;
		titleText ["Vous êtes stabilisé. Pensez à consulter un médecin rapidement !", "PLAIN"];
		
		life_action_inUse = false;
		
	} else {

		life_action_inUse = true;
	
		private _pos = getPos player;
		titleText ["Soin en cours. Veuillez patienter et ne pas bouger !", "PLAIN"];
		
		uiSleep 5;
		
		if (_pos distance player > 3) exitWith {["SECRETAIRE", "Vous avez bougé les soins n'ont pas été appliqués.", "danger"] spawn ALF_fnc_doMsg;};
		if (life_cash < 5000) exitWith {["SECRETAIRE", "Vous n'avez pas 5000 € sur vous.", "danger"] spawn ALF_fnc_doMsg;};
		life_cash = life_cash - 5000;
		player setDamage 0;
		
		life_action_inUse = false;
	};
} else {
	if((time - life_action_delay) < 5) exitWith {["SECRETAIRE", "Merci de patienter quelques secondes.", "danger"] spawn ALF_fnc_doMsg;};
	life_action_delay = time;
	
	private _action = ["Le coût du soin est de 5000 €. Souhaitez-vous etre pris en charge ?","Urgence","OUI","NON"] call BIS_fnc_guiMessage;
	if (!_action) exitWith {};

	[] remoteExecCall ["HC_fnc_checkSoin",HC_Life];
};