class DefaultEventhandlers;
class CfgPatches {
	class ALF_server {
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "ALF_server.pbo";
		author[]= {"Tonic"};
	};
};

class CfgFunctions {

	class TON_System {
		tag = "TON";
		class Systems {
			file = "\ALF_server\Functions\Systems";
			class clientDisconnect {};
			class adminInvisible {};
		};
		class Reboot {
			file = "\ALF_server\Functions\Reboot";
			class thunderbolt {};
			class hunt {};
		};
	};
};

class CfgVehicles {
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian {
		class EventHandlers;
	};

	class C_man_1 : Civilian_F {
		class EventHandlers: EventHandlers {
			init = "(_this select 0) execVM ""\ALF_server\fix_headgear.sqf""";
		};
	};
};
