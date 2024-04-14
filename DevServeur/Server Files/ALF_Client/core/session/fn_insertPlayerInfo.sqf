#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Upon first join inital player data is sent to the server and added to the database.
	Setup data gets sent to ALF_server\Functions\MySQL\fn_insertRequest.sqf
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...

[getPlayerUID player,profileName,1000,player] remoteExecCall ["HC_fnc_insertRequest",HC_Life];
