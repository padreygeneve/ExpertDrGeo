'From Cuis6.0 [latest update: #6118] on 13 February 2025 at 4:59:35 pm'!

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_ChargerLesFaitsDeLaFigure
	^ EruditeBookSection basicNew
		title: 'Charger les faits de la figure';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Expert
^(EruditeBookSection basicNew title: 'Expert'; document: ((EruditeDocument contents: 'Avant propos.

Un système expert effectue des déduction à partir de faits et de règles.

Les faits décrivent une situation.

Les règles permettent de déduire de nouveaux faits.

L''ensemble des faits constitue la base de données.

Les règles ont deux parties
 	La condition.
 	La conclusion.

La condition  est une conjonction de termes, les antécédents.(Liés implicitement par l''opérateur logique  et). 

Les règles sont vérifiées, si les conditions d''une règle sont satisfaites alors la règle affirme un nouveau fait, sa conclusion.

Les règles sont vérifiées à nouveau, le processus se répète jusqu''à ce qu''aucun nouveau faif ne soit trouvé
[[[ f :=DrGeoFigure new.''''.]]] embedIt') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_Introduction;
        add: self section_Expert_UtilisationInteractive;
        add: self section_Expert_Tutoriel;
        add: self section_Expert_ListeDesPrédicats;
        add: self section_Expert_ExemplesDexperts;
        add: self section_Expert_GéométrieEtSystèmeExpert;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ExemplesDexperts
^(EruditeBookSection basicNew title: 'Exemples d''experts'; document: ((EruditeDocument contents: 'morpion
Ce système expert donne des conseils pour le jeu du morpion.

Il repère les lignes qui ont deux marqes d''un même joueur et une place vide. Pour le joueur c''est une occasion de gagne et pour l''adversaire une nécessité de contrer.
Il repère aussi une ligne gagnante.

Chargement des règles.

On commense part initialiser les règles.

e initRegles
copier l''exemple.


ExpertRegle morpion: e
copier l''exemple.

Voir les règles.  

e afficheRegles

copier l''exemple.

Les faits qui décrivent le jeu.

Le joueur: 	
 	joueur x  et  joueur o  
Le terrain de jeu:
	ligne h1 - - -
	ligne h2 - - -
	ligne h3 - - -
	avec - ; x ; o.

Ce sont les lignes horizontales, les autres seront déduites par des règles du genre:

	e lisRegle: ''v1''
	si: ''ligne h1 ?1 ?2 ?3
	ligne h2 ?4 ?5 ?6
	ligne h3 ?7 ?8 ?9'' 
	alors: ''ligne v1 ?1 ?4 ?7''.

Les variables numérotées représentent les 9 cases.

Les lignes qui permettent de gagner sont du genre:

	e lisRegle: ''gagne 1''
	si: ''joueur ?j
	ligne ?l - ?j ?j''
	alors: ''joueur ?j [ gagne en jouant ?l case 1''

La variable ?j contient la marque du joueur.
La variable ?a contient la marque de l''adversaire et ce sont des cas où le joueur doit contrer l''adversaire.

Le joueur a gagné.

	e lisRegle: ''a gagné''
	si: ''joueur ?j
	ligne ?l ?j ?j ?j''
	alors: ''Joueur ?j [ a gagné ligne ?l ]''.

Et c''est une partie nulle si toutes les cases sont pleines
	e lisRegle: ''Fin''
	si: ''ligne h1 ?1 ?2 ?3
	different:de: ?1 -
	different:de: ?2 -
	different:de: ?3 -
	ligne h2 ?4 ?5 ?6
	different:de: ?4 -
	different:de: ?5 -
	different:de: ?6 -
	ligne h3 ?7 ?8 ?9
	different:de: ?7 -
	different:de: ?8 -
	different:de: ?9 -''
	alors: ''''partie terminée''.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ExemplesDexperts_leJeuDuMorpion;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ExemplesDexperts_leJeuDuMorpion
^(EruditeBookSection basicNew title: 'le jeu du morpion'; document: ((EruditeDocument contents: '!!!!!!morpion
Ce système expert donne des conseils pour le jeu du morpion.

Il repère les lignes qui ont deux marqes d''un même joueur et une place vide. Pour le joueur c''est une occasion de gagne et pour l''adversaire une nécessité de contrer.
Il repère aussi une ligne gagnante.

Chargement des règles.

"initialiser les règles."
e initRegles.
"Charger les règles"
ExpertRegle morpion: e
"Voir les règles. " 
e afficheRegles.''
ExpertRegle morpion: e
[[[f presenter expertDisplayTutor:''
"initialiser les règles."
e initRegles.
"Charger les règles"
ExpertRegle morpion: e..
"Voir les règles. " 
e afficheRegles.''
]]] doItWithButton: copier l''exemple.


Les faits qui décrivent le jeu.

Le joueur: 	
 	**joueur x**  et  **joueur o**  
Le terrain de jeu:
	**ligne h1 - - -**
	**ligne h2 - - -**
	**ligne h3 - - -**
	avec - ; x ; o.

Ce sont les lignes horizontales, les autres seront déduites par des règles du genre:

	**e lisRegle: ''v1''
	si: ''ligne h1 ?1 ?2 ?3
	ligne h2 ?4 ?5 ?6
	ligne h3 ?7 ?8 ?9'' 
	alors: ''ligne v1 ?1 ?4 ?7''.**

Les variables numérotées représentent les 9 cases.

Les lignes qui permettent de gagner sont du genre:

	**e lisRegle: ''gagne 1''
	si: ''joueur ?j
	ligne ?l - ?j ?j''
	alors: ''joueur ?j [ gagne en jouant ?l case 1''**

La variable ?j contient la marque du joueur.
La variable ?a contient la marque de l''adversaire et ce sont des cas où le joueur doit contrer l''adversaire.

Le joueur a gagné.

	**e lisRegle: ''a gagné''
	si: ''joueur ?j
	ligne ?l ?j ?j ?j''
	alors: ''Joueur ?j [ a gagné ligne ?l ]''.**

E.t c''est une partie nulle si toutes les cases sont pleines
**	e lisRegle: ''Fin''
	si: ''ligne h1 ?1 ?2 ?3
	different:de: ?1 -
	different:de: ?2 -
	different:de: ?3 -
	ligne h2 ?4 ?5 ?6
	different:de: ?4 -
	different:de: ?5 -
	different:de: ?6 -
	ligne h3 ?7 ?8 ?9
	different:de: ?7 -
	different:de: ?8 -
	different:de: ?9 -''
	alors: ''''partie terminée''.**') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_GéométrieEtSystèmeExpert
^(EruditeBookSection basicNew title: 'Géométrie et système Expert'; document: ((EruditeDocument contents: '!!!!Géométrie et système Expert

Le groupe de règles **Euclide:** contient des règles pour faire des déductions sur les figure géométriques.

Chaque figure est décrite par son script, ce script peut être copié avec le bouton **copier l''exemple** dans une fenêtre **Tutoriel**.
Il faut cliquer la première fois sur le bouton vert  [[[DrGIcons iconUI: #play]]] embedIt avant de selectionner et executer le script.

Le script est suivi en commentaire des appels à la méthode **verifieCondition** pour vérifier les modèles de questions les plus intéressants. Tu peux selectionner et exécuter ces appels.

Tu peux aussi utiliser le menu de la figure (clic sur bouton droit dans la figure).

L''article **Examiner la figure** enchaîne les actions jusqu''à l''affichage des modèles de questions dans la fenêtre **journal**. 

Dans la fenêtre **journal**. tu peux:

	selectionner un modèle de question et l''exécuter avec l''article du menu **Vérifier**.

	selectionner le numéro d''un fait, et avoir une explication sur l''origine de ce fait avec l''article **Expliquer**.
 
	selectionner le numéro d''un fait, et remonter jusqu''au faits  issus de la figure avec l''article **Expliquer récursivement**

Ces actions ne sont pas possibles dans la fenêtre **Tutoriel**. 





') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite
^(EruditeBookSection basicNew title: '1 point segment et droite'; document: ((EruditeDocument contents: '!!!! Avant propos.
1.1 point.
Euclide :  Définition 1, « ** le point est ce dont la partie est nulle ** ».

1.2. Segments et droites.
Euclide : Définition 2, « **Une ligne est une longueur sans largeur. **»
Euclide : Définition 3, « **Les extrémités d’une ligne sont des points. **»
Euclide : Définition 4, « **La ligne droite est celle qui est également placée entre ses points. **» //
Si on marche le long d''une droite le pied gauche se déplace de la même distance que le pied droit.
Sur une sphère  les méridiens sont des droites mais les parallèles.)//
Euclide : Demande 1, « **Entre deux points on peut toujours tracer une droite.**»//( Euclide défini comme droite ce qui est pour nous un segment.) //
Euclide : Demande 2, « **On peut toujours prolonger indéfiniment une droite tracée entre deux points.**»
//(Euclide demande ce qui est pour nous une droite. Cette demande est toujours satisfaite pour la géométrie plane, elle n''est pas toujours vérifiée , par exemple, sur un sphère, les extrémités d''un segment peuvent se rejoindre en un même point.)//

Aide-mémoire  p.90 : « **La droite A B est constituée d''une infinité de points alignés avec A et B **»
Aide-mémoire  p.90 : « **Un segment est une portion de droite limitée par deux points. **»
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_11Point;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_121Segment;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_122Droite;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_123DemiDroite;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_11LePoint
	^ EruditeBookSection basicNew
		title: '1.1 Le point';
		document:
			((EruditeDocument contents: '!!!!!!!! 1.1 point

Euclide : « Définition 1, le point est ce dont la partie est nulle ».

1.1.1. Script de la Figure.
"1.1.1 point"
f := DrGeoFigure new.
a := f point: 3@5.
a nommer: ''A''.	
e := f expert.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
"
e verifieCondition: ''point ?x1''.

e verifieCondition: ''point ?x1
point:rep: ?x1 ?pos''.

e verifieCondition: ''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y''.
"
[[[f presenter expertDisplayTutor:''
"1.1.1 point"
f := DrGeoFigure new.
a := f point: 3@5.
a nommer: ''''A''''.	
e := f expert.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
"e verifieCondition: ''''point ?x1''''.
e verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos''''.
e verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y''''.
"'']]] doItWithButton: copier l''exemple.

On peut vérifier une conjonction de plusieurs conditions ou prédicats.
	e verifieCondition: ''point ?x1
	point:rep: ?x1 ?pos''.
	//2 point A ->DrGPointFreeItem
	 * Qualification d''un point
	point:rep: A (3@5)//

Remarques :
** Prédicats.**
point:rep: ?x1 ?pos

Un prédicat est formé de la suite des sélecteurs suivie des arguments.
	(3@5) est l''objet numérique point de smallTalk, il contient une paire de coordonnées.

Les prédicats x:rep: et y:rep:  permettent d''avoir les coordonnées x et y d''un objet numérique point.
	e verifieCondition: ''point ?x1
 	point:rep: ?x1 ?pos
 **	x:rep: ?pos ?x
 	y:rep: ?pos ?y''**

 	//2 point A ->DrGPointFreeItem
 	* Qualification d''un point
 	point:rep: A (3@5)
 	x:rep: (3@5) 3
 	y:rep: (3@5) 5//

** Commentaires.**
	* Qualification d''un point 
	Un commentaire qui peut être associé à une règle pour préciser en terme de géométrie l''action de la règle. 
	Ces commentaires sont précédés d''une astérisque.  

** Justification.**
	->DrGPointFreeItem 
	Le noms d''une règle est formé du nom de la méthode où elle figure suivi d''un tiret et du nom propre à la règle, parfois suivi d''un indice. 
	
** Règles.**
	Les règles sont des méthodes de la classe ExpertRegle. 
	On peut sauvegarder une règle par copier /coller.')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_11Point
^(EruditeBookSection basicNew title: '1.1 Point'; document: ((EruditeDocument contents: '!!!! 1.1 point

Euclide : « Définition 1, le point est ce dont la partie est nulle ».

!!!!!! 1.1.1. Script de la Figure.
"1.1.1 point"
f := DrGeoFigure new.
a := f point: 0@0.
a nommer: ''A''.	
e := f expert.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
"
e verifieCondition: ''point ?x1''.

e verifieCondition: ''point ?x1
point:rep: ?x1 ?pos''.

e verifieCondition: ''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y''.
"
[[[ f presenter expertDisplayTutor: ''
"1.1.1 point"
f := DrGeoFigure new.
a := f point: 0@0.
a nommer: ''''A''''.	
e := f expert. 
e initFaits .
e lisFigure.
	e deduis.
e modèlesQuestions .
"e verifieCondition: ''''point ?x1''''.
e verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos''''.
e verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y''''.
"'' ]]] doItWithButton: copier l''exemple.

On peut vérifier une conjonction de plusieurs conditions ou prédicats.

	e verifieCondition: ''point ?x1
	point:rep: ?x1 ?pos''. ''
	2 point A ->interface-DrGPointFreeItem
	 * Qualification d''''un point
	point:rep: A 3@5
	"Les cordonnées d''''un point"

Remarques:

Objet point.
	(3@5) est l''objet numérique point de smallTalk, il contient une paire de coordonnées.


Prédicats.
**point:rep:** //?x1 ?pos//

Un prédicat est formé de la suite des sélecteurs, **point:rep:**,
suivie des arguments,  //?x1 ?pos//.

Les prédicats x:rep: et y:rep:  permettent d''avoir les coordonnées x et y d''un objet numérique point.

	e verifieCondition: ''point ?x1
	point:rep: ?x1 ?pos
	x:rep: ?pos ?x:
	y:rep: ?pos ?y''. ''

//	2 point A ->interface-DrGPointFreeItem
 	* Qualification d''''un point
	point:rep: A 3@5
	"Les cordonnées d''''un point"
	x:rep: 3@5 3
	"Coordonnée x d''''un point"
	y:rep: 3@5 5
	"Coordonnée y d''''un point" //

Commentaires.
Un commentaire qui peut être associé à une règle pour préciser en terme de géométrie l''action de la règle. Ces commentaires sont précédés d''une astérisque.
	
	* Qualification d''un point 

Un commentaire associé à un 	prédicat est entre guillemets.
	
	"Les cordonnées d''''un point"

Justification.
	->interface-DrGPointFreeItem

	Le noms d''une règle est formé du nom de la méthode où elle figure suivi d''un tiret et du nom propre à la règle, parfois suivi d''un indice. 
	
Règles.
	Les règles sont des méthodes de la classe ExpertRegle. 
	Ces règles sont conservées si l''on sauve la session.
	
	On peut aussi sauvegarder une règle par copier /coller dans un éditeur de textes et l''exécuter comme un script.
      ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_121Segment
^(EruditeBookSection basicNew title: '1.2.1 Segment'; document: ((EruditeDocument contents: '!!!!!!!!1.2. Segments et droites.
Euclide : Définition 2, « une ligne est une longueur sans largeur. »

Euclide : Définition 3, « les extrémités d’une ligne sont des points. »

Euclide : Définition 4, « La ligne droite est celle qui est également placée entre ses points. » ( Euclide défini comme droite ce qui est pour nous un segment. Si on marche le long d''une droite le pied gauche se déplace de la même distance que le pied droit (également placée entre ses points.).

Euclide : Demande 2, « On peut toujours prolonger indéfiniment une droite tracée entre deux points.
(Euclide demande ce qui est pour nous une droite.Cette demande est toujours satisfaite pour la géométrie plane, elle n''est pas toujours vérifiée , par exemple, sur un sphère, les extrémités d''un segment peuvent se rejoindre en un même point).

Euclide : Demande 1, « Entre deux points on peut toujours tracer une droite.(Un segment). »

Aide-mémoire  p.90 : « La droite A B est constituée d''une infinité de points alignés avec A et B »
Aide-mémoire  p.90 : « Un segment est une portion de droite limitée par deux points. »

!!!!1.2.1.  Segments.
 1.2.1.1  Script de la Figure.

"1.2.1.1 Segments."
f := DrGeoFigure nouveau.
a := f point:0@0.a nommer: ''''A''''.
b := f point:2@3.b nommer:''''B''''.
sAB:= f segmentDe: a à: b.
sAB nommer: ''''sAB''''.
e :=f expert.
e initFaits .
e lisFigure.
e chargeRegles:''Euclide''.
e deduis.
e modèlesQuestions .
"e verifieCondition: ''point ?x1''
e verifieCondition: ''segment ?x1 ?x2''.
e verifieCondition: ''origine ?x1 ?x2''. 
e verifieCondition: ''sens  ?x1 ?x2''. 
e verifieCondition: ''position  ?x1 ?x2 ?x3 ?x4''. 
e verifieCondition: ''coupleSur  ?x1 ?x2''.
Ajouter un segment D C
d := f point:  0 @ -1.d nommer: ''D''.
c := f point:  5 @  0. c nommer: ''C''.
sCD := f segmentDe: d a: c. sCD nommer: ''sCD''.
e deduis..
e verifieCondition: ''coupleSur  ?s ?ss'' "

[[[f presenter expertDisplayTutor:''
"1.2.1.1 Segments."
f:= DrGeoFigure nouveau.
a := f point:0@0.a nommer: ''''A''''.
b := f point:2@3.b nommer:''''B''''.
sAB:= f segmentDe: a à: b.
sAB nommer: ''''sAB''''.
e :=f expert.
e initFaits .
e lisFigure.
e chargeRegles:''''Euclide:''''.
e deduis.
e modèlesQuestions .
"e verifieCondition: ''''point ?x1''''
e verifieCondition: ''''segment ?x1 ?x2''''.
e verifieCondition: ''''origine ?x1 ?x2''''. 
e verifieCondition: ''''sens  ?x1 ?x2''''. 
e verifieCondition: ''''position  ?x1 ?x2 ?x3 ?x4''''. 
e verifieCondition: ''''coupleSur  ?x1 ?x2''''.
Ajouter un segment D C
d := f point:  0 @ -1.d nommer: ''''D''''.
c := f point:  5 @  0. c nommer: ''''C''''.
sCD := f segmentDe: d à: c. sCD nommer: ''''sCD''''.
e lisFigure.
e deduis..
e verifieCondition: ''''coupleSur  ?s ?ss'''' "'']]] doItWithButton: copier l''exemple.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_122Droite
^(EruditeBookSection basicNew title: '1.2.2 Droite'; document: ((EruditeDocument contents: '!!!!1.2.2. Droites
1.2. Segments et droites.
Euclide : Définition 2, « **Une ligne est une longueur sans largeur. **»
Euclide : Définition 3, « **Les extrémités d’une ligne sont des points. **»
Euclide : Définition 4, « **La ligne droite est celle qui est également placée entre ses points. **» //
Si on marche le long d''une droite le pied gauche se déplace de la même distance que le pied droit.
Sur une sphère  les méridiens sont des droites mais les parallèles.)//
Euclide : Demande 1, « **Entre deux points on peut toujours tracer une droite.**»//( Euclide défini comme droite ce qui est pour nous un segment.) //
Euclide : Demande 2, « **On peut toujours prolonger indéfiniment une droite tracée entre deux points.**»
//(Euclide demande ce qui est pour nous une droite. Cette demande est toujours satisfaite pour la géométrie plane, elle n''est pas toujours vérifiée , par exemple, sur un sphère, les extrémités d''un segment peuvent se rejoindre en un même point.)//

Aide-mémoire  p.90 : « **La droite A B est constituée d''une infinité de points alignés avec A et B **»
Aide-mémoire  p.90 : « **Un segment est une portion de droite limitée par deux points. **

**Script de la figure**
 1.2.1  Script de la Figure.
".1.2.2 droite."
f := DrGeoFigure new.
a := f point: 0@0.
a nommer: ''A''.
b := f point: 2@6.
b nommer: ''B''. 
d := f  droitePassantPar: a et: b.d nommer: ''dAB''.
p:= f  pointSurLigne: d a: 0.9.p nommer:  ''P''.
e := f expert.
e initFaits .
e lisFigure.
e chargeRegles:''Euclide''.
e deduis.
e modèlesQuestions .
[[[f presenter expertDisplayTutor:''"1.2.2 droite."
f := DrGeoFigure new.
a := f point: 0@0.
a nommer: ''''A''''.
b := f point: 2@6.
b nommer: ''''B''''. 
d := f  droitePassantPar: a et: b.d nommer: ''''dAB''''.
p:= f  pointSurLigne: d à: 0.9.p nommer:  ''''P''''.
e drgeo:f .
e := f expert.
e initFaits .      
e lisFigure.
e chargeRegles:''''Euclide''''.
e deduis.
e modèlesQuestions .

"e verifieCondition: ''''droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''''.
e verifieCondition: ''''droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''''.
e verifieCondition: ''''position A ?x2 ?x3 ?x4''''
"'']]] doItWithButton: copier l''exemple.

 1.2.2.3  e verifieCondition: ''droite  ?x1 ?x2 ?x3''.
droite dAB A  B ->Droite
* Lecture d''un fait sur la figure
Le  prédicat pointsSur:rep: permet d''avoir la liste des points sur une droite.
Les points sont ordonnés dans le sens de la droite.

e verifieCondition: ''droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''.
[[[f presenter expertDisplayTutor:''e verifieCondition: ''''droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''''.
'']]] doItWithButton: copier l''exemple.


La question position  ?x1 ?x2 ?x3 ?x4 permet d''obtenir les positions relatives ?x2 des points ?x1 et  ?x3 sur la droite ?x4
.
e verifieCondition: ''position  ?x1 ?x2 ?x3 ?x4''.
[[[f presenter expertDisplayTutor:''e verifieCondition: ''''position  ?x1 ?x2 ?x3 ?x4''''.
'' ]]] doItWithButton: copier l''exemple.
 
e verifieCondition: ''position P ?x2 ?x3 ?x4''.
[[[f presenter expertDisplayTutor:''e verifieCondition: ''''position ?x1 Après ?x3 ?x4''''. '']]] doItWithButton: copier l''exemple.
 
e verifieCondition: ''position ?x1 B ?x3 ?x4''.
[[[f presenter expertDisplayTutor:''e verifieCondition: ''''position ?x1 Après ?x3 ?x4''''.'' ]]] doItWithButton: copier l''exemple.
 ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_122Droites
	^ EruditeBookSection basicNew
		title: '1.2.2 droites';
		document:
			((EruditeDocument contents: '!!!!!!!!La droite
1.2.2. Droites
 1.2.2.1  Script de la Figure.
".1.2.2 droite."
f := DrGeoFigure new.
a := f point: 0@0.
a nommer: ''A''.
b := f point: 6@6.
b nommer: ''B''. 
d := f  droitePassantPar: a et: b.d nommer: ''dAB''.
p:= f  pointSurLigne: d a: 0.9.p nommer:  ''P''.
e := f expert.
e initFaits .
e lisFigure
e deduis.
e modèlesQuestions .
[[[f presenter expertDisplayTutor:''"1.2.2 droite."
f := DrGeoFigure new.
a := f point: 0@0.
a nommer: ''''A''''.
b := f point: 6@6.
b nommer: ''''B''''. 
d := f  droitePassantPar: a et: b.d nommer: ''''dAB''''.
p:= f  pointSurLigne: d à: 0.9.p nommer:  ''''P''''.
e drgeo:f .
e := f expert.
e initFaits .      
e lisFigure.
e deduis.
e modèlesQuestions .
e verifieCondition: ''''droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''''.
e verifieCondition: ''''droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''''.
e verifieCondition: ''''position A ?x2 ?x3 ?x4''''
'']]] doItWithButton: copier l''exemple.


1.1.3. Exemples
 	verifieCondition: ''point ?x1''.
	//2 point A ->DrGPointFreeItem//
	 * Qualification d''un point

On peut vérifier une conjonction de plusieurs conditions ou prédicats.
	e verifieCondition: ''point ?x1
	point:rep: ?x1 ?pos''.
	//2 point A ->DrGPointFreeItem//
	 * Qualification d''un point
	//point:rep: A (3@5)//

Remarques :
	**Prédicat.**
	**point:rep: ?x1 ?pos**
	Un prédicat est formé de la suite des sélecteurs suivie des arguments.

	**Objet point**
	(3@5) est l''objet numérique point de smallTalk, il contient une paire de coordonnées.
	**Autre prédicats**
	Les prédicats x:rep: et y:rep:  permettent d''avoir les coordonnées x et y d''un objet numérique point.
	e verifieCondition: ''point ?x1
 	point:rep: ?x1 ?pos
 	**x:rep: ?pos ?x**
 	**y:rep: ?pos ?y**''

 	//2 point A ->DrGPointFreeItem//
 	* Qualification d''un point
 	//point:rep: A (3@5)
	x:rep: (3@5) 3
 	y:rep: (3@5) 5//

')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_123DemiDroite
^(EruditeBookSection basicNew title: '1.2.3 Demi-Droite '; document: ((EruditeDocument contents: 'Aide-mémoire  p.90 : « Une demi-droite est une portion de droite limitée par un point.  Ce point est appelé l’origine de la demi-droite. »s
	
"1.2,4 Demi-droite"
f := DrGeoFigure new.
a := f point: (-4 @ -3).a nommer: ''A''.
b := f point: (3  @ 2).b nommer: ''B''.
d:= f  demiDroiteOrigine: a passantPar:b.d nommer: ''d''. s
p:= f pointSurLigne: d à: 0.95.p nommer: ''P''.
p1:= f pointSurLigne: d à: 0.96.p1 nommer: ''P1''.
e :=f expert.
e initFaits.
e lisFigure.
e  chargeRegles:''Euclide''.
e deduis..
e modèlesQuestions .
"
e verifieCondition: ''pointsSur d ?pts''.
e verifieCondition: ''position P1 ?pos P d''.
e verifieCondition:''point P1
abcisseDe:sur:rep: P d ?absP
abcisseDe:sur:rep: P1  d ?res
inférieur:à: ?res ?absP''.
e verifieCondition:''point P1
abcisseDe:sur:rep: P d ?absP
abcisseDe:sur:rep: P1  d ?res
supérieur:à: ?res ?absP''.
"



[[[f presenter expertDisplayTutor:''
"1.2,4 Demi-droite"
f := DrGeoFigure new.
a := f point: (-4 @ -3).a nommer: ''''A''''.
b := f point: (3  @ 2).b nommer: ''''B''''.
d:= f  demiDroiteOrigine: a passantPar:b.d nommer: ''''d''''. 
p:= f pointSurLigne: d à: 0.95.p nommer: ''''P''''.
p1:= f pointSurLigne: d à: 0.96.p1 nommer: ''''P1''''.
e :=f expert.
e initFaits.
e lisFigure.
e  chargeRegles:''''Euclide''''.
e deduis..
e modèlesQuestions .
"
e verifieCondition: ''''pointsSur d ?pts''''.
e verifieCondition: ''''position P1 ?pos P d''''.
e verifieCondition:''''point P1
abcisseDe:sur:rep: P d ?absP
abcisseDe:sur:rep: P1  d ?res
inférieur:à: ?res ?absP''''.
e verifieCondition:''''point P1
abcisseDe:sur:rep: P d ?absP
abcisseDe:sur:rep: P1  d ?res
supérieur:à: ?res ?absP''''.
"''
]]] doItWithButton: copier l''exemple.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_12LaDroite
	^ EruditeBookSection basicNew
		title: '1.2 La droite';
		document:
			((EruditeDocument contents: '!!!! 1.1 Le point.

Euclide :  Définition 1, « ** le point est ce dont la partie est nulle ** ».

Script de la figure
"1.1.1 point"
f := DrGeoFigure new.
a := f point: 0@2.
a nommer: ''A''.	
e := f expert.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
"e verifieCondition: ''point ?x1''.
e verifieCondition: ''point ?x1
point:rep: ?x1 ?pos''.
e verifieCondition: ''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y''. " 
[[[f presenter expertDisplayTutor:''"1.1.1 point"
f := DrGeoFigure new.
a := f point: 0@2.
a nommer: ''''A''''.	
e := f expert.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
"e verifieCondition: ''''point ?x1''''.
e verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos''''.
e verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y''''. " ''.]]] doItWithButton: copier l''exemple.

1.1.3. Commentaires.
e verifieCondition: ''point ?x1''.	
[[[ f presenter expertDisplayTutor:''
e verifieCondition: ''''point ?x1''''.''.]]] doItWithButton: copier l''exemple.
//2 point A ->DrGPointFreeItem
* Qualification d''un point//

On peut vérifier une conjonction de plusieurs conditions ou prédicats.
e verifieCondition: ''point ?x1
point:rep: ?x1 ?pos
[[[ f presenter expertDisplayTutor: ''
e verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos''''.''.]]] doItWithButton: copier l''exemple.
//2 point A ->DrGPointFreeItem
 * Qualification d''un point
point:rep: A (0@2)//

Remarques :
point:rep: ?x1 ?pos


Un prédicat est formé de la suite des sélecteurs suivie des arguments.

(0@2) est l''objet numérique point de smallTalk, il contient une paire de coordonnées.

Les prédicats x:rep: et y:rep:  permettent d''avoir les coordonnées x et y d''un objet numérique point.
e verifieCondition: ''point ?x1
 point:rep: ?x1 ?pos
 x:rep: ?pos ?x
 y:rep: ?pos ?y''
[[[ f presenter expertDisplayTutor:''e verifieCondition: ''''point ?x1
 point:rep: ?x1 ?pos
 x:rep: ?pos ?x
 y:rep: ?pos ?y'''''']]] doItWithButton: copier l''exemple.


 2 point A ->DrGPointFreeItem
 * Qualification d''un point
 point:rep: A (3@5)
 x:rep: (0@2) 3
 y:rep: (0@2) 5

Remarque : 
* Qualification d''un point : Un commentaire qui peut être associé à une règle pour préciser en terme de géométrie l''action de la règle. Ces commentaires sont précédés d''une astérisque.  
->DrGPointFreeItem : Le noms d''une règle est formé du nom de la méthode où elle figure suivi d''un tiret et du nom propre à la règle, parfois suivi d''un indice. 

Les règles sont des méthodes de la classe ExpertRegle. 

')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles
^(EruditeBookSection basicNew title: '1.3 Angles'; document: ((EruditeDocument contents: 'Euclide : Définition 8, «  angle plan est l''inclinaison mutuelle de deux lignes qui se touchent dans un plan, et  qui ne sont pas placées dans la même direction. ».
Euclide : Définition 9, « Lorsque des lignes qui comprennent un angle sont des droites, l''angle se nomme rectiligne ».
Aide-mémoire  p.101 : « Un angle est une portion du plan limitée par deux demi-droites de même origine. L''origine est appelée sommet de l''angle et les demi-droites sont les côtés.
Aide-mémoire  p.  90 : « Une demi-droite est une portion du plan limitée par un point qui est appelé origine. ».') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles_131ScriptDeLaFigure;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles_131ScriptDeLaFigure
^(EruditeBookSection basicNew title: '1.3.1 Script de la figure'; document: ((EruditeDocument contents: ' 1.3.1.1  Script de la Figure.
"1..1 .1 angles."
f := DrGeoFigure new.
e := f expert.
e chargeRegles:''Euclide:''.
e chargeRegles:''angles:''.
a := f point: 0@0.a nommer: ''A''.
b := f point: 2@5.b nommer: ''B''.
s := f point:  -9@4.s nommer: ''S''.
dd1 := f demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := f pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := f demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := f pointSurLigne: dd2 à: 0.9.
d nommer: ''D''.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
"
e verifieCondition: ''angle0  ?x1''.
e verifieCondition: ''demi-droite  ?x1 ?x2 ?x3''.
e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
e verifieCondition: ''angle0 ?x0 [  position: ?pos ]
point ?y1
point ?y2
point ?s
relation:et:nom:  [ ?y1 ?s ?y2 ] ?x0 équivalent
different:de:  [ ?y1 ?s ?y2 ] ?x0''.
"
[[[f presenter expertDisplayTutor:''
"1..1 .1 angles."
f := DrGeoFigure new.
e := f expert.
e chargeRegles:''''Euclide:''''.
e chargeRegles:''''angles:''''.
a := f point: 0@0.a nommer: ''''A''''.
b := f point: 2@5.b nommer: ''''B''''.
s := f point:  -9@4.s nommer: ''''S''''.
dd1 := f demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''''dd1''''.
c := f pointSurLigne: dd1 à: 0.9.c nommer: ''''C''''.
dd2 := f demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''''dd2''''.
d := f pointSurLigne: dd2 à: 0.9.
d nommer: ''''D''''.
e := f expert.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
"
e verifieCondition: ''''angle0  ?x1''''.
e verifieCondition: ''''demi-droite  ?x1 ?x2 ?x3''''.
e verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
e verifieCondition: ''''angle0 ?x0 [  position: ?pos ]
point ?y1
point ?y2
point ?s
relation:et:nom:  [ ?y1 ?s ?y2 ] ?x0 équivalent
different:de:  [ ?y1 ?s ?y2 ] ?x0''''.
"
''
]]] doItWithButton: copier l''exemple.

e verifieCondition: ''angle0  ?x1''.
//65 angle0  [ C S D ]  ->angles-angleDeBaseNonplats
 * Angle non plat sans ses propriétés et avec les extrémités les plus proches du sommet.//

e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''. 
//69 relationCréée  [ C S D ]  [ A S D ] équivalent ->angles-equivalent
 * Des angles de même sommet et avec des extrémités sur les mêmes droites et les mêmes positions sont équivalents.
70 relationCréée  [ C S D ]  [ C S B ] équivalent ->angles-equivalent
 * Des angles de même sommet et avec des extrémités sur les mêmes droites et les mêmes positions sont équivalents.
68 relationCréée  [ C S D ]  [ A S B ] équivalent ->angles-equivalent
 * Des angles de même sommet et avec des extrémités sur les mêmes droites et les mêmes positions sont équivalents.//


Remarques:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents séparément lorsqu''on vérifie la relation dans une règle. On affirme que certains faits sont équivalents mais la relation a aussi d''autres faits équivalents par exemple les angles  [ A S B ] et [ C S B ] sont aussi équivalents et il y a encore d''autres relations, en fait on peut regrouper dans un ensemble tous les angles qui sont équivalents entre eux et il suffit de tester s''il sont dans le même ensemble pour savoir qu''ils sont équivalents.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Expert_Introduction
^(EruditeBookSection basicNew title: 'Introduction'; document: ((EruditeDocument contents: '!!!!!!Introduction.

Un **fait** est une proposition

Une **proposition** est une phrase décrivant une situation.
//Le père de Pierre est Jean.//
//Le père de Marie est Jean.//
//Les enfants de Jean sont Pierre et Marie.//

	père Pierre Jean
	père Marie Jean

Les	proposition sonrt représentées dans l''ordinateur par des listes.

Une **liste** peut contenir d''autres **listes**.
//enfants Jean [ Pierre Marie ]//

Une proposition peut être:
	Une **affirmation**.
	Une **condition**,
	Une **question**,

Une **affirmation** est proposition  sans variabe ou avec toutes les variables instanciées.
//père Pierre Jean//

Une **variable instanciées** est une variable qui a reçu une valeur.

 //3 père Pierre Jean ->énoncé//
//{#''''?y''''->''''Jean'''' #''''?x''''->''''Pierre'''' } //


Une **condition**  ou une **question** peuvent contenir des vaiables elles la même forme. 
Les conditions sonts utiisées dans les règles et les questions pour explorer des résultats.

Les variables cemmencent par le caractèrere **?**.

Les règles ont deux parties, elles sont formées de  conditions.
 
	Les antécédants.
	 La conclusion.

Les **antécédants**  sont une  conjonction de conditions  liées implicitement par l''opérateur logique  **et**). 
Toutes les conditions doivent être satisfaites pour que la concusion soit affirmée.

Tu peux utiiser la méthode **verifieCondition:** pour vérfier un antécédant.
//e  verifieCondition: ''père ?E ?P
mère ?E ?M ''
 
	3 père Pierre Jean ->énoncé
	4 mère Pierre léa ->énoncé

	{#''''?P''''->''''Jean'''' #''''?M''''->''''léa'''' #''''?E''''->''''Pierre'''' }//

La **conclusion**  est condition unique, ses variables sont instanciées.(Ont reçu une valeur).

Elle constitue un fait qui sera ajouté à la base de données, si la condition est satisfaite et si le fait est nouveau.(Pas encore présent dans la base de données).

Une propositon tout comme une affirrmation commence par un mot, ce mot sert de clef pour la recherche dans la base de données.

La méthode:
//<expert>// **verifieCondition:**  //condition// affiche tous les faits qui vérifient la condition.

Les questions servent à interroger la base de données ou à tester les antécédents d''une règle.

Une question peut être utilisée pour vérifier une règle si elle est formée des conditions de la règle. 

**Le modèle de question** est une conclusion généralisée. 
Elle est formée du premier mot d''une conclusion suivit d''un nombre de variables égal au nombre d''éléments restants de la liste représentant la conclusion. 

	//e modèlesQuestions  ''
 	Modèles de questions.
 	mère  ?x1 ?x2
 	parents  ?x1 ?x2 ?x3
 	père  ?x1 ?x2
 	'' .//
L''**unification** est le procédé de comparaison de deux propositions de même structure.

Les termes correspondants sont comparés. 
	Si ce sont deux variables non instanciées,elle restent non instanciées.I 
	Si seulement l''une d''elle est non instanciée, cette variable prend la valeur de son 	correspondant. 
	Si elle est instanciée, on compare les valeurs correspondantes qui doivent être 	les mêmes.
	Si non l''unification échoue.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats
^(EruditeBookSection basicNew title: 'Liste des prédicats'; document: ((EruditeDocument contents: '!!!!!!Liste des prédicats

Les prédicats sont  des méthodes que tu peux appeler depuis le système expert.

Le nom du  prédicat est formé du nom de la méthode suivi de ses sélecteurs puis des valeurs des paramètres.
comme un fait vérifié ou non.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Actions;
        add: self section_Expert_ListeDesPrédicats_Listes;
        add: self section_Expert_ListeDesPrédicats_Nombres;
        add: self section_Expert_ListeDesPrédicats_Divers;
        add: self section_Expert_ListeDesPrédicats_Relations;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions
^(EruditeBookSection basicNew title: 'Actions'; document: ((EruditeDocument contents: '!!!!!!Action

Une action est un prédicat qui produit un effet de bord.

Un effet de bord n''agit pas sur les déductions.
Ce peut être par exemple une alerte mais aussi une construction sur la figure.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Actions_affiche;
        add: self section_Expert_ListeDesPrédicats_Actions_afficheTextea;
        add: self section_Expert_ListeDesPrédicats_Actions_afficheTextecontenua;
        add: self section_Expert_ListeDesPrédicats_Actions_angleCentredeacou;
        add: self section_Expert_ListeDesPrédicats_Actions_angleGeometriqueCentredeacoul;
        add: self section_Expert_ListeDesPrédicats_Actions_couleurPointcouleur;
        add: self section_Expert_ListeDesPrédicats_Actions_créePointMilieuPointet;
        add: self section_Expert_ListeDesPrédicats_Actions_execute;
        add: self section_Expert_ListeDesPrédicats_Actions_polyAjouteETNuméroteSommets;
        add: self section_Expert_ListeDesPrédicats_Actions_polyAjouteSommets;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_affiche
^(EruditeBookSection basicNew title: 'affiche:	'; document: ((EruditeDocument contents: '!!!!!!afficheTexte:a:

Affiche à une position et nomme un texte dans la 	figure"
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_afficheTextea
^(EruditeBookSection basicNew title: 'afficheTexte:a:'; document: ((EruditeDocument contents: '!!!!!!afficheTexte:a:

Affiche à une position et nomme un texte dans la 	figure"
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_afficheTextecontenua
^(EruditeBookSection basicNew title: 'afficheTexte:contenu:a:	'; document: ((EruditeDocument contents: '!!!!!!afficheTexte:contenu:a:	

Affiche à une position et nomme un texte dans 	la figure.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_angleCentredeacou
^(EruditeBookSection basicNew title: 'angleCentre:de:a:cou'; document: ((EruditeDocument contents: '!!!!!!angleCentre:de:a:coul:

angleCentre:de:a:coul:	
Marque la valeur d''un angle en couleur') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_angleGeometriqueCentredeacoul
^(EruditeBookSection basicNew title: 'angleGeometriqueCentre:de:a:coul:  '; document: ((EruditeDocument contents: 'angleGeometriqueCentre:de:a:coul:  

Marque la valleur d''un angle géométrique en couleur
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_couleurPointcouleur
^(EruditeBookSection basicNew title: 'couleurPoint:couleur:'; document: ((EruditeDocument contents: 'couleurPoint:couleur:

Mets en couleur un point.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_créePointMilieuPointet
^(EruditeBookSection basicNew title: 'créePointMilieu:Point:et'; document: ((EruditeDocument contents: 'créePointMilieu:Point:et

Crée le point au milieu d''une médiatrice.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_execute
^(EruditeBookSection basicNew title: 'execute:	'; document: ((EruditeDocument contents: 'execute:	

Evalue une action.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_polyAjouteETNuméroteSommets
^(EruditeBookSection basicNew title: 'polyAjouteETNuméroteSommets:	'; document: ((EruditeDocument contents: '
polyAjouteETNuméroteSommets:	

Ajoute et numérote les sommets d''un objet polygone régulier.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Actions_polyAjouteSommets
^(EruditeBookSection basicNew title: 'polyAjouteSommets:	'; document: ((EruditeDocument contents: 'polyAjouteSommets:	

Ajoute les sommets d''un polygone') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers
^(EruditeBookSection basicNew title: 'Divers'; document: ((EruditeDocument contents: 'Diverses actions.direction:rep:	

Retourne un point qui est l''extrémité d''un vecteur qui a pour origine le point 0@0. 
extrémité:rep:	

Le deuxième parent d''un segment ou d''une droite.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Divers_alignésavecetVérifieQueTroisPointsSontAlignés;
        add: self section_Expert_ListeDesPrédicats_Divers_compteFaitsrep;
        add: self section_Expert_ListeDesPrédicats_Divers_créeNomrep;
        add: self section_Expert_ListeDesPrédicats_Divers_créeNomMinrep;
        add: self section_Expert_ListeDesPrédicats_Divers_créeNomUniquerep;
        add: self section_Expert_ListeDesPrédicats_Divers_constructionsrep;
        add: self section_Expert_ListeDesPrédicats_Divers_differentde;
        add: self section_Expert_ListeDesPrédicats_Divers_directionrep;
        add: self section_Expert_ListeDesPrédicats_Divers_distancearep;
        add: self section_Expert_ListeDesPrédicats_Divers_extrémitérep;
        add: self section_Expert_ListeDesPrédicats_Divers_instanciedValue;
        add: self section_Expert_ListeDesPrédicats_Divers_maxrep;
        add: self section_Expert_ListeDesPrédicats_Divers_minMotrep;
        add: self section_Expert_ListeDesPrédicats_Divers_minimumrep;
        add: self section_Expert_ListeDesPrédicats_Divers_motetetrep;
        add: self section_Expert_ListeDesPrédicats_Divers_ordonneMotetrep1rep2;
        add: self section_Expert_ListeDesPrédicats_Divers_ordonneMotetrep;
        add: self section_Expert_ListeDesPrédicats_Divers_renommenom;
        add: self section_Expert_ListeDesPrédicats_Divers_retablitFait;
        add: self section_Expert_ListeDesPrédicats_Divers_retireFait;
        add: self section_Expert_ListeDesPrédicats_Divers_suivantrep;
        add: self section_Expert_ListeDesPrédicats_Divers_total;
        add: self section_Expert_ListeDesPrédicats_Divers_trierep;
        add: self section_Expert_ListeDesPrédicats_Divers_égauxet;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_alignésavecetVérifieQueTroisPointsSontAlignés
^(EruditeBookSection basicNew title: 'alignés:avec:et:

Vérifie que trois points sont alignés.'; document: ((EruditeDocument contents: 'alignés:avec:et:

Vérifie que trois points sont alignés.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_compteFaitsrep
^(EruditeBookSection basicNew title: 'compteFaits:rep:	'; document: ((EruditeDocument contents: 'compteFaits:rep:	

Compte le nombre de mêmes faits correspondant à un modèle de question pour un faits sous forme de liste.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_constructionsrep
^(EruditeBookSection basicNew title: 'constructions:rep:	'; document: ((EruditeDocument contents: 'constructions:rep:	

Construit un objet dans la figure') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_ListeDesPrédicats_Divers_contrairecontrairerep
	^ EruditeBookSection basicNew
		title: 'contraire:contraire:rep:';
		document:
			((EruditeDocument contents: 'contraire:contraire:rep

décrit le contraire d''''un mot')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_créeNomMinrep
^(EruditeBookSection basicNew title: 'créeNomMin:rep:	'; document: ((EruditeDocument contents: 'créeNomMin:rep:	

Crée un nom pour une permutation minimum des éléments de la liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_créeNomUniquerep
^(EruditeBookSection basicNew title: 'créeNomUnique:rep:	'; document: ((EruditeDocument contents: 'créeNomUnique:rep:	

Crée un nom suivi d''un numéro unique.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_créeNomrep
^(EruditeBookSection basicNew title: 'créeNom:rep:'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_differentde
^(EruditeBookSection basicNew title: 'different:de:	'; document: ((EruditeDocument contents: 'different:de:	

Vérifie que deux objets sont différents.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_directionrep
^(EruditeBookSection basicNew title: 'direction:rep:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_distancearep
^(EruditeBookSection basicNew title: 'distance:a:rep:	
'; document: ((EruditeDocument contents: 'distance:a:rep:	

La distance entre deux points.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_extrémitérep
^(EruditeBookSection basicNew title: 'extrémité:rep:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_égauxet
^(EruditeBookSection basicNew title: 'égaux:et:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_instanciedValue
^(EruditeBookSection basicNew title: 'instanciedValue:'; document: ((EruditeDocument contents: 'instanciedValue:
Valeur attribuée à une variable, retourne faux si la 	variable n''a  pas reçu de valeur.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_maxrep
^(EruditeBookSection basicNew title: 'max:rep:	'; document: ((EruditeDocument contents: 'max:rep:	

Le maximum d''une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_minMotrep
^(EruditeBookSection basicNew title: 'minMot:rep:	'; document: ((EruditeDocument contents: 'minMot:rep:	

Le plus  petit caractère d''un mot.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_minimumrep
^(EruditeBookSection basicNew title: 'minimum:rep:	'; document: ((EruditeDocument contents: 'minimum:rep:	

Le plus  petit caractère d''un mot.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_motetetrep
^(EruditeBookSection basicNew title: 'mot:et:et:rep:	'; document: ((EruditeDocument contents: 'mot:et:et:rep:	

Forme un mot à partir de trois mots.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_ordonneMotetrep
^(EruditeBookSection basicNew title: 'ordonneMot:et:rep:	'; document: ((EruditeDocument contents: 'ordonneMot:et:rep:	

Forme un mot à partir de deuxmots, en les  mettant 	dans l''ordre alphabètique .
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_ordonneMotetrep1rep2
^(EruditeBookSection basicNew title: 'ordonneMot:et:rep1:rep2:'; document: ((EruditeDocument contents: 'ordonneMot:et:rep1:rep2:

Place deux mots en ordre alphabétique.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_renommenom
^(EruditeBookSection basicNew title: 'renomme:nom:	'; document: ((EruditeDocument contents: 'renomme:nom:	

Renomme un  objet.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_retablitFait
^(EruditeBookSection basicNew title: 'retablitFait:	'; document: ((EruditeDocument contents: 'retablitFait:	

établit un fait.


') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_retireFait
^(EruditeBookSection basicNew title: 'retireFait:	'; document: ((EruditeDocument contents: 'retireFait:	

Retire un fait, le fait est marqué retiré et plus vu 	parmis les faits.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_suivantrep
^(EruditeBookSection basicNew title: 'suivant:rep:'; document: ((EruditeDocument contents: 'suivant:rep:	
Génère le nom suivant un nom unique.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_total
^(EruditeBookSection basicNew title: 'total:	'; document: ((EruditeDocument contents: 'total:	

Remplace le dernier élément d''une liste de 	nombres par le total des précédents.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Divers_trierep
^(EruditeBookSection basicNew title: 'trie:rep:	'; document: ((EruditeDocument contents: 'trie:rep:	

Trie les lettres d''un mot.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes
^(EruditeBookSection basicNew title: 'Listes'; document: ((EruditeDocument contents: '!!$!!!!!!Listes
Des méthodes pour agir sur les listes.justeAprès:el:rep:	

L''élément qui suit un élément d''une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Listes_addFirstelrep;
        add: self section_Expert_ListeDesPrédicats_Listes_addLastelrep;
        add: self section_Expert_ListeDesPrédicats_Listes_ajoutelisterep;
        add: self section_Expert_ListeDesPrédicats_Listes_ajouteDernierelrep;
        add: self section_Expert_ListeDesPrédicats_Listes_ajouteDernierUniqueelrep;
        add: self section_Expert_ListeDesPrédicats_Listes_ajoutePremierelrep;
        add: self section_Expert_ListeDesPrédicats_Listes_ajoutePremierUniqueelrep;
        add: self section_Expert_ListeDesPrédicats_Listes_contientliste;
        add: self section_Expert_ListeDesPrédicats_Listes_couplesrep;
        add: self section_Expert_ListeDesPrédicats_Listes_dernierrep;
        add: self section_Expert_ListeDesPrédicats_Listes_excludesel;
        add: self section_Expert_ListeDesPrédicats_Listes_includesel;
        add: self section_Expert_ListeDesPrédicats_Listes_indexelrep;
        add: self section_Expert_ListeDesPrédicats_Listes_jointavecrep;
        add: self section_Expert_ListeDesPrédicats_Listes_minrep;
        add: self section_Expert_ListeDesPrédicats_Listes_nonContientel;
        add: self section_Expert_ListeDesPrédicats_Listes_nonTousPositifs;
        add: self section_Expert_ListeDesPrédicats_Listes_premierrep;
        add: self section_Expert_ListeDesPrédicats_Listes_saufDernierrep;
        add: self section_Expert_ListeDesPrédicats_Listes_saufPremierrep;
        add: self section_Expert_ListeDesPrédicats_Listes_sommerep;
        add: self section_Expert_ListeDesPrédicats_Listes_sortblockrep;
        add: self section_Expert_ListeDesPrédicats_Listes_taillerep;
        add: self section_Expert_ListeDesPrédicats_Listes_tousNégatifs;
        add: self section_Expert_ListeDesPrédicats_Listes_triePointsSurdroiterep;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_addFirstelrep
^(EruditeBookSection basicNew title: 'addFirst:el:rep:	'; document: ((EruditeDocument contents: 'addFirst:el:rep:	

Ajoute en premier un élément à une liste') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_ListeDesPrédicats_Listes_addFirstelrep_addFirstelrep
	^ EruditeBookSection basicNew
		title: 'addFirst:el:rep:	';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_addLastelrep
^(EruditeBookSection basicNew title: 'addLast:el:rep:'; document: ((EruditeDocument contents: 'addLast:el:rep:

Ajoute un élément à la fin d''une liste
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_ajouteDernierUniqueelrep
^(EruditeBookSection basicNew title: 'ajouteDernierUnique:el:rep:	'; document: ((EruditeDocument contents: 'ajouteDernierUnique:el:rep:	

Ajoute un élément à la fin d''une liste, s''il n''est pas déjà dans la liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_ajouteDernierelrep
^(EruditeBookSection basicNew title: 'ajouteDernier:el:rep:	'; document: ((EruditeDocument contents: 'ajouteDernier:el:rep:	

Ajoute un élément à la fin d''une liste') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_ajoutePremierUniqueelrep
^(EruditeBookSection basicNew title: 'ajoutePremierUnique:el:rep:	'; document: ((EruditeDocument contents: 'ajoutePremierUnique:el:rep:	

Ajoute un élément à la tête d''une liste, s''il n''est pas déjà dans la liste') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_ajoutePremierelrep
^(EruditeBookSection basicNew title: 'ajoutePremier:el:rep:	'; document: ((EruditeDocument contents: 'ajoutePremier:el:rep:	

Ajoute un élément à la tête d''une liste, 
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_ajoutelisterep
^(EruditeBookSection basicNew title: 'ajoute:liste:rep:'; document: ((EruditeDocument contents: 'ajoute:liste:rep:') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_contientliste
^(EruditeBookSection basicNew title: 'contient:liste:	'; document: ((EruditeDocument contents: '
contient:liste:	

Vérifie si un objet est présent dans une liste.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_couplesrep
^(EruditeBookSection basicNew title: 'couples:rep:	'; document: ((EruditeDocument contents: 'couples:rep:	

Associe une liste de deux points à un nom pour former 	un couple.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_dernierrep
^(EruditeBookSection basicNew title: 'dernier:rep:'; document: ((EruditeDocument contents: '
dernier:rep:

Le dernier élément d''une liste.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_excludesel
^(EruditeBookSection basicNew title: 'excludes:el:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_includesel
^(EruditeBookSection basicNew title: 'includes:el:	'; document: ((EruditeDocument contents: 'includes:el:	

Vérifie qu''une liste contient un élément.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_indexelrep
^(EruditeBookSection basicNew title: 'index:el:rep:'; document: ((EruditeDocument contents: 'index:el:rep:

Retourne l''indice d''un élément dans une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_jointavecrep
^(EruditeBookSection basicNew title: 'joint:avec:rep:'; document: ((EruditeDocument contents: 'joint:avec:rep:

Réunit les éléments de deux listes.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_minrep
^(EruditeBookSection basicNew title: 'min:rep:	'; document: ((EruditeDocument contents: 'min:rep:	

Le plus petit élément d''une  liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_nonContientel
^(EruditeBookSection basicNew title: 'nonContient:el:	'; document: ((EruditeDocument contents: 'nonContient:el:	

Vérifie qu''un élément n''est pas dans une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_nonTousPositifs
^(EruditeBookSection basicNew title: 'nonTousPositifs:	'; document: ((EruditeDocument contents: 'nonTousPositifs:	

Vérifie que les éléments d''une liste ne sont pas tous 	positifs.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_premierrep
^(EruditeBookSection basicNew title: 'premier:rep:'; document: ((EruditeDocument contents: 'premier:rep:

Le premier élément d''une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_saufDernierrep
^(EruditeBookSection basicNew title: 'saufDernier:rep:	'; document: ((EruditeDocument contents: 'saufDernier:rep:	

Les éléments d''une liste sauf le dernier.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_saufPremierrep
^(EruditeBookSection basicNew title: 'saufPremier:rep:'; document: ((EruditeDocument contents: 'saufPremier:rep:

Les éléments d''une liste sauf le premier.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_sommerep
^(EruditeBookSection basicNew title: 'somme:rep:'; document: ((EruditeDocument contents: 'somme:rep:

La somme de tous les éléments d''une liste.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_sortblockrep
^(EruditeBookSection basicNew title: 'sort:block:rep'; document: ((EruditeDocument contents: 'sort:block:rep

Trie sort:block:reples éléments d''une liste selon un critère décrit 	dans le block.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_taillerep
^(EruditeBookSection basicNew title: 'taille:rep'; document: ((EruditeDocument contents: 'taille:rep

Le nombre d''éléments de la liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_tousNégatifs
^(EruditeBookSection basicNew title: 'tousNégatifs:	
'; document: ((EruditeDocument contents: 'tousNégatifs:	

Vérifie que tous les éléments de la liste sont 	négatifs.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Listes_triePointsSurdroiterep
^(EruditeBookSection basicNew title: 'triePointsSur:droite:rep:	'; document: ((EruditeDocument contents: 'triePointsSur:droite:rep:	

Trie les points sur une droite') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Nombres
^(EruditeBookSection basicNew title: 'Nombres'; document: ((EruditeDocument contents: 'Des opérations avec les nombresl') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Nombres_différenceetrep;
        add: self section_Expert_ListeDesPrédicats_Nombres_xrepvars;
        add: self section_Expert_ListeDesPrédicats_Nombres_supérieurà;
        add: self section_Expert_ListeDesPrédicats_Nombres_racineFractionrep;
        add: self section_Expert_ListeDesPrédicats_Nombres_égalà;
        add: self section_Expert_ListeDesPrédicats_Nombres_supérieurOuEgalà;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Nombres_différenceetrep
^(EruditeBookSection basicNew title: 'différence:et:rep:'; document: ((EruditeDocument contents: 'différence:et:rep:vars: 

La différence de deux nombres.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_ListeDesPrédicats_Nombres_différenceetrepvars
	^ EruditeBookSection basicNew
		title: 'différence:et:rep:vars';
		document:
			((EruditeDocument contents: 'différence:et:rep:vars: 

La différence de deux nombres.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Nombres_égalà
^(EruditeBookSection basicNew title: 'égal:à:'; document: ((EruditeDocument contents: 'égal:à:

égalité numérique de deux nombres ou de deux points.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Nombres_racineFractionrep
^(EruditeBookSection basicNew title: 'racineFraction:rep:'; document: ((EruditeDocument contents: 'racineFraction:rep:

Racine sous forme de fraction.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Nombres_supérieurOuEgalà
^(EruditeBookSection basicNew title: 'supérieurOuEgal:à:'; document: ((EruditeDocument contents: 'supérieurOuEgal:à:

>=
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_ListeDesPrédicats_Nombres_supérieurOuEgalà_supérieurOuEgalà
	^ EruditeBookSection basicNew
		title: 'supérieurOuEgal:à';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Nombres_supérieurà
^(EruditeBookSection basicNew title: 'supérieur:à:'; document: ((EruditeDocument contents: 'supérieur:à:vars:
 
> ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_ListeDesPrédicats_Nombres_supérieurà_supérieuràvars
	^ EruditeBookSection basicNew
		title: 'supérieur:à:vars:';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Nombres_xrepvars
^(EruditeBookSection basicNew title: 'x:rep:vars: '; document: ((EruditeDocument contents: 'x:rep:vars: 
Coordonnée x d''''un point.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Relations
^(EruditeBookSection basicNew title: 'Relations'; document: ((EruditeDocument contents: ' DrGeo relations permettent de représenter les relations  d''équivalences sous forme de partition d''un ensemble pour un traitement plus rapide.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Relations_ajouteensemble;
        add: self section_Expert_ListeDesPrédicats_Relations_nonRelationetnom;
        add: self section_Expert_ListeDesPrédicats_Relations_relationetnom;
        add: self section_Expert_ListeDesPrédicats_Relations_relationrep;
        add: self section_Expert_ListeDesPrédicats_Relations_relationCréeetnom;
        add: self section_Expert_ListeDesPrédicats_Relations_relationsClés;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Relations_ajouteensemble
^(EruditeBookSection basicNew title: 'ajoute:ensemble:	'; document: ((EruditeDocument contents: 'ajoute:ensemble:	

Ajoute un élément à  un ensemble.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Relations_nonRelationetnom
^(EruditeBookSection basicNew title: 'nonRelation:et:nom:	'; document: ((EruditeDocument contents: 'nonRelation:et:nom:	

Vérifie qu''il n''y a pas de relation.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Relations_relationCréeetnom
^(EruditeBookSection basicNew title: 'relationCrée:et:nom:'; document: ((EruditeDocument contents: 'relationCrée:et:nom:

Etablit une relation.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Relations_relationetnom
^(EruditeBookSection basicNew title: 'relation:et:nom:'; document: ((EruditeDocument contents: 'relation:et:nom:	

Relation entre deux objets, nom de la relation.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Relations_relationrep
^(EruditeBookSection basicNew title: 'relation:rep:	'; document: ((EruditeDocument contents: 'relation:rep:	

Affiche les éléments en relation sous forme de 	listes.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_ListeDesPrédicats_Relations_relationsClés
^(EruditeBookSection basicNew title: 'relationsClés:	'; document: ((EruditeDocument contents: 'relationsClés:	

Affiche les relations définies.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert
	^ EruditeBookSection basicNew
		title: 'Menu Expert';
		document:
			((EruditeDocument contents: '!!!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié signifie que les variables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_AfficherLesFaits
	^ EruditeBookSection basicNew
		title: 'Afficher les faits';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_AfficherLesRègles
	^ EruditeBookSection basicNew
		title: 'Afficher les règles';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_AffirmerDesFaits
	^ EruditeBookSection basicNew
		title: 'Affirmer des faits';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_ChargerDesRègles
	^ EruditeBookSection basicNew
		title: 'Charger des règles';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_ChargerLesFaitsDeLaFigure
	^ EruditeBookSection basicNew
		title: 'Charger les faits de la figure';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_Déductions
	^ EruditeBookSection basicNew
		title: 'Déductions';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_ExaminerLaFigure
	^ EruditeBookSection basicNew
		title: 'Examiner la figure';
		document:
			((EruditeDocument contents: '!!!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_ExpertAide
	^ EruditeBookSection basicNew
		title: 'Expert Aide';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_Expliquer
	^ EruditeBookSection basicNew
		title: 'Expliquer';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_ExpliquerRécursivement
	^ EruditeBookSection basicNew
		title: 'Expliquer récursivement';
		document:
			((EruditeDocument contents: '!!!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer **expliquer récursivement** dans le menu.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_InitialiserLesFaits
	^ EruditeBookSection basicNew
		title: 'Initialiser les faits';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_InitialiserLesRègles
	^ EruditeBookSection basicNew
		title: 'Initialiser les règles';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_ModèlesDeQuestion
	^ EruditeBookSection basicNew
		title: 'Modèles de question';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_ModifierLaffichageDesCommentaires
	^ EruditeBookSection basicNew
		title: 'Modifier l''''affichage des commentaires';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_Vérifier
	^ EruditeBookSection basicNew
		title: 'Vérifier';
		document:
			((EruditeDocument contents: '!!!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer **vérifier** dans le menu.')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_MenuExpert_WorldMenu
	^ EruditeBookSection basicNew
		title: 'WorldMenu';
		document:
			((EruditeDocument contents: '!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié s$ignifie que les v$ariables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Expert_Tutoriel
^(EruditeBookSection basicNew title: 'Tutoriel'; document: ((EruditeDocument contents: '!!!!!!Tutoriel

Le tutoriel se passe dans  un espace de travail, s''il n''y a pas d''espace de travai ouvert en copiant un exemple, un espace de travail s''ouvre avec le code:

Tu peux selectionner le code que tu veux exécuter dans l''espace de travail, 

La combinaison de touches **cmd/p** exécute le code et affiche le résultat de la sélection.

La combinaison de touches **cmd/d** exécute seulement le code de la sélection.
[[[ f :=DrGeoFigure new.''''.]]] embedIt

Tu peux aussi cliquer le bouton droit et cliquer  **print it** ou **do it** 
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_Tutoriel_OuvirUneFigureOuUnExpert;
        add: self section_Expert_Tutoriel_InitialiserLesFaits;
        add: self section_Expert_Tutoriel_AffirmerDesFaits;
        add: self section_Expert_Tutoriel_AfficherLesFaits;
        add: self section_Expert_Tutoriel_DéfinirUneRègle;
        add: self section_Expert_Tutoriel_InitialiserLesRègles;
        add: self section_Expert_Tutoriel_Déductions;
        add: self section_Expert_Tutoriel_ModèlesDeQuestions;
        add: self section_Expert_Tutoriel_VérifierUneCondition;
        add: self section_Expert_Tutoriel_Explications;
        add: self section_Expert_Tutoriel_AfficherLesRègles;
        add: self section_Expert_Tutoriel_ChargerDesRègles;
        add: self section_Expert_Tutoriel_LesPrédicats;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_AfficherLesFaits
^(EruditeBookSection basicNew title: 'Afficher les faits'; document: ((EruditeDocument contents: '!!!!!!Afficher les faits

//<expert>//**afficheFaits**

Affiche les faits.

Exemple: 

e  afficheFaits.
[[[f presenter expertDisplayTutor:''
e afficheFaits.''.
]]] doItWithButton: copier l''exemple.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_AfficherLesRègles
^(EruditeBookSection basicNew title: 'Afficher les règles
'; document: ((EruditeDocument contents: '!!!!!!Afficher les règles

//<expert>afficheRegles//
Affiche les règles actives.

Exemple:

**e afficheRegles. **
[[[f presenter expertDisplayTutor:''
e afficheRegles.''.
]]] doItWithButton: copier l''exemple.

//On devrait avoir un seul apostrophe mais cuis replace à l''affichage un apostrophe par deux apostrophes.
 Deux apostrophes représentent un apostrophe dans une chaîne de caractère, un seul apostrophe marquerait la fin de la chaîne.//
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_AffirmerDesFaits
^(EruditeBookSection basicNew title: 'Affirmer des faits'; document: ((EruditeDocument contents: 's!!!!!!Affirmer des faits

//<expert>//**affirmeFaits:** faits 

Les faits sont affirmés avec la justification **énoncé**
la justification pere de savoir d''où provient l''affirmation.
La justification peut être :

	**énoncé** 						pour un fait **affirmé**.
	**Le nom d''une règle**						pour un fait qui provient d''une 	**règle**.s
	**DrGeo** 						pour un fait qui provient d''une **figure**,

Exemples:		
	
Faits affirmés.

S''il y a plusieurs faits	, chaque fait est à la 			ligne.

e initFaits.."Supprime les faits existants"
**e affirmeFaits: ''père Pierre Jean
mère Pierre léa''.**
e afficheFaits."Affiche tous les faits"
[[[f presenter expertDisplayTutor:''
e initFaits.."Supprime les faits existants"
e affirmeFaits: ''''père Pierre Jean
mère Pierre Léa''''.
e afficheFaits."Affiche tous les faits"
''.
]]] doItWithButton: copier l''exemple.

Exercices : 
	Conserver les faits existants.
	Affirmer les faits pour Marie.
	Affirmer les faits pour que Jules et Eric soit les grandpères de Pierre et de Marie..

[[[f presenter expertDisplayTutor:''
"Pas de initFaits pour garder les faits existants"
"Jules est le grandpère paternel"
"Eric est le grandpère maternel"
e affirmeFaits: ''''père Marie Jean
mère Marie Léa
père Jean Jules
père Léa Eric''''.
e afficheFaits."Affiche tous les faits"
"La solution est aussi acceptable avec les noms inversés."''
]]] doItWithButton: Solutions.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_ChargerDesRègles
^(EruditeBookSection basicNew title: 'Charger des règles'; document: ((EruditeDocument contents: '!!!!!!Charger des règles
//<Expert>//**ChargeRegle:**  Règles_à_charger

Il y a des règles prédéfinies que tu peux charger.
Ces règles sont dans la classe ExpertRegle.

Pour voir ces règles exécute le message: **règlesPrédéfinies**.

[[[f presenter expertDisplayTutor:''
e règlesPrédéfinies.''.
]]] doItWithButton: copier l''exemple.

Chargement d''une règle:
e initRegles.
e chargeRegles: ''famille''.

[[[f presenter expertDisplayTutor:''
e initRegles.
e chargeRegles: ''''famille''''.
e afficheRegles.''
]]] doItWithButton: copier l''exemple.

La règle frèreOuSoeur sera utilisée plus tard.

Pour voir les règles chagées.

e mesRegles.
[[[f presenter expertDisplayTutor:''e mesRegles.''

]]] doItWithButton: copier l''exemple.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_Tutoriel_ChargerDesRègles_ExempleDexpertLeMorpion
	^ EruditeBookSection basicNew
		title: 'Exemple d''expert, le morpion';
		document:
			((EruditeDocument contents: '!!!!!!morpion
Ce système expert donne des conseils pour le jeu du morpion.

Il repère les lignes qui ont deux marqes d''un même joueur et une place vide. Pour le joueur c''est une occasion de gagne et pour l''adversaire une nécessité de contrer.
Il repère aussi une ligne gagnante.

Chargement des règles.

On commense part initialiser les règles.

[[[e initRegles]]]
[[[txt := ''e initRegles''.
(w isNil or: [w owner isNil] )                                                                     ifTrue:[w := Workspace openLabel:''Tutoriel expert''.
 w model actualContents:''e := Expert nouveau.''  ].
	w model actualContents: w model actualContents,Character cr asString,txt]]] doItWithButton: copier l''exemple..


[[[ExpertRegle morpion: e]]]
[[[txt := ''ExpertRegle morpion: e''.
(w isNil or: [w owner isNil] )                                                                     ifTrue:[w := Workspace openLabel:''Tutoriel expert''.
 w model actualContents:''e := Expert nouveau.''  ].
w model actualContents: w model actualContents,Character cr asString,txt]]] doItWithButton: copier l''exemple..

Voir les règles.  

[[[e afficheRegles]]]

[[[txt := ''e afficheRegles''.
(w isNil or: [w owner isNil] )                                                                     ifTrue:[w := Workspace openLabel:''Tutoriel expert''.
 w model actualContents:''e := Expert nouveau.''  ].
w model actualContents: w model actualContents,Character cr asString,txt]]] doItWithButton: copier l''exemple..

Les faits qui décrivent le jeu.

Le joueur: 	
 	**joueur x**  et  **joueur o**  
Le terrain de jeu:
	**ligne h1 - - -**
	**ligne h2 - - -**
	**ligne h3 - - -**
	avec - ; x ; o.

Ce sont les lignes horizontales, les autres seront déduites par des règles du genre:

	e lisRegle: ''v1''
	si: ''ligne h1 ?1 ?2 ?3
	ligne h2 ?4 ?5 ?6
	ligne h3 ?7 ?8 ?9'' 
	alors: ''ligne v1 ?1 ?4 ?7''.

Les variables numérotées représentent les 9 cases.

Les lignes qui permettent de gagner sont du genre:

	e lisRegle: ''gagne 1''
	si: ''joueur ?j
	ligne ?l - ?j ?j''
	alors: ''joueur ?j [ gagne en jouant ?l case 1''

La variable ?j contient la marque du joueur.
La variable ?a contient la marque de l''adversaire et ce sont des cas où le joueur doit contrer l''adversaire.

Le joueur a gagné.

	e lisRegle: ''a gagné''
	si: ''joueur ?j
	ligne ?l ?j ?j ?j''
	alors: ''Joueur ?j [ a gagné ligne ?l ]''.

E.t c''est une partie nulle si toutes les cases sont pleines
	e lisRegle: ''Fin''
	si: ''ligne h1 ?1 ?2 ?3
	different:de: ?1 -
	different:de: ?2 -
	different:de: ?3 -
	ligne h2 ?4 ?5 ?6
	different:de: ?4 -
	different:de: ?5 -
	different:de: ?6 -
	ligne h3 ?7 ?8 ?9
	different:de: ?7 -
	different:de: ?8 -
	different:de: ?9 -''
	alors: ''''partie terminée''.')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_Tutoriel_ChargerDesRègles_morpion
	^ EruditeBookSection basicNew
		title: 'morpion';
		document:
			((EruditeDocument contents: '!!!!!!morpion
Ce système expert donne des conseils pour le jeu du morpion.

Il repère les lignes qui ont deux marqes d''un même joueur et une place vide. Pour le joueur c''est une occasion de gagne et pour l''adversaire une nécessité de contrer.
Il repère aussi une ligne gagnante.

Chargement des règles.

On commense part initialiser les règles.

[[[e initRegles]]]
[[[txt := ''e initRegles''.
(w isNil or: [w owner isNil] )                                                                     ifTrue:[w := Workspace openLabel:''Tutoriel expert''.
 w model actualContents:''e := Expert nouveau.''  ].
	w model actualContents: w model actualContents,Character cr asString,txt]]] doItWithButton: copier l''exemple..


[[[ExpertRegle morpion: e]]]
[[[txt := ''ExpertRegle morpion: e''.
(w isNil or: [w owner isNil] )                                                                     ifTrue:[w := Workspace openLabel:''Tutoriel expert''.
 w model actualContents:''e := Expert nouveau.''  ].
w model actualContents: w model actualContents,Character cr asString,txt]]] doItWithButton: copier l''exemple..

Voir les règles.  

[[[e afficheRegles]]]

[[[txt := ''e afficheRegles''.
(w isNil or: [w owner isNil] )                                                                     ifTrue:[w := Workspace openLabel:''Tutoriel expert''.
 w model actualContents:''e := Expert nouveau.''  ].
w model actualContents: w model actualContents,Character cr asString,txt]]] doItWithButton: copier l''exemple..

Les faits qui décrivent le jeu.

Le joueur: 	
 	**joueur x**  et  **joueur o**  
Le terrain de jeu:
	**ligne h1 - - -**
	**ligne h2 - - -**
	**ligne h3 - - -**
	avec - ; x ; o.

Ce sont les lignes horizontales, les autres seront déduites par des règles du genre:

	e lisRegle: ''v1''
	si: ''ligne h1 ?1 ?2 ?3
	ligne h2 ?4 ?5 ?6
	ligne h3 ?7 ?8 ?9'' 
	alors: ''ligne v1 ?1 ?4 ?7''.

Les variables numérotées représentent les 9 cases.

Les lignes qui permettent de gagner sont du genre:

	e lisRegle: ''gagne 1''
	si: ''joueur ?j
	ligne ?l - ?j ?j''
	alors: ''joueur ?j [ gagne en jouant ?l case 1''

La variable ?j contient la marque du joueur.
La variable ?a contient la marque de l''adversaire et ce sont des cas où le joueur doit contrer l''adversaire.

Le joueur a gagné.

	e lisRegle: ''a gagné''
	si: ''joueur ?j
	ligne ?l ?j ?j ?j''
	alors: ''Joueur ?j [ a gagné ligne ?l ]''.

E.t c''est une partie nulle si toutes les cases sont pleines
	e lisRegle: ''Fin''
	si: ''ligne h1 ?1 ?2 ?3
	different:de: ?1 -
	different:de: ?2 -
	different:de: ?3 -
	ligne h2 ?4 ?5 ?6
	different:de: ?4 -
	different:de: ?5 -
	different:de: ?6 -
	ligne h3 ?7 ?8 ?9
	different:de: ?7 -
	different:de: ?8 -
	different:de: ?9 -''
	alors: ''''partie terminée''.')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_Déductions
^(EruditeBookSection basicNew title: 'Déductions'; document: ((EruditeDocument contents: '!!!!!!Déductions
//<expert>//**deduis**

Lance le processus de déduction.
	
Les règles sont exécutées et, si leurs conditions sont satisfaites, la conclusion est ajoutée aux affirmations.

Exemple: 

C''est le même exemple que pour la définition d''une règle  mais l''attention est sur le message **deduis**

**"Faits donnés"**
e initFaits.
e affirmeFaits: ''
père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''.

**"Définition de la règle"**
e lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''un enfant sont son père et sa mère''.

**"Déductions"

e deduis.**

"affichage des faits"**
e afficheFaits.


Dans l''espace de travall, tu peux sélectionner exécuter le tout ou  sélectionner et exécuter chaque partie.

[[[f presenter expertDisplayTutor:''
"Faits donnés"
e initFaits.
e affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''''.
"Définition de la règle"
e lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.
" Déductions."
e deduis.
"affirmation des faits"
e afficheFaits.
'' 
]]] doItWithButton: copier l''exemple.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_DéfinirUneRègle
^(EruditeBookSection basicNew title: 'Définir une règle'; document: ((EruditeDocument contents: '!!!!!!Définir une règle

//<expert>//**lisRegle:si:alors:com:** nom  cond concl com
ou
**lisRegle:si:alors:** nom  cond concl 

Exemple:

**"Faits donnés"**
e initFaits.
e affirmeFaits: ''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''.

**"Définition de la règle"**
e initRegles.
**
e lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''un enfant sont son père et sa mère''.
**
"Déductions"**
e deduis."examine les règles"

**"affichage des faits"**
e afficheFaits.


Tu peux sélectionner le tout et l''exécuter ou  sélectionner et exécuter chaque partie.

[[[f presenter expertDisplayTutor:''
"Faits donnés"
e initFaits.
e affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''''.
"Définition de la règle"
e initRegles.
e lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.
" Déductions."
e deduis.
"affirmation des faits"
e afficheFaits.
'' 
]]] doItWithButton: copier l''exemple.

Exercices :

On affirme les faits suivants :
[[[f presenter expertDisplayTutor:''
"Faits donnés à affirmer"
e initFaits.
e affirmeFaits: ''''
père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Jean Jules
père Léa Eric
''''.
" Ecris la règle pour déduire un grandpère"
''.
]]] doItWithButton: Faits donnés à affirmer.

Ecris la règle pour déduire un grandpère

[[[f presenter expertDisplayTutor:''
"Solution"
e initRegles.
e lisRegle: ''''grandPère''''
si:''''père ?enfant ?père 
père  ?père ?grandPère''''
alors:''''grandPère ?grandPère ?enfant''''
com:''''Le grandPère est le père du père d''''''''un enfant.''''.

"deductions"
e deduis.

" Affichage des faits"
e afficheFaits.
''.
]]] doItWithButton: Solution.

Aller plus loin :

Ecris d''autre règles sur la famile.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_Explications
^(EruditeBookSection basicNew title: 'Explications'; document: ((EruditeDocument contents: '!!!!!!Explications

<Expert>** causeFaitNo:**//  numéro_ d''un_fait//

Le système expert peut expliquer comment il a trouvé un fait il faut donner le numéro du fait à expliquer.
Si le fait est un fait énoncé,  la jutification  est énoncé, sinon la jusification est le nom de la règle qui a produit le fait.

L''explication cite les conditions de l''antécédant de la règle avec les valeurs trouvées à la place des variables.
Une condition avec toutes ses variables replacées par leurs valeurs est une affirmation on dit qu''elle est **instanciée**.


C''est le même exemple que pour la définition d''une règle  mais l''attention est sur le message **causeFaitNo:**

**"Faits donnés"**
e initFaits.
e affirmeFaits: ''
père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''.

**"Définition de la règle"**
e lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''un enfant sont son père et sa mère''.

"Déductions"
e deduis."examine les règles"

"affichage des faits"
e afficheFaits.
**e causeFaitNo:5**

Tu peux sélectionner le tout et l''exécuter ou sélectionner et exécuter chaque partie.

[[[f presenter expertDisplayTutor:''
"Faits donnés"
e initFaits.
e affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''''.
"Définition de la règle"
e lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.
" Déductions."
e deduis.
"affirmation des faits"
e afficheFaits.
e causeFaitNo:5
.''.
]]] doItWithButton: copier l''exemple.

Essaie avec le numéro d''autres faits. 

<Expert>** causesFaitNo: ** // numéro_ d''un_fait//  (causes au pluriel)

Explique  aussi les faits trouvés dans la condition jusqu''à remonter à l''énoncé.
On dit expliquer récursivement.

e causeFaitNo:5.
[[[f presenter expertDisplayTutor:''
e causesFaitNo:5.''.
]]] doItWithButton: copier cet exemple à la suite de l''exemple précédant.

Cet exemple sera repris dans la section **Les prédicats** dans le cas où un fait dépend de plusieurs règles.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_InitialiserLesFaits
^(EruditeBookSection basicNew title: 'Initialiser les faits'; document: ((EruditeDocument contents: '
//<expert>//**iniFaits.** 

Supprime toutes les affirnations.

Exemple.
( Pour tester ce message, il faut au moins un fait. )

"Afffirme un fait pour tester"
e affirmeFaits: ''''un fait test''.
e afficheFaits.
[[[  f  presenter expertDisplayTutor:''"Afffirme un fait pour tester"
e affirmeFaits: ''''un fait test''''.
e afficheFaits.
'']]] doItWithButton: Affirme un fait pour essayer l''exemple.

"Supprimer les faits actuels"
e initFaits.
e aficheFaits''.
[[[ f  presenter expertDisplayTutor:''"Supprimer les faits actuels"
e initFaits.
e afficheFaits.''.
]]] doItWithButton: copier l''exemple. 

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_InitialiserLesRègles
^(EruditeBookSection basicNew title: 'Initialiser les règles'; document: ((EruditeDocument contents: '!!!!!!Initialiser une règle

//<expert>//**lisRegle:si:alors:com:** nom  cond concl com
ou
**lisRegle:si:alors:** nom  cond concl 

Exemple:

**"Faits donnés"**
e initFaits.
e affirmeFaits: ''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''.

**"Définition de la règle"**
**
e initRegles.**
e lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''un enfant sont son père et sa mère''.
**
"Déductions"**
e deduis."examine les règles"

**"affichage des faits"**
e afficheFaits.


Tu peux sélectionner le tout et l''exécuter ou  sélectionner et exécuter chaque partie.

[[[f presenter expertDisplayTutor:''
"Faits donnés"
e initFaits.
e affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''''.
"Définition de la règle"
e initRegles.
e lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.
" Déductions."
e deduis.
"affirmation des faits"
e afficheFaits.
'' 
]]] doItWithButton: copier l''exemple.

Exercices :

On affirme les faits suivants :
[[[f presenter expertDisplayTutor:''
"Faits donnés à affirmer"
e initFaits.
e affirmeFaits: ''''
père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Jean Jules
père Léa Eric
''''.
" Ecris la règle pour déduire un grandpère"
''.
]]] doItWithButton: Faits donnés à affirmer.

Ecris la règle pour déduire un grandpère

[[[f presenter expertDisplayTutor:''
"Solution"
e initRegles.
e lisRegle: ''''grandPère''''
si:''''père ?enfant ?père 
père  ?père ?grandPère''''
alors:''''grandPère ?grandPère ?enfant''''
com:''''Le grandPère est le père du père d''''''''un enfant.''''.

"deductions"
e deduis.

" Affichage des faits"
e afficheFaits.
''.
]]] doItWithButton: Solution.

Aller plus loin :

Ecris d''autre règles sur la famile.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_LesPrédicats
^(EruditeBookSection basicNew title: 'Les prédicats'; document: ((EruditeDocument contents: '!!!!!!Les prédicats
//<expert> //** sélecteur  **//arguents//

Les prédicats sont des méthodes que tu peux appeler depuis le système expert.
Elles retounent true ou false (vrai ou faux).

Le sélecteur est formé des sélecteurs de la méthode acollés et  les arguents suivent

Les prédicats s''utilisent comme les conditions. 
En général on place les prédiats après les conditions.

Un antécédant d''une règle ne peut pas avoir que des prédicats, il doit y avoir au moins une condition.

Exemples:

Il faut d''abord définir la règle parents.

e initRegles.
e lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''un enfant sont son père et sa mère''.
[[[f presenter expertDisplayTutor:''
e initRegles.
e lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.
''.]]] doItWithButton: copier l''exemple.

Définis la règle frèreOuSoeur:

e  lisRegle:''frèreOuSoeur''
si:''parents ?e1 ?p  ?m
parents ?e2  ?p  ?m''
alors:''frèreOuSoeur ?e1 ?e2''.	
[[[f presenter expertDisplayTutor:''e  lisRegle:''''frèreOuSoeur''''
si:''''parents ?e1 ?p  ?m
parents ?e2  ?p  ?m''''
alors:''''frèreOuSoeur ?e1 ?e2''''.
''.
]]] doItWithButton: copier l''exemple.

Essaye cette règle.
e initFaits.
e affirmeFaits: ''''père Pierre  Jean
 mère Pierre  léa
père Marie  Jean
mère Marie  léa''''.
e deduis. 
e verifieCondition: ''frèreOuSoeur ?e1 ?e2''.
[[[f presenter expertDisplayTutor:''
e initFaits.
e affirmeFaits: ''''père Pierre  Jean
 mère Pierre  léa
père Marie  Jean
mère Marie  léa''''.
e deduis. 
e verifieCondition: ''''frèreOuSoeur ?e1 ?e2''''.''.]]] doItWithButton: copier l''exemple.

On obtient  4  solutions, deux ont le même enfant chaque fois.

Pour éliminer ces solutions, on va dire que ?e1 et ?e2 doivent être différents.

Au lieu d''une condition on va utiliser un prédicat qui va faire la comparaison et répondre vrai ou faux
comme une condition.

Un prédicat est une méthode smalltalk appelée par le système expert.

Le nom du  prédicat est formé du nom de la méthode suivi de ses sélecteurs puis des valeurs des paramètres.

Le prédicat qu''on va utiliser est different:de:

	e  lisRegle:''frèreOuSoeur''
	si:''parents ?e1 ?p  ?m
	parents ?e2  ?p  ?m
   	different:de:?e1 ?e2''
	alors:''frèreOuSoeur ?e1 ?e2''.
	[[[f presenter expertDisplayTutor:''e  lisRegle:''''frèreOuSoeur''''
si:''''parents ?e1 ?p  ?m
parents ?e2  ?p  ?m
different:de: ?e1 ?e2 ''''
alors:''''frèreOuSoeur ?e1 ?e2''''.''.
]]] doItWithButton: copier l''exemple.

Avant de pouvoir essayer la règle il faut réinitialiser les faits.
	e initFaits.
	e affirmeFaits: ''
	père Pierre  Jean
 	mère Pierre  léa
	père Marie  Jean
	mère Marie  léa''.
	e deduis. 
	e verifieCondition: ''frèreOuSoeur ?e1 ?e2''.
	[[[f presenter expertDisplayTutor:''
e initFaits.
e affirmeFaits: ''''père Pierre  Jean
 mère Pierre  léa
père Marie  Jean
mère Marie  léa''''.
e deduis. 
e verifieCondition: ''''frèreOuSoeur ?e1 ?e2''''.''.]]] doItWithButton: copier l''exemple.

Maintenant il n''y a que deux réponses.

Tu peux encore fairre mieux  avec le prédicat qui classe en ordre alphabétique  ordonneMot:et:rep1:rep2:.

	e  lisRegle:''frèreOuSoeur''
	si:''parents ?e1 ?p  ?m
	parents ?e2  ?p  ?m
   	different:de:?e1 ?e2
	ordonneMot:et:rep1:rep2: ?e1 ?e2  ?e1 ?e2 ''
	alors:''frèreOuSoeur ?e1 ?e2''.
	[[[f presenter expertDisplayTutor:''e  lisRegle:''''frèreOuSoeur''''
si:''''parents ?e1 ?p  ?m
parents ?e2  ?p  ?m
different:de: ?e1 ?e2  
ordonneMot:et:rep1:rep2:  ?e1 ?e2  ?e1 ?e2 ''''
alors:''''frèreOuSoeur ?e1 ?e2''''.''.
]]] doItWithButton: copier l''exemple.

	e initFaits.
	e affirmeFaits: ''père Pierre  Jean
 	mère Pierre  léa
	père Marie  Jean
	mère Marie  léa''.
	e deduis. 
	e verifieCondition: ''frèreOuSoeur ?e1 ?e2''.
	[[[f presenter expertDisplayTutor:''
e initFaits.
e affirmeFaits: ''''père Pierre  Jean
 mère Pierre  léa
père Marie  Jean
mère Marie  léa''''.
e deduis. 
e verifieCondition: ''''frèreOuSoeur ?e1 ?e2''''.''.]]] doItWithButton: copier l''exemple.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_ModèlesDeQuestions
^(EruditeBookSection basicNew title: 'Modèles de questions'; document: ((EruditeDocument contents: '!!!!!!Modèles de questions

//<expert>//**modèlesQuestions** 
 
Exemple: 

e modèlesQuestions. 
[[[f presenter expertDisplayTutor:''
e modèlesQuestions. .''.
]]] doItWithButton: copier l''exemple.

Ce message est utilisé à la suite de déductions, il résume les questions que tu peux poser au système expert au moyen du message **vérifieCondition:**.

Un modèles de questions est  une forme généralisée de la conclusion d''une règle.

"Faits donnés"
e initFaits.
e affirmeFaits: ''
père  Pierre Jean
mère  Pierre Léa
père  Marie Jean
mère  Marie Léa''.
"Définition de la règle"
e lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''''''un enfant sont son père et sa mère''.
"Déductions"
 e deduis .  	
e modèlesQuestions.
"e verifieCondition: ''parents  ?x1 ?x2 ?x3''."
[[[f presenter expertDisplayTutor:''
"Faits donnés"
e initFaits.
e affirmeFaits: ''''père  Pierre Jean
mère  Pierre Léa
père  Marie Jean
mère  Marie Léa''''.
"Définition de la règle"
e lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.
" Déductions."
e deduis.
e modèlesQuestions.
'' ]]] doItWithButton: copier l''exemple.


Les faits sont représentés par une liste de mots, et non par une chaîne de caractères, dont les mots sont séparés par des espaces.

//père Pierre Jean//

Une liste peut contenir une autre liste à la place d''un mot.
//père  [ Pierre Marie ] Jean//

Cette liste à l''intérieur d''une liste est dite de deuxième ninveau.

Si cette liste contient aussi une liste, la liste contenue sera de troisième niveau.

La profondeur d''une liste est son niveau.
Une liste dans une liste est entourée de [  ].
La liste de premier niveau n''est pas entouré et ressemble à une chaîne de caractères.

Le modèle de question est une liste de premier niveau avec le  premier mot du fait suivi d''autant de variables que d''éléments de la liste.

//père ?x1  ?x2// peut être :
	 //père Pierre Jean avec ?x1-> Pierre ou ?x1-> Marie et ?x2-> Jean// 
ou
	//père [ Pierre Marie ] Jean avec ?x1-> [ Pierre Marie ] et ?x2-> Jean.//

Chaque variable contient soit un mot soit une liste.

Dans ce tutoriel, sauf pour cette section, il n''y a que des listes de premier niveau, donc c''est comme si on n''avait que des chaînes de caractères. la structure de liste est utilisée dans la géométrie et d''autres règles prédéfinies.


Exercice:
Affirne les faits père et mère avec les efants dans une liste comme cet exemple.


[[[f presenter expertDisplayTutor:''	
"Faits donnés"
e initFaits.
e affirmeFaits: ''''père [ Pierre Marie ] Jean''''.'']]] doItWithButton: copier l''exemple..

complète les affirmations pour la mère, 
deduis et affiche le modèle de  questions.

[[[f presenter expertDisplayTutor:''	
"Faits donnés"
e initFaits.
e affirmeFaits: ''''père [ Pierre Marie ] Jean
mère [ Pierre Marie ] Léa''''.
 e deduis .  	
e modèlesQuestions.

'']]] doItWithButton: solution.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_Tutoriel_ModèlesDeQuestions_UtilisationInteractive
	^ EruditeBookSection basicNew
		title: 'Utilisation interactive';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Expert_Tutoriel_OuvirUnExpert
	^ EruditeBookSection basicNew
		title: 'Ouvir un expert';
		document:
			((EruditeDocument contents: '!!!!!!Ouvir un expert

//<Expert>//**Expert ** nouveau.

Exemples:
	
Créér une instance de Expert.
e :=Expert nouveau.
e
[[[f presenter expertDisplayTutor:''
e :=Expert nouveau.
e''
]]] doItWithButton: copier l''exemple.

 Lors de la création d''une instance de DrGeoFigure, une instance de Expert est créée et placée dans la variabe d''instance **expert** de la figure.

Si l''on clique le bouton vert avant d''exécuter le code ci-dessous la figure la nouvelle figure apparait dans la fenêtre de droite, dans un espace de travail les variables sont déclarées par défaut. C''est utile pour essayer des parties de code.

f := DrGeoFigure nouveau.
e := f expert.
{e .f}
[[[f presenter expertDisplayTutor:''
f := DrGeoFigure nouveau.
e := f expert.
{e .f}'']]] doItWithButton: copier l''exemple.

//{e .f} des variables entre { et } séparées par . sont remplacées par un tableau avec leurs valeurs.//

Dans la suite de ce tutoriel, un espace de travail s''ouvre avec les variables **f** et **e** déjà initialisées.

')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_OuvirUneFigureOuUnExpert
^(EruditeBookSection basicNew title: 'Ouvir une figure ou un expert

'; document: ((EruditeDocument contents: '!!!!!!Ouvir une figure 
!!!!!!ou un système expert

//<Expert>//**Expert ** nouveau.
//<DrGeoFigure>//**DrGeoFigure ** nouveau.

 Lors de la création d''une instance de DrGeoFigure, une instance de Expert est créée et placée dans la variabe d''instance **expert** de la figure.

Si l''on clique le bouton vert avant d''exécuter le code ci-dessous la figure la nouvelle figure apparait dans la fenêtre de droite, dans un espace de travail les variables sont déclarées par défaut. C''est utile pour essayer des parties de code.

f := DrGeoFigure nouveau.
e := f expert.
{e .f}
[[[f presenter expertDisplayTutor:''
f := DrGeoFigure nouveau.
e := f expert.
{e .f}'']]] doItWithButton: copier l''exemple.

//{e .f} des variables entre { et } séparées par . sont remplacées par un tableau avec leurs valeurs.//
	
Créér une instance de Expert.
e :=Expert nouveau.
e
[[[f presenter expertDisplayTutor:''
e :=Expert nouveau.
e''
]]] doItWithButton: copier l''exemple.

Dans la suite de ce tutoriel, si tu copies un exemple un espace de travail s''ouvre , s''il n''est pas déjà ouvert, avec les variables **f** et **e** déjà initialisées.
**f** contient une DrGeoFigure et **e** une Expert.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:40'!
section_Expert_Tutoriel_VérifierUneCondition
^(EruditeBookSection basicNew title: 'Vérifier une condition.'; document: ((EruditeDocument contents: '!!!!!!Vérifier une condition.

//<expert>//**vérifieCondition:**

Exemple:

( S''il n''y a pas de faits affirmés exécute d''abord ces affirmations.
	"Affirmatilons et règles pour l''exemple"
	e affirmeFaits: ''père Pierre Jean
	mère Pierre Léa
	père Marie Jean
	mère Marie Léa''.
	e chargeRegles:''famille''.
	e deduis.
	"Exemple"
	e  verifieCondition:''parents  ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''
"Affirmatilons et règles pour l''''exemple"
e affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa''''.
e chargeRegles:''''famille''''.
e deduis.
"Example"
e  verifieCondition:''''parents  ?x1 ?x2 ?x3''''.''
]]] doItWithButton: copier l''exemple.
 	


On peut mettre plusieurs conditions celà permet aussi de vérifier les antécédants d''une règle.


	e  verifieCondition:''père  ?x1 ?x2
	mère ?x1 ?x3''.
	[[[f presenter expertDisplayTutor:''
e  verifieCondition:''''père  ?x1 ?x2
mère ?x1 ?x3''''.''.
]]] doItWithButton: copier l''exemple.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Expert_UtilisationInteractive
^(EruditeBookSection basicNew title: 'Utilisation interactive'; document: ((EruditeDocument contents: '!!!!!! Utilisation intreractive

Pour ouvrir une figure, Clique sur le bouton ci-dessous[[[  ]]] withDrGeoActions. qui écris  **DrGeoFigure nouveau** dans l''éditeur de code, 

[[[DrGeoFigure nouveau]]] withDrGeoActions.

Clique sur le bouton vert **exécuter**  de l''éditeur de code. [[[DrGIcons iconUI: #play]]] embedIt

Clique dans la figure à droite avec le bouton droit pour avoir un menu avec lequel tu peux construire une figure,

Dans le sous-menu Expert, clique sur **Examiner la figure**, un espace de travail nommé Journal s''ouvre avec les commandes qui ont été exécutées pour obtenir les **modèles de 	questions**

Dans cet espace de travail, pour vérifiers un modèle, selectionne le modèle et, dans le sous-menu Expert, clique sur **Vérifier**.

Tu peux aussi copier plusieurs modèles de questions, un par ligne, et selectionner le tout pour vérification c''est utile pour vérifier les conditions d''une règle. Attention, il est souvent nécessaire de modifier la numérotation ou le nom des variables pour qu''une variable représente toujours la même chose.

Il est aussi possible de remplacer des variables par leur valeurs pour des questions plus précises.

On obtient **vrai** si tous les modéles sont vériflés.

Pour expliquer un fait, selectionne le numéro du fait et clique sur **Expliquer**.

Pour avoir la documentation d''un article du menu, laisse la souris dessus sans cliquer.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_UtilisationInteractive_MenuExpert;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Expert_UtilisationInteractive_MenuExpert
^(EruditeBookSection basicNew title: 'Menu Expert'; document: ((EruditeDocument contents: '!!!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	
!!!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer vérifier dans le menu.

!!!!!!!!Expliquer
Donne une explication de la provenance d''un fait à partir des conditions de la régles instanciées.

Instancié signifie que les variables ont reçu leur valeur.
Pour expliquer un fait, tu peux sélectionner son numéro et cliquer expliquer dans le menu.


!!!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer expliquer récursivement dans le menu.

!!!!!!!!Initialiser les faits
Supprime tous les faits.

!!!!!!!!Affirmer des faits
Ouvre une boîte de question pour affirmer un ou plusieurs faits.

Pour affirmer plusieurs faits (un par ligne), il faut les copier et les coller dans la boîte de question.

!!!!!!!!Déductions
vérifie les règles et affirme les conclusions si les conditions sont satisfaites.

!!!!!!!!Modèles de question
Un Modèles de question est une forme de résumé d''une conclusion avec le premier mot d''un fait suivi de variables
pour le reste c''est une liste de premier niveau les variables peuvent  contenir des souslistes.

père ?x1 ?x2   peut être 
	père Pierre Jean
ou	père [ Pierre Marie]  Jean

!!!!!!!!Afficher les faits
Affiche la liste des faits.

!!!!!!!!Charger des règles
Des groupes de règles prédéfinis sont des méthodes de la classe ExpertRegle.
Une boîte de choix permet de choisir un groupe pour aciiver ses règles.

Les groupes qui commencent par une majuscule initialisent les règles avant de s''installer.

!!!!!!!!Afficher les règles
Affiche la liste des règles.

!!!!!!!!Initialiser les règles
Supprime toutes les règles.

!!!!!!!!Modifier l''''affichage des commentaires
Supprime ou rétablit l''affichage des commentairs des règles.

!!!!!!!!WorldMenu
inverrse entre menu DrGeo et menu  World.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites_Explications
^(EruditeBookSection basicNew title: 'Explications'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_contrairecontrairerepvars
	^ EruditeBookSection basicNew
		title: 'contraire:contraire:rep:vars:';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_saufPremierrep
	^ EruditeBookSection basicNew
		title: 'saufPremier:rep:';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_taillerep
	^ EruditeBookSection basicNew
		title: 'taille:rep';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !


!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
initialize
    super initialize.
    title _ 'Dr. Geo Tutorial'.
        self addSection: self section_Introduction.
        self addSection: self section_Général.
        self addSection: self section_Point.
        self addSection: self section_Vecteur.
        self addSection: self section_LignesDroites.
        self addSection: self section_LignesCourbes.
        self addSection: self section_NumériqueTexte.
        self addSection: self section_Transformations.
        self addSection: self section_Styles.
        self addSection: self section_Expert.
! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Angles
	^ EruditeBookSection basicNew
		title: 'Angles';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_AnglesEtValeurs
	^ EruditeBookSection basicNew
		title: 'Angles et valeurs';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Autres
	^ EruditeBookSection basicNew
		title: 'Autres';
		document:
			((EruditeDocument contents: '!!!!!!Equation
//<equation>// **equationDe:** //item//
//item//, droite ou cercle
⇒ équation de la droite ou du cercle

[[[| fig e d |
fig _ DrGeoFigure nouveau.
fig afficherAxes.
d _ fig droitePassantPar: 0@0 et: 15@13.
e _ fig équationDe: e]]] withDrGeoActions

!!!!!!Texte
//<texte>// **texte:** //string//
//string//, une chaîne de caractères
⇒ texte positionné arbitrairement

[[[| fig |
fig _ DrGeoFigure nouveau.
fig texte: ''Hello'']]] withDrGeoActions

//<texte>// **texte:a** //string point//
//string//, une chaîne de caractères
//point//, un couple de coordonnées
⇒ texte positionné à un emplacement souhaité

[[[| fig |
fig _ DrGeoFigure nouveau.
fig texte: ''Hello,
  je suis heureux !!'' a: 0@0]]] withDrGeoActions

!!!!!!!!Modifier un texte
**texte:** //string//
//string//, une chaîne de caractères
⇒ modifie le texte d’un objet texte

[[[| fig monTexte |
fig _ DrGeoFigure nouveau.
monTexte _ fig texte: ''Hello''.
monTexte texte: ''Au revoir'']]] withDrGeoActions')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Autres_Equation
	^ EruditeBookSection basicNew
		title: 'Equation';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Autres_Texte
	^ EruditeBookSection basicNew
		title: 'Texte';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Exemples
	^ EruditeBookSection basicNew
		title: 'Exemples';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Général
^(EruditeBookSection basicNew title: 'Général'; document: ((EruditeDocument contents: '!!!!!!Commandes générales
**faire:** //bloc//
//bloc//, bloc de code contenant des instructions de construction et/ou d’animation de la figure interactive

Exécute le bloc de code dans un processus en tâche de fond. A utiliser lorsque la construction doit se faire sous les yeux de l’utilisateur ou bien lorsque la figure est animée.

[[[| fig point | 
fig _ DrGeoFigure nouveau.
point _ fig point: 0@0.
fig do: [ 
   -5 à: 5 par: 0.1 faire: [:x |
      point déplacerA: x@(x cos * 3).
      (Delay forMilliseconds: 100) wait.
      fig actualiser]
] ]]] withDrGeoActions

**actualiser**
Mise à jour de la figure après modification des attributs de quelques items. La plupart du temps ce n’est pas nécessaire.

**afficherGrille**
Affiche la grille de la figure.

**afficherAxes**
Affiche les axes ox et oy de la figure.

**centrerVueEn:** //unPoint//
//unPoint//, coordonnées d’un point.

La figure est décalée afin d’afficher le point donné en argument au centre de la fenêtre.

[[[| fig | 
fig _ DrGeoFigure nouveau.
fig afficherAxes.
fig centrerVueEn: 5@0]]] withDrGeoActions

**echelle:** //unEntier
//unEntier//, échelle de la figure. Une unité représente approximativement 1 pixel.

Modifie l’échelle de la figure.

[[[| fig | 
fig _ DrGeoFigure nouveau.
fig afficherAxes.
fig centrerVueEn: 5@0.
fig échelle: 5]]] withDrGeoActions

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Introduction
^(EruditeBookSection basicNew title: 'Introduction'; document: ((EruditeDocument contents: 'Les Figures Smalltalk de Dr.Geo – ou plus simplement figure dans la suite de ce texte – sont des figures écrites en langage Smalltalk. Il ne s’agit donc plus de construire une figure à l’aide de l’interface graphique de Dr.Geo mais plutôt de décrire une figure avec le langage Smalltalk et des instructions dédiées. Cette documentation décrit ces instructions.

Dans cette fenêtre, le code source de la figure est écrit dans le panneau à gauche, la figure obtenue est dans le panneau à droite. 

!!!!!! Description de l''éditeur
Les icônes de la barre ont les fonctions suivantes :

[[[DrGIcons iconUI: #open]]] embedIt
//Reprendre le travail sur une figure que tu as sauvegardée précédemment.//

[[[DrGIcons iconUI: #keep]]] embedIt
//Sauver le code source de la figure en cours d''édition.//

[[[DrGIcons iconUI: #play]]] embedIt
//Exécuter le code source de la figure, la figure interactive résultante est affichée à droite.//

[[[DrGIcons iconUI: #pause]]] embedIt
//Lors de la construction d''une figure, tu peux mettre temporairement sur pause.//

[[[DrGIcons iconUI: #debug]]] embedIt
//Exécuter pas à pas la construction de la figure.//

[[[DrGIcons iconUI: #stop]]] embedIt
//Stopper la construction d''une figure. Utile lorsqu''une figure prend beaucoup de temps à s''exécuter entièrement.//') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Introduction_Exemples;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Introduction_Exemples
^(EruditeBookSection basicNew title: 'Exemples'; document: ((EruditeDocument contents: '!!!!!!Examples simples
//La figure la plus simple, une figure vide.//
[[[DrGeoFigure nouveau]]] withDrGeoActions

//Une figure avec un point.//
[[[DrGeoFigure nouveau
	point: 1.2 @ -2]]] withDrGeoActions

//Variables pour manipuler les objets.//
[[[| figure a |
figure _ DrGeoFigure nouveau.
a _ figure point: 1.2 @ -2.
a nommer: ''A'']]] withDrGeoActions

Cette description définit une figure avec un point libre //A// de coordonnées (1,2 ; -2). 

**Quelques explications sur ce code :**
Pour écrire le symbole "flèche" d''affectation **←**, taper le caractère souligné **_**. Il est possible d''écrire **:=** à la place.

Deux variables temporaires **figure** et **a** sont déclarées entre deux barres verticales **| |**.

Les objets sont ajoutés un à un à la **figure** en lui envoyant des messages. Ici le message à mot clé **point:**, avec comme argument deux coordonnées, crée un point libre.

Le résultat est un point qu''il est possible de modifier par l’envoi de messages, ici **nommer:** pour le renommer ’A’. D''autres message permettent de modifier l''aspect du point.

!!!!!!Exemples plus complexes
//Figure et hasard.//
[[[| c triangle hasard m n p |
triangle _ [:p1 :p2 :p3 |
	c segmentDe: p1 à: p2.
	c segmentDe: p2 à: p3.
	c segmentDe: p3 à: p1].
hasard _ [5 - 10 auHasard].
c _ DrGeoFigure nouveau.
m _ c point: hasard valeur @ 0.
n _ c point: 5 @ 0.
p _ c point: hasard valeur @ 3.
triangle valeur: m valeur: n valeur: p]]] withDrGeoActions

**Cet exemple montre trois choses importantes :**
1. L’introduction d’une construction de plus haut niveau, non prévue au départ par Dr.Geo. Ici nous avons défini le bloc de code **triangle** qui, à partir de trois points, construit le triangle passant par ces trois points. 

2. La définition du bloc de code associé **hasard** qui retourne un nombre entier compris entre -5 et 5. A l''aide de ce bloc, nous plaçons au hasard certains points de notre figure.

3. L’affectation (**_**) du résultat d’une construction à une variable n’est pas obligatoire, elle permet de réutiliser ultérieurement l’objet créé. Par exemple dans le bloc de code **triangle**, nous ne gardons pas de référence des segments créés, en revanche lorsque nous définissons nos trois points nous avons besoin de garder une référence dans des variables temporaires. Ainsi, lors de l’utilisation du bloc de code **triangle**, nous passons en paramètre les variables **m**, **n** et **p**.

!!!!!!Exemple avec style
[[[| c a b d |
c _ DrGeoFigure nouveau.
a _ c point: 1@0.
b _ c point: 5@0.
d _ c line: a to: b.
a couleur: Color yellow;
	rond;
 	large.
b cacher.
d tiret]]] withDrGeoActions

Deux points et une droite sont créés. Ensuite des messages sont envoyés pour modifier l’aspect des objets, voire pour en cacher.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesCourbes
^(EruditeBookSection basicNew title: 'Lignes courbes'; document: ((EruditeDocument contents: 'La famille des lignes courbres regroupe les cercle, arc de cercle, polygone et lieu de points.

Déplie la section **▶ Lignes courbes** pour explorer ces types de ligne !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_LignesCourbes_Cercle;
        add: self section_LignesCourbes_ArcDeCercle;
        add: self section_LignesCourbes_Polygone;
        add: self section_LignesCourbes_LieuDePoint;
        add: self section_LignesCourbes_CourbeFonction;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesCourbes_ArcDeCercle
^(EruditeBookSection basicNew title: 'Arc de cercle'; document: ((EruditeDocument contents: '!!!!!!Arc passant par trois points
//<arc>// **arcDe:à:passantPar:** //p1 p2 p3//
//p1//, point ou coordonnées, 1ère extrémité de l’arc
//p2//, point ou coordonnées, 2ème extrémité de l’arc
//p3//, point ou coordonnées de l’arc
⇒ arc de cercle défini par ses extrémités et un point

[[[| fig a b |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
b _ fig point: 0@5.
fig arcDe: a à: -1@-2 passantPar: b]]] withDrGeoActions

!!!!!!Arc selon centre et deux points
//<arc>// **arcCentre:de:à:** //O A B//
//O//, point ou coordonnées, centre de l’arc
//A//, point ou coordonnées, origine de l’arc
//B//, point ou coordonnées, tel que l’angle de l’arc est AOB
⇒ arc de cercle défini par son centre et l’angle AOB

[[[| fig a b |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
b _ fig point: 0@5.
fig arcCentre: a de: b à: -1 @ -2]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesCourbes_Cercle
^(EruditeBookSection basicNew title: 'Cercle'; document: ((EruditeDocument contents: '!!!!!!Cercle selon centre et point
//<cercle>// **cercleCentre:passantPar:** //c p//
//c//, point ou coordonnées centre du cercle
//p//, point ou coordonnées sur le cercle
⇒ cercle défini par son centre et un point

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
fig cercleCentre: a passantPar: 10@4]]] withDrGeoActions

!!!!!!Cercle selon centre et rayon
//<cercle>// **cercleCentre:rayon:** //c r//
//c//, point ou coordonnées, centre du cercle
//r//, objet ou valeur numérique, rayon du cercle
⇒ cercle défini par son centre et son rayon

[[[| fig a r |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
r _ fig valeurLibre: 4.
fig cercleCentre: a rayon: r.
fig cercleCentre: 4@4 rayon: 5]]] withDrGeoActions

!!!!!!Cercle selon centre et segment
//<cercle>// **cercleCentre:segment:** //c s//
//c//, point ou coordonnées, centre du cercle
//r//, segment rayon du cercle
⇒ cercle défini par son centre et de rayon la longueur du segment

[[[| fig a s |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
s _ fig segmentDe: 0@0 à: 3@0.
fig cercleCentre: a segment: s]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesCourbes_CourbeFonction
^(EruditeBookSection basicNew title: 'Courbe fonction'; document: ((EruditeDocument contents: '!!!!!!Courbe d''une fonction
//<lieu>// **courbeDe:de:à:** //bloc x0 x1//
//bloc//, un bloc de code à un argument décrivant une fonction
//x0//, nombre, abscisse inférieure de la courbe
//x1//, nombre, abscisse supérieure de la courbe
⇒ lieu de point, courbe représentative de la fonction décrite par le bloc de code dans l''intervalle [x0 ; x1].

[[[| fig |
fig _ DrGeoFigure nouveau.
fig courbeDe: [:x | x * x] de: -3 à: 3]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesCourbes_LieuDePoint
^(EruditeBookSection basicNew title: 'Lieu de point'; document: ((EruditeDocument contents: '!!!!!!Lieu d''un point
//<lieu>// **lieuDe:lorsqueBouge:** //c m//
//m//, point mobile sur une ligne
//c//, point fixe dépendant du point //m// 

[[[| fig m c |
fig _ DrGeoFigure nouveau.
m _ fig 
	pointSurLigne: (fig cercleCentre: 0@0 rayon: 3)
	à: 0.
c _ fig milieuDe: m et: 5@0.
fig lieuDe: c lorsqueBouge: m]]] withDrGeoActions 


') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesCourbes_Polygone
^(EruditeBookSection basicNew title: 'Polygone'; document: ((EruditeDocument contents: '!!!!!!Polygone
//<polygone>// **polygone:** //collection//
//collection//, liste de points ou de coordonnées, sommets du polygone
⇒ polygone défini par ses sommets

[[[| fig b |
fig _ DrGeoFigure nouveau.
b _ fig point: 1@3.
fig polygone: {1@2. b. 0@0. 4@1}]]] withDrGeoActions


!!!!!!Polygone régulier
//<polygone>// **polygoneRégulierCentre:sommet:côtés:** //c s n//
//c//, point ou coordonnées, centre du polygone
//s//, point ou coordonnées, sommet du polygone
//n//,  objet ou valeur numérique, nombre de sommets du polygone
⇒ polygone régulier défini par son centre, un de ses sommets et le nombre de côtés

[[[| fig b |
fig _ DrGeoFigure nouveau.
b _ fig point: 1@3.
fig polygoneRégulierCentre: b sommet: 1@1 côtés: 7]]] withDrGeoActions

Le nombre de sommets est la valeur entière de la longueur du segment :
[[[| fig b s v|
fig _ DrGeoFigure nouveau afficherAxes.
b _ fig point: 1@3.
s _ fig segmentDe: b à: 0@0.
v _ fig longueurDe: s.
fig polygoneRégulierCentre: 0@0 sommet: b côtés: v]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites
^(EruditeBookSection basicNew title: 'Lignes droites'; document: ((EruditeDocument contents: 'La famille des lignes droites regroupe les droites passant par deux points, parallèle, perpendiculaire,... ainsi que les demi-droites et les segments.

Déplie la section **▶ Lignes droites** pour explorer ces types de ligne !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_LignesDroites_Droite;
        add: self section_LignesDroites_Parallèle;
        add: self section_LignesDroites_Perpendiculaire;
        add: self section_LignesDroites_Médiatrice;
        add: self section_LignesDroites_Bissectrice;
        add: self section_LignesDroites_Demidroite;
        add: self section_LignesDroites_Segment;
        add: self section_LignesDroites_Explications;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites_Bissectrice
^(EruditeBookSection basicNew title: 'Bissectrice'; document: ((EruditeDocument contents: '!!!!!!Bissectrice d''un angle
//<droite>// **bissectriceDe:** //a//
//a//, angle géométrique défini par trois points

[[[| fig angle |
fig _ DrGeoFigure nouveau.
angle _ fig angleSommet: 0@0 de: 1@0 à: 0@1.
fig bissectriceDe: angle]]] withDrGeoActions

!!!!!!Bissectrice trois points
//<droite>// **bissectriceSommet:côté1:côté2** //a b c//
//a b c//, points définissant l''angle géométrique bac
⇒ bissectrice de l’angle bac

[[[DrGeoFigure nouveau
	bissectriceSommet: 0@0 côté1: 1@0 côté2: 0@-1]]] withDrGeoActions

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites_Demidroite
^(EruditeBookSection basicNew title: 'Demi-droite'; document: ((EruditeDocument contents: '!!!!!!Demi-droite
//<demi-droite>// **demiDroiteOrigine:passantPar:** //o p//

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
fig demiDroiteOrigine: 0@0 passantPar: a]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites_Droite
^(EruditeBookSection basicNew title: 'Droite'; document: ((EruditeDocument contents: '!!!!!!Passant par deux points
//<droite>// **droitePassantPar:et:** //p1 p2//

[[[DrGeoFigure nouveau
	droitePassantPar: 0@0 et: 1@2]]] withDrGeoActions

Avec un point référencé dans une variable :
[[[| figure point |
figure _ DrGeoFigure nouveau.
point _ figure point: 1@2.
figure droitePassantPar: 0@0 et: point]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites_Médiatrice
^(EruditeBookSection basicNew title: 'Médiatrice'; document: ((EruditeDocument contents: '!!!!!!Médiatrice d''un segment
//<droite>// **médiatriceDe:** //s//
//s//, segment dont on souhaite la médiatrice

[[[| fig s |
fig _ DrGeoFigure nouveau.
s _ fig segmentDe: 0@0 à: 2@1.
fig médiatriceDe: s]]] withDrGeoActions

!!!!!!Médiatrice d''un segment défini par deux points
//<droite>// **médiatriceDe:à:** //a b//
//a, b//, deux points extrémités du segment dont on souhaite la médiatrice

[[[DrGeoFigure nouveau
	médiatriceDe: 0@0 à: 4@4]]] withDrGeoActions

Un exemple avec plusieurs objets :
[[[| fig d ptA  |
fig _ DrGeoFigure nouveau.
d _ fig droitePassantPar: 0@0 et: 10@1.
ptA _ fig pointSurLigne: d à: 0.1.
fig médiatriceDe: ptA à: (fig point: 0@5)]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_LignesDroites_Parallel
	^ EruditeBookSection basicNew
		title: 'Parallel';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites_Parallèle
^(EruditeBookSection basicNew title: 'Parallèle'; document: ((EruditeDocument contents: '!!!!!!Droite parallèle
//<droite>// **parallèleA:passantPar:** //d p//
//d//, direction (droite, segment, vecteur,...)
//p//, point ou couple de coordonnées

[[[| fig d |
fig _ DrGeoFigure nouveau.
d _ fig droitePassantPar: 0@0 et: 5@1.
fig parallèleA: d 	passantPar: 0@3]]] withDrGeoActions

Le même exemple avec une seule variable :
[[[| fig |
fig _ DrGeoFigure nouveau.
fig
	parallèleA: (fig droitePassantPar: 0@0 et: 5@1)
	passantPar: 0@3]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites_Perpendiculaire
^(EruditeBookSection basicNew title: 'Perpendiculaire'; document: ((EruditeDocument contents: '!!!!!!Droite perpendiculaire
//<droite>// **perpendiculaireA:passantPar:** //d p//
//d//, direction (droite, segment, vecteur,...)
//p//, point ou couple de coordonnées

[[[| fig s p |
fig _ DrGeoFigure nouveau.
p _ fig point: 2@3.
s _ fig segmentDe: 0@0 à: 5@1.
fig perpendiculaireA: s passantPar: p]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_LignesDroites_Perpendicular
	^ EruditeBookSection basicNew
		title: 'Perpendicular';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_LignesDroites_Ray
	^ EruditeBookSection basicNew
		title: 'Ray';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_LignesDroites_Segment
^(EruditeBookSection basicNew title: 'Segment'; document: ((EruditeDocument contents: '!!!!!!Segment
//<segment>// **segmentDe:à:** //p1 p2//

[[[DrGeoFigure nouveau
	segmentDe: 0@0 à: 1@2]]] withDrGeoActions

Avec un point référencé par une variable :
[[[| figure point |
figure _ DrGeoFigure nouveau.
point _ figure point: 1@2.
figure segmentDe: 0@0 à: point]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_LignesDroites_StraightLine
	^ EruditeBookSection basicNew
		title: 'Straight line';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Lines
	^ EruditeBookSection basicNew
		title: 'Lines';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections:
			(OrderedCollection new
				add: self section_Lines_Segment;
				add: self section_Lines_StraightLine;
				add: self section_Lines_Ray;
				add: self section_Lines_Parallel;
				add: self section_Lines_Perpendicular;
				yourself);
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Lines_Parallel
	^ EruditeBookSection basicNew
		title: 'Parallel';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Lines_Perpendicular
	^ EruditeBookSection basicNew
		title: 'Perpendicular';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Lines_Ray
	^ EruditeBookSection basicNew
		title: 'Ray';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Lines_Segment
	^ EruditeBookSection basicNew
		title: 'Segment';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Lines_StraightLine
	^ EruditeBookSection basicNew
		title: 'Straight line';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_MesuresEtValeurs
	^ EruditeBookSection basicNew
		title: 'Mesures et valeurs';
		document:
			((EruditeDocument contents: 'Cette section regroupe les commandes pour obtenir des valeurs numériques : angles, coordonnées, pente, distance et valeurs libres.

Déplie la section **▶ Mesures et valeurs** pour explorer ces types de valeurs numériques !!')
				data: Dictionary new;
				yourself);
		subsections:
			(OrderedCollection new
				add: self section_MesuresEtValeurs_Angle;
				add: self section_MesuresEtValeurs_Coordonnée;
				add: self section_MesuresEtValeurs_Mesure;
				add: self section_MesuresEtValeurs_ValeurRéglette;
				yourself);
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_MesuresEtValeurs_Angle
	^ EruditeBookSection basicNew
		title: 'Angle';
		document:
			((EruditeDocument contents: '!!!!!!Angle géométrique
//<angle>// **angleGeometriqueCentre:de:a** //a b c//
//a//, point, sommet de l’angle
//b//, point sur le 1er côté de l''angle
//c//, point sur le 2ème coté de l''angle
⇒ angle géométrique bac dont la mesure appartient à [0 ; 180[

[[[| fig |
fig _ DrGeoFigure nouveau.
fig 
	segmentDe: 0@0 a: 3@0;
	segmentDe: 0@0 a: 0@3;
	angleGeometriqueCentre: 0@0 de: 3@0 a: 0@3.
(fig point: 0@3) montrer.
(fig point: 3@0) montrer]]] withDrGeoActions

!!!!!!Angle orienté
//<angle>// **angleCentre:de:a** //a b c//
//a//, point, sommet de l’angle
//b//, point sur le 1er côté de l''angle
//c//, point sur le 2ème coté de l''angle
⇒ angle orienté bac dont la mesure appartient à [0 ; 360[

[[[| fig |
fig _ DrGeoFigure nouveau.
fig 
	segmentDe: 0@0 a: 3@0;
	segmentDe: 0@0 a: 0@3;
	angleCentre: 0@0 de: 3@0 a: 0@3.
(fig point: 0@3) montrer.
(fig point: 3@0) montrer]]] withDrGeoActions

!!!!!!Angle vecteurs
//<angle>// **angleVecteur:et:** //v1 v2//
//v1, v2//, vecteurs
⇒ angle orienté, formé par les deux vecteurs, dont la mesure appartient à [-PI ; PI[

[[[| fig v1 v2 a |
fig _ DrGeoFigure nouveau.
v1 _ fig vecteurOrigine: 0@0 extremite: 3@1.
v2 _ fig vecteurOrigine: 0@0 extremite: -1@-3.
a _ fig angleVecteur: v1 et: v2]]] withDrGeoActions
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_MesuresEtValeurs_Coordonnée
	^ EruditeBookSection basicNew
		title: 'Coordonnée';
		document:
			((EruditeDocument contents: '!!!!!!Abscisse
//<valeur>// **abscisseDe:** //item//
//item//, un point ou un vecteur

[[[| fig m |
fig _ DrGeoFigure nouveau.
m _ fig milieuDe: 10@5 et: 7@8.
fig abscisseDe: m]]] withDrGeoActions

!!!!!!Ordonnée
//<valeur>// **ordonneeDe:** //item//
//item//, un point ou un vecteur

[[[| fig m |
fig _ DrGeoFigure nouveau.
m _ fig milieuDe: 10@5 et: 7@8.
fig ordonneeDe: m]]] withDrGeoActions

!!!!!!Coordonnées (fixe)
//<point>// **coordonnees**
⇒ coordonnées (statiques) d’un point

[[[| fig seg c p |
fig _ DrGeoFigure nouveau.
seg _ fig segmentDe: 0@0 a: 5@0.
p _ fig pointSurLigne: seg a: 0.5.
c _ p coordonnees.
c x]]] withDrGeoActions')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_MesuresEtValeurs_Mesure
	^ EruditeBookSection basicNew
		title: 'Mesure';
		document:
			((EruditeDocument contents: '!!!!!!Longueur
//<valeur>// **longueurDe:** //objet//
//objet//, segment, cercle, arc ou vecteur
⇒ nombre, longueur de l’item

[[[| fig point segment |
fig _ DrGeoFigure nouveau.
point _ fig point: 1@2.
segment _ fig segmentDe: 0@0 a: point.
fig longueurDe: segment]]] withDrGeoActions

!!!!!!Distance
//<valeur>// **distanceDe:a:** //objet p//
//objet//, droite ou point
//p//, point
⇒ nombre, distance entre deux points ou un point et une droite

[[[| fig point droite |
fig _ DrGeoFigure nouveau.
point _ fig point: -5@5.
droite _ fig droitePassantPar: 0@0 et: 1@2.
fig distanceDe: droite a: point.
fig distanceDe: 0@0 a: 12@2]]] withDrGeoActions

!!!!!!Pente
//<valeur>// **penteDe:** //d//
//d//, droite
⇒ nombre, pente de la droite

[[[| fig p d |
fig _ DrGeoFigure nouveau.
d _ fig droitePassantPar: 0@0 et: 3@8.
p _ fig penteDe: d]]] withDrGeoActions')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_MesuresEtValeurs_Valeur
	^ EruditeBookSection basicNew
		title: 'Valeur';
		document:
			((EruditeDocument contents: '!!!!!!Valeur libre
//<valeur>// **valeurLibre:** //v//
//v//, la valeur initiale du nombre
⇒ nombre à la valeur libre

[[[DrGeoFigure nouveau
	valeurLibre: 1/3)]]] withDrGeoActions

Valeur approchée de π :
[[[DrGeoFigure nouveau
	valeurLibre: (-1 arcCos)]]] withDrGeoActions

!!!!!!Editer une valeur libre
**valeur:** //v//
//v//, nouvelle valeur d''un nombre

[[[| fig n |
fig _ DrGeoFigure nouveau.
" π ≈ 3 :"
n _ fig 	valeurLibre: 3. 
" Valeur approchée de π plus précise :"
n valeur: Float pi]]] withDrGeoActions

!!!!!!Réglette
Une réglette est une valeur libre dans un intervalle numérique. Dans la figure, elle est représentée sous la forme d''un segment et d''un point glissant sur ce dernier. La position du point indique la valeur numérique de la réglette.

Son utilisation permet de construire des figures dynamiques aux paramètres numériques variables.
Une réglette est de valeur entière ou décimale.

!!!!!!!!Valeur entière

!!!!!!!!Valeur décimale')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_MesuresEtValeurs_ValeurRéglette
	^ EruditeBookSection basicNew
		title: 'Valeur & Réglette';
		document:
			((EruditeDocument contents: '!!!!!!Valeur libre
//<valeur>// **valeurLibre:** //v//
//v//, la valeur initiale du nombre
⇒ nombre à la valeur libre

[[[DrGeoFigure nouveau
	valeurLibre: 1/3)]]] withDrGeoActions

Valeur approchée de π :
[[[DrGeoFigure nouveau
	valeurLibre: (-1 arcCos)]]] withDrGeoActions

!!!!!!Editer une valeur libre
**valeur:** //v//
//v//, nouvelle valeur d''un nombre

[[[| fig n |
fig _ DrGeoFigure nouveau.
" π ≈ 3 :"
n _ fig 	valeurLibre: 3. 
" Valeur approchée de π plus précise :"
n valeur: Float pi]]] withDrGeoActions

!!!!!!Réglette
Une réglette est une valeur libre dans un intervalle numérique. Dans la figure, elle est représentée sous la forme d''un segment et d''un point glissant sur ce dernier. La position du point indique la valeur numérique de la réglette.

Son utilisation permet de construire des figures dynamiques aux paramètres numériques variables.
Une réglette est de valeur entière ou décimale.

!!!!!!!!Valeur entière
//<bloc>// **entier:a:min:max** //v1 p v2 v3//
//<bloc>// **eniter:a:min:max:nom:** //v1 p v2 v3 s//
//<bloc>// **entier:a:min:max:nom:affciherValeur:** //v1 p v2 v3 s b//
//v1//, valeur entière initiale
//p//, position du bord gauche de la réglette
//v2//, valeur minimum
//v3//, valeur maximum
//s//, nom de la valeur
//b//, booléen (true|false), affiche ou non la valeur numérique avec le nom sous la forme ’a = 1.2’
⇒ un bloc de code retournant la valeur courante, décimale ou entière, de la réglette

[[[| fig r | "XXX TO MAKE WORKING"
fig _ DrGeoFigure nouveau.
fig afficherAxes.
r _ fig entier: 1 a: 0@-5 min: 1 max: 5.
fig cercleCentre: 0@0 rayon: r]]] withDrGeoActions

!!!!!!!!Valeur décimale
Variante à valeur décimale.
//<bloc>// **decimal:a:min:max** //v1 p v2 v3//
//<bloc>// **decimal:a:min:max:nom:** //v1 p v2 v3 s//
//<bloc>// **decimal:a:min:max:nom:affciherValeur:** //v1')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_NumériqueTexte
^(EruditeBookSection basicNew title: 'Numérique & Texte'; document: ((EruditeDocument contents: 'Cette section regroupe les commandes pour obtenir des valeurs numériques et texte : angles, coordonnées, pente, distance, valeurs libres, etc.

Déplie la section **▶ Numérique & Texte** pour explorer ces types de valeurs numériques !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_NumériqueTexte_Angle;
        add: self section_NumériqueTexte_Coordonnée;
        add: self section_NumériqueTexte_Mesure;
        add: self section_NumériqueTexte_Equation;
        add: self section_NumériqueTexte_ValeurRéglette;
        add: self section_NumériqueTexte_Texte;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_NumériqueTexte_Angle
^(EruditeBookSection basicNew title: 'Angle'; document: ((EruditeDocument contents: '!!!!!!Angle géométrique
//<angle>// **angleGéométriqueSommet:de:à** //a b c//
//a//, point, sommet de l’angle
//b//, point sur le 1er côté de l''angle
//c//, point sur le 2ème coté de l''angle
⇒ angle géométrique bac dont la mesure appartient à [0 ; 180[

[[[| fig |
fig _ DrGeoFigure nouveau.
fig 
	segmentDe: 0@0 à: 3@0;
	segmentDe: 0@0 à: 0@3;
	angleGéométriqueSommet: 0@0 de: 3@0 à: 0@3.
(fig point: 0@3) montrer.
(fig point: 3@0) montrer]]] withDrGeoActions

!!!!!!Angle orienté
//<angle>// **angleSommet:de:à** //a b c//
//a//, point, sommet de l’angle
//b//, point sur le 1er côté de l''angle
//c//, point sur le 2ème coté de l''angle
⇒ angle orienté bac dont la mesure appartient à [0 ; 360[

[[[| fig |
fig _ DrGeoFigure nouveau.
fig 
	segmentDe: 0@0 à: 3@0;
	segmentDe: 0@0 à: 0@3;
	angleSommet: 0@0 de: 3@0 à: 0@3.
(fig point: 0@3) montrer.
(fig point: 3@0) montrer]]] withDrGeoActions

!!!!!!Angle vecteurs
//<angle>// **angleVecteur:et:** //v1 v2//
//v1, v2//, vecteurs
⇒ angle orienté, formé par les deux vecteurs, dont la mesure appartient à [-PI ; PI[

[[[| fig v1 v2 a |
fig _ DrGeoFigure nouveau.
v1 _ fig vecteurOrigine: 0@0 extrémité: 3@1.
v2 _ fig vecteurOrigine: 0@0 extrémité: -1@-3.
a _ fig angleVecteur: v1 et: v2]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_NumériqueTexte_Coordonnée
^(EruditeBookSection basicNew title: 'Coordonnée'; document: ((EruditeDocument contents: '!!!!!!Abscisse
//<valeur>// **abscisseDe:** //item//
//item//, un point ou un vecteur

[[[| fig m |
fig _ DrGeoFigure nouveau.
m _ fig milieuDe: 10@5 et: 7@8.
fig abscisseDe: m]]] withDrGeoActions

!!!!!!Ordonnée
//<valeur>// **ordonnéeDe:** //item//
//item//, un point ou un vecteur

[[[| fig m |
fig _ DrGeoFigure nouveau.
m _ fig milieuDe: 10@5 et: 7@8.
fig ordonnéeDe: m]]] withDrGeoActions

!!!!!!Coordonnées (fixe)
//<point>// **coordonnées**
⇒ coordonnées (statiques) d’un point

[[[| fig seg c p |
fig _ DrGeoFigure nouveau.
seg _ fig segmentDe: 0@0 à: 5@0.
p _ fig pointSurLigne: seg à: 0.5.
c _ p coordonnées.
c x]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_NumériqueTexte_Equation
^(EruditeBookSection basicNew title: 'Equation'; document: ((EruditeDocument contents: '!!!!!!Equation
//<equation>// **équationDe:** //item//
//item//, droite ou cercle
⇒ équation de la droite ou du cercle

[[[| fig e d |
fig _ DrGeoFigure nouveau.
fig afficherAxes.
d _ fig droitePassantPar: 0@0 et: 15@13.
e _ fig équationDe: e]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_NumériqueTexte_Mesure
^(EruditeBookSection basicNew title: 'Mesure'; document: ((EruditeDocument contents: '!!!!!!Longueur
//<valeur>// **longueurDe:** //objet//
//objet//, segment, cercle, arc ou vecteur
⇒ nombre, longueur de l’item

[[[| fig point segment |
fig _ DrGeoFigure nouveau.
point _ fig point: 1@2.
segment _ fig segmentDe: 0@0 à: point.
fig longueurDe: segment]]] withDrGeoActions

!!!!!!Distance
//<valeur>// **distanceDe:à:** //objet p//
//objet//, droite ou point
//p//, point
⇒ nombre, distance entre deux points ou un point et une droite

[[[| fig point droite |
fig _ DrGeoFigure nouveau.
point _ fig point: -5@5.
droite _ fig droitePassantPar: 0@0 et: 1@2.
fig distanceDe: droite à: point.
fig distanceDe: 0@0 à: 12@2]]] withDrGeoActions

!!!!!!Pente
//<valeur>// **penteDe:** //d//
//d//, droite
⇒ nombre, pente de la droite

[[[| fig p d |
fig _ DrGeoFigure nouveau.
d _ fig droitePassantPar: 0@0 et: 3@8.
p _ fig penteDe: d]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_NumériqueTexte_Texte
^(EruditeBookSection basicNew title: 'Texte'; document: ((EruditeDocument contents: '!!!!!!Texte
//<texte>// **texte:** //string//
//string//, une chaîne de caractères
⇒ texte positionné arbitrairement

[[[| fig |
fig _ DrGeoFigure nouveau.
fig texte: ''Hello'']]] withDrGeoActions

//<texte>// **texte:à** //string point//
//string//, une chaîne de caractères
//point//, un couple de coordonnées
⇒ texte positionné à un emplacement souhaité

[[[| fig |
fig _ DrGeoFigure nouveau.
fig texte: ''Hello,
  je suis heureux !!'' à: 0@0]]] withDrGeoActions

!!!!!!!!Modifier un texte
**texte:** //string//
//string//, une chaîne de caractères
⇒ modifie le texte d’un objet texte

[[[| fig monTexte |
fig _ DrGeoFigure nouveau.
monTexte _ fig texte: ''Hello''.
monTexte texte: ''Au revoir'']]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_NumériqueTexte_ValeurRéglette
^(EruditeBookSection basicNew title: 'Valeur & Réglette'; document: ((EruditeDocument contents: '!!!!!!Valeur libre
//<valeur>// **valeurLibre:** //v//
//v//, la valeur initiale du nombre
⇒ nombre à la valeur libre

[[[DrGeoFigure nouveau
	valeurLibre: 1/3)]]] withDrGeoActions

Valeur approchée de π :
[[[DrGeoFigure nouveau
	valeurLibre: (-1 arcCos)]]] withDrGeoActions

!!!!!!Editer une valeur libre
**valeur:** //v//
//v//, nouvelle valeur d''un nombre

[[[| fig n |
fig _ DrGeoFigure nouveau.
" π ≈ 3 :"
n _ fig 	valeurLibre: 3. 
" Valeur approchée de π plus précise :"
n valeur: Float pi]]] withDrGeoActions

!!!!!!Réglette
Une réglette est une valeur libre dans un intervalle numérique. Dans la figure, elle est représentée sous la forme d''un segment et d''un point glissant sur ce dernier. La position du point indique la valeur numérique de la réglette.

Son utilisation permet de construire des figures dynamiques aux paramètres numériques variables.
Une réglette est de valeur entière ou décimale.

!!!!!!!!Valeur entière
//<bloc>// **entier:à:min:max** //v1 p v2 v3//
//<bloc>// **eniter:à:min:max:nom:** //v1 p v2 v3 s//
//<bloc>// **entier:à:min:max:nom:affciherValeur:** //v1 p v2 v3 s b//
//v1//, valeur entière initiale
//p//, position du bord gauche de la réglette
//v2//, valeur minimum
//v3//, valeur maximum
//s//, nom de la valeur
//b//, booléen (true|false), affiche ou non la valeur numérique avec le nom sous la forme ’a = 1.2’
⇒ un bloc de code retournant la valeur courante, décimale ou entière, de la réglette

[[[| fig r | "XXX TO MAKE WORKING"
fig _ DrGeoFigure nouveau.
fig afficherAxes.
r _ fig entier: 1 à: 0@-5 min: 1 max: 5.
fig cercleCentre: 0@0 rayon: r]]] withDrGeoActions

!!!!!!!!Valeur décimale
Variante à valeur décimale.
//<bloc>// **décimal:à:min:max** //v1 p v2 v3//
//<bloc>// **décimal:à:min:max:nom:** //v1 p v2 v3 s//
//<bloc>// **décimal:à:min:max:nom:affciherValeur:** //v1') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Point
^(EruditeBookSection basicNew title: 'Point'; document: ((EruditeDocument contents: 'Tu peux créer toutes sortes de point : point libre que tu peux ensuite déplacer à la souris, point mobile sur une ligne, point milieu ou d''intersection entre deux lignes. Il est même possible de créer un point dont la position est déterminée par un bloc de code !!

Déplie la section **▶ Point** pour explorer ces types de point !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Point_Libre;
        add: self section_Point_Fixe;
        add: self section_Point_SurLigne;
        add: self section_Point_Milieu;
        add: self section_Point_Intersection;
        add: self section_Point_BlocDeCode;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Point_BlocDeCode
^(EruditeBookSection basicNew title: 'Bloc de code'; document: ((EruditeDocument contents: '!!!!!!Bloc de code
Fonctionalité avancée où la position du point est définie par un bloc de code.

//<point>// **point:parent:** //bloc item//
⇒ point dont les coordonnées sont calculées avec le //bloc// de code ayant comme argument //item//.

[[[| figure s mobile c bloc |
figure _ DrGeoFigure nouveau.
s _ figure segment: -5@0 to: 5@0.
mobile _ figure pointSurLigne: s à: 0.1.
bloc _ [:mathItem | |x|
   x _ mathItem point x.
   x @ (x * x * x / 25 - x)].
c _ figure point: bloc parent: mobile.
figure lieuDe: c lorsqueBouge: mobile]]] withDrGeoActions

//<point>// **point:parents:** //bloc list//
⇒ point dont les coordonnées sont calculées avec le //bloc// de code ayant comme argument //liste//.

[[[| figure d m p |
figure _ DrGeoFigure nouveau.
d _ figure droitePassantPar: -2 @ 1 et: 3 @ 3.
d couleur: Color blue.
m _ figure point: 1 @ -1.
p _ figure 
   point: [:parents | 
	parents first closestPointTo: parents second point]
   parents: {d . m}]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Point_Fixe
^(EruditeBookSection basicNew title: 'Fixe'; document: ((EruditeDocument contents: '!!!!!!Point valeur
//<point>// **pointX:Y:** //v1 v2//
⇒ point dont les coordonnées sont deux valeurs définies dans la figure

[[[| fig a cercle segment |
fig _ DrGeoFigure nouveau afficherAxes.
a  _ fig point: 1@0.
cercle _ fig cercleCentre: 0@0 passantPar: a.
segment _ fig segmentDe: 1@1 à: a.
fig 
	pointX: (fig longueurDe: cercle) 
	Y: (fig longueurDe: segment)]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Point_Intersection
^(EruditeBookSection basicNew title: 'Intersection'; document: ((EruditeDocument contents: '!!!!!!Intersection entre deux lignes
//<point>// **intersectionDe:et:** //l1 l2//
⇒ point d’intersection des deux lignes

[[[| f droite segment |
f _ DrGeoFigure nouveau.
droite _ f droitePassantPar: 0@0 et: 5@1.
segment _ f segmentDe: 2@1 à: -5@-4.
f intersectionDe: droite et: segment]]] withDrGeoActions

!!!!!!Intersection alternative
//<point>// **autreIntersectionDe:et:** //l1 l2//
⇒ l’autre point d’intersection des deux lignes, lorsqu’il existe.

[[[| f droite cercle |
f _ DrGeoFigure nouveau.
droite _ f droitePassantPar: 0@0 et: 5@1.
cercle _ f cercleCentre: 0@0 rayon: 5.
f intersectionDe: droite et: cercle.
f autreIntersectionDe: droite et: cercle]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Point_Libre
^(EruditeBookSection basicNew title: 'Libre'; document: ((EruditeDocument contents: '!!!!!!Point libre
//<point>// **point:** //pointOuBloc//
⇒ point mobile dans le plan

[[[DrGeoFigure nouveau
	point: 5@2;
	point: [ 5 auHasard @ 5 auHasard ] ]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Point_Milieu
^(EruditeBookSection basicNew title: 'Milieu'; document: ((EruditeDocument contents: '!!!!!!Milieu de deux points
//<point>// **milieuDe:et:** //p1 p2//
⇒ milieu de deux points de la figure

[[[| f a i |
f _ DrGeoFigure nouveau.
a _ f point: 1@1.
i _ f milieuDe: a et: 4@4]]] withDrGeoActions

!!!!!!Milieu d''un segment
//<point>// **milieuDe:** //s//
⇒ milieu d''un segment de la figure

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 à: 5@3.
f milieuDe: s]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Point_SurLigne
^(EruditeBookSection basicNew title: 'Sur ligne'; document: ((EruditeDocument contents: '!!!!!!Point sur ligne
//<point>// **pointSurLigne:à:** //curve a//
//curve//, ligne de type droite, segment, cercle, etc
//a//, abscisse curviligne dans l''intervalle [0 ; 1]
⇒ point mobile sur une ligne

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 à: 5@3.
f pointSurLigne: s à: 0.5]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Point_fixe
	^ EruditeBookSection basicNew
		title: 'fixe';
		document:
			((EruditeDocument contents: '!!!!!!Point fixe
//<point>// **pointX:Y:** //v1 v2//

[[[DrGeoFigure nouveau
	pointX: 2 Y: 5]]] withDrGeoActions
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Point_intersection
	^ EruditeBookSection basicNew
		title: 'intersection';
		document:
			((EruditeDocument contents: '!!!!!!Point d''Intersection entre deux lignes
//<point>// **intersectionDe:et:** //l1 l2//
⇒ point d’intersection des deux lignes

[[[f intersectionDe: droite et: segment]]]

!!!!!!Intersection alternative
//<point>// **autreIntersectionDe:et:** //l1 l2//
⇒ l’autre point d’intersection des deux lignes, lorsqu’il existe.')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Point_milieu
	^ EruditeBookSection basicNew
		title: 'milieu';
		document:
			((EruditeDocument contents: '!!!!!!Milieu de deux points
//<point>// **milieuDe:et:** //p1 p2//

[[[| f a i |
f _ DrGeoFigure nouveau.
a _ f point: 1@1.
i _ f milieuDe: a et: 4@4]]] withDrGeoActions

!!!!!!Milieu d''un segment
//<point>// **milieuDe:** //s//

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 a: 5@3.
f milieuDe: s]]] withDrGeoActions
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Point_mobile
	^ EruditeBookSection basicNew
		title: 'mobile';
		document:
			((EruditeDocument contents: '!!!!!!Point mobile
//<point>// **point:** //pointOuBloc//

[[[| fig |
fig _ DrGeoFigure nouveau.
fig point: 5@2.
fig point: [ 5 auHasard @ 5 auHasard ] ]]] withDrGeoActions
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_Point_surLigne
	^ EruditeBookSection basicNew
		title: 'sur ligne';
		document:
			((EruditeDocument contents: '!!!!!!Point sur ligne
//<point>// **pointSurLigne:a:** //curve a//

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 a: 5@3.
f pointSurLigne: s a: 0.5]]] withDrGeoActions
')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Styles
^(EruditeBookSection basicNew title: 'Styles'; document: ((EruditeDocument contents: '!!!!!!Style
Pour modifier les attributs d’un objet déjà créé, nous lui envoyons le message approprié. La modification des attributs se fait donc toujours à posteriori.

Dans les sections suivantes, les styles communs à tous les types d''objets d''une figure.

!!!!!!!!Couleur
**couleur:** //uneCouleur//
//uneCouleur//, un objet de type [[[Color]]] inspectIt. Voir ses méthodes de classe pour des définitions existantes : Color black, Color red, Color blue, Color orange, Color yellow,...
⇒ modifie la couleur d’un item

[[[| fig p | 
fig _ DrGeoFigure nouveau.
p _ fig point: 0@0.
p couleur: Color green]]] withDrGeoActions

!!!!!!!!Nom
**nommer:** //string//
//string//, une chaîne de caractères
⇒ nomme un objet

[[[| fig s | 
fig _ DrGeoFigure nouveau.
s _ fig segmentDe: 0@0 a: 3@1.
s nommer: ''[AB]'']]] withDrGeoActions

!!!!!!!!Statut
**cacher**
⇒ masque un objet

[[[| fig s m |
fig _ DrGeoFigure nouveau.
s _ fig segmentDe: 0@0 a: 3@1.
(fig point: 3@1) montrer.
m _ fig milieuDe: s.
fig perpendiculaireA: s passantPar: m.
m cacher]]] withDrGeoActions

**montrer**
⇒ montre un objet

**bloquer**
⇒ bloque un objet à sa position actuelle, pour peu que cela ait un sens.

[[[| fig cercle |
fig _ DrGeoFigure nouveau.
cercle _ fig cercleCentre: 0@0 passantPar: 5@0.
fig segmentDe: 0@0 a: (fig pointSurLigne: cercle a: 0.2).
(fig point: 0@0) bloquer]]] withDrGeoActions

!!!!!!!!Position
**deplacerA:** //point//
//point//, couple de coordonnées
⇒ déplace un point ou une valeur à la position donnée, pour peu que cela ait un sens.

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 0@0.
a deplacerA: 5@5.
fig actualiser]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Styles_Point;
        add: self section_Styles_Ligne;
        add: self section_Styles_Segment;
        add: self section_Styles_Texte;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Styles_Ligne
^(EruditeBookSection basicNew title: 'Ligne'; document: ((EruditeDocument contents: '!!!!!!Ligne
Une ligne est un segment, une droite, une demi-droite, un cercle, un arc de cercle, un polygone ou un lieu géométrique.

!!!!!!!!Epaisseur
**fin**
⇒ donne une épaisseur fine à une ligne
**normal**
⇒ donne une épaisseur normal à une ligne
**épais**
⇒ donne une épaisseur large à une ligne

[[[| fig c |
fig _ DrGeoFigure nouveau.
c _ fig cercleCentre: 0@0 rayon: 1.
c épais]]] withDrGeoActions

!!!!!!!!Style de trait
**plein**
⇒ donne un style de trait continue, plein, à une ligne
**tiret**
⇒ donne un style de trait en tirets à une ligne 
**pointillé**
⇒ donne un style de trait en pointillés à une ligne

[[[| fig c r|
fig _ DrGeoFigure nouveau.
c _ fig cercleCentre: 0@0 rayon: 1.
c épais tiret.
r _ fig segmentDe: 0@0 à: 1@0.
r pointillé]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Styles_Point
^(EruditeBookSection basicNew title: 'Point'; document: ((EruditeDocument contents: '!!!!!!Point

!!!!!!!!Forme
**croix**
⇒ donne une forme en croix à un point

**rond**
⇒ donne une forme en rond à un point

**carré**
⇒ donne une forme carrée à un point

[[[| fig a |
fig _ DrGeoFigure nouveau.
(fig point: 0@0) croix
(fig point: 1@0) rond.
(fig point: 2@0) carré ]]] withDrGeoActions

!!!!!!!!Taille
**petit**
⇒ donne une petite taille à un point

**moyen**
⇒ donne une taille moyenne à un point

**large**
⇒ donne une taille large à un point

[[[| fig a |
fig _ DrGeoFigure nouveau.
(fig point: 0@0) petit
(fig point: 1@0) normal.
(fig point: 2@0) large ]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Styles_Segment
^(EruditeBookSection basicNew title: 'Segment'; document: ((EruditeDocument contents: '!!!!!!Segment

!!!!!!!!Marquage
**marquerAvecCercle**
⇒ marque – codage – un segment avec un cercle
**marquerAvecDisque**
⇒ marque un segment avec un disque
**marquerAvecSimpleTrait**
⇒ marque un segment avec un trait
**marquerAvecDoubleTrait**
⇒ marque un segment avec un double trait
**marquerAvecTripleTrait**
⇒ marque un segment avec un triple trait

[[[| fig a b c |
fig _ DrGeoFigure nouveau.
a _ fig segmentDe: -2@0 à: 2@0.
b _ fig segmentDe: -2@0 à: 0@4.
c _ fig segmentDe: 0@4 à: 2@0.
a marquerAvecDisque.
b marquerAvecSimpleTrait.
c marquerAvecSimpleTrait ]]] withDrGeoActions

!!!!!!!!Flèche
**flècheDebut**
ajoute à un segment une flèche en début de ligne
**flècheFin**
ajoute à un segment une flèche en fin ligne
**flèches**
ajoute à un segment des flèches en début et en fin de ligne

[[[| fig segment |
fig _ DrGeoFigure nouveau.
segment _ fig segmentDe: 0@0 à: 5@1.
segment flècheDebut]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Styles_Texte
^(EruditeBookSection basicNew title: 'Texte'; document: ((EruditeDocument contents: '!!!!!!Texte
**couleurFond:** //uneCouleur//
⇒ modifie la couleur d''arrière plan d''un texte

[[[| fig t |
fig _ DrGeoFigure nouveau.
t _ fig texte: ''Hello''.
t couleurFond: Color green]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Transformations
^(EruditeBookSection basicNew title: 'Transformations'; document: ((EruditeDocument contents: 'Avec les transformations géométriques construis des tranformés d''objets tels des point, segment, droite, demi-droite, vecteur, cercle, arc de cercle, polygone et lieu de point.

Déplie la section **▶ Transformations** pour les découvrir !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Transformations_Rotation;
        add: self section_Transformations_Homothétie;
        add: self section_Transformations_SymétrieCentrale;
        add: self section_Transformations_SymétrieAxiale;
        add: self section_Transformations_Translation;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_TransformationsGéométriques
	^ EruditeBookSection basicNew
		title: 'Transformations géométriques';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Transformations_Homothétie
^(EruditeBookSection basicNew title: 'Homothétie'; document: ((EruditeDocument contents: '!!!!!!Homothétie
//<objet>// **homothétieDe:centre:facteur:** //i c k//
//i//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//c//, point ou couple de coordonnées, centre de l’homothétie
//k//, nombre ou valeur, facteur de l’homothétie
⇒ référence de l’objet transformé

[[[| fig a c l n |
fig _ DrGeoFigure nouveau.
fig afficherAxes.
a _ fig point: 3@0.
n _ fig distanceDe:a à: 0@0.
c _ fig point: 5@5.
l _ fig cercleCentre: 0@0 passantPar: 3@3.
fig homothétieDe: l centre: c facteur: 1.5.
fig homothétieDe: l centre: c facteur: n]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Transformations_Rotation
^(EruditeBookSection basicNew title: 'Rotation'; document: ((EruditeDocument contents: '!!!!!!Rotation
//<objet>// **rotationDe:centre:angle:** //i c a//
//i//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//c//, point ou d’un couple de coordonnées, centre de la rotation
//a//, nombre ou valeur, angle de la rotation
⇒ objet transformé

[[[| fig a c l n |
fig _ DrGeoFigure nouveau.
fig afficherAxes.
a _ fig point: 3@0.
n _ fig distanceDe:a à: 0@0.
c _ fig point: 5@5.
l _ fig droitePassantPar: 1@0 et: 5@5.
fig rotationDe: l centre: c angleDegrés: 30.
fig rotationDe: l centre: c angle: n]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Transformations_SymétrieAxiale
^(EruditeBookSection basicNew title: 'Symétrie axiale'; document: ((EruditeDocument contents: '!!!!!!Symétrie axiale (réflexion)
//<objet>// **symétriqueDe:selonAxe:** //o c//
//o//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//axe//, droite, axe de la réflexion
⇒ objet transformé

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 4@2.
fig 
	symétriqueDe: a 
	selonAxe: (fig droitePassantPar: 0@0 et: 4@5)]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Transformations_SymétrieCentrale
^(EruditeBookSection basicNew title: 'Symétrie centrale'; document: ((EruditeDocument contents: '!!!!!!Symétrie centrale
//<objet>// **symétriqueDe:selonCentre:** //o c//
//o//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//c//, point ou coordonnées, centre de la symétrie
⇒ objet transformé

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 4@2.
fig symétriqueDe: a selonCentre: 0@0]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Transformations_Translation
^(EruditeBookSection basicNew title: 'Translation'; document: ((EruditeDocument contents: '!!!!!!Translation
//<objet>// **translationDe:parVecteur:** //o v//
//o//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//v//, vecteur ou couple de coordonnées
⇒ objet transformé

[[[| fig u a |
fig _ DrGeoFigure nouveau.
u _ fig vecteurOrigine: 1@1 extrémité: 3@2.
a _ fig translationDe: (fig point: 2@1) parVecteur: u]]] withDrGeoActions

Un exemple dynamique :
[[[| fig u a c |
fig _ DrGeoFigure nouveau.
u _ fig 
	vecteurOrigine: 1@1 
	extrémité: (fig point: 3@2).
c _ fig cercleCentre: 0@0 passantPar: 3@3.
a _ fig translationDe: c parVecteur: u]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified'!
section_ValeursNumériques
	^ EruditeBookSection basicNew
		title: 'Valeurs numériques';
		document:
			((EruditeDocument contents: '')
				data: Dictionary new;
				yourself);
		subsections: OrderedCollection new yourself;
		yourself.! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/13/2025 16:54:39'!
section_Vecteur
^(EruditeBookSection basicNew title: 'Vecteur'; document: ((EruditeDocument contents: '!!!!!!Vecteur par deux points
//<vecteur>// **vecteurOrigine:extremité:** //o e//
//o//, point ou couple de coordonnées, origine du vecteur
//e//, point ou couple de coordonnées, extrémité du vecteur

[[[| fig b |
fig _ DrGeoFigure nouveau.
b _ fig point: 0@5.
fig vecteurOrigine: b extrémité: -1 @ -2]]] withDrGeoActions

!!!!!!Vecteur par coordonnées
<vecteur> **vecteur:** //p//
//p//, point ou couple de coordonnées, coordonnées du vecteur

[[[| fig p |
fig _ DrGeoFigure nouveau.
p _ fig point: 5@5.
fig vecteur: p.
fig vecteur: -5 @ -5]]] withDrGeoActions

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

