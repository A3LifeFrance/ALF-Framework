/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if(!hasInterface) exitWith {};

0 spawn {
	waitUntil {!isNull player};
	waitUntil {!isNull (findDisplay 46)};

	mav_gps_v_dialog_handlerBlockedUntil = 0;
};