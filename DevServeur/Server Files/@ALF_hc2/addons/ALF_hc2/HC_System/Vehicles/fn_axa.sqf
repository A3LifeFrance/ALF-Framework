/*
	File: fn_axa.sqf
	Author: ALF Team
*/
private _m = _this select 0;
private _uid = _this select 1;
private _u = _this select 2;

switch (_m) do {
	case 0 : {
		private _q = format ["UPDATE players SET axa='0', axabank='0', axacount='0', axaprocount='0' WHERE playerid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;
		uiSleep 0.5;
		_q = format ["UPDATE vehicles SET insure='0' WHERE pid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;

		{
			private _veh = _x;
			private _dbInfo = _veh getVariable["dbInfo",[]];
			if(count _dbInfo > 0) then {
				if((_dbInfo select 0) isEqualTo _uid) then {
					_dbInfo set[2,0];
					_veh setVariable["dbInfo",_dbInfo];
					_veh animateSource ["assu", 1, true];
				};
			};
		} forEach (entities [["Car","Air","Ship"], [], false, true]);
		["AXA","Ton abonnement a bien été résilié.","success"] remoteExec ["ALF_fnc_doMsg",_u];
	};
	case 1 : {
		private _q = format ["UPDATE players SET axa='1' WHERE playerid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;
		["AXA","Ton abonnement a bien été acheté. 150€ ont été débité sur ton livret A.","success"] remoteExec ["ALF_fnc_doMsg",_u];
	};
	case 2 : {
		private _q = format ["UPDATE players SET axa='2' WHERE playerid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;
		["AXA","Ton abonnement a bien été acheté. 300€ ont été débité sur ton livret A.","success"] remoteExec ["ALF_fnc_doMsg",_u];
	};
	case 3 : {
		private _q = format ["UPDATE players SET axa='3' WHERE playerid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;
		["AXA","Ton abonnement a bien été acheté. 700€ ont été débité sur ton livret A.","success"] remoteExec ["ALF_fnc_doMsg",_u];
	};
	case 4 : {
		private _q = format ["UPDATE players SET axabank='0' WHERE playerid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;
		["AXA","Ton abonnement sera prélevé sur ton Livret A.","success"] remoteExec ["ALF_fnc_doMsg",_u];
	};
	case 5 : {
		private _q = format ["UPDATE players SET axabank='1' WHERE playerid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;
		["AXA","Ton abonnement sera prélevé sur ton Livret B.","success"] remoteExec ["ALF_fnc_doMsg",_u];
	};
	case 6 : {
		private _q = format ["UPDATE players SET axabank='2' WHERE playerid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;
		["AXA","Ton abonnement sera prélevé sur ton Livret C.","success"] remoteExec ["ALF_fnc_doMsg",_u];
	};
	case 7 : {
		private _q = format ["UPDATE players SET axa='4' WHERE playerid='%1'",_uid];
		[_q,1] call HC_fnc_asyncCall;
		["AXA","Ton abonnement a bien été acheté. 2499€ ont été débité sur ton livret A.","success"] remoteExec ["ALF_fnc_doMsg",_u];
	};
};
