private _pos = selectRandom [
								[4559.89,11273.9,0.0017395],
								[8098.62,14000.1,0.00143886],
								[5334.4,6424.27,0.00125122],
								[12832.2,10065.8,0.00142479],
								[10204.5,3770.64,0.00145531],
								[8856.81,7214.99,0.00153446]
							];

uiSleep 4000 + ((floor random 10) * 200);

private _c = selectRandom [0,1,2];

if (_c isEqualTo 1) then {
	private _obj = objNull;
	_obj = createVehicle ["groundweaponholder", _pos, [], 0, "CAN_COLLIDE"]; 
	_obj enableDynamicSimulation true;

	private _tresor = selectRandom ["ALF_Relique_1","ALF_Relique_2","ALF_Relique_3"];

	_obj addMagazineCargoGlobal [_tresor,1];

	["Chasseur de trésor",format["D'après nos informations, des archéologues ont découvert des ruines antiques prestigieuses aux alentours du site : %1.",mapGridPosition _pos]] remoteExec ["ALF_fnc_doBfmO",playableUnits];
};

[] spawn HC_fnc_tresorSystem;