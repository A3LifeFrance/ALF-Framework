/*
	serviceIncendie
*/
if (life_medicLevel < 5) exitWith {["INFO","Tu n'as pas le grade pour cela.","warning"] spawn ALF_fnc_doMsg;};
if((time - life_action_delay) < 5) exitWith {["INFO", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;};

life_action_delay = time;
[] remoteExecCall ["HC_fnc_serviceIncendie",HC3_Life];