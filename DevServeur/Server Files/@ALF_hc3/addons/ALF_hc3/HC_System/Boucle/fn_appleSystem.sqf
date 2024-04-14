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
private _obj21 = objNull;
private _obj22 = objNull;
private _obj23 = objNull;
private _obj24 = objNull;
private _obj25 = objNull;
private _obj26 = objNull;
private _obj27 = objNull;
private _obj28 = objNull;
private _obj29 = objNull;
private _obj30 = objNull;
private _obj31 = objNull;
private _obj32 = objNull;
private _obj33 = objNull;
private _obj34 = objNull;
private _obj35 = objNull;
private _obj36 = objNull;
private _obj37 = objNull;
private _obj38 = objNull;
private _obj39 = objNull;
private _obj40 = objNull;
private _obj41 = objNull;
private _obj42 = objNull;
private _obj43 = objNull;
private _obj44 = objNull;
private _obj45 = objNull;
private _obj46 = objNull;
private _obj47 = objNull;
private _obj48 = objNull;
private _obj49 = objNull;
private _obj50 = objNull;

for "_i" from 0 to 1 step 0 do {
	if(isNull _obj OR isNil "_obj") then {_obj = createVehicle ["groundweaponholder", [5478.29,7045.05,0.00143814], [], 0, "CAN_COLLIDE"]; _obj enableDynamicSimulation true;};
	if(isNull _obj2 OR isNil "_obj2") then {_obj2 = createVehicle ["groundweaponholder", [5484,7027.51,0.00133705], [], 0, "CAN_COLLIDE"]; _obj2 enableDynamicSimulation true;};
	if(isNull _obj3 OR isNil "_obj3") then {_obj3 = createVehicle ["groundweaponholder", [5464.94,7018.67,0.00154114], [], 0, "CAN_COLLIDE"]; _obj3 enableDynamicSimulation true;};
	if(isNull _obj4 OR isNil "_obj4") then {_obj4 = createVehicle ["groundweaponholder", [5448.16,7032.21,0.00148392], [], 0, "CAN_COLLIDE"]; _obj4 enableDynamicSimulation true;};
	if(isNull _obj5 OR isNil "_obj5") then {_obj5 = createVehicle ["groundweaponholder", [5440.87,7044.02,0.0015049], [], 0, "CAN_COLLIDE"]; _obj5 enableDynamicSimulation true;};
	if(isNull _obj6 OR isNil "_obj6") then {_obj6 = createVehicle ["groundweaponholder", [5435.15,7057.92,0.00149155], [], 0, "CAN_COLLIDE"]; _obj6 enableDynamicSimulation true;};
	if(isNull _obj7 OR isNil "_obj7") then {_obj7 = createVehicle ["groundweaponholder", [5446.14,7066.17,0.00145721], [], 0, "CAN_COLLIDE"]; _obj7 enableDynamicSimulation true;};
	if(isNull _obj8 OR isNil "_obj8") then {_obj8 = createVehicle ["groundweaponholder", [5470.07,7083.87,0.00148964], [], 0, "CAN_COLLIDE"]; _obj8 enableDynamicSimulation true;};
	if(isNull _obj9 OR isNil "_obj9") then {_obj9 = createVehicle ["groundweaponholder", [5482.23,7097.45,0.00150871], [], 0, "CAN_COLLIDE"]; _obj9 enableDynamicSimulation true;};
	if(isNull _obj10 OR isNil "_obj10") then {_obj10 = createVehicle ["groundweaponholder", [5490.93,7088.03,0.00136566], [], 0, "CAN_COLLIDE"]; _obj10 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 10) then {
			_x addMagazineCargoGlobal ["ALF_Pomme",10];
		};
	} forEach [_obj,_obj2,_obj3,_obj4,_obj5,_obj6,_obj7,_obj8,_obj9,_obj10];

	
	if(isNull _obj11 OR isNil "_obj11") then {_obj11 = createVehicle ["groundweaponholder", [12617.2,4797.69,0.00136948], [], 0, "CAN_COLLIDE"]; _obj11 setVariable ["TakeRaisin",true,true]; _obj11 enableDynamicSimulation true;};
	if(isNull _obj12 OR isNil "_obj12") then {_obj12 = createVehicle ["groundweaponholder", [12628.3,4767.2,0.00136566], [], 0, "CAN_COLLIDE"]; _obj12 setVariable ["TakeRaisin",true,true]; _obj12 enableDynamicSimulation true;};
	if(isNull _obj13 OR isNil "_obj13") then {_obj13 = createVehicle ["groundweaponholder", [12636.2,4770.79,0.00153351], [], 0, "CAN_COLLIDE"]; _obj13 setVariable ["TakeRaisin",true,true]; _obj13 enableDynamicSimulation true;};
	if(isNull _obj14 OR isNil "_obj14") then {_obj14 = createVehicle ["groundweaponholder", [12653.7,4747.55,0.00134659], [], 0, "CAN_COLLIDE"]; _obj14 setVariable ["TakeRaisin",true,true]; _obj14 enableDynamicSimulation true;};
	if(isNull _obj15 OR isNil "_obj15") then {_obj15 = createVehicle ["groundweaponholder", [12667.8,4737.46,0.00137711], [], 0, "CAN_COLLIDE"]; _obj15 setVariable ["TakeRaisin",true,true]; _obj15 enableDynamicSimulation true;};
	if(isNull _obj16 OR isNil "_obj16") then {_obj16 = createVehicle ["groundweaponholder", [12654.8,4774.77,0.00159454], [], 0, "CAN_COLLIDE"]; _obj16 setVariable ["TakeRaisin",true,true]; _obj16 enableDynamicSimulation true;};
	if(isNull _obj17 OR isNil "_obj17") then {_obj17 = createVehicle ["groundweaponholder", [12642.4,4811.73,0.00157166], [], 0, "CAN_COLLIDE"]; _obj17 setVariable ["TakeRaisin",true,true]; _obj17 enableDynamicSimulation true;};
	if(isNull _obj18 OR isNil "_obj18") then {_obj18 = createVehicle ["groundweaponholder", [12645.6,4832.03,0.00156784], [], 0, "CAN_COLLIDE"]; _obj18 setVariable ["TakeRaisin",true,true]; _obj18 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 16) then {
			_x addMagazineCargoGlobal ["ALF_Raisin",4];
		};
	} forEach [_obj11,_obj12,_obj13,_obj14,_obj15,_obj16,_obj17,_obj18];
	

	if(isNull _obj19 OR isNil "_obj19") then {_obj19 = createVehicle ["groundweaponholder", [12417,9872.81,0.00119472], [], 0, "CAN_COLLIDE"]; _obj19 enableDynamicSimulation true;};
	if(isNull _obj20 OR isNil "_obj20") then {_obj20 = createVehicle ["groundweaponholder", [12409.1,9859.14,0.00143886], [], 0, "CAN_COLLIDE"]; _obj20 enableDynamicSimulation true;};
	if(isNull _obj21 OR isNil "_obj21") then {_obj21 = createVehicle ["groundweaponholder", [12396.3,9854.26,0.00143886], [], 0, "CAN_COLLIDE"]; _obj21 enableDynamicSimulation true;};
	if(isNull _obj22 OR isNil "_obj22") then {_obj22 = createVehicle ["groundweaponholder", [12388.1,9842.54,0.00143886], [], 0, "CAN_COLLIDE"]; _obj22 enableDynamicSimulation true;};
	if(isNull _obj23 OR isNil "_obj23") then {_obj23 = createVehicle ["groundweaponholder", [12376.9,9838.91,0.00143886], [], 0, "CAN_COLLIDE"]; _obj23 enableDynamicSimulation true;};
	if(isNull _obj24 OR isNil "_obj24") then {_obj24 = createVehicle ["groundweaponholder", [12370.5,9846.81,0.00143886], [], 0, "CAN_COLLIDE"]; _obj24 enableDynamicSimulation true;};
	if(isNull _obj25 OR isNil "_obj25") then {_obj25 = createVehicle ["groundweaponholder", [12355.3,9860.15,0.00143886], [], 0, "CAN_COLLIDE"]; _obj25 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 6) then {
			_x addMagazineCargoGlobal ["ALF_Huitre",5];
		};
	} forEach [_obj19,_obj20,_obj21,_obj22,_obj23,_obj24,_obj25];
	
	/*if(isNull _obj26 OR isNil "_obj26") then {_obj26 = createVehicle ["groundweaponholder", [871.956,12315.7,0.00143814], [], 0, "CAN_COLLIDE"]; _obj26 enableDynamicSimulation true;};
	if(isNull _obj27 OR isNil "_obj27") then {_obj27 = createVehicle ["groundweaponholder", [988.665,12390.7,0.00143814], [], 0, "CAN_COLLIDE"]; _obj27 enableDynamicSimulation true;};
	if(isNull _obj28 OR isNil "_obj28") then {_obj28 = createVehicle ["groundweaponholder", [987.153,12412.6,0.00143814], [], 0, "CAN_COLLIDE"]; _obj28 enableDynamicSimulation true;};
	if(isNull _obj29 OR isNil "_obj29") then {_obj29 = createVehicle ["groundweaponholder", [827.361,12365.3,0.00143814], [], 0, "CAN_COLLIDE"]; _obj29 enableDynamicSimulation true;};
	if(isNull _obj30 OR isNil "_obj30") then {_obj30 = createVehicle ["groundweaponholder", [853.599,12389,0.00143814], [], 0, "CAN_COLLIDE"]; _obj30 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 6) then {
			_x addMagazineCargoGlobal ["ALF_Bonbon",2];
		};
	} forEach [_obj26,_obj27,_obj28,_obj29,_obj30];*/
	
	if(isNull _obj31 OR isNil "_obj31") then {_obj31 = createVehicle ["groundweaponholder", [3737.68,12788.1,0.00143886], [], 0, "CAN_COLLIDE"]; _obj31 enableDynamicSimulation true;};
	if(isNull _obj32 OR isNil "_obj32") then {_obj32 = createVehicle ["groundweaponholder", [3750.63,12776.4,0.00143886], [], 0, "CAN_COLLIDE"]; _obj32 enableDynamicSimulation true;};
	if(isNull _obj33 OR isNil "_obj33") then {_obj33 = createVehicle ["groundweaponholder", [3754.18,12756.8,0.00143814], [], 0, "CAN_COLLIDE"]; _obj33 enableDynamicSimulation true;};
	if(isNull _obj34 OR isNil "_obj34") then {_obj34 = createVehicle ["groundweaponholder", [3756.11,12741.9,0.00143814], [], 0, "CAN_COLLIDE"]; _obj34 enableDynamicSimulation true;};
	if(isNull _obj35 OR isNil "_obj35") then {_obj35 = createVehicle ["groundweaponholder", [3759.29,12723.8,0.00143814], [], 0, "CAN_COLLIDE"]; _obj35 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 6) then {
			_x addMagazineCargoGlobal ["ALF_Peche",5];
		};
	} forEach [_obj31,_obj32,_obj33,_obj34,_obj35];
	
	if(isNull _obj36 OR isNil "_obj36") then {_obj36 = createVehicle ["groundweaponholder", [2678.01,8417.27,0.00140381], [], 0, "CAN_COLLIDE"]; _obj36 enableDynamicSimulation true;};
	if(isNull _obj37 OR isNil "_obj37") then {_obj37 = createVehicle ["groundweaponholder", [2668.68,8421.96,0.00132751], [], 0, "CAN_COLLIDE"]; _obj37 enableDynamicSimulation true;};
	if(isNull _obj38 OR isNil "_obj38") then {_obj38 = createVehicle ["groundweaponholder", [2659.8,8424.72,0.00136566], [], 0, "CAN_COLLIDE"]; _obj38 enableDynamicSimulation true;};
	if(isNull _obj39 OR isNil "_obj39") then {_obj39 = createVehicle ["groundweaponholder", [2647.06,8430.13,0.0013504], [], 0, "CAN_COLLIDE"]; _obj39 enableDynamicSimulation true;};
	if(isNull _obj40 OR isNil "_obj40") then {_obj40 = createVehicle ["groundweaponholder", [2635.31,8433.98,0.00137329], [], 0, "CAN_COLLIDE"]; _obj40 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 6) then {
			_x addMagazineCargoGlobal ["ALF_Champignon",5];
		};
	} forEach [_obj36,_obj37,_obj38,_obj39,_obj40];
	
	if(isNull _obj41 OR isNil "_obj41") then {_obj41 = createVehicle ["groundweaponholder", [2834.47,11611.9,0.0016346], [], 0, "CAN_COLLIDE"]; _obj41 enableDynamicSimulation true;};
	if(isNull _obj42 OR isNil "_obj42") then {_obj42 = createVehicle ["groundweaponholder", [2830.63,11615.8,0.00163269], [], 0, "CAN_COLLIDE"]; _obj42 enableDynamicSimulation true;};
	if(isNull _obj43 OR isNil "_obj43") then {_obj43 = createVehicle ["groundweaponholder", [2826.11,11620.2,0.00162888], [], 0, "CAN_COLLIDE"]; _obj43 enableDynamicSimulation true;};
	if(isNull _obj44 OR isNil "_obj44") then {_obj44 = createVehicle ["groundweaponholder", [2830.62,11608.4,0.00176811], [], 0, "CAN_COLLIDE"]; _obj44 enableDynamicSimulation true;};
	if(isNull _obj45 OR isNil "_obj45") then {_obj45 = createVehicle ["groundweaponholder", [2826.24,11604.1,0.00113106], [], 0, "CAN_COLLIDE"]; _obj45 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 6) then {
			_x addMagazineCargoGlobal ["ALF_Fraise",5];
		};
	} forEach [_obj41,_obj42,_obj43,_obj44,_obj45];
	
	if(isNull _obj46 OR isNil "_obj46") then {_obj46 = createVehicle ["groundweaponholder", [12474.6,2980.96,0.00147629], [], 0, "CAN_COLLIDE"]; _obj46 enableDynamicSimulation true;};
	if(isNull _obj47 OR isNil "_obj47") then {_obj47 = createVehicle ["groundweaponholder", [12484.5,2979.66,0.00148392], [], 0, "CAN_COLLIDE"]; _obj47 enableDynamicSimulation true;};
	if(isNull _obj48 OR isNil "_obj48") then {_obj48 = createVehicle ["groundweaponholder", [12484.9,2987.71,0.00141144], [], 0, "CAN_COLLIDE"]; _obj48 enableDynamicSimulation true;};
	if(isNull _obj49 OR isNil "_obj49") then {_obj49 = createVehicle ["groundweaponholder", [12475.3,2991.84,0.00138855], [], 0, "CAN_COLLIDE"]; _obj49 enableDynamicSimulation true;};
	if(isNull _obj50 OR isNil "_obj50") then {_obj50 = createVehicle ["groundweaponholder", [12463.8,2985.79,0.00145721], [], 0, "CAN_COLLIDE"]; _obj50 enableDynamicSimulation true;};
	{
		if(count (magazineCargo _x) < 5) then {
			_x addMagazineCargoGlobal ["ALF_Truffe",2];
		};
	} forEach [_obj46,_obj47,_obj48,_obj49,_obj50];
	
	uiSleep 120;
};
