/*
	createRope
	Nanou
*/
private _v = _this select 0;
if(count ropeAttachedObjects _v > 0) exitWith {["INFO","Quelqu'un utilise actuellement un cable.","warning"] spawn ALF_fnc_doMsg;};

private _r = ropes _v;
if(count _r isEqualTo 0) then {
	player allowDamage false;
	private _rope = ropeCreate [_v, "pos_rope", player, [0,0,0], 50];
	uiSleep 0.3;
	{
		_x setObjectTexture [0, ""];
		_x setObjectTexture [1, "\ALF_Batiments\ALF_Station\proxies\data\Rope_Pompier_CO.paa"];
		_x setObjectTexture [2, ""];
	} forEach ((player nearObjects ["ropesegment", 100]) + (player nearObjects ["rope", 100]));
	[_rope] spawn {
		_rope = _this select 0;
		uiSleep 1.5;
		if !(isNull _rope) then {
			[_rope] remoteExecCall ["ALF_fnc_updateRope",0,_rope];
		};
	};
	for "_i" from 0 to 1 step 0 do {
		if (isNull ropeAttachedTo player) exitWith {player allowDamage true;};
		if !(currentWeapon player isEqualTo "ALF_FireNozzle") exitWith {{player ropeDetach _x} forEach (ropes _v); player allowDamage true;};
		[player,"RightForeArmRoll",[0,0,0]] ropeAttachTo (ropes _v select 0);
		player setAmmo [currentWeapon player, 100];
		sleep 0.05;
	};
} else {
	[player,"RightForeArmRoll",[0,0,0]] ropeAttachTo (_r select 0);
	player allowDamage false;
	for "_i" from 0 to 1 step 0 do {
		if (isNull ropeAttachedTo player) exitWith {player allowDamage true;};
		if !(currentWeapon player isEqualTo "ALF_FireNozzle") exitWith {{player ropeDetach _x} forEach _r; player allowDamage true;};
		[player,"RightForeArmRoll",[0,0,0]] ropeAttachTo (ropes _v select 0);
		player setAmmo [currentWeapon player, 100];
		sleep 0.05;
	};
};
