#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_interactionSystem.sqf
	Auhtor: ALF Nanou
*/
private _load = false;
if(!dialog) then {createDialog "interactionSystem"; _load = true;};
disableSerialization;

private _display = findDisplay 25799;
private _pic1 = _display displayCtrl 25800;
private _pic2 = _display displayCtrl 25801;
private _btn1 = _display displayCtrl 25802;
private _btn2 = _display displayCtrl 25803;
private _btn3 = _display displayCtrl 25804;
private _btn4 = _display displayCtrl 25805;
private _btn5 = _display displayCtrl 25806;
private _btn6 = _display displayCtrl 25807;
private _btn7 = _display displayCtrl 25808;
private _btn8 = _display displayCtrl 25809;
private _btn9 = _display displayCtrl 25810;
private _btn10 = _display displayCtrl 25811;
private _btn11 = _display displayCtrl 25812;
private _btn12 = _display displayCtrl 25813;
private _btnmenu = _display displayCtrl 25814;

private _curObj = _this select 0;
life_pInact_curObject = _curObj;
licence_rankTarget params [
	["_CopRank",0,[0]],
	["_MedRank",0,[0]],
	["_PenRank",0,[0]],
	["_PubRank",0,[0]],
	["_pmo",false,[false]],
	["_sr",false,[false]],
	["_tic",false,[false]],
	["_psig",false,[false]],
	["_gign",false,[false]],
	["_cyno",false,[false]]
];

private _menu = uiNamespace getVariable "interactPlayer";
switch (_menu) do {
	case 0 : {
		_pic2 ctrlShow false;
		_pic1 ctrlShow true;
		_btnmenu ctrlShow true;

		_btn1 ctrlShow true;
		_btn1 ctrlSetText "PRESENTER CARTE IDENTITE";
		_btn1 ctrlEnable ("ALF_identite" in (magazines player));
		_btn1 buttonSetAction "[player,player getVariable [""IdentititeFausse"",profileName]] remoteExecCall [""ALF_fnc_showIDcard"",life_pInact_curObject]; closeDialog 0;";
		
		_btn2 ctrlShow true;
		_btn2 ctrlSetText "PRESENTER PERMIS";
		_btn2 ctrlEnable ("ALF_Permis" in (magazines player));
		_btn2 buttonSetAction "[player getVariable [""IdentititeFausse"",name player],license_driver,license_trucking,life_permis,license_moto,license_boat,license_pilot] remoteExec [""ALF_fnc_showPcard"",life_pInact_curObject]; closeDialog 0;";

		_btn3 ctrlShow true;
		_btn3 ctrlSetText "DEMENOTTER";
		
		if([_curObj] call ALF_fnc_checkMenotter) then {
			if("ALF_cle_M" in (magazines player)) then {
				_btn3 ctrlEnable true;
				_btn3 buttonSetAction "[life_pInact_curObject] call ALF_fnc_unrestrain; closeDialog 0;";
			} else {
				if("ALF_ZipCutter" in (magazines player)) then {
					_btn3 ctrlEnable true;
					_btn3 buttonSetAction "[life_pInact_curObject] call ALF_fnc_unrestrain2; closeDialog 0;";
				} else {
					_btn3 ctrlEnable false;
				};
			};

			_btn4 ctrlShow false;
			_btn5 ctrlShow false;
		} else {
			if(life_penit_service && {life_pInact_curObject getVariable ["ALF_EnPrison",false]}) then {
				_btn3 ctrlShow true;
				_btn3 ctrlEnable true;
				_btn3 ctrlSetText "Assigner cellule";
				_btn3 buttonSetAction "closeDialog 0; [4,[],life_pInact_curObject] spawn ALF_fnc_menuMettrePrison;";
			} else {
				_btn3 ctrlShow false;
			};
			if(life_penit_service && {player distance [11005.1,3701.35,0.00239563] <= 100}) then {
				if (!(life_pInact_curObject getVariable ["ALF_EnPrison",false])) then {
					_btn4 ctrlShow true;
					_btn4 ctrlEnable true;
					_btn4 ctrlSetText "Mettre en prison";
					_btn4 buttonSetAction "closeDialog 0; [0,[],life_pInact_curObject] spawn ALF_fnc_menuMettrePrison;";
				} else {
					_btn4 ctrlShow true;
					_btn4 ctrlEnable true;
					_btn4 ctrlSetText "Sortir de prison";
					_btn4 buttonSetAction "closeDialog 0; life_pInact_curObject setVariable ['ALF_EnPrison',true,true];";
				};
			} else {
				_btn4 ctrlShow false;
			};
		};
		
		if(life_penit_service && license_medWork) then {
			_btn5 ctrlShow true;
			_btn5 ctrlSetText "SOIGNER";
			if ("ALF_Bandage" in (magazines player)) then {
				_btn5 ctrlEnable true;
				_btn5 buttonSetAction "closeDialog 0; [life_pInact_curObject] spawn ALF_fnc_soignerPompier;";
			} else {
				_btn5 ctrlEnable false;
			};
		} else {
			_btn5 ctrlShow false;
		};

		if(life_gendarme_service && ('ALF_Alcootest' in (magazines player))) then {
			_btn6 ctrlShow true;
			_btn6 ctrlSetText "Test Alcoolemie";
			_btn6 ctrlEnable true;
			_btn6 buttonSetAction "[player] remoteExec [""ALF_fnc_testAlcoolemie"",life_pInact_curObject]; closeDialog 0;";
		} else {
			if("ALF_Lockpick" in (magazines player) && {life_pInact_curObject in (missionNamespace getVariable ["ALF_AllBracelets",[]])}) then {
				_btn6 ctrlShow true;
				_btn6 ctrlSetText "Crocheter Bracelet";
				_btn6 ctrlEnable true;
				_btn6 buttonSetAction "[0,life_pInact_curObject] spawn ALF_fnc_enleverBracelet; closeDialog 0;";
			} else {
				if("ALF_Bracelet" in (magazines player) && {!(life_pInact_curObject in (missionNamespace getVariable ["ALF_AllBracelets",[]]))} && {life_penit > 0}) then {
					_btn6 ctrlShow true;
					_btn6 ctrlSetText "Ajouter Bracelet";
					_btn6 ctrlEnable true;
					_btn6 buttonSetAction "closeDialog 0; [0,[],life_pInact_curObject] spawn ALF_fnc_menuAjoutBracelet;";
				} else {
					if (life_pInact_curObject in (missionNamespace getVariable ["ALF_AllBracelets",[]]) && {life_penit > 0}) then {
						_btn6 ctrlShow true;
						_btn6 ctrlSetText "Enlever Bracelet";
						_btn6 ctrlEnable true;
						_btn6 buttonSetAction "[1,life_pInact_curObject] call ALF_fnc_enleverBracelet; closeDialog 0;";
					} else {
						_btn6 ctrlShow false;
					};
				};
			};
		};

		if (b_15) then {
			if (licence_driverTarget) then {
				_btn4 ctrlShow true;
				_btn4 ctrlEnable true;
				_btn4 ctrlSetText "Enlever permis conduire";
				_btn4 buttonSetAction "[3] remoteExecCall [""ALF_fnc_driver"",life_pInact_curObject]; [""Info"", ""Tu as retiré le permis de conduire de cette personne."", ""success"", false] spawn ALF_fnc_doMsg; closeDialog 0;";
			} else {
				_btn4 ctrlShow true;
				_btn4 ctrlEnable true;
				_btn4 ctrlSetText "Donner permis conduire";
				_btn4 buttonSetAction "[2] remoteExecCall [""ALF_fnc_driver"",life_pInact_curObject]; [""Info"", ""Tu as donné le permis de conduire à la personne."", ""success"", false] spawn ALF_fnc_doMsg; closeDialog 0;";
			};
		};
		if (b_15) then {
			if (licence_pilotTarget) then {
				_btn4 ctrlShow true;
				_btn4 ctrlEnable true;
				_btn4 ctrlSetText "Enlever license pilote";
				_btn4 buttonSetAction "[3] remoteExecCall [""ALF_fnc_pilot"",life_pInact_curObject]; [""Info"", ""Tu as retiré la licence de vol de cette personne."", ""success"", false] spawn ALF_fnc_doMsg; closeDialog 0;";
			} else {
				_btn4 ctrlShow true;
				_btn4 ctrlEnable true;
				_btn4 ctrlSetText "Donner license pilote";
				_btn4 buttonSetAction "[2] remoteExecCall [""ALF_fnc_pilot"",life_pInact_curObject]; [""Info"", ""Tu as donné la licence de vol à la personne."", ""success"", false] spawn ALF_fnc_doMsg; closeDialog 0;";
			};
		};
		if (b_13) then {
			if !(licence_gunTarget) then {
				_btn4 ctrlShow true;
				_btn4 ctrlEnable true;
				_btn4 ctrlSetText "Donner Permis Armes";
				_btn4 buttonSetAction "[3] remoteExecCall [""ALF_fnc_Parmes"",life_pInact_curObject]; [""Info"", ""Tu as donné le permis port d'armes à cette personne."", ""success"", false] spawn ALF_fnc_doMsg; closeDialog 0;";
			};
		};

		if(life_gendarme_service OR {life_pompier_service}) then {
			if(life_gendarme_service) then {
				_btn4 ctrlShow true;
				_btn4 ctrlSetText "AMENDE";
				_btn4 buttonSetAction "closeDialog 0; [life_pInact_curObject] call ALF_fnc_ticketAction;";
				_btn5 ctrlShow true;
				_btn5 ctrlSetText "VERIFIER CASH";
				_btn5 buttonSetAction "[player] remoteExecCall [""ALF_fnc_verifCash"",life_pInact_curObject];";
				_btn7 ctrlShow true;
				_btn7 ctrlSetText "SAISIR CASH";
				_btn7 buttonSetAction "[player] remoteExecCall [""ALF_fnc_saisieCash"",life_pInact_curObject];";
				_btn8 ctrlShow true;
				_btn8 ctrlSetText "FOUILLER";
				_btn8 buttonSetAction "closeDialog 0; [life_pInact_curObject] spawn ALF_fnc_fouilleAnal;";
				_btn9 ctrlShow true;
				_btn9 ctrlSetText "TEST ADN";
				_btn9 buttonSetAction "closeDialog 0; [life_pInact_curObject] spawn ALF_fnc_getPlayerAdn;";
				_btn10 ctrlShow true;
				_btn10 ctrlSetText "RECO. FACIAL";
				_btn10 buttonSetAction "closeDialog 0; [life_pInact_curObject] spawn ALF_fnc_getPlayerFace;";

				_btn5 ctrlEnable ([_curObj] call ALF_fnc_checkMenotter);
				_btn7 ctrlEnable ([_curObj] call ALF_fnc_checkMenotter);
				
				_btn9 ctrlEnable (player distance (nearestObject [position player,"Land_Caserne"]) < 100 || {player distance (nearestObject [position player,"Land_ALF_Comico2"]) < 100});
				_btn10 ctrlEnable (player distance (nearestObject [position player,"Land_Caserne"]) < 100 || {player distance (nearestObject [position player,"Land_ALF_Comico2"]) < 100});

				_btn11 ctrlShow false;
				_btn12 ctrlShow false;
			} else {
				_btn4 ctrlShow true;
				_btn4 ctrlSetText "SOIGNER";
				if ("ALF_Bandage" in (magazines player)) then {
					_btn4 ctrlEnable true;
					_btn4 buttonSetAction "closeDialog 0; [life_pInact_curObject] spawn ALF_fnc_soignerPompier;";
				} else {
					_btn4 ctrlEnable false;
				};

				_btn5 ctrlShow false;
				
				if !(player getVariable ["isEmployed",""] isEqualTo "") then {
					_btn7 ctrlShow true;
					_btn7 ctrlSetText "Faire une facture";
					_btn7 ctrlEnable true;
					_btn7 buttonSetAction "closeDialog 0; createDialog ""Life_facture"";";
				};

				_btn8 ctrlShow true;
				_btn8 ctrlSetText "Test groupe sanguin";
				_btn8 ctrlEnable true;
				_btn8 buttonSetAction "[0,life_pInact_curObject] spawn ALF_fnc_testGroupeSanguin; closeDialog 0;";
				
				if (license_SAMU) then {
					_btn9 ctrlShow true;
					_btn9 ctrlSetText "Faire une ordonnance";
					_btn9 ctrlEnable true;
					_btn9 buttonSetAction "closeDialog 0; [player] remoteExecCall [""ALF_fnc_giveOrdonnance"",life_pInact_curObject];";
				} else {
					_btn9 ctrlShow false;
				};
				
				_btn10 ctrlShow false;
				_btn11 ctrlShow false;
				_btn12 ctrlShow false;
			};
		} else {
			if !(player getVariable ["isEmployed",""] isEqualTo "") then {
				_btn7 ctrlShow true;
				_btn7 ctrlSetText "Faire une facture";
				_btn7 ctrlEnable true;
				_btn7 buttonSetAction "closeDialog 0; createDialog ""Life_facture"";";
			} else {
				if (life_penit_service) then {
					_btn7 ctrlShow true;
					_btn7 ctrlSetText "FOUILLER";
					_btn7 ctrlEnable true;
					_btn7 buttonSetAction "closeDialog 0; [life_pInact_curObject] spawn ALF_fnc_fouilleAnal;";
				} else {
					_btn7 ctrlShow false;
				};
			};
			
			if(life_penit > 2) then {
				_btn8 ctrlShow true;
				_btn8 ctrlSetText "[P] Virer de la prison";
				_btn8 buttonSetAction "[0,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
				_btn9 ctrlShow true;
				_btn9 ctrlSetText "[P] Passer S. Stagiaire";
				_btn9 buttonSetAction "[1,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
				_btn10 ctrlShow true;
				_btn10 ctrlSetText "[P] Passer S. Titulaire";
				_btn10 buttonSetAction "[2,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
			} else {
				_btn8 ctrlShow false;
				_btn9 ctrlShow false;
				_btn10 ctrlShow false;
			};
			if(life_penit > 6) then {
				_btn11 ctrlShow true;
				_btn11 ctrlSetText "[P] Passer S. Principal";
				_btn11 buttonSetAction "[3,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
				_btn12 ctrlShow true;
				_btn12 ctrlSetText "[P] Passer S. Brigadier";
				_btn12 buttonSetAction "[4,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
			} else {
				_btn11 ctrlShow false;
				_btn12 ctrlShow false;
			};
			if(life_penit > 1 && {_PenRank >= life_penit}) then {
				{_x ctrlEnable false;}forEach[_btn8,_btn9,_btn10,_btn11,_btn12];
			} else {
				{_x ctrlEnable true;}forEach[_btn8,_btn9,_btn10,_btn11,_btn12];
			};
		};

		if(life_copLevel < 1 && {life_medicLevel < 9} && {life_publique < 7} && {life_penit < 8}) then {
			_btnmenu ctrlEnable false;
		};

		if(life_gendarme_service) then {
			_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',3]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";
		} else {
			_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',1]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";
		};

		if(life_pInact_curObject getVariable ["ReviveMedic",false] && {life_pInact_curObject isKindOf "Man"}) then {
			{_x ctrlShow false;} forEach [_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10,_btn11,_btn12,_btnmenu];

			if (life_gendarme_service) then {
				if ("ALF_identite" in (magazines life_pInact_curObject)) then {
					_btn1 ctrlShow true;
					_btn1 ctrlEnable true;
					_btn1 ctrlSetText "Identifier corps";
					_btn1 buttonSetAction "[life_pInact_curObject, name life_pInact_curObject] call ALF_fnc_showIDcard; closeDialog 0;";
				};
			
				_btn2 ctrlShow true;
				_btn2 ctrlEnable true;
				_btn2 ctrlSetText "FOUILLER";
				_btn2 buttonSetAction "closeDialog 0; [life_pInact_curObject] spawn ALF_fnc_fouilleAnal;";
			};

			if (isNull (attachedTo life_pInact_curObject)) then {
				_btn3 ctrlShow true;
				_btn3 ctrlEnable true;
				_btn3 ctrlSetText "Porter le blessé";
				_btn3 buttonSetAction "[0,life_pInact_curObject] spawn ALF_fnc_porterMort; closeDialog 0;";
				
				_btn4 ctrlShow true;
				_btn4 ctrlEnable true;
				if ("ALF_Defibrilateur" in (magazines player)) then {
					_btn4 ctrlSetText "Reanimer";
					_btn4 buttonSetAction "[life_pInact_curObject] spawn life_fnc_revivePlayer;";
				} else {
					_btn4 ctrlSetText "Stabiliser";
					_btn4 buttonSetAction "[life_pInact_curObject] spawn ALF_fnc_stabilize;";
				};
				
				_btn5 ctrlShow true;
				_btn5 ctrlEnable true;
				_btn5 ctrlSetText "Mettre le blessé dans le vehicule";
				_btn5 buttonSetAction "[0,life_pInact_curObject] call ALF_fnc_voitureMort; closeDialog 0;";
				
				if ("ALF_Drap_Cadavre_Item" in (magazines player)) then {
					_btn6 ctrlShow true;
					_btn6 ctrlEnable true;
					_btn6 ctrlSetText "Mettre un drap mortuaire";
					_btn6 buttonSetAction "[0,life_pInact_curObject] spawn ALF_fnc_drapMort; closeDialog 0;";
				};
			};
		};
	};

	case 1 : {
		_pic1 ctrlShow false;
		_pic2 ctrlShow true;

		if(life_copLevel > 5) then {
			_btnmenu ctrlShow true;
			_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',0]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";

			_btn1 ctrlShow true;
			_btn1 ctrlSetText "Virer de la Gendarmerie";
			_btn1 ctrlEnable true;
			_btn2 ctrlShow true;
			_btn2 ctrlSetText "Elève Gendarme";
			_btn2 ctrlEnable true;
			_btn3 ctrlShow true;
			_btn3 ctrlSetText "Gendarme";
			_btn3 ctrlEnable true;
			_btn4 ctrlShow true;
			_btn4 ctrlSetText "Maréchal des logis chef";
			_btn4 ctrlEnable true;
			_btn5 ctrlShow true;
			_btn5 ctrlSetText "Adjudant";
			_btn5 ctrlEnable true;
			_btn6 ctrlShow true;
			_btn6 ctrlSetText "Adjudant-Chef"; //5
			_btn6 ctrlEnable true;
			_btn7 ctrlShow true;
			_btn7 ctrlSetText "Major"; //6
			_btn7 ctrlEnable true;
			_btn8 ctrlShow true;
			_btn8 ctrlSetText "Sous-Lieutenant"; //7
			_btn9 ctrlShow true;
			_btn9 ctrlSetText "Lieutenant"; //8
			_btn10 ctrlShow true;
			_btn10 ctrlSetText "Capitaine"; //9
			_btn11 ctrlShow true;
			_btn11 ctrlSetText "Commandant"; //10
			_btn12 ctrlShow true;
			_btn12 ctrlSetText "Lieutenant-Colonel"; //11
			if(life_copLevel < 11) then {_btn12 ctrlEnable false;} else {_btn12 ctrlEnable true;};
			if(life_copLevel < 10) then {_btn11 ctrlEnable false;} else {_btn11 ctrlEnable true;};
			if(life_copLevel < 9) then {_btn10 ctrlEnable false;} else {_btn10 ctrlEnable true;};
			if(life_copLevel < 8) then {_btn9 ctrlEnable false;} else {_btn9 ctrlEnable true;};
			if(life_copLevel < 7) then {_btn8 ctrlEnable false;} else {_btn8 ctrlEnable true;};
			if(_CopRank >= life_copLevel) then {{_x ctrlEnable false;}forEach[_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10,_btn11,_btn12];};

			_btn1 buttonSetAction "[0,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn2 buttonSetAction "[1,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn3 buttonSetAction "[2,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn4 buttonSetAction "[3,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn5 buttonSetAction "[4,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn6 buttonSetAction "[5,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn7 buttonSetAction "[6,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn8 buttonSetAction "[7,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn9 buttonSetAction "[8,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn10 buttonSetAction "[9,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn11 buttonSetAction "[10,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";
			_btn12 buttonSetAction "[11,player] remoteExecCall [""ALF_fnc_copSetLevel"",life_pInact_curObject];";

			if(!(alive life_pInact_curObject) && {life_pInact_curObject isKindOf "Man"}) then {
				{_x ctrlEnable false;} forEach [_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10,_btn11,_btn12];
			};
		} else {
			_btnmenu ctrlShow true;
			_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',0]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";

			if (life_medicLevel >= 9) then {
				_btn1 ctrlShow true;
				_btn1 ctrlSetText "Virer des Pompiers";
				_btn1 ctrlEnable true;
				_btn2 ctrlShow true;
				_btn2 ctrlSetText "Sapeur";
				_btn2 ctrlEnable true;
				_btn3 ctrlShow true;
				_btn3 ctrlSetText "Sapeur 1ere Cl";
				_btn3 ctrlEnable true;
				_btn4 ctrlShow true;
				_btn4 ctrlSetText "Caporal";
				_btn4 ctrlEnable true;
				_btn5 ctrlShow true;
				_btn5 ctrlSetText "Caporal chef";
				_btn5 ctrlEnable true;
				_btn6 ctrlShow true;
				_btn6 ctrlSetText "Sergent"; //5
				_btn6 ctrlEnable true;
				_btn7 ctrlShow true;
				_btn7 ctrlSetText "Sergent chef"; //6
				_btn7 ctrlEnable true;
				_btn8 ctrlShow true;
				_btn8 ctrlSetText "Adjudant"; //7
				_btn9 ctrlShow true;
				_btn9 ctrlSetText "Adjudant chef"; //8
				_btn10 ctrlShow true;
				_btn10 ctrlSetText "Lieutenant"; //9
				_btn11 ctrlShow true;
				_btn11 ctrlSetText "Capitaine"; //10
				_btn12 ctrlShow true;
				_btn12 ctrlSetText "ADD/SUP SAMU"; //10
				if(life_medicLevel < 10) then {_btn11 ctrlEnable false;} else {_btn11 ctrlEnable true;};
				if(life_medicLevel < 9) then {_btn10 ctrlEnable false;} else {_btn10 ctrlEnable true;};
				if(life_medicLevel < 8) then {_btn9 ctrlEnable false;} else {_btn9 ctrlEnable true;};
				if(life_medicLevel < 7) then {_btn8 ctrlEnable false;} else {_btn8 ctrlEnable true;};
				if(life_medicLevel < 5) then {_btn12 ctrlEnable false;} else {_btn12 ctrlEnable true;};
				if(_MedRank >= life_medicLevel) then {{_x ctrlEnable false;}forEach[_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10,_btn11,_btn12];};

				_btn1 buttonSetAction "[0,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn2 buttonSetAction "[1,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn3 buttonSetAction "[2,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn4 buttonSetAction "[3,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn5 buttonSetAction "[4,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn6 buttonSetAction "[5,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn7 buttonSetAction "[6,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn8 buttonSetAction "[7,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn9 buttonSetAction "[8,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn10 buttonSetAction "[9,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn11 buttonSetAction "[10,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
				_btn12 buttonSetAction "[11,player] remoteExecCall [""ALF_fnc_medSetLevel"",life_pInact_curObject];";
			} else {
				if(life_penit > 8) then {
					_btnmenu ctrlShow true;
					_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',0]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";
					
					_btn1 ctrlShow true;
					_btn1 ctrlSetText "[P] Passer P. Surveillant";
					_btn1 buttonSetAction "[5,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
					
					_btn2 ctrlShow true;
					_btn2 ctrlSetText "[P] Passer Major";
					_btn2 buttonSetAction "[6,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
					
					_btn3 ctrlShow true;
					_btn3 ctrlSetText "[P] Passer Lieutenant";
					_btn3 buttonSetAction "[7,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
					
					_btn4 ctrlShow true;
					_btn4 ctrlSetText "[P] Passer Capitaine";
					_btn4 buttonSetAction "[8,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";
					
					_btn5 ctrlShow true;
					_btn5 ctrlSetText "[P] Passer Commandant";
					_btn5 buttonSetAction "[9,player] remoteExecCall [""ALF_fnc_penitSetLevel"",life_pInact_curObject];";

					_btn6 ctrlShow true;
					_btn6 ctrlSetText "AJOUTER Medecin";
					_btn6 ctrlEnable true;
					_btn6 buttonSetAction "[""medWork"",player] remoteExecCall [""ALF_fnc_penitSetLic"",life_pInact_curObject];";
					
					_btn7 ctrlShow true;
					_btn7 ctrlSetText "RETIRER Medecin";
					_btn7 ctrlEnable true;
					_btn7 buttonSetAction "[""NOmedWork"",player] remoteExecCall [""ALF_fnc_penitSetLic"",life_pInact_curObject];";
					
					_btn8 ctrlShow true;
					_btn8 ctrlSetText "AJOUTER ERIS";
					_btn8 ctrlEnable true;
					_btn8 buttonSetAction "[""eris"",player] remoteExecCall [""ALF_fnc_penitSetLic"",life_pInact_curObject];";
					
					_btn9 ctrlShow true;
					_btn9 ctrlSetText "RETIRER ERIS";
					_btn9 ctrlEnable true;
					_btn9 buttonSetAction "[""NOeris"",player] remoteExecCall [""ALF_fnc_penitSetLic"",life_pInact_curObject];";
					
					_btn10 ctrlShow true;
					_btn10 ctrlSetText "AJOUTER CYNO";
					_btn10 ctrlEnable true;
					_btn10 buttonSetAction "[""cynoAP"",player] remoteExecCall [""ALF_fnc_penitSetLic"",life_pInact_curObject];";
					
					_btn11 ctrlShow true;
					_btn11 ctrlSetText "RETIRER CYNO";
					_btn11 ctrlEnable true;
					_btn11 buttonSetAction "[""NOcynoAP"",player] remoteExecCall [""ALF_fnc_penitSetLic"",life_pInact_curObject];";

					_btn12 ctrlShow false;

				} else {
					_btnmenu ctrlShow true;
					_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',0]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";

					_btn1 ctrlShow true;
					_btn1 ctrlSetText "Virer du Service Publique";
					_btn1 ctrlEnable true;
					_btn2 ctrlShow true;
					_btn2 ctrlSetText "Grade 1";
					_btn2 ctrlEnable true;
					_btn3 ctrlShow true;
					_btn3 ctrlSetText "Grade 2";
					_btn3 ctrlEnable true;
					_btn4 ctrlShow true;
					_btn4 ctrlSetText "Grade 3";
					_btn4 ctrlEnable true;
					_btn5 ctrlShow true;
					_btn5 ctrlSetText "Grade 4";
					_btn5 ctrlEnable true;
					_btn6 ctrlShow true;
					_btn6 ctrlSetText "Grade 5";
					_btn6 ctrlEnable true;
					_btn7 ctrlShow true;
					_btn7 ctrlSetText "Grade 6";
					_btn8 ctrlShow true;
					_btn8 ctrlSetText "Grade 7";
					_btn9 ctrlShow true;
					_btn9 ctrlSetText "Grade 8";
					_btn10 ctrlShow false;
					_btn11 ctrlShow false;
					_btn12 ctrlShow false;
					
					_btn8 ctrlEnable (life_publique >= 7);
					_btn9 ctrlEnable (life_publique >= 8);

					private _bool = _PubRank < life_publique;

					{
						_x ctrlEnable _bool;
					} forEach [_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8,_btn9];

					_btn1 buttonSetAction "[0,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
					_btn2 buttonSetAction "[1,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
					_btn3 buttonSetAction "[2,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
					_btn4 buttonSetAction "[3,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
					_btn5 buttonSetAction "[4,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
					_btn6 buttonSetAction "[5,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
					_btn7 buttonSetAction "[6,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
					_btn8 buttonSetAction "[7,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
					_btn9 buttonSetAction "[8,player] remoteExecCall [""ALF_fnc_pubSetLevel"",life_pInact_curObject];";
				};
			};
		};
	};
	case 2 : {
		_pic1 ctrlShow false;
		_pic2 ctrlShow true;
		_btnmenu ctrlShow true;

		if(life_copLevel < 6) then {
			_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',0]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";
		} else {
			_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',1]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";
		};

		_btn1 ctrlShow true;
		_btn1 ctrlSetText "Enlever des points";
		_btn1 ctrlEnable true;
		_btn1 buttonSetAction "[life_pInact_curObject] call ALF_fnc_actionPoints;";

		_btn2 ctrlShow true;
		_btn2 ctrlSetText "Retirer permis";
		_btn2 ctrlEnable true;
		_btn2 buttonSetAction "[player] remoteExec [""ALF_fnc_retirerPermis"",life_pInact_curObject]; closeDialog 0;";

		_btn3 ctrlShow true;
		_btn3 ctrlSetText "Verifier permis armes";
		_btn3 ctrlEnable true;
		_btn3 buttonSetAction "[player] remoteExec [""ALF_fnc_verifParmes"",life_pInact_curObject]; closeDialog 0;";

		if(life_copLevel > 6) then {
		
			if !(_cyno) then {
				_btn4 ctrlShow true;
				_btn4 ctrlSetText "AJOUTER CYNO";
				_btn4 ctrlEnable true;
				_btn4 buttonSetAction "[""CYNO"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			} else {
				_btn4 ctrlShow true;
				_btn4 ctrlSetText "RETIRER CYNO";
				_btn4 ctrlEnable true;
				_btn4 buttonSetAction "[""NOCYNO"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			};
			
			if !(_gign) then {
				_btn5 ctrlShow true;
				_btn5 ctrlSetText "AJOUTER GIGN";
				_btn5 ctrlEnable true;
				_btn5 buttonSetAction "[""GIGN"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			} else {
				_btn5 ctrlShow true;
				_btn5 ctrlSetText "RETIRER GIGN";
				_btn5 ctrlEnable true;
				_btn5 buttonSetAction "[""NOGIGN"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			};

			if !(_psig) then {
				_btn6 ctrlShow true;
				_btn6 ctrlSetText "AJOUTER PSIG";
				_btn6 ctrlEnable true;
				_btn6 buttonSetAction "[""PSIG"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			} else {
				_btn6 ctrlShow true;
				_btn6 ctrlSetText "RETIRER PSIG";
				_btn6 ctrlEnable true;
				_btn6 buttonSetAction "[""NOPSIG"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			};

			if !(_sr) then {
				_btn7 ctrlShow true;
				_btn7 ctrlSetText "AJOUTER SR";
				_btn7 ctrlEnable true;
				_btn7 buttonSetAction "[""SR"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			} else {
				_btn7 ctrlShow true;
				_btn7 ctrlSetText "RETIRER SR";
				_btn7 ctrlEnable true;
				_btn7 buttonSetAction "[""NOSR"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			};

			if !(_sr) then {
				_btn8 ctrlShow true;
				_btn8 ctrlSetText "AJOUTER PMO";
				_btn8 ctrlEnable true;
				_btn8 buttonSetAction "[""PMO"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			} else {
				_btn8 ctrlShow true;
				_btn8 ctrlSetText "RETIRER PMO";
				_btn8 ctrlEnable true;
				_btn8 buttonSetAction "[""NOPMO"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			};
			
			if !(_tic) then {
				_btn9 ctrlShow true;
				_btn9 ctrlSetText "AJOUTER TIC";
				_btn9 ctrlEnable true;
				_btn9 buttonSetAction "[""TIC"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			} else {
				_btn9 ctrlShow true;
				_btn9 ctrlSetText "RETIRER TIC";
				_btn9 ctrlEnable true;
				_btn9 buttonSetAction "[""NOTIC"",player] remoteExecCall [""ALF_fnc_copSetLic"",life_pInact_curObject];";
			};
		} else {
			_btn4 ctrlShow false;
			_btn5 ctrlShow false;
			_btn6 ctrlShow false;
			_btn7 ctrlShow false;
			_btn8 ctrlShow false;
			_btn9 ctrlShow false;
			_btn10 ctrlShow false;
			_btn11 ctrlShow false;
			_btn12 ctrlShow false;
		};

		if(!(alive life_pInact_curObject) && {life_pInact_curObject isKindOf "Man"}) then {
			{_x ctrlEnable false;} forEach [_btn1,_btn2,_btn3,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10,_btn11,_btn12];
		};
	};

	case 3: {
		_pic1 ctrlShow false;
		_pic2 ctrlShow true;
		_btnmenu ctrlShow true;

		_btnmenu buttonSetAction "uiNamespace setVariable['interactPlayer',2]; [life_pInact_curObject] spawn ALF_fnc_interactionSystem;";

		_btn1 ctrlShow true;
		_btn1 ctrlSetText "Ajouter Bracelet";
		if("ALF_Bracelet" in (magazines player) && {!(life_pInact_curObject in (missionNamespace getVariable ["ALF_AllBracelets",[]]))}) then {
			_btn1 ctrlEnable true;
			_btn1 buttonSetAction "closeDialog 0; [0,[],life_pInact_curObject] spawn ALF_fnc_menuAjoutBracelet;";
		} else {
			if (life_pInact_curObject in (missionNamespace getVariable ["ALF_AllBracelets",[]])) then {
				_btn1 ctrlSetText "Enlever Bracelet";
				_btn1 ctrlEnable true;
				_btn1 buttonSetAction "[1,life_pInact_curObject] call ALF_fnc_enleverBracelet; closeDialog 0;";
			} else {
				_btn1 ctrlEnable false;
			};
		};

		if (licence_gunTarget) then {
			_btn2 ctrlShow true;
			_btn2 ctrlEnable true;
			_btn2 ctrlSetText "Enlever Permis Armes";
			_btn2 buttonSetAction "[2] remoteExecCall [""ALF_fnc_Parmes"",life_pInact_curObject]; [""Info"", ""Tu as retiré le permis port d'armes de la personne."", ""success"", false] spawn ALF_fnc_doMsg; closeDialog 0;";
		} else {
			_btn2 ctrlShow false;
			_btn2 ctrlEnable false;
		};

		if ((life_coplevel >= 4) && {player distance [11005.1,3701.35,0.00239563] <= 100}) then {
			_btn3 ctrlShow true;
			_btn3 ctrlEnable true;
			_btn3 ctrlSetText "Mettre en prison";
			_btn3 buttonSetAction "closeDialog 0; [0,[],life_pInact_curObject] spawn ALF_fnc_menuMettrePrison;";
		} else {
			_btn3 ctrlShow false;
			_btn3 ctrlEnable false;
		};
		
		if((life_coplevel >= 4) && {life_pInact_curObject getVariable ["ALF_EnPrison",false]}) then {
			_btn4 ctrlShow true;
			_btn4 ctrlEnable true;
			_btn4 ctrlSetText "Assigner cellule";
			_btn4 buttonSetAction "closeDialog 0; [4,[],life_pInact_curObject] spawn ALF_fnc_menuMettrePrison;";
		} else {
			_btn4 ctrlShow false;
			_btn4 ctrlEnable false;
		};

		_btn5 ctrlShow false;
		_btn6 ctrlShow false;
		_btn7 ctrlShow false;
		_btn8 ctrlShow false;
		_btn9 ctrlShow false;
		_btn10 ctrlShow false;
		_btn11 ctrlShow false;
		_btn12 ctrlShow false;

		if(!(alive life_pInact_curObject) && {life_pInact_curObject isKindOf "Man"}) then {
			{_x ctrlEnable false;} forEach [_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10,_btn11,_btn12];
		};
	};
};

if (_load) then {
	for "_i" from 0 to 1 step 0 do {
		if(isNull (findDisplay 25799)) exitWith {};
		if(_curObj distance player > 4) exitWith {closeDialog 25799;};
		uiSleep 1;
	};
};