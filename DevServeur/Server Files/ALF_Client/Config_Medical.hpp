class ALF_DESEASES {
	class rhume {
		name = "Rhume";
		event_sounds[] = {"rhume_1","rhume_2"};
		event_contagion_chance = 1;
		reduce_fatigue = 0;
		protect_contamination_air[] = {"ALF_Mask_Samu"};
	};
	class toux {
		name = "Toux";
		event_sounds[] = {"cough_0","cough_1","cough_2"};
		event_contagion_chance = 1;
		reduce_fatigue = 0.20;
		protect_contamination_air[] = {"ALF_Mask_Samu"};
	};
};

class ALF_MEDECINE {
	class ALF_Medoc_rhume {
		interval = 300;
		class heal {
			class rhume {
				max = 6;
				min = 1;
			};
		};
	};
	class ALF_Medoc_toux {
		interval = 600;
		class heal {
			class toux {
				max = 6;
				min = 1;
			};
		};
	};
};

class ALF_VACCINS {
	class ALF_Prevention_rhume {
		time = 43000;
		class protect {
			class Rhume {};
		};
	};
	class ALF_Prevention_toux {
		time = 35000;
		class protect {
			class Toux {};
		};
	};
};