class ALF_MISSIONS {
	class crime {
		name = "Livraison criminelle";
		prix = 500000;
		vehicle = "Box_Ammo_F";
		positions[] = {
			{10174,14371,0},
			{1739,12333,0},
			{7558,4477,0}
		};
		class stock {
			weapons[] = {
				"KA_SCAR_L_Tan_Hand",
				"KA_SG_550",
				"KA_SG_551",
				"KA_SG_552"
			};
			magazines[] = {
				"30Rnd_556x45_Stanag"
			};
			items[] = {
				"optic_aco"
			};
		};
	};

	class gend {
        name = "Cargaison de la Gendarmerie Nationale";
        prix = 300000;
        vehicle = "V_ALF_Brinks_GND";
		positions[] = {
			{8622,14498,0},
			{5285,7150,0},
			{10988,7005,0}
		};
        class stock {
            weapons[] = {
                "arifle_CTAR_GL_blk_F"
            };
            magazines[] = {
                "20Rnd_762x51_Mag"
            };
            items[] = {
                "bipod_01_F_blk"
            };
        };
	};
};