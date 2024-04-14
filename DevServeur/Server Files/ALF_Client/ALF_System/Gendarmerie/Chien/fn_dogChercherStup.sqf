/*
	File: fn_dogChercherStup.sqf
	Author: ALF TEAM
*/
private _dog = player getvariable ["ALF_Dog", objNull];
private _target = cursorObject;

if (isNull _dog || {isNull _target}) exitWith {};
if (!(_target isKindOf "CAManBase") && !(_target isKindOf "Car")) exitWith {};

player setVariable ["ALF_dogAction","chercherStup"];

_dog moveTo (getPosATL _target);
[player,"ALF_Sifler"] remoteExecCall ["life_fnc_say3D",0];

waitUntil {_dog distance2D _target < 3};

private _c = {_x in ["ALF_Graine_W","ALF_Weed","ALF_Weed_2","ALF_Weed_3","ALF_Weed_P","ALF_Weed_P_2","ALF_Weed_P_3","ALF_Cocaine_U","ALF_Cocaine","ALF_Cocaine_2","ALF_Meth50","ALF_Meth90"]} count (magazines _target);

if (life_penit > 0) then {
	_c = _c + ({_x in ["C2_Mag","IEDUrbanSmall_Remote_Mag","KA_MK2","IEDLandSmall_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDUrbanSmall_Remote_Mag","DemoCharge_Remote_Mag","IEDLandBig_Remote_Mag","MiniGrenade"]} count (magazines _target));
};

if (_c > 0) then {
	_dog playMoveNow "Dog_Idle_Growl";
	["Chien", "Je crois que danny a trouvé quelque chose", "success", false] spawn ALF_fnc_doMsg;
} else {
	["Chien", "Je crois que danny n'a rien trouvé", "success", false] spawn ALF_fnc_doMsg;
};

player setVariable ["ALF_dogAction",""];