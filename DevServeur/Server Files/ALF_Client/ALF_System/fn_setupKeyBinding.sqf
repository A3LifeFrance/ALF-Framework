/*
	File: fn_setupKeyBinding.sqf
	Author: ALF - NiiRoZz
*/

["Arma Life France","Repos_ALF", ["Repos","Touche pour se mettre au repos."], {
	if !(isNull objectParent player) exitWith {};
  	if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
	if (animationState player isEqualTo "Acts_JetsShooterIdle_stillpose_m") then {
		player playActionNow "gestureNod";
	} else {
		player playActionNow "Acts_JetsShooterIdle_stillpose";
	};
	true
}, {}, [1, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Pompe_ALF", ["Pompe","Touche pour faire des pompes."], {
	if !(isNull objectParent player) exitWith {};
  	if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if !(ALF_Animation) then {
    	[] spawn {
			ALF_Animation = true;
			player playMoveNow "AmovPercMstpSnonWnonDnon_exercisePushup";
			waitUntil {!(animationState player isEqualTo "AmovPercMstpSnonWnonDnon_exercisePushup")};
			ALF_Animation = false;
    	};
  	};
	true
}, {}, [2, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Flexion_lente_ALF", ["Flexion lente","Touche pour faire des flexions lentes."], {
	if !(isNull objectParent player) exitWith {};
    if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if !(ALF_Animation) then {
 		[] spawn {
			ALF_Animation = true;
			player playMoveNow "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
			waitUntil {!(animationState player isEqualTo "AmovPercMstpSnonWnonDnon_exercisekneeBendA")};
			ALF_Animation = false;
    	};
  	};
	true
}, {}, [3, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Flexion_rapide_ALF", ["Flexion rapide","Touche pour faire des flexions rapides."], {
	if !(isNull objectParent player) exitWith {};
    if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if !(ALF_Animation) then {
    	[] spawn {
			ALF_Animation = true;
			player playMoveNow "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
			waitUntil {!(animationState player isEqualTo "AmovPercMstpSnonWnonDnon_exercisekneeBendB")};
			ALF_Animation = false;
    	};
  	};
	true
}, {}, [4, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Dab_ALF", ["Dab","Touche pour faire un dab."], {
	if !(isNull objectParent player) exitWith {};
    if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if !(ALF_Animation) then {
    	[] spawn {
			ALF_Animation = true;
			player playActionNow "ALF_Dab";
    	};
  	};
	true
}, {
	if !(isNull objectParent player) exitWith {};
    if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if (ALF_Animation) then {
    	[] spawn {
			player playActionNow "gestureNod";
			[{player playActionNow "gestureNod";}] call CBA_fnc_execNextFrame;
			ALF_Animation = false;
    	};
  	};
	true
}, [5, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Fuck_ALF", ["Fuck","Touche pour faire un doigt d'honneur."], {
	if !(isNull objectParent player) exitWith {};
    if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if !(ALF_Animation) then {
    	[] spawn {
			ALF_Animation = true;
			player playActionNow "ALF_Fuck";
    	};
  	};
	true
}, {
	if !(isNull objectParent player) exitWith {};
    if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if (ALF_Animation) then {
    	[] spawn {
			player playActionNow "gestureNod";
			[{player playActionNow "gestureNod";}] call CBA_fnc_execNextFrame;
			ALF_Animation = false;
    	};
  	};
	true
}, [6, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Bras_ALF", ["Bras Croisés","Touche pour croiser ses bras."], {
	if !(isNull objectParent player) exitWith {};
    if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if (ALF_Animation) then {
		[] spawn {
			player switchMove "Acts_AidlPercMstpSnonWnonDnon_warmup_8_out";
			ALF_Animation = false;
    	};
  	} else {
		[] spawn {
			ALF_Animation = true;
			player switchMove "Acts_AidlPercMstpSnonWnonDnon_warmup_8";
    	};
	};
	true
}, {}, [7, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Bras2_ALF", ["Bras sur le côté","Touche pour mettre ses bras sur son bassin."], {
	if !(isNull objectParent player) exitWith {};
    if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if (ALF_Animation) then {
		[] spawn {
			player switchMove "Acts_AidlPercMstpSnonWnonDnon_warmup_1_out";
			ALF_Animation = false;
    	};
  	} else {
		[] spawn {
			ALF_Animation = true;
			player switchMove "Acts_AidlPercMstpSnonWnonDnon_warmup_1";
    	};
	};
	true
}, {}, [8, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Dance_ALF", ["Dance","Touche pour dancer."], {
	if !(isNull objectParent player) exitWith {};
  	if (life_action_inUse || {life_istazed} || {ALF_ActivePrisePistolet} || {ALF_Phone_tryCall} || {ALF_Phone_inCall} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender} || {animationState player isEqualTo "crew"} || {lifeState player isEqualTo "INCAPACITATED"} || {!alive player} || {player getVariable ["ReviveMedic",false]}) exitWith {};
  	if (time - life_action_delay < 1.5) exitWith {true};
	life_action_delay = time;
	if !(ALF_Animation) then {
		ALF_Animation = true;
		[player, selectRandom["Acts_Dance_01","Acts_Dance_02"]] remoteExec ["switchMove", 0];
  	} else {
		ALF_Animation = false;
		[player, ""] remoteExec ["switchMove", 0];
	};
	true
}, {}, [9, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Menotter_ALF", ["Menotter","Touche pour menotter une personne."], {
	private _handle = false;
	if (!isNull cursorObject && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {alive cursorObject} && {cursorObject distance player < 2} && {!([cursorObject] call ALF_fnc_checkMenotter)} && {speed cursorObject < 1}) then {
		_handle = true;
		if("ALF_Menottes" in (magazines player)) then {
			[] call ALF_fnc_restrainAction;
		} else {
			if("ALF_ZipTies" in (magazines player)) then {
				[] call ALF_fnc_restrain2Action;
			} else {
				["INFO", "Tu n'as pas de menottes.", "warning"] spawn ALF_fnc_doMsg;
			};
		};
	};
	_handle
}, {}, [19, [true, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Menu_Interaction_ALF", ["Menu Interaction","Touche pour ouvrir un menu avec des interactions."], {
	if !(life_action_inUse) then {
		[] spawn  {
			private _handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {sleep 0.1; scriptDone _handle};
			life_action_inUse = false;
		};
	};
}, {}, [219, [false, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Assommer_ALF", ["Assommer","Touche pour assommer une personne."], {
	private _handle = false;
	if (!isNull cursorObject && {cursorObject isKindOf "Man"} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject distance player < 4} && {speed cursorObject < 1}) then {
		if((animationState cursorObject) != "Incapacitated" && {(currentWeapon player isEqualTo primaryWeapon player OR currentWeapon player isEqualTo handgunWeapon player)} && {currentWeapon player != ""} && {!life_knockout} && {!([player] call ALF_fnc_checkMenotter)} && {!life_istazed} && {!life_isknocked}) then {
			[cursorObject] spawn life_fnc_knockoutAction;
			_handle = true;
		};
	};
	_handle
}, {}, [34, [true, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Radar_ALF", ["Radar","Touche pour afficher le radar."], {
	if((currentWeapon player) isEqualTo "ALF_Rangefinder") then {
		[] call life_fnc_radar;
	};
}, {}, [38, [false, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Telephone_ALF", ["Telephone","Touche pour afficher le telephone."], {
	if(!dialog && {!([player] call ALF_fnc_checkMenotter)} && {!life_action_inUse} && {!([player] call ALF_fnc_checkSurrender)}) then {
		private _radio = call TFAR_fnc_activeSwRadio;
		switch (true) do {
			case ([_radio,"alf_3310_1"] call TFAR_fnc_isSameRadio): {
				if (currentWeapon player isEqualTo "") then {
					[] spawn ALF_fnc_menuNokia;
				} else {
					["Telephone", "Tu as les mains encombrés.", "danger", false] spawn ALF_fnc_doMsg;
				};
			};
			case ([_radio,"alf_iphone_1"] call TFAR_fnc_isSameRadio): {
				if (currentWeapon player isEqualTo "") then {
					[] spawn ALF_fnc_menuiPhone;
				} else {
					["Telephone", "Tu as les mains encombrés.", "danger", false] spawn ALF_fnc_doMsg;
				};
			};
			case ([_radio,"alf_neogend_1"] call TFAR_fnc_isSameRadio): {
				[] spawn ALF_fnc_menuSony;
			};
			case ([_radio,"alf_sony_1"] call TFAR_fnc_isSameRadio): {
				[] spawn ALF_fnc_menuSonyP;
			};
		};
	};
}, {}, [21, [true, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Menu_General_ALF", ["Menu General (aka Y)","Touche pour afficher le menu."], {
	private _handle = false;
	if(!dialog && {!([player] call ALF_fnc_checkMenotter)} && {!life_action_inUse}) then {
		[] call ALF_fnc_menuY;
		_handle = true;
	};
	_handle
}, {}, [21, [false, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Prise_Commandement", ["Prise Commandement GN","Touche pour prendre/laisser le commandement."], {
	private _handle = false;
	if(life_gendarme_service && {time - life_action_delay > 5}) then {
		life_action_delay = time;
		if (alf_gendarmerie_command) then {
			alf_gendarmerie_command = false;
			["COG", "Tu as quitté le commandement.", "success"] spawn ALF_fnc_doMsg;
			[false, player] remoteExecCall ["HC_fnc_switchCommand", HC_Life];
		} else {
			[true, player] remoteExecCall ["HC_fnc_switchCommand", HC_Life];
		};
		_handle = true;
	};
	_handle
}, {}, [38, [true, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Sirenne_vehicule_ALF", ["Sirenne vehicule","Touche pour activer/desactiver les sirennes de votre vehicule."], {
	private _handle = false;
	if(vehicle player != player && {life_copLevel > 0 || {life_medicLevel > 0} || {life_penit > 0 && {typeOf (vehicle player) in ["V_ALF_Vito_Penit","V_ALF_Berlingo_Penit"]}}} && {(driver vehicle player) isEqualTo player}) then {
		_handle = true;
		private _veh = vehicle player;
		if (({typeOf _x isEqualTo "#dynamicsound"} count (attachedObjects _veh)) > 0) then {
			{
				if ((typeOf _x) isEqualTo "#dynamicsound") exitWith {
					detach _x;
					deleteVehicle _x;
				};
			} forEach (attachedObjects _veh);
		} else {
			if(life_copLevel > 0) then {
				private _sound = createSoundSource ["ALFSirenLong", position player, [], 0];
				_sound attachTo [_veh];
			} else {
				if (life_medicLevel > 0) then {
					private _sound = createSoundSource ["ALFmedicSiren", position player, [], 0];
					_sound attachTo [_veh];
				} else {
					private _sound = createSoundSource ["ALFpenitSiren", position player, [], 0];
					_sound attachTo [_veh];
				};
			};
		};
	};
	_handle
}, {}, [33, [false, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Deverouiller_vehiculemaison_ALF", ["Deverouiller vehicule/maison","Touche pour ouvrir/fermer votre vehicule/maison."], {
	private "_veh";
	if(isNull objectParent player) then {
		_veh = cursorObject;
	} else {
		_veh = vehicle player;
	};

	if(_veh isKindOf "House_F") then {
		if((typeOf _veh) isEqualTo "Land_ALF_Entreprise") then {
			private _var = _veh getVariable ["business",[]];
			if(count _var isEqualTo 0) exitWith {};
			private _uid = getPlayerUID player;
			private _exit = false;
			{
				private _memberuid = _x select 1;
				if(_memberuid isEqualTo _uid) exitWith {_exit = true;};
			} forEach (_var select 5);
			if !(_exit) exitWith {};

			private _locked = _veh getVariable ["ALF_PorteFermer",false];

			if (_locked) then {
				_veh setVariable ["ALF_PorteFermer",false,true];
				["Entreprise", "Vous venez d'ouvrir votre entreprise","success",false] spawn ALF_fnc_doMsg;
			} else {
				_veh setVariable ["ALF_PorteFermer",true,true];
				["Entreprise", "Vous venez de fermer votre entreprise","success",false] spawn ALF_fnc_doMsg;
			};
		} else {
			if((typeOf _veh) isEqualTo "Land_MilOffices_V1_F") then {
				if !(license_sr && ((_veh distance2D [6914,8482,0]) < 50)) exitWith {};

				private _locked = _veh getVariable ["ALF_PorteFermer",false];

				if (_locked) then {
					_veh setVariable ["ALF_PorteFermer",false,true];
					["Locaux", "Vous venez d'ouvrir votre local","success",false] spawn ALF_fnc_doMsg;
				} else {
					_veh setVariable ["ALF_PorteFermer",true,true];
					["Locaux", "Vous venez de fermer votre local","success",false] spawn ALF_fnc_doMsg;
				};
			} else {
				if(_veh in life_vehicles) then {
					private _locked = _veh getVariable ["ALF_PorteFermer",false];

					if (_locked) then {
						_veh setVariable ["ALF_PorteFermer",false,true];
						["Maison", "Vous venez d'ouvrir votre maison","success",false] spawn ALF_fnc_doMsg;
					} else {
						_veh setVariable ["ALF_PorteFermer",true,true];
						["Maison", "Vous venez de fermer votre maison","success",false] spawn ALF_fnc_doMsg;
					};
				};
			};
		};
	} else {
		if(_veh in life_vehicles && {(player distance _veh < 9) || (_veh isKindOf "Boat" && (player distance _veh < 12))}) then {
			private _locked = locked _veh;
			if (_locked isEqualTo 2) then {
				if(local _veh) then {
					_veh lock 0;
				} else {
					[_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];
				};
				playSound3D ["ALF_Client2\sounds\unlock.ogg", _veh, false, getPosASL _veh, 3, 1, 10];
			} else {
				if(local _veh) then {
					_veh lock 2;
				} else {
					[_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];
				};
				playSound3D ["ALF_Client2\sounds\car_lock.ogg", _veh, false, getPosASL _veh, 3, 1, 10];
			};
		};
	};
}, {}, [22, [false, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Casque_antibruit_ALF", ["Casque anti-bruit","Touche pour activer/desactiver votre casque anti-bruit."], {
	[] call ALF_fnc_fadeSound;
	true
}, {}, [36, [true, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Main_tete_ALF", ["Main sur la tête","Touche pour mettre/enlever vos mains sur la tête."], {
	if([player] call ALF_fnc_checkSurrender) then {
		player playActionNow "gestureNod";
		_array = player getVariable ["ALF_MenotterSurrender",[false,false]];
		_array set [1,false];
		player setVariable ["ALF_MenotterSurrender",_array,true];
		[] spawn {
			sleep 2;
			player forceWalk false;
		};
	} else {
		[] spawn life_fnc_surrender;
	};
	true
}, {}, [48, [true, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Activer_orateur_vehicule_ALF", ["Activer/Desactiver orateur sur le vehicule","Touche pour activer/desativer l'orateur sur votre voiture."], {
	if (vehicle player != player && {typeOf (vehicle player) in ["V_ALF_EC135_Gendarmerie","ALF_Stinger_GND","V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_Berlingo_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_DV15_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Passat_GND","V_ALF_Raptor_Gendarmerie","V_ALF_SVR_G"]}) then {
		[] call ALF_fnc_setVehSpeaker;
	};
}, {}, [21, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Activer_radio_aerienne_ALF", ["Activer/Desactiver la radio aerienne","Touche pour activer/desativer la radio aerienne."], {
	if ((vehicle player) isKindOf "Air") then {
		[] call ALF_fnc_setAirRadio;
	};
}, {}, [33, [true, false, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Afficher_GPS_ALF", ["Afficher le GPS","Touche pour afficher le GPS."], {
	private _handled = false;
	if ((missionNamespace getVariable ["mav_gps_v_dialog_handlerBlockedUntil", 0]) > diag_tickTime) exitWith {true};
	missionNamespace setVariable ["mav_gps_v_dialog_handlerBlockedUntil", diag_tickTime];

	if (!dialog && {!_handled} && {"ALF_GPS" in ((items player) + (assignedItems player))}) then {
		_handled = true;
		[] call mav_gps_fnc_initNavigation;
	};
	_handled
}, {}, [49, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","CoupPoing", ["Coup de poing","Mettre un coup de poing."], {
	if (time - life_action_delay < 1.5) exitWith {true};
	life_action_delay = time;

	if (!dialog && (player isEqualTo (vehicle player))) then {
		[cursorTarget] spawn ALF_fnc_combat;
	};
	_handled
}, {}, [54, [false, true, false]]] call CBA_fnc_addKeybind;

["Arma Life France","Sifflet", ["Sifflet","Siffler."], {
	if (time - life_action_delay < 2) exitWith {true};

	if (player isEqualTo (vehicle player) && {"ALF_sifflet" in (magazines player)}) then {
		life_action_delay = time;
		[player,"ALF_Sifflet"] remoteExecCall ["life_fnc_say3D",0];
		player setFatigue ((getFatigue player) + 0.05);
	};
	_handled
}, {}, [55, [false, true, false]]] call CBA_fnc_addKeybind;
