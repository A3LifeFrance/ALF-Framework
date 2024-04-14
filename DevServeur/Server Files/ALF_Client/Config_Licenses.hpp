/*
*    class:
*        variable = Variable Name
*        displayName = License Name
*        price = License Price
*        illegal = Illegal License
*/
class Licenses {
    class cop {
        variable = "cop";
        displayName = "GENDARME";
        price = 0;
        illegal = false;
    };
    class med {
        variable = "med";
        displayName = "POMPIER";
        price = 0;
        illegal = false;
    };
	class meuf {
        variable = "meuf";
        displayName = "Femme";
        price = 0;
        illegal = false;
    };

    /*
        LICENCES MEDICAL
    */
    class SAMU {
        variable = "SAMU";
        displayName = "SAMU";
        price = 50;
        illegal = false;
    };
	
	/*
        LICENCES AP
    */
    class medWork {
        variable = "medWork";
        displayName = "Medecin du travail";
        price = 50;
        illegal = false;
    };
	class eris {
        variable = "eris";
        displayName = "ERIS";
        price = 50;
        illegal = false;
    };
	class cynoAP {
        variable = "cynoAP";
        displayName = "Equipe cynotechnique";
        price = 50;
        illegal = false;
    };

    /*
        LICENCES GENDARMERIE
    */
    class PMO {
        variable = "PMO";
        displayName = "Peloton Motorisé";
        price = 50;
        illegal = false;
    };
    class SR {
        variable = "SR";
        displayName = "Section Recherche";
        price = 50;
        illegal = false;
    };
	class TIC {
        variable = "TIC";
        displayName = "Technicien IC";
        price = 50;
        illegal = false;
    };
    class PSIG {
        variable = "PSIG";
        displayName = "PSIG";
        price = 50;
        illegal = false;
    };
    class GIGN {
        variable = "GIGN";
        displayName = "GIGN";
        price = 50;
        illegal = false;
    };
    class CYNO {
        variable = "CYNO";
        displayName = "Cynophile";
        price = 50;
        illegal = false;
    };

    /*
        LICENCES PUBLIC
    */

    class driver {
        variable = "driver";
        displayName = "Permis B";
        price = 925;
        illegal = false;
    };
    class trucking {
        variable = "trucking";
        displayName = "Permis C";
        price = 3200;
        illegal = false;
    };
    class boat {
        variable = "boat";
        displayName = "Permis bateau";
        price = 1650;
        illegal = false;
    };
    class moto {
        variable = "moto";
        displayName = "Permis moto";
        price = 850;
        illegal = false;
    };
    class pilot {
        variable = "pilot";
        displayName = "Licence de vol";
        price = 8500;
        illegal = false;
    };
    class home {
        variable = "home";
        displayName = "Droit de Propriété";
        price = 6500;
        illegal = false;
    };
    class gun {
        variable = "gun";
        displayName = "Permis port d'armes";
        price = 6000;
        illegal = false;
    };
	class eboueur {
        variable = "eboueur";
        displayName = "Eboueur";
        price = 7500;
        illegal = false;
    };
    class fisc {
        variable = "fisc";
        displayName = "Agent du fisc";
        price = 99999999;
        illegal = false;
    };
	
	/*
        LICENCES CUSTOM
    */
    class Abelus {
        variable = "Abelus";
        displayName = "Abelus";
        price = 99999999;
        illegal = true;
    };
	class gc {
        variable = "gc";
        displayName = "Golden Corp.";
        price = 99999999;
        illegal = true;
    };
	class bfmCrime {
        variable = "bfmCrime";
        displayName = "Abonnement RonchonTV";
        price = 150000;
        illegal = true;
    };
};
