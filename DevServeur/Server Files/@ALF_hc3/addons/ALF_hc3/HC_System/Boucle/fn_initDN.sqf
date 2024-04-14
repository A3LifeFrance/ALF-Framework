/*
	File: fn_initDN.sqf
*/
for "_i" from 0 to 1 step 0 do {
	uiSleep 60;
	private _a = ["SELECT active FROM cyber WHERE id='0'",2] call HC_fnc_asyncCall;
	if(_a isEqualTo 0) then {};
};
