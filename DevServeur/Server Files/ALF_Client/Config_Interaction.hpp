/*
	Les arrays dans l'array Interactions sont egale à
	{Memory ou Position,Texte,Icon,Distance,Condition,Script a call}
*/
class ALF_CfgInteraction3D {
	class Man {
		Interactions[] = {
			//Voler Argent + fouille Anal pour criminel
			{{0,0,1.65},"Voler Argent","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3.5,"_object = (_this select 0); !isNull _object && {_object isKindOf ""Man""} && {(isPlayer _object)} && {alive _object} && {_object distance player < 2} && {[_object] call ALF_fnc_checkMenotter} && {speed _object < 1} && {life_coplevel isEqualTo 0} && {(currentWeapon player isEqualTo primaryWeapon player OR currentWeapon player isEqualTo handgunWeapon player)} && {currentWeapon player != """"}","[0,_target] spawn ALF_fnc_volerArgent;"},
			{{0,0,1.5},"Fouille Anal","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3.5,"_object = (_this select 0); !isNull _object && {_object isKindOf ""Man""} && {(isPlayer _object)} && {alive _object} && {_object distance player < 2} && {[_object] call ALF_fnc_checkMenotter} && {speed _object < 1} && {life_coplevel isEqualTo 0} && {(currentWeapon player isEqualTo primaryWeapon player OR currentWeapon player isEqualTo handgunWeapon player)} && {currentWeapon player != """"}","[_target] spawn ALF_fnc_fouilleAnal;"}
		};
	};

	class Car_F {
		Interactions[] = {
			//Coffre + Capot + Porte
			{"door_1","Ouvrir Coffre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_1_Source"") isEqualTo 0}","_target animateSource [""Door_1_Source"", 1];"},
			{"door_2","Ouvrir Capot","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_2_Source"") isEqualTo 0}","_target animateSource [""Door_2_Source"", 1];"},
			{"door_1","Fermer Coffre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_1_Source"") > 0.5}","_target animateSource [""Door_1_Source"", 0];"},
			{"door_2","Fermer Capot","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_2_Source"") > 0.5}","_target animateSource [""Door_2_Source"", 0];"},
			{"door_50","Ouvrir Coffre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_50_Source"") isEqualTo 0}","_target animateSource [""Door_50_Source"", 1];"},
			{"door_50","Fermer Coffre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_50_Source"") > 0.5}","_target animateSource [""Door_50_Source"", 0];"},
			{"door_51","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_51_Source"") isEqualTo 0}","_target animateSource [""Door_51_Source"", 1];"},
			{"door_51","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_51_Source"") > 0.5}","_target animateSource [""Door_51_Source"", 0];"},
			{"door_52","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_52_Source"") isEqualTo 0}","_target animateSource [""Door_52_Source"", 1];"},
			{"door_52","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_52_Source"") > 0.5}","_target animateSource [""Door_52_Source"", 0];"},
			{"conducteur","Monter Conducteur","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))} && {driver _veh isEqualTo objNull}","player action [""getInDriver"", _target];"},
			{"passager_1","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"passager_2","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"passager_3","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"passager_4","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"essence_1","Poser le pistolet","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.75,"ALF_ActivePrisePistolet && {({typeOf _x isEqualTo ""ALF_Pistolet_Essence""} count (attachedObjects (_this select 0))) isEqualTo 0} && {alive (_this select 0)} && {(vehicle player) isEqualTo player} && {(locked (_this select 0)) <= 1}","[0,_target,""essence_1""] spawn ALF_fnc_pistoletVehicule"},
			{"essence_2","Poser le pistolet","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.75,"ALF_ActivePrisePistolet && {({typeOf _x isEqualTo ""ALF_Pistolet_Essence""} count (attachedObjects (_this select 0))) isEqualTo 0} && {alive (_this select 0)} && {(vehicle player) isEqualTo player} && {(locked (_this select 0)) <= 1}","[0,_target,""essence_2""] spawn ALF_fnc_pistoletVehicule"},
			{"essence_1","Prendre le pistolet","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.75,"!ALF_ActivePrisePistolet && {({typeOf _x isEqualTo ""ALF_Pistolet_Essence""} count (attachedObjects (_this select 0))) > 0} && {alive (_this select 0)} && {(vehicle player) isEqualTo player} && {(locked (_this select 0)) <= 1}","[1,_target] spawn ALF_fnc_pistoletVehicule"},
			{"essence_2","Prendre le pistolet","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.75,"!ALF_ActivePrisePistolet && {({typeOf _x isEqualTo ""ALF_Pistolet_Essence""} count (attachedObjects (_this select 0))) > 0} && {alive (_this select 0)} && {(vehicle player) isEqualTo player} && {(locked (_this select 0)) <= 1}","[1,_target] spawn ALF_fnc_pistoletVehicule"}
		};
	};

	class Ship {
		Interactions[] = {
			//Porte
			{"conducteur","Monter Conducteur","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))} && {driver _veh isEqualTo objNull}","player action [""getInDriver"", _target];"},
			{"passager_1","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"passager_2","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"passager_3","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"}
		};
	};

	class Air {
		Interactions[] = {
			//Porte
			{"passager_1","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",4.25,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"passager_2","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",4.25,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"passager_3","Monter Passager","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",4.25,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {!(_veh in (missionNamespace getVariable [""VehiculeImmobiliser"",[]]))}","player action [""getInCargo"", _target];"},
			{"door_1","Ouvrir Coffre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_1_Source"") isEqualTo 0}","_target animateSource [""Door_1_Source"", 1];"},
			{"door_2","Ouvrir Coffre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_2_Source"") isEqualTo 0}","_target animateSource [""Door_2_Source"", 1];"},
			{"door_1","Fermer Coffre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_1_Source"") > 0.5}","_target animateSource [""Door_1_Source"", 0];"},
			{"door_2","Fermer Coffre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(locked _veh) <= 1} && {(_veh animationSourcePhase ""Door_2_Source"") > 0.5}","_target animateSource [""Door_2_Source"", 0];"}
		};
	};

	class Land_fonte {
		Interactions[] = {
			{{-0.483398,0.21582,-0.33448},"Fondre le cuivre","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.95,"_object = (_this select 0);(vehicle player) isEqualTo player && {({_x isEqualTo ""ALF_Pierre_cui_small""} count (magazines player)) > 0} && {_object animationPhase ""end"" isEqualTo 0} && {_object animationPhase ""door"" isEqualTo 0}","if(!isNull (findDisplay 602)) then {closeDialog 602};[player,_target] remoteExec [""HC_fnc_fonderieCuivre"",HC3_Life];"}
		};
	};

	class Land_fonte_2 {
		Interactions[] = {
			{{-0.483398,0.21582,-0.33448},"Fondre le fer","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.95,"_object = (_this select 0);(vehicle player) isEqualTo player && {alf_niv_minage > 1} && {({_x isEqualTo ""ALF_pierre_fer_small""} count (magazines player)) > 0} && {_object animationPhase ""end"" isEqualTo 0} && {_object animationPhase ""door"" isEqualTo 0}","if(!isNull (findDisplay 602)) then {closeDialog 602};[player,_target] remoteExec [""HC_fnc_fonderieFer"",HC3_Life];"}
		};
	};

	class Land_ALF_Pompe {
		Interactions[] = {
			{"prendre_pistolet_1","Prendre le pistolet","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.75,"(vehicle player) isEqualTo player && {((_this select 0) animationSourcePhase ""pistolet_1_source"") isEqualTo 0} && {!ALF_ActivePrisePistolet}","[0,_target,""pistolet_1""] spawn ALF_fnc_pistoletEssence"},
			{"prendre_pistolet_2","Prendre le pistolet","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.75,"(vehicle player) isEqualTo player && {((_this select 0) animationSourcePhase ""pistolet_2_source"") isEqualTo 0} && {!ALF_ActivePrisePistolet}","[0,_target,""pistolet_2""] spawn ALF_fnc_pistoletEssence"},
			{"prendre_pistolet_1","Poser le pistolet","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.75,"private _ActivePistoletObj = objNull;{if ((typeOf _x) isEqualTo ""ALF_Pistolet_Essence"") exitWith {_ActivePistoletObj = _x;};} forEach (attachedObjects player);(vehicle player) isEqualTo player && {((_this select 0) animationSourcePhase ""pistolet_1_source"") isEqualTo 1} && {ALF_ActivePrisePistolet} && {(_ActivePistoletObj getVariable [""ALF_ActivePompe"",objNull]) isEqualTo (_this select 0)} && {(_ActivePistoletObj getVariable [""ALF_ActivePistolet"",""pistolet_2""]) isEqualTo ""pistolet_1""}","[1,_target,""pistolet_1""] spawn ALF_fnc_pistoletEssence"},
			{"prendre_pistolet_2","Poser le pistolet","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.75,"private _ActivePistoletObj = objNull;{if ((typeOf _x) isEqualTo ""ALF_Pistolet_Essence"") exitWith {_ActivePistoletObj = _x;};} forEach (attachedObjects player);(vehicle player) isEqualTo player && {((_this select 0) animationSourcePhase ""pistolet_2_source"") isEqualTo 1} && {ALF_ActivePrisePistolet} && {(_ActivePistoletObj getVariable [""ALF_ActivePompe"",objNull]) isEqualTo (_this select 0)} && {(_ActivePistoletObj getVariable [""ALF_ActivePistolet"",""pistolet_2""]) isEqualTo ""pistolet_2""}","[1,_target,""pistolet_2""] spawn ALF_fnc_pistoletEssence"}
		};
	};

	class V_ALF_Sprinter_DIR {
		Interactions[] = {
			{"reparer_objet","Reparer objet le plus proche","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.5,"b_18 && {alive (_this select 0)} && {(vehicle player) isEqualTo player} && {(locked (_this select 0)) <= 1}","[] spawn ALF_fnc_reparerObjet"}
		};
	};

	class V_ALF_Vito_DIR {
		Interactions[] = {
			{"reparer_objet","Reparer objet le plus proche","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.5,"b_18 && {alive (_this select 0)} && {(vehicle player) isEqualTo player} && {(locked (_this select 0)) <= 1}","[] spawn ALF_fnc_reparerObjet"}
		};
	};

	class Land_ALF_trico_1 {
		Interactions[] = {
			{"reparer_feu","Reparer le feu tricolore","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.5,"b_18 && {(vehicle player) isEqualTo player}","[_target] spawn ALF_fnc_reparerFeuTricolore"}
		};
	};

	class Land_ALF_trico_2 {
		Interactions[] = {
			{"reparer_feu","Reparer le feu tricolore","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.5,"b_18 && {(vehicle player) isEqualTo player}","[_target] spawn ALF_fnc_reparerFeuTricolore"}
		};
	};

	class woodpile_f {
		Interactions[] = {
			{{0,0,0},"Prendre les buches de bois","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"b_10 && {(vehicle player) isEqualTo player}","[_target] spawn ALF_fnc_recupBois"}
		};
	};

	class alf_tabac_4 {
		Interactions[] = {
			{{0,0,0},"Recuperer la plante","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"(vehicle player) isEqualTo player","[_target] spawn ALF_fnc_takeTabac"}
		};
	};

	class ALF_Camping_Chair {
		Interactions[] = {
			{"sassoir","S'assoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0}","player action [""getInCargo"", _target];"}
		};
	};

	class ALF_Brancard {
		Interactions[] = {
			{"plaque","S'allonger","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0}","player action [""getInCargo"", _target];"}
		};
	};
	
	class ALF_SlotMachine {
		Interactions[] = {
			{"jeton","Recupérer Stock","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2,"_veh = _this select 0; ((vehicle player) isEqualTo player) && b_20","[_target,player,0] remoteExecCall [""HC_fnc_getStock"",HC2_Life];"},
			{"gain","Récupérer gains","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2,"_veh = _this select 0; ((vehicle player) isEqualTo player) && {_veh animationPhase ""Piece"" isEqualTo 1}","[_target,player,1] remoteExecCall [""HC_fnc_getStock"",HC2_Life];"}
		};
	};

	class alf_poker {
		Interactions[] = {
			{"sassoir_1","S'asseoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {({(_x select 2) isEqualTo 0} count (fullCrew [_veh, ""cargo""])) isEqualTo 0}","player action [""getInCargo"", _target, 0];"},
			{"sassoir_2","S'asseoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {({(_x select 2) isEqualTo 1} count (fullCrew [_veh, ""cargo""])) isEqualTo 0}","player action [""getInCargo"", _target, 1];"},
			{"sassoir_3","S'asseoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {({(_x select 2) isEqualTo 2} count (fullCrew [_veh, ""cargo""])) isEqualTo 0}","player action [""getInCargo"", _target, 2];"},
			{"sassoir_4","S'asseoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {({(_x select 2) isEqualTo 3} count (fullCrew [_veh, ""cargo""])) isEqualTo 0}","player action [""getInCargo"", _target, 3];"},
			{"sassoir_5","S'asseoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {({(_x select 2) isEqualTo 4} count (fullCrew [_veh, ""cargo""])) isEqualTo 0}","player action [""getInCargo"", _target, 4];"},
			{"sassoir_6","S'asseoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {({(_x select 2) isEqualTo 5} count (fullCrew [_veh, ""cargo""])) isEqualTo 0}","player action [""getInCargo"", _target, 5];"},
			{"sassoir_7","S'asseoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {({(_x select 2) isEqualTo 6} count (fullCrew [_veh, ""cargo""])) isEqualTo 0}","player action [""getInCargo"", _target, 6];"},
			{"sassoir_8","S'asseoir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2.1,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {({(_x select 2) isEqualTo 7} count (fullCrew [_veh, ""cargo""])) isEqualTo 0}","player action [""getInCargo"", _target, 7];"}
		};
	};
	
	class ALF_Don_Sang {
		Interactions[] = {
			{"sallonger","S'allonger","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {(locked _veh) <= 1} && {({!((typeOf _x) in [""ALF_Iphone_Object"",""ALF_3310_Object"",""""])} count (attachedObjects player)) isEqualTo 0} && {(count (fullCrew [_veh, ""cargo"", false])) isEqualTo 0}","player action [""getInCargo"", _target];"},
			{"action1","Perfuser la personne","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.5,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {license_SAMU} && {(count (fullCrew [_veh, ""cargo"", false])) > 0} && {!(_veh getVariable [""ALF_player_usingChaise"", false])} && {(toLower ((getObjectTextures _veh) select 0)) isEqualTo ""alf_centrepompier\alf_don_sang\sang\perfusion_neuve.paa""}","[0,_target] spawn ALF_fnc_donDuSang;"},
			{"action1","Enlever la perfusion","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",1.5,"_veh = _this select 0; alive _veh && {(vehicle player) isEqualTo player} && {license_SAMU} && {!((toLower ((getObjectTextures _veh) select 0)) isEqualTo ""alf_centrepompier\alf_don_sang\sang\perfusion_neuve.paa"")}","[1,_target] spawn ALF_fnc_donDuSang;"}
		};
	};

	class ALF_Poubelle_Medic {
		Interactions[] = {
			{"Couv_1","Ouvrir Poubelle","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(_veh animationSourcePhase ""Couv_1_source"") isEqualTo 0}","_target animateSource [""Couv_1_source"", 1];"},
			{"Couv_1","Fermer Poubelle","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(_veh animationSourcePhase ""Couv_1_source"") > 0.5}","_target animateSource [""Couv_1_source"", 0];"},
			{"Couv_2","Ouvrir Poubelle","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(_veh animationSourcePhase ""Couv_2_source"") isEqualTo 0}","_target animateSource [""Couv_2_source"", 1];"},
			{"Couv_2","Fermer Poubelle","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(_veh animationSourcePhase ""Couv_2_source"") > 0.5}","_target animateSource [""Couv_2_source"", 0];"},
			{"Couv_3","Ouvrir Poubelle","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(_veh animationSourcePhase ""Couv_3_source"") isEqualTo 0}","_target animateSource [""Couv_3_source"", 1];"},
			{"Couv_3","Fermer Poubelle","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(_veh animationSourcePhase ""Couv_3_source"") > 0.5}","_target animateSource [""Couv_3_source"", 0];"},
			{"Couv_4","Ouvrir Poubelle","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(_veh animationSourcePhase ""Couv_4_source"") isEqualTo 0}","_target animateSource [""Couv_4_source"", 1];"},
			{"Couv_4","Fermer Poubelle","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_veh = _this select 0; alive _veh && {(_veh animationSourcePhase ""Couv_4_source"") > 0.5}","_target animateSource [""Couv_4_source"", 0];"}
		};
	};

	//Batiment gendarmerie
	class Land_ALF_Comico2 {
		Interactions[] = {
			{"Door_1_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_1_sound_source"") < 0.05","_target animateSource [""Door_1_sound_source"", 1];"},
			{"Door_1_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_1_sound_source"") isEqualTo 1","_target animateSource [""Door_1_sound_source"", 0];"},
			{"Door_2_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_2_sound_source"") < 0.05","_target animateSource [""Door_2_sound_source"", 1];"},
			{"Door_2_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_2_sound_source"") isEqualTo 1","_target animateSource [""Door_2_sound_source"", 0];"},
			{"Door_3_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_3_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_3_sound_source"", 1];"},
			{"Door_3_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_3_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_3_sound_source"", 0];"},
			{"Door_4_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_4_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_4_sound_source"", 1];"},
			{"Door_4_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_4_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_4_sound_source"", 0];"},
			{"Door_5_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_5_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_5_sound_source"", 1];"},
			{"Door_5_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_5_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_5_sound_source"", 0];"},
			{"Door_6_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_6_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_6_sound_source"", 1];"},
			{"Door_6_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_6_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_6_sound_source"", 0];"},
			{"Door_7_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_7_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_7_sound_source"", 1];"},
			{"Door_7_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_7_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_7_sound_source"", 0];"},
			{"Door_8_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_8_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_8_sound_source"", 1];"},
			{"Door_8_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_8_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_8_sound_source"", 0];"},
			{"Door_9_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_9_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_9_sound_source"", 1];"},
			{"Door_9_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_9_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_9_sound_source"", 0];"},
			{"Door_11_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_11_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_11_sound_source"", 1];"},
			{"Door_11_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_11_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_11_sound_source"", 0];"},
			{"Door_12_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_12_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_12_sound_source"", 1];"},
			{"Door_12_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_12_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_12_sound_source"", 0];"},
			{"Door_13_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_13_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_13_sound_source"", 1];"},
			{"Door_13_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_13_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_13_sound_source"", 0];"},
			{"Door_14_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_14_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_14_sound_source"", 1];"},
			{"Door_14_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_14_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_14_sound_source"", 0];"},
			{"Door_15_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_15_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_15_sound_source"", 1];"},
			{"Door_15_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_15_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_15_sound_source"", 0];"},
			{"Door_16_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_16_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_16_sound_source"", 1];"},
			{"Door_16_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_16_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_16_sound_source"", 0];"},
			{"Door_17_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_17_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_17_sound_source"", 1];"},
			{"Door_17_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_17_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_17_sound_source"", 0];"},
			{"Door_18_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_18_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_18_sound_source"", 1];"},
			{"Door_18_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_18_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_18_sound_source"", 0];"},
			{"Door_19_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_19_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_19_sound_source"", 1];"},
			{"Door_19_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_19_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_19_sound_source"", 0];"},
			{"Door_20_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_20_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_20_sound_source"", 1];"},
			{"Door_20_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_20_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_20_sound_source"", 0];"},
			{"Door_21_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_21_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_21_sound_source"", 1];"},
			{"Door_21_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_21_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_21_sound_source"", 0];"},
			{"Door_22_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_22_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_22_sound_source"", 1];"},
			{"Door_22_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_22_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_22_sound_source"", 0];"},
			{"Door_23_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_23_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_23_sound_source"", 1];"},
			{"Door_23_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_23_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_23_sound_source"", 0];"},
			{"Door_24_Trigger","Lever Battant","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_24_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_24_sound_source"", 1];"},
			{"Door_24_Trigger","Fermer Battant","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_24_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_24_sound_source"", 0];"},
			{"Door_25_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_25_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_25_sound_source"", 1];"},
			{"Door_25_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_25_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_25_sound_source"", 0];"},
			{"Door_26_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_26_sound_source"") < 0.05 && {life_copLevel > 0}","_target animateSource [""Door_26_sound_source"", 1];"},
			{"Door_26_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_26_sound_source"") isEqualTo 1 && {life_copLevel > 0}","_target animateSource [""Door_26_sound_source"", 0];"}
		};
	};
	
	//Hopital Pompier
	class Land_ALF_HopitalNew {
		Interactions[] = {
			{"Door_1_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_1_sound_source"") < 0.05","_target animateSource [""Door_1_sound_source"", 1];_target animateSource [""Door_2_sound_source"", 1];"},
			{"Door_1_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_1_sound_source"") isEqualTo 1","_target animateSource [""Door_1_sound_source"", 0];_target animateSource [""Door_2_sound_source"", 0];"},
			{"Door_3_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_3_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_3_sound_source"", 1];_target animateSource [""Door_4_sound_source"", 1];"},
			{"Door_3_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_3_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_3_sound_source"", 0];_target animateSource [""Door_4_sound_source"", 0];"},
			{"Door_5_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_5_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_5_sound_source"", 1];_target animateSource [""Door_6_sound_source"", 1];"},
			{"Door_5_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_5_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_5_sound_source"", 0];_target animateSource [""Door_6_sound_source"", 0];"},
			{"Door_7_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_7_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_7_sound_source"", 1];"},
			{"Door_7_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_7_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_7_sound_source"", 0];"},
			{"Door_8_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_8_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_8_sound_source"", 1];"},
			{"Door_8_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_8_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_8_sound_source"", 0];"},
			{"Door_9_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_9_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_9_sound_source"", 1];"},
			{"Door_9_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_9_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_9_sound_source"", 0];"},
			{"Door_10_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_10_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_10_sound_source"", 1];"},
			{"Door_10_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_10_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_10_sound_source"", 0];"},
			{"Door_11_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_11_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_11_sound_source"", 1];"},
			{"Door_11_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_11_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_11_sound_source"", 0];"},
			{"Door_12_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_12_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_12_sound_source"", 1];"},
			{"Door_12_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_12_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_12_sound_source"", 0];"},
			{"Door_13_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_13_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_13_sound_source"", 1];"},
			{"Door_13_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_13_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_13_sound_source"", 0];"},
			{"Door_14_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_14_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_14_sound_source"", 1];_target animateSource [""Door_15_sound_source"", 1];"},
			{"Door_14_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_14_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_14_sound_source"", 0];_target animateSource [""Door_15_sound_source"", 0];"},
			{"Door_16_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_16_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_16_sound_source"", 1];"},
			{"Door_16_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_16_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_16_sound_source"", 0];"},
			{"Door_17_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_17_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_17_sound_source"", 1];"},
			{"Door_17_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_17_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_17_sound_source"", 0];"},
			{"Door_18_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_18_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_18_sound_source"", 1];"},
			{"Door_18_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_18_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_18_sound_source"", 0];"},
			{"Door_19_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_19_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_19_sound_source"", 1];"},
			{"Door_19_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_19_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_19_sound_source"", 0];"},
			{"Door_20_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_20_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_20_sound_source"", 1];"},
			{"Door_20_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_20_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_20_sound_source"", 0];"},
			{"Door_21_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_21_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_21_sound_source"", 1];"},
			{"Door_21_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_21_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_21_sound_source"", 0];"},
			{"Door_22_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_22_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_22_sound_source"", 1];"},
			{"Door_22_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_22_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_22_sound_source"", 0];"},
			{"Door_23_Trigger","Ouvrir Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_23_sound_source"") < 0.05 && {life_medicLevel > 0}","_target animateSource [""Door_23_sound_source"", 1];"},
			{"Door_23_Trigger","Fermer Porte","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_23_sound_source"") isEqualTo 1 && {life_medicLevel > 0}","_target animateSource [""Door_23_sound_source"", 0];"},
		};
	};
	
	class Land_ALF_AtelierMecanique {
		Interactions[] = {
			{"Pont_1_Open","Monter Pont","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_1"") isEqualTo 0} && {b_4}","[[""Pont_1_Axis"", ""Pont_Elevateur_1""], true, player] remoteExec [""HC_fnc_startElevator"",HC2_Life];"},
			{"Pont_1_Close","Descendre Pont","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_1"") > 0.5} && {b_4}","[[""Pont_1_Axis"", ""Pont_Elevateur_1""], false, player] remoteExec [""HC_fnc_startElevator"",HC2_Life];"},
			{"Pont_2_Open","Monter Pont","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_2"") isEqualTo 0} && {b_4}","[[""Pont_2_Axis"", ""Pont_Elevateur_2""], true, player] remoteExec [""HC_fnc_startElevator"",HC2_Life];"},
			{"Pont_2_Close","Descendre Pont","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_2"") > 0.5} && {b_4}","[[""Pont_2_Axis"", ""Pont_Elevateur_2""], false, player] remoteExec [""HC_fnc_startElevator"",HC2_Life];"},
			{"Pont_3_Open","Monter Pont","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_3"") isEqualTo 0} && {b_4}","[[""Pont_3_Axis"", ""Pont_Elevateur_3""], true, player] remoteExec [""HC_fnc_startElevator"",HC2_Life];"},
			{"Pont_3_Close","Descendre Pont","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_3"") > 0.5} && {b_4}","[[""Pont_3_Axis"", ""Pont_Elevateur_3""], false, player] remoteExec [""HC_fnc_startElevator"",HC2_Life];"},
			{"Pont_4_Open","Monter Pont","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_4"") isEqualTo 0} && {b_4}","[[""Pont_4_Axis"", ""Pont_Elevateur_4""], true, player] remoteExec [""HC_fnc_startElevator"",HC2_Life];"},
			{"Pont_4_Close","Descendre Pont","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_4"") > 0.5} && {b_4}","[[""Pont_4_Axis"", ""Pont_Elevateur_4""], false, player] remoteExec [""HC_fnc_startElevator"",HC2_Life];"},
			{"Ordinateur_1","Utiliser ordinateur","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_1"") >= 0.5} && {b_4}","[[""Pont_1_Axis"", ""Pont_Elevateur_1""], player] remoteExec [""HC_fnc_startDiagnostic"",HC2_Life];"},
			{"Ordinateur_2","Utiliser ordinateur","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_2"") >= 0.5} && {b_4}","[[""Pont_2_Axis"", ""Pont_Elevateur_2""], player] remoteExec [""HC_fnc_startDiagnostic"",HC2_Life];"},
			{"Ordinateur_3","Utiliser ordinateur","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_3"") >= 0.5} && {b_4}","[[""Pont_3_Axis"", ""Pont_Elevateur_3""], player] remoteExec [""HC_fnc_startDiagnostic"",HC2_Life];"},
			{"Ordinateur_4","Utiliser ordinateur","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; alive _house && {(_house animationSourcePhase ""Pont_Elevateur_4"") >= 0.5} && {b_4}","[[""Pont_4_Axis"", ""Pont_Elevateur_4""], player] remoteExec [""HC_fnc_startDiagnostic"",HC2_Life];"}
		};
	};
	
	class Land_ALF_Parking {
		Interactions[] = {
			{"Door_1_Trigger","Ouvrir Barriere","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_1_sound_source"") < 0.05","_target animateSource [""Door_1_sound_source"", 1];"},
			{"Door_1_Trigger","Fermer Barriere","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_1_sound_source"") isEqualTo 1","_target animateSource [""Door_1_sound_source"", 0];"},
			{"Door_2_Trigger","Ouvrir Barriere","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_2_sound_source"") < 0.05","_target animateSource [""Door_2_sound_source"", 1];"},
			{"Door_2_Trigger","Fermer Barriere","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",3,"_house = _this select 0; (_house animationSourcePhase ""Door_2_sound_source"") isEqualTo 1","_target animateSource [""Door_2_sound_source"", 0];"},
		};
	};
	class ALF_TableMeth {
		Interactions[] = {
			{"Recipient","Remplir","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2,"_table = _this select 0; alive _table && {(_table animationPhase ""Liquide_1"") isEqualTo 0} && {(_table animationPhase ""Liquide_2"") isEqualTo 0}","[_target, 0, ""ALF_Pseudoephedrine""] spawn ALF_fnc_interactMeth;"},
			{"Chalumeau","Allumer","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2,"_table = _this select 0; alive _table && {(_table animationPhase ""Liquide_1"") > 0} && {(_table animationPhase ""Liquide_2"") isEqualTo 0}","[_target, 1] spawn ALF_fnc_interactMeth;"},
			{"Mortier","Ajouter","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2,"_table = _this select 0; alive _table && {(_table animationPhase ""Cuivre"") isEqualTo 0} && {(_table animationPhase ""Sulfate"") isEqualTo 0}","[_target, 0, ""ALF_Cuivre""] spawn ALF_fnc_interactMeth;"},
			{"Mortier","Broyer","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2,"_table = _this select 0; alive _table && {(_table animationPhase ""Cuivre"") > 0} && {(_table animationPhase ""Sulfate"") isEqualTo 0}","[_target, 2] spawn ALF_fnc_interactMeth;"},
			{"Balance","Crystalisation","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2,"_table = _this select 0; alive _table && {(_table animationPhase ""Liquide_2"") > 0} && {(_table animationPhase ""Meth_0"") isEqualTo 0}","[_target, 3] spawn ALF_fnc_interactMeth;"},
			{"Pillules","Recuperer","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa",2,"_table = _this select 0; alive _table && {(_table animationPhase ""Pilules"") > 0}","[_target, 4] spawn ALF_fnc_interactMeth;"}
		};
	};
};
