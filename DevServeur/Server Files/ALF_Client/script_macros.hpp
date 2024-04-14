#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define CASH life_cash
#define RSERV 2 //Only server
#define RCLIENT -2 //Except server
#define RANY 0 //Global
#define SVAR_MNS missionNamespace setVariable
#define SVAR_UINS uiNamespace setVariable
#define SVAR_PNS parsingNamespace setVariable
#define SVAR_PNAS profileNamespace setVariable
#define GVAR_MNS missionNamespace getVariable
#define GVAR_UINS uiNamespace getVariable
#define GVAR_PNAS profileNamespace getVariable
#define CONST(var1,var2) var1 = compileFinal (if(var2 isEqualType "") then {var2} else {str(var2)})
#define GVAR getVariable
#define SVAR setVariable
#define RIFLE primaryWeapon player
#define RIFLE_ITEMS primaryWeaponItems player
#define PISTOL handgunWeapon player
#define LAUNCHER secondaryWeapon player
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[ctrl,lbCurSel ctrl])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index
#define LICENSE_VARNAME(varName) format["license_%1",M_CONFIG(getText,"Licenses",varName,"variable")]
#define LICENSE_VALUE(varName) GVAR_MNS [LICENSE_VARNAME(varName),false]
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitWith { _res = true };} forEach _types;_res}
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
#define CONFIG_VEHICLES "CfgVehicles"
#define CONFIG_LIFE_VEHICLES "LifeCfgVehicles"
#define CONFIG_WEAPONS "CfgWeapons"
#define CONFIG_MAGAZINES "CfgMagazines"
#define CONFIG_GLASSES "CfgGlasses"