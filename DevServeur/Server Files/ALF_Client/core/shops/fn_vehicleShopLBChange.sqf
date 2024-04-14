#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
[_className] call life_fnc_vehicleShop3DPreview;

_display = findDisplay 2300;
_btnbye = _display displayCtrl 2309;
_btnrent = _display displayCtrl 2308;
_btnbye ctrlEnable false;
_btnrent ctrlEnable false;

_ctrl = _display displayCtrl 2304;
lbClear _ctrl;

if (M_CONFIG(getNumber,"LifeCfgVehicles",_className,"textures") isEqualTo 1) then {
	_colorArray = [
					["Noir","#(argb,8,8,3)color(0,0,0,1.0,co)"],
					["Blanc","#(argb,8,8,3)color(0.996078,1,0.92549,1.0,CO)"],
					["Gris","#(argb,8,8,3)color(0.3,0.3,0.3,1.0,co)"],
					["Rouge","#(argb,8,8,3)color(0.87451,0,0.0196078,1.0,CO)"],
					["Vert","#(argb,8,8,3)color(0.0784314,0.792157,0,1.0,CO)"],
					["Bleu","#(argb,8,8,3)color(0,0.501961,1,1.0,CO)"],
					["Orange","#(argb,8,8,3)color(1,0.423529,0,1.0,CO)"],
					["Jaune","#(argb,8,8,3)color(1,0.776471,0,1.0,CO)"],
					["Rose","#(argb,8,8,3)color(1,0.576471,0.819608,1.0,CO)"],
					["Rouge foncé","#(argb,8,8,3)color(0.4,0,0,1.0,CO)"],
					["Vert foncé","#(argb,8,8,3)color(0,0.25098,0,1.0,CO)"],
					["Bleu foncé","#(argb,8,8,3)color(0,0,0.25098,1.0,CO)"]
				  ];
	{
		_flag = (_x select 1);
		_textureName = (_x select 0);
		_ctrl lbAdd _textureName;
		_ctrl lbSetData [(lbSize _ctrl)-1,_flag];
	} forEach _colorArray;
	
	if !((lbSize _ctrl)-1 isEqualTo -1) then {
		_ctrl lbSetCurSel 0;
	} else {
		_ctrl ctrlShow false;
	};
} else {
	if (M_CONFIG(getNumber,"LifeCfgVehicles",_className,"textures") isEqualTo 2) then {
		_colorArray = M_CONFIG(getArray,"LifeCfgVehicles",_className,"textures_path");
		{
			_flag = (_x select 1);
			_textureName = (_x select 0);
			_ctrl lbAdd _textureName;
			_ctrl lbSetData [(lbSize _ctrl)-1,_flag];
		} forEach _colorArray;
		
		if !((lbSize _ctrl)-1 isEqualTo -1) then {
			_ctrl lbSetCurSel 0;
		} else {
			_ctrl ctrlShow false;
		};
	} else {
		_ctrl ctrlShow false;
	};
};

[_className,player] remoteExec ["HC_fnc_dispoVehicle",HC2_Life];

true;
