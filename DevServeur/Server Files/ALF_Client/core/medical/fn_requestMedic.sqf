#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_requestMedic.sqf
*/
["SOS","DEPART VSAV !"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];

player setVariable ["requestMedic",true,true];

[] spawn  {
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (2 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};
