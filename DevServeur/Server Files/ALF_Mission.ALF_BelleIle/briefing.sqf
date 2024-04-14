waitUntil {sleep 0.5; !isNull player && player isEqualTo player};
if(player diarySubjectExists "credits") exitWith {};

player createDiarySubject ["credits","Credits"];
player createDiarySubject ["alftouch","Bien débuter"];
player createDiarySubject ["alfphone","Les téléphones"];


player createDiaryRecord ["credits",
	[
		"Arma Life France",
			"
				Arma Life France est un serveur rôleplay développé par ALF Team sur une base de jeu d'Altis Life RPG.<br/><br/>

				L'ensemble des fichiers scriptés par ALF Team sont sous licences.<br/><br/>

				Le vol ou la copie des fonctions créées pour la communauté Arma Life France est interdit.
			"
	]
];

player createDiaryRecord["alftouch",
	[
		"Les touches",
			"
				Y = Menu joueur<br/>
				SHIFT+Y = Menu téléphone<br/>
				CTRL+Y = Mégaphone Gendarmerie<br/>
				[WINDOWS] = Interaction général<br/>
				Double click inventaire [I] = Action items<br/>
				Site utiles:<br/>
				- boursedirect.fr<br/>
				- Leboncoin.fr<br/>
			"
	]
];

player createDiaryRecord["alfphone",
	[
		"Les téléphones",
			"
				---- Système de téléphone développé par Nanou pour ALF ----<br/><br/>
				4 téléphones: Nokia / iPhone / Neogend / Sony<br/><br/>
				Le système est très complet, et très complexe pour les nouveaux.<br/>
				Rassurez vous, une fois habitué, on ne s'en passe plus !<br/><br/>
				Voici les actions disponibles:<br/>
				- Mode vibreur<br/>
				- Mode Avion<br/>
				- Mutter le microphone lors d'un appel<br/>
				- Ajouter/Supprimer des contacts<br/>
				- Régler le volume en appel<br/>
				- Appeler le 17 pour joindre la Gendarmerie<br/>
				- Appeler le 18 pour joindre les Pompiers<br/>
				- Regarder les appels récents et rappeler ou envoyer un sms<br/>
				- iPhone: Changer la sonnerie<br/>
				- iPhone: Changer fond d'écran<br/>
				- iPhone: Mode annonyme<br/>
				- iPhone: Haut parleur<br/>
				- iPhone: Application radio<br/><br/>
			"
	]
];