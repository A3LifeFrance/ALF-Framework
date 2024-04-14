/*
	File: fn_enleverBracelet.sqf
	Auhtor: ALF NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_unit",objNull,[objNull]]
];

if (isNull _unit || {_mode isEqualTo -1}) exitWith {};


switch (_mode) do {
	//Enlever bracelet civil
	case 0: {
		life_action_inUse = true;

		private _3dlock = "Land_File_F" createvehicle [0,0,0];
		_3dlock attachto [player, [-0.015,0.08,0], "RightHandMiddle1"];
		_3dlock setDir 180;

		//Setup the progress bar
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable  "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
		_titleText ctrlSetText format["Lockpick bracelet (1%1)...","%"];
		_progressBar progressSetPosition 0.01;
		_cP = 0.01;
		_badDistance = false;

		for "_i" from 0 to 1 step 0 do {
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};

			sleep 0.5;
			_cP = _cP + 0.01;
			_progressBar progressSetPosition _cP;
			_titleText ctrlSetText format["Lockpick bracelet (%1%2)...",round(_cP * 100),"%"];

			if(_cP >= 1 OR !alive player) exitWith {};
			if(life_istazed) exitWith {detach _3dlock;	deletevehicle _3dlock;}; //Tazed
			if(life_isknocked) exitWith {detach _3dlock;	deletevehicle _3dlock;}; //Knocked
			if(life_interrupted) exitWith {detach _3dlock;	deletevehicle _3dlock;};
			if([player] call ALF_fnc_checkMenotter) exitWith {detach _3dlock;	deletevehicle _3dlock;};
			if(player distance _unit > 3) exitWith {_badDistance = true; detach _3dlock;	deletevehicle _3dlock;};
			if (isNull _unit) exitWith {detach _3dlock;	deletevehicle _3dlock;};
			if !("ALF_Lockpick" in (magazines player)) exitWith {detach _3dlock; deletevehicle _3dlock;};
		};

		//Kill the UI display and check for various states
		5 cutText ["","PLAIN"];
		player playActionNow "stop";

		if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
		if([player] call ALF_fnc_checkMenotter) exitWith {life_action_inUse = false;};
		if(_badDistance) exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if (isNull _unit) exitWith {life_action_inUse = false;};
		if !("ALF_Lockpick" in (magazines player)) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

		life_action_inUse = false;

		private _dice = random(1000);

		if(_dice <= 200) then {
			["INFO", "Tu as enlevé le bracelet électronique de ton collègue.", "success"] spawn ALF_fnc_doMsg;
			_array = missionNamespace getVariable ["ALF_AllBracelets",[]];
			_index = _array find _unit;
			if (_index > -1) then {
				_array set [_index, objNull];
				_array = _array - [objNull];
				missionNamespace setVariable ["ALF_AllBracelets",_array,true];
			};
			detach _3dlock;
			deletevehicle _3dlock;
			[_unit] remoteExecCall ["HC_fnc_enleverBracelet",HC_Life];
			_array = missionNamespace getVariable ["ALF_AllPositionBracelets",[]];
			_array pushBack [visiblePosition _unit,name _unit];
			missionNamespace setVariable ["ALF_AllPositionBracelets",_array,true];
			["Bracelet",format["Le signal de %1 vient d'être perdu. La dernière position est indiqué sur la carte.",name _unit]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
			[name player,getPlayerUID player,"Lockpick",format["A lockpick (WIN) le bracelet de %1.",name _unit]] remoteExec ["HC_fnc_logIt",HC3_Life];
		} else {
			["ALF_Lockpick",false] spawn life_fnc_handleItem;
			["INFO", "Tu n'as pas réussi à enlever le bracelet électronique de ton collègue !", "warning"] spawn ALF_fnc_doMsg;
			[name player,getPlayerUID player,"Lockpick",format["A lockpick (FAIL) le bracelet de %1.",name _unit]] remoteExec ["HC_fnc_logIt",HC3_Life];
			sleep 120;
			detach _3dlock;	deletevehicle _3dlock;
		};
	};

	//Enlever bracelet gendarmerie
	case 1: {
		if !(player canAdd "ALF_Bracelet") exitWith {["INFO", "Tu n'as pas asser de place pour récuprer le bracelet électronique !", "warning"] spawn ALF_fnc_doMsg;};
		["ALF_Bracelet",true] spawn life_fnc_handleItem;
		_array = missionNamespace getVariable ["ALF_AllBracelets",[]];
		_index = _array find _unit;
		if (_index > -1) then {
			_array deleteAt _index;
			missionNamespace setVariable ["ALF_AllBracelets",_array,true];
		};
		["INFO", "Tu as enlevé le bracelet électronique de la personne.", "success"] spawn ALF_fnc_doMsg;
		[_unit] remoteExecCall ["HC_fnc_enleverBracelet",HC_Life];

	};
};