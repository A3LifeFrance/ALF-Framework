#include "\ALF_hc\hc_macros.hpp"
/*
	fn_poserC4Prison.sqf
	ALF TEAM
*/
private _prison = _this select 0;
private _unit = _this select 1;
if(isNull _prison || {isNull _unit}) exitWith {};
private _c = {_x getVariable ["PenitService",false]} count playableUnits;
if(_c < 4) exitWith {["PRISON","Il n'y a pas assez de surveillant.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if !(_unit getVariable ["ALF_EnPrison",false]) exitWith {["PRISON","Tu n'es pas prisonnier.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

_prison animate ["explo",0,true];
["ALF_C4_Artisanal",false] remoteExec ["life_fnc_handleItem",_unit];
playSound3D ["ALF_Client2\sounds\banque_activeC4.ogg", _prison, false, (_prison modelToWorld (_prison selectionPosition "action")), 5, 1, 30];
uiSleep 10;

private _bomb = "mini_Grenade" createVehicle [0,0,0];
_bomb setPos (_prison modelToWorld (_prison selectionPosition "action"));
uiSleep 5;
_prison animate ["explo",1,true];
_prison animate ["Hide_Coupe",1,true];
