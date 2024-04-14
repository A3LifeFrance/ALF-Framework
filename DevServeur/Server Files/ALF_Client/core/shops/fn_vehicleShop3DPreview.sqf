/*
	File: fn_vehicleShop3DPreview.sqf
	Author: NiiRoZz

	Description:
	Called when a new selection is made in the list box and
	displays the new vehicle selected.
*/
private ["_classView","_object","_id","_boat"];

if (isNil "life_preview_3D_vehicle_cam") then {
	[] call life_fnc_vehicleShopInit3DPreview;
};

_classView = _this select 0;
_boat = ["V_ALF_JetSki_Pompier","V_ALF_JetSki_Gendarmerie","V_ALF_DV15_Pompier","V_ALF_DV15_Gendarmerie","V_ALF_Speeder_Yellow","V_ALF_Speeder_Silver","V_ALF_Speeder_Red","V_ALF_Speeder_Purple","V_ALF_Speeder_Pink","V_ALF_Speeder_Orange","V_ALF_Speeder_Green","V_ALF_Speeder_Darkred","V_ALF_Speeder_Darkgreen","V_ALF_Speeder_Blue","V_ALF_Speeder_Black","V_ALF_Speeder_White","V_ALF_Racer_Yellow","V_ALF_Racer_Silver","V_ALF_Racer_Red","V_ALF_Racer_Purple","V_ALF_Racer_Pink","V_ALF_Racer_Orange","V_ALF_Racer_Green","V_ALF_Racer_Darkred","V_ALF_Racer_Darkgreen","V_ALF_Racer_Blue","V_ALF_Racer_Black","V_ALF_Racer_White","V_ALF_Boat_Yacht_F"];


if (_classView != "" && {isClass (configFile >> "CfgVehicles" >> _classView) && {getNumber (configFile >> "CfgVehicles" >> _classView >> "scope") > 0}}) then
{
	if (isNull life_preview_3D_vehicle_object || {_classView != typeOf life_preview_3D_vehicle_object}) then
	{
		if (!isNull life_preview_3D_vehicle_object) then {detach life_preview_3D_vehicle_object; deleteVehicle life_preview_3D_vehicle_object;};
		if (!life_pos_exist) then {
			if(_classView in _boat) then {
				life_pos_attach = [0,0,0];
			} else {
				life_pos_attach = [126.698,275.025,0.1];
			};
			life_pos_exist = true;
			life_preview_light = "#lightpoint" createVehicleLocal [0,0,0];
			life_preview_light setPos life_pos_attach;
			life_preview_light setLightBrightness 0.5;
			life_preview_light setLightColor [1,1,1];
			life_preview_light setLightAmbient [1,1,1];
		};
		_object = _classView createVehicleLocal [0,0,0];
		_object enableSimulation false;
		_object allowDamage false;
		if(_classView in _boat) then {
			_object setPos [0,0,0];
		} else {
			_object setPosATL [126.698,275.025,0.1];
		};

		life_preview_3D_vehicle_object = _object;
	};
};
