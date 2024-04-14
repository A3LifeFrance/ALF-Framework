class CfgPatches {
	class alf_secu {
		author = "ALF - Adam";
		name = "Arma 3 Life France Security";
		url = "https://www.arma3lifefrance.fr/";
		requiredAddons[] = {"A3_Data_F","a3_ui_f","A3_BaseConfig_F","A3_Sounds_F","A3_Anims_F","A3_Anims_F_Config_Sdr","A3_Weapons_F","A3_Structures_F_Naval","A3_Characters_F","A3_Structures_F_Heli_Items_Electronics","A3_Structures_F","A3_Functions_F","ALF_Pompiers","A3_Data_F_ParticleEffects","A3_Animals_F_Beta_Dog"};
		requiredVersion = 1.64;
		units[] = {};
		weapons[] = {};
		addonsversion = "16.00";
	};
};

#include "Rsc_Function.hpp"

class CfgFunctions {
	class alf_secu {
		tag = "ALF";
		class Script {
			file = "alf_secu\script";
			class join {};
		};
	};
};