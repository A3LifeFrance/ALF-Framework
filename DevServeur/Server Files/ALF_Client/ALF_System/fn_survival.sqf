#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_survival.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	All survival? things merged into one thread.
*/
scriptName "Boucle_Survival";
ALF_Survival_fnc_food = compileFinal "
	life_hunger = life_hunger - 10;
	if(life_hunger < 0) then {life_hunger = 0;};
	[13] spawn SOCK_fnc_updatePartial;
	switch(life_hunger) do {
		case 30: {hint localize ""STR_NOTF_EatMSG_1"";};
		case 20: {hint localize ""STR_NOTF_EatMSG_2"";};
		case 10: {
			hint localize ""STR_NOTF_EatMSG_3"";
			player setFatigue 1;
		};
	};
";

ALF_Survival_fnc_water = compileFinal "
	life_thirst = life_thirst - 10;
	if(life_thirst < 0) then {life_thirst = 0;};
	[13] spawn SOCK_fnc_updatePartial;
	switch(life_thirst) do  {
		case 30: {hint localize ""STR_NOTF_DrinkMSG_1"";};
		case 20: {
			hint localize ""STR_NOTF_DrinkMSG_2"";
			player setFatigue 1;
		};
		case 10: {
			hint localize ""STR_NOTF_DrinkMSG_3"";
			player setFatigue 1;
		};
	};
";

ALF_Survival_fnc_myLife = compileFinal "
	if(life_hunger isEqualTo 100 && {life_thirst isEqualTo 100} && {(damage player) < 1}) then {
		player setDamage (damage player) - 0.01;
	};
	if(life_hunger < 2 && {life_is_alive}) then {
		player setDamage (damage player) + 0.05;
		if (getFatigue player < 1) then {
			player setFatigue 1;
		};
	};
	if(life_thirst < 2 && {life_is_alive}) then {
		player setDamage (damage player) + 0.05;
		if (getFatigue player < 1) then {
			player setFatigue 1;
		};
	};
	[13] spawn SOCK_fnc_updatePartial;
";

ALF_Survival_fnc_melee = compileFinal "
	if(((currentWeapon player) in [""ALF_Pioche"",""ALF_Batte"",""ALF_Faux"",""ALF_Hache"",""ALF_Katana""]) && !(""sharp_swing"" in (magazines player)) && ((player ammo (currentWeapon player)) isEqualTo 0)) then {
		player addMagazine ""sharp_swing"";
	};
";

/*
*****************************
****** Medical System *******
*****************************
*/
ALF_Medical_fnc_bpm = compileFinal "
	if(alf_ms_bpm >= 130) then {
		alf_ms_mmHg = alf_ms_mmHg + 10;
	};
	if(alf_ms_bpm <= 60) then {
		alf_ms_mmHg = alf_ms_mmHg - 10;
	};
	alf_ms_mmHg = 0 max alf_ms_mmHg;
	alf_ms_mmHg = 200 min alf_ms_mmHg;
";

ALF_Medical_fnc_mmHg = compileFinal "
	if(alf_ms_mmHg <= 90) then {
		player setDamage (damage player) + .1;
	};
	if(alf_ms_mmHg >= 140) then {
		player setDamage (damage player) - .1;
	};
";

ALF_Medical_fnc_resp = compileFinal "
	if(alf_ms_resp <= 10) then {
		alf_ms_spo2 = alf_ms_spo2 - 10;
		alf_ms_bpm = alf_ms_bpm - 10;
	};
	if(alf_ms_resp >= 30) then {
		alf_ms_bpm = alf_ms_bpm + 15;
	};
	alf_ms_bpm = 0 max alf_ms_bpm;
	alf_ms_bpm = 200 min alf_ms_bpm;
	alf_ms_spo2 = 0 max alf_ms_spo2;
	alf_ms_spo2 = 100 min alf_ms_spo2;
";

ALF_Medical_fnc_pain = compileFinal "
	if(alf_ms_pain >= 50) then {
		alf_ms_bpm = alf_ms_bpm + 15;
	};
	alf_ms_bpm = 0 max alf_ms_bpm;
	alf_ms_bpm = 200 min alf_ms_bpm;
";

ALF_Medical_fnc_spo2 = compileFinal "
	if(alf_ms_spo2 <= 94) then {
		alf_ms_bpm = alf_ms_bpm + 10;
		alf_ms_resp = alf_ms_resp + 5;
	};
	alf_ms_bpm = 0 max alf_ms_bpm;
	alf_ms_bpm = 200 min alf_ms_bpm;
	alf_ms_resp = 0 max alf_ms_resp;
	alf_ms_resp = 60 min alf_ms_resp;
";

ALF_Medical_fnc_bleed = compileFinal "
	alf_ms_mmHg = alf_ms_mmHg - 3;
	alf_ms_mmHg = 0 max alf_ms_mmHg;
	alf_ms_mmHg = 200 min alf_ms_mmHg;
";

ALF_Medical_fnc_heal = compileFinal "
	if(alf_ms_bpm > 60 && {alf_ms_bpm < 110}) then {
		if(alf_ms_resp >= 30) then {
			alf_ms_resp = alf_ms_resp - 3;
		};
		if(alf_ms_resp <= 10) then {
			alf_ms_resp = alf_ms_resp + 3;
		};
		if(alf_ms_mmHg >= 140) then {
			alf_ms_mmHg = alf_ms_mmHg - 5;
		};
		if(alf_ms_mmHg <= 90) then {
			alf_ms_mmHg = alf_ms_mmHg + 5;
		};
	};
	if(alf_ms_resp >= 10 && {alf_ms_resp <= 30}) then {
		if(alf_ms_bpm >= 130) then {
			alf_ms_bpm = alf_ms_bpm - 10;
		};
		if(alf_ms_bpm <= 60) then {
			alf_ms_bpm = alf_ms_bpm + 10;
		};
	};
	if(alf_ms_spo2 >= 94) then {
		if(alf_ms_bpm >= 130) then {
			alf_ms_bpm = alf_ms_bpm - 10;
		};
		if(alf_ms_bpm <= 60) then {
			alf_ms_bpm = alf_ms_bpm + 10;
		};
	};
	if(alf_ms_mmHg >= 90 && {alf_ms_mmHg <= 140}) then {
		if(alf_ms_pain <= 10 && !alf_ms_bleeding) then {
			if(alf_ms_bpm >= 130) then {
				alf_ms_bpm = alf_ms_bpm - 10;
			};
			if(alf_ms_bpm <= 60) then {
				alf_ms_bpm = alf_ms_bpm + 10;
			};
		};
		if(alf_ms_resp >= 30) then {
			alf_ms_resp = alf_ms_resp - 3;
		};
		if(alf_ms_resp <= 10) then {
			alf_ms_resp = alf_ms_resp + 3;
		};
		if(alf_ms_spo2 <= 94) then {
			alf_ms_spo2 = alf_ms_spo2 + 5;
		};
	};
	alf_ms_mmHg = 0 max alf_ms_mmHg;
	alf_ms_mmHg = 200 min alf_ms_mmHg;
	alf_ms_bpm = 0 max alf_ms_bpm;
	alf_ms_bpm = 200 min alf_ms_bpm;
	alf_ms_resp = 0 max alf_ms_resp;
	alf_ms_resp = 60 min alf_ms_resp;
	alf_ms_spo2 = 0 max alf_ms_spo2;
	alf_ms_spo2 = 100 min alf_ms_spo2;
";

/******************************
******************************/

//Setup the time-based variables.
ALF_Survival_foodTime = time;
ALF_Survival_waterTime = time;
ALF_Survival_drunkTime = time;
ALF_Survival_deseaseTime = time;
ALF_Survival_medecineTime = time;
ALF_Survival_myLifeTime = time;
ALF_Survival_timeMelee = time;
ALF_Survival_healTime = time;
ALF_Survival_bleedTime = time;
ALF_Survival_spo2Time = time;
ALF_Survival_painTime = time;
ALF_Survival_respTime = time;
ALF_Survival_mmHgTime = time;
ALF_Survival_bpmTime = time;
ALF_Survival_ARITime = time;
ALF_Survival_walkDis = 0;
ALF_Survival_lastPos = visiblePosition player;
ALF_Survival_lastPos = (ALF_Survival_lastPos select 0) + (ALF_Survival_lastPos select 1);
ALF_Survival_lastState = vehicle player;

[{
	/* Thirst / Hunger adjustment that is time based */
	if((time - ALF_Survival_waterTime) > 1100) then {[] spawn ALF_Survival_fnc_water; ALF_Survival_waterTime = time;};
	if((time - ALF_Survival_foodTime) > 1250) then {[] spawn ALF_Survival_fnc_food; ALF_Survival_foodTime = time;};
	if((time - ALF_Survival_drunkTime) > 360) then {if (life_drunk > 0) then {if (life_drunk isEqualTo 0) then {hint "Tu n'as plus d'alcool dans le sang.";};}; ALF_Survival_drunkTime = time;};
	if((time - ALF_Survival_myLifeTime) > 60) then {[] spawn ALF_Survival_fnc_myLife; ALF_Survival_myLifeTime = time;};
	if((time - ALF_Survival_timeMelee) > 30) then {[] spawn ALF_Survival_fnc_melee; ALF_Survival_timeMelee = time;};

	/* Fumee toxique System */
	if((time - ALF_Survival_ARITime) >= 3) then {
		if (!((hmd player) isEqualTo "ALF_Ari_M") && {count (nearestObjects [player, ["ALF_AmbianceFeuForet"], 20]) > 0}) then {
			player setDamage ((damage player) - 0.05);
		};
		ALF_Survival_ARITime = time;
	};

	/* Medical System */
	if((time - ALF_Survival_bpmTime) > 300 && {alf_ms_active}) then {[] spawn ALF_Medical_fnc_bpm; ALF_Survival_bpmTime = time;};
	if((time - ALF_Survival_mmHgTime) > 180 && {alf_ms_active}) then {[] spawn ALF_Medical_fnc_mmHg; ALF_Survival_mmHgTime = time;};
	if((time - ALF_Survival_respTime) > 240 && {alf_ms_active}) then {[] spawn ALF_Medical_fnc_resp; ALF_Survival_respTime = time;};
	if((time - ALF_Survival_painTime) > 180 && {alf_ms_active}) then {[] spawn ALF_Medical_fnc_pain; ALF_Survival_painTime = time;};
	if((time - ALF_Survival_spo2Time) > 180 && {alf_ms_active}) then {[] spawn ALF_Medical_fnc_spo2; ALF_Survival_spo2Time = time;};
	if((time - ALF_Survival_bleedTime) > 60 && {alf_ms_active} && {alf_ms_bleeding}) then {[] spawn ALF_Medical_fnc_bleed; ALF_Survival_bleedTime = time;};

	if((time - ALF_Survival_healTime) > 60 && {alf_ms_active}) then {[] spawn ALF_Medical_fnc_heal; ALF_Survival_healTime = time;};
	
	if((time - ALF_Survival_deseaseTime) > 300) then {
		ALF_Survival_deseaseTime = time;
		if ((uniform player) isEqualTo "" && {(vehicle player) isEqualTo player}) then {
			if (random(200) < 40) then {
				["rhume"] spawn ALF_fnc_handleDesease;
			};
		};
	};
	
	if((time - ALF_Survival_medecineTime) > 60) then {
		ALF_Survival_medecineTime = time;
		if (count(alf_medecine) > 0) then {
			private _del = 0;
			{
				_amount = (_x select 1) - 60;
				if (_amount <= 0) then {
					alf_medecine = alf_medecine - [_x];
					_del = _del + 1;
				} else {
					(alf_medecine select (_forEachIndex - _del)) set [1,_amount];
				};
			} forEach alf_medecine;
		};
		if (count(alf_vaccins) > 0) then {
			private _del = 0;
			{
				_amount = (_x select 1) - 60;
				if (_amount <= 0) then {
					alf_vaccins = alf_vaccins - [_x];
					_del = _del + 1;
				} else {
					(alf_vaccins select (_forEachIndex - _del)) set [1,_amount];
				};
			} forEach alf_vaccins;
		};
	};

	/* Check if the player's state changed? */
	if(vehicle player != ALF_Survival_lastState OR {!alive player}) then {
		[] call ALF_fnc_updateViewDistance;
		ALF_Survival_lastState = vehicle player;
	};

	/* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
	if(!alive player) then {ALF_Survival_walkDis = 0;} else {
		_curPos = visiblePosition player;
		_curPos = (_curPos select 0) + (_curPos select 1);
		if (!(_curPos isEqualTo ALF_Survival_lastPos) && {(isNull objectParent player)}) then {
			ALF_Survival_walkDis = ALF_Survival_walkDis + 1;
			if (ALF_Survival_walkDis isEqualTo 100) then {
                ALF_Survival_walkDis = 0;
                life_thirst = life_thirst - 1;
                life_hunger = life_hunger - 1;
            };
		};
		ALF_Survival_lastPos = visiblePosition player;
		ALF_Survival_lastPos = (ALF_Survival_lastPos select 0) + (ALF_Survival_lastPos select 1);
	};
}, 1] call CBA_fnc_addPerFrameHandler;