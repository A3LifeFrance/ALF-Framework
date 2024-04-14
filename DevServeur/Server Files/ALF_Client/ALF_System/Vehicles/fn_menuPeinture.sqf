/*
	File: fn_menuPeinture.sqf
	Author: ALF NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_param",[],[[]]]
];
disableSerialization;

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	//Lancement Dialog
	case 0: {
		ALF_Peinture_NearestVehicle = (nearestObjects [player, ["Car"], 10]) select 0;

		if(isNil "ALF_Peinture_NearestVehicle") exitWith {["INFO", "Aucun vehicule proche.", "danger"] spawn ALF_fnc_doMsg;};
		if (!(createDialog "alfpeinture")) exitWith {};

		ALF_Peinture_Appliquer = false;
		ALF_Peinture_Texture = (getObjectTextures ALF_Peinture_NearestVehicle) select 0;
		ALF_Peinture_Materiel = (getObjectMaterials ALF_Peinture_NearestVehicle) select 0;
		ALF_Peinture_CurrentRvmat = "";
		ALF_Peinture_CurrentTexture = "";

		waitUntil {!(isNull (findDisplay 89770))};
		private _display = findDisplay 89770;

		//On setup la range des sliders
		{
			_control = _display displayCtrl _x;
			_control sliderSetRange [0, 1];
			_control sliderSetPosition 0;
		} forEach [89771,89772,89773];

		//On setup les RVMAT
		{
			_control = _display displayCtrl 89774;
			_index = _control lbAdd (_x select 0);
			_control lbSetData [_index, (_x select 1)];
		} forEach [["Effet Mat leger","\ALF_Vehicules\ALF_Q7\rvmats\Skin_2.rvmat"],
				   ["Effet carosserie classique","\ALF_Vehicules\ALF_Q7\rvmats\Skin.rvmat"],
				   ["Effet mat clasique","\ALF_Vehicules\ALF_Q7\rvmats\interieur.rvmat"],
				   ["Nacre Bleue","\ALF_Vehicules\ALF_data\PeintureNacre\Blue.rvmat"],
				   ["Nacre Vert Fonce","\ALF_Vehicules\ALF_data\PeintureNacre\Darkgreen.rvmat"],
				   ["Nacre Rouge Fonce","\ALF_Vehicules\ALF_data\PeintureNacre\Darkred.rvmat"],
				   ["Nacre Vert","\ALF_Vehicules\ALF_data\PeintureNacre\Green.rvmat"],
				   ["Nacre Orange","\ALF_Vehicules\ALF_data\PeintureNacre\Orange.rvmat"],
				   ["Nacre Rose","\ALF_Vehicules\ALF_data\PeintureNacre\Pink.rvmat"],
				   ["Nacre Violet","\ALF_Vehicules\ALF_data\PeintureNacre\Purple.rvmat"],
				   ["Nacre Rouge","\ALF_Vehicules\ALF_data\PeintureNacre\Red.rvmat"],
				   ["Nacre Jaune","\ALF_Vehicules\ALF_data\PeintureNacre\Yellow.rvmat"]];
		
		private _camo = [["Covering Noir et Rouge","\ALF_Moto\ALF_Knucklehead\Skin_moto\CamoRoue.paa"],
				   ["Covering Vert, Marron et Beige","\ALF_Moto\ALF_Knucklehead\Skin_moto\CamoVert.paa"],
				   ["Covering Camo Orange","\ALF_Moto\ALF_Knucklehead\Skin_moto\CamoOrange.paa"],
				   ["Covering Noir, Balnc et Gris","\ALF_Moto\ALF_Knucklehead\Skin_moto\Camogris.paa"],
				   ["Covering Bleu, Noir et Blanc","\ALF_Moto\ALF_Knucklehead\Skin_moto\Camobleu.paa"],
				   ["Covering Camo Goute","\ALF_Moto\ALF_Knucklehead\Skin_moto\goute.paa"],
				   ["Covering Camo Militaire","\ALF_Vehicules\ALF_data\skin_camo_co.paa"],
				   ["Covering Camo Gris","\ALF_Vehicules\ALF_data\skin_camo_urban_co.paa"],
				   ["Covering Orange et Noir","\ALF_Vehicules_6\ALF_Evoque\data\depanneur\Camoornge2.paa"],
				   ["Covering Rose, Noir","\ALF_Vehicules_6\ALF_Evoque\data\depanneur\Camorose2.paa"],
				   ["Covering Rouge, Noir","\ALF_Vehicules_6\ALF_Evoque\data\depanneur\Camorouge2.paa"],
				   ["Covering Vert, Noir","\ALF_Vehicules_6\ALF_Evoque\data\depanneur\Camovert2.paa"],
				   ["Covering Violet, Noir","\ALF_Vehicules_6\ALF_Evoque\data\depanneur\Camoviolet2.paa"]];
				   
		if (typeOf(ALF_Peinture_NearestVehicle) isEqualTo "V_ALF_G63") then {_camo = [["Rouge/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_red_co.paa"],
																					  ["Bleu/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_blue_co.paa"],
																					  ["Vert/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_green_co.paa"],
																					  ["Orange/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_orange_co.paa"],
																					  ["Jaune/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_yellow_co.paa"],
																					  ["Rose/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_pink_co.paa"],
																					  ["Blanc/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_white_co.paa"],
																					  ["Gris/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_grey_co.paa"],
																					  ["Rouge Foncé/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_darkred_co.paa"],
																					  ["Bleu Foncé/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_darkblue_co.paa"],
																					  ["Vert Foncé/Noir", "\ALF_Vehicules_11\ALF_G63\data\skins\g63_darkgreen_co.paa"]];};
																					  
		if (typeOf(ALF_Peinture_NearestVehicle) isEqualTo "V_ALF_Ghost") then {_camo = [["Rouge/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_red_co.paa"],
																					  ["Bleu/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_blue_co.paa"],
																					  ["Vert/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_green_co.paa"],
																					  ["Orange/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_orange_co.paa"],
																					  ["Jaune/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_yellow_co.paa"],
																					  ["Rose/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_pink_co.paa"],
																					  ["Blanc/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_white_co.paa"],
																					  ["Gris/Noir", "P\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_grey_co.paa"],
																					  ["Rouge Foncé/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_darkred_co.paa"],
																					  ["Bleu Foncé/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_darkblue_co.paa"],
																					  ["Vert Foncé/Noir", "\ALF_Vehicules_11\ALF_Ghost\data\skins\gh_darkgreen_co.paa"]];};
																					  
		if (typeOf(ALF_Peinture_NearestVehicle) isEqualTo "V_ALF_Limousine") then {_camo = [["Rouge/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_red_co.paa"],
																					  ["Bleu/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_blue_co.paa"],
																					  ["Vert/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_green_co.paa"],
																					  ["Orange/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_orange_co.paa"],
																					  ["Jaune/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_yellow_co.paa"],
																					  ["Rose/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_pink_co.paa"],
																					  ["Blanc/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_white_co.paa"],
																					  ["Gris/Noir", "P\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_grey_co.paa"],
																					  ["Rouge Foncé/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_darkred_co.paa"],
																					  ["Vert Foncé/Noir", "\ALF_Vehicules_11\ALF_Limousine\data\skins\limo_darkgreen_co.paa"]];};
		//On setup les Covering
		{
			_control = _display displayCtrl 89775;
			_index = _control lbAdd (_x select 0);
			_control lbSetData [_index, (_x select 1)];
		} forEach _camo;
	};

	//Slider Pos Changed
	case 1: {
		if (isNull ALF_Peinture_NearestVehicle) exitWith {};

		private _texture = format ["#(argb,8,8,3)color(%1,%2,%3,1.0,co)",(sliderPosition 89771),(sliderPosition 89772),(sliderPosition 89773)];
		ALF_Peinture_NearestVehicle setObjectTextureGlobal [0, _texture];
		ALF_Peinture_CurrentTexture = _texture;
	};

	//Combo Pos Changed RVMAT
	case 2: {
		_param params [
			"_control",
			"_selectedIndex"
		];
		if (isNull ALF_Peinture_NearestVehicle || {isNull _control} || {_selectedIndex isEqualTo -1}) exitWith {};

		private _data = _control lbData _selectedIndex;
		
		if (_data isEqualTo "") exitWith {};

		ALF_Peinture_NearestVehicle setObjectMaterialGlobal [0,_data];
		ALF_Peinture_CurrentRvmat = _data;
	};

	//Combo Pos Changed Covering
	case 3: {
		_param params [
			"_control",
			"_selectedIndex"
		];
		if (isNull ALF_Peinture_NearestVehicle || {isNull _control} || {_selectedIndex isEqualTo -1}) exitWith {};

		private _data = _control lbData _selectedIndex;
		
		if (_data isEqualTo "") exitWith {};

		ALF_Peinture_NearestVehicle setObjectTextureGlobal [0,_data];
		ALF_Peinture_CurrentTexture = _data;
	};

	//Bouton Appliquer
	case 4: {
		if (isNull ALF_Peinture_NearestVehicle) exitWith {};
		if (ALF_Peinture_CurrentTexture isEqualTo "") then {
			ALF_Peinture_CurrentTexture = (getObjectTextures ALF_Peinture_NearestVehicle) select 0;
		};

		if (ALF_Peinture_CurrentRvmat isEqualTo "") then {
			ALF_Peinture_CurrentRvmat = (getObjectMaterials ALF_Peinture_NearestVehicle) select 0;
		};
		
		ALF_Peinture_NearestVehicle setObjectTextureGlobal [0,ALF_Peinture_CurrentTexture];
		ALF_Peinture_NearestVehicle setObjectMaterialGlobal [0,ALF_Peinture_CurrentRvmat];

		ALF_Peinture_Appliquer = true;
		[ALF_Peinture_NearestVehicle,ALF_Peinture_CurrentTexture,ALF_Peinture_CurrentRvmat] remoteExecCall ["HC_fnc_peintureVehicule",HC2_Life];
		closeDialog 0;
		ALF_Peinture_CurrentTexture = "";
	};
};