/*
	File: fn_initReboot.sqf
*/
private _o = nearestObjects [[8000,8000,0], ["Land_ALF_Store"], 20000];

for "_i" from 0 to 1 step 0 do {
	uiSleep 60;
	private _c = (["SELECT COUNT(*) FROM reboot WHERE id='1' AND start='1'",2] call HC_fnc_asyncCall) select 0;
	if(_c > 0) exitWith {
		["ALERTE TEMPETE","Une tempête s'apprête à frapper Belle-Ile-en-mer. L'île vient d'être placée en alerte rouge. Le gouvernement demande à tous les citoyens de se mettre à l'abri et de garer leur véhicule sur le bas côté de la route."] remoteExec ["ALF_fnc_doBfmO",playableUnits];
		uiSleep 15;
		{_x animateSource ["Grille_source",0];} forEach _o;
		[15,5+random 60,30+random 60,true,true,true] remoteExec ["TON_fnc_thunderbolt",2];
		["UPDATE reboot SET start='0' WHERE id='1'",1] call HC_fnc_asyncCall;
	};
};
