/*
	File: fn_flashRadar.sqf
*/
private _radar = _this select 0;
if (isNull _radar) exitWith {};

private _light = "#lightpoint" createVehicleLocal (getPos _radar);
_light setLightBrightness 8;  
_light setLightDayLight true;  
_light setLightColor [1,1,1];  
_light setLightAmbient [1,1,1];
_light setLightUseFlare true; 
_light setLightFlareSize 1.2; 
_light setLightFlareMaxDistance 100; 
_light lightAttachObject [_radar, [-0.09,-0.19,-0.22]];
	
uiSleep 0.4; 
	
deleteVehicle _light;