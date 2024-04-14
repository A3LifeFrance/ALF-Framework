#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF NiiRoZz
*/
//Format de la date [Y,M,D,H,M,S]
params [
  ["_date",[],[[],""]]
];

if (_date isEqualTo []) exitWith {"Erreur"};

format ["%1/%2/%3 %4:%5:%6",[_date select 2,"0" + (str (_date select 2))] select (_date select 2 < 10),[_date select 1,"0" + (str (_date select 1))] select (_date select 1 < 10),[_date select 0,"0" + (str (_date select 0))] select (_date select 0 < 10),[_date select 3,"0" + (str (_date select 3))] select (_date select 3 < 10),[_date select 4,"0" + (str (_date select 4))] select (_date select 4 < 10),[_date select 5,"0" + (str (_date select 5))] select (_date select 5 < 10)]
