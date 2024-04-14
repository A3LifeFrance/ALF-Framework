/*
	This file is for Nanou's HeadlessClient.
*/
private _obj = objNull;
private _obj2 = objNull;
private _obj3 = objNull;
private _obj4 = objNull;
private _obj5 = objNull;
private _obj6 = objNull;
private _obj7 = objNull;
private _obj8 = objNull;
private _obj9 = objNull;
private _obj10 = objNull;
private _obj11 = objNull;
private _obj12 = objNull;
private _obj13 = objNull;
private _obj14 = objNull;
private _obj15 = objNull;
private _obj16 = objNull;
private _obj17 = objNull;
private _obj18 = objNull;
private _obj19 = objNull;
private _obj20 = objNull;

for "_i" from 0 to 1 step 0 do {
	if(isNull _obj OR isNil "_obj") then {_obj = createVehicle ["ALF_Poubelle", [8512.48,9523.77,0.0014348], [], 0, "NONE"]; [_obj,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj2 OR isNil "_obj2") then {_obj2 = createVehicle ["ALF_Poubelle", [8304.64,9564.49,0.00310707], [], 0, "NONE"]; [_obj2,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj3 OR isNil "_obj3") then {_obj3 = createVehicle ["ALF_Poubelle", [8682.5,9388.85,0.00139046], [], 0, "NONE"];[_obj3,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj4 OR isNil "_obj4") then {_obj4 = createVehicle ["ALF_Poubelle", [8155.17,8473.5,0.00143814], [], 0, "NONE"];[_obj4,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj5 OR isNil "_obj5") then {_obj5 = createVehicle ["ALF_Poubelle", [6565.05,7071.68,0.00151443], [], 0, "NONE"];[_obj5,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj6 OR isNil "_obj6") then {_obj6 = createVehicle ["ALF_Poubelle", [6098.14,7237.7,0.00156212], [], 0, "NONE"];[_obj6,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj7 OR isNil "_obj7") then {_obj7 = createVehicle ["ALF_Poubelle", [5390.49,7199.09,0.00142288], [], 0, "NONE"];[_obj7,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj8 OR isNil "_obj8") then {_obj8 = createVehicle ["ALF_Poubelle", [4347.58,8796.73,0.00142479], [], 0, "NONE"];[_obj8,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj9 OR isNil "_obj9") then {_obj9 = createVehicle ["ALF_Poubelle", [4429.49,11024.3,0.00112152], [], 0, "NONE"];[_obj9,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj10 OR isNil "_obj10") then {_obj10 = createVehicle ["ALF_Poubelle", [6724.17,8734.72,0.00148582], [], 0, "NONE"];[_obj10,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj11 OR isNil "_obj11") then {_obj11 = createVehicle ["ALF_Poubelle", [6741.46,8364.27,0.00142479], [], 0, "NONE"];[_obj11,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj12 OR isNil "_obj12") then {_obj12 = createVehicle ["ALF_Poubelle", [2981.17,12525.8,0.00143886], [], 0, "NONE"];[_obj12,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj13 OR isNil "_obj13") then {_obj13 = createVehicle ["ALF_Poubelle", [3488.31,12582.5,0.00143886], [], 0, "NONE"];[_obj13,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj14 OR isNil "_obj14") then {_obj14 = createVehicle ["ALF_Poubelle", [2013.41,12906.7,0.00138855], [], 0, "NONE"];[_obj14,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj15 OR isNil "_obj15") then {_obj15 = createVehicle ["ALF_Poubelle", [14131.7,3663.94,0.00143814], [], 0, "NONE"];[_obj15,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj16 OR isNil "_obj16") then {_obj16 = createVehicle ["ALF_Poubelle", [13486.5,3867.24,0.00143814], [], 0, "NONE"];[_obj16,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj17 OR isNil "_obj17") then {_obj17 = createVehicle ["ALF_Poubelle", [12263.5,4710.06,0.00152969], [], 0, "NONE"];[_obj17,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj18 OR isNil "_obj18") then {_obj18 = createVehicle ["ALF_Poubelle", [8020.02,9387.17,0.00145721], [], 0, "NONE"];[_obj18,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj19 OR isNil "_obj19") then {_obj19 = createVehicle ["ALF_Poubelle", [7394.66,9210.07,0.00148249], [], 0, "NONE"];[_obj19,false] remoteExecCall ["enableSimulationGlobal",2];};
	if(isNull _obj20 OR isNil "_obj20") then {_obj20 = createVehicle ["ALF_Poubelle", [8499.11,7671.73,0.00144958], [], 0, "NONE"];[_obj20,false] remoteExecCall ["enableSimulationGlobal",2];};
	{
		if(count (magazineCargo _x) < 10) then {
			_x addMagazineCargoGlobal ["ALF_Dechets",2];
		};
	} forEach [_obj,_obj2,_obj3,_obj4,_obj5,_obj6,_obj7,_obj8,_obj9,_obj10,_obj11,_obj12,_obj13,_obj14,_obj15,_obj16,_obj17,_obj18,_obj19,_obj20];
	
	uiSleep 900;
};