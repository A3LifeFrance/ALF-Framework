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

for "_i" from 0 to 1 step 0 do {
	if(isNull _obj1 OR isNil "_obj1") then {_obj1 = createVehicle ["groundweaponholder", [12617.2,4797.69,0.00136948], [], 0, "CAN_COLLIDE"]; _obj1 setVariable ["TakeRaisin",true,true]; _obj1 enableDynamicSimulation true;};
	if(isNull _obj2 OR isNil "_obj2") then {_obj2 = createVehicle ["groundweaponholder", [12628.3,4767.2,0.00136566], [], 0, "CAN_COLLIDE"]; _obj2 setVariable ["TakeRaisin",true,true]; _obj2 enableDynamicSimulation true;};
	if(isNull _obj3 OR isNil "_obj3") then {_obj3 = createVehicle ["groundweaponholder", [12636.2,4770.79,0.00153351], [], 0, "CAN_COLLIDE"]; _obj3 setVariable ["TakeRaisin",true,true]; _obj3 enableDynamicSimulation true;};
	if(isNull _obj4 OR isNil "_obj4") then {_obj4 = createVehicle ["groundweaponholder", [12653.7,4747.55,0.00134659], [], 0, "CAN_COLLIDE"]; _obj4 setVariable ["TakeRaisin",true,true]; _obj4 enableDynamicSimulation true;};
	if(isNull _obj5 OR isNil "_obj5") then {_obj5 = createVehicle ["groundweaponholder", [12667.8,4737.46,0.00137711], [], 0, "CAN_COLLIDE"]; _obj5 setVariable ["TakeRaisin",true,true]; _obj5 enableDynamicSimulation true;};
	if(isNull _obj6 OR isNil "_obj6") then {_obj6 = createVehicle ["groundweaponholder", [12654.8,4774.77,0.00159454], [], 0, "CAN_COLLIDE"]; _obj6 setVariable ["TakeRaisin",true,true]; _obj6 enableDynamicSimulation true;};
	if(isNull _obj7 OR isNil "_obj7") then {_obj7 = createVehicle ["groundweaponholder", [12642.4,4811.73,0.00157166], [], 0, "CAN_COLLIDE"]; _obj7 setVariable ["TakeRaisin",true,true]; _obj7 enableDynamicSimulation true;};
	if(isNull _obj8 OR isNil "_obj8") then {_obj8 = createVehicle ["groundweaponholder", [12645.6,4832.03,0.00156784], [], 0, "CAN_COLLIDE"]; _obj8 setVariable ["TakeRaisin",true,true]; _obj8 enableDynamicSimulation true;};
	if(isNull _obj9 OR isNil "_obj9") then {_obj9 = createVehicle ["groundweaponholder", [12654.5,4831.91,0.0014801], [], 0, "CAN_COLLIDE"]; _obj9 setVariable ["TakeRaisin",true,true]; _obj9 enableDynamicSimulation true;};
	if(isNull _obj10 OR isNil "_obj10") then {_obj10 = createVehicle ["groundweaponholder", [12670,4829.73,0.00130081], [], 0, "CAN_COLLIDE"]; _obj10 setVariable ["TakeRaisin",true,true]; _obj10 enableDynamicSimulation true;};
	if(isNull _obj11 OR isNil "_obj11") then {_obj11 = createVehicle ["groundweaponholder", [12664.5,4846.85,0.00148773], [], 0, "CAN_COLLIDE"]; _obj11 setVariable ["TakeRaisin",true,true]; _obj11 enableDynamicSimulation true;};
	if(isNull _obj12 OR isNil "_obj12") then {_obj12 = createVehicle ["groundweaponholder", [12629.4,4837.24,0.00131607], [], 0, "CAN_COLLIDE"]; _obj12 setVariable ["TakeRaisin",true,true]; _obj12 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 16) then {
			_x addMagazineCargoGlobal ["ALF_Raisin",4];
		};
	} forEach [_obj1,_obj2,_obj3,_obj4,_obj5,_obj6,_obj7,_obj8,_obj9,_obj10,_obj11,_obj12];
	uiSleep 90;
};
