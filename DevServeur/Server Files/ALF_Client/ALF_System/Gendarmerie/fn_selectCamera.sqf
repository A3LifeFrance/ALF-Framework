params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit || hcam_active) exitWith {};

_neck = "Sign_Sphere10cm_F" createVehicleLocal position player;
_pilot = "Sign_Sphere10cm_F" createVehicleLocal position player;
_target = "Sign_Sphere10cm_F" createVehicleLocal position player;
hideObject _neck; 
hideObject _pilot; 
hideObject _target; 
_target attachTo [_neck,[0.5,10,0]];

private _old = "";

private _cam = "camera" camCreate getpos _unit;	
waitUntil {_cam != ObjNull};
808 cutRsc ["ALFCamera", "PLAIN"];

(uiNamespace getVariable "hcam_ctrl_pip") ctrlsettext "#(argb,256,256,1)r2t(rendertarget0,1.0)";

_cam attachTo [_neck,[-0.18,0.08,0.05]];
_cam camSetFov 0.6;
_cam camSetTarget _target;
_cam camCommit 2;

"rendertarget0" setPiPEffect [3, 1, 0.8, 1, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];

private _camOn = true;
hcam_active = true;

while {_cam != ObjNull} do {
	if (uniform _unit isEqualTo "") then {
		_cam cameraEffect ["TERMINATE", "BACK"];
		_camOn = false;
		camDestroy _cam;
	} else {
		if (name _unit != _old) then {
			_neck attachTo [_unit,[0,0,0],"neck"];
			_pilot attachTo [_unit,[0,0,0],"pilot"];
			_old = name _unit;
			_cam cameraEffect ["INTERNAL", "BACK","rendertarget0"];
		};
	   
		if (!_camOn) then {
			_cam cameraEffect ["INTERNAL", "BACK","rendertarget0"];
			"rendertarget0" setPiPEffect [3, 1, 0.8, 1, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];
			(uiNamespace getVariable "hcam_ctrl_pip") ctrlsettext "#(argb,256,256,1)r2t(rendertarget0,1.0)";
			_camOn = true;
		};

		if (_camOn) then {
			_veh = vehicle _unit;

			if (_unit != _veh) then {
				_mempoints = getArray ( configfile >> "CfgVehicles" >> (typeOf _veh) >> "memoryPointDriverOptics" );
				_cam attachTo [_veh,[0,0,0], _mempoints select 0];
				_target attachTo [_veh,[0,1,0], _mempoints select 0];
			} else {
				_pos1 = _unit worldToModel getPos _pilot;
				_pos2 = _unit worldToModel getPos _neck;

				_vx1 = (_pos1 select 0) - (_pos2 select 0);
				_vy1 = (_pos1 select 1) - (_pos2 select 1);
				_vz1 = (_pos1 select 2) - (_pos2 select 2);
				_dir = (_vx1 atan2 _vy1) - 25;
				_dive = (_vy1 atan2 _vz1) + 35; 
			  
				if ((sin _dive) == 0) then {_dive = _dive +1};
				_tz = ((1 / sin _dive) * cos _dive); 	
				
				_cam attachTo [_neck,[-0.18,0.08,0.05]];
				_target attachTo [_neck,[0.5,10,_tz*10]];
				_neck setDir _dir;
			  
				sleep 0.1;
			};
		};
		
		sleep 0.5;
	};
};

808 cutFadeOut 0;
hcam_active = false;
deleteVehicle _neck;
deleteVehicle _pilot;
deleteVehicle _target;