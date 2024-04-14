#include "\ALF_hc\hc_macros.hpp"

private["_currentArray"];

ALFMARKET_Events = time + (30*60);

ALFMARKET_Items_Groups =
[
	["Pierre",
		[
			["ALF_pierre_small",-1,50,90],
			["ALF_Cuivre",-1,140,260],
			["ALF_Fer",-1,390,600],
			["ALF_Bronze",-1,385,585],
			["ALF_Argent",-1,610,810],
			["ALF_Or",-1,10000,20000]
		],
		1
	],
	["Paysan",
		[
			["ALF_Pomme",-1,10,10],
			["ALF_Peche",-1,10,10],
			["ALF_Raisin",-1,25,25],
			["ALF_Champignon",-1,70,80],
			["ALF_Tabac",-1,30,40],
			["ALF_Fraise",-1,55,75],
			["ALF_Truffe",-1,200,260],
			["ALF_Buche",-1,50,90],
			["ALF_Planche_B",-1,285,485],
			["ALF_Huitre",-1,100,220]
		],
		1
	],
	["Entreprise",
		[
			["ALF_Vin",-1,385,585],
			["ALF_XxX",-1,385,585],
			["ALF_Pinot",-1,385,585],
			["ALF_Whisky",-1,500,900],
			["ALF_Confiture_Fraise",-1,500,900],
			["ALF_Confiture_Pomme",-1,350,600],
			["ALF_Barile_P_F",-1,300,700],
			["ALF_Barile_Station",-1,850,1510],
			["ALF_diamant_taille",-1,1070,1920],
			["ALF_saphir_taille",-1,810,1035]
		],
		1
	],
	["Peche",
		[
			["ALF_Maquereau_Crue_M",-1,50,110],
			["ALF_Maquereau_Cuit_M",-1,100,250],
			["ALF_Sardine",-1,100,250],
			["ALF_Thon",-1,100,250],
			["ALF_Barbeau",-1,100,250],
			["ALF_Saumon",-1,100,250],
			["ALF_Brochet",-1,100,250],
			["ALF_Anguille",-1,100,250],
			["ALF_Tortue",-1,100,250],
			["ALF_Squale",-1,100,250]
		],
		0.8
	],
	["Illegal",
		[
			["ALF_Weed",-1,1200,1800],
			["ALF_Weed_2",-1,1400,1950],
			["ALF_Weed_3",-1,1600,2300],
			["ALF_Weed_P",-1,7200,10800],
			["ALF_Weed_P_2",-1,8400,11700],
			["ALF_Weed_P_3",-1,9600,13800],
			["ALF_Relique_1",-1,19000,21000],
			["ALF_Relique_2",-1,21000,22000],
			["ALF_Relique_3",-1,22000,24000],
			["ALF_Cupidon",-1,70000,90000],
			["ALF_Cocaine",-1,2560,4508],
			["ALF_Cocaine_2",-1,3590,5800],
			["ALF_Meth50",-1,3900,5200],
			["ALF_Meth90",-1,5900,7100]
		],
		1
	]
];

ALFMARKET_Items_Base =
[
	["ALF_Pomme",10],
	["ALF_Peche",10],
	["ALF_Raisin",25],
	["ALF_Champignon",75],
	["ALF_Tabac",35],
	["ALF_Fraise",65],
	["ALF_Truffe",230],
	["ALF_Mais",125],
	["ALF_Buche",65],
	["ALF_Planche_B",120],
	["ALF_Huitre",155],
	["ALF_pierre_small",60],
	["ALF_Cuivre",170],
	["ALF_Fer",500],
	["ALF_Bronze",485],
	["ALF_Argent",710],
	["ALF_Barile_P_F",560],
	["ALF_Barile_Station",1200],
	["ALF_Or",15000],
	["ALF_diamant_taille",1530],
	["ALF_saphir_taille",845],
	["ALF_Weed",1447],
	["ALF_Weed_2",1695],
	["ALF_Weed_3",1695],
	["ALF_Weed_P",7200],
	["ALF_Weed_P_2",8400],
	["ALF_Weed_P_3",9600],
	["ALF_Cocaine",3645],
	["ALF_Cocaine_2",5482],
	["ALF_Meth50",4830],
	["ALF_Meth90",6545],
	["ALF_Relique_1",20000],
	["ALF_Relique_2",21500],
	["ALF_Relique_3",23000],
	["ALF_Cupidon",80000],
	["ALF_Maquereau_Crue_M",60],
	["ALF_Maquereau_Cuit_M",130],
	["ALF_Sardine",80],
	["ALF_Thon",95],
	["ALF_Barbeau",100],
	["ALF_Saumon",110],
	["ALF_Brochet",120],
	["ALF_Anguille",130],
	["ALF_Tortue",140],
	["ALF_Squale",150],
	["ALF_Vin",400],
	["ALF_Pinot",400],
	["ALF_XxX",400],
	["ALF_Confiture_Fraise",800],
	["ALF_Confiture_Pomme",500],
	["ALF_Whisky",750]
];

//[["ALF_Pomme",10,0],["ALF_Peche",10,0],["ALF_Raisin",25,0],["ALF_Champignon",70.07,0],["ALF_Tabac",40,0],["ALF_Fraise",75,0],["ALF_Truffe",260,0],["ALF_Mais",125,26599],["ALF_Buche",90,0],["ALF_Planche_B",485,0],["ALF_Huitre",220,0],["ALF_pierre_small",83.52,0],["ALF_Cuivre",260,0],["ALF_Fer",390,0],["ALF_Bronze",585,0],["ALF_Argent",810,0],["ALF_Barile_P_F",700,0],["ALF_Barile_Station",1510,0],["ALF_Or",20000,0],["ALF_diamant_taille",1035,0],["ALF_diamant_precieux",2035,0],["ALF_saphir_taille",1920,0],["ALF_Weed",1800,0],["ALF_Weed_2",1950,0],["ALF_Weed_3",1950,0],["ALF_Weed_P",2450,0],["ALF_Weed_P_2",2810,0],["ALF_Weed_P_3",3010,0],["ALF_Cocaine",4508,0],["ALF_Cocaine_2",5800,0],["ALF_Meth50",5200,0],["ALF_Meth90",7100,0],["ALF_Relique_1",21000,0],["ALF_Relique_2",22000,0],["ALF_Relique_3",24000,0],["ALF_Cupidon",90000,0],["ALF_Maquereau_Crue_M",104.147,0],["ALF_Maquereau_Cuit_M",249.9,0],["ALF_Sardine",250,0],["ALF_Thon",250,0],["ALF_Barbeau",250,0],["ALF_Saumon",250,0],["ALF_Brochet",250,0],["ALF_Anguille",250,0],["ALF_Tortue",250,0],["ALF_Squale",250,0],["ALF_Vin",400,0],["ALF_Pinot",400,0],["ALF_Confiture_Fraise",900,0],["ALF_Confiture_Pomme",477.9,0],["ALF_Whisky",330,0]]

ALFMARKET_Items_PriceArr = [];
ALFMARKET_sellarraycopy = ALFMARKET_Items_Base;
{
	_currentArray = _x;
	ALFMARKET_Items_PriceArr pushBack [_currentArray select 0,_currentArray select 1,0];
} forEach ALFMARKET_Items_Base;

[1] call HC_fnc_saveBourse;
ALFMARKET_UpdateCount = 0;

uiSleep 5;

for "_i" from 0 to 1 step 0 do {
	uiSleep (5 * 60);
	[0] remoteExecCall ["ALF_fnc_updateClientBourse",RANY];
	uiSleep 5;
	if((time - ALFMARKET_Events) > (30*60)) then {
		[] call HC_fnc_calculBourse;
		ALFMARKET_UpdateCount = ALFMARKET_UpdateCount + 1;
		if ((ALFMARKET_UpdateCount isEqualTo 3)) then {
			[] spawn {
				ALFMARKET_UpdateCount = 0;
				[0] call HC_fnc_saveBourse;
			};
		};
	};
};