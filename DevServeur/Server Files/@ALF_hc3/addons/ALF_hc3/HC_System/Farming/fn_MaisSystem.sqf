/*
	This file is for Nanou's HeadlessClient.
*/
params [
	["_object",objNull,[objNull]],
	["_speed","",[""]]
];

if(_speed isEqualTo "FAST") then {
	uiSleep (random(60)+100);
} else {
	uiSleep (random(60)+100);
};

_object animateSource ["et_1_source",0,true];

if(_speed isEqualTo "FAST") then {
	uiSleep (random(80)+100);
} else {
	uiSleep (random(80)+100);
};

_object animateSource ["et_2_source",0,true];
_object animateSource ["et_1_source",1,true];

if(_speed isEqualTo "FAST") then {
	uiSleep (random(100)+100);
} else {
	uiSleep (random(100)+100);
};

_object animateSource ["et_3_source",0,true];
_object animateSource ["et_2_source",1,true];

if(_speed isEqualTo "FAST") then {
	uiSleep (random(120)+150);
} else {
	uiSleep (random(120)+150);
};

_object animateSource ["et_4_source",0,true];
_object animateSource ["et_3_source",1,true];
