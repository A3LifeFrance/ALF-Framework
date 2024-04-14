/*
	fireNozzle
	Nanou
*/
private _p = _this select 0;
private _f = (nearestObjects [_p, ["test_EmptyObjectForFireBig","ALF_GrosFeuForet","ALF_MoyenFeuForet"], 7]) select 0;
if(isNil "_f" OR {isNull _f}) exitWith {};
if(_p distance _f > 5) exitWith {};
private _v = _f getVariable ["firealf",0];
private _typeof = typeOf _f; 

if(_v isEqualTo 0) then {
	if (_typeof isEqualTo "test_EmptyObjectForFireBig") then {
		deleteVehicle _f;
		waitUntil {isNull _f};
		private _c = nearestObjects [_p, ["test_EmptyObjectForFireBig"], 50];
		if(count _c isEqualTo 0) then {
			private _h = nearestObjects [_p, ["Land_ALF_Coco","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_01_b_white_F","Land_i_House_Big_01_b_brown_F","Land_i_House_Big_01_b_blue_F","Land_i_House_Big_01_b_whiteblue_F","Land_i_House_Big_01_b_pink_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_02_b_blue_F","Land_i_House_Big_02_b_white_F","Land_i_House_Big_02_b_whiteblue_F","Land_i_House_Big_02_b_yellow_F","Land_i_House_Big_02_b_brown_F","Land_i_House_Big_02_b_pink_F","Land_House_Big_02_F","Land_House_Big_03_F","Land_i_House_Small_03_V1_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_House_Big_01_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F","Land_i_Stone_HouseSmall_V1_F","Land_House_Small_02_F","Land_HouseA","Land_HouseB","Land_HouseC","Land_HouseD","Land_Hotel_02_F","Land_ALF_station","Land_ALF_Caravane"], 50];
			if(count _h > 0) then {
				{
					if(_x in ALF_HC_Fire) then {
						ALF_HC_Fire deleteAt (ALF_HC_Fire find _x);
						publicVariable "ALF_HC_Fire";
						[_x] spawn ALF_fnc_fireIsDone;
					};
					if(_x getVariable ["trainingfire",false]) then {
						_x setVariable ["trainingfire",false,true];
						["BRAVO","EXERCICE INCENDIE TERMINE FELICITATION !!"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
					};
				} forEach _h;
			};
		};
	} else {
		deleteVehicle _f;
		waitUntil {isNull _f};
		
		if (_typeof isEqualTo "ALF_GrosFeuForet") exitWith {
			private _c = nearestObjects [_p, ["ALF_GrosFeuForet","ALF_MoyenFeuForet"], 250];
			if( (count _c) isEqualTo 0 ) then {
				["BRAVO","VOUS AVEZ ETEINT L'INCENDIE DE FORET FELICITATION !!"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
				[100000] remoteExecCall ["HC_fnc_updateCNP",HC_life];
			};
		};

		if (_typeof in ["ALF_GrosFeuForet","ALF_MoyenFeuForet"]) then {
			private _c = nearestObjects [_p, ["ALF_GrosFeuForet","ALF_MoyenFeuForet"], 250];
			if( (count _c) isEqualTo 0 ) then {
				["BRAVO","VOUS AVEZ ETEINT L'INCENDIE DE FORET FELICITATION !!"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
				[100000] remoteExecCall ["HC_fnc_updateCNP",HC_life];
			};
		};
	};
} else {
	_v = _v - 1;
	
	if (_v <= 30 && {_typeof isEqualTo "ALF_GrosFeuForet"}) then {
		private _f2 = "ALF_MoyenFeuForet" createVehicle (getPos _f);
		deleteVehicle _f;
		_f2 setVariable ["firealf",_v,true];
	} else {
		_f setVariable ["firealf",_v,true];
	};
};
