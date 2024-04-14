#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
params [
	["_display",displayNull,[displayNull]],
	["_code",-1,[0]],
	["_shift",false,[false]],
	["_ctrlKey",false,[false]],
	["_alt",false,[false]]
];
private _handled = false;

//Vault handling...
if((_code in (actionKeys "GetOver") || {_code in (actionKeys "salute")} || {_code in (actionKeys "SitDown")} || {_code in (actionKeys "Throw")} || {_code in (actionKeys "GetIn")} || {_code in (actionKeys "GetOut")} || {_code in (actionKeys "Fire")} || {_code in (actionKeys "ReloadMagazine")} || {_code in [16,18]}) && {([player] call ALF_fnc_checkMenotter || {[player] call ALF_fnc_checkSurrender} || {life_isknocked} || {life_istazed})}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if (!life_interrupted && {_code in [17,30,31,32]}) then {
		life_interrupted = true;
	};
	false
};

if (ALF_placeBoisDIR) exitWith {
	if (_code isEqualTo 57) then {
		_handled = true;
		detach ALF_boisActive;
		ALF_boisActive setVectorUp (surfaceNormal (position ALF_boisActive));
		private _setPos = {
			params ["_obj", "_pos"];
			_wh_pos = getPosASL _obj;

			_pos set [2, (ATLtoASL _pos select 2)-10];
			_ins = lineIntersectsSurfaces [_wh_pos,_pos,_obj,objNull,true,1,"VIEW","FIRE"];
			_surface_distance = if (count _ins > 0) then [{(_ins select 0 select 0) distance _wh_pos},{0}];
			_wh_pos set [2, (getPosASL _obj select 2) - (_surface_distance)];
			_obj setPosASL _wh_pos;
		};
		[ALF_boisActive,(getPosATL ALF_boisActive)] call _setPos;
		ALF_boisActive = objNull;
		ALF_placeBoisDIR = false;
	};
	_handled
};

if (typeOf(vehicle player) isEqualTo "Land_ALF_Poker_P") exitWith {
	//fleche UP
	if (_ctrlKey && {b_0} && {_code isEqualTo 38} && {alive player} && {!(player getVariable ["ReviveMedic",false])} && {(animationState player) isEqualTo "crew"}) then {
		_handled = true;
		[0] spawn ALF_fnc_playPoker;
	};
	_handled
};

if (ALF_PoserPerceuseActive) exitWith {
	switch (_code) do {
		//esc key
		case 1: {
			_handled = true;
			if !(player canAdd "ALF_Perceuse_GDM_M") exitWith {["Perceuse", "Tu ne peux pas remettre la perceuse dans ton inventaire", "danger"] spawn ALF_fnc_doMsg;};
			deleteVehicle ALF_PoserChargeObject;
			ALF_PoserChargeObject = objNull;
			removeMissionEventHandler ["EachFrame",ALF_EventHandlerPoserCharge];
			ALF_EventHandlerPoserCharge = -1;
			["ALF_Perceuse_GDM_M",true] spawn life_fnc_handleItem;
			ALF_PoserPerceuseActive = false;
		};

		//space key
		case 57: {
			_handled = true;
			if (isSimpleObject ALF_PoserChargeHouse && {!(((getModelInfo _curObject) select 1) isEqualTo "alf_mobiliers\alf_safe_1\alf_safe_1.p3d")}) exitWith {["Perceuse", "Vous devez placer une perceuse sur un coffre.", "danger"] spawn ALF_fnc_doMsg;};
			
			[] spawn {
				removeMissionEventHandler ["EachFrame",ALF_EventHandlerPoserCharge];
				ALF_EventHandlerPoserCharge = -1;
				ALF_PoserPerceuseActive = false;
				life_action_inUse = true;
				private _upp = "Utilisation de la perceuse";
				//Setup our progress bar.
				disableSerialization;
				5 cutRsc ["life_progress","PLAIN"];
				private _ui = uiNameSpace getVariable "life_progress";
				private _progress = _ui displayCtrl 38201;
				private _pgText = _ui displayCtrl 38202;
				_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
				_progress progressSetPosition 0.01;
				private _cP = 0.01;

				for "_i" from 0 to 1 step 0 do {
					if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
						player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
						player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
					};
					sleep 0.3;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
					if(_cP >= 1) exitWith {};
					if(!alive player) exitWith {};
					if(life_interrupted) exitWith {};
					if(life_istazed) exitWith {};
				};
				life_action_inUse = false;
				deleteVehicle ALF_PoserChargeObject;
				if(!alive player) exitWith {};
				if(life_interrupted) exitWith {life_interrupted = false; ["INFO", "Action annulée.", "danger"] spawn ALF_fnc_doMsg;};
				if(life_istazed) exitWith {};
				5 cutText ["","PLAIN"];
				player playActionNow "stop";
				player switchMove "";

				ALF_PoserChargeObject = objNull;
				ALF_PoserChargeHouse setVariable ["perced",true,true];
				ALF_PoserChargeHouse = objNull;
			};
		};
	};
	_handled
};

if (ALF_PoserChargeActive) exitWith {
	switch (_code) do {
		//esc key
		case 1: {
			_handled = true;
			if !(player canAdd "ALF_Charge_C2_M") exitWith {["Poser Charger", "Tu ne peux pas remettre ta charge dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
			deleteVehicle ALF_PoserChargeObject;
			ALF_PoserChargeObject = objNull;
			removeMissionEventHandler ["EachFrame",ALF_EventHandlerPoserCharge];
			ALF_EventHandlerPoserCharge = -1;
			["ALF_Charge_C2_M",true] spawn life_fnc_handleItem;
			ALF_PoserChargeActive = false;
		};

		//space key
		case 57: {
			_handled = true;
			if (isNull ALF_PoserChargeHouse || {!(ALF_PoserChargeHouse isKindOf "House")}) exitWith {["Poser Charger", "Vous devez placer une charge sur une maison", "danger", false] spawn ALF_fnc_doMsg;};
			private _door = [ALF_PoserChargeHouse,(ASLToAGL (getPosASL ALF_PoserChargeObject))] call life_fnc_nearestDoor;
			if (_door isEqualTo 0) exitWith {["Poser Charger", "La bombe n'est pas proche d'une porte", "danger", false] spawn ALF_fnc_doMsg;};
			private _locked = ALF_PoserChargeHouse getVariable ["ALF_PorteFermer",false];
			if !(_locked) exitWith {["Poser Charger", "La porte est déja déverouiller", "danger", false] spawn ALF_fnc_doMsg;};
			[_door] spawn {
				params [
					["_door",0,[0]]
				];
				removeMissionEventHandler ["EachFrame",ALF_EventHandlerPoserCharge];
				ALF_EventHandlerPoserCharge = -1;
				ALF_PoserChargeActive = false;
				private _pos = (getPosASL ALF_PoserChargeObject);

				private _bomb = "mini_Grenade" createVehicle [0,0,0];
				_bomb setPosASL _pos;

				private _sound = createSoundSource ["ALFC2GIGN", position ALF_PoserChargeObject, [], 0];
				_sound attachTo [ALF_PoserChargeObject];

				uiSleep 5;
				detach _sound;
				deleteVehicle _sound;
				deleteVehicle ALF_PoserChargeObject;

				ALF_PoserChargeObject = objNull;
				ALF_PoserChargeHouse animateSource [format ["Door_%1_sound_source",_door],1];
				ALF_PoserChargeHouse = objNull;
			};
		};
	};
	_handled
};

if (ALF_PoserViandeActive) exitWith {
	switch (_code) do {
		//esc key
		case 1: {
			_handled = true;
			private _item = missionNamespace getVariable ["ALF_PoserItemViande",""];

			if (_item isEqualTo "") exitWith {};
			if !(player canAdd _item) exitWith {["Poser Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
			deleteVehicle ALF_PoserViandeObject;
			ALF_PoserViandeObject = objNull;
			removeMissionEventHandler ["EachFrame",ALF_EventHandlerPoserViande];
			ALF_EventHandlerPoserViande = -1;
			[_item,true] spawn life_fnc_handleItem;
			missionNamespace setVariable ["ALF_PoserItemViande",""];
			ALF_PoserViandeActive = false;
		};

		//space key
		case 57: {
			_handled = true;
			if (isNull ALF_PoserViandeBBQ || {!(ALF_PoserViandeBBQ isKindOf "Land_ALF_bbq")}) exitWith {["Poser Viande", "Vous devez placer la viande sur un barbercue", "danger", false] spawn ALF_fnc_doMsg;};
			removeMissionEventHandler ["EachFrame",ALF_EventHandlerPoserViande];
			ALF_EventHandlerPoserViande = -1;
			ALF_PoserViandeActive = false;
			[ALF_PoserViandeObject,ALF_PoserViandeBBQ] remoteExec ["HC_fnc_cuireViande",HC3_Life];
			ALF_PoserViandeObject = objNull;
			ALF_PoserViandeBBQ = objNull;
		};
	};
	_handled
};

if (life_mobilier_active) exitWith {
	switch (_code) do {
		//space key
		case 57: {
			[] spawn life_fnc_placeMobilierAction;
			_handled = true;
		};
		//FLECHE UP
		case 200: {
			if(life_mobilier_activeObj isEqualTo objNull) exitWith {};
			private _mobilier = life_mobilier_activeObj;
			private _pos = getPosWorld _mobilier;
			if(_shift) then {
				_mobilier setPosWorld (_pos vectorAdd [0,0,0.01]);
			} else {
				_mobilier setPosWorld (_pos vectorAdd [0,0.05,0]);
			};
			_handled = true;
		};
		//FLECHE DOWN
		case 208: {
			if(life_mobilier_activeObj isEqualTo objNull) exitWith {};
			private _mobilier = life_mobilier_activeObj;
			private _pos = getPosWorld _mobilier;
			if(_shift) then {
				_mobilier setPosWorld (_pos vectorAdd [0,0,-0.01]);
			} else {
				_mobilier setPosWorld (_pos vectorAdd [0,-0.05,0]);
			};
			_handled = true;
		};
		//FLECHE LEFT
		case 203: {
			if(life_mobilier_activeObj isEqualTo objNull) exitWith {};
			private _mobilier = life_mobilier_activeObj;
			private _pos = getPosWorld _mobilier;
			_mobilier setPosWorld (_pos vectorAdd [0.05,0,0]);
			_handled = true;
		};
		//FLECHE RIGHT
		case 205: {
			if(life_mobilier_activeObj isEqualTo objNull) exitWith {};
			private _mobilier = life_mobilier_activeObj;
			private _pos = getPosWorld _mobilier;
			_mobilier setPosWorld (_pos vectorAdd [-0.05,0,0]);
			_handled = true;
		};
	};
	_handled
};

switch (_code) do {
	//S
	case 31: {
		_vehicle = (vehicle player);
		if((driver _vehicle) isEqualTo player && {(typeOf _vehicle) in ["V_ALF_Kx","V_ALF_Diavel","V_ALF_Supermoto","V_ALF_Ninja","V_ALF_1100R"]}) then {
			if (_vehicle animationSourcePhase "Y_on" >= 0.5) then {
				_handled = true;
				_vehicle animateSource ["Y_on",0];
			};
		};
	};

	//G
	case 34: {
		_vehicle = (vehicle player);
		if((driver _vehicle) isEqualTo player && {(typeOf _vehicle) in ["V_ALF_Kx","V_ALF_Diavel","V_ALF_Supermoto","V_ALF_Ninja","V_ALF_1100R"]}) then {

			if (_vehicle animationSourcePhase "Y_on" >= 0.9) then {
				_vehicle animateSource ["Y_on",0];
				_handled = true;
			} else {
				if (speed _vehicle > 20) then {
					_handled = true;
					_vehicle animateSource ["Y_on",1];
					[_vehicle] spawn {
						params [
							["_vehicle",objNull,[objNull]]
						];

						private _time = time;

						waitUntil {(_vehicle animationSourcePhase "Y_on" < 0.5 && {(time - _time) >= 0.375}) || {(speed _vehicle) <= 20} || {!(alive _vehicle)}};

						if ((speed _vehicle <= 20 && {_vehicle animationSourcePhase "Y_on" >= 0.5} && {alive _vehicle}) || {!(alive _vehicle) && {_vehicle animationSourcePhase "Y_on" >= 0.5}}) then {
							_vehicle animateSource ["Y_on",0];
						};
					};
				};
			};
		};
	};

	//H
	case 35: {
		if(_shift && {!_ctrlKey} && {!(currentWeapon player isEqualTo "")}) then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};

		if(!_shift && {_ctrlKey} && {!isNil "life_curWep_h"} && {!(life_curWep_h isEqualTo "")} && {!ALF_Phone_inCall}) then {
			if (ALF_Phone_tryCall || {ALF_Phone_inCall} || {ALF_Phone_Ring} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender}) exitWith {};
			if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
				player selectWeapon life_curWep_h;
				life_curWep_h = "";
			};
		};

		if(!_shift && {!_ctrlKey} && {"ALF_Herse_i" in (magazines player)} && {(vehicle player) isEqualTo player}) then {
			["ALF_Herse_i"] spawn life_fnc_spikeStrip;
		};
	};
};

_handled
