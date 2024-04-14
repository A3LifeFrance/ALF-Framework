/*
	File: fn_menuSMSSR.sqf
	Author: ALF Adam
*/
private ["_listeHistorique","_txtControl"];
params [
	["_mode",-1,[0]],
	["_histtexte","",[""]],
	["_msgs",[],[[]]]
];
disableSerialization;

if (_mode isEqualTo -1) exitWith {};

private _display = findDisplay 754721;
if !(isNull _display) then {
	_listeHistorique = _display displayCtrl 754722;
	_txtControl = _display displayCtrl 754724;
};

switch (_mode) do {
	//Lancement Dialog
	case 0: {
		if (!(createDialog "ALF_SR_SMS_Tel")) exitWith {};
		lbClear 754722;
		ALF_InspectTelHistorique = [];
	};

	//OnKeyUp EventHandler sur l'edit
	case 1: {
		if (count _histtexte < 10 || {count _histtexte > 10}) exitWith {lbClear 754722;ALF_InspectTelHistorique = [];lbSetCurSel [754722, -1];_txtControl ctrlShow false;};
		if !([_histtexte] call TON_fnc_isnumber) exitWith {lbClear 754722;ALF_InspectTelHistorique = [];lbSetCurSel [754722, -1];_txtControl ctrlShow false;};

		lbClear 754722;
		[_histtexte] remoteExecCall ["HC_fnc_getMSGFromNumber",HC3_Life];
	};
	
	//Retour HC
	case 2: {
		if !(count(_msgs) > 0) exitWith {["ERREUR", "Aucun historique présent ...", "danger"] spawn ALF_fnc_doMsg;};
		
		ALF_InspectTelTime = time;
		if !((_msgs select 0) isEqualTo []) then {
			{
				private _numberExp = _x select 0;
				private _numberDest = _x select 1;
				private _msg = format["%1", _x select 2];
				private _date = _x select 3;
				
				if (_numberExp isEqualTo _histtexte) then {
					private _index = _listeHistorique lbAdd format["%1",_numberDest];
					_listeHistorique lbSetPicture [_index,"\ALF_Client2\icons\out.paa"];
				} else {
					private _index = _listeHistorique lbAdd format["%1",_numberExp];
					_listeHistorique lbSetPicture [_index,"\ALF_Client2\icons\in.paa"];
				};
				_listeHistorique lbSetdata [(lbSize _listeHistorique)-1, str([_msg,_date])];
			} forEach _msgs;
		} else {
			private _index = _listeHistorique lbAdd "Aucun historique.";
			_listeHistorique lbSetData [_index,str(["Aucun historique.",""])];
		};
	};

	//On affiche le texte du msg
	case 3: {
		disableSerialization;
		private _msg = call compile format["%1",lbData[754722,lbCurSel (754722)]];
		
		if((_msg select 0) isEqualTo "Aucun historique.") then {
			_txtControl ctrlSetStructuredText parseText format["<t shadow='0' color='#FFFFFF' font='HelveticaNeueLTStdLt' size='1'>Aucun message.</t>"];
		} else {
			_txtControl ctrlSetStructuredText parseText format ["<t color='#FFFFFF' font='HelveticaNeueLTStdLt' size='1'>%3/%2/%1 %4:%5 - </t><t shadow='0' color='#FFFFFF' font='HelveticaNeueLTStdLt' size='1'>%6</t>", (_msg select 1) select 0, (_msg select 1) select 1, (_msg select 1) select 2, (_msg select 1) select 3, (_msg select 1) select 4, (_msg select 0)];
		};
	};
};