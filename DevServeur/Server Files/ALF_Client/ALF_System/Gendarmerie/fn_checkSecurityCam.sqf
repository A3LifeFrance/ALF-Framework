#include "\ALF_Client\script_macros.hpp"
/*
File: fn_checkSecurityCam.sqf
Author: ALF Team
*/
disableSerialization;
private _cursorObject = _this select 0;
if(count (attachedObjects _cursorObject) > 0) exitWith {};

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
		_listbox lbAdd format["%1 - %2 donnée(s) exploitable(s).",_time,_count];
		_listbox lbSetdata [(lbSize _listbox)-1,str(_x select 1)];
	} forEach _cameradata;
} else {
	_listbox lbAdd "Aucune donnée";
	_listbox lbSetdata [(lbSize _listbox)-1, "Aucune donnée"];
};
((findDisplay 11500) displayCtrl 11501) lbSetCurSel 0;
