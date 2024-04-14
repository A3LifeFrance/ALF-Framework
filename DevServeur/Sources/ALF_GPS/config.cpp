class CfgPatches {
	class ALF_GPS {
		author = "ALF - Nanou";
		name = "Arma 3 Life France GPS";
		url = "https://www.arma3lifefrance.fr/";
		requiredAddons[] = {};
		requiredVersion = 0.1;
		units[] = {};
		weapons[] = {};
	};
};

class CfgSounds {
	#include "\ALF_GPS\metal\sounds.hpp"
	#include "\ALF_GPS\metal_ronchon\sounds.hpp"
	#include "\ALF_GPS\bamako\sounds.hpp"
	#include "\ALF_GPS\femmebelge\sounds.hpp"
};
