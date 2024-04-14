#include "\ALF_Client\script_macros.hpp"
/*
File: fn_laptopMenu.sqf
Author: ALF Team
*/
private _cursorObject = _this select 0;

life_interrupted = false;
if(count (attachedObjects player) > 0) exitWith {};
if(life_action_inUse) exitWith {};
life_action_inUse = true;

private _3dlaptop = "Land_Laptop_Unfolded_F" createvehicle [0,0,0];
_3dlaptop attachto [player, [-.02,-.006,-0.02], "RightHandMiddle1"];
_3dlaptop setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
_3dlaptop setDir 180;

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _title = "Branchement:";
private _ui = uiNameSpace getVariable  "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep 0.5;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];

	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {detach _3dlaptop;	deletevehicle _3dlaptop;}; //Tazed
	if(life_isknocked) exitWith {detach _3dlaptop;	deletevehicle _3dlaptop;}; //Knocked
	if(life_interrupted) exitWith {detach _3dlaptop;	deletevehicle _3dlaptop;};
	if([player] call ALF_fnc_checkMenotter) exitWith {detach _3dlaptop;	deletevehicle _3dlaptop;};
};
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if([player] call ALF_fnc_checkMenotter) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; ["INFO", "Action annulé.", "warning"] spawn ALF_fnc_doMsg; life_action_inUse = false;};
detach _3dlaptop;	deletevehicle _3dlaptop;

life_action_inUse = false;

createDialog "ALF_Laptop_Dialog";
ALF_retrieveArrayCamera = nil;
[_cursorObject] remoteExecCall ["HC_fnc_getCameraVar",HC_life];
private _listbox = (findDisplay 11500) displayCtrl 11501;
lbClear _listbox;

waitUntil {!(isNil "ALF_retrieveArrayCamera")};
private _cameradata = ALF_retrieveArrayCamera;

if(count _cameradata > 0) then {
	{
		private _time = _x select 0;
		private _count = count(_x select 1);
		_listbox lbAdd format["%1 - %2 visage(s) exploitable.",_time,_count];
		_listbox lbSetdata [(lbSize _listbox)-1,str(_x select 1)];
	} forEach _cameradata;
} else {
	_listbox lbAdd "Aucune donnée";
	_listbox lbSetdata [(lbSize _listbox)-1, "Aucune donnée"];
};
((findDisplay 11500) displayCtrl 11501) lbSetCurSel 0;
