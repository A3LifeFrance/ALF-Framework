#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callDisablePhone.sqf
Author: ALF Team
Description:

*/
if(ALF_Phone_Avion) then {
	ALF_Phone_Avion = false;
} else {
	ALF_Phone_Avion = true;
};

playSound "nokia_bip";
