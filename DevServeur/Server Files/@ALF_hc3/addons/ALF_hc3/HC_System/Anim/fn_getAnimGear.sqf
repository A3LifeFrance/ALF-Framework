/*
    File: fn_getAnimGear.sqf
    Author: NiiRoZz

    Description:
    Some information in local client for his position
*/
params [
  ["_typetrader","",[""]]
];

if (_typetrader find "concessionnaire_" > -1) exitWith {
	[["inbasemoves_handsbehindback1","inbasemoves_handsbehindback2"],[[],[],[],["HITMAN_47_DIOR_1",[]],[],[],"H_Hat_grey","G_Aviator",[],["","","","","","ALF_Bague_Homme"]]]
};

if (_typetrader find "gaga_" > -1) exitWith {
	[["",""],[[],[],[],["ALF_CHAW3_D5",[]],[],[],"","",[],["","","","","",""]]]
};

if (_typetrader find "croupier_" > -1) exitWith {
	[["",""],[[],[],[],["HITMAN_47_DIOR_1",[]],[],[],"","",[],["","","","","","ALF_Bague_Homme"]]]
};