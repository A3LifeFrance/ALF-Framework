#include "\ALF_Client\script_macros.hpp"
/*
File: fn_repairCar.sqf
Author: ALF Team
*/
private["_mode","_veh"];
_mode = _this select 0;
_veh = _this select 1;
if(player distance _veh > 6) exitWith {};
if (ALF_Phone_tryCall || {ALF_Phone_inCall} || {ALF_Phone_Ring} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender}) exitWith {};

switch (_mode) do {
	case 1 : {
		life_action_inUse = true;

		private _3dobj = createSimpleObject ["A3\Weapons_F\Items\Toolkit.p3d",[0,0,0]];
		_3dobj attachto [player, [-0.02,0,0], "RightHandMiddle1"];
		_3dobj setDir 0;
		_3dobj setVectorDirAndUp [[0,0,0],[0,0,0]];
		_3dobj setpos (getpos _3dobj);

		private["_ui","_progress","_pgText","_cP","_speed"];
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["Réparation du moteur (1%1)...","%"];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		_speed = 0.01;

		for "_i" from 0 to 1 step 0 do {
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			_cP = _cP + _speed;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["Réparation du moteur (%1%2)...",round(_cP * 100),"%"];
			if(_cP >= 1) exitWith {detach _3dobj;	deletevehicle _3dobj;};
			if(!alive player) exitWith {detach _3dobj;	deletevehicle _3dobj;};
			if(player != vehicle player) exitWith {detach _3dobj;	deletevehicle _3dobj;};
			if(life_interrupted) exitWith {detach _3dobj;	deletevehicle _3dobj;};
			sleep 0.27;
		};

		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; ["Réparation", "Action annulée.", "danger", false] spawn ALF_fnc_doMsg;};
		if(player != vehicle player) exitWith {["Réparation", "Action annulée.", "danger", false] spawn ALF_fnc_doMsg;};
		player switchMove "";
		["Réparation", "Le moteur est réparé.", "success", false] spawn ALF_fnc_doMsg;
		["ALF_Boiteaoutils",false] spawn life_fnc_handleItem;
		detach _3dobj;	deletevehicle _3dobj;

		if(!local _veh) then {
			[_veh,"HitEngine",0] remoteExec ["ALF_fnc_setHPD",_veh];
		} else {
			_veh setHitPointDamage ["HitEngine",0];
		};

		life_action_inUse = false;
	};

	case 2 : {
		life_action_inUse = true;

		private _3dobj = createSimpleObject ["ALF_Mecanique\ALF_KitMecatechnic\ALF_Kit.p3d",[0,0,0]];
		_3dobj attachto [player,[-0.02,0,0], "RightHandMiddle1"];
		_3dobj setDir 0;
		_3dobj setVectorDirAndUp [[0,0,0],[0,0,0]];
		_3dobj setpos (getpos _3dobj);

		private["_ui","_progress","_pgText","_cP","_speed"];
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["Réparation méchatechnique (1%1)...","%"];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		_speed = 0.01;

		for "_i" from 0 to 1 step 0 do {
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			_cP = _cP + _speed;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["Réparation méchatechnique (%1%2)...",round(_cP * 100),"%"];
			if(_cP >= 1) exitWith {detach _3dobj;	deletevehicle _3dobj;};
			if(!alive player) exitWith {detach _3dobj;	deletevehicle _3dobj;};
			if(player != vehicle player) exitWith {detach _3dobj;	deletevehicle _3dobj;};
			if(life_interrupted) exitWith {detach _3dobj;	deletevehicle _3dobj;};
			sleep 0.27;
		};

		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; ["Réparation", "Action annulée.", "danger", false] spawn ALF_fnc_doMsg;};
		if(player != vehicle player) exitWith {["Réparation", "Action annulée.", "danger", false] spawn ALF_fnc_doMsg;};
		player switchMove "";
		["Réparation", "Le véhicule est visuellement réparé.", "success", false] spawn ALF_fnc_doMsg;
		["ALF_KitMecatechnic",false] spawn life_fnc_handleItem;
		detach _3dobj;	deletevehicle _3dobj;

		if(!local _veh) then {
			[_veh,"HitHull",0] remoteExec ["ALF_fnc_setHPD",_veh];
		} else {
			_veh setHitPointDamage ["HitHull",0];
		};

		life_action_inUse = false;
	};
};