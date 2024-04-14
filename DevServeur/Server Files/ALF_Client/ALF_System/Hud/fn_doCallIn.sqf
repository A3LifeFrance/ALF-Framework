/*
	fn_doCallIn.sqf
*/
disableSerialization;

if(isNil "messagecallin_active") exitWith {};

if !(alive player) exitWith {};
if (player getVariable ["ReviveMedic", false]) exitWith {};

for "_i" from 0 to 1 step 0 do {
	if(!messagecallin_active) exitwith {
		11 cutRsc ["RSC_DOCALLPOPUP","PLAIN"];
		private _POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOCALLPOPUP",displayNull];
		messagecallin_active = true;
		private _POPUP = _POPUPCLASS1 displayCtrl 13451;
		_POPUP ctrlSetStructuredText parseText "<img size='2.8' image='\ALF_Client2\icons\ALF_CallIn.paa'/>";
		uiSleep 6;
		messagecallin_active = false;
	};
	uiSleep 0.05;
};
