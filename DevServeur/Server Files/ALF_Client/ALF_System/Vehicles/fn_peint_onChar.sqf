/*	
	ALF Adam
*/

private _control = _this select 0;
private _code = _this select 1;
private _slider = _this select 2;

disableSerialization;
if(isNull _control) exitWith {};
if (isNull ALF_Peinture_NearestVehicle) exitWith {};

private _text = toArray(ctrlText _control);
private _badChar = false;
{if(!(_x in toArray("0123456789."))) exitWith {_badChar = true;};} forEach _text;
if(_badChar) exitWith {["Peinture", "Seul les nombres sont autorisés.", "danger", false] spawn ALF_fnc_doMsg;};

private _value = parseNumber(ctrlText _control);
_value = _value / 255;
switch(_slider) do {
	case "red": {sliderSetPosition [89771, _value];};
	case "green": {sliderSetPosition [89772, _value];};
	case "blue": {sliderSetPosition [89773, _value];};
	default {sliderSetPosition [89771, _value];};
};

private _texture = format ["#(argb,8,8,3)color(%1,%2,%3,1.0,co)",(sliderPosition 89771),(sliderPosition 89772),(sliderPosition 89773)];
ALF_Peinture_NearestVehicle setObjectTextureGlobal [0, _texture];
ALF_Peinture_CurrentTexture = _texture;