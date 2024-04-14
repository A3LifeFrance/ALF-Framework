/*
	File: fn_spawnVideo.sqf
	Author: ALF Team
*/
cutText ["", "BLACK FADED", 19];

player setVariable ["tf_globalVolume", 0];
1 fadeSound 0;

disableUserInput true;
showCinemaBorder false;
player allowDamage false;
player enableSimulation false;

["\ALF_Client2\videos\intro.ogv"] call BIS_fnc_playVideo;

player setPosATL life_civ_position;

player allowDamage true;
player enableSimulation true;
disableUserInput false;

player setVariable ["tf_globalVolume", 1.0];
1 fadeSound 1;

ALF_PlayingVideo = true;
