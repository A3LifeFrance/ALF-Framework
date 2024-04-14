class CfgPatches {
	class ALF_Frigo {
		author = "ALF - NiiRoZz/Eddy";
		name = "Arma 3 Life France Frigo";
		url = "https://www.arma3lifefrance.fr/";
		requiredAddons[] = {"A3_Structures_F_Furniture"};
		requiredVersion = 0.1;
		units[] = {};
		weapons[] = {};
	};
};

class CfgVehicles {
	class Furniture_base_F;
	class ALF_Gros_Frigo: Furniture_base_F {
		scope = 2;
		author = "Eddy";
		displayName= "Gros Frigo";
		model = "\ALF_Frigo\ALF_Frigo.p3d";
		maximumLoad = 80;
	};
};
