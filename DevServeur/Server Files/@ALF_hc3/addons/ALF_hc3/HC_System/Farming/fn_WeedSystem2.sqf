/*
	This file is for Nanou's HeadlessClient.
*/
params [
	["_object",objNull,[objNull]],
	["_speed",1,[0]]
];

//private _c = {_x getVariable ["CopService",false]} count playableUnits;
//if(_c <= 5) exitWith {["INFO", "Il n'y a pas assez de Gendarme en service.", "warning"] remoteExec ["ALF_fnc_doMsg",remoteExecutedOwner];};

["ALF_Graine_W",false] remoteExec ["life_fnc_handleItem",remoteExecutedOwner];

_object animateSource ["et_1_source",0,true];

private _fire = false;
private _count = 0;
private _step = 0;
private _pure = 0;
for "_i" from 0 to 1 step 0 do {
	if(isNull _object) exitWith {};
	if(_step isEqualTo 0 && {_count > 50} && {_object animationSourcePhase "et_1_source" isEqualTo 0} && {_object animationSourcePhase "et_2_source" isEqualTo 1} && {_object animationSourcePhase "et_3_source" isEqualTo 1} && {_object animationSourcePhase "et_4_source" isEqualTo 1}) then {
		_step = 1;
		_object animateSource ["et_1_source",1,true];
		_object animateSource ["et_2_source",0,true];
	};
	if(_step isEqualTo 1 && {_count > 100} && {_object animationSourcePhase "et_1_source" isEqualTo 1} && {_object animationSourcePhase "et_2_source" isEqualTo 0} && {_object animationSourcePhase "et_3_source" isEqualTo 1} && {_object animationSourcePhase "et_4_source" isEqualTo 1}) then {
		_step = 2;
		_object animateSource ["et_2_source",1,true];
		_object animateSource ["et_3_source",0,true];
		if(_object animationSourcePhase "hide_uv_source" < 0.9) then {
			private _dice = random(1000);
			if(_dice <= 10) then {
				private _hs = nearestObjects [position _object, ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_01_b_white_F","Land_i_House_Big_01_b_brown_F","Land_i_House_Big_01_b_blue_F","Land_i_House_Big_01_b_whiteblue_F","Land_i_House_Big_01_b_pink_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_02_b_blue_F","Land_i_House_Big_02_b_white_F","Land_i_House_Big_02_b_whiteblue_F","Land_i_House_Big_02_b_yellow_F","Land_i_House_Big_02_b_brown_F","Land_i_House_Big_02_b_pink_F","Land_House_Big_02_F","Land_House_Big_03_F","Land_i_House_Small_03_V1_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_House_Big_01_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F","Land_i_Stone_HouseSmall_V1_F","Land_House_Small_02_F","Land_HouseA","Land_HouseB","Land_HouseC","Land_HouseD","Land_Hotel_02_F"],50];
				if !(_hs isEqualTo []) then {
					private _h = _hs select 0;
					if !(isNil {_h getVariable "house_owner"}) then {
						_fire = true;
						if((typeOf _h) in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_01_b_white_F","Land_i_House_Big_01_b_brown_F","Land_i_House_Big_01_b_blue_F","Land_i_House_Big_01_b_whiteblue_F","Land_i_House_Big_01_b_pink_F"]) then {
							[_h modelToWorld [-2,2,0.85]] spawn HC_fnc_createFire;
							[_h modelToWorld [-4.5,-2.9,0.88]] spawn HC_fnc_createFire;
							[_h modelToWorld [0,-5.5,-2.6]] spawn HC_fnc_createFire;
							[_h modelToWorld [2.6,4.8,-2.6]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_02_b_blue_F","Land_i_House_Big_02_b_white_F","Land_i_House_Big_02_b_whiteblue_F","Land_i_House_Big_02_b_yellow_F","Land_i_House_Big_02_b_brown_F","Land_i_House_Big_02_b_pink_F"]) then {
							[_h modelToWorld [-0.00878906,4.57483,-2.51054]] spawn HC_fnc_createFire;
							[_h modelToWorld [-2.83789,-3.56226,-2.49814]] spawn HC_fnc_createFire;
							[_h modelToWorld [0.71875,-1.89392,0.911549]] spawn HC_fnc_createFire;
							[_h modelToWorld [-1.36133,0.295654,0.840919]] spawn HC_fnc_createFire;
							[_h modelToWorld [-3.07422,4.73682,0.96611]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_House_Big_02_F"]) then {
							[_h modelToWorld [-10.2852,-0.148438,-1.45213]] spawn HC_fnc_createFire;
							[_h modelToWorld [-6.1748,6.23584,-1.45213]] spawn HC_fnc_createFire;
							[_h modelToWorld [2.44922,7.00562,-1.45213]] spawn HC_fnc_createFire;
							[_h modelToWorld [5.45898,2.38721,-1.45261]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_House_Big_03_F"]) then {
							[_h modelToWorld [6.83008,3.75195,-3.08473]] spawn HC_fnc_createFire;
							[_h modelToWorld [6.77881,0.375,-0.0840416]] spawn HC_fnc_createFire;
							[_h modelToWorld [-14.1377,-4.66602,-0.0846062]] spawn HC_fnc_createFire;
							[_h modelToWorld [10.7354,-2.96094,-3.20923]] spawn HC_fnc_createFire;
							[_h modelToWorld [-10.1597,4.38867,-0.0839882]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_i_House_Small_03_V1_F"]) then {
							[_h modelToWorld [0.375,-2.10498,0.0970993]] spawn HC_fnc_createFire;
							[_h modelToWorld [-1.35254,2.38403,0.101376]] spawn HC_fnc_createFire;
							[_h modelToWorld [3.79883,4.698,0.042408]] spawn HC_fnc_createFire;
							[_h modelToWorld [3.88086,-6.20239,0.0419731]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]) then {
							[_h modelToWorld [4.75879,-2.91699,-0.672543]] spawn HC_fnc_createFire;
							[_h modelToWorld [-3.45483,-2.05762,-0.672855]] spawn HC_fnc_createFire;
							[_h modelToWorld [6.20483,2.50781,-0.797543]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"]) then {
							[_h modelToWorld [3.09375,-4.2522,-1.04694]] spawn HC_fnc_createFire;
							[_h modelToWorld [-3.52832,4.64453,-1.04725]] spawn HC_fnc_createFire;
							[_h modelToWorld [-3.96484,-2.06104,-1.04665]] spawn HC_fnc_createFire;
							[_h modelToWorld [2.96289,4.38721,-1.04699]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_House_Big_01_F","Land_ALF_MaisonModerne","Land_ALF_MaisonModerne_Blanc","Land_ALF_MaisonModerne_Verte","Land_ALF_MaisonModerne_Rouge","Land_ALF_MaisonModerne_Grise"]) then {
							[_h modelToWorld [-6.11523,6.45776,-1.02293]] spawn HC_fnc_createFire;
							[_h modelToWorld [5.90137,6.38867,-1.02333]] spawn HC_fnc_createFire;
							[_h modelToWorld [2.78223,-2.07031,-1.02298]] spawn HC_fnc_createFire;
							[_h modelToWorld [-2.97266,-1.98779,-1.02248]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F"]) then {
							[_h modelToWorld [6.97168,-1.49658,-0.573341]] spawn HC_fnc_createFire;
							[_h modelToWorld [-7.78125,-1.55176,-0.671028]] spawn HC_fnc_createFire;
							[_h modelToWorld [1.52734,1.7666,-0.545692]] spawn HC_fnc_createFire;
							[_h modelToWorld [-8.90625,4.55176,-0.671059]] spawn HC_fnc_createFire;
							[_h modelToWorld [8.57715,4.20654,-0.538673]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_i_Stone_HouseSmall_V1_F"]) then {
							[_h modelToWorld [6.83398,-1.51636,-0.684242]] spawn HC_fnc_createFire;
							[_h modelToWorld [-7.79004,-1.71545,-0.808624]] spawn HC_fnc_createFire;
							[_h modelToWorld [0.857422,1.80566,-0.537552]] spawn HC_fnc_createFire;
							[_h modelToWorld [8.32324,2.98621,-0.537231]] spawn HC_fnc_createFire;
							[_h modelToWorld [-7.97754,4.10461,-0.537148]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_ALF_MaisonMitoyenne","Land_ALF_MaisonMitoyenne1","Land_ALF_MaisonMetal","Land_ALF_MaisonMetal_Blanc","Land_ALF_MaisonMetal_Verte","Land_ALF_MaisonMetal_Rouge","Land_ALF_MaisonMetal_Grise","Land_House_Small_02_F","Land_House_Small_01_F","Land_House_Small_03_F","Land_House_Small_06_F","Land_House_Small_04_F","Land_House_Small_05_F","Land_i_House_Small_01_b_brown_F"]) then {
							[_h modelToWorld [1.20605,-1.29053,-0.732019]] spawn HC_fnc_createFire;
							[_h modelToWorld [1.25,4.80518,-0.732456]] spawn HC_fnc_createFire;
							[_h modelToWorld [-2.00684,-0.0141602,-0.732174]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_HouseA","Land_HouseB","Land_HouseC","Land_HouseD"]) then {
							[_h modelToWorld [-0.894531,-4.43042,0.160141]] spawn HC_fnc_createFire;
							[_h modelToWorld [4.69141,-2.73926,0.134388]] spawn HC_fnc_createFire;
							[_h modelToWorld [-0.333984,10.2185,0.23238]] spawn HC_fnc_createFire;
							[_h modelToWorld [-3.97754,4.1853,0.204387]] spawn HC_fnc_createFire;
							[_h modelToWorld [6.83008,7.98804,0.20466]] spawn HC_fnc_createFire;
							[_h modelToWorld [5.5752,3.90747,0.204819]] spawn HC_fnc_createFire;
							[_h modelToWorld [-0.621094,6.98706,0.204541]] spawn HC_fnc_createFire;
						};
						if ((typeOf _h) in ["Land_Hotel_02_F"]) then {
							[_h modelToWorld [-1.85352,-14.3652,-3.2018]] spawn HC_fnc_createFire;
							[_h modelToWorld [8.79712,2.47119,-3.32633]] spawn HC_fnc_createFire;
							[_h modelToWorld [-9.61182,2.35498,-3.32683]] spawn HC_fnc_createFire;
							[_h modelToWorld [-1.76538,11.9316,-3.32627]] spawn HC_fnc_createFire;
							[_h modelToWorld [-2.02979,-5.01514,-3.32674]] spawn HC_fnc_createFire;
							[_h modelToWorld [-5.85425,0.89502,0.172921]] spawn HC_fnc_createFire;
							[_h modelToWorld [2.75562,0.793457,0.298108]] spawn HC_fnc_createFire;
						};
		
						ALF_HC_Fire pushBack _h;
 						publicVariable "ALF_HC_Fire";

						["INCENDIE","ALERTE INCENDIE !! DEPART D'INCENDIE DANS UNE HABITATION !!"] remoteExec ["ALF_fnc_doMedCall",(playableUnits select {_x getVariable ["MedService",false]})];
						private _co = nearestObjects [[8000,8000,0], ["Land_Casere_P"], 20000];
						[_co] spawn {
							private _com = _this select 0;
							private _timer = 0;
							for "_i" from 0 to 1 step 0 do {
								if(_timer > 2) exitWith {};
								_timer = _timer + 1;
								{
									playSound3D ["ALF_Client2\sounds\pompier_alarm.ogg", _x, false, _x modelToWorld [0,0,0], 1, 1, 150];
								} forEach _com;
								uiSleep 27;
							};
						};
	
						[_h] spawn {
							private _h = _this select 0;
							uiSleep 1500;
							if(_h in ALF_HC_Fire) then {
								[_h] remoteExecCall ["HC_fnc_sellHousemobilier",HC2_Life];
								_h setDamage 1;
							};
						};
					};
				};
			};
		};
	};
	if(_fire) exitWith {};
	if(_step isEqualTo 2 && {_count > 150} && {_object animationSourcePhase "et_1_source" isEqualTo 1} && {_object animationSourcePhase "et_2_source" isEqualTo 1} && {_object animationSourcePhase "et_3_source" isEqualTo 0} && {_object animationSourcePhase "et_4_source" isEqualTo 1}) exitWith {
		_step = 3;
		_object animateSource ["et_3_source",1,true];
		_object animateSource ["et_4_source",0,true];
	};
	_vitesse = 1;
	if(_object animationSourcePhase "hide_uv_source" < 0.9) then {
		_vitesse = _vitesse + 0.4;
		_pure = _pure + 1;
	};
	_count = _count + _vitesse;
	_object setVariable ["pure",_pure];
	uiSleep _speed;
};
