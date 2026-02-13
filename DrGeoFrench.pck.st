'From Cuis7.1 [latest update: #6452] on 1 December 2025 at 10:51:57 pm'!
'Description '!
!provides: 'DrGeoFrench' 1 22!
!requires: 'DrGeo' 1 747 nil!
SystemOrganization addCategory: #DrGeoFrench!


!classDefinition: #DrGeoTutorial category: #DrGeoFrench!
EruditeBook subclass: #DrGeoTutorial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DrGeoFrench'!
!classDefinition: 'DrGeoTutorial class' category: #DrGeoFrench!
DrGeoTutorial class
	instanceVariableNames: ''!

!classDefinition: #DrGeoFigure category: #DrGeoFrench!
DrGeoSketch subclass: #DrGeoFigure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DrGeoFrench'!
!classDefinition: 'DrGeoFigure class' category: #DrGeoFrench!
DrGeoFigure class
	instanceVariableNames: ''!


!DrGeoFigure commentStamp: '' prior: 0!
Domain Specific Language (DSL) abstraction to construct programmatically interactive sketch. 
I come with methods with French names.!

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
initialize
    super initialize.
    title _ 'Dr. Geo Tutorial'.
        self addSection: self section_Introduction.
        self addSection: self section_Point.
        self addSection: self section_Général.
        self addSection: self section_Vecteur.
        self addSection: self section_LignesDroites.
        self addSection: self section_LignesCourbes.
        self addSection: self section_NumériqueTexte.
        self addSection: self section_Transformations.
        self addSection: self section_Styles.
        self addSection: self section_Expert.
! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 3/2/2025 22:05:30'!
section_1231DemiDroiteSurDroite
^(EruditeBookSection basicNew title: '1.2.3.1 Demi-Droite sur Droite'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_Angles
^(EruditeBookSection basicNew title: 'Angles'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_AnglesEtValeurs
^(EruditeBookSection basicNew title: 'Angles et valeurs'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 14:28:13'!
section_Autres
^(EruditeBookSection basicNew title: 'Autres'; document: ((EruditeDocument contents: '!!!!!!Equation
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
monTexte texte: ''Au revoir'']]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 16:47:27'!
section_Autres_Equation
^(EruditeBookSection basicNew title: 'Equation'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 16:47:27'!
section_Autres_Texte
^(EruditeBookSection basicNew title: 'Texte'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 21:52:14'!
section_ChargerLesFaitsDeLaFigure
^(EruditeBookSection basicNew title: 'Charger les faits de la figure'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_Exemples
^(EruditeBookSection basicNew title: 'Exemples'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert
^(EruditeBookSection basicNew title: 'Expert'; document: ((EruditeDocument contents: 'Avant propos.

Le système expert est associé à [[[ DrGSmalltalkSketchEditor open: '''' label: ''Edit Smalltalk Sketch'' translated ]]] doItWithButton: l''éditeur de figure Smalltalk.

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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ExemplesDexperts
^(EruditeBookSection basicNew title: 'Exemples d''experts'; document: ((EruditeDocument contents: '!!!!!!Exemples d''expert!!!!!!

	Participes passés
Ecrire les règles simplifiées des participes passés sous fome de règles expert et déduire comment se fait l''accord.

	Morpion
Ecrire des règles pou yvertir le joueus qu''il peut gagner ou que l''adversaire peut gagner.et indiquer la case en cause

	Carré magique.
Placacer les nombres de 1 à 9 dans une grille 3 x 3 pour que toutes les lignes, toutes les colonnes et les diagonales aient une somme de  15.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ExemplesDexperts_accordParticipes;
        add: self section_Expert_ExemplesDexperts_leJeuDuMorpion;
        add: self section_Expert_ExemplesDexperts_CarréMagique;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ExemplesDexperts_CarréMagique
^(EruditeBookSection basicNew title: 'Carré magique'; document: ((EruditeDocument contents: '!!!!!!Carré magique!!!!!!

Le carré magique est un exemple, d''explosion combinatoire, i y a trop de possibilités à examiner.

Toutes les lignes doivent  avoir un total de 15,
Dans  chaque case, il y a nombre de 1 à 9.
Toutes les cases ont un nombre différent.
 
**Données.**

On affirme les nombres de 1 à 9.

exp affirmeFaits: ''nombre 1 
nombre 1
nombre 2
nombre 3
nombre 4
nombre 5
nombre 6
nombre 7
nombre 8
nombre 9''

**Règles**

Une règle suffirait pour décrire le probème.

	La somme de toutes les lignes, colonnes, côtés et diagonales doit être 15.
    	
	Dans les cases, il y a les nombres de de 1 à 9

	Toutes les cases ont un nombre différent.

La règle pourrait être:

exp lisRegle: ''carré magique''
si: ''somme:et:rep: ?x1 ?x2 ?int1
somme:et:rep: ?x3 ?int1 15
somme:et:rep: ?x4 ?x5 ?int2
somme:et:rep: ?x6 ?int2 15
somme:et:rep: ?x7 ?x8 ?int3
somme:et:rep: ?x9 ?int3 15
somme:et:rep: ?x1 ?x4 ?int4
somme:et:rep: ?x7 ?int4 15
somme:et:rep:?x2 ?x5 ?int5
somme:et:rep: ?x8 ?int5  15
somme:et:rep: ?x3 ?x6 ?int6
somme:et:rep: ?x9 ?int6 15
somme:et:rep: ?x1 ?x5 ?int7
somme:et:rep: ?9 ?int7  15
somme:et:rep: ?x3 ?x5 ?int8
somme:et:rep: ?x7 ?int8  15
tousDifferents [ ?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x9 ]
alors: carré [ ?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x9 ]''
com: ''sommes lignes, colonnes, diagonales''

**N''essaye pas cette règle, sauf si tu voir qu''elle semble bloquer l''ordinateur, dans ce cas tu dois quitter le progamme sans pouvoir sauver ton travail en fermant la fenêtre.**


TousDifferents doit essayer tous  les groupes de 9 entiers différents et ne garder que ceux qui vérifient les conditions du carré, touts les sommes  doivent êtrre égales à 15.

Avec 9 chiffres, il y a 9!!  = 362 880 possibilités ce qui durera  très longtemps.

Si l''on sépare les 9 nombres en nombres pairs  et  impairs, on a un groupe de 5 nombres impairs et un groupede 4 nombres pairs, soit 4!! = 24 possibilités pour les nombres pairs et 5!!= 120 combinaisons à essayer, par contre il faut aider l''ordinateur et lui dire les cases qui ont un nombre impair et celles qui ont un nombre pair.
 
Toutes les lignes doivent  avoir un total de 15, comme 15 est impair,  on ne peut avoir dans une ligne que trois nombres impairs ou deux nombres pairs et un nombre impair ce qui donnent un résultat impair.

Deux sortes de lignes se croisent au centre, les **diagonales** et celles qui forment une **croix**. le centre doit contenir 5 entouré de deux nombres qui font un total de 10, soit avec deux nombre pairs ou deux nombre impairs pour que le résultat, 10, soit un nombre pair.
Les extrémités de la croix sont impaires et sont au milieu des côtés ,donc les extrémités des côtés sont pairs et les côtés sont formés de deux nombres pairs et d''un nombre impair. Les extrémités des côtés sont aussi les angles donc les anges sont pairs.

Il y a deux manières d''avoir toutes les case: 

	Avec la croix et les diagonales.
	
	Avec les côtés et le centre
	
	**Données **

   	Les faits à affirmer sont 4 nombre pairs et 5 nombres impairs  de 1 à 9 tous diffénts..

exp initFaits .
exp affirmeFaits:''
impair 1
impair 3
impair 5
impair 7
impair 9
pair 2
pair 4
pair 6
pair 8''

exp afficheFaits.

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:  ''carré magique'' string:''
exp initFaits.
exp affirmeFaits:''''
impair 1
impair 3
impair 5
impair 7
impair 9
pair 2
pair 4
pair 6
pair 8''''

exp afficheFaits
'' ]]] doItWithButton: copier l''exemple.


	**règles**

 	**Lignes PIP**

exp initRegles.

exp lisRegle: ''lignePIP''
si: ''pair ?x1
impair ?x2
pair ?x3
somme:et:rep: ?x1 ?x2 ?x12
somme:et:rep: ?x12 ?x3 15
alors: ''lignePIP  [ ?x1 ?x2 ?x3 ]''
com: ''lignes formées d''''un nombre pair, d''''un nombre impair, d''''un nombre pair.''''.

exp deduis.																																																																																				
"toutes les lignes"
exp verifieCondition: ''''lignePIP  [ ?x1 ?x2 ?x3  ]''''.

"Lignes ne passant pas par le centre(cotés)"
exp verifieCondition:''''lignePIP   [ ?x1 ?x5 ?x2 ]
different:de: ?x5 5''''.

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor: ''carré magique'' string:''
"Lignes PIP"
exp lisRegle: ''''lignePIP''''
si: ''''pair ?x1
impair ?x2
pair ?x3
somme:et:rep: ?x1 ?x2 ?x12
somme:et:rep: ?x12 ?x3 15''''
alors: ''''lignePIP  [ ?x1 ?x2 ?x3 ]''''
com: ''''lignes formées d''''''''un nombre pair, d''''''''un nombre impair, d''''''''un nombre pair.''''.

exp deduis.																																																																																				
"toutes les lignes"
exp verifieCondition: ''''lignePIP  [ ?x1 ?x2 ?x3  ]''''.

"Lignes ne passant pas par le centre(cotés)"
exp verifieCondition:''''lignePIP   [ ?x1 ?x5 ?x2 ]
different:de: ?x5 5''''.
''
]]] doItWithButton: copier l''exemple.


"Côtés du carré"

exp lisRegle: ''côtés''
si:  ''lignePIP [ ?x1 ?x2 ?x3 ]
different:de: 5 ?x2''
alors: ''côté [ ?x1 ?x2 ?x3 ]''
com: ''Lignes des côtés du carré''.

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''carré magique'' string:''
exp lisRegle: ''''côtés''''
si:  ''''lignePIP [ ?x1 ?x2 ?x3 ]
different:de: 5 ?x2''''
alors: ''''côté [ ?x1 ?x2 ?x3 ]''''
com: ''''Lignes des côtés du carré''''.

 exp deduis.
exp verifieCondition:''''côté [ ?x1 ?x2 ?x3 ]''''.
''
]]] doItWithButton: copier l''exemple.

"solution avec les côtés"
exp lisRegle: ''solutionCôtés''
si:  ''côté [ ?x1 ?x2 ?x3 ]
côté [ ?x3 ?x6 ?x9 ]
côté [ ?x9 ?x8 ?x7 ]
côté [ ?x7 ?x4 ?x1 ]
somme:et:rep: ?x1 ?x2 ?int1
somme:et:rep: ?int1 ?x3 15
somme:et:rep: ?x4 ?x5 ?int2
somme:et:rep: ?int2 ?x6 15
somme:et:rep: ?x7 ?x8 ?int3
somme:et:rep: ?int3 ?x9 15
somme:et:rep: ?x1 ?x4 ?int4
somme:et:rep: ?int4 ?x7 15
somme:et:rep: ?x2 ?x5 ?int5
somme:et:rep: ?int5 ?x8 15
somme:et:rep: ?x3 ?x6 ?int6
somme:et:rep: ?int6 ?x9 015
tousDifferents: [   ?x1 ?x2 ?x3  ?x4 5 ?x6 ?x7 ?x8  ?x9 ]''  
alors: ''carréCôtés [ ?x1 ?x2 ?x3 ?x4 5 ?x6 ?x7 ?x8  ?x9 ]''
com: ''Une solution du carré magique.''. 
exp deduis.
exp modèlesQuestions . 
exp verifieCondition:''carréCôtés ?x1'' 
  
[[[fig presenter expertDisplayTutor:''carré magique'' string:''
"solution avec les côtés"
exp lisRegle: ''''solutionCôtés''''
si:exp  ''''côté [ ?x1 ?x2 ?x3 ]
côté [ ?x3 ?x6 ?x9 ]
côté [ ?x9 ?x8 ?x7 ]
côté [ ?x7 ?x4 ?x1 ]
somme:et:rep: ?x1 ?x2 ?int1
somme:et:rep: ?int1 ?x3 15
somme:et:rep: ?x4 ?x5 ?int2
somme:et:rep: ?int2 ?x6 15
somme:et:rep: ?x7 ?x8 ?int3
somme:et:rep: ?int3 ?x9 15
somme:et:rep: ?x1 ?x4 ?int4
somme:et:rep: ?int4 ?x7 15
somme:et:rep: ?x2 ?x5 ?int5
somme:et:rep: ?int5 ?x8 15
somme:et:rep: ?x3 ?x6 ?int6
somme:et:rep: ?int6 ?x9 015
tousDifferents: [   ?x1 ?x2 ?x3  ?x4 5 ?x6 ?x7 ?x8  ?x9 ]'''' 
alors: ''''carréCôtés [ ?x1 ?x2 ?x3 ?x4 5 ?x6 ?x7 ?x8  ?x9 ]''''
com: ''''Une solution du carré magique.''''. 
exp deduis.
exp modèlesQuestions .
exp verifieCondition:''''carréCôtés ?x1''''  
''
]]] doItWithButton: copier l''exemple.



**Solution avec les diagonales et la croix **
  
	
	**Diagonales**

exp lisRegle: ''diagonale''
si:  ''lignePIP [ ?x1 5 ?x3 ]'' 
alors: ''diagonale [ ?x1 5 ?x3 ]''
com: ''les lignes diagonales du carré.''.  

	Vérifications des diagonales.
exp deduis.
exp verifieCondition:''diagonale [ ?d1 5 ?d2 ]''.

[[[fig presenter expertDisplayTutor:''carré magique'' string:''
"Diagonales."
exp lisRegle: ''''diagonale''''
si:  ''''lignePIP [ ?x1 5 ?x3 ]'''' 
alors: ''''diagonale [ ?x1 5 ?x3 ]''''
com: ''''les lignes diagonales''''. 

exp deduis.
exp verifieCondition:''''diagonale [ ?d1 5 ?d2 ]''''.
''
]]] doItWithButton: copier l''exemple.

	**La croix.**

	Les lignes qui relient les milieux de deux lignes PIP qui se font faces, passent par le centre et forment une **croix**.
	La somme du premier nombre de ces lignes et du dernier doit être 10  pour que la somme de ces lignes soit 15.
	On se limite à avoir des lignes avec le premier nombre plus petit que le dernier.

exp lisRegle:''croix''
si: ''impair ?x1
égal:à: ?x2 5
impair ?x3
somme:et:rep: ?x1 5 ?x12
somme:et:rep: ?x12 ?x3 15''
alors: ''croix [ ?x1 ?2 ?x3 ] '' 
com: ''les lignes de la croix''.  

	Vérification de la croix.

exp deduis.
exp verifieCondition:''croix [ ?x1 5 ?x3 ]''.

[[[fig presenter expertDisplayTutor:''carré magique'' string:''
"La croix"
exp lisRegle:''''croix''''
si: ''''impair ?x1
égal:à: ?x2 5
impair ?x3
somme:et:rep: ?x1 5 ?x12
somme:et:rep: ?x12 ?x3 15''''
alors: ''''croix [ ?x1 ?x2 ?x3 ] ''''
com: ''''les lignes de la croix''''. 
exp deduis.
exp verifieCondition:''''croix [ ?x2 5 ?x3 ]''''.''
]]] doItWithButton: copier l''exemple.

	Avec les **diagonales **et **la croix** on a les valeurs de toutes les cases du carré magique et les lignes horizontales forment la réponse, le carré magique.

"Croix et Diagonales"
exp lisRegle: ''solusolutionCroixEtDiagonales''
si:  ''croix [ ?x2 ?x5 ?x8 ]
croix [ ?x4 ?x5 ?x6 ]
diagonale [ ?x1 ?x5 ?x9 ] 
diagonale [ ?x3 ?x5 ?x7 ]
somme:et:rep: ?x1 ?x2 ?int1
somme:et:rep: ?int1 ?x3 15
somme:et:rep: ?x4 ?x5 ?int2
somme:et:rep: ?int2 ?x6 15
somme:et:rep: ?x7 ?x8 ?int3
somme:et:rep: ?int3 ?x9 15
somme:et:rep: ?x1 ?x4 ?int4
somme:et:rep: ?int4 ?x7 15
somme:et:rep: ?x2 ?x5 ?int5
somme:et:rep: ?int5 ?x8 15
somme:et:rep: ?x3 ?x6 ?int6
somme:et:rep: ?int6 ?x9 015
tousDifferents: [   ?x1 ?x2 ?x3  ?x4 5 ?x6 ?x7 ?x8  ?x9 ]''  
alors: ''carréCroixDiagonales [ ?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8  ?x9 ]''
com: ''Une solution du carréCroixDiagonalesarré magique.''. 
exp deduis.
exp vérifieCondition: ''carréCroixDiagonales ?x''.
 
   
[[[ fig presenter expertDisplayTutor:''carré magique'' string:''
"Croix et Diagonales"
exp lisRegle: ''''solutionCroixEtDiagonales''''
si:  ''''croix [ ?x2 ?x5 ?x8 ]
croix [ ?x4 ?x5 ?x6 ]
diagonale [ ?x1 ?x5 ?x9 ] 
diagonale [ ?x3 ?x5 ?x7 ]
somme:et:rep: ?x1 ?x2 ?int1
somme:et:rep: ?int1 ?x3 15
somme:et:rep: ?x4 ?x5 ?int2
somme:et:rep: ?int2 ?x6 15
somme:et:rep: ?x7 ?x8 ?int3
somme:et:rep: ?int3 ?x9 15
somme:et:rep: ?x1 ?x4 ?int4
somme:et:rep: ?int4 ?x7 15
somme:et:rep: ?x2 ?x5 ?int5
somme:et:rep: ?int5 ?x8 15
somme:et:rep: ?x3 ?x6 ?int6
somme:et:rep: ?int6 ?x9 015
tousDifferents: [   ?x1 ?x2 ?x3  ?x4 5 ?x6 ?x7 ?x8  ?x9 ]'''' 
alors: ''''carréCroixDiagonales [ ?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8  ?x9 ]''''
com: ''''Une solution du carréCroixDiagonalesarré magique.''''. 

exp deduis.
exp verifieCondition:''''carréCroixDiagonales  ?x1''''.
'']]] doItWithButton: copier l''exemple.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ExemplesDexperts_accordParticipes
^(EruditeBookSection basicNew title: 'accord participes'; document: ((EruditeDocument contents: '!!!!!!accord participes

Les règles simplifiées d''accord des participes passès sont:

auxiliaire être: -> accord avec le sujet.

auxiliaire avoir:
		COD absent ou après le participe passé									 	-> pas accord			
		COD avant   le participe passé 							      	 	 	->	accord avec le COD

Pour avoir toute la phrase  dans une seule variabl on utilise une liste limitée par **[** et **]**.

Exemple: [ il a mangé des pommes ]

**les faits**

Un fait va décrire  la phrase et le verbe à l''infinitif.

Exemple: phrase  [ je suis parti ] verbe partir 

Il faut connaître l''auxiliaire.

Exemple: auxiliaire partir être 

Pour l''auxiliaire avoir il faut en plus la position de COD.

Exemple: COD jeter avant / COD ramasser après /COD manger absent 

**Les règles**

e initRegles.
e lisRegle: ''être''
si: ''phrase ?p verbe ?v
auxiliaire ?v être''
alors:''phrase ?p verbe ?v accord avec le sujet''.

e lisRegle: ''avoir-après''
si: ''phrase ?p verbe ?v
auxiliaire ?v avoir
COD ?v après''
alors: ''phrase ?p verbe ?v pas_accord''.

e lisRegle: ''avoir-absent''
si: ''phrase ?p verbe ?v
auxiliaire ?v avoir
COD ?v absent''
alors: ''phrase ?p verbe ?v pas_accord''.

e lisRegle: ''avoir-avant''
si: ''phrase ?p verbe ?v
auxiliaire ?v avoir
COD ?v avant''                                                                                                                                                                  
alors: ''phrase ?p verbe ?v accord avec COD''. 


**Des faits pour essayer**


e initFaits.
e affirmeFaits: 
''phrase [ je suis parti ] verbe partir
auxiliaire partir être
phrase [ il a mangé ] verbe manger
auxiliaire manger avoir
COD manger absent 
phrase [ il a ramassé des pommes ] verbe ramasser
auxiliaire ramasser avoir
COD ramasser après 
phrase [ les papiers que tu as  jetés ] verbe jeter
auxiliaire jeter avoir
COD jeter avant''. 

**Les résultats**

e afficheFaits.  ''
1 phrase  [ je suis parti ] verbe partir ->énoncé
2 auxiliaire partir être ->énoncé
3 phrase  [ il a mangé ] verbe manger ->énoncé
4 auxiliaire manger avoir ->énoncé
5 COD manger absent ->énoncé
6 phrase  [ il a ramassé des pommes ] verbe ramasser ->énoncé
7 auxiliaire ramasser avoir ->énoncé
8 COD ramasser après ->énoncé
9 phrase  [ les papiers que tu as jetés ] verbe jeter ->énoncé
10 auxiliaire jeter avoir ->énoncé
11 COD jeter avant ->énoncé
12 phrase  [ je suis parti ] verbe partir accord avec le sujet ->être
 * 
13 phrase  [ il a ramassé des pommes ] verbe ramasser pas_accord ->avoir-après
 * 
14 phrase  [ les papiers que tu as jetés ] verbe jeter accord avec COD ->avoir-avant
 * 
15 phrase  [ il a mangé ] verbe manger pas_accord ->avoir-absent
 * 

Tu as tous les élémemts pour faire ce projet à toi de les assembler.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ExemplesDexperts_leJeuDuMorpion
^(EruditeBookSection basicNew title: 'le jeu du morpion'; document: ((EruditeDocument contents: '!!!!!!morpion
Ce système expert donne des conseils pour le jeu du morpion.

Il repère les lignes qui ont deux marqes d''un même joueur et une place vide. Pour le joueur c''est une occasion de gagne et pour l''adversaire une nécessité de contrer.
Il repère aussi une ligne gagnante.

Chargement des règles.

"initialiser les règles."
exp initRegles.
"Charger les règles"
ExpertRegle morpion: e
"Voir les règles. " 
exp afficheRegles.''
ExpertRegle morpion: e
[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Morpion'' string:''
"initialiser les règles."
exp initRegles.
"Charger les règles"
ExpertRegle morpion: e..
"Voir les règles. " 
exp afficheRegles.''
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert
^(EruditeBookSection basicNew title: 'Géométrie et système Expert'; document: ((EruditeDocument contents: 'Avant propos.

Le système expert est associé à [[[ DrGSmalltalkSketchEditor open: '''' label: ''Edit Smalltalk Sketch'' translated ]]] doItWithButton: l''éditeur de figure Smalltalk.

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
[[[ f :=DrGeoFigure new.''''.]]] embedIt') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite;
        add: self section_Expert_GéométrieEtSystèmeExpert_2Cercles;
        add: self section_Expert_GéométrieEtSystèmeExpert_3Angles;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite
^(EruditeBookSection basicNew title: '1.1 point segment et droite'; document: ((EruditeDocument contents: '!!!! point, segment, droite.
**1.1 point.**
Euclide :  Définition 1, « le point est ce dont la partie est nulle ».

**1.2. Segments et droites.**
Euclide : Définition 2, « **Une ligne est une longueur sans largeur. **»
Euclide : Définition 3, « **Les extrémités d’une ligne sont des points.** »
Euclide : Définition 4, « **La ligne droite est celle qui est également placée entre ses points. **» 
Si on marche le long d''une droite le pied gauche se déplace de la même distance que le pied droit.
//Sur une sphère  les méridiens sont des droites mais pas les parallèles, les pas ne sont pas de même taille de chaque côté d''un parallèle.Tous les parallèles sont de taille différente.)//

Euclide : Demande 1, « **Entre deux points on peut toujours tracer une droite.**»//
( Euclide défini comme droite ce qui est pour nous un segment.) //
Cette définition permet à Euclide de définir sa droite comme le plus court chemin entre deux points.

Euclide : Demande 2, « **On peut toujours prolonger indéfiniment une droite tracée entre deux points.**»
//
On peut prolonger une droite en utilisant une règle et en déplaçant la règle de manière à ce que son bord se confonde avec la partie de droite déjà construite.

Cette demande est toujours satisfaite pour la géométrie plane, elle n''est pas toujours vérifiée , par exemple, sur un sphère, les extrémités d''un segment peuvent se rejoindre en un même point.)//

Aide-mémoire  p.90 : « **La droite A B est constituée d''une infinité de points alignés avec A et B **»
Aide-mémoire  p.90 : « **Un segment est une portion de droite limitée par deux points. **»
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_11Point;
        add: self section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_121Segment;
        add: self section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_122Droite;
        add: self section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_123DemiDroite;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_11Point
^(EruditeBookSection basicNew title: '1.1 Point'; document: ((EruditeDocument contents: '!!!! 1.1 point

Euclide : « Définition 1,** le point est ce dont la partie est nulle **».

!!!!!! 1.1.1. Script de la Figure.

[[[
f :=DrGeoFigure nouveau.
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifief un modèle, utilise vérifier du menu Exprt'' style: true.
f afficherAxes .
a := f point: 0@2.
a nommer: ''A''.	
b := f point: 0@-2.
b nommer: ''B''.	
f presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.

[[[ f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
"1.1.1 point"
f:=DrGeoFigure nouveau.
f expert:e.
e drgeo: f.
f afficherAxes .
a := f point: 3@5.
a nommer: ''''A''''.	
a := f point: 3@-5.
a nommer: ''''B''''.	
e := f expert. 
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
'' ]]] doItWithButton: copier le script de la figure pour l''exécuter.

 **Prédicats.**
Un prédicat est une méthode smallTalk qu''on peut appeler dans les conitions d''une règle pour faire des calculs ou des actions,

Un prédicat est formé de la suite des sélecteurs de la méthode, 
suivie des arguments.

Exemples: 

**point:rep: ?x1 ?pos**

Ce prédicat retourne l''objet **point**. ( **3@5** pour A et **3@ -5** pour B.)  qui est la position d''un point.

point ?x1 
point:rep: ?x1 ?pos

[[[ f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
point ?x1 
point:rep: ?x1 ?pos'' style:true]]] doItWithButton: copier pour vérifier avec le menu Expert.


e verifieCondition: ''point ?x1
point:rep: ?x1 ?pos''

[[[ f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:'' 
e verifieCondition: ''''point ?x1 
point:rep: ?x1 ?pos'''''' ]]] doItWithButton: copier ce code pour l''exécuter.



Les prédicats x:rep: et y:rep:  permettent d''avoir les coordonnées x et y d''un objet numérique point.

	point ?x1
	point:rep: ?x1 ?pos
	x:rep: ?pos ?x:
	y:rep: ?pos ?y''

[[[ f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y'' style:true]]] doItWithButton: copier pour vérifier avec le menu Expert.

	e verifieCondition: ''point ?x1
	point:rep: ?x1 ?pos
	x:rep: ?pos ?x:
	y:rep: ?pos ?y''. 

[[[ f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''e verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y''''. '' ]]] doItWithButton: copier ce code pour l''exécuter.


** Commentaires.  **

Un commentaire peut être associé à une règle pour préciser en terme de géométrie l''action de la règle. Ces commentaires sont précédés d''une astérisque.

	* Qualification d''un point.

Un commentaire associé à un 	prédicat est entre guillemets.
	
	"Les cordonnées d''''un point"

** Justification.**

	->interface-DrGPointFreeItem

	Le noms d''une règle est formé du nom de la méthode où elle figure suivi d''un tiret et du nom propre à la règle, parfois suivi d''un indice. 
	
**Remarque**

	Les règles sont des méthodes de la classe ExpertRegle. 
	Ces règles sont conservées lorsque l''on sauve la méthode..
	
	On peut aussi sauvegarder une règle par copier /coller dans un éditeur de textes et l''exécuter comme un script.
      ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_121Segment
^(EruditeBookSection basicNew title: '1.2.1 Segment'; document: ((EruditeDocument contents: '!!!!1.2. Segments.

**Rappel.**//

Euclide : Définition 2, « une ligne est une longueur sans largeur. »

Euclide : Définition 3, « les extrémités d’une ligne sont des points. »

Euclide : Définition 4, « La ligne droite est celle qui est également placée entre ses points. » ( Euclide défini comme droite ce qui est pour nous un segment. Si on marche le long d''une droite le pied gauche se déplace de la même distance que le pied droit. (-> également placée entre ses points.).

Euclide : Demande 1, « Entre deux points on peut toujours tracer une droite.(Un segment avec les définitions actuelles). 

Euclide : Demande 2, « On peut toujours prolonger indéfiniment une droite tracée entre deux points.
(Euclide demande ce qui est actuellement une droite. Si tu trace un segment en appuyant une règle sur deux points, tu peux continuer le tracé au de là des points.

Cette demande est toujours satisfaite pour la géométrie plane, elle n''est pas toujours vérifiée , par exemple, sur une sphère, les extrémités d''un segment peuvent se rejoindre en un même point, le pôle).


Aide-mémoire  p.90 : « La droite A B est constituée d''une infinité de points alignés avec A et B »
Aide-mémoire  p.90 : « Un segment est une portion de droite limitée par deux points. » //

!!!!1.2.1.  Segments.
 1.2.1.1  Chargement ou Script de la Figure.

[[[
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifierun modèle, utilise vérifier du menu Expert'' style: true. 
a := f point: (-4.5@ -6).a nommer: ''A''.
b := f point:6@6.b nommer:''B''.
sAB:= f segmentDe: a à: b.
sAB nommer: ''sAB''.
c :=f pointSurLigne: sAB à:  0.8.
c nommer: ''C''.
e :=f expert.
e initFaits .
e lisFigure.
e chargeRegles:''Euclide:''.
e deduis.
e modèlesQuestions .
f presenter expertInspect. ]]] doItWithButton: Charger la figure et les modèles de questions.

[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert''  string: ''
"1.2.1.1 Segments."
f := DrGeoFigure new.
a := f point: (-4.5@ -6).a nommer: ''''A''''.
b := f point:6@6.b nommer:''''B''''.
sAB:= f segmentDe: a à: b.
sAB nommer: ''''sAB''''.
c :=f pointSurLigne: sAB à:  0.8.
c nommer: ''''C''''.
e :=f expert.
e initFaits .
e lisFigure.
e chargeRegles:''''Euclide:''''.
e deduis.
e modèlesQuestions .
'']]] doItWithButton: copier le script de la figure pour l''exécuter.

**Les points.**

A et B sont des points libres,ce sont les extrémités du segment, tu peux les déplacer.  

C est un point sur le segment, peux le déplacer, mais il reste sur le segment.
Ce point C reste sur le segment si tu déplace A ou B.

**Le segment.**
Le segment avec ses extrémités.
segment ?x1 ?x2
[[[f presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''segment ?x1 ?x2''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

e verifieCondition:''segment ?x1 ?x2''
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''segment ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''exécuter.

**Les parents.**

Pour un segment, les parents sont les extrémités du segment.

parent1 ?x1 ?x2
parent2 ?x3 ?x4

[[[f presenter expertDisplayTutor:''
parent1 ?x1 ?x2
parent2 ?x3 ?x4'']]] doItWithButton: copier pour vérifier avec le menu Expert.

e verifieCondition:''parent1 ?x1 ?x2
e verifieCondition:''parent2 ?x3 ?x4''
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''parent1 ?x1 ?x2
parent2 ?x3 ?x4''''
'']]] doItWithButton:copier le code pour l''exécuter.


') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_122Droite
^(EruditeBookSection basicNew title: '1.2.2 Droite'; document: ((EruditeDocument contents: '!!!!1.2.2. Droites
1.2. Segments et droites.
Euclide : Définition 2, « **Une ligne est une longueur sans largeur. **»
Euclide : Définition 3, « **Les extrémités d’une ligne sont des points. **»
Euclide : Définition 4, « **La ligne droite est celle qui est également placée entre ses points. **» //
Si on marche le long d''une droite le pied gauche se déplace de la même distance que le pied droit.
Sur une sphère  les méridiens sont des droites mais pas les parallèles, les pas ne sont pas de même taille de chaque côté d''un parallèle.Tous les paralléles sont de taille différente.)//
Euclide : Demande 1, « **Entre deux points on peut toujours tracer une droite.* de chaque*»//( Euclide défini comme droite ce qui est pour nous un segment.) //

Euclide : Demande 2, « **On peut toujours prolonger indéfiniment une droite tracée entre deux points.**»
//(Euclide demande ce qui est pour nous une droite. Cette demande est toujours satisfaite pour la géométrie plane, elle n''est pas toujours vérifiée , par exemple, sur un sphère, les extrémités d''un segment peuvent se rejoindre en un même point.)//

Aide-mémoire  p.90 : « **La droite A B est constituée d''une infinité de points alignés avec A et B **»
Aide-mémoire  p.90 : « **Un segment est une portion de droite limitée par deux points. »

**Script de la figure**
 1.2.1Charger la figure ou le Script de la Figure.

[[[
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifief un modèle, utilise vérifier du menu Exprt'' style: true.
f expert:e.
e drgeo:f.
e chargeRegles: ''Euclide''.
a := f point: 0@0.
a nommer: ''A''.
b := f point: 2@6.
b nommer: ''B''. 
d := f  droitePassantPar: a et: b.d nommer: ''dAB''.
p:= f  pointSurLigne: d à: 0.9.p nommer:  ''P''.
f presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
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
'']]] doItWithButton: copier le script de la figure pour l''exécuter.

**Points sur une droite**

Le  prédicat **pointsSur:rep:** permet d''avoir la liste des points sur une droite.
Les points sont ordonnés dans le sens de la droite.

droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts.''style:true]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''.
[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''e verifieCondition: ''''
droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''''.'']]] doItWithButton: copier le code pour l''exécuter.

**Position d''un point par rapport à un autre.**

La question **position  ?point  ?position ?pointRéférence ?droite** permet d''obtenir la positions relative ?position  des points  ?point et ?pointRéférence sur la droite ?droite.

position  ?point  ?position ?pointRéférence ?droite
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
position  ?point  ?position ?pointRéférence ?droite'']style true]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''position  ?point  ?position ?pointRéférence ?droite''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''position  ?point  ?position ?pointRéférence ?droite''''.
'' ]]] doItWithButton: copier ce code pour l''exécuter.

**Parents**
Les parents d''une droite sont les points sur lesquels s''appuient la droite.

parent1 ?x1 ?x2
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''parent1 ?x1 ?x2''style:true]]] doItWithButton: copier pour vérifier avec le menu Expert.

e verifieCondition:''parent1 ?x1 ?x2''
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
e verifieCondition: ''''parent1 ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''exécuter.

parent2 ?x1 ?x2
[[[f presenter expertDisplayTutor:''parent2 ?x1 ?x2'']]] doItWithButton: copier pour vérifier avec le menu Expert.

e verifieCondition:''parent2 ?x1 ?x2''
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''parent2 ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''exécuter.

**Remarque.**
 
On peut remplacer une variable par une valeur pour limiter la recherche aux réponses qui concernent cette variable.

position P ?x2 ?x3 ?x4
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
position P ?x2 ?x3 ?x4
'' style:true]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.
 
e verifieCondition: ''position P ?x2 ?x3 ?x4''.
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''position P ?x2 ?x3 ?x4''''.'' ]]] doItWithButton:copier ce code pour l''exécuter.


 ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_122Droite_1221ParallèlesEtPerpendiculaires;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/14/2025 00:25:30'!
section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_122Droite_1221Parallèles
^(EruditeBookSection basicNew title: '1.2.2.1 Parallèles'; document: ((EruditeDocument contents: '!!!!!! 1.2.2.1 Parallèles

Euclide : Définition 35, « Les parallèles sont des droites qui, étant situées dans un même  plan, et étant prolongées à l''infini de part et d''autre, ne se rencontrent ni d''un côté ni de l''autre. »
Euclide : Demande 4, « Tous les angles droits sont égaux entre eux. »Euclide : Demande 5, « Si une droite, tombant sur deux droites, fait les angles intérieurs du même côté plus petits que deux droits, ces droites, prolongées à l''infini, se rencontreront du côté où les angles sont plus petits que deux droits. » 
Remarque 1: Lorsque les angles sont égaux à deux droits, la condition de la demande 5 n''est pas réalisée, Dans ce cas, les droites ne se rencontrent jamais, ce qui répond aux conditions de la définition 35, donc les droites sont parallèles.

Remarque 2 : Cette demande 35 définit la géométrie Euclidienne, elle n''est plus satisfaite si la surface n''est pas plane, Deux droites sur une sphère se rejoignent en deux points appelés pôles.

Aide-mémoire p.94: « Deux droites parallèles sont deux droites qui n''ont aucun point commun ou tous les points communs ( droites confondues ). »
Aide-mémoire p. 94: Propriété 1 des droites paralllèles et perpendiculaires:
« Si deux droites sont perpendiculaires à une troisième, elles sont parallèles. »
	C''est le cas limite de la demande 5.de Euclide lorsque les angles sont deux angles droits.
 1.2.2.2 Script de la figure.

[[["1.2.2,2  Parallèles."
f  := DrGeoFigure new.
e:= f expert.
a := f point: 0 @ 1. a nommer: ''A''.
b := f point: 0 @ -1. b nommer: ''B''.
d1 := f droitePassantPar: a et: b.
d2 := f perpendiculaireA:  d1 passantPar:a.
d3 := f perpendiculaireA: d1 passantPar: b.
e chargeRegles: ''Euclide:''.
f presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.

[[[ f presenter expertDisplayTutor: ''"1.2.2,2  Parallèles."
f  := DrGeoFigure new.
e:= f expert.
a := f point: 0 @ 1. a nommer: ''''A''''.
b := f point: 0 @ -1. b nommer: ''''B''''.
d1 := f droitePassantPar: a et: b.
d2 := f perpendiculaireA:  d1 passantPar:a.
d3 := f perpendiculaireA: d1 passantPar: b.
e initFaits.
e lisFigure.
e chargeRegles: ''''Euclide:''''.
e deduis.
e modèlesQuestions .
'' ]]] doItWithButton: copier le script de la figure pour l''exécuter.

**Relation parallèle.**
La relation **parallele** est une relation d''équivalence, les relations d''équi	valence sont vérifiées par la question 
**relationCréée  ?x1 ?x2 parallèle**.

relationCréée  ?x1 ?x2 parallèle
[[[f presenter expertDisplayTutor:''
relationCréée  ?x1 ?x2 parallèle
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.
 
e verifieCondition: ''relationCréée  ?x1 ?x2 parallèle''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''relationCréée  ?x1 ?x2 parallèle''''.'' ]]] doItWithButton:copier ce code pour l''exécuter.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_122Droite_1221ParallèlesEtPerpendiculaires
^(EruditeBookSection basicNew title: '1.2.2.1 Parallèles et perpendiculaires.'; document: ((EruditeDocument contents: '!!!!!!1.2,4 .1 Demi-droite

Aide-mémoire  p.90 : « Une demi-droite est une portion de droite limitée par un point.  Ce point est appelé l’origine de la demi-droite. »s
lesQuestions .

[[[f:= DrGeoFigure nouveau.
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert
'' style: true.
a := f point: (-6 @ -3).a nommer: ''A''.
b := f point: (0  @ 2).b nommer: ''B''.
d:= f  demiDroiteOrigine: a passantPar:b.d nommer: ''d''. 
p:= f pointSurLigne: d à: 0.95.p nommer: ''P''.
p1:= f pointSurLigne: d à: 0.96.p1 nommer: ''P1''.
e:= f expert.
e initFaits.
e lisFigure.
e  chargeRegles:''Euclide''.
f presenter expertInspect
]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
"1.2,4 Demi-droite"
f := f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-6 @ -3).a nommer: ''''A''''.
b := f point: (0  @ 2).b nommer: ''''B''''.
d:= f  demiDroiteOrigine: a passantPar:b.d nommer: ''''d''''. 
p:= f pointSurLigne: d à: 0.95.p nommer: ''''P''''.
p1:= f pointSurLigne: d à: 0.96.p1 nommer: ''''P1''''.
e :=f expert.
e initFaits.
e lisFigure.
e  chargeRegles:''''Euclide''''.
e deduis..
e modèlesQuestions .
''
]]] doItWithButton:copier le script de la figure pour l''exécuter.

**Afficher les points sur la demi-droite.**

pointsSur d ?pts
[[[f presenter expertDisplayTutor:''
pointsSur d ?pts
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''pointsSur d ?pts''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''pointsSur d ?pts''''.
'']]] doItWithButton: ccopier le code pour l''exécuter.

**La position relative de deux points sur la droite.**

position P ?pos B d
[[[f presenter expertDisplayTutor:''
position P ?pos B d
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''position P ?pos B d''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''position P ?pos B d''''.
'']]] doItWithButton: copier le code pour l''exécuter.

**Abscisse curviligne.**
Pour la position d''un point sur une ligne, tu peux utiliser l''**abscisse curviligne**, cette abscisse repère la longuer de la ligne  qui sépare le point d''un point origine.

point P
abcisseDe:sur:rep: P d ?abcsP
[[[f presenter expertDisplayTutor:''
point P
abcisseDe:sur:rep: P d ?abcsP
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
point ?p
abcisseDe:sur:rep: P d ?abcsP''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
point P
abcisseDe:sur:rep: P d ?abcsP''''.''
]]] doItWithButton: copier le code pour l''exécuter.
 
Tu peux aussi  afficher l''abscisse du point sur la ligne avec le menu de la figure: **Edition/Propriété** et cliquer sur le point.

**Trois points sur une droite déterminent deux demi-droites.**

[[[
"1.2,4 Demi-droite"
f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-4 @ -3).a nommer: ''A''.
b := f point: (3  @ 2).b nommer: ''B''.
d:= f  droitePassantPar: a  et: b . d nommer: ''d''. 
p:= f pointSurLigne: d à: 0.8943.p nommer: ''P''.
dd1 := f demiDroiteOrigine: p passantPar: b.
dd1 couleur: Color red.
dd2 := f demiDroiteOrigine: p passantPar: a.
dd1 nommer: ''dd1''.
dd2 nommer: ''dd2''.
dd2 couleur: Color green.
e  chargeRegles:''Euclide''.
e:= f expert.
e initFaits.
e lisFigure.
f presenter expertInspect
]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[f presenter expertDisplayTutor:''
"Demi-droites sur une droite"
f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-4 @ -3).a nommer: ''''A''''.
b := f point: (3  @ 2).b nommer: ''''B''''.
d:= f  droitePassantPar: a  et: b . d nommer: ''''d''''. 
p:= f pointSurLigne: d à: 0.8943.p nommer: ''''P''''.
dd1 := f demiDroiteOrigine: p passantPar: b.
dd1 couleur: Color red.
dd2 := f demiDroiteOrigine: p passantPar: a.
dd1 nommer: ''''dd1''''.
dd2 nommer: ''''dd2''''.
dd2 couleur: Color green.
e  chargeRegles:''''Euclide''''.
e:= f expert.
e initFaits.
e lisFigure.
e deduis.
e modèlesQuestions .
''
]]] doItWithButton:copier le script de la figure pour l''exécuter.

** Montrer les demi-droites**

demi-droiteSur  ?x1 ?x2
[[[f presenter expertDisplayTutor:''
demi-droiteSur  ?x1 ?x2''
]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
demi-droiteSur  ?x1 ?x2''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
demi-droiteSur  ?x1 ?x2''''''
]]] doItWithButton: copier le code pour l''exécuter.

**position des points sur les demi-droites**
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 
[[[f presenter expertDisplayTutor:''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''
]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''''''
]]] doItWithButton: copier le code pour l''exécuter.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_123DemiDroite
^(EruditeBookSection basicNew title: '1.2.3 Demi-Droite '; document: ((EruditeDocument contents: '!!!!!!1.2,4 .1 Demi-droite

Aide-mémoire  p.90 : « Une demi-droite est une portion de droite limitée par un point.  Ce point est appelé l’origine de la demi-droite. »s
lesQuestions .

[[[f:= DrGeoFigure nouveau.
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert
'' style: true.
a := f point: (-6 @ -3).a nommer: ''A''.
b := f point: (0  @ 2).b nommer: ''B''.
d:= f  demiDroiteOrigine: a passantPar:b.d nommer: ''d''. 
p:= f pointSurLigne: d à: 0.95.p nommer: ''P''.
p1:= f pointSurLigne: d à: 0.96.p1 nommer: ''P1''.
e:= f expert.
e initFaits.
e lisFigure.
e  chargeRegles:''Euclide''.
f presenter expertInspect
]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
"1.2,4 Demi-droite"
f := f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-6 @ -3).a nommer: ''''A''''.
b := f point: (0  @ 2).b nommer: ''''B''''.
d:= f  demiDroiteOrigine: a passantPar:b.d nommer: ''''d''''. 
p:= f pointSurLigne: d à: 0.95.p nommer: ''''P''''.
p1:= f pointSurLigne: d à: 0.96.p1 nommer: ''''P1''''.
e :=f expert.
e initFaits.
e lisFigure.
e  chargeRegles:''''Euclide''''.
e deduis..
e modèlesQuestions .
''
]]] doItWithButton:copier le script de la figure pour l''exécuter.

**Afficher les points sur la demi-droite.**

pointsSur d ?pts
[[[f presenter expertDisplayTutor:''
pointsSur d ?pts
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''pointsSur d ?pts''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''pointsSur d ?pts''''.
'']]] doItWithButton: ccopier le code pour l''exécuter.

**La position relative de deux points sur la droite.**

position P ?pos B d
[[[f presenter expertDisplayTutor:''
position P ?pos B d
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''position P ?pos B d''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''position P ?pos B d''''.
'']]] doItWithButton: copier le code pour l''exécuter.

**Abscisse curviligne.**
Pour la position d''un point sur une ligne, tu peux utiliser l''**abscisse curviligne**, cette abscisse repère la longuer de la ligne  qui sépare le point d''un point origine.

point P
abcisseDe:sur:rep: P d ?abcsP
[[[f presenter expertDisplayTutor:''
point P
abcisseDe:sur:rep: P d ?abcsP
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
point ?p
abcisseDe:sur:rep: P d ?abcsP''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
point P
abcisseDe:sur:rep: P d ?abcsP''''.''
]]] doItWithButton: copier le code pour l''exécuter.
 
Tu peux aussi  afficher l''abscisse du point sur la ligne avec le menu de la figure: **Edition/Propriété** et cliquer sur le point.

**Trois points sur une droite déterminent deux demi-droites.**

[[[
"1.2,4 Demi-droite"
f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-4 @ -3).a nommer: ''A''.
b := f point: (3  @ 2).b nommer: ''B''.
d:= f  droitePassantPar: a  et: b . d nommer: ''d''. 
p:= f pointSurLigne: d à: 0.8943.p nommer: ''P''.
dd1 := f demiDroiteOrigine: p passantPar: b.
dd1 couleur: Color red.
dd2 := f demiDroiteOrigine: p passantPar: a.
dd1 nommer: ''dd1''.
dd2 nommer: ''dd2''.
dd2 couleur: Color green.
e  chargeRegles:''Euclide''.
e:= f expert.
e initFaits.
e lisFigure.
f presenter expertInspect
]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[f presenter expertDisplayTutor:''
"Demi-droites sur une droite"
f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-4 @ -3).a nommer: ''''A''''.
b := f point: (3  @ 2).b nommer: ''''B''''.
d:= f  droitePassantPar: a  et: b . d nommer: ''''d''''. 
p:= f pointSurLigne: d à: 0.8943.p nommer: ''''P''''.
dd1 := f demiDroiteOrigine: p passantPar: b.
dd1 couleur: Color red.
dd2 := f demiDroiteOrigine: p passantPar: a.
dd1 nommer: ''''dd1''''.
dd2 nommer: ''''dd2''''.
dd2 couleur: Color green.
e  chargeRegles:''''Euclide''''.
e:= f expert.
e initFaits.
e lisFigure.
e deduis.
e modèlesQuestions .
''
]]] doItWithButton:copier le script de la figure pour l''exécuter.

** Montrer les demi-droites**

demi-droiteSur  ?x1 ?x2
[[[f presenter expertDisplayTutor:''
demi-droiteSur  ?x1 ?x2''
]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
demi-droiteSur  ?x1 ?x2''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
demi-droiteSur  ?x1 ?x2''''''
]]] doItWithButton: copier le code pour l''exécuter.

**position des points sur les demi-droites**
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 
[[[f presenter expertDisplayTutor:''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''
]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''''''
]]] doItWithButton: copier le code pour l''exécuter.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 5/26/2025 11:35:10'!
section_Expert_GéométrieEtSystèmeExpert_11PointSegmentEtDroite_123DemiDroite_1231DemiDroiteSurDroite
^(EruditeBookSection basicNew title: '1.2.3.1 Demi-Droite sur Droite'; document: ((EruditeDocument contents: '!!!!!! 1.2.3 Demi-Droite sur Droite

1.2.3.1 Script de la figure.

	"1.2.3.1 Demi-Droite sur Droite"
f :=DrGeoFigure nouveau .
a:=f point:(-2@-2). a nommer:''A''.
b:=f point:(2@2). b nommer:''B''. 
dr:=f  droitePassantPar:  a et: b.
p1 :=f pointSurLigne: dr à: 0.9.p1 nommer:''P1''.
dd1:= f demiDroiteOrigine: p1 passantPar: b.
dd1 couleur: Color green.
dd2:= f demiDroiteOrigine: p1 passantPar: a.
dd2  couleur: Color  blue.
e :=f expert.
e initFaits.
e lisFigure.
e deduis.
e modèlesQuestions .
[[[f presenter expertDisplayTutor:''	"1.2.3.1 Demi-Droite sur Droite"
f :=DrGeoFigure nouveau .
a:=f point:(-2@-2). a nommer:''''A''''.
b:=f point:(2@2). b nommer:''''B''''. 
dr:=f  droitePassantPar:  a et: b.
p1 :=f pointSurLigne: dr à: 0.9.p1 nommer:''''P1''''.
dd1:= f demiDroiteOrigine: p1 passantPar: b.
dd1 couleur: Color green.
dd2:= f demiDroiteOrigine: p1 passantPar: a.
dd2  couleur: Color  blue.
e :=f expert.
e initFaits.
e lisFigure.
e deduis.
e modèlesQuestions .''
]]] doItWithButton: copier l''exemple.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 5/26/2025 16:16:25'!
section_Expert_GéométrieEtSystèmeExpert_13Angle
^(EruditeBookSection basicNew title: '1.3 Angle '; document: ((EruditeDocument contents: '1.3 Angles

Euclide : Définition 8, «  angle plan est l''inclinaison mutuelle de deux lignes qui se touchent dans un plan, et  qui ne sont pas placées dans la même direction. ».

Euclide : Définition 9, « Lorsque des lignes qui comprennent un angle sont des droites, l''angle se nomme rectiligne ».

Aide-mémoire  p.101 : « Un angle est une portion du plan limitée par deux demi-droites de même origine. L''origine est appelée sommet de l''angle et les demi-droites sont les côtés.

Aide-mémoire  p.  90 : « Une demi-droite est une portion de droite limitée par un point. Ce point est
appelé l’origine de la demi-droite.. ».') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_13Angle_131AngleEntreDemidroite;
        add: self section_Expert_GéométrieEtSystèmeExpert_13Angle_132AngleEntreDroites;
        add: self section_Expert_GéométrieEtSystèmeExpert_13Angle_133AngleEntreParallèles;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_13Angles
^(EruditeBookSection basicNew title: '1.3 Angles '; document: ((EruditeDocument contents: '1.3 Angles

Euclide : Définition 8, «  angle plan est l''inclinaison mutuelle de deux lignes qui se touchent dans un plan, et  qui ne sont pas placées dans la même direction. ».

Euclide : Définition 9, « Lorsque des lignes qui comprennent un angle sont des droites, l''angle se nomme rectiligne ».

Aide-mémoire  p.101 : « Un angle est une portion du plan limitée par deux demi-droites de même origine. L''origine est appelée sommet de l''angle et les demi-droites sont les côtés.

Aide-mémoire  p.  90 : « Une demi-droite est une portion de droite limitée par un point. Ce point est
appelé l’origine de la demi-droite.. ».') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_13Angles_131AngleEntreDemidroite;
        add: self section_Expert_GéométrieEtSystèmeExpert_13Angles_132AngleEntreDroites;
        add: self section_Expert_GéométrieEtSystèmeExpert_13Angles_133AngleEntreParallèles;
        add: self section_Expert_GéométrieEtSystèmeExpert_13Angles_134AngleObtuAigudroit;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_13Angles_131AngleEntreDemidroite
^(EruditeBookSection basicNew title: '1.3.1 Angle entre demi-droite'; document: ((EruditeDocument contents: '!!!!!!1.3.1 Angle entre demi-droite

**Angle nul, plat, saillant ou entrant.**
Un angle avec les demi-droites confondues est dit **angle nul** (0 degrés).

Un angle avec les demi-drioites opposées est dit **angéle plat** (180 degrés).

Un angle entre l''''angle nul et l''''angle plat ( angle entre 0 et 180 degrés) est dit **angle saillant**.

Un angle plus grand que l''''angle plat ( plus grand que 180 degrés)  est  dit **angle entrant**.

[[[ 

f := DrGeoFigure nouveau.
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert
'' style: true.
e:= Expert nouveau.
f expert: e.
e drgeo:f.
e chargeRegles:''Euclide:''.
a := f point: 0@0.a nommer: ''A''.
s := f point:  -3@0.s nommer: ''S''.
cer:= f cercleCentre: s rayon: 3.
cer cacher.
b  :=f pointSurLigne: cer à: 0.3755.b nommer: ''B''.
b couleur: Color green.
dd1 := f demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := f pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := f demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := f pointSurLigne: dd2 à: 0.9.
d nommer: ''D''.
f segmentDe: s à: d.
f angleSommet: s de:  a à: b.
f angleSommet: s de:  b à: a.
a1:=f arcCenter: s  from: a to: b.
a1 couleur: Color blue.
a2:=f arcCenter: s  from: b  to: a.
a2 couleur: Color red.
p := f pointSurLigne: dd1 à: 0.9774.
dr := f demiDroiteOrigine: p  passantPar: b.dr nommer:''dr''.
dr cacher.
perp := f perpendiculaireA: dd1 passantPar: s.   
pd1 := f pointSurLigne: perp à: 0.9678.
pd2 := f pointSurLigne: perp à: 0.0290..
demiPerp1:=f demiDroiteOrigine: s passantPar: pd1.
demiPerp2:=f demiDroiteOrigine: s passantPar: pd2.
saillant := f intersectionDe: demiPerp1 et: dr.
entrant := f intersectionDe: demiPerp2 et: dr.
(saillant  morph mathItem )exist 
ifTrue:[ saillant nommer:''angle saillant''.saillant couleur: Color blue.].
entrant := f intersectionDe: demiPerp2 et: dr.  
b1:= b mathItem point.
b déplacerA: -5.4 @-1.8. f actualiser.
(entrant  morph mathItem) exist
ifTrue:[ entrant nommer:''angle entrant''.entrant couleur: Color blue.].
b déplacerA: b1.
f actualiser.
dd2 morph mathItem .
demiPerp1 cacher.
demiPerp2 cacher.
perp cacher.
pd1 cacher.
pd2 cacher.
dr cacher.
f centrerVueEn: s mathItem  point.
f texte: ''déplace le point b
observe l''''angle bleu'' à: -8@7.7.
]]] doItWithButton: Tester les angles.

**Angles entre demi-droites.**

[[[f := DrGeoFigure nouveau.
f expert: e.
f échelle: 18.
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
e drgeo:f.
e chargeRegles:''Euclide:''.
a := f point: 0@0.a nommer: ''A''.
b := f point: 0@12.b nommer: ''B''.
s := f point:  -9@4.s nommer: ''S''.
dd1 := f demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := f pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := f demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := f pointSurLigne: dd2 à: 0.9.
d nommer: ''D''.
ang := f angleSommet: s de: c à: d.
ang nommer: ''<)''.
f presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.

[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
"1.3.1.1  Script de la Figure."
f := DrGeoFigure nouveau.
f échelle: 18.
f expert: e.
e drgeo:f.
e chargeRegles:''''Euclide:''''.
a := f point: 0@0.a nommer: ''''A''''.
b := f point: 0@12.b nommer: ''''B''''.
s := f point:  -9@4.s nommer: ''''S''''.
dd1 := f demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''''dd1''''.
c := f pointSurLigne: dd1 à: 0.9.c nommer: ''''C''''.
dd2 := f demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''''dd2''''.
d := f pointSurLigne: dd2 à: 0.9.
ang := f angleSommet: s de: c à: d.
ang nommer: ''''<)''''.
e := f expert.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
''
]]] doItWithButton:Charger le script de la figure.

**Angles équivalents**

Des angles avec le même sommets que l''angle de base et des extrémités sur les mêmes demi-droites sont équivalents.
Une relation est créée entre l''angle de base et un angle.

relationCréée ?x1 ?x2 ?x3
[[[f presenter expertDisplayTutor:''Géométrie et Système Expert'' string:''
relationCréée ?x1 ?x2 ?x4
'' style:true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
e verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier le code.

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

 **Représentation des relations d''équivalence.**

Les règles qui affirment des relations d''équivalence ont une conclusion **relation créée** pour garder la trace des relations créées.

Une relation d''équivalence entre objets a la propriété de partager l''ensemble des objets en classes d''objets équivalents, deux objets équivalents se retrouvent dans la même classe, pour vérifier si deux objets sont équivalents, il suffit de vérifier si ils appartiennent à la même classe, ce qui est rapide; on n''affirme que certains faits qui sont équivalents, mais la relation a aussi d''autres faits équivalents en raison des propriétés de transitivité et de commutativité de la relation d''équivalence. 

On peut comparer tous les éléments de la classe à un élément choisi comme représentant de la classe,

Pour les angles, le représentant est l''angle0.
Pour des fractions, le représentant est la fraction irréductible.

On peut voir l''ensemble des relations avec le prédicat **relation:rep:**

Dans cet exemple tous les angles sont équivalent et se retrouvent dans le même ensemble représenté par une liste.

point A
relation:rep: équivalent ?res
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
point A
relation:rep: équivalent ?res''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''
point A
relation:rep: équivalent ?res''
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
e verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier le code.


On voit que tous les angles équivalents se trouvent dans le même sous ensemble.
//Dans cet exemple il n''y a qu''un sous ensemble puisqu''''il n''''y qu''''un angle de base.//

**Remarques:**

Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents dans une conclusion. 

Pour vérifier une condition, il faut au moins une affirmation, c''est pour ça que l''affirmation vraie **point A**  est ajoutée au début de la condition à vérifier.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_13Angles_132AngleEntreDroites
^(EruditeBookSection basicNew title: '1.3.2 Angle entre droites'; document: ((EruditeDocument contents: ' !!!!!!1.3.2. Angle entre droites

"1.3.1.1  Script de la Figure."

**Patientez le chargement  peut prendre du temps**

[[[f := DrGeoFigure new. 
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert
'' style: true.

e := f expert.
e chargeRegles:''Euclide:''.
a := f point:-8@8.a nommer: ''A''.
c := f point: 4@-5.c nommer: ''C''.
b := f point: -8@-1.b nommer: ''B''.
d:= f point: 7@7.d nommer: ''D''.
dd1 := f droitePassantPar: c et: a .
dd1 nommer: ''dd1''.
dd2 := f droitePassantPar: d et: b.
dd2 nommer: ''dd2''.
i:=f  intersectionDe: dd1 et: dd2.
i nommer: ''I''.
f presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.
 
[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
"1.3.1.1  Script de la Figure."
f := DrGeoFigure new.
e := f expert.
e chargeRegles:''''Euclide:''''.
a := f point:-8@8.a nommer: ''''A''''.
c := f point: 4@-5.c nommer: ''''C''''.
b := f point: -8@-1.b nommer: ''''B''''.
d:= f point: 7@7.d nommer: ''''D''''.
dd1 := f droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := f droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=f  intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
''
]]] doItWithButton: Charger le script de la figure.

**Angles plats**
angle0  ?x1 [ classement: plat ]
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ classement: plat ]
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ classement: plat ]''
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''angle0  ?x1 [ classement: plat ]''''.
''
]]] doItWithButton: copier le code pour l''exécuter.

**Angles non plats**
angle0  ?x1 [ classement: nonPlat ]
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ classement: nonPlat ]
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

angle0  ?x1 [ classement: nonPlat ]
e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''angle0  ?x1 [ classement: nonPlat ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles adjacents**

Deux angles sont adjacents s''ils ont un côté en commun.

angle0 ?x1  [ adjacent:  ?x2  ]  
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0 ?x1  [ adjacent:  ?x2  ]  '' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0 ?x1  [ adjacent:  ?x2  ]''.
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0 ?x1  [ adjacent:  ?x2  ]''''.''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles opposés**
Deux angles sont opposés si leurs côtés sont des demi-droites opposées.

angle0 ?x1  [ opposé:  ?x2  ]  
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0 ?x1  [ opposé:  ?x2  ]  '' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0 ?x1  [ opposé: ?x2  ]''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''angle0 ?x1  [ opposé: ?x2  ]''''.''
]]] doItWithButton:copier le code pour l''exécuter.:

**Angles supplémentaires**
Deux angles sont supplémentaires si ils sont adjacents et forment ensembles un angle plat.

angle0 ?x1  [ supplémentaire:  ?x2  ]  
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0 ?x1  [ supplémentaire:  ?x2  ]  '' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0 ?x1  [ supplémentaire: ?x2  ]''.
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0 ?x1  [ supplémentaire: ?x2  ]''''.''
]]] doItWithButton:copier le code pour l''exécuter.

**position d''un angle**
La position d''un angle est donnée par la position de ses côtés par rapport à son sommet.

angle0 ?x1  [ position:  ?x2  ]  
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0 ?x1  [ position:  ?x2  ]  '' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0 ?x1  [ position: ?x2  ]''.
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0 ?x1  [ position: ?x2  ]''''.''
]]] doItWithButton:copier le code pour l''exécuter.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_13Angles_133AngleEntreParallèles
^(EruditeBookSection basicNew title: '1.3.3 Angle entre parallèles'; document: ((EruditeDocument contents: '!!!!!! 1.3.3 Angle entre parallèles

1.3.3.1  Script de la Figure.

**Les déductions prennent du temps,Patientez.**

[[[f :=DrGeoFigure nouveau.
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
e initRegles.
e := f expert.e chargeRegles: ''Euclide''.
f afficherAxes .
a := f  point: -4.5@1.5.a nommer: ''A''.		
b:= f  point: 4.5@5.b nommer: ''B''.
c:= f  point: 0@-4.5.c nommer: ''C''.
dr:=f droitePassantPar: a et: b.dr nommer: ''dr''.
par:= f parallèleA: dr passantPar: c.par nommer: ''par''.
d := f  pointSurLigne: par à: 0.9484.d nommer: ''D''.
pe:= f  point: 4.5@-6.pe nommer: ''E''.
pf:=f point: -3@6.pf nommer: ''F''.
trans := f droitePassantPar: pe et: pf.trans nommer: ''trans''.
i1:= f intersectionDe: dr et: trans.i1 nommer: ''I1''.
i2:= f intersectionDe: par et: trans.i2 nommer: ''I2''. 
f presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.
 
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:'' 
"1.3.3.1  Script de la Figure."
f := DrGeoFigure new.
e := f expert.
e chargeRegles:''''Euclide:''''.
a := f point:-8@8.a nommer: ''''A''''.
c := f point: 4@-5.c nommer: ''''C''''.
b := f point: -8@-1.b nommer: ''''B''''.
d:= f point: 7@7.d nommer: ''''D''''.
dd1 := f droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := f droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=f  intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
e initFaits .
e lisFigure.
e deduis.
e modèlesQuestions .
''f := DrGeoFigure new. 
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0  ?x1 [ classement: nonPlat ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles adjacents.**

angle0  ?x1 [ adjacent:  ?x2 ] 
[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ adjacent:  ?x2 ] 
''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ adjacent:  ?x2 ] ''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''angle0  ?x1 [ adjacent:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles supplémentaires**

angle0  ?x1 [ supplémentaire:  ?x2 ] 
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ supplémentaire:  ?x2 ] 
''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ supplémentaire:  ?x2 ] ''.
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0  ?x1 [ supplémentaire:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles opposés.**

angle0  ?x1 [ opposé:  ?x2 ] 
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ opposé:  ?x2 ] 
''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ opposé:  ?x2 ] ''.
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0  ?x1 [ opposé:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.


**Angles alterneInternes**
angle0  ?x1 [ alterneinterne:  ?x2 ] 
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ alterneInterne:  ?x2 ] 
''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ alterneInterne:  ?x2 ]  ]''.
[[[f presenter expertDisplayTutor''Géométrie  et Système Expert'' string::''
e verifieCondition: ''''angle0  ?x1 [ alterneInterne:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.



**Angles alterneExternes**
 angle0  ?x1  [ alterneExterne:  ?x2 ]
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1  [ alterneExterne:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ alterneExterne:  ?x2 ] ]''.
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0  ?x1 [ alterneExterne:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/10/2025 01:41:56'!
section_Expert_GéométrieEtSystèmeExpert_13Angles_133AngleEntreParallèles_134AngleObtuAigudroitperpendiculaire
^(EruditeBookSection basicNew title: '1.3.4 Angle obtu, aigu,droit,perpendiculaire.'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 8/28/2025 03:12:33'!
section_Expert_GéométrieEtSystèmeExpert_13Angles_134AngleObtuAigudroit
^(EruditeBookSection basicNew title: '1.3.4 Angle obtu, aigu,droit.'; document: ((EruditeDocument contents: '
!!!!!!1.3.4 Angle obtu, aigu,droit,perpendiculaire.


Euclide : Définition 11, « L''angle obtus est celui qui est plus grand qu''un droit. » 
Euclide : Définition 12, « L''angle aigu est celui qui est plus petit qu''un droit »
Euclide : Définition 10, « Lorsqu''une droite tombant sur une droite fait deux angles de suite égaux, chacun des angles égaux est droit, et la droite placée au-dessus est dite perpendiculaire à celle sur laquelle elle est placée.»

Aide-mémoire p.103: « Un angle obtus est un angle dont la mesure est omprise entre 90° et 180°. »
Aide-mémoire p.103: « Un angle aigu est un angle dont la mesure est comprise entre 0° et 90°. »

Aide-mémoire p.103: « Un angle droit est un angle dont la mesure est 90°. »
Aide-mémoire p.  93: « Deux droites perpendiculaires sont deux droites qui se coupent à angles droits .»

**Remarque: **« La définition de Euclide pour l''angle droit est l''angle qui partage en deux angles égaux.
Pour Euclide l''égalité de deux objets géométriques, se constate si on peut superposer exactement ces objets, éventuellement en en retournant un »


**1.3.4.1  Script de la figure.**

[[[f :=DrGeoFigure  nouveau.

" Angle obtu, aigu,droit,perpendiculaire."
	f texte: ''Déplacer le point A'' à: -9.5@8.5 .
	o:= f point: (-6@0). o nommer: ''O''.
	f centrerVueEn: o.
	f centrerVueEn: o.
	o1:= f point: (-6.1@0). o1 nommer: ''O1''.o1 cacher.
	o2:= f point: (-5.9@0). o2 nommer: ''O2''.o2 cacher.
	seg := f segmentDe:-5.8@7 à: -6.1@7.
	seg nommer:''''.seg cacher.
	b:=f point: 0@0. b nommer: ''B''.
	d1:=f droitePassantPar: o et: b.
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	a:=f point: -6@6. a nommer: ''A''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp1:= f perpendiculaireA: d1 passantPar: o1.
	perp2:= f perpendiculaireA: d1 passantPar: o2.
	perp  pointillé.
	perp nommer:''perp''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''droit''.
	p1 :=f point: (-3 @6).
	p2 :=f point: (-9 @6).
	s1:=f segmentDe: p1 à: a.
	s2:=f segmentDe: p2 à: a.
	p1 cacher.
	p2 cacher.
	s1 cacher.
	s2 cacher.
	a déplacerA: -2 @5.
		f actualiser.
	aigu:= f intersectionDe:  perp2 et: s2.
	aigu nommer: ''aigu''.
	perp1 cacher.
	perp2 cacher.
	a déplacerA: -9  @5.
	f actualiser.
	obtu:= f intersectionDe:  perp1 et: s1.
	obtu nommer: ''obtus''.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''<)''.
	mesureangle :=  ang  morph mathItem 	degreeAngle rounded
	]]] doItWithButton: Charger la démonstration.
ou
[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string:''
" Angle obtu, aigu,droit,perpendiculaire."
	f :=DrGeoFigure  nouveau. 
	f texte: ''''Déplacer le point A'''' à: -9.5@8.5 .
	o:= f point: (-6@0). o nommer: ''''O''''.
	f centrerVueEn: o.
	f centrerVueEn: o.
	o1:= f point: (-6.1@0). o1 nommer: ''''O1''''.o1 cacher.
	o2:= f point: (-5.9@0). o2 nommer: ''''O2''''.o2 cacher.
	seg := f segmentDe:-5.8@7 à: -6.1@7.
	seg nommer:''''seg''''.seg cacher.
	b:=f point: 0@0. b nommer: ''''B''''.
	d1:=f droitePassantPar: o et: b.
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	a:=f point: -6@6. a nommer: ''''A''''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp1:= f perpendiculaireA: d1 passantPar: o1.
	perp2:= f perpendiculaireA: d1 passantPar: o2.
	perp  pointillé.
	perp nommer:''''perp''''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''''droit''''.
	p1 :=f point: (-3 @6).
	p2 :=f point: (-9 @6).
	s1:=f segmentDe: p1 à: a.
	s2:=f segmentDe: p2 à: a.
	p1 cacher.
	p2 cacher.
	s1 cacher.
	s2 cacher.
	a déplacerA: -2 @5.
		f actualiser.
	aigu:= f intersectionDe:  perp2 et: s2.
	aigu nommer: ''''aigu''''.
	perp1 cacher.
	perp2 cacher.
	a déplacerA: -9  @5.
	f actualiser.
	obtu:= f intersectionDe:  perp1 et: s1.
	obtu nommer: ''''obtus''''.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''''<)''''.
	mesureangle :=  ang  morph mathItem 	degreeAngle rounded.
'']]] doItWithButton: Copier le code de la démonstration.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/11/2025 18:20:53'!
section_Expert_GéométrieEtSystèmeExpert_13Angles_134AngleObtuAigudroitperpendiculaire
^(EruditeBookSection basicNew title: '1.3.4 Angle obtu, aigu,droit,perpendiculaire.'; document: ((EruditeDocument contents: '
!!!!!!1.3.4 Angle obtu, aigu,droit,perpendiculaire.


Euclide : Définition 11, « L''angle obtus est celui qui est plus grand qu''un droit. » 
Euclide : Définition 12, « L''angle aigu est celui qui est plus petit qu''un droit »
Euclide : Définition 10, « Lorsqu''une droite tombant sur une droite fait deux angles de suite égaux, chacun des angles égaux est droit, et la droite placée au-dessus est dite perpendiculaire à celle sur laquelle elle est placée.»

Aide-mémoire p.103: « Un angle obtus est un angle dont la mesure est omprise entre 90° et 180°. »
Aide-mémoire p.103: « Un angle aigu est un angle dont la mesure est comprise entre 0° et 90°. »
Il y a plusieurs manières de distinguer un angle obtus d''un angle aigu.La plus proche des définitions est la comparaison avec l''angle droit, si les extrémités de l''angle sont du même côté de la perpendiculaire  issue du sommet, l''angle est aigu,si non il est obtus.
On trace une droite passant par les extrémités de l''angle et l''on observe la position de l''intersection de cette droite avec la perpendiculaire issue du sommet de l''angle,
Aide-mémoire p.103: « Un angle droit est un angle dont la mesure est 90°. »
Aide-mémoire p.  93: « Deux droites perpendiculaires sont deux droites qui se coupent à angles droits .»

**Remarque: **« La définition de Euclide pour l''angle droit utilise une égalité et non une mesure pour définir l''angle droit. Pour Euclide l''égalité de deux objets géométriques, se constate si on peut superposer exactement ces objets, éventuellement en en retournant un »


**1.3.4.1  Script de la figure.**

[[[" Angle obtu, aigu,droit,perpendiculaire."
	f :=DrGeoFigure  nouveau.
	o:= f point: (-6@0). o nommer: ''O''.
		seg := f segmentDe:-5.9@7 à: -6.1@7.
		seg nommer:''''.
	b:=f point: 0@0. b nommer: ''B''.
	d1:=f droitePassantPar: o et: b.
	a:=f point: -6@6. a nommer: ''A''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	perp nommer:''perp''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''droit''.
	p1 :=f point: (-9 @6).
	p2 :=f point: (9 @6).
	p1 cacher.
	p2 cacher.
	s1:=f segmentDe: p1 à: a.
	s1 cacher.
	s2:=f segmentDe: p2 à: a.
	s2 cacher.
	aigu:= f intersectionDe:  perp et: s1.
	aigu nommer: ''aigu''.
	obtu:= f intersectionDe:  perp et: s2.
	obtu nommer: ''obtu''.
	a déplacerA: -2 @5.
	f actualiser.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
ang nommer:''<)''.
	mesureangle :=  ang  morph mathItem degreeAngle rounded.  	
f presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions. 
ou
[[[f presenter expertDisplayTutor:''
" Angle obtu, aigu,droit,perpendiculaire."
	f :=DrGeoFigure  nouveau.
	o:= f point: (-6@0). o nommer: ''''O''''.
		seg := f segmentDe:-5.9@7 à: -6.1@7.
		seg nommer:''''''''.
	b:=f point: 0@0. b nommer: ''''B''''.
	d1:=f droitePassantPar: o et: b.
	a:=f point: -6@6. a nommer: ''''A''''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	perp nommer:''''perp''''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''''droit''''.
	p1 :=f point: (-9 @6).
	p2 :=f point: (9 @6).
	p1 cacher.
	p2 cacher.
	s1:=f segmentDe: p1 à: a.
	s1 cacher.
	s2:=f segmentDe: p2 à: a.
	s2 cacher.
	aigu:= f intersectionDe:  perp et: s1.
	aigu nommer: ''''aigu''''.
	obtu:= f intersectionDe:  perp et: s2.
	obtu nommer: ''''obtu''''.
	a déplacerA: -2 @5.
	f actualiser.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''''<)''''.
	mesureangle :=  ang  morph mathItem degreeAngle rounded.
	f centrerVueEn: o.
  	e modèlesQuestions.
'']]] doItWithButton: Copier le script de la figure.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 5/26/2025 16:16:25'!
section_Expert_GéométrieEtSystèmeExpert_13Angle_131AngleEntreDemidroite
^(EruditeBookSection basicNew title: '1.3.1 Angle entre demi-droite'; document: ((EruditeDocument contents: ' !!!!!!1.3.1. Angle entre demi-droites

**Angle nul, plat, saillant ou entrant.**
Un angle avec les demi-droiites confondues est dit **angle nul** (0 degrés).

Un angle avec les demi-drioites opposées est dit **angéle plat** (180 degrés).

Un angle entre l''angle nul et l''angle plat ( angle entre 0 et 180 degrés) est dit **angle saillant**.

Un angle plus grand que l''angle plat ( plus grand que 180 degrés)  est  dit **angle entrant**.

[[[ f := DrGeoFigure nouveau.
e:= Expert nouveau.
f expert: e.
e drgeo:f.
e chargeRegles:''Euclide:''.
e chargeRegles:''angles:''.
a := f point: 0@0.a nommer: ''A''.
s := f point:  -3@0.s nommer: ''S''.
cer:= f cercleCentre: s rayon: 3.
cer cacher.
b  :=f pointSurLigne: cer à: 0.3755.b nommer: ''B''.
dd1 := f demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := f pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := f demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := f pointSurLigne: dd2 à: 0.9.
d nommer: ''D''.
f segmentDe: s à: d.
f angleSommet: s de:  a à: b.
f angleSommet: s de:  b à: a.
a1:=f arcCenter: s  from: a to: b.
a1 couleur: Color blue.
a2:=f arcCenter: s  from: b  to: a.
a2 couleur: Color red.
p := f pointSurLigne: dd1 à: 0.9774.
dr := f demiDroiteOrigine: p  passantPar: b.dr nommer:''dr''.
dr cacher.
perp := f perpendiculaireA: dd1 passantPar: s.   
pd1 := f pointSurLigne: perp à: 0.9678.
pd2 := f pointSurLigne: perp à: 0.0290..
demiPerp1:=f demiDroiteOrigine: s passantPar: pd1.
demiPerp2:=f demiDroiteOrigine: s passantPar: pd2.
saillant := f intersectionDe: demiPerp1 et: dr.
entrant := f intersectionDe: demiPerp2 et: dr.
(saillant  morph mathItem )exist 
ifTrue:[ saillant nommer:''angle saillant''.saillant couleur: Color blue.].
entrant := f intersectionDe: demiPerp2 et: dr.  
b1:= b mathItem point.
b déplacerA: -5.4 @-1.8. f actualiser.
(entrant  morph mathItem) exist
ifTrue:[ entrant nommer:''angle entrant''.entrant couleur: Color blue.].
b déplacerA: b1.
f actualiser.
dd2 morph mathItem .
demiPerp1 cacher.
demiPerp2 cacher.
perp cacher.
pd1 cacher.
pd2 cacher.
dr cacher.
f centrerVueEn: s mathItem  point.
f texte: ''déplace le point b
observe l''''angle bleu'' à: -8@7.7.
]]] doItWithButton: Tester les angles.

**Angles entre demi-droites.**

[[[f := DrGeoFigure nouveau.
f expert: e.
f échelle: 18.
e drgeo:f.
e chargeRegles:''Euclide:''.
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
f presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.

[[[f presenter expertDisplayTutor:''
"1.3.1.1  Script de la Figure."
f := DrGeoFigure nouveau.
f échelle: 18.
f expert: e.
e drgeo:f.
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
''
]]] doItWithButton:Charger le script de la figure.


Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

 **Représentation des relations d''équivalence.**
Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents dans une conclusion. 

Les règles qui affirment des relations d''équivalence on une conclusion **relation créée** pour garder la trace des relations créées.

relationCréée ?x1 ?x2 ?x3
[[[f presenter expertDisplayTutor:''
relationCréée ?x1 ?x2 ?x3
''
]]] doItWithButton: vérifier ce modèle de questiion  par le menu Expert.

e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier le code.

Une relation d''équivalence entre objets a la propriété de partager l''ensemble des objets en classes d''objets équivalents, deux objets équivalents se retrouvent dans la même classe, pour vérifier si deux objets sont équivalents, il suffit de vérifier si ils appartiennent à la même classe, ce qui est rapide; on n''affirme que certains faits qui sont équivalents, mais la relation a aussi d''autres faits équivalents en raison des propriétés de transitivité et de commutativité de la relation d''équivalence. 

On peut comparer tous les éléments de la classe à un élément choisi comme représentant de la classe,

Pour les angles, le représentant est l''angle0.
Pour des fractions, le représentant est la fraction irréductible.

On peut voir l''ensemble des relations avec le prédicat **relation:rep:**

Dans cet exemple tous les angles sont équivalent et se retrouvent dans le même ensemble représenté par une liste.

point A
relation:rep: équivalent ?res
[[[f presenter expertDisplayTutor:''
point A
relation:rep: équivalent ?res''
]]] doItWithButton: vérifier ce modèle de questiion  par le menu Expert.

e verifieCondition: ''
point A
relation:rep: équivalent ?res''
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier le code.


On voit que tous les angles équivalents se trouvent dans le même sous ensemble.
//Dans cet exemple il n''y a qu''un sous ensemble puisqu''il n''y qu''un angle de base.//

**Remarque:**
Pour vérifier une condition, il faut au moins une affirmation, c''est pour ça que l''affirmation vraie **point A**  est ajoutée au début de la condition à vérifier.




') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 5/26/2025 16:16:25'!
section_Expert_GéométrieEtSystèmeExpert_13Angle_132AngleEntreDroites
^(EruditeBookSection basicNew title: '1.3.2 Angle entre droites'; document: ((EruditeDocument contents: ' !!!!!!1.3.2. Angle entre droites

"1.3.1.1  Script de la Figure."
f := DrGeoFigure new.
e := f expert.
e chargeRegles:''Euclide:''.
a := f point:-8@8.a nommer: ''A''.
c := f point: 4@-5.c nommer: ''C''.
b := f point: -8@-1.b nommer: ''B''.
d:= f point: 7@7.d nommer: ''D''.
dd1 := f droitePassantPar: c et: a .
dd1 nommer: ''dd1''.
dd1 := f droitePassandd1 nommer: ''dd1''.
dd2 := f droitePassantPar: d et: b.
dd2 nommer: ''dd2''.
i:= f intersectionDe: dd1 et: dd2.
i nommer: ''I''.
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
[[[f presenter expertDisplayTutor:'' "1.3.1.1  Script de la Figure."
f := DrGeoFigure new.
e := f expert.
e chargeRegles:''''Euclide:''''.
a := f point:-8@8.a nommer: ''''A''''.
c := f point: 4@-5.c nommer: ''''C''''.
b := f point: -8@-1.b nommer: ''''B''''.
d:= f point: 7@7.d nommer: ''''D''''.
dd1 := f droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := f droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=f  intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
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
different:de:  [ ?y1 ?s ?y2 ] ?x0.
"''
]]] doItWithButton: copier l''exemple.

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier l''exemple.


Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents séparément lorsqu''on vérifie la relation dans une règle. 
On n''affirme que certains faits sont équivalents mais la relation a aussi d''autres faits équivalents par exemple les angles  [ A S B ] et [ C S B ] sont aussi équivalents et il y a encore d''autres relations, en fait on peut regrouper dans un ensemble tous les angles qui sont équivalents entre eux et il suffit de tester s''il sont dans le même ensemble pour savoir qu''ils sont équivalents.

e verifieCondition: ''point A
relation:rep: équivalent ?res''
e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''e verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier l''exemple.

On voit que tous lea angles équivalents se trouvent dans le même ensemble.

Remarque:

il ne peut pas y avoir que des prédicats dans une condition, il faut au moins une affirmation à vérifier, c''est pour ça que l''affirmation vraie **point A**  est au début de la condition à vérifier-
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 5/26/2025 16:16:25'!
section_Expert_GéométrieEtSystèmeExpert_13Angle_133AngleEntreParallèles
^(EruditeBookSection basicNew title: '1.3.3 Angle entre parallèles'; document: ((EruditeDocument contents: '!!!!!! 1.3.3 Angle entre parallèles

"1.3.3 Angle entre parallèles"
f :=DrGeoFigure nouveau.
e initRegles.
e := f expert.e chargeRegles: ''interface''.
e := f expert.e chargeRegles: ''angles''.
f afficherAxes .
a := f  point: -4.5@1.5.a nommer: ''A''.		
b:= f  point: 4.5@5.b nommer: ''B''.
c:= f  point: 0@-4.5.c nommer: ''C''.
dr:=f droitePassantPar: a et: b.dr nommer: ''dr''.
par:= f parallèleA: dr passantPar: c.par nommer: ''par''.
d := f  pointSurLigne: par à: 0.9484.d nommer: ''D''.
e:= f  point: 4.5@-6.e nommer: ''E''.
pf:=f point: -3@6.pf nommer: ''F''.
trans := f droitePassantPar: e et: pf.trans nommer: ''trans''.
i1:= f intersectionDe: dr et: trans.i1 nommer: ''I1''.
i2:= f intersectionDe: par et: trans.i2 nommer: ''I2''.

[[[f presenter expertDisplayTutor:'' 
"1.3.3 Angle entre parallèles"
f :=DrGeoFigure nouveau.
e initRegles.
e := f expert.e chargeRegles: ''''interface''''.
e := f expert.e chargeRegles: ''''angles''''.
f afficherAxes .
a := f  point: -4.5@1.5.a nommer: ''''A''''.		
b:= f  point: 4.5@5.b nommer: ''''B''''.
c:= f  point: 0@-4.5.c nommer: ''''C''''.
dr:=f droitePassantPar: a et: b.dr nommer: ''''dr''''.
par:= f parallèleA: dr passantPar: c.par nommer: ''''par''''.
d := f  pointSurLigne: par à: 0.9484.d nommer: ''''D''''.
pe:= f  point: 4.5@-6.pe nommer: ''''E''''.
pf:=f point: -3@6.pf nommer: ''''F''''.
trans := f droitePassantPar: pe et: pf.trans nommer: ''''trans''''.
i1:= f intersectionDe: dr et: trans.i1 nommer: ''''I1''''.
i2:= f intersectionDe: par et: trans.i2 nommer: ''''I2''''.
''
]]] doItWithButton: copier l''exemple.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite
^(EruditeBookSection basicNew title: '1 point segment et droite'; document: ((EruditeDocument contents: '!!!! point, segment, droite.
**1.1 point.**
Euclide :  Définition 1, « le point est ce dont la partie est nulle ».

**1.2. Segments et droites.**
Euclide : Définition 2, « **Une ligne est une longueur sans largeur. **»
Euclide : Définition 3, « **Les extrémités d’une ligne sont des points.** »
Euclide : Définition 4, « **La ligne droite est celle qui est également placée entre ses points. **» 
Si on marche le long d''une droite le pied gauche se déplace de la même distance que le pied droit.
//Sur une sphère  les méridiens sont des droites mais pas les parallèles, les pas ne sont pas de même taille de chaque côté d''un parallèle.Tous les parallèles sont de taille différente.)//

Euclide : Demande 1, « **Entre deux points on peut toujours tracer une droite.**»//
( Euclide défini comme droite ce qui est pour nous un segment.) //
Cette définition permet à Euclide de définir sa droite comme le plus court chemin entre deux points.

Euclide : Demande 2, « **On peut toujours prolonger indéfiniment une droite tracée entre deux points.**»
//
On peut prolonger une droite en utilisant une règle et en déplaçant la règle de manière à ce que son bord se confonde avec la partie de droite déjà construite.

Cette demande est toujours satisfaite pour la géométrie plane, elle n''est pas toujours vérifiée , par exemple, sur un sphère, les extrémités d''un segment peuvent se rejoindre en un même point.)//

Aide-mémoire  p.90 : « **La droite A B est constituée d''une infinité de points alignés avec A et B **»
Aide-mémoire  p.90 : « **Un segment est une portion de droite limitée par deux points. **»
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_11Point;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_12Segment;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Droite;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_14DemiDroite;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/6/2024 00:08:37'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_11LePoint
^(EruditeBookSection basicNew title: '1.1 Le point'; document: ((EruditeDocument contents: '!!!!!!!! 1.1 point

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
	On peut sauvegarder une règle par copier /coller.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_11Point
^(EruditeBookSection basicNew title: '1.1 Point'; document: ((EruditeDocument contents: '!!!! 1.1 point

Euclide : « Définition 1, le point est ce dont la partie est nulle ».


**1.1.1 La figure**

La figure montre un point avec une ordonnée  positive et montre un point avec une ordonnée négative.

[[[ fig :=DrGeoFigure nouveau.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert point'' string: ''Pour vérifierun modèle, utilise vérifier du menu Expert'' style: true. .
fig afficherAxes .
a := fig point: 0@2.
a nommer: ''positif''.	
a := fig point: 0@-2.
a nommer: ''négati''.	
exp := fig expert.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
fig presenter expertInspect. ]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig := DrGeoFigure  nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert point''  string: ''
fig afficherAxes .
a := fig point: 0@2.
a nommer: ''''positif''''.	
a := fig point: 0@-2.
a nommer: ''''négati''''.	
exp := fig expert.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
"
exp verifieCondition: ''''point ?x1''''.
exp verifieCondition: ''''point ?x1
pont:rep: ?x1 ?pos''''.
exp verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x:
y:rep: ?pos ?y. "
'']]] doItWithButton: copier le script de la figure pour l''''exécuter.

On peut vérifier une conjonction de plusieurs conditions ou prédicats.

**point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition: ''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y''''.
'']]] doItWithButton:copier le code pour l''''exécuter.


	**Remarques:**

	**Objet point.**
	**(3@5)** est l''objet numérique point de smallTalk, il contient une paire de coordonnées sèparèes par **@**.


	**1.1.2 Prédicats.**
	Un prédicat est formé de la suite des sélecteurs, **point:rep:** suivie des arguments  **?x1 ?pos**/.

	**Exemples:**

	Le prédicat **point:rep:** permet d''obenir la position d''un point.
	
	Les prédicats **x:rep:** et **y:rep:**  permettent d''avoir les coordonnées x et y d''un point.

**point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition: ''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y''''.
'']]] doItWithButton:copier le code pour l''''exécuter.
	
	**1.1.3 Commentaires.**

	Un commentaire qui peut être associé à une règle pour préciser en terme de géométrie l''action de la règle. Ces commentaires sont précédés d''une astérisque.
	
	//* Qualification d''un point,// 

	Un commentaire associé à un 	prédicat est entre guillemets.
	
	//"Les cordonnées d''''un point"//

	**1.1.4 Justification**.
	->interface-DrGPointFreeItem

	Le noms d''une règle est formé du nom de la méthode où elle figure suivi d''un tiret et du nom propre à la règle, parfois suivi d''un indice. 
	
	**1.1.5 Règles prédéfinies.**

	Les règles prédéfinies sont des méthodes de la classe ExpertRegle. 
	Ces règles sont conservées si l''on sauve la session.
	
	On peut aussi sauvegarder des règles par copier /coller dans un éditeur de textes et l''exécuter dans un espace de travail comme un script.
      ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_11Point_112DistanceEntrePoints;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_11Point_112DistanceEntrePoints
^(EruditeBookSection basicNew title: '1.1.2 Distance entre points'; document: ((EruditeDocument contents: '!!!! 1.1.2 Distance entre points

	**Rappels:**

	Euclide : Définition 1, « **Le point est ce dont la partie est nulle **».
	Euclide : Définition 2, «**Une ligne est une longueur sans largeur.** »
	Euclide : Définition 3, «**Les extrémités d’une ligne sont des points.** »
	Euclide : Définition 4, ** ligne droite est celle qui est également placée entre ses points.** » 

	1.1.2.1 ** La figure.**
[[[ fig presenter drawable  ifNil: [ fig := DrGeoFigure nouveau. exp := fig expert ].
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert point'' string: ''Pour vérifierun modèle, utilise vérifier du menu Expert'' style: true. 
fig afficherAxes .
a := fig point: 0@0.
a nommer: ''A''.	
b := fig point: 4@3.
b nommer: ''B''.	
dist :=fig  distanceDe:a à:b.
dist déplacerA: 0@2.
fig actualiser.
fig échelle: 50..
exp := fig expert.
exp chargeRegles: ''Euclide''.
exp chargeRegles: ''mesure''.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
fig presenter expertInspect. ]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig :=DrGeoFigure nouveau.
 fig presenter drawable  ifNil: [ fig := DrGeoFigure nouveau. exp := fig expert ].
fig presenter expertDisplayTutor:''Géométrie  et Système Expert point''  string: ''
fig afficherAxes .
a := fig point: 0@0.
a nommer: ''''A''''.	
b := fig point: 4@3.
b nommer: ''''B''''.	
dist :=fig  distanceDe:a à:b.
dist déplacerA: 0@2.
fig actualiser.
exp := fig expert.
exp chargeRegles: ''''Euclide''''.
exp chargeRegles: ''''mesure''''.
.exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
"
exp verifieCondition: ''''mesure  ?x1 ?x2''''.
exp verifieCondition: ''''point ?x1''''. "
'']]] doItWithButton: copier le script de la figure pour l''''exécuter.

	**1.1.2.2 Mesure**

		**Mesure de la distance.**

       mesure ?x1 ?x2

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
 mesure ?x1 ?x2''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

	exp vérifieCondition:''mesure ?x1 ?x2''.

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''mesure ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''''exécuter.

		**Mesure avec la provenance.**
 
      mesure ?x1 ?x2 ?x3  

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
 mesure ?x1 ?x2 ?x3''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

	exp vérifieCondition:''mesure ?x1 ?x2 ?x3''.

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''mesure ?x1 ?x2 ?x3''''
'']]] doItWithButton:copier le code pour l''''exécuter.

**Remarque:**
	?x3 indique si la mesure provient d''une 		valeur donnée dans  la fgure ou provient de la conclusion d''une règle.

		**Valeur produite par une règle.**

[[[ fig presenter drawable  ifNil: [ fig := DrGeoFigure nouveau. exp := fig expert ].
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert point'' string: ''Pour vérifierun modèle, utilise vérifier du menu Expert'' style: true. 
fig afficherAxes .
a := fig point: 0@0.
a nommer: ''A''.	
b := fig point: 4@3.
b nommer: ''B''.	
fig échelle: 50..
exp := fig expert.
exp chargeRegles: ''Euclide''.
exp chargeRegles: ''mesure''.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
fig presenter expertInspect. ]]] doItWithButton: Charger la figure sans distance  et les modèles de questions.

[[[ fig presenter drawable  ifNil: [ fig := DrGeoFigure nouveau. exp := fig expert ].
fig presenter expertDisplayTutor:''Géométrie  et Système Expert point''  string: ''
fig afficherAxes .
a := fig point: 0@0.
a nommer: ''''A''''.	
b := fig point: 4@3.
b nommer: ''''B''''.	
exp := fig expert.
exp chargeRegles: ''''Euclide''''.
exp chargeRegles: ''''mesure''''.
.exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
"
exp verifieCondition: ''''mesure  ?x1 ?x2''''.
exp verifieCondition: ''''point ?x1''''. "
'']]] doItWithButton: copier le script de la figure sans distance pour l''''exécuter.

**Vérification.**

La distance est calculée et placée dans la variable  ?res.

		point  ?x1
		point  ?x2
		**distanceDe:à:rep: ?x1 ?x2 ?res**

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

		exp verifieCondition: ''point  ?x1
		point  ?x2
		**distanceDe:à:rep: ?x1 ?x2 ?res**

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.


		On obtient 4 réponses parce  le système expert essaie toutes les combinaisons de deux points.
		
		A A   A B   B A   B B

		Tu peux préciser la question en demandant **deux points différents**.

		point  ?x1
		point  ?x2
		**different:de: ?x1 ?x2**
		distanceDe:à:rep: ?x1 ?x2 ?res

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res
different:de: ?x1 ?x2''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.
		
		exp verifieCondition: ''point  ?x1
		point  ?x2
		**different:de: ?x1 ?x2**
		distanceDe:à:rep: ?x1 ?x2 ?res'' 

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''point  ?x1
point  ?x2
different:de: ?x1 ?x2
distanceDe:à:rep: ?x1 ?x2 ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.

		Tu peux encore plus préciser la question en demandant **des points dans l''ordre alphabétique de leurs noms.**
		
				
		point  ?x1
		point  ?x2
		different:de: ?x1 ?x2
		**ordonneMot:et:rep1:rep2:  ?x 1 ?x2 ?x1 ?x2**
		distanceDe:à:rep: ?x1 ?x2 ?res


[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point  ?x1
point  ?x2
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep2:  ?x1 ?x2 ?x1 ?x2
distanceDe:à:rep: ?x1 ?x2 ?res''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

		exp verifieCondition: ''
		point  ?x1
		point  ?x2
		different:de: ?x1 ?x2
		**ordonneMot:et:rep1:rep2: ?x1 ?x2 ?x1  ?x2**
		distanceDe:à:rep: ?x1 ?x2 ?res

:
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''point  ?x1
point  ?x2
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep2:  ?x1 ?x2 ?x1 ?x2 
distanceDe:à:rep: ?x1 ?x2 ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.

		**Remarque**
		La valeur de la distance affichée dans la figure se modifie si tu déplaces les points.
	
		Le système expert évalue la situation quand il lit la figure, pour une situation changée, il faut une nouvelle lecture.



') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 3/2/2025 01:48:52'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 3/2/2025 01:48:52'!
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
pointsSur:rep: ?x1 ?pts''''.'']]] doItWithButton: copier l''exemple.


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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/6/2024 00:08:37'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_122Droites
^(EruditeBookSection basicNew title: '1.2.2 droites'; document: ((EruditeDocument contents: '!!!!!!!!La droite
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

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 3/2/2025 01:48:52'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/30/2024 12:04:44'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_12LaDroite
^(EruditeBookSection basicNew title: '1.2 La droite'; document: ((EruditeDocument contents: '!!!! 1.1 Le point.

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

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_12Segment
^(EruditeBookSection basicNew title: '1.2 Segment'; document: ((EruditeDocument contents: ' ''!!!!1.2. Segments.

	**Rappel.**//

Euclide : Définition 2, « une ligne est une longueur sans largeur. »

Euclide : Définition 3, « les extrémités d’une ligne sont des points. »

Euclide : Définition 4, « La ligne droite est celle qui est également placée entre ses points. » 
	( Euclide défini comme droite ce qui est pour nous un segment. Si on marche le long d''''une droite le pied gauche se déplace de la même distance que le pied droit. (-> également placée entre ses points.).

Euclide : Demande 1, « Entre deux points on peut toujours tracer une droite.(Un segment avec les définitions actuelles). 

Euclide : Demande 2, « On peut toujours prolonger indéfiniment une droite tracée entre deux points.
	(Euclide demande ce qui est actuellement une droite. Si tu trace un segment en appuyant une règle sur deux points, tu peux continuer le tracé au de là des points.

	Cette demande est toujours satisfaite pour la géométrie plane, elle n''''est pas toujours vérifiée , par exemple, sur une sphère, les extrémités d''''un segment peuvent se rejoindre en un même point, le pôle).


Aide-mémoire  p.90 : « La droite A B est constituée d''''une infinité de points alignés avec A et B »
Aide-mémoire  p.90 : « Un segment est une portion de droite limitée par deux points. » //

	**1.4.1  La figure.**

[[[fig := DrGeoFigure nouveau.

"1.2.1.1 Segments."..
fig échelle:15.
a := fig point: (-4.5@ -6).a nommer: ''A''.
b := fig point:6@6.b nommer:''B''.
sAB:= fig segmentDe: a à: b.
sAB nommer: ''sAB''.
c :=fig pointSurLigne: sAB à:  0.8.
c nommer: ''C''.
exp   :=fig expert.
exp   initFaits .
exp   lisFigure.
exp   chargeRegles:''Euclide''.
exp   deduis.
fig  presenter expertInspect: ''Géométrie et Système Expert Segment'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert''  string: ''
"1.2.1.1 Segments.".
fig échelle:15.
a := fig point: (-4.5@ -6).a nommer: ''''A''''.
b := fig point:6@6.b nommer:''''B''''.
sAB:= fig segmentDe: a à: b.
sAB nommer: ''''sAB''''.
c :=fig pointSurLigne: sAB à:  0.8.
c nommer: ''''C''''.
exp   :=fig expert.
exp   initFaits .
exp   lisFigure.
exp   chargeRegles:''''Euclide''''.
exp   deduis.
exp   modèlesQuestions .
'']]] doItWithButton: copier le script de la figure pour l''''exécuter.

	**1.4.2 Les points.**

A et B sont des points libres,ce sont les extrémités du segment, tu peux les déplacer.  

C est un point sur le segment,tu peux le déplacer, mais il reste sur le segment.
Ce point C reste sur le segment si tu déplace A ou B.

**pointSur sAB ?p**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''pointSur sAB ?p''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition: ''pointsur sAB ?p''**
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''pointSur sAB ?p''''
'']]] doItWithButton:copier le code pour l''''exécuter.


	**1.4.3 Le segment.**

Le segment avec ses extrémités.

**segment ?x1 ?x2**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''segment ?x1 ?x2''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition:''segment ?x1 ?x2''.**
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''segment ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''''exécuter.

	**1.4.4 Les parents.**

Pour un segment, les parents sont les extrémités du segment.

**parent1 ?x1 ?x2
parent2 ?x1 ?x4**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:
''
parent1 ?x1 ?x2
parent2 ?x3 ?x4'' style:true]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition:''parent1 ?x1 ?x2
parent2 ?x3 ?x4''**
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''parent1 ?x1 ?x2
parent2 ?x3 ?x4''''
'']]] doItWithButton:copier le code pour l''''exécuter.

	**1.4.5 Les couples.**

**coupleSur ?s ?couple**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:
''coupleSur ?s ?couple'' style:true]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition:''coupleSur ?s ?couple''**
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''coupleSur ?s ?couple''''
'']]] doItWithButton:copier le code pour l''''exécuter.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_12Segment_121LignePolygonales;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_12Segment_122LignePolygonaleFerméee;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_12Segment_121LignePolygonales
^(EruditeBookSection basicNew title: '1.2.1 Ligne Polygonales'; document: ((EruditeDocument contents: '!!!!1.2.1 Ligne Polygonale 

Une ligne **polygonale** est une suite de segments adjacents.


1.2.1.1 **La Figure**

[[[fig := DrGeoFigure nouveau.
"1.2.1.1 lignes polygonales"
a := fig point: 6@0. a nommer: ''A''.
b := fig point: 0@4.5. b nommer: ''B''.
c := fig point: -6@3. c nommer: ''C''.
d := fig point: -6@-4.5. d nommer: ''D''.
sAB := fig segmentDe: a à: b.sAB  nommer: ''sAB''.
sBC := fig segmentDe: b à: c. sBC nommer: ''sBC''.
sCD := fig segmentDe: c à: d. sCD nommer: ''sCD''.
exp   :=fig expert.
exp   initFaits .
exp   lisFigure.
exp   chargeRegles:''EuclideMinimum''.
exp   deduis.
fig  presenter expertInspect: ''Géométrie et Système Expert Segment'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig :=DrGeoFigure nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert''  string: ''
"1.2.1.1 lignes polygonales"
a := fig point: 6@0.a nommer: ''''A''''.
b := fig point: 0@4.5.b nommer: ''''B''''.
c := fig point: -6@3.c nommer: ''''C''''.
d := fig point: -6@-4.5.d nommer: ''''D''''.
sAB := fig segmentDe: a à: b. sAB  nommer: ''''sAB''''.
sBC := fig segmentDe: b à: c. sBC nommer: ''''sBC''''.
sCD := fig segmentDe: c à: d. sCD  nommer: ''''sCD''''.

exp   :=fig expert.
exp   initFaits .
exp   lisFigure.
exp   chargeRegles:''''Euclide''''.
exp   deduis.
exp   :=fig expert.
exp   initFaits .
exp   lisFigure.
exp   chargeRegles:''''EuclideMinimum''''.
exp   deduis.
exp   modèlesQuestions .
'']]] doItWithButton: copier le script de la figure pour l''''exécuter.

	**La ligne polygonale**

	La ligne polygonale est affichée avec le nom des segments et leurs extrémités.

**lignePolygonale  ?x1**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
lignePolygonale ?x1''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.
A
**adjacent  ?x1 ?x2 ?x3 ?x4 ?x5 ?x1**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
lignePolygonale ?x1''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition: ''adjacent  ?x1 ?x2 ?x3 ?x4 ?x5  ?x1''**
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''adjacent  ?x1 ?x2 ?x3 ?x4 ?x5  ?x1''''
'']]] doItWithButton:copier le code pour l''''exécuter.

	**Sommets de la ligne polygonale**

**sommets  ?x1**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
sommets  ?x1''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition: ''adjacent  ?x1 ?x2 ?x3 ?x4 ?x5''**
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''lsommets  ?x1''''
'']]] doItWithButton:copier le code pour l''''exécuter.

**Remarques**

La base de données est dite **dynamique** parce qu''elle change en raison des retraits, les faits son marqés **retiré** et ne sont plus pris en compte dans les règles. 

	**Retraits**
**lignePolygonale  ?x1 ?x2**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
lignePolygonale  ?x1 ?x2''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition: ''lignePolygonale  ?x1 ?x2''**
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''lignePolygonale  ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''''exécuter.

La règle qui consruit la ligne polygonale est récursive, elle utilise sa propre conclusion dans sa condition.
elle reprend une liste pour ajouter un élément nouveau et allonger cette liste. 

	exp
		lisRegle: ''polygones-lignePolygonaleSuite1''
		si:
			''**lignePolygonale ?l**
dernier:rep: ?l ?s
premier:rep: ?s ?sp
adjacent ?sp ?s2 ?a ?b ?c
ajouteDernierUnique:el:rep: ?l [ ?s2   ?b ?c ] ?l2''
		alors: ''**lignePolygonale ?l2**''
		com: ''Une lignePolygonale qui peut être fermée par un dernier segment''.


') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_12Segment_122LignePolygonaleFerméee
^(EruditeBookSection basicNew title: '1.2.2 Ligne Polygonale ferméee'; document: ((EruditeDocument contents: '!!!!1.2.1 Ligne Polygonale ferméee

Si le **dernier segment** d''une ligne polygonale a une **extrémité en commun** avec le **premier** on a une **ligne polygonale fermée.**

La figure constituée par une **ligne polygonale fermée** est un **polygone**

1.2.1.1 **La Figure**

[[[fig := DrGeoFigure nouveau.
"1.2.1.1 lignes polygonales"
a := fig point: 6@0. a nommer: ''A''.
b := fig point: 0@4.5. b nommer: ''B''.
c := fig point: -6@3. c nommer: ''C''.
d := fig point: -6@-4.5. d nommer: ''D''.
sAB := fig segmentDe: a à: b.sAB  nommer: ''sAB''.
sBC := fig segmentDe: b à: c. sBC nommer: ''sBC''.
sCD := fig segmentDe: c à: d. sCD nommer: ''sCD''.
sDA := fig segmentDe: d à: a. sDA nommer: ''sDA''.
exp   :=fig expert.
exp   initFaits .
exp   lisFigure.
exp   chargeRegles:''EuclideMinimum''.
exp   deduis.
fig  presenter expertInspect: ''Géométrie et Système Expert Segment'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig :=DrGeoFigure nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert''  string: ''
"1.2.1.1 lignes polygonales"
a := fig point: 6@0.a nommer: ''''A''''.
b := fig point: 0@4.5.b nommer: ''''B''''.
c := fig point: -6@3.c nommer: ''''C''''.
d := fig point: -6@-4.5.d nommer: ''''D''''.
sAB := fig segmentDe: a à: b. sAB  nommer: ''''sAB''''.
sBC := fig segmentDe: b à: c. sBC nommer: ''''sBC''''.
sCD := fig segmentDe: c à: d. sCD  nommer: ''''sCD''''.
sDA := fig segmentDe: d à: a. sDA nommer: ''''sDA''''. 
exp   :=fig expert.
exp   initFaits .
exp   lisFigure.
exp   chargeRegles:''''Euclide''''.
exp   deduis.
exp   :=fig expert.
exp   initFaits .
exp   lisFigure.
exp   chargeRegles:''''EuclideMinimum''''.
exp   deduis.
exp   modèlesQuestions .
'']]] doItWithButton: copier le script de la figure pour l''''exécuter.

	**La ligne polygonale**

**lignePolygonaleFermée  ?x1**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
lignePolygonaleFermée  ?x1''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition: ''lignePolygonaleFermée  ?x1''**
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''lignePolygonaleFermée  ?x1''''
'']]] doItWithButton:copier le code pour l''''exécuter.



	**Les propriétés**

**polygone  ?x1 ?x2**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
polygone  ?x1 ?x2''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp verifieCondition: ''''polygone  ?x1 ?x2''''
[[[fig presenter expertDisplayTutor:''
exp verifieCondition: ''''polygone  ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''''exécuter.



') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 3/2/2025 01:48:52'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles
^(EruditeBookSection basicNew title: '1.3 Angles'; document: ((EruditeDocument contents: '!!!!!! 1.3 Angles
Euclide : Définition 8, «  angle plan est l''inclinaison mutuelle de deux lignes qui se touchent dans un plan, et  qui ne sont pas placées dans la même direction. ».
Euclide : Définition 9, « Lorsque des lignes qui comprennent un angle sont des droites, l''angle se nomme rectiligne ».
Aide-mémoire  p.101 : « Un angle est une portion du plan limitée par deux demi-droites de même origine. L''origine est appelée sommet de l''angle et les demi-droites sont les côtés.
Aide-mémoire  p.  90 : « Une demi-droite est une portion du plan limitée par un point qui est appelé origine. ».') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles_131AngleEntreDemidroites;
        add: self section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles_132AngleEntreDroites;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 3/2/2025 01:48:52'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles_131AngleEntreDemidroites
^(EruditeBookSection basicNew title: '1.3.1 Angle entre demi-droites'; document: ((EruditeDocument contents: ' !!!!!!1.3.1. Angle entre demi-droites

"1.3.1.1  Script de la Figure."
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
"1.3.1.1  Script de la Figure."
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

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier l''exemple.


Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents séparément lorsqu''on vérifie la relation dans une règle. 
On n''affirme que certains faits sont équivalents mais la relation a aussi d''autres faits équivalents par exemple les angles  [ A S B ] et [ C S B ] sont aussi équivalents et il y a encore d''autres relations, en fait on peut regrouper dans un ensemble tous les angles qui sont équivalents entre eux et il suffit de tester s''il sont dans le même ensemble pour savoir qu''ils sont équivalents.

e verifieCondition: ''point A
relation:rep: équivalent ?res''
e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''e verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier l''exemple.

On voit que tous lea angles équivalents se trouvent dans le même ensemble.

Remarque:

il ne peut pas y avoir que des prédicats dans une condition, il faut au moins une affirmation à vérifier, c''est pour ça que l''affirmation vraie **point A**  est au début de la condition à vérifier-
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 2/23/2025 21:02:34'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 3/2/2025 01:48:52'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Angles_132AngleEntreDroites
^(EruditeBookSection basicNew title: '1.3.2 Angle entre droites'; document: ((EruditeDocument contents: ' !!!!!!1.3.2. Angle entre droites

"1.3.1.1  Script de la Figure."
f := DrGeoFigure new.
e := f expert.
e chargeRegles:''Euclide:''.
e chargeRegles:''angles:''.
a := f point:-8@8.a nommer: ''A''.
c := f point: 4@-5.c nommer: ''C''.
b := f point: -8@-1.b nommer: ''B''.
d:= f point: 7@7.d nommer: ''D''.
dd1 := f droitePassantPar: c et: a .
dd1 nommer: ''dd1''.
dd1 := f droitePassandd1 nommer: ''dd1''.
dd2 := f droitePassantPar: d et: b.
dd2 nommer: ''dd2''.
i:= f intersectionDe: dd1 et: dd2.
i nommer: ''I''.
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
[[[f presenter expertDisplayTutor:'' "1.3.1.1  Script de la Figure."
f := DrGeoFigure new.
e := f expert.
e chargeRegles:''''Euclide:''''.
e chargeRegles:''''angles:''''.
a := f point:-8@8.a nommer: ''''A''''.
c := f point: 4@-5.c nommer: ''''C''''.
b := f point: -8@-1.b nommer: ''''B''''.
d:= f point: 7@7.d nommer: ''''D''''.
dd1 := f droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := f droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=f  intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
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
different:de:  [ ?y1 ?s ?y2 ] ?x0.
"''
]]] doItWithButton: copier l''exemple.

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier l''exemple.


Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents séparément lorsqu''on vérifie la relation dans une règle. 
On n''affirme que certains faits sont équivalents mais la relation a aussi d''autres faits équivalents par exemple les angles  [ A S B ] et [ C S B ] sont aussi équivalents et il y a encore d''autres relations, en fait on peut regrouper dans un ensemble tous les angles qui sont équivalents entre eux et il suffit de tester s''il sont dans le même ensemble pour savoir qu''ils sont équivalents.

e verifieCondition: ''point A
relation:rep: équivalent ?res''
e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''e verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier l''exemple.

On voit que tous lea angles équivalents se trouvent dans le même ensemble.

Remarque:

il ne peut pas y avoir que des prédicats dans une condition, il faut au moins une affirmation à vérifier, c''est pour ça que l''affirmation vraie **point A**  est au début de la condition à vérifier-
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Droite
^(EruditeBookSection basicNew title: '1.3 Droite'; document: ((EruditeDocument contents: ' !!!!1.3 Droites

	**Rappel.**

//Euclide : Définition 2: «// **Une ligne est une longueur sans largeur. **»

//Euclide :  Définition 3 : «// **Les extrémités d’une ligne sont des points. **»

//Euclide : Définition 4, « //**La ligne droite est celle qui est également placée entre ses points. **» 
	//Si on marche le long d''une droite le pied gauche se déplace de la même distance que le pied droit.
	Sur une sphère  les méridiens sont des droites mais pas les parallèles, les pas ne sont pas de même taille de chaque côté d''un parallèle.Tous les paralléles sont de taille différente.//

//Euclide : Demande 1, // « **Entre deux points on peut toujours tracer une droite.**»
	( Euclide défini comme droite ce qui est pour nous un segment.) 
	
//Euclide : Demande 2, //« **On peut toujours prolonger indéfiniment une droite tracée entre deux points.**»
	(Euclide demande ce qui est pour nous une droite. Cette demande est toujours satisfaite pour la géométrie plane, elle n''est pas toujours vérifiée , par exemple, sur un sphère, les extrémités d''un segment peuvent se rejoindre en un même point.)

//Aide-mémoire  p.90 : « //**La droite A B est constituée d''une infinité de points alignés avec A et B **»

//Aide-mémoire  p.90 : « //**Un segment est une portion de droite limitée par deux points. **»


	** 1.3.1  la figure. **

[[[fig := DrGeoFigure nouveau.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifief un modèle, utilise vérifier du menu Expert
'' style: true.
exp:= fig expert.
exp drgeo:fig .
exp chargeRegles: ''Euclide''.
a := fig point: 0@0.
a nommer: ''A''.
b := fig point: 2@6.
b nommer: ''B''. 
d := fig droitePassantPar: a et: b.d nommer: ''dAB''.
p := fig  pointSurLigne: d à: 0.9.p nommer:  ''P''.
fig presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[ fig := DrGeoFigure nouveau.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
exp :=fig expert. 
exp  drgeo:fig.
a := fig point: 0@0.
a nommer: ''''A''''.
b := fig point: 2@6.
b nommer: ''''B''''. 
d := fig  droitePassantPar: a et: b.d nommer: ''''dAB''''.
p:= fig  pointSurLigne: d à: 0.9.p nommer:  ''''P''''.
exp := fig expert.
exp initFaits .      
exp lisFigure.
exp chargeRegles:''''Euclide''''.
exp deduis.
exp modèlesQuestions .
'']]] doItWithButton: copier le script de la figure pour l''exécuter.

	**1.3.2 Points sur une droite**

	Le  prédicat **pointsSur:rep:** permet d''avoir la liste des points sur une droite.
Les points sont ordonnés dans le sens de la droite.

**droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts.''style:true]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

**exp vérifieCondition: ''droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''.**
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''e vérifieCondition: ''''
droite  ?x1 ?x2 ?x3
pointsSur:rep: ?x1 ?pts''''.'']]] doItWithButton: copier le code pour l''exécuter.

	**1.3.3 Position d''un point par rapport à un autre.**

	La question **position  ?point  ?position ?pointRéférence ?droite** permet d''obtenir la positions relative d''un point par rapport à un point de référence

**position  ?point  ?position ?pointRéférence ?droite**
[[[f presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
position  ?point  ?position ?pointRéférence ?droite'']style true]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

**exp vérifieCondition: ''position  ?point  ?position ?pointRéférence ?droite''.**
[[[fig presenter expertDisplayTutor:''
exp vérifieCondition: ''''position  ?point  ?position ?pointRéférence ?droite''''.
'' ]]] doItWithButton: copier ce code pour l''exécuter.

	**1.3.4 Parents**

	Les parents d''une droite sont les points sur lesquels s''appuient la droite.

**parent1 ?x1 ?x2**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''parent1 ?x1 ?x2''style:true]]] doItWithButton: copier pour vérifier avec le menu Expert.

**exp vérifieCondition:''parent1 ?x1 ?x2''**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
exp vérifieCondition: ''''parent1 ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''exécuter.

**parent2 ?x1 ?x2**
[[[fig presenter expertDisplayTutor:''parent2 ?x1 ?x2'']]] doItWithButton: copier pour vérifier avec le menu Expert.

exp vérifieCondition:''parent2 ?x1 ?x2''
[[[fig presenter expertDisplayTutor:''
exp vérifieCondition: ''''parent2 ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''exécuter.

	**1.3.5 Remarque.**
 
	On peut remplacer une variable par une valeur pour limiter la recherche aux réponses qui concernent cette variable.

**position P ?x2 ?x3 ?x4**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
position P ?x2 ?x3 ?x4
'' style:true]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.
 
**exp vérifieCondition: ''position P ?x2 ?x3 ?x4''.**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
**exp vérifieCondition: ''''position P ?x2 ?x3 ?x4''''.'' ]]] doItWithButton:copier ce code pour l''exécuter.**


 ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 9/6/2025 00:25:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_13Droite_131ParallèlesEtPerpendiculaires
^(EruditeBookSection basicNew title: '1.3.1 Parallèles et perpendiculaires.'; document: ((EruditeDocument contents: '!!!!!!1.4 Demi-droite

Aide-mémoire  p.90 : « Une demi-droite est une portion de droite limitée par un point.  Ce point est appelé l’origine de la demi-droite. »s
lesQuestions .

[[[f:= DrGeoFigure nouveau.
f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert
'' style: true.
a := f point: (-6 @ -3).a nommer: ''A''.
b := f point: (0  @ 2).b nommer: ''B''.
d:= f  demiDroiteOrigine: a passantPar:b.d nommer: ''d''. 
p:= f pointSurLigne: d à: 0.95.p nommer: ''P''.
p1:= f pointSurLigne: d à: 0.96.p1 nommer: ''P1''.
e:= f expert.
e initFaits.
e lisFigure.
e  chargeRegles:''Euclide''.
f presenter expertInspect
]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
"1.2,4 Demi-droite"
f := f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-6 @ -3).a nommer: ''''A''''.
b := f point: (0  @ 2).b nommer: ''''B''''.
d:= f  demiDroiteOrigine: a passantPar:b.d nommer: ''''d''''. 
p:= f pointSurLigne: d à: 0.95.p nommer: ''''P''''.
p1:= f pointSurLigne: d à: 0.96.p1 nommer: ''''P1''''.
e :=f expert.
e initFaits.
e lisFigure.
e  chargeRegles:''''Euclide''''.
e deduis..
e modèlesQuestions .
''
]]] doItWithButton:copier le script de la figure pour l''exécuter.

**Afficher les points sur la demi-droite.**

pointsSur d ?pts
[[[f presenter expertDisplayTutor:''
pointsSur d ?pts
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''pointsSur d ?pts''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''pointsSur d ?pts''''.
'']]] doItWithButton: ccopier le code pour l''exécuter.

**La position relative de deux points sur la droite.**

position P ?pos B d
[[[f presenter expertDisplayTutor:''
position P ?pos B d
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''position P ?pos B d''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''position P ?pos B d''''.
'']]] doItWithButton: copier le code pour l''exécuter.

**Abscisse curviligne.**
Pour la position d''un point sur une ligne, tu peux utiliser l''**abscisse curviligne**, cette abscisse repère la longuer de la ligne  qui sépare le point d''un point origine.

point P
abcisseDe:sur:rep: P d ?abcsP
[[[f presenter expertDisplayTutor:''
point P
abcisseDe:sur:rep: P d ?abcsP
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
point ?p
abcisseDe:sur:rep: P d ?abcsP''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
point P
abcisseDe:sur:rep: P d ?abcsP''''.''
]]] doItWithButton: copier le code pour l''exécuter.
 
Tu peux aussi  afficher l''abscisse du point sur la ligne avec le menu de la figure: **Edition/Propriété** et cliquer sur le point.

**Trois points sur une droite déterminent deux demi-droites.**

[[[
"1.2,4 Demi-droite"
f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-4 @ -3).a nommer: ''A''.
b := f point: (3  @ 2).b nommer: ''B''.
d:= f  droitePassantPar: a  et: b . d nommer: ''d''. 
p:= f pointSurLigne: d à: 0.8943.p nommer: ''P''.
dd1 := f demiDroiteOrigine: p passantPar: b.
dd1 couleur: Color red.
dd2 := f demiDroiteOrigine: p passantPar: a.
dd1 nommer: ''dd1''.
dd2 nommer: ''dd2''.
dd2 couleur: Color green.
e  chargeRegles:''Euclide''.
e:= f expert.
e initFaits.
e lisFigure.
f presenter expertInspect
]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[f presenter expertDisplayTutor:''
"Demi-droites sur une droite"
f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
a := f point: (-4 @ -3).a nommer: ''''A''''.
b := f point: (3  @ 2).b nommer: ''''B''''.
d:= f  droitePassantPar: a  et: b . d nommer: ''''d''''. 
p:= f pointSurLigne: d à: 0.8943.p nommer: ''''P''''.
dd1 := f demiDroiteOrigine: p passantPar: b.
dd1 couleur: Color red.
dd2 := f demiDroiteOrigine: p passantPar: a.
dd1 nommer: ''''dd1''''.
dd2 nommer: ''''dd2''''.
dd2 couleur: Color green.
e  chargeRegles:''''Euclide''''.
e:= f expert.
e initFaits.
e lisFigure.
e deduis.
e modèlesQuestions .
''
]]] doItWithButton:copier le script de la figure pour l''exécuter.

** Montrer les demi-droites**

demi-droiteSur  ?x1 ?x2
[[[f presenter expertDisplayTutor:''
demi-droiteSur  ?x1 ?x2''
]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
demi-droiteSur  ?x1 ?x2''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
demi-droiteSur  ?x1 ?x2''''''
]]] doItWithButton: copier le code pour l''exécuter.

**position des points sur les demi-droites**
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 
[[[f presenter expertDisplayTutor:''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''
]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition:''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''
[[[ f presenter expertDisplayTutor:''
e verifieCondition:''''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''''''
]]] doItWithButton: copier le code pour l''exécuter.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_1PointSegmentEtDroite_14DemiDroite
^(EruditeBookSection basicNew title: '1.4 Demi-Droite '; document: ((EruditeDocument contents: '!!!! 1.4 Demi-droite.

Aide-mémoire  p.90 : « Une demi-droite est une portion de droite limitée par un point.  Ce point est appelé l’origine de la demi-droite. »
//On a besoin d''un autre point  pour déterminer la droite, ce point est appelé parent.//

**1.4.1 La figure.**
[[[fig := DrGeoFigure nouveau.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert

'' style: true.
exp := fig expert.
exp drgeo: fig.
exp  chargeRegles:''Euclide''.
fig échelle: 15.
a := fig point: (-6 @ -3).a nommer: ''A''.
b := fig point: (0  @ 2).b nommer: ''B''.
d:= fig  demiDroiteOrigine: a passantPar:b.d nommer: ''d''. 
p:= fig pointSurLigne: d à: 0.95.p nommer: ''P''.
p1:= fig pointSurLigne: d à: 0.96.p1 nommer: ''P1''..
exp initFaits.
exp lisFigure.
fig  presenter expertInspect
]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[ fig := DrGeoFigure nouveau.
exp := fig expert.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
"1.2,4 Demi-droite"
exp  chargeRegles:''''Euclide''''.
fig échelle: 15.
a := fig point: (-6 @ -3).a nommer: ''''A''''.
b := fig point: (0  @ 2).b nommer: ''''B''''.
d:= fig  demiDroiteOrigine: a passantPar:b.d nommer: ''''d''''. 
p:= fig pointSurLigne: d à: 0.95.p nommer: ''''P''''.
p1:= fig pointSurLigne: d à: 0.96.p1 nommer: ''''P1''''.
exp initFaits.
exp lisFigure.
exp deduis.
exp modèlesQuestions.
'']]] doItWithButton:copier le script de la figure pour l''''exécuter.

**1.4.2 Afficher les points sur la demi-droite.**

pointsSur d ?pts
[[[ fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
pointsSur d ?pts
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

e verifieCondition: ''pointsSur d ?pts''.
[[[exp := fig expert.
fig presenter expertDisplayTutor: ''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''pointsSur d ?pts''''.
'']]] doItWithButton: copier le code pour l''exécuter.

**1.4.3 La position relative de deux points sur la droite.**

position P ?pos B d
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert

position P ?pos B d
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

**expert verifieCondition: ''''position P ?pos B d''''.**
[[[exp := fig expert.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
exp verifieCondition: ''''position P ?pos B d''''
'']]] doItWithButton: copier le code pour l''exécuter.

**1.4.4 Abscisse curviligne.**
Pour la position d''''un point sur une ligne, tu peux utiliser l''''**abscisse curviligne**, cette abscisse repère la longuer de la ligne  qui sépare le point d''''un point origine.

point P
abcisseDe:sur:rep: P d ?abcsP
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert .

point ?p
abcisseDe:sur:rep: P d ?abcsP
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

exp verifieCondition:''
point ?p
abcisseDe:sur:rep: P d ?abcsP''.
[[[ fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
exp verifieCondition:''''
point P
abcisseDe:sur:rep: P d ?abcsP''''.''
]]] doItWithButton: copier le code pour l''exécuter.
 
Tu peux aussi  afficher l''''abscisse du point sur la ligne avec le menu de la figure: **Edition/Propriété** et cliquer sur le point.

**1.4.5 Trois points sur une droite déterminent deux demi-droites.**

[[[
"1.2,4 Demi-droite"
fig := DrGeoFigure nouveau.
exp := fig expert.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
a := fig point: (-4 @ -3).a nommer: ''A''.
b := fig point: (3  @ 2).b nommer: ''B''.
d := fig  droitePassantPar: a  et: b . d nommer: ''d''. 
p := fig pointSurLigne: d à: 0.8943.p nommer: ''P''.
dd1 := fig demiDroiteOrigine: p passantPar: b.
dd1 couleur: Color red.
dd2 := fig demiDroiteOrigine: p passantPar: a.
dd1 nommer: ''dd1''.
dd2 nommer: ''dd2''.
dd2 couleur: Color green.
exp  chargeRegles:''Euclide''.
exp initFaits.
exp lisFigure.
fig presenter expertInspect
]]] doItWithButton: Charger la figure et les modèles de questions pour les vérifier.

[[[ fig := DrGeoFigure nouveau.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
"Demi-droites sur une droite"
exp:= fig expert.
exp drgeo: fig.
a := fig point: (-4 @ -3).a nommer: ''''A''''.
b := fig point: (3  @ 2).b nommer: ''''B''''.
d:= fig  droitePassantPar: a  et: b . d nommer: ''''d''''. 
p:= fig pointSurLigne: d à: 0.8943.p nommer: ''''P''''.
dd1 := fig demiDroiteOrigine: p passantPar: b.
dd1 couleur: Color red.
dd2 := fig demiDroiteOrigine: p passantPar: a.
dd1 nommer: ''''dd1''''.
dd2 nommer: ''''dd''''.
dd2 couleur: Color green.
exp:  chargeRegles ''''Euclide''''.
exp:= fig expert.
exp: initFaits.
exp: lisFigure.
exp: deduis.
exp: modèlesQuestions .
''''
]]] doItWithButton:copier le script de la figure pour l''exécuter.

**1.4.6  Montrer les demi-droites**

demi-droiteSur  ?x1 ?x2
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert

demi-droiteSur  ?x1 ?x2''
]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

exp verifieCondition:''
demi-droiteSur  ?x1 ?x2''
[[[ fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
exp verifieCondition:''''
demi-droiteSur  ?x1 ?x2''''
'']]] doItWithButton: copier le code pour l''exécuter.

**1.4.7 position des points sur les demi-droites**
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert

**demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''**
]]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

**exp verifieCondition:''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3 ''**
[[[ fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
exp verifieCondition:''''
demi-droite  ?dd 
position  ?x1 ?x2 ?x3 ?dd
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3'''' ''
]]] doItWithButton: copier le code pour l''exécuter. La position relative de deux points sur la droite.

**position P ?pos B d**
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert

**position P ?pos B d**
'']]] doItWithButton: copier le modèle pour le vérifier avec le menu Expert.

**expert verifieCondition: ''''position P ?pos B d''''.**
[[[exp := fig expert.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''
exp verifieCondition: ''''position P ?pos B d''''
'']]] doItWithButton: copier le code pour l''exécuter.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/13/2025 04:13:52'!
section_Expert_GéométrieEtSystèmeExpert_2Angles
^(EruditeBookSection basicNew title: '2 Angles '; document: ((EruditeDocument contents: '1.3 Angles

Euclide : Définition 8, «  angle plan est l''inclinaison mutuelle de deux lignes qui se touchent dans un plan, et  qui ne sont pas placées dans la même direction. ».

Euclide : Définition 9, « Lorsque des lignes qui comprennent un angle sont des droites, l''angle se nomme rectiligne ».

Aide-mémoire  p.101 : « Un angle est une portion du plan limitée par deux demi-droites de même origine. L''origine est appelée sommet de l''angle et les demi-droites sont les côtés.

Aide-mémoire  p.  90 : « Une demi-droite est une portion de droite limitée par un point. Ce point est
appelé l’origine de la demi-droite.. ».') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_2Angles_131AngleEntreDemidroite;
        add: self section_Expert_GéométrieEtSystèmeExpert_2Angles_132AngleEntreDroites;
        add: self section_Expert_GéométrieEtSystèmeExpert_2Angles_133AngleEntreParallèles;
        add: self section_Expert_GéométrieEtSystèmeExpert_2Angles_134AngleObtuAigudroit;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/13/2025 04:13:53'!
section_Expert_GéométrieEtSystèmeExpert_2Angles_131AngleEntreDemidroite
^(EruditeBookSection basicNew title: '1.3.1 Angle entre demi-droite'; document: ((EruditeDocument contents: '!!!!!!1.3.1 Angle entre demi-droite

**Angle nul, plat, saillant ou entrant.**
Un angle avec les demi-droites confondues est dit **angle nul** (0 degrés).

Un angle avec les demi-droites opposées est dit **angle plat** (180 degrés).

Un angle entre l''''angle nul et l''''angle plat ( angle entre 0 et 180 degrés) est dit **angle saillant**.

Un angle plus grand que l''''angle plat ( plus grand que 180 degrés)  est  dit **angle entrant**.

[[[ 

fig := DrGeoFigure nouveau.
exp  := fig expert.
exp   drgeo:fig.
exp   chargeRegles:''Euclide:''.
a := fig point: 0@0.a nommer: ''A''.
s := fig  point:  -3@0.s nommer: ''S''.
cer:= fig cercleCentre: s rayon: 3.
cer cacher.
b  :=fig pointSurLigne: cer à: 0.3755.b nommer: ''B''.
b couleur: Color green.
dd1 := fig demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := fig pointSurLigne: dd2 à: 0.9.
d nommer: ''D''.
d cacher.
fig segmentDe: s à: d.
fig angleSommet: s de:  a à: b.
a1:=fig arcCenter: s  from: a to: b.
a1 couleur: Color blue.
a2:=fig arcCenter: s  from: b  to: a.
a2 couleur: Color red.
p := fig pointSurLigne: dd1 à: 0.9774.
dr := fig demiDroiteOrigine: p  passantPar: b.dr nommer:''dr''.
dr cacher.
perp := fig perpendiculaireA: dd1 passantPar: s.   
pd1 := fig pointSurLigne: perp à: 0.9678.
pd2 := fig pointSurLigne: perp à: 0.0290..
demiPerp1:=fig demiDroiteOrigine: s passantPar: pd1.
demiPerp2:=fig demiDroiteOrigine: s passantPar: pd2.
saillant := fig intersectionDe: demiPerp1 et: dr.
entrant := fig intersectionDe: demiPerp2 et: dr.
(saillant  morph mathItem )exist 
ifTrue:[ saillant nommer:''angle saillant''.saillant couleur: Color blue.].
entrant := fig intersectionDe: demiPerp2 et: dr.  
b1:= b mathItem point.
b déplacerA: -5.4 @-1.8. fig actualiser.
(entrant  morph mathItem) exist
ifTrue:[ entrant nommer:''angle entrant''.entrant couleur: Color blue.].
b déplacerA: b1.
fig actualiser.
dd2 morph mathItem .
demiPerp1 cacher.
demiPerp2 cacher.
perp cacher.
pd1 cacher.
pd2 cacher.
dr cacher.
fig centrerVueEn: s mathItem  point.
fig texte: ''déplace le point B
observe l''''angle bleu'' à: -8@7.7.
]]] doItWithButton: Tester les angles.

**Angles entre demi-droites.**

[[[fig:= DrGeoFigure nouveau.
fig expert: exp.
fig échelle: 18.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
exp   drgeo:f.
exp  chargeRegles:''Euclide:''.
a := fig point: 0@0.a nommer: ''A''.
b := fig point: 0@12.b nommer: ''B''.
s := fig point:  -9@4.s nommer: ''S''.
dd1 := fig demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := fig pointSurLigne: dd2 à: 0.9.d nommer: ''D''. 
ang := fig angleSommet: s de: c à: d.   ang nommer:''                 <) ''. 
fig presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
"1.3.1.1  Script de la Figure."
fig := DrGeoFigure nouveau.
fig échelle: 18.
exp  :=fig expert.
exp  drgeo:f.
exp  chargeRegles:''''Euclide:''''.
a := fig point: 0@0.a nommer: ''''A''''.
b := fig point: 0@12.b nommer: ''''B''''.
s := fig point:  -9@4.s nommer: ''''S''''.
dd1 := fig demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''''dd1''''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''''C''''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''''dd2''''.
d := fig pointSurLigne: dd2 à: 0.9.d nommer: ''''D''''.
ang := fig angleSommet: s de: c à: d    . ang nommer: ''''         <)''''.exp  initFaits .
exp  lisFigure.
exp  deduis.
exp  modèlesQuestions .
''
]]] doItWithButton:Charger le script de la figure.

**Angles équivalents**

Des angles avec le même sommets que l''angle de base et des extrémités sur les mêmes demi-droites sont équivalents.
Une relation est créée entre l''angle de base et un angle.

relationCréée ?x1 ?x2 ?x3
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string:''
relationCréée ?x1 ?x2 ?x3
'' style:true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

exp  verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
exp  verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier le code.

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

 **Représentation des relations d''équivalence.**

Les règles qui affirment des relations d''équivalence ont une conclusion **relation créée** pour garder la trace des relations créées.

Une relation d''équivalence entre objets a la propriété de partager l''ensemble des objets en classes d''objets équivalents, deux objets équivalents se retrouvent dans la même classe, pour vérifier si deux objets sont équivalents, il suffit de vérifier si ils appartiennent à la même classe, ce qui est rapide; on n''affirme que certains faits qui sont équivalents, mais la relation a aussi d''autres faits équivalents en raison des propriétés de transitivité et de commutativité de la relation d''équivalence. 

On peut comparer tous les éléments de la classe à un élément choisi comme représentant de la classe,

Pour les angles, le représentant est l''angle0.
Pour des fractions, le représentant est la fraction irréductible.

On peut voir l''ensemble des relations avec le prédicat **relation:rep:**

Dans cet exemple tous les angles sont équivalent et se retrouvent dans le même ensemble représenté par une liste.

point A
relation:rep: équivalent ?res
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
point A
relation:rep: équivalent ?res''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

exp verifieCondition: ''
point A
relation:rep: équivalent ?res''
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
exp verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier le code.


On voit que tous les angles équivalents se trouvent dans le même sous ensemble.
//Dans cet exemple il n''y a qu''un sous ensemble puisqu''''il n''''y qu''''un angle de base.//

**Remarques:**

Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents dans une conclusion. 

Pour vérifier une condition, il faut au moins une affirmation, c''est pour ça que l''affirmation vraie **point A**  est ajoutée au début de la condition à vérifier.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/13/2025 04:13:53'!
section_Expert_GéométrieEtSystèmeExpert_2Angles_132AngleEntreDroites
^(EruditeBookSection basicNew title: '1.3.2 Angle entre droites'; document: ((EruditeDocument contents: '!!!!!!1.3.2. Angle entre droites

"1.3.1.1  Script de la Figure."
fig:= DrGeoFigure new.
exp := fig expert.
exp chargeRegles:''Euclide:''
a := fig point:-8@8.a nommer: ''A''.
c := fig point: 4@-5.c nommer: ''C''.
b := fig point: -8@-1.b nommer: ''B''.
d:= fig point: 7@7.d nommer: ''D''.
dd1 := fig droitePassantPar: c et: a .
dd1 nommer: ''dd1''.
dd1 := fig droitePassandd1 nommer: ''dd1''.
dd2 := fig droitePassantPar: d et: b.
dd2 nommer: ''dd2''.
i:= fig intersectionDe: dd1 et: dd2.
i nommer: ''I''.
exp  initFaits .
exp  lisFigure.
exp  deduis.
exp  modèlesQuestions .

"
exp  verifieCondition: ''angle0  ?x1''.
exp  verifieCondition: ''demi-droite  ?x1 ?x2 ?x3''.
exp  verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
exp  verifieCondition: ''angle0 ?x0 [  position: ?pos ]
point ?y1
point ?y2
point ?s
relation:et:nom:  [ ?y1 ?s ?y2 ] ?x0 équivalent
different:de:  [ ?y1 ?s ?y2 ] ?x0''.
"
[[[fig presenter expertDisplayTutor:''
 "1.3.1.1  Script de la Figure."
fig:= DrGeoFigure new.
exp := fig expert.
exp chargeRegles:''''Euclide:''''.
a := fig point:-8@8.a nommer: ''''A''''.
c := fig  point: 4@-5.c nommer: ''''C''''.
b := fig  point: -8@-1.b nommer: ''''B''''.
d:= fig point: 7@7.d nommer: ''''D''''.
dd1 := fig droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := fig  droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=fig intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
exp  initFaits .
exp  lisFigure.
exp  deduis.
exp  modèlesQuestions .
.'']]] doItWithButton: copier l''exemple.
exp  verifieCondition: ''''angle0  ?x1''''.
exp  verifieCondition: ''''demi-droite  ?x1 ?x2 ?x3''''.
exp  verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
exp  verifieCondition: ''''angle0 ?x0 [  position: ?pos ]
point ?y1
point ?y2
point ?s
relation:et:nom:  [ ?y1 ?s ?y2 ] ?x0 équivalent
different:de:  [ ?y1 ?s ?y2 ] ?x0.'''' ''


Remarque:
Les angles qui sont équivalents à un angle de base font partie d''''une relation d''''équivalence. 

exp  verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''
exp  verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier l''''exemple.


Pour le sytème expert définir une relation d''''équivalence est plus efficace que d''''affimer tous les faits équivalents séparément lorsqu''''on vérifie la relation dans une règle. 
On n''''affirme que certains faits sont équivalents mais la relation a aussi d''''autres faits équivalents par exemple les angles  [ A S B ] et [ C S B ] sont aussi équivalents et il y a encore d''''autres relations, en fait on peut regrouper dans un ensemble tous les angles qui sont équivalents entre eux et il suffit de tester s''''il sont dans le même ensemble pour savoir qu''''ils sont équivalents.

exp  verifieCondition: ''point A
relation:rep: équivalent ?res''''
exp  verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''.
[[[fig  presenter expertDisplayTutor:''e verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier l''''exemple.

On voit que tous lea angles équivalents se trouvent dans le même ensemble.

Remarque:

il ne peut pas y avoir que des prédicats dans une condition, il faut au moins une affirmation à vérifier, c''''est pour ça que l''''affirmation vraie **point A**  est au début de la condition à vérifier-
''') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/13/2025 04:13:53'!
section_Expert_GéométrieEtSystèmeExpert_2Angles_133AngleEntreParallèles
^(EruditeBookSection basicNew title: '1.3.3 Angle entre parallèles'; document: ((EruditeDocument contents: ' ''!!!!!! 1.3.3 Angle entre parallèles

1.3.3.1  Script de la Figure.

**Les déductions prennent du temps,Patientez.**

[[[fig:=DrGeoFigure nouveau.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
exp:=fig expert.
exp initRegles.
exp := fig expert.exp chargeRegles: ''Euclide''.
fig afficherAxes .
a := fig  point: -4.5@1.5.a nommer: ''A''.		
b:= fig  point: 4.5@5.b nommer: ''B''.
c:= fig  point: 0@-4.5.c nommer: ''C''.
dr:=fig droitePassantPar: a et: b.dr nommer: ''dr''.
par:= fig parallèleA: dr passantPar: c.par nommer: ''par''.
d := fig  pointSurLigne: par à: 0.9484.d nommer: ''D''.
pe:= fig  point: 4.5@-6.pe nommer: ''E''.
pf:=fig point: -3@6.pf nommer: ''F''.
trans := fig droitePassantPar: pe et: pf.trans nommer: ''trans''.
i1:= fig intersectionDe: dr et: trans.i1 nommer: ''I1''.
i2:= fig intersectionDe: par et: trans.i2 nommer: ''I2''. 
fig presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.
 
[[[fig :=DrGeoFigure nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
"1.3.3.1  Script de la Figure."

exp := fig expert.
exp chargeRegles:''''Euclide:''''.
a := fig point:-8@8.a nommer: ''''A''''.
c := fig point: 4@-5.c nommer: ''''C''''.
b := fig point: -8@-1.b nommer: ''''B''''.
d:= fig point: 7@7.d nommer: ''''D''''.
dd1 := fig droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := fig droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=fig  intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
'']]] doItWithButton: Copier le code de la figure.

**Angles non plats**

angle0  ?x1 [ classement: nonPlat ].
[[[
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:
''angle0  ?x1 [ classement: nonPlat ].''

]]] doItWithButton:Vérifier ce modèle.

exp verifieCondition: ''angle0  ?x1 [ classement: nonPlat ]''.
[[[
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ classement: nonPlat ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles adjacents.**

angle0  ?x1 [ adjacent:  ?x2 ] 
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ adjacent:  ?x2 ] 
''  
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ adjacent:  ?x2 ] ''
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert''  string:''
e verifieCondition: ''''angle0  ?x1 [ adjacent:  ?x2 ] ''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles supplémentaires**

angle0  ?x1 [ supplémentaire:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ supplémentaire:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

ep xverifieCondition: ''angle0  ?x1 [ supplémentaire:  ?x2 ]''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ supplémentaire:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles opposés.**

angle0  ?x1 [ opposé:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ opposé:  ?x2 ] 
''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

exp verifieCondition: ''angle0  ?x1 [ opposé:  ?x2 ] ''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ opposé:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.


**Angles alterneInternes**
angle0  ?x1 [ alterneinterne:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ alterneInterne:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ alterneInterne:  ?x2 ] ''.
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''exp verifieCondition: ''''angle0  ?x1 [ alterneInterne:  ?x2 ]''''.''

]]] doItWithButton:copier le code pour l''''exécuter.



**Angles alterneExternes**
 angle0  ?x1  [ alterneExterne:  ?x2 ]
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1  [ alterneExterne:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ alterneExterne:  ?x2 ] ]''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0  ?x1 [ alterneExterne:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''''exécuter.

'') ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/13/2025 04:13:53'!
section_Expert_GéométrieEtSystèmeExpert_2Angles_134AngleObtuAigudroit
^(EruditeBookSection basicNew title: '1.3.4 Angle obtu, aigu,droit.'; document: ((EruditeDocument contents: '
!!!!!!1.3.4 Angle obtu, aigu,droit,perpendiculaire.


Euclide : Définition 11, « L''angle obtus est celui qui est plus grand qu''un droit. » 
Euclide : Définition 12, « L''angle aigu est celui qui est plus petit qu''un droit »
Euclide : Définition 10, « Lorsqu''une droite tombant sur une droite fait deux angles de suite égaux, chacun des angles égaux est droit, et la droite placée au-dessus est dite perpendiculaire à celle sur laquelle elle est placée.»

Aide-mémoire p.103: « Un angle obtus est un angle dont la mesure est omprise entre 90° et 180°. »
Aide-mémoire p.103: « Un angle aigu est un angle dont la mesure est comprise entre 0° et 90°. »

Aide-mémoire p.103: « Un angle droit est un angle dont la mesure est 90°. »
Aide-mémoire p.  93: « Deux droites perpendiculaires sont deux droites qui se coupent à angles droits .»

**Remarque: **« La définition de Euclide pour l''angle droit est l''angle qui partage en deux angles égaux.
Pour Euclide l''égalité de deux objets géométriques, se constate si on peut superposer exactement ces objets, éventuellement en en retournant un »


**1.3.4.1  Script de la figure.**

[[[f :=DrGeoFigure  nouveau.

" Angle obtu, aigu,droit,perpendiculaire."
	f texte: ''Déplacer le point A'' à: -9.5@8.5 .
	o:= f point: (-6@0). o nommer: ''O''.
	f centrerVueEn: o.
	f centrerVueEn: o.
	o1:= f point: (-6.1@0). o1 nommer: ''O1''.o1 cacher.
	o2:= f point: (-5.9@0). o2 nommer: ''O2''.o2 cacher.
	seg := f segmentDe:-5.8@7 à: -6.1@7.
	seg nommer:''''.seg cacher.
	b:=f point: 0@0. b nommer: ''B''.
	d1:=f droitePassantPar: o et: b.
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	a:=f point: -6@6. a nommer: ''A''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp1:= f perpendiculaireA: d1 passantPar: o1.
	perp2:= f perpendiculaireA: d1 passantPar: o2.
	perp  pointillé.
	perp nommer:''perp''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''droit''.
	p1 :=f point: (-3 @6).
	p2 :=f point: (-9 @6).
	s1:=f segmentDe: p1 à: a.
	s2:=f segmentDe: p2 à: a.
	p1 cacher.
	p2 cacher.
	s1 cacher.
	s2 cacher.
	a déplacerA: -2 @5.
		f actualiser.
	aigu:= f intersectionDe:  perp2 et: s2.
	aigu nommer: ''aigu''.
	perp1 cacher.
	perp2 cacher.
	a déplacerA: -9  @5.
	f actualiser.
	obtu:= f intersectionDe:  perp1 et: s1.
	obtu nommer: ''obtus''.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''<)''.
	mesureangle :=  ang  morph mathItem 	degreeAngle rounded
	]]] doItWithButton: Charger la démonstration.
ou
[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string:''
" Angle obtu, aigu,droit,perpendiculaire."
	f :=DrGeoFigure  nouveau. 
	f texte: ''''Déplacer le point A'''' à: -9.5@8.5 .
	o:= f point: (-6@0). o nommer: ''''O''''.
	f centrerVueEn: o.
	f centrerVueEn: o.
	o1:= f point: (-6.1@0). o1 nommer: ''''O1''''.o1 cacher.
	o2:= f point: (-5.9@0). o2 nommer: ''''O2''''.o2 cacher.
	seg := f segmentDe:-5.8@7 à: -6.1@7.
	seg nommer:''''seg''''.seg cacher.
	b:=f point: 0@0. b nommer: ''''B''''.
	d1:=f droitePassantPar: o et: b.
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	a:=f point: -6@6. a nommer: ''''A''''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp1:= f perpendiculaireA: d1 passantPar: o1.
	perp2:= f perpendiculaireA: d1 passantPar: o2.
	perp  pointillé.
	perp nommer:''''perp''''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''''droit''''.
	p1 :=f point: (-3 @6).
	p2 :=f point: (-9 @6).
	s1:=f segmentDe: p1 à: a.
	s2:=f segmentDe: p2 à: a.
	p1 cacher.
	p2 cacher.
	s1 cacher.
	s2 cacher.
	a déplacerA: -2 @5.
		f actualiser.
	aigu:= f intersectionDe:  perp2 et: s2.
	aigu nommer: ''''aigu''''.
	perp1 cacher.
	perp2 cacher.
	a déplacerA: -9  @5.
	f actualiser.
	obtu:= f intersectionDe:  perp1 et: s1.
	obtu nommer: ''''obtus''''.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''''<)''''.
	mesureangle :=  ang  morph mathItem 	degreeAngle rounded.
'']]] doItWithButton: Copier le code de la démonstration.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles
^(EruditeBookSection basicNew title: '2 Cercles.'; document: ((EruditeDocument contents: '!!!!!!3 Cercles

Euclide:Définition 15, « **Un cercle est une figure plane comprise par une seule ligne qu''on nomme circonférence,
toutes les droites menées à la circonférence d''un point placé dans cette figure étant égales entre elles. **» 
( Les droites
définies par Euclide sont les segments selon les définitions actuelles, donc, pour Euclide,les droites sont les rayons du
cercle).
Euclide:Définition 16, «** Ce point se nomme le centre du cercle.**»
Euclide:Définition 17, «**Diamètre du cercle est une ligne droite menée par le centre du cercle et finissant, de part et d''autre, à la circonférence. **»
Euclide:Définition 18, « **Demi cercle, est une figure comprise d''une ligne droite, et moitié de la circonférence.**»
Euclide:Définition 19, «**Section de cercle, est une figure comprise d''une droite, et d''une partie de la circonférence.**» Pour Euclide, une figure est une portion du plan limitée par une frontière. Ici la frontière est constituée par un rayon et une partie de la circonférence et est fermée par un autre rayon.

Aide-mémoire p.99 : « **Un cercle est l''ensemble des points du plan situés à égale distance d''un point appelé centre. Cette distance est le rayon du cercle.**» ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_2Cercles_21CercleRayon;
        add: self section_Expert_GéométrieEtSystèmeExpert_2Cercles_22RapportCirconférenceRayon;
        add: self section_Expert_GéométrieEtSystèmeExpert_2Cercles_23CercleIsométrie;
        add: self section_Expert_GéométrieEtSystèmeExpert_2Cercles_24CercleAbscisse;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/18/2025 23:06:23'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_21Cercle
^(EruditeBookSection basicNew title: '2.1 Cercle'; document: ((EruditeDocument contents: '
!!!! 2.1 Cercle.

**Rappel**

Euclide:Définition 15, « **Un cercle est une figure plane comprise par une seule ligne qu''on nomme circonférence,
toutes les droites menées à la circonférence d''un point placé dans cette figure étant égales entre elles. **» 

** 2.1 La figure.**

[[[ fig := DrGeoFigure nouveau.		
exp:= fig expert.
exp chargeRegles:''angles''.
exp chargeRegles:''figuresNonRectilignes''.
a := fig point: 3@3. a nommer:''A''.
o := fig point: 0@0 .
r := fig segmentDe: o à: a.
cer := fig cercleCentre: o passantPar:  a.	
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''Sud''.
fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.

**La position d''un point sur le cercle**

**Abscisse curviligne** d''un point sur le cercle.

La position d''un point sur le cercle est donnée par son  curviligne donnée par le prédicat **abscisseDe:sur:rep:**


pointSur ?cer  ?x1 
abscisseDe:sur:rep: ?x1 ?cer ?res
[[[fig presenter expertDisplayTutor:''Expert et géométrie'' string:''

pointSur ?cer  ?x1 
abscisseDe:sur:rep: ?x1 ?cer ?res'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.


L''origine de l''abscisse est le point du cercle le plus à droite, le point Est, son l''abscisse est 0. 
Les autre points se répartissent en tournant dans le sens inverse des aiguilles d''une montre. 
Nord Ouest Sud .
Les valeurs de l''abscisse vont de 0 à 1.

Comme le cercle finit là où il a commencé donc la valeur de Est est aussi 1.

**Remarque.**
Un prédicat est une métodes smalltalk qui répond true ou false (vrai ou faux).

On peut utiliser un prédicat dans une condition, le premier mot est la suite des sélecteurs suivie des paramétres.

Il faut au moins une question dans une condition, on peut utiliser une question toujours vraie comme **pointSur ?cer  ?x1**   dans l''exemple ci-dessus.




** 2.2 Rapport entre circonférence et rayon**
Le rapport entre circonférence et rayon est constant mais ce n''est pas un rationel  ( une fraction )  car après la virgule les décimales sont toujours différentes, il n''y a pas de période.

Comme  le nombre de décimales est infini, on ne peut avoir une valeur exacte, c''est un nombre appelé **transcendant** représenté par la lettre greque π (pi).

Les abscisses curvilignes sont des fractions de la circonférence.

L''abscisse de Nord , 0.25 correspond à 1/4 de circonférence.   ( 2 π r ) 1/4 soit ( π . 1/4 ) . 2 r.

L''abscisse de Ouest , 0.5  correspond à 1/2 de circonférence.  ( 2 π r ) 1/2 soit ( π . 1/2 ) . 2 r.

L''abscisse de Sud ,    0.75 correspond à 3/4 de circonférence. ( 2 π r ) 3/4  soit ( π. 3 /2) . 2 r.

L''abscisse de Est ,     1      correspond à la  circonférence.        ( 2 π r ) 1     soit ( π. 1)  .    2 r.

Si on prend π comme unité de mesure on doit diviser tous ces résultats par π  et on élimine ainsi  π .

On n''a alors que des fractions donc des nombres rationels.

Tu retrouvera ça plus tard avec la mesure des angles.


[[[ fig := DrGeoFigure nouveau.
exp:= fig expert.
fig:= DrGeoFigure nouveau.
exp:= fig expert.
exp drgeo: fig.
fig texte:''déplace le point P pour changer le rayon
 et observe les valeurs.'' à:-8@9.
o := fig point: -2@-2 .o nommer:''O''.
p := fig point: 0@0.p nommer:''P''.
p couleur: Color green.
cer := fig cercleCentre:  o passantPar: p. 
s := fig segmentDe:o  à: p.
mseg:= fig longueurDe: s. 
mcer :=  fig longueurDe: cer. 
vseg  := mseg morph mathItem valueItem .
vcer := mcer morph mathItem valueItem.
quot := vcer/vseg.
res:=fig valeur:quot.
mseg nommer:''rayon''.
mcer nommer: ''circonférence''.
res  nommer: ''quotient circ / rayon''.
mcer déplacerA: -6@6.
mseg déplacerA: -6@5.
res déplacerA: -6@4.
fig actualiser. ]]] doItWithButton:Charger la démonstration du rapport constant .



**Couple**

Pour le système expert on définit un un couple par une liste de deux points.

**Rayon du cercle.**

Le rayon du cercle est un couple dont le premier point es le centre du cercle et le second sur la circonférence,

**Segment**

On peut relier le centre du cercle à un point de la circonférence par un segment.

Remarque; Les extrémités d''un segment sont un couple définit par les extrémités du segment dans l''ordre alphabétique, ce couple ne correspond pas nécessairement au rayon, Il faut mettre en ordre alphabétique les points du rayon pour avoir le couple associé au segment et retrouver le segment.

**Isométrie**

La définition du cercle est que la distance d''un point de la circonférence au centre du cercles est la même pour tous les points de la circonférence.

 Deux objets sont isométriques s''ils ont même mesure, donc les rayons d''un cercle sont isométriques et les segments aussi.

**Représentation de la relation  isométrique**.

La relation **isométrique** est une relation d''équivalence, 0n peut représenter  la relation explicitement en décrivant toutes les relation entre deux objets,

Dans notre exemple on a les points: Est Nord Ouest Sud et chacun de ces points forme un rayon avec le centre C, [ C Est ] [ C Nord ]  [ C Ouest ]  [ C Sud ]

**Transitivitè**

**si a relation b et b relation c alors a relation c** . Celà revient à dire que l''un des  éléments est en relation avec  relation btous les autres ce qui peut se résumer par:
   
[ C Est ]		 	est isométriique  à 					[ C Nord ] 			[ C Ouest ] 			[ C Sud ]
[ C Nord ] 		  	est isométriique  à					[ C Ouest ]			[ C Sud ]    			[ C Est ] 
[ C Ouest ]		 	est isométriique  à					[ C Sud ]		 	[ C Est ] 			[ C Nord ]
[ C Sud ]			est isométriique  à					[ C Est ] 			[ C Nord ]  			[ C Ouest ]

Chaque ligne représente 3 relations, il y a 4 lignes donc le total est 12 relations.

**Commutativité **
 
si a relation b alors b relation a

[ C Nord ] 			[ C Ouest ] 			[ C Sud ]			sont isométriique  à					[ C Est ]							
[ C Ouest ]			[ C Sud ]    			[ C Est ]			sont isométriique  à					[ C Nord ] 			
[ C Sud ]		 	[ C Est ] 			[ C Nord ]			sont isométriique  à					[ C Ouest ]		 relation 
[ C Est ] 			[ C Nord ]  			[ C Ouest ]			sont isométriique  à					[ C Sud ]			

Chaque ligne représente 3 relations, il y a 4 lignes donc le total est 12 relations.				

**Réflexivité**
a relation a chaque objet est en relation avec lui-même.

 4  ojbets donc 4 relations.

Total de toutes les relations  12 + 12 + 4 = 28 relations

Dans une figure avec un cercle on peut avoir d''autres couples qui n''appartiennent pas au cercle, éventuellement à un autre cercle dans ce cas  on aura une autre  relation entre ces couples.

On peut regrouper dans un ensemOn peurble les couples d''un cercle et dans un autre les couples de l''autre cercle, si l''on connait dans quel ensemble est un couple, on peut dire qu''il est en reation avec tous les aurtes couple de cet ensemble.

L''ensemble des objets en relation entre eux est une représentation de la relation qui nest plus simple que de citer tous les objets en relation, c''est cette représentstion qu''utilise le système expert, pour vérifier si deux objets son en relation, il lui suffit de trouver l''ensemble qui contient un objet et de vérifier si cet ensemble contient aussi l''autre objet, C''est beaucoup plus rapide que de chercher dans le liste des relations.

De plus la liste des relations s''allonge très vite.
avec 4 objets on avait  2 (4 x 3) + 4 =28
avec 5 objets on a 2 x ( 5 x 4 x 3) + 5  = 120 + 5
avec 6 objets on a 2 x (6 x 5 x 4 x 3) + 5  = 720 +6
,,,

Le prédicat **relation:rep:** affiche la liste des sous ensembles d''objets qui répondent à la relation.

Avec un seul cercle, il n''y a qu''un sous ensemble, tous les couples se retrouvent ensembles,
point A
relation:rep: isométrique ?res
[[[fig presenter expertDisplayTutor:''Expert et géométrie'' string:''
point A
relation:rep: isométrique ?res'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.
point A
relation:rep: isométrique ?res''


[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''
point A
relation:rep: isométrique ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.

[[[ fig := DrGeoFigure nouveau.		
fig échelle: 15.
exp:= fig expert.
exp chargeRegles:''angles''.
exp chargeRegles:''figuresNonRectilignes''.
a := fig point: 2@6. a nommer:''A''.
o := fig point: -3@0 .
o nommer:''O1''.
o2 := fig point: 7@3.5 .o2 nommer:''O2''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''cer1''.cer couleur: Color red.
cer2 := fig cercleCentre: o2 passantPar:  a.	
cer2 nommer: ''cer2''.cer2 couleur: Color green.
p1 := fig pointSurLigne: cer2   à: 0.9.
p1 nommer:''P1''.p1 couleur: Color green.
p2 := fig pointSurLigne: cer2   à: 0.2.
p2 nommer:''P2''.p2 couleur: Color green.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''Sud''.
fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure de deux cercles et les modèles de questions.

[[[fig := DrGeoFigure  nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert''  string: ''
fig := DrGeoFigure nouveau.		
fig échelle: 15.
exp:= fig expert.
exp chargeRegles:''''figuresNonRectilignes''''.
a := fig point: 2@6. a nommer:''''A''''.
o := fig point: -3@0 .
o nommer:''''O1''''.
o2 := fig point: 7@3.5 .o2 nommer:''''O2''''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''''cer1''''.cer couleur: Color red.
cer2 := fig cercleCentre: o2 passantPar:  a.	
cer2 nommer: ''''cer2''''.cer2 couleur: Color green.
p1 := fig pointSurLigne: cer2   à: 0.9.
p1 nommer:''''P1''''.p1 couleur: Color green.
p2 := fig pointSurLigne: cer2   à: 0.2.
p2 nommer:''''P2''''.p2 couleur: Color green.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''''Est''''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''''Nord''''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''''Ouest''''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''''Sud''''.
exp initFaits.
exp lisFigureDrgeo.
exp deduis.
exp modèlesQuestions.
'']]] doItWithButton: copier le script de la figure pour l''''exécuter.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/9/2025 19:32:21'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_21CercleAbscisse
^(EruditeBookSection basicNew title: '2.1 Cercle. abscisse.'; document: ((EruditeDocument contents: '!!!! 2.1 Cercle. abscisse curviligne.

**Rappel**

Euclide:Définition 15, « **Un cercle est une figure plane comprise par une seule ligne qu''on nomme circonférence,
toutes les droites menées à la circonférence d''un point placé dans cette figure étant égales entre elles. **» 

	**2.1.1 La figure.**

[[[ fig := DrGeoFigure nouveau.
exp:= fig expert.
exp chargeRegles:''EuclideMinimum''.
a := fig point: 2@5. a nommer:''A''.
o := fig point: 0@0 .
o nommer:''O1''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''cer1''.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''Sud''.
exp initFaits.
exp lisFigureDrgeo.
exp deduis.
exp modèlesQuestions.
fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.

	**3 2.2.Abscisse curviligne d''un point sur le cercle.**

	La position d''un point sur le cercle est donnée par son  abscisse curviligne

	Le premier point est le point le plus à droite (Est).

	Les autre points se répartissent en tournant dans le sens inverse des aiguilles d''une montre. Nord Ouest Sud .

	Les valeurs de l''abscisse vont de 0 à 1.

	Comme le cercle finit là où il a commencé,  la valeur de l''abcsisse de Est est aussi 1.

	Le prédicat **abscisseDe:sur:rep:** donne l''abcscisse curviligne d''un point sur une ligne.

	**pointSur ?cercle ?point 
abscisseDe:sur:rep: ?point ?cercle ?res**
[[[fig presenter expertDisplayTutor:''Expert et géométrie'' string:''
pointSur ?cercle ?point 
abscisseDe:sur:rep: ?point ?cercle ?res'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

	**exp verifieCondition''
point A
relation:rep: isométrique ?res''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''pointSur ?cercle ?point 
abscisseDe:sur:rep: ?point ?cercle ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.


	**2.1.5 Remarque.**

	Un **prédicat** est une métodes smalltalk qui répond **true** ou **false** (vrai ou faux).
	
	Le premier mot d''un **prédicat** est la suite des sélecteurs suivie des paramétres.

	Il faut au moins une question dans une condition, dans l''exemple ci-dessus c''est : 
	**pointSur ?cer  ?x1**.
	( dans cet exempie  la valeur de ?x1 est utilisée aussi dans le prédicat,

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_2Cercles_21CercleAbscisse_22CordeDiamètre;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/24/2025 02:05:45'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_21CercleAbscisse_22CercleRayons
^(EruditeBookSection basicNew title: '2.2 Cercle, rayons'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/9/2025 19:32:21'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_21CercleAbscisse_22CordeDiamètre
^(EruditeBookSection basicNew title: '2.2 Corde, diamètre, '; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_21CercleRayon
^(EruditeBookSection basicNew title: '2.1 Cercle rayon'; document: ((EruditeDocument contents: '!!!! 2.1 Cecle rayon
	**2.1.1 Rayon du cercle.**

**2.1,1,1 La figure**

	[[[ fig := DrGeoFigure nouveau.
exp:= fig expert.
exp chargeRegles:''EuclideMinimum''.
a := fig point: 2@5. a nommer:''A''.
o := fig point: 0@0 .
o nommer:''O1''.
seg:=fig segmentDe: o à: a.
seg nommer:''O1A''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''cercle''.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''Sud''.
exp initFaits.
exp lisFigureDrgeo.
exp deduis.
fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.

	**2.1,1,1,1 Rayon défini par une liste de deux points**

  	Le premier point est le **centre du cercle** et le second **un point sur la circonférence.**	
		**cercle ?x1 [ rayon: ?x2 ]**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''cercle ?x1 [ rayon: ?x2 ]'']]] doItWithButton:copier pour vérifier avec le menu expert.

	**exp verifieCondition''relationCréée  ?x1 ?x2 ?x3''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''cercle ?x1 [ rayon: ?x2 ]''''
'']]] doItWithButton:copier le code pour l''''exécuter.	
 	
	On obtient tous les rayons soit représentés soit par une liste de points soit par un segment.

	**Remarques**. 

	La liste pour un **rayon** va toujours du **centre** vers la **circonférence.** contrairement à un couple qui est une liste de deux points dans l**dans l''ordre alphabétique des noms des  points** 
	
	On peut obtenir les rayons comme des couples.

	**2.1,1,1,2 Rayons comme couples**

		**cercle ?x1 [ rayonCouple: ?x2 ]**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''cercle ?x1 [ rayonCouple: ?x2 ]'']]] doItWithButton:copier pour vérifier avec le menu expert.

		**exp verifieCondition''cercle ?x1 [ rayonCouple: ?x2 ]''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''cercle ?x1 [ rayonCouple: ?x2 ]''''
'']]] doItWithButton:copier le code pour l''''exécuter.	
 

	**2.1,1,1,3 Rayon défini par un segment**

	Un segment est définit par le couple de ses extrémités.
	Une extrémité du segment est **le centre**, l''autre extrémité est **un point sur la circonférence**.

		**cercle ?x1 [ rayon: ?x2 ]
		segment ?x2**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''cercle ?x1 [ rayon: ?x2 ]
segment ?x2'']]] doItWithButton:copier pour vérifier avec le menu expert.

		**exp verifieCondition''cercle ?x1 [ rayon: ?x2 ]
segment ?x2''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''cercle ?x1 [ rayon: ?x2 ]
segment ?x2''''
'']]] doItWithButton:copier le code pour l''''exécuter.	

 ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/9/2025 19:32:21'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_22CercleIsométrie
^(EruditeBookSection basicNew title: '2.2 Cercle Isométrie'; document: ((EruditeDocument contents: '!!!!2.3 Cercle Isométrie

	**2.3.1 La figure.**
	
[[[ fig := DrGeoFigure nouveau.
exp:= fig expert.
exp chargeRegles:''EuclideMinimum''.
a := fig point: 2@5. a nommer:''A''.
o := fig point: 0@0 .
o nommer:''O1''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''cer1''..
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''Sud''.
exp initFaits.
exp lisFigureDrgeo.
exp deduis.
exp modèlesQuestions.
fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.

	**2.3.2 Isométrie**

	La définition du cercle est que la **distance d''un point de la circonférence au centre du cercles** est la même pour tous les points de la circonférence.

 	Deux objets sont i**sométriques** s''ils ont **même mesure**, donc les **rayons** d''un cercle sont isométriques et les **segments** aussi.

	**2.3.3 Représentation de la relation  isométrique**.

	La relation **isométrique** est une relation d''équivalence, 

	0n peut représenter la relation explicitement en décrivant toutes les relation entre deux objets,

	Dans notre exemple on a les points: **Est Nord Ouest Sud** qui définisseni un **rayon** avec le **centre C: [ C Est ] [ C Nord ]  [ C Ouest ]  [ C Sud ].**

	Ces rayons ont **même mesure**, ils sont **isométriques.**

	**2.3.3 Relation Isométrique**


 		**2.3.3,1 Transitivitè**

		**si a relation b et b relation c alors a relation c** . 

		Celà revient à dire que l''un des  couple est en relation avec tous les autres, ce qui peut se résumer par:
   
		[ C Est ]		 	 isométriique  à 	 			[ C Nord ] 			[ C Ouest ] 			[ C Sud ]
		[ C Nord ] 		  	 isométriique  à				[ C Ouest ]			[ C Sud ]    			[ C Est ] 
		[ C Ouest ]		 	 isométriique  à				[ C Sud ]		 	[ C Est ] 			[ C Nord ]
		[ C Sud ]			 isométriique  à				[ C Est ] 			[ C Nord ]  			[ C Ouest ]

		Chaque ligne représente 3 relations, il y a 4 lignes donc le total est 12 relations.

		**2.3.3.2 Commutativité. **
 
		**si a relation b alors b relation a**

		[ C Nord ] 			[ C Ouest ] 			[ C Sud ]			 isométriique  à				[ C Est ]							
		[ C Ouest ]			[ C Sud ]    			[ C Est ]			 isométriique  à				[ C Nord ] 
		[ C Sud ]		 	[ C Est ] 			[ C Nord ]			 isométriique  à				[ C Ouest ]		  
		[ C Est ] 			[ C Nord ]  			[ C Ouest ]			 isométriique  à				[ C Sud ]			

		Chaque ligne représente 3 relations, il y a 4 lignes donc le total est 12 relations.				

		**2.3.3.3 Réflexivité**

		Chaque couple est en relation avec lui-même.

 		4  ojbets donc 4 relations.

		**2.3.	3.4 Nombre de relations**	

		Total de toutes les relations  12 + 12 + 4 = 28 relations
		
	**2.3.4 Représentation d''une relation par un ensenble.**
	
	Avec plus de points, le nombre de couples entre 2 points augmente rapidement.
	Avec 4 points on avait  2 (4 x 3) + 4 =28
	Avec 5 points on a 2 x ( 5 x 4 x 3) + 5  = 120 + 5
	Avec 6 points on a 2 x (6 x 5 x 4 x 3) + 5  = 720 +6
	...

	Comme tous ies couples de points sont en relation avec tous les autres, on peut mettre dans un même ensemble tous les couples d''une relation.

	Pour savoir si deux couples sont en relation, il suffit de vérifier s''ils appartiennent au même ensemble.

	L''ensemble des objets en relation entre eux est une représentation de la relation plus simple que d''énumérer tous les couples en relation, 

	C''est cette représentstion qu''utilise le système expert.

	**2.3.5 Prédicats pour traiter les relations avec le système expert.**

       		**2.3.5.1 relationCrée:et:nom;**

		Ce prédicat est utilisé dans une règle.

		Il établit une nouvelle relation entre deux objets et donne un nom à cette relation.
		
		**2.3.5.2 relation:rep:**
	  	
		Ce prédicat retourne une liste des ensembles d''une relation.

		**point A
 		relation:rep: isométrique ?res**
[[[fig presenter expertDisplayTutor:''Expert et géométrie'' string:''
point A
relation:rep: isométrique ?res'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

exp verifieCondition''
point A
relation:rep: isométrique ?res''


[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''point A
relation:rep: isométrique ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.

Avec un seul cercle, il n''y a qu''un sous ensemble, tous les couples se retrouvent ensembles,


[[[
fig échelle: 15.
exp:= fig expert.
exp chargeRegles:''angles''.
exp chargeRegles:''figuresNonRectilignes''.
a := fig point: 2@6. a nommer:''A''.
o := fig point: -3@0 .
o nommer:''O1''.
o2 := fig point: 7@3.5 .o2 nommer:''O2''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''cer1''.cer couleur: Color red.
cer2 := fig cercleCentre: o2 passantPar:  a.	
cer2 nommer: ''cer2''.cer2 couleur: Color green.
p1 := fig pointSurLigne: cer2   à: 0.9.
p1 nommer:''P1''.p1 couleur: Color green.
p2 := fig pointSurLigne: cer2   à: 0.2.
p2 nommer:''P2''.p2 couleur: Color green.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''Sud''.
fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure de deux cercles et les modèles de questions.

point A
relation:rep: isométrique ?res
[[[fig presenter expertDisplayTutor:''Expert et géométrie'' string:''
point A
relation:rep: isométrique ?res'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

Les couples d''un cercle sont dans le même ensemble.

[[[fig := DrGeoFigure nouveau.		
fig presenter expertDisplayTutor:''Géométrie  et Système Expert''  string: ''

fig échelle: 15.
exp:= fig expert.
exp chargeRegles:''''figuresNonRectilignes''''.
a := fig point: 2@6. a nommer:''''A''''.
o := fig point: -3@0 .
o nommer:''''O1''''.
o2 := fig point: 7@3.5 .o2 nommer:''''O2''''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''''cer1''''.cer couleur: Color red.
cer2 := fig cercleCentre: o2 passantPar:  a.	
cer2 nommer: ''''cer2''''.cer2 couleur: Color green.
p1 := fig pointSurLigne: cer2   à: 0.9.
p1 nommer:''''P1''''.p1 couleur: Color green.
p2 := fig pointSurLigne: cer2   à: 0.2.
p2 nommer:''''P2''''.p2 couleur: Color green.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''''Est''''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''''Nord''''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''''Ouest''''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''''Sud''''.
exp initFaits.
exp lisFigureDrgeo.
exp deduis.
exp modèlesQuestions.
'']]] doItWithButton: copier le script de la figure avec  deux cercles pour l''''exécuter.


point A
relation:rep: isométrique ?res
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point A
relation:rep: isométrique ?res
'']]] doItWithButton:copier pour vérifier avec le menu expert.


exp verifieCondition''
point A
relation:rep: isométrique ?res''

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''point A
relation:rep: isométrique ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_22RapportCirconférenceRayon
^(EruditeBookSection basicNew title: '2.2 Rapport circonférence / rayon'; document: ((EruditeDocument contents: '** 2.2 Rapport entre circonférence et rayon**

	**2.2.1 Démonstration**
[[[
fig := DrGeoFigure nouveau. 
exp:= fig expert.
exp drgeo: fig.
ExpertRegle EuclideMinimum: exp .
fig texte:''Déplace le point P pour changer 
le rayon et observe les valeurs.'' à:-7@6.  
o := fig point: 0@0 .o nommer:''O''.
p := fig point: 0@3.p nommer:''A''.
p couleur: Color green.
cer := fig cercleCentre:  o passantPar: p. 
s := fig segmentDe:o  à: p.
mseg := fig longueurDe: s. 
mcer  :=  fig longueurDe: cer. 
fig texte: ''rapport = (circonférence / segment ) ''  à:  -7@-4.
mcer déplacerA: -7@ -5. mcer nommer:''rapport''.
mseg déplacerA: -05@ -5.  
fig texte:'' /'' à: -1@ -5.
vseg  :=   ((fig longueurDe: s) mathItem ) valueItem . 
vcer :=  (( fig longueurDe: cer )mathItem ) valueItem .
res :=vcer / vseg. 6.283185307179586 .
quot :=fig value: res.
quot nommer:'' ''  .
quot déplacerA: 0.8@ -5.  
fig texte: '' = π'' à: 4.5@ -5. 
exp deduis.]]] doItWithButton:Charger la démonstration du rapport constant .

	Le rapport entre circonférence et rayon est constant mais ce n''est pas un rationel  ( une fraction )  car après la virgule les décimales sont toujours différentes, il n''y a pas de période.

	Comme  le nombre de décimales est infini, on ne peut avoir une valeur exacte, c''est un nombre appelé **transcendant** représenté par la lettre greque π (pi).

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_23CercleIsométrie
^(EruditeBookSection basicNew title: '2.3 Cercle Isométrie'; document: ((EruditeDocument contents: '!!!!2.2 Cercle Isométrie

!!!!Cercle Isométrie
	**2.2.1 Isométrie des rayons**

	La définition du cercle est que la **distance d''un point de la circonférence au centre du cercles** est la même pour tous les points de la circonférence.
	
	La mesure d''un rayon est la distance entre le centre et un point de la circonférence.

 	Deux objets sont **isométriques** s''ils ont **même mesure**, donc les **rayons** d''un cercle sont isométriques. 

	Un segment relie deux points, un rayon peut être représenté par le **segment** qui relie **le centre** à l**a ciconférence**, mais ces  deux points suffisent à représenter le rayon,  une liste de deux points est un **couple**

	Pour le rayon,  le **centre** est **le premier élémement** de la liste, le point sur la circonférence est le **dernier élément** de la liste.

	Le couple des **extrémités d''un segment** est ordonné,les éléments sont **dans l''ordre alphabétique du nom des points qui en sont les extrémités**.

	Le **couple** qui représente un **rayon** peut être différent de celui qui représente un **segment**..
 

	**2.2.2 La figure.**
	
[[[ fig := DrGeoFigure nouveau.
exp:= fig expert.
exp initRegles.
exp chargeRegles:''EuclideMinimum''.
a := fig point: 2@5. a nommer:''A''.
o := fig point: 0@0 .
o nommer:''O1''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer:''Cercle''.
seg := fig segmentDe: o à: a.
seg nommer: ''sO1A''.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: '' Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: '' Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: '' Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: '' Sud''.
dest := fig distanceDe: o à: est.
dnord := fig distanceDe: o à: nord.
douest:= fig distanceDe: o à: ouest.
dsud := fig distanceDe: o à: sud.
dest  déplacerA:(-7@10.5).
dnord  déplacerA:(-7@9.5).
douest  déplacerA:(-7@8.5).
dsud  déplacerA:(- 7@7.5).
fig actualiser.
exp initFaits.

exp lisFigureDrgeo.
exp deduis.
exp modèlesQuestions.
fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig := DrGeoFigure nouveau.
fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''.
exp:= fig expert.
exp initRegles.
exp chargeRegles:''''EuclideMinimum''''.
a := fig point: 2@5. a nommer:''''A''''.
o := fig point: 0@0 .
o nommer:''''O1''''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer:''''Cercle''''.
seg := fig segmentDe: o à: a.
seg nommer: ''''sO1A''''.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: '''' Est''''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: '''' Nord''''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: '''' Ouest''''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: '''' Sud''''.
dest := fig distanceDe: o à: est.
dnord := fig distanceDe: o à: nord.
douest:= fig distanceDe: o à: ouest.
dsud := fig distanceDe: o à: sud.
dest  déplacerA:(-7@10.5).
dnord  déplacerA:(-7@9.5).
douest  déplacerA:(-7@8.5).
dsud  déplacerA:(- 7@7.5).
fig actualiser.
exp initFaits.

exp lisFigureDrgeo.
exp deduis.
exp modèlesQuestions.
'']]] doItWithButton: copier le script de la figure  l''''exécuter.


	**relationCréée  ?x1 ?x2 ?x3**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''relationCréée  ?x1 ?x2 ?x3'']]] doItWithButton:copier pour vérifier avec le menu expert.

	**exp verifieCondition''relationCréée  ?x1 ?x2 ?x3''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''relationCréée  ?x1 ?x2 ?x3''''
'']]] doItWithButton:copier le code pour l''''exécuter.


	**2.3.3 Représentation de la relation  isométrique**.

	La relation **isométrique** est une relation d''équivalence, 

	0n peut représenter la relation explicitement en décrivant toutes les relation entre deux objets,

	Dans notre exemple on a les points: **Est Nord Ouest Sud** qui définisseni un **rayon** avec le **centre C: [ C Est ] [ C Nord ]  [ C Ouest ]  [ C Sud ].**

	Ces rayons ont **même mesure**, ils sont **isométriques.**

	**2.3.3 Relation Isométrique**


 		**2.3.3,1 Transitivitè**

		si a **relation** b et b **relation** c alors a **relation c** . 

		Celà revient à dire que, par **transitivité**, l''un des  couple est en relation avec tous les autres, ce qui peut se résumer par:
   
		[ C Est ]		 	 isométriique  à 	 			[ C Nord ] 			[ C Ouest ] 			[ C Sud ]
		[ C Nord ] 		  	 isométriique  à				[ C Ouest ]			[ C Sud ]    			[ C Est ] 
		[ C Ouest ]		 	 isométriique  à				[ C Sud ]		 	[ C Est ] 			[ C Nord ]
		[ C Sud ]			 isométriique  à				[ C Est ] 			[ C Nord ]  			[ C Ouest ]

		Chaque ligne représente 3 relations, il y a 4 lignes donc le total est 12 relations.

		**2.3.3.2 Commutativité. **
 
		Si a **relation** b alors b **relation** a.

		[ C Nord ] 			[ C Ouest ] 			[ C Sud ]			 isométriique  à				[ C Est ]							
		[ C Ouest ]			[ C Sud ]    			[ C Est ]			 isométriique  à				[ C Nord ] 
		[ C Sud ]		 	[ C Est ] 			[ C Nord ]			 isométriique  à				[ C Ouest ]		  
		[ C Est ] 			[ C Nord ]  			[ C Ouest ]			 isométriique  à				[ C Sud ]			

		Chaque ligne représente 3 relations, il y a 4 lignes donc le total est 12 autres relations.				

		**2.3.3.3 Réflexivité**

		Chaque couple est en relation avec lui-même, a **relation** a.

 		4  ojbets donc 4 relations.

		**2.3.	3.4 Nombre de relations**	

		Total de toutes les relations  12 + 12 + 4 = 28 relations
		
	**2.3.4 Représentation d''une relation par un ensenble.**
	
	Avec plus de points, le nombre de couples entre 2 points augmente rapidement.
	Avec 4 points on avait  2 (4 x 3) + 4 =28
	Avec 5 points on a 2 x ( 5 x 4 x 3) + 5  = 120 + 5
	Avec 6 points on a 2 x (6 x 5 x 4 x 3) + 5  = 720 +6
	...

	Comme tous ies couples de points sont en relation avec tous les autres, on peut mettre dans un même ensemble tous les couples d''une relation.

	Pour savoir si deux couples sont en relation, il suffit de vérifier s''ils appartiennent au même ensemble.

	L''ensemble des objets en relation entre eux est une représentation de la relation plus simple que d''énumérer tous les couples en relation, 

	C''est cette représentstion qu''utilise le système expert.

	**2.3.5 Prédicats pour traiter les relations avec le système expert.**

       		**2.3.5.1 relationCrée:et:nom;**

		Ce prédicat est utilisé dans une règle.

		Il établit une nouvelle relation entre deux objets et donne un nom à cette relation.
		
		**2.3.5.2 relation:rep:**
	  	
		Ce prédicat retourne une liste des ensembles d''une relation.

		**point A
 		relation:rep: isométrique ?res**
[[[fig presenter expertDisplayTutor:''Expert et géométrie'' string:''
point A
relation:rep: isométrique ?res'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

		**exp verifieCondition''
		point A
		relation:rep: isométrique ?res''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''point A
relation:rep: isométrique ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.

Avec un seul cercle, il n''y a qu''un sous ensemble, tous les couples se retrouvent ensembles,
Les couples d''un cercle sont dans le même ensemble.

[[[
fig :=DrGeoFigure nouveau.
fig échelle: 15.
exp:= fig expert.
exp chargeRegles:''EuclideMinimum''.
exp chargeRegles:''figuresNonRectilignes''.
a := fig point: 2@6. a nommer:''A''.
o := fig point: -3@0 .
o nommer:''O1''.
o2 := fig point: 7@3.5 .o2 nommer:''O2''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''cer1''.cer couleur: Color red.
cer2 := fig cercleCentre: o2 passantPar:  a.	
cer2 nommer: ''cer2''.cer2 couleur: Color green.
p1 := fig pointSurLigne: cer2   à: 0.9.
p1 nommer:''P1''.p1 couleur: Color green.
p2 := fig pointSurLigne: cer2   à: 0.2.
p2 nommer:''P2''.p2 couleur: Color green.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''cer1''..
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''Sud''.

fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure de deux cercles et les modèles de questions.


[[[fig échelle: 15.
exp:= fig expert.
exp chargeRegles:''''EuclideMinimum''''.
a := fig point: 2@6. a nommer:''''A''''.
o := fig point: -3@0 .
o nommer:''''O1''''.
o2 := fig point: 7@3.5 .o2 nommer:''''O2''''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''''cer1''''.cer couleur: Color red.
cer2 := fig cercleCentre: o2 passantPar:  a.	
cer2 nommer: ''''cer2''''.cer2 couleur: Color green.
p1 := fig pointSurLigne: cer2   à: 0.9.
p1 nommer:''''P1''''.p1 couleur: Color green.
p2 := fig pointSurLigne: cer2   à: 0.2.
p2 nommer:''''P2''''.p2 couleur: Color green.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''''Est''''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''''Nord''''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''''Ouest''''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''''Sud''''.
exp initFaits.
exp lisFigureDrgeo.
exp deduis.
exp modèlesQuestions.
'']]] doItWithButton: copier le script de la figure avec deux cercles pour l''''exécuter.


	**point A
	relation:rep: isométrique ?res**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point A
relation:rep: isométrique ?res
'']]] doItWithButton:copier pour vérifier avec le menu expert.

	**exp verifieCondition''
	point A
	relation:rep: isométrique ?res''**
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition:''''point A
relation:rep: isométrique ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.

Il y a deux ensembles l''un avec les rayons du cercle vert l''autre avec les rayons du cercle rouge.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/9/2025 19:32:21'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_23RapportCirconférenceRayon
^(EruditeBookSection basicNew title: '2.3 Rapport circonférence / rayon'; document: ((EruditeDocument contents: '** 2.2 Rapport entre circonférence et rayon**

	**2.2.1 Démonstration**
[[[
fig := DrGeoFigure nouveau. 
exp:= fig expert.
exp drgeo: fig.
ExpertRegle EuclideMinimum: exp .
fig texte:''Déplace le point P pour changer 
le rayon et observe les valeurs.'' à:-7@8.  
o := fig point: 0@-2 .o nommer:''O''.
p := fig point: 0@0.p nommer:''A''.
p couleur: Color green.
cer := fig cercleCentre:  o passantPar: p. 
s := fig segmentDe:o  à: p.
mseg := fig longueurDe: s. 
mcer  :=  fig longueurDe: cer. 
fig texte: ''rapport = (circonférence / segment ) ''  à:  -7@6.
mcer déplacerA: -7@5.
mcer nommer:''rapport''.
mseg déplacerA: -0.5@5.  
fig texte:''/'' à: -1@5.
vseg  :=   ((fig longueurDe: s) mathItem ) valueItem . 
vcer :=  (( fig longueurDe: cer )mathItem ) valueItem .
res :=vcer / vseg. 6.283185307179586 .
quot :=fig value: res.
quot nommer:'' ''.
 quot déplacerA: 1.3@5.  
fig texte: ''= π'' à: 4.5@5. 
exp deduis.]]] doItWithButton:Charger la démonstration du rapport constant .

	Le rapport entre circonférence et rayon est constant mais ce n''est pas un rationel  ( une fraction )  car après la virgule les décimales sont toujours différentes, il n''y a pas de période.

	Comme  le nombre de décimales est infini, on ne peut avoir une valeur exacte, c''est un nombre appelé **transcendant** représenté par la lettre greque π (pi).

	**2.2.2 abscisses curvilignes **

	Les abscisses curvilignes sont des fractions de la circonférence.

	L''abscisse de Nord , 0.25 est à 1/4 de circonférence.   ( 2 π r ) 1/4 soit ( π . 1/4 ) . 2 r.

	L''abscisse de Ouest , 0.5  est à 1/2 de circonférence.  ( 2 π r ) 1/2 soit ( π . 1/2 ) . 2 r.

	L''abscisse de Sud ,    0.75 est à 3/4 de circonférence. ( 2 π r ) 3/4  soit ( π. 3 /2) . 2 r.

	L''abscisse de Est ,     1     termine la circonférence.  	  	 ( 2 π r ) 1     soit ( π. 1)  .    2 r.

	Si on prend π comme unité de mesure on peut diviser tous ces résultats par π, on élimine ainsi  π . 
	
	On n''a alors que des fractions donc des nombres rationels. 

	Tu retrouvera ça plus tard avec la mesure des angles.

	**2.2.3 Couples**

	Souvent une paire de points joue un rôle particulier.

	Pour le système expert on définit un couple par une **liste de deux points**. //[ p1 p3 ]//.

	**2.2.4 Rayon du cercle.**

	Le rayon du cercle est un **couple de points** dont le premier point est le **centre du cercle** et le second **un point sur la circonférence.**

**2.2.5 Segment**

	On peut relier le centre du cercle à un point de la circonférence par un segment.	

	Le couple des extrémités d''un **segment** est ordonné, dans l''ordre alphabétique des noms des  points.

	Le couple d''un **rayon** va toujours du centre vers la circonférence.

	Il faut mettre en ordre alphabétique les points du rayon pour avoir les points du couple associé au segment. dans l''ordre.
	') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_2Cercles_24CercleAbscisse
^(EruditeBookSection basicNew title: '2.4 Cercle. abscisse.'; document: ((EruditeDocument contents: '!!!!2.1 Cercle rayon

	**Rayon représeté par une liste de deux points**.

	[[[ fig := DrGeoFigure nouveau.
exp:= fig expert.
exp chargeRegles:''EuclideMinimum''.
a := fig point: 2@5. a nommer:''A''.
o := fig point: 0@0 .
o nommer:''O1''.
seg:=fig segmentDe: o à: a.
seg nommer:''O1A''.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: ''cecle''.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: ''Est''.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: ''Nord''.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: ''Ouest''.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: ''Sud''.
exp initFaits.
exp lisFigureDrgeo.
exp deduis.
fig presenter expertInspect: ''Géométrie et système Expert'' style: true]]] doItWithButton: Charger la figure et les modèles de questions.


	Le premier élément de la liste est le centre du cercle.
	
	Le dernier élément de la liste est un point sur la circonférence.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_3Angles
^(EruditeBookSection basicNew title: '3 Angles '; document: ((EruditeDocument contents: '1.3 Angles

Euclide : Définition 8, «  angle plan est l''inclinaison mutuelle de deux lignes qui se touchent dans un plan, et  qui ne sont pas placées dans la même direction. ».

Euclide : Définition 9, « Lorsque des lignes qui comprennent un angle sont des droites, l''angle se nomme rectiligne ».

Aide-mémoire  p.101 : « Un angle est une portion du plan limitée par deux demi-droites de même origine. L''origine est appelée sommet de l''angle et les demi-droites sont les côtés.

Aide-mémoire  p.  90 : « Une demi-droite est une portion de droite limitée par un point. Ce point est appelé l’origine de la demi-droite.. ».') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_3Angles_31AngleEntreDemidroite;
        add: self section_Expert_GéométrieEtSystèmeExpert_3Angles_32AngleEntreDroites;
        add: self section_Expert_GéométrieEtSystèmeExpert_3Angles_33AngleEntreParallèles;
        add: self section_Expert_GéométrieEtSystèmeExpert_3Angles_34AngleObtuAigudroit;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_3Angles_31AngleEntreDemidroite
^(EruditeBookSection basicNew title: '3.1 Angle entre demi-droite'; document: ((EruditeDocument contents: '!!!!!!3.1 Angle entre demi-droite

	**3.1.1 Angle nul, plat, saillant ou entrant.**

	Un angle avec les demi-droites confondues est dit **angle nul** (0 degrés).

	Un angle avec les demi-droites opposées est dit **angle plat** (180 degrés).

	Un angle entre l''''angle nul et l''''angle plat ( angle entre 0 et 180 degrés) est dit **angle saillant**.

	Un angle plus grand que l''''angle plat ( plus grand que 180 degrés)  est  dit **angle entrant**.

	**3.1.2 Démonstration Angle Saillant ou Rentrant,**

[[[ 

fig := DrGeoFigure nouveau.
exp  := fig expert.
exp   drgeo:fig.
exp   chargeRegles:''Euclide:''.
a := fig point: 0@0.a nommer: ''A''.a couleur: Color green.
s := fig  point:  -3@0.s nommer: ''S''.
cer:= fig cercleCentre: s rayon: 3.
cer cacher.
b  :=fig pointSurLigne: cer à: 0.3755.b nommer: ''B''.b couleur: Color green.
b couleur: Color green.
dd1 := fig demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := fig pointSurLigne: dd2 à: 0.9.
d nommer: ''D''.
d cacher.
fig segmentDe: s à: d.
fig angleSommet: s de:  a à: b.
a1:=fig arcCenter: s  from: a to: b.
a1 couleur: Color blue.
a2:=fig arcCenter: s  from: b  to: a.
a2 couleur: Color red.
p := fig pointSurLigne: dd1 à: 0.9774.
dr := fig demiDroiteOrigine: p  passantPar: b.dr nommer:''dr''.
dr cacher.
perp := fig perpendiculaireA: dd1 passantPar: s.   
pd1 := fig pointSurLigne: perp à: 0.9678.
pd2 := fig pointSurLigne: perp à: 0.0290..
demiPerp1:=fig demiDroiteOrigine: s passantPar: pd1.
demiPerp2:=fig demiDroiteOrigine: s passantPar: pd2.
saillant := fig intersectionDe: demiPerp1 et: dr.
entrant := fig intersectionDe: demiPerp2 et: dr.
(saillant  morph mathItem )exist 
ifTrue:[ saillant nommer:''angle saillant''.saillant couleur: Color blue.].
entrant := fig intersectionDe: demiPerp2 et: dr.  
b1:= b mathItem point.
b déplacerA: -5.4 @-1.8. fig actualiser.
(entrant  morph mathItem) exist
ifTrue:[ entrant nommer:''angle entrant''.entrant couleur: Color blue.].
b déplacerA: b1.
fig actualiser.
dd2 morph mathItem .
demiPerp1 cacher.
demiPerp2 cacher.
perp cacher.
pd1 cacher.
pd2 cacher.
dr cacher.
fig centrerVueEn: s mathItem  point.
fig texte: ''déplace le point B
observe l''''angle bleu'' à: -8@7.7.
]]] doItWithButton: Angle saillant ou entrant.

	**3.1.3 La figure**

[[[fig:= DrGeoFigure nouveau.
fig expert: exp.
fig échelle: 18.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
exp   drgeo:f.
exp  chargeRegles:''Euclide:''.
a := fig point: 0@0.a nommer: ''A''.a couleur: Color green.
b := fig point: 0@12.b nommer: ''B''.b couleur: Color green.
s := fig point:  -9@4.s nommer: ''S''.
dd1 := fig demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := fig pointSurLigne: dd2 à: 0.9.d nommer: ''D''. 
ang := fig angleSommet: s de: c à: d.   ang nommer:''                 <) ''. 
fig  presenter expertDisplayModèles ]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig := DrGeoFigure nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
"1.3.1.1  Script de la Figure."
fig échelle: 18.
exp  :=fig expert.
exp  drgeo:fig.
exp  chargeRegles:''''Euclide:''''.
a := fig point: 0@0.a nommer: ''''A''''.a couleur: Color green.
b := fig point: 0@12.b nommer: ''''B''''.a couleur: Color green.
s := fig point:  -9@4.s nommer: ''''S''''.
dd1 := fig demiDroiteOrigine: s passantPbr:  a.
dd1 nommer: ''''dd1''''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''''C''''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''''dd2''''.
d := fig pointSurLigne: dd2 à: 0.9.d nommer: ''''D''''.
ang := fig angleSommet: s de: c à: d    . ang nommer: ''''         <)''''.exp  initFaits .
exp  lisFigure.
exp  deduis.
exp  modèlesQuestions .
''
]]] doItWithButton:Charger le script de la figure.

	**3,1.4 Angles équivalents**

	Des angles avec le même sommets que l''angle de base et des extrémités sur les mêmes demi-droites avec les mêmes positions sont équivalents.

	Une relation **équivalent** est créée entre l''angle de base et un angle.

	**exp  verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
exp  verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier le code.

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

	 **3.1.5 Représentation des relations d''équivalence.**

	Les règles qui affirment des relations **équivalent** ont une conclusion **relation créée** pour garder la trace des relations créées.

	Comme la relation **isométrique**,la relation**équivalent** a la propriété de partager l''ensemble des objets en ensembles d''objets équivalents, deux objets équivalents se retrouvent dans le même ensemble, 

	Pour vérifier si deux objets sont équivalents, il suffit de vérifier si ils appartiennent au même ensemble, ce qui est rapide; on n''affirme que certains faits qui sont équivalents, mais la relation a aussi d''autres faits équivalents en raison des propriétés de **transitivité** et de **commutativité** de la relation d''équivalence. 

	On peut comparer tous les éléments d''un ensemble à un élément choisi comme représentant de l''ensemble,

	Pour les angles, le représentant est l''angle0.

	Pour des fractions, le représentant est la fraction irréductible.

	On peut voir l''ensemble des relations avec le prédicat **relation:rep:**

	Dans cet exemple tous les angles sont équivalent et se retrouvent dans le même ensemble représenté par une liste.

	**point A
relation:rep: équivalent ?res**
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
	**point A
relation:rep: équivalent ?res**''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

	**exp verifieCondition: ''
point A
relation:rep: équivalent ?res**''
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
exp verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier le code.


	On voit que tous les angles équivalents se trouvent dans le même sous ensemble.
//Dans cet exemple il n''y a qu''un sous ensemble puisqu''''il n''''y qu''''un angle de base.//

	**3,1,6 Remarques:**

	Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents dans une conclusion. 

	Pour vérifier une condition, il faut au moins une affirmation, c''est pour ça que l''affirmation vraie **point A**  est ajoutée au début de la condition à vérifier.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_3Angles_32AngleEntreDroites
^(EruditeBookSection basicNew title: '3.2 Angle entre droites'; document: ((EruditeDocument contents: '!!!!!!1.3.2. Angle entre droites

"1.3.1.1  Script de la Figure."
Patientez, le chargement de la figure prend du temps.

[[[ fig:= DrGeoFigure new.
fig presenter expertDisplayTutor:''
 "1.3.1.1  Script de la Figure."
exp := fig expert.
exp chargeRegles:''''Euclide:''''.
a := fig point:-8@8.a nommer: ''''A''''.a couleur: Color green.
c := fig  point: 4@-5.c nommer: ''''C''''.
b := fig  point: -8@-1.b nommer: ''''B''''. b couleur: Color green.
d:= fig point: 7@7.d nommer: ''''D''''.
dd1 := fig droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := fig  droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=fig intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
exp  initFaits .
exp  lisFigure.
exp  deduis.
exp  modèlesQuestions .


'']]] doItWithButton: copier code du script.

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''''une relation d''''équivalence. 

exp  verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[fig presenter expertDisplayTutor:''
exp  verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier l''''exemple.


Pour le sytème expert définir une relation d''équivalence est plus efficace que d''''affimer tous les faits équivalents séparément lorsqu''on vérifie la relation dans une règle.
 
On n''affirme que certains faits sont équivalents mais la relation a aussi d''autres faits équivalents par exemple les angles  [ A S B ] et [ C S B ] sont aussi équivalents et il y a encore d''''autres relations, en fait on peut regrouper dans un ensemble tous les angles qui sont équivalents entre eux et il suffit de tester s''il sont dans le même ensemble pour savoir qu''ils sont équivalents.

exp  verifieCondition: ''''point A
relation:rep: équivalent ?res''''.
[[[fig  presenter expertDisplayTutor:''exp verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier l''''exemple.

On voit que tous lea angles équivalents se trouvent dans le même ensemble.

Remarque:
il ne peut pas y avoir que des prédicats dans une condition, il faut au moins une affirmation à vérifier, c''''est pour ça que l''affirmation vraie **point A**  est au début de la condition à vérifier
''') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/24/2025 02:10:21'!
section_Expert_GéométrieEtSystèmeExpert_3Angles_331AngleEntreDemidroite
^(EruditeBookSection basicNew title: '3.3.1 Angle entre demi-droite'; document: ((EruditeDocument contents: '!!!!!!1.3.1 Angle entre demi-droite

**Angle nul, plat, saillant ou entrant.**
Un angle avec les demi-droites confondues est dit **angle nul** (0 degrés).

Un angle avec les demi-droites opposées est dit **angle plat** (180 degrés).

Un angle entre l''''angle nul et l''''angle plat ( angle entre 0 et 180 degrés) est dit **angle saillant**.

Un angle plus grand que l''''angle plat ( plus grand que 180 degrés)  est  dit **angle entrant**.

[[[ 

fig := DrGeoFigure nouveau.
exp  := fig expert.
exp   drgeo:fig.
exp   chargeRegles:''Euclide:''.
a := fig point: 0@0.a nommer: ''A''.
s := fig  point:  -3@0.s nommer: ''S''.
cer:= fig cercleCentre: s rayon: 3.
cer cacher.
b  :=fig pointSurLigne: cer à: 0.3755.b nommer: ''B''.
b couleur: Color green.
dd1 := fig demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := fig pointSurLigne: dd2 à: 0.9.
d nommer: ''D''.
d cacher.
fig segmentDe: s à: d.
fig angleSommet: s de:  a à: b.
a1:=fig arcCenter: s  from: a to: b.
a1 couleur: Color blue.
a2:=fig arcCenter: s  from: b  to: a.
a2 couleur: Color red.
p := fig pointSurLigne: dd1 à: 0.9774.
dr := fig demiDroiteOrigine: p  passantPar: b.dr nommer:''dr''.
dr cacher.
perp := fig perpendiculaireA: dd1 passantPar: s.   
pd1 := fig pointSurLigne: perp à: 0.9678.
pd2 := fig pointSurLigne: perp à: 0.0290..
demiPerp1:=fig demiDroiteOrigine: s passantPar: pd1.
demiPerp2:=fig demiDroiteOrigine: s passantPar: pd2.
saillant := fig intersectionDe: demiPerp1 et: dr.
entrant := fig intersectionDe: demiPerp2 et: dr.
(saillant  morph mathItem )exist 
ifTrue:[ saillant nommer:''angle saillant''.saillant couleur: Color blue.].
entrant := fig intersectionDe: demiPerp2 et: dr.  
b1:= b mathItem point.
b déplacerA: -5.4 @-1.8. fig actualiser.
(entrant  morph mathItem) exist
ifTrue:[ entrant nommer:''angle entrant''.entrant couleur: Color blue.].
b déplacerA: b1.
fig actualiser.
dd2 morph mathItem .
demiPerp1 cacher.
demiPerp2 cacher.
perp cacher.
pd1 cacher.
pd2 cacher.
dr cacher.
fig centrerVueEn: s mathItem  point.
fig texte: ''déplace le point B
observe l''''angle bleu'' à: -8@7.7.
]]] doItWithButton: Tester les angles.

**Angles entre demi-droites.**

[[[fig:= DrGeoFigure nouveau.
fig expert: exp.
fig échelle: 18.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
exp   drgeo:f.
exp  chargeRegles:''Euclide:''.
a := fig point: 0@0.a nommer: ''A''.
b := fig point: 0@12.b nommer: ''B''.
s := fig point:  -9@4.s nommer: ''S''.
dd1 := fig demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''C''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
d := fig pointSurLigne: dd2 à: 0.9.d nommer: ''D''. 
ang := fig angleSommet: s de: c à: d.   ang nommer:''                 <) ''. 
fig presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.

[[[fig := DrGeoFigure nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
"1.3.1.1  Script de la Figure."
fig échelle: 18.
exp  :=fig expert.
exp  drgeo:fig.
exp  chargeRegles:''''Euclide:''''.
a := fig point: 0@0.a nommer: ''''A''''.
b := fig point: 0@12.b nommer: ''''B''''.
s := fig point:  -9@4.s nommer: ''''S''''.
dd1 := fig demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''''dd1''''.
c := fig pointSurLigne: dd1 à: 0.9.c nommer: ''''C''''.
dd2 := fig demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''''dd2''''.
d := fig pointSurLigne: dd2 à: 0.9.d nommer: ''''D''''.
ang := fig angleSommet: s de: c à: d    . ang nommer: ''''         <)''''.exp  initFaits .
exp  lisFigure.
exp  deduis.
exp  modèlesQuestions .
''
]]] doItWithButton:Charger le script de la figure.

**Angles équivalents**

Des angles avec le même sommets que l''angle de base et des extrémités sur les mêmes demi-droites sont équivalents.
Une relation est créée entre l''angle de base et un angle.



exp  verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
exp  verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier le code.

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

 **Représentation des relations d''équivalence.**

Les règles qui affirment des relations d''équivalence ont une conclusion **relation créée** pour garder la trace des relations créées.

Une relation d''équivalence entre objets a la propriété de partager l''ensemble des objets en classes d''objets équivalents, deux objets équivalents se retrouvent dans la même classe, pour vérifier si deux objets sont équivalents, il suffit de vérifier si ils appartiennent à la même classe, ce qui est rapide; on n''affirme que certains faits qui sont équivalents, mais la relation a aussi d''autres faits équivalents en raison des propriétés de transitivité et de commutativité de la relation d''équivalence. 

On peut comparer tous les éléments de la classe à un élément choisi comme représentant de la classe,

Pour les angles, le représentant est l''angle0.
Pour des fractions, le représentant est la fraction irréductible.

On peut voir l''ensemble des relations avec le prédicat **relation:rep:**

Dans cet exemple tous les angles sont équivalent et se retrouvent dans le même ensemble représenté par une liste.

point A
relation:rep: équivalent ?res
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
point A
relation:rep: équivalent ?res''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

exp verifieCondition: ''
point A
relation:rep: équivalent ?res''
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string: ''
exp verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier le code.


On voit que tous les angles équivalents se trouvent dans le même sous ensemble.
//Dans cet exemple il n''y a qu''un sous ensemble puisqu''''il n''''y qu''''un angle de base.//

**Remarques:**

Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents dans une conclusion. 

Pour vérifier une condition, il faut au moins une affirmation, c''est pour ça que l''affirmation vraie **point A**  est ajoutée au début de la condition à vérifier.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/24/2025 02:10:21'!
section_Expert_GéométrieEtSystèmeExpert_3Angles_332AngleEntreDroites
^(EruditeBookSection basicNew title: '3.3.2 Angle entre droites'; document: ((EruditeDocument contents: '!!!!!!1.3.2. Angle entre droites

"1.3.1.1  Script de la Figure."
Patientez, le chargement de la figure prend du temps.

[[[ fig:= DrGeoFigure new.
fig presenter expertDisplayTutor:''
 "1.3.1.1  Script de la Figure."
exp := fig expert.
exp chargeRegles:''''Euclide:''''.
a := fig point:-8@8.a nommer: ''''A''''.
c := fig  point: 4@-5.c nommer: ''''C''''.
b := fig  point: -8@-1.b nommer: ''''B''''.
d:= fig point: 7@7.d nommer: ''''D''''.
dd1 := fig droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := fig  droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=fig intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
exp  initFaits .
exp  lisFigure.
exp  deduis.
exp  modèlesQuestions .


'']]] doItWithButton: copier code du script.

Remarque:
Les angles qui sont équivalents à un angle de base font partie d''''une relation d''''équivalence. 

exp  verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[fig presenter expertDisplayTutor:''
exp  verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier l''''exemple.


Pour le sytème expert définir une relation d''équivalence est plus efficace que d''''affimer tous les faits équivalents séparément lorsqu''on vérifie la relation dans une règle.
 
On n''affirme que certains faits sont équivalents mais la relation a aussi d''autres faits équivalents par exemple les angles  [ A S B ] et [ C S B ] sont aussi équivalents et il y a encore d''''autres relations, en fait on peut regrouper dans un ensemble tous les angles qui sont équivalents entre eux et il suffit de tester s''il sont dans le même ensemble pour savoir qu''ils sont équivalents.

exp  verifieCondition: ''''point A
relation:rep: équivalent ?res''''.
[[[fig  presenter expertDisplayTutor:''exp verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier l''''exemple.

On voit que tous lea angles équivalents se trouvent dans le même ensemble.

Remarque:
il ne peut pas y avoir que des prédicats dans une condition, il faut au moins une affirmation à vérifier, c''''est pour ça que l''affirmation vraie **point A**  est au début de la condition à vérifier
''') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/24/2025 02:10:21'!
section_Expert_GéométrieEtSystèmeExpert_3Angles_333AngleEntreParallèles
^(EruditeBookSection basicNew title: '3.3.3 Angle entre parallèles'; document: ((EruditeDocument contents: ' ''!!!!!! 1.3.3 Angle entre parallèles

1.3.3.1  Script de la Figure.

**Les déductions prennent du temps,Patientez.**

[[[fig:=DrGeoFigure nouveau.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
exp:=fig expert.
exp initRegles.
exp := fig expert.exp chargeRegles: ''Euclide''.
fig afficherAxes .
a := fig  point: -4.5@1.5.a nommer: ''A''.		
b:= fig  point: 4.5@5.b nommer: ''B''.
c:= fig  point: 0@-4.5.c nommer: ''C''.
dr:=fig droitePassantPar: a et: b.dr nommer: ''dr''.
par:= fig parallèleA: dr passantPar: c.par nommer: ''par''.
d := fig  pointSurLigne: par à: 0.9484.d nommer: ''D''.
pe:= fig  point: 4.5@-6.pe nommer: ''E''.
pf:=fig point: -3@6.pf nommer: ''F''.
trans := fig droitePassantPar: pe et: pf.trans nommer: ''trans''.
i1:= fig intersectionDe: dr et: trans.i1 nommer: ''I1''.
i2:= fig intersectionDe: par et: trans.i2 nommer: ''I2''. 
fig presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.
 
[[[fig :=DrGeoFigure nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
"1.3.3.1  Script de la Figure."

exp := fig expert.
exp chargeRegles:''''Euclide:''''.
a := fig point:-8@8.a nommer: ''''A''''.
c := fig point: 4@-5.c nommer: ''''C''''.
b := fig point: -8@-1.b nommer: ''''B''''.
d:= fig point: 7@7.d nommer: ''''D''''.
dd1 := fig droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := fig droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=fig  intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
'']]] doItWithButton: Copier le code de la figure.

**Angles non plats**

angle0  ?x1 [ classement: nonPlat ].
[[[
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:
''angle0  ?x1 [ classement: nonPlat ].''

]]] doItWithButton:Vérifier ce modèle.

exp verifieCondition: ''angle0  ?x1 [ classement: nonPlat ]''.
[[[
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ classement: nonPlat ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles adjacents.**

angle0  ?x1 [ adjacent:  ?x2 ] 
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ adjacent:  ?x2 ] 
''  
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ adjacent:  ?x2 ] ''
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert''  string:''
e verifieCondition: ''''angle0  ?x1 [ adjacent:  ?x2 ] ''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles supplémentaires**

angle0  ?x1 [ supplémentaire:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ supplémentaire:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

ep xverifieCondition: ''angle0  ?x1 [ supplémentaire:  ?x2 ]''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ supplémentaire:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles opposés.**

angle0  ?x1 [ opposé:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ opposé:  ?x2 ] 
''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

exp verifieCondition: ''angle0  ?x1 [ opposé:  ?x2 ] ''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ opposé:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.


**Angles alterneInternes**
angle0  ?x1 [ alterneinterne:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ alterneInterne:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ alterneInterne:  ?x2 ] ''.
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''exp verifieCondition: ''''angle0  ?x1 [ alterneInterne:  ?x2 ]''''.''

]]] doItWithButton:copier le code pour l''''exécuter.



**Angles alterneExternes**
 angle0  ?x1  [ alterneExterne:  ?x2 ]
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1  [ alterneExterne:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ alterneExterne:  ?x2 ] ]''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0  ?x1 [ alterneExterne:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''''exécuter.

'') ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/24/2025 02:10:21'!
section_Expert_GéométrieEtSystèmeExpert_3Angles_334AngleObtuAigudroit
^(EruditeBookSection basicNew title: '3.3.4 Angle obtu, aigu,droit.'; document: ((EruditeDocument contents: '
!!!!!!1.3.4 Angle obtu, aigu,droit,perpendiculaire.


Euclide : Définition 11, « L''angle obtus est celui qui est plus grand qu''un droit. » 
Euclide : Définition 12, « L''angle aigu est celui qui est plus petit qu''un droit »
Euclide : Définition 10, « Lorsqu''une droite tombant sur une droite fait deux angles de suite égaux, chacun des angles égaux est droit, et la droite placée au-dessus est dite perpendiculaire à celle sur laquelle elle est placée.»

Aide-mémoire p.103: « Un angle obtus est un angle dont la mesure est omprise entre 90° et 180°. »
Aide-mémoire p.103: « Un angle aigu est un angle dont la mesure est comprise entre 0° et 90°. »

Aide-mémoire p.103: « Un angle droit est un angle dont la mesure est 90°. »
Aide-mémoire p.  93: « Deux droites perpendiculaires sont deux droites qui se coupent à angles droits .»

**Remarque: **« La définition de Euclide pour l''angle droit est l''angle qui partage en deux angles égaux.
Pour Euclide l''égalité de deux objets géométriques, se constate si on peut superposer exactement ces objets, éventuellement en en retournant un »


**1.3.4.1  Démonstration.**

[[[f :=DrGeoFigure  nouveau.

" Angle obtu, aigu,droit,perpendiculaire."
	f texte: ''Déplacer le point A'' à: -9.5@8.5 .
	o:= f point: (-6@0). o nommer: ''O''.
	f centrerVueEn: o.
	f centrerVueEn: o.
	o1:= f point: (-6.1@0). o1 nommer: ''O1''.o1 cacher.
	o2:= f point: (-5.9@0). o2 nommer: ''O2''.o2 cacher.
	seg := f segmentDe:-5.8@7 à: -6.1@7.
	seg nommer:''''.seg cacher.
	b:=f point: 0@0. b nommer: ''B''.
	d1:=f droitePassantPar: o et: b.
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	a:=f point: -6@6. a nommer: ''A''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp1:= f perpendiculaireA: d1 passantPar: o1.
	perp2:= f perpendiculaireA: d1 passantPar: o2.
	perp  pointillé.
	perp nommer:''perp''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''droit''.
	p1 :=f point: (-3 @6).
	p2 :=f point: (-9 @6).
	s1:=f segmentDe: p1 à: a.
	s2:=f segmentDe: p2 à: a.
	p1 cacher.
	p2 cacher.
	s1 cacher.
	s2 cacher.
	a déplacerA: -2 @5.
		f actualiser.
	aigu:= f intersectionDe:  perp2 et: s2.
	aigu nommer: ''aigu''.
	perp1 cacher.
	perp2 cacher.
	a déplacerA: -9  @5.
	f actualiser.
	obtu:= f intersectionDe:  perp1 et: s1.
	obtu nommer: ''obtus''.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''<)''.
	mesureangle :=  ang  morph mathItem 	degreeAngle rounded
	]]] doItWithButton: Charger la démonstration.
ou
[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string:''
" Angle obtu, aigu,droit,perpendiculaire."
	f :=DrGeoFigure  nouveau. 
	f texte: ''''Déplacer le point A'''' à: -9.5@8.5 .
	o:= f point: (-6@0). o nommer: ''''O''''.
	f centrerVueEn: o.
	f centrerVueEn: o.
	o1:= f point: (-6.1@0). o1 nommer: ''''O1''''.o1 cacher.
	o2:= f point: (-5.9@0). o2 nommer: ''''O2''''.o2 cacher.
	seg := f segmentDe:-5.8@7 à: -6.1@7.
	seg nommer:''''seg''''.seg cacher.
	b:=f point: 0@0. b nommer: ''''B''''.
	d1:=f droitePassantPar: o et: b.
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	a:=f point: -6@6. a nommer: ''''A''''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp1:= f perpendiculaireA: d1 passantPar: o1.
	perp2:= f perpendiculaireA: d1 passantPar: o2.
	perp  pointillé.
	perp nommer:''''perp''''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''''droit''''.
	p1 :=f point: (-3 @6).
	p2 :=f point: (-9 @6).
	s1:=f segmentDe: p1 à: a.
	s2:=f segmentDe: p2 à: a.
	p1 cacher.
	p2 cacher.
	s1 cacher.
	s2 cacher.
	a déplacerA: -2 @5.
		f actualiser.
	aigu:= f intersectionDe:  perp2 et: s2.
	aigu nommer: ''''aigu''''.
	perp1 cacher.
	perp2 cacher.
	a déplacerA: -9  @5.
	f actualiser.
	obtu:= f intersectionDe:  perp1 et: s1.
	obtu nommer: ''''obtus''''.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''''<)''''.
	mesureangle :=  ang  morph mathItem 	degreeAngle rounded.
'']]] doItWithButton: Copier le code de la démonstration.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_3Angles_33AngleEntreParallèles
^(EruditeBookSection basicNew title: '3.3 Angle entre parallèles'; document: ((EruditeDocument contents: ' ''!!!!!! 1.3.3 Angle entre parallèles

1.3.3.1  Script de la Figure.

**Les déductions prennent du temps,Patientez.**

[[[fig:=DrGeoFigure nouveau.
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''Pour vérifier un modèle, utilise vérifier du menu Expert'' style: true.
exp:=fig expert.
exp initRegles.
exp := fig expert.exp chargeRegles: ''Euclide''.
fig afficherAxes .
a := fig  point: -4.5@1.5.a nommer: ''A''.		
b:= fig  point: 4.5@5.b nommer: ''B''.
c:= fig  point: 0@-4.5.c nommer: ''C''.
dr:=fig droitePassantPar: a et: b.dr nommer: ''dr''.
par:= fig parallèleA: dr passantPar: c.par nommer: ''par''.
d := fig  pointSurLigne: par à: 0.9484.d nommer: ''D''.
pe:= fig  point: 4.5@-6.pe nommer: ''E''.
pf:=fig point: -3@6.pf nommer: ''F''.
trans := fig droitePassantPar: pe et: pf.trans nommer: ''trans''.
i1:= fig intersectionDe: dr et: trans.i1 nommer: ''I1''.
i2:= fig intersectionDe: par et: trans.i2 nommer: ''I2''. 
fig presenter expertInspect]]] doItWithButton: Charger la figure et les modèles de questions.
 
[[[fig :=DrGeoFigure nouveau.
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
"1.3.3.1  Script de la Figure."

exp := fig expert.
exp chargeRegles:''''Euclide:''''.
a := fig point:-8@8.a nommer: ''''A''''.
c := fig point: 4@-5.c nommer: ''''C''''.
b := fig point: -8@-1.b nommer: ''''B''''.
d:= fig point: 7@7.d nommer: ''''D''''.
dd1 := fig droitePassantPar: c et: a .
dd1 nommer: ''''dd1''''.
dd2 := fig droitePassantPar: d et: b.
dd2 nommer: ''''dd2''''.
i:=fig  intersectionDe: dd1 et: dd2.
i nommer: ''''I''''.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
'']]] doItWithButton: Copier le code de la figure.

**Angles non plats**

angle0  ?x1 [ classement: nonPlat ].
[[[
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:
''angle0  ?x1 [ classement: nonPlat ].''

]]] doItWithButton:Vérifier ce modèle.

exp verifieCondition: ''angle0  ?x1 [ classement: nonPlat ]''.
[[[
fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ classement: nonPlat ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles adjacents.**

angle0  ?x1 [ adjacent:  ?x2 ] 
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ adjacent:  ?x2 ] 
''  
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ adjacent:  ?x2 ] ''
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert''  string:''
e verifieCondition: ''''angle0  ?x1 [ adjacent:  ?x2 ] ''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles supplémentaires**

angle0  ?x1 [ supplémentaire:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ supplémentaire:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

ep xverifieCondition: ''angle0  ?x1 [ supplémentaire:  ?x2 ]''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ supplémentaire:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.

**Angles opposés.**

angle0  ?x1 [ opposé:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ opposé:  ?x2 ] 
''  style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

exp verifieCondition: ''angle0  ?x1 [ opposé:  ?x2 ] ''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
exp verifieCondition: ''''angle0  ?x1 [ opposé:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''exécuter.


**Angles alterneInternes**
angle0  ?x1 [ alterneinterne:  ?x2 ] 
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1 [ alterneInterne:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ alterneInterne:  ?x2 ] ''.
[[[fig presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string: ''exp verifieCondition: ''''angle0  ?x1 [ alterneInterne:  ?x2 ]''''.''

]]] doItWithButton:copier le code pour l''''exécuter.



**Angles alterneExternes**
 angle0  ?x1  [ alterneExterne:  ?x2 ]
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
angle0  ?x1  [ alterneExterne:  ?x2 ] 
'' style: true.
]]] doItWithButton: vérifier ce modèle de question  par le menu Expert.

e verifieCondition: ''angle0  ?x1 [ alterneExterne:  ?x2 ] ]''.
[[[fig presenter expertDisplayTutor:''Géométrie  et Système Expert'' string:''
e verifieCondition: ''''angle0  ?x1 [ alterneExterne:  ?x2 ] ]''''.
''
]]] doItWithButton:copier le code pour l''''exécuter.

'') ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_GéométrieEtSystèmeExpert_3Angles_34AngleObtuAigudroit
^(EruditeBookSection basicNew title: '3.4 Angle obtu, aigu,droit.'; document: ((EruditeDocument contents: '
!!!!!!1.3.4 Angle obtu, aigu,droit,perpendiculaire.


Euclide : Définition 11, « L''angle obtus est celui qui est plus grand qu''un droit. » 
Euclide : Définition 12, « L''angle aigu est celui qui est plus petit qu''un droit »
Euclide : Définition 10, « Lorsqu''une droite tombant sur une droite fait deux angles de suite égaux, chacun des angles égaux est droit, et la droite placée au-dessus est dite perpendiculaire à celle sur laquelle elle est placée.»

Aide-mémoire p.103: « Un angle obtus est un angle dont la mesure est omprise entre 90° et 180°. »
Aide-mémoire p.103: « Un angle aigu est un angle dont la mesure est comprise entre 0° et 90°. »

Aide-mémoire p.103: « Un angle droit est un angle dont la mesure est 90°. »
Aide-mémoire p.  93: « Deux droites perpendiculaires sont deux droites qui se coupent à angles droits .»

**Remarque: **« La définition de Euclide pour l''angle droit est l''angle qui partage en deux angles égaux.
Pour Euclide l''égalité de deux objets géométriques, se constate si on peut superposer exactement ces objets, éventuellement en en retournant un »


**1.3.4.1  Démonstration.**

[[[f :=DrGeoFigure  nouveau.

" Angle obtu, aigu,droit,perpendiculaire."
	f texte: ''Déplacer le point A'' à: -9.5@8.5 .
	o:= f point: (-6@0). o nommer: ''O''.
	f centrerVueEn: o.
	f centrerVueEn: o.
	o1:= f point: (-6.1@0). o1 nommer: ''O1''.o1 cacher.
	o2:= f point: (-5.9@0). o2 nommer: ''O2''.o2 cacher.
	seg := f segmentDe:-5.8@7 à: -6.1@7.
	seg nommer:''''.seg cacher.
	b:=f point: 0@0. b nommer: ''B''.
	d1:=f droitePassantPar: o et: b.
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	a:=f point: -6@6. a nommer: ''A''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp1:= f perpendiculaireA: d1 passantPar: o1.
	perp2:= f perpendiculaireA: d1 passantPar: o2.
	perp  pointillé.
	perp nommer:''perp''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''droit''.
	p1 :=f point: (-3 @6).
	p2 :=f point: (-9 @6).
	s1:=f segmentDe: p1 à: a.
	s2:=f segmentDe: p2 à: a.
	p1 cacher.
	p2 cacher.
	s1 cacher.
	s2 cacher.
	a déplacerA: -2 @5.
		f actualiser.
	aigu:= f intersectionDe:  perp2 et: s2.
	aigu nommer: ''aigu''.
	perp1 cacher.
	perp2 cacher.
	a déplacerA: -9  @5.
	f actualiser.
	obtu:= f intersectionDe:  perp1 et: s1.
	obtu nommer: ''obtus''.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''<)''.
	mesureangle :=  ang  morph mathItem 	degreeAngle rounded
	]]] doItWithButton: Charger la démonstration.
ou
[[[f presenter expertDisplayTutor: ''Géométrie  et Système Expert'' string:''
" Angle obtu, aigu,droit,perpendiculaire."
	f :=DrGeoFigure  nouveau. 
	f texte: ''''Déplacer le point A'''' à: -9.5@8.5 .
	o:= f point: (-6@0). o nommer: ''''O''''.
	f centrerVueEn: o.
	f centrerVueEn: o.
	o1:= f point: (-6.1@0). o1 nommer: ''''O1''''.o1 cacher.
	o2:= f point: (-5.9@0). o2 nommer: ''''O2''''.o2 cacher.
	seg := f segmentDe:-5.8@7 à: -6.1@7.
	seg nommer:''''seg''''.seg cacher.
	b:=f point: 0@0. b nommer: ''''B''''.
	d1:=f droitePassantPar: o et: b.
	perp:= f perpendiculaireA: d1 passantPar: o.
	perp  pointillé.
	a:=f point: -6@6. a nommer: ''''A''''.
	d2:=f demiDroiteOrigine:  o passantPar:  a.	
	perp1:= f perpendiculaireA: d1 passantPar: o1.
	perp2:= f perpendiculaireA: d1 passantPar: o2.
	perp  pointillé.
	perp nommer:''''perp''''.
	droit := f intersectionDe: d2 et: seg.
	droit nommer:''''droit''''.
	p1 :=f point: (-3 @6).
	p2 :=f point: (-9 @6).
	s1:=f segmentDe: p1 à: a.
	s2:=f segmentDe: p2 à: a.
	p1 cacher.
	p2 cacher.
	s1 cacher.
	s2 cacher.
	a déplacerA: -2 @5.
		f actualiser.
	aigu:= f intersectionDe:  perp2 et: s2.
	aigu nommer: ''''aigu''''.
	perp1 cacher.
	perp2 cacher.
	a déplacerA: -9  @5.
	f actualiser.
	obtu:= f intersectionDe:  perp1 et: s1.
	obtu nommer: ''''obtus''''.
	ang:=f angleGéométriqueSommet:  o de: b à: a.
	ang nommer:''''<)''''.
	mesureangle :=  ang  morph mathItem 	degreeAngle rounded.
'']]] doItWithButton: Copier le code de la démonstration.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/13/2025 04:13:52'!
section_Expert_GéométrieEtSystèmeExpert_3Cercles
^(EruditeBookSection basicNew title: '3 Cercles.'; document: ((EruditeDocument contents: '!!!!!!3 Cercles

Euclide:Définition 15, « Un cercle est une figure plane comprise par une seule ligne qu''on nomme circonférence,
toutes les droites menées à la circonférence d''un point placé dans cette figure étant égales entre elles. » ( Les droites
définies par Euclide sont les segments selon les définitions actuelles, donc, pour Euclide,les droites sont les rayons du
cercle).
Euclide:Définition 16, « Ce point se nomme le centre du cercle.»
Euclide:Définition 17, «Diamètre du cercle est une ligne droite menée par le centre du cercle et finissant de part et d''autre à
la circonférence. »
Euclide:Définition 18, « Demi cercle, est une figure comprise d''une ligne droite, et moitié de la circonférence.»
Euclide:Définition 19, «Section de cercle, est une figure comprise d''une droite, et d''une partie de la circonférence. Pour
Euclide, une figure est une portion du plan limitée par une frontière. Ici la frontière est constituée par un rayon et une partie
de la circonférence et est fermée par un autre rayon.
Aide-mémoire p.99 : « Un cercle est l''ensemble des points du plan situés à égale distance d''un point appelé
centre.
Cette distance est le rayon du cercle. »') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_GéométrieEtSystèmeExpert_3Cercles_11Cercle;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/13/2025 04:13:52'!
section_Expert_GéométrieEtSystèmeExpert_3Cercles_11Cercle
^(EruditeBookSection basicNew title: '1.1 Cercle'; document: ((EruditeDocument contents: '!!!!!!Cercle selon centre et point
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats
^(EruditeBookSection basicNew title: 'Liste des prédicats'; document: ((EruditeDocument contents: '!!!! 1.1.2 Distance entre points

	**Rappels:**

	Euclide : Définition 1, « **Le point est ce dont la partie est nulle **».
	Euclide : Définition 2, «**Une ligne est une longueur sans largeur.** »
	Euclide : Définition 3, «**Les extrémités d’une ligne sont des points.** »
	Euclide : Définition 4, ** ligne droite est celle qui est également placée entre ses points.** » 

	1.1.2.1 ** La figure.**
[[[ fig presenter drawable  ifNil: [ fig := DrGeoFigure nouveau. exp := fig expert ].
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert point'' string: ''Pour vérifierun modèle, utilise vérifier du menu Expert'' style: true. 
fig afficherAxes .
a := fig point: 0@0.
a nommer: ''A''.	
b := fig point: 4@3.
b nommer: ''B''.	
dist :=fig  distanceDe:a à:b.
dist déplacerA: 0@2.
fig actualiser.
fig échelle: 50..
exp := fig expert.
exp chargeRegles: ''Euclide''.
exp chargeRegles: ''mesure''.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
fig presenter expertInspect. ]]] doItWithButton: Charger la figure et les modèles de questions.

[[[ fig presenter drawable  ifNil: [ fig := DrGeoFigure nouveau. exp := fig expert ].
fig presenter expertDisplayTutor:''Géométrie  et Système Expert point''  string: ''
DrGeoFigure nouveau.
fig afficherAxes .
a := fig point: 0@0.
a nommer: ''''A''''.	
b := fig point: 4@3.
b nommer: ''''B''''.	
dist :=fig  distanceDe:a à:b.
dist déplacerA: 0@2.
fig actualiser.
exp := fig expert.
exp chargeRegles: ''''Euclide''''.
exp chargeRegles: ''''mesure''''.
.exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
"
exp verifieCondition: ''''mesure  ?x1 ?x2''''.
exp verifieCondition: ''''point ?x1''''. "
'']]] doItWithButton: copier le script de la figure pour l''''exécuter.

	**1.1.2.2 Mesure**

		**Mesure de la distance.**

       mesure ?x1 ?x2

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
 mesure ?x1 ?x2''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

	exp vérifieCondition:''mesure ?x1 ?x2''.

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''mesure ?x1 ?x2''''
'']]] doItWithButton:copier le code pour l''''exécuter.

		**Mesure avec la provenance.**
 
      mesure ?x1 ?x2 ?x3  

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
 mesure ?x1 ?x2 ?x3''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

	exp vérifieCondition:''mesure ?x1 ?x2 ?x3''.

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''mesure ?x1 ?x2 ?x3''''
'']]] doItWithButton:copier le code pour l''''exécuter.

**Remarque:**
	?x3 indique si la mesure provient d''une 		valeur donnée dans  la fgure ou provient de la conclusion d''une règle.

		**Valeur produite par une règle.**

[[[ fig presenter drawable  ifNil: [ fig := DrGeoFigure nouveau. exp := fig expert ].
fig presenter expertDisplayTutor: ''Géométrie  et Système Expert point'' string: ''Pour vérifierun modèle, utilise vérifier du menu Expert'' style: true. 
fig afficherAxes .
a := fig point: 0@0.
a nommer: ''A''.	
b := fig point: 4@3.
b nommer: ''B''.	
fig échelle: 50..
exp := fig expert.
exp chargeRegles: ''Euclide''.
exp chargeRegles: ''mesure''.
exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
fig presenter expertInspect. ]]] doItWithButton: Charger la figure sans distance  et les modèles de questions.

[[[ fig presenter drawable  ifNil: [ fig := DrGeoFigure nouveau. exp := fig expert ].
fig presenter expertDisplayTutor:''Géométrie  et Système Expert point''  string: ''
fig afficherAxes .
a := fig point: 0@0.
a nommer: ''''A''''.	
b := fig point: 4@3.
b nommer: ''''B''''.	
exp := fig expert.
exp chargeRegles: ''''Euclide''''.
exp chargeRegles: ''''mesure''''.
.exp initFaits .
exp lisFigure.
exp deduis.
exp modèlesQuestions .
"
exp verifieCondition: ''''mesure  ?x1 ?x2''''.
exp verifieCondition: ''''point ?x1''''. "
'']]] doItWithButton: copier le script de la figure sans distance pour l''''exécuter.

**Vérification.**

La distance est calculée et placée dans la variable  ?res.

		point  ?x1
		point  ?x2
		**distanceDe:à:rep: ?x1 ?x2 ?res**

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

		exp verifieCondition: ''point  ?x1
		point  ?x2
		**distanceDe:à:rep: ?x1 ?x2 ?res**

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res''''
'']]] doItWithButton:copier le code pour l''''exécuter.


		On obtient 4 réponses parce  le système expert essaie toutes les combinaisons de deux points.
		
		A A   A B   B A   B B

		Tu peux préciser la question en demandant **deux points différents**.

		point  ?x1
		point  ?x2
		distanceDe:à:rep: ?x1 ?x2 ?res
		**different:de: ?x1 ?x2**

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res
different:de: ?x1 ?x2''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.
		
exp verifieCondition: ''point  ?x1
		point  ?x2
		distanceDe:à:rep: ?x1 ?x2 ?res
		**different:de: ?x1 ?x2**'' 

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res
different:de: ?x1 ?x29''''
'']]] doItWithButton:copier le code pour l''''exécuter.

		Tu peux encore plus préciser la question en demandant **des points dans l''ordre alphabétique de leurs noms.**
		
				
		point  ?x1
		point  ?x2
		distanceDe:à:rep: ?x1 ?x2 ?res
		different:de: ?x1 ?x2
		**ordonneMot:et:rep1:rep2:  ?x 1 ?x2 ?x1 ?x2**

[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep2:  ?x1 ?x2 ?x1 ?x2 ''
 style: true. ]]] doItWithButton: copier pour vérifier avec le menu Expert.

		exp verifieCondition: ''
		point  ?x1
		point  ?x2
		distanceDe:à:rep: ?x1 ?x2 ?res
		different:de: ?x1 ?x2
		**ordonneMot:et:rep1:rep2: ?x1 ?x2 ?x1  ?x2**''
:
[[[fig presenter expertDisplayTutor:''Géométrie et Système Expert'' string: ''
exp verifieCondition: ''''point  ?x1
point  ?x2
distanceDe:à:rep: ?x1 ?x2 ?res
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep2:  ?x 1 ?x2 ?x1 ?x2 ''
'']]] doItWithButton:copier le code pour l''''exécuter.

		**Remarque**
		La valeur de la distance affichée dans la figure se modifie si tu déplaces les points.
	
		Le système expert évalue la situation quand il lit la figure, pour une situation changée, il faut une nouvelle lecture.



') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Actions;
        add: self section_Expert_ListeDesPrédicats_Géométrie;
        add: self section_Expert_ListeDesPrédicats_Listes;
        add: self section_Expert_ListeDesPrédicats_Nombres;
        add: self section_Expert_ListeDesPrédicats_Divers;
        add: self section_Expert_ListeDesPrédicats_Relations;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_affiche
^(EruditeBookSection basicNew title: 'affiche:	'; document: ((EruditeDocument contents: '!!!!!!afficheTexte:a:

Affiche à une position et nomme un texte dans la 	figure"
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_afficheTextea
^(EruditeBookSection basicNew title: 'afficheTexte:a:'; document: ((EruditeDocument contents: '!!!!!!afficheTexte:a:

Affiche à une position et nomme un texte dans la 	figure"
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_afficheTextecontenua
^(EruditeBookSection basicNew title: 'afficheTexte:contenu:a:	'; document: ((EruditeDocument contents: '!!!!!!afficheTexte:contenu:a:	

Affiche à une position et nomme un texte dans 	la figure.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_angleCentredeacou
^(EruditeBookSection basicNew title: 'angleCentre:de:a:cou'; document: ((EruditeDocument contents: '!!!!!!angleCentre:de:a:coul:

angleCentre:de:a:coul:	
Marque la valeur d''un angle en couleur') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_angleGeometriqueCentredeacoul
^(EruditeBookSection basicNew title: 'angleGeometriqueCentre:de:a:coul:  '; document: ((EruditeDocument contents: 'angleGeometriqueCentre:de:a:coul:  

Marque la valleur d''un angle géométrique en couleur
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_couleurPointcouleur
^(EruditeBookSection basicNew title: 'couleurPoint:couleur:'; document: ((EruditeDocument contents: 'couleurPoint:couleur:

Mets en couleur un point.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_créePointMilieuPointet
^(EruditeBookSection basicNew title: 'créePointMilieu:Point:et'; document: ((EruditeDocument contents: 'créePointMilieu:Point:et

Crée le point au milieu d''une médiatrice.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_execute
^(EruditeBookSection basicNew title: 'execute:	'; document: ((EruditeDocument contents: 'execute:	

Evalue une action.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_polyAjouteETNuméroteSommets
^(EruditeBookSection basicNew title: 'polyAjouteETNuméroteSommets:	'; document: ((EruditeDocument contents: '
polyAjouteETNuméroteSommets:	

Ajoute et numérote les sommets d''un objet polygone régulier.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Actions_polyAjouteSommets
^(EruditeBookSection basicNew title: 'polyAjouteSommets:	'; document: ((EruditeDocument contents: 'polyAjouteSommets:	

Ajoute les sommets d''un polygone') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_alignésavecetVérifieQueTroisPointsSontAlignés
^(EruditeBookSection basicNew title: 'alignés:avec:et:

Vérifie que trois points sont alignés.'; document: ((EruditeDocument contents: 'alignés:avec:et:

Vérifie que trois points sont alignés.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_compteFaitsrep
^(EruditeBookSection basicNew title: 'compteFaits:rep:	'; document: ((EruditeDocument contents: 'compteFaits:rep:	

Compte le nombre de mêmes faits correspondant à un modèle de question pour un faits sous forme de liste.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_constructionsrep
^(EruditeBookSection basicNew title: 'constructions:rep:	'; document: ((EruditeDocument contents: 'constructions:rep:	

Construit un objet dans la figure') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/16/2024 16:42:00'!
section_Expert_ListeDesPrédicats_Divers_contrairecontrairerep
^(EruditeBookSection basicNew title: 'contraire:contraire:rep:'; document: ((EruditeDocument contents: 'contraire:contraire:rep

décrit le contraire d''''un mot') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_créeNomMinrep
^(EruditeBookSection basicNew title: 'créeNomMin:rep:	'; document: ((EruditeDocument contents: 'créeNomMin:rep:	

Crée un nom pour une permutation minimum des éléments de la liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_créeNomUniquerep
^(EruditeBookSection basicNew title: 'créeNomUnique:rep:	'; document: ((EruditeDocument contents: 'créeNomUnique:rep:	

Crée un nom suivi d''un numéro unique.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_créeNomrep
^(EruditeBookSection basicNew title: 'créeNom:rep:'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_differentde
^(EruditeBookSection basicNew title: 'different:de:	'; document: ((EruditeDocument contents: 'different:de:	

Vérifie que deux objets sont différents.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_directionrep
^(EruditeBookSection basicNew title: 'direction:rep:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_distancearep
^(EruditeBookSection basicNew title: 'distance:a:rep:	
'; document: ((EruditeDocument contents: 'distance:a:rep:	

La distance entre deux points.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_extrémitérep
^(EruditeBookSection basicNew title: 'extrémité:rep:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_égauxet
^(EruditeBookSection basicNew title: 'égaux:et:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_instanciedValue
^(EruditeBookSection basicNew title: 'instanciedValue:'; document: ((EruditeDocument contents: 'instanciedValue:
Valeur attribuée à une variable, retourne faux si la 	variable n''a  pas reçu de valeur.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_maxrep
^(EruditeBookSection basicNew title: 'max:rep:	'; document: ((EruditeDocument contents: 'max:rep:	

Le maximum d''une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_minMotrep
^(EruditeBookSection basicNew title: 'minMot:rep:	'; document: ((EruditeDocument contents: 'minMot:rep:	

Le plus  petit caractère d''un mot.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_minimumrep
^(EruditeBookSection basicNew title: 'minimum:rep:	'; document: ((EruditeDocument contents: 'minimum:rep:	

Le plus  petit caractère d''un mot.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_motetetrep
^(EruditeBookSection basicNew title: 'mot:et:et:rep:	'; document: ((EruditeDocument contents: 'mot:et:et:rep:	

Forme un mot à partir de trois mots.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_ordonneMotetrep
^(EruditeBookSection basicNew title: 'ordonneMot:et:rep:	'; document: ((EruditeDocument contents: 'ordonneMot:et:rep:	

Forme un mot à partir de deuxmots, en les  mettant 	dans l''ordre alphabètique .
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_ordonneMotetrep1rep2
^(EruditeBookSection basicNew title: 'ordonneMot:et:rep1:rep2:'; document: ((EruditeDocument contents: 'ordonneMot:et:rep1:rep2:

Place deux mots en ordre alphabétique.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_renommenom
^(EruditeBookSection basicNew title: 'renomme:nom:	'; document: ((EruditeDocument contents: 'renomme:nom:	

Renomme un  objet.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_retablitFait
^(EruditeBookSection basicNew title: 'retablitFait:	'; document: ((EruditeDocument contents: 'retablitFait:	

établit un fait.


') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_retireFait
^(EruditeBookSection basicNew title: 'retireFait:	'; document: ((EruditeDocument contents: 'retireFait:	

Retire un fait, le fait est marqué retiré et plus vu 	parmis les faits.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_suivantrep
^(EruditeBookSection basicNew title: 'suivant:rep:'; document: ((EruditeDocument contents: 'suivant:rep:	
Génère le nom suivant un nom unique.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_total
^(EruditeBookSection basicNew title: 'total:	'; document: ((EruditeDocument contents: 'total:	

Remplace le dernier élément d''une liste de 	nombres par le total des précédents.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Divers_trierep
^(EruditeBookSection basicNew title: 'trie:rep:	'; document: ((EruditeDocument contents: 'trie:rep:	

Trie les lettres d''un mot.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie
^(EruditeBookSection basicNew title: 'Géométrie'; document: ((EruditeDocument contents: 'Des prédicats pour traiter les objets géométriques,') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Géométrie_abcisseDesurrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_aireTriangleavecavecrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_aireTriangleNegativeavecavecrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_aireTriangleNegativeavecavec;
        add: self section_Expert_ListeDesPrédicats_Géométrie_aireTrianglePositiveavecavecrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_aireTrianglePositiveavecavec;
        add: self section_Expert_ListeDesPrédicats_Géométrie_degrésrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_justeAprèselrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_justeAvantelrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_nomPolygonerep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_nonPointConfonduavec;
        add: self section_Expert_ListeDesPrédicats_Géométrie_originerep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_parentsrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_penterep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_pointentreet;
        add: self section_Expert_ListeDesPrédicats_Géométrie_pointrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_pointConfonduavec;
        add: self section_Expert_ListeDesPrédicats_Géométrie_pointDifferentde;
        add: self section_Expert_ListeDesPrédicats_Géométrie_pointsSurrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_pointsSurCerclerep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_pointxrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_pointyrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_triangleAreawithwithrep;
        add: self section_Expert_ListeDesPrédicats_Géométrie_vecteurrep;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_abcisseDesurrep
^(EruditeBookSection basicNew title: '-abcisseDe:sur:rep:'; document: ((EruditeDocument contents: '!!!!!! -abcisseDe:sur:rep:
"Abcisse d''un point sur une droite"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_aireTriangleNegativeavecavec
^(EruditeBookSection basicNew title: '-aireTriangleNegative:avec:avec:'; document: ((EruditeDocument contents: 'reTriangleNegative: p1 avec: p2 avec: p3 vars: lvar
	"Aire calculée à partir des coordonnées de 3 points,double de l''aire du triangle formé par les 3 points,
es négative, le triangle est orienté à droite, sens trigonométrique inverse"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_aireTriangleNegativeavecavecrep
^(EruditeBookSection basicNew title: '-aireTriangleNegative:avec:avec:rep:'; document: ((EruditeDocument contents: '"vérifie si l''aire du triangle formé par les 3 points est négative,
le triangle est orienté à droite, sens trigonométrique inverses"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_aireTrianglePositiveavecavec
^(EruditeBookSection basicNew title: '-aireTrianglePositive:avec:avec:'; document: ((EruditeDocument contents: '	"vérifie si l''aire du triangle formé par les 3 points est positive,
le triangle est orienté à gauche, sens trigonométrique"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_aireTrianglePositiveavecavecrep
^(EruditeBookSection basicNew title: '-aireTrianglePositive:avec:avec:rep:'; document: ((EruditeDocument contents: '	"vérifie si l''aire du triangle formé par les 3 points est positive,
le triangle est orienté à gauche, sens trigonométrique"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_aireTriangleavecavecrep
^(EruditeBookSection basicNew title: '-aireTriangle:avec:avec:rep:'; document: ((EruditeDocument contents: '"Aire calculée à partir des coordonnées de 3 points,double de l''aire du triangle formé par les 3 points,
positive si le triangle est orienté à gauche, sens trigonométrique"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_degrésrep
^(EruditeBookSection basicNew title: '-degrés:rep:'; document: ((EruditeDocument contents: '"retourne la valeur d''un angle qui a le  point pour sommet."') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_justeAprèselrep
^(EruditeBookSection basicNew title: '-justeAprès:el:rep:'; document: ((EruditeDocument contents: '	"L''élément qui suit un élément d''une liste"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_justeAvantelrep
^(EruditeBookSection basicNew title: '-justeAvant:el:rep:'; document: ((EruditeDocument contents: '	"L''élément qui précède un élément d''une liste"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_nomPolygonerep
^(EruditeBookSection basicNew title: '-nomPolygone:rep:'; document: ((EruditeDocument contents: '"Retourne le nom d''un polygone de moins de cent côtés"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_nonPointConfonduavec
^(EruditeBookSection basicNew title: '-nonPointConfondu:avec:'; document: ((EruditeDocument contents: '"Vérifie que deux pointsne sont pas confodus "') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_originerep
^(EruditeBookSection basicNew title: '-origine:rep:'; document: ((EruditeDocument contents: '"le premier parent d''un segment ou d''une droite"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_parentsrep
^(EruditeBookSection basicNew title: '-parents:rep:'; document: ((EruditeDocument contents: '"les parents d''un objet."') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_penterep
^(EruditeBookSection basicNew title: '-pente:rep:'; document: ((EruditeDocument contents: '"Ccalcule la pente d''une droite"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_pointConfonduavec
^(EruditeBookSection basicNew title: '-pointConfondu:avec:'; document: ((EruditeDocument contents: '"Signale des pointscofondus, des points avec les mêmecoordonnées"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_pointDifferentde
^(EruditeBookSection basicNew title: '-pointDifferent:de:'; document: ((EruditeDocument contents: '"Vérifie que deux points sont difflérents, non confondus"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_pointentreet
^(EruditeBookSection basicNew title: '-point:entre:et:'; document: ((EruditeDocument contents: '"un point entre deux autres. "') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_pointrep
^(EruditeBookSection basicNew title: '-point:rep:'; document: ((EruditeDocument contents: '	"retourne un objet point"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_pointsSurCerclerep
^(EruditeBookSection basicNew title: '-pointsSurCercle:rep:'; document: ((EruditeDocument contents: '"Les points sur le cercle, ordonnés suivant leur abcisse"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_pointsSurrep
^(EruditeBookSection basicNew title: '-pointsSur:rep:'; document: ((EruditeDocument contents: '"Vérifie que deux points sont difflérents, non confondus"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_pointxrep
^(EruditeBookSection basicNew title: '-pointx:rep:'; document: ((EruditeDocument contents: '"La coordonnée x d''un point"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_pointyrep
^(EruditeBookSection basicNew title: '-pointy:rep:'; document: ((EruditeDocument contents: '"La coordonnée x d''un point"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_triangleAreawithwithrep
^(EruditeBookSection basicNew title: '-triangleArea:with:with:rep:'; document: ((EruditeDocument contents: '	"Aire à partir des coordonnées de 3  points"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Géométrie_vecteurrep
^(EruditeBookSection basicNew title: '-vecteur:rep:
'; document: ((EruditeDocument contents: '"Le point à l''extrémité du vecteur d''origine 0@0 de même direction  qu''une sorte de droite"') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_addFirstelrep
^(EruditeBookSection basicNew title: 'addFirst:el:rep:	'; document: ((EruditeDocument contents: 'addFirst:el:rep:	

Ajoute en premier un élément à une liste') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/16/2024 16:41:59'!
section_Expert_ListeDesPrédicats_Listes_addFirstelrep_addFirstelrep
^(EruditeBookSection basicNew title: 'addFirst:el:rep:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_addLastelrep
^(EruditeBookSection basicNew title: 'addLast:el:rep:'; document: ((EruditeDocument contents: 'addLast:el:rep:

Ajoute un élément à la fin d''une liste
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_ajouteDernierUniqueelrep
^(EruditeBookSection basicNew title: 'ajouteDernierUnique:el:rep:	'; document: ((EruditeDocument contents: 'ajouteDernierUnique:el:rep:	

Ajoute un élément à la fin d''une liste, s''il n''est pas déjà dans la liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_ajouteDernierelrep
^(EruditeBookSection basicNew title: 'ajouteDernier:el:rep:	'; document: ((EruditeDocument contents: 'ajouteDernier:el:rep:	

Ajoute un élément à la fin d''une liste') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_ajoutePremierUniqueelrep
^(EruditeBookSection basicNew title: 'ajoutePremierUnique:el:rep:	'; document: ((EruditeDocument contents: 'ajoutePremierUnique:el:rep:	

Ajoute un élément à la tête d''une liste, s''il n''est pas déjà dans la liste') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_ajoutePremierelrep
^(EruditeBookSection basicNew title: 'ajoutePremier:el:rep:	'; document: ((EruditeDocument contents: 'ajoutePremier:el:rep:	

Ajoute un élément à la tête d''une liste, 
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_ajoutelisterep
^(EruditeBookSection basicNew title: 'ajoute:liste:rep:'; document: ((EruditeDocument contents: 'ajoute:liste:rep:') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_contientliste
^(EruditeBookSection basicNew title: 'contient:liste:	'; document: ((EruditeDocument contents: '
contient:liste:	

Vérifie si un objet est présent dans une liste.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_couplesrep
^(EruditeBookSection basicNew title: 'couples:rep:	'; document: ((EruditeDocument contents: 'couples:rep:	

Associe une liste de deux points à un nom pour former 	un couple.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_dernierrep
^(EruditeBookSection basicNew title: 'dernier:rep:'; document: ((EruditeDocument contents: '
dernier:rep:

Le dernier élément d''une liste.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_excludesel
^(EruditeBookSection basicNew title: 'excludes:el:	'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_includesel
^(EruditeBookSection basicNew title: 'includes:el:	'; document: ((EruditeDocument contents: 'includes:el:	

Vérifie qu''une liste contient un élément.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_indexelrep
^(EruditeBookSection basicNew title: 'index:el:rep:'; document: ((EruditeDocument contents: 'index:el:rep:

Retourne l''indice d''un élément dans une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_jointavecrep
^(EruditeBookSection basicNew title: 'joint:avec:rep:'; document: ((EruditeDocument contents: 'joint:avec:rep:

Réunit les éléments de deux listes.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_minrep
^(EruditeBookSection basicNew title: 'min:rep:	'; document: ((EruditeDocument contents: 'min:rep:	

Le plus petit élément d''une  liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_nonContientel
^(EruditeBookSection basicNew title: 'nonContient:el:	'; document: ((EruditeDocument contents: 'nonContient:el:	

Vérifie qu''un élément n''est pas dans une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_nonTousPositifs
^(EruditeBookSection basicNew title: 'nonTousPositifs:	'; document: ((EruditeDocument contents: 'nonTousPositifs:	

Vérifie que les éléments d''une liste ne sont pas tous 	positifs.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_premierrep
^(EruditeBookSection basicNew title: 'premier:rep:'; document: ((EruditeDocument contents: 'premier:rep:

Le premier élément d''une liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_saufDernierrep
^(EruditeBookSection basicNew title: 'saufDernier:rep:	'; document: ((EruditeDocument contents: 'saufDernier:rep:	

Les éléments d''une liste sauf le dernier.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_saufPremierrep
^(EruditeBookSection basicNew title: 'saufPremier:rep:'; document: ((EruditeDocument contents: 'saufPremier:rep:

Les éléments d''une liste sauf le premier.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_sommerep
^(EruditeBookSection basicNew title: 'somme:rep:'; document: ((EruditeDocument contents: 'somme:rep:

La somme de tous les éléments d''une liste.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_sortblockrep
^(EruditeBookSection basicNew title: 'sort:block:rep'; document: ((EruditeDocument contents: 'sort:block:rep

Trie sort:block:reples éléments d''une liste selon un critère décrit 	dans le block.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_taillerep
^(EruditeBookSection basicNew title: 'taille:rep'; document: ((EruditeDocument contents: 'taille:rep

Le nombre d''éléments de la liste.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_tousNégatifs
^(EruditeBookSection basicNew title: 'tousNégatifs:	
'; document: ((EruditeDocument contents: 'tousNégatifs:	

Vérifie que tous les éléments de la liste sont 	négatifs.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Listes_triePointsSurdroiterep
^(EruditeBookSection basicNew title: 'triePointsSur:droite:rep:	'; document: ((EruditeDocument contents: 'triePointsSur:droite:rep:	

Trie les points sur une droite') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Nombres
^(EruditeBookSection basicNew title: 'Nombres'; document: ((EruditeDocument contents: 'Des opérations avec les nombresl') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Nombres_différenceetrep;
        add: self section_Expert_ListeDesPrédicats_Nombres_xrepvars;
        add: self section_Expert_ListeDesPrédicats_Nombres_supérieurà;
        add: self section_Expert_ListeDesPrédicats_Nombres_racineFractionrep;
        add: self section_Expert_ListeDesPrédicats_Nombres_égalà;
        add: self section_Expert_ListeDesPrédicats_Nombres_supérieurOuEgalà;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Nombres_différenceetrep
^(EruditeBookSection basicNew title: 'différence:et:rep:'; document: ((EruditeDocument contents: 'différence:et:rep:vars: 

La différence de deux nombres.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/2/2024 11:03:45'!
section_Expert_ListeDesPrédicats_Nombres_différenceetrepvars
^(EruditeBookSection basicNew title: 'différence:et:rep:vars'; document: ((EruditeDocument contents: 'différence:et:rep:vars: 

La différence de deux nombres.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Nombres_égalà
^(EruditeBookSection basicNew title: 'égal:à:'; document: ((EruditeDocument contents: 'égal:à:

égalité numérique de deux nombres ou de deux points.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Nombres_racineFractionrep
^(EruditeBookSection basicNew title: 'racineFraction:rep:'; document: ((EruditeDocument contents: 'racineFraction:rep:

Racine sous forme de fraction.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Nombres_supérieurOuEgalà
^(EruditeBookSection basicNew title: 'supérieurOuEgal:à:'; document: ((EruditeDocument contents: 'supérieurOuEgal:à:

>=
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/16/2024 16:42:00'!
section_Expert_ListeDesPrédicats_Nombres_supérieurOuEgalà_supérieurOuEgalà
^(EruditeBookSection basicNew title: 'supérieurOuEgal:à'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Nombres_supérieurà
^(EruditeBookSection basicNew title: 'supérieur:à:'; document: ((EruditeDocument contents: 'supérieur:à:vars:
 
> ') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/16/2024 16:42:00'!
section_Expert_ListeDesPrédicats_Nombres_supérieurà_supérieuràvars
^(EruditeBookSection basicNew title: 'supérieur:à:vars:'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Nombres_xrepvars
^(EruditeBookSection basicNew title: 'x:rep:vars: '; document: ((EruditeDocument contents: 'x:rep:vars: 
Coordonnée x d''''un point.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Relations
^(EruditeBookSection basicNew title: 'Relations'; document: ((EruditeDocument contents: ' DrGeo relations permettent de représenter les relations  d''équivalences sous forme de partition d''un ensemble pour un traitement plus rapide.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_ListeDesPrédicats_Relations_ajouteensemble;
        add: self section_Expert_ListeDesPrédicats_Relations_nonRelationetnom;
        add: self section_Expert_ListeDesPrédicats_Relations_relationetnom;
        add: self section_Expert_ListeDesPrédicats_Relations_relationrep;
        add: self section_Expert_ListeDesPrédicats_Relations_relationCréeetnom;
        add: self section_Expert_ListeDesPrédicats_Relations_relationsClés;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Relations_ajouteensemble
^(EruditeBookSection basicNew title: 'ajoute:ensemble:	'; document: ((EruditeDocument contents: 'ajoute:ensemble:	

Ajoute un élément à  un ensemble.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Relations_nonRelationetnom
^(EruditeBookSection basicNew title: 'nonRelation:et:nom:	'; document: ((EruditeDocument contents: 'nonRelation:et:nom:	

Vérifie qu''il n''y a pas de relation.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Relations_relationCréeetnom
^(EruditeBookSection basicNew title: 'relationCrée:et:nom:'; document: ((EruditeDocument contents: 'relationCrée:et:nom:

Etablit une relation.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Relations_relationetnom
^(EruditeBookSection basicNew title: 'relation:et:nom:'; document: ((EruditeDocument contents: 'relation:et:nom:	

Relation entre deux objets, nom de la relation.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Relations_relationrep
^(EruditeBookSection basicNew title: 'relation:rep:	'; document: ((EruditeDocument contents: 'relation:rep:	

Affiche les éléments en relation sous forme de 	listes.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_ListeDesPrédicats_Relations_relationsClés
^(EruditeBookSection basicNew title: 'relationsClés:	'; document: ((EruditeDocument contents: 'relationsClés:	

Affiche les relations définies.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 1/4/2025 13:42:33'!
section_Expert_MenuExpert
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_AfficherLesFaits
^(EruditeBookSection basicNew title: 'Afficher les faits'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_AfficherLesRègles
^(EruditeBookSection basicNew title: 'Afficher les règles'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_AffirmerDesFaits
^(EruditeBookSection basicNew title: 'Affirmer des faits'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_ChargerDesRègles
^(EruditeBookSection basicNew title: 'Charger des règles'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_ChargerLesFaitsDeLaFigure
^(EruditeBookSection basicNew title: 'Charger les faits de la figure'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_Déductions
^(EruditeBookSection basicNew title: 'Déductions'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 17:59:39'!
section_Expert_MenuExpert_ExaminerLaFigure
^(EruditeBookSection basicNew title: 'Examiner la figure'; document: ((EruditeDocument contents: '!!!!!!!!Examiner la figure
Rassemble plusieurs actions:
	Initialiser les faits.
	Charger les faits de la figure.
	Déductions.
	Modèles de questions.
	') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_ExpertAide
^(EruditeBookSection basicNew title: 'Expert Aide'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_Expliquer
^(EruditeBookSection basicNew title: 'Expliquer'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_ExpliquerRécursivement
^(EruditeBookSection basicNew title: 'Expliquer récursivement'; document: ((EruditeDocument contents: '!!!!!!!!Expliquer récursivement
Expliquer les nouveaux faits aussi jusqu''aux faits issus de la figure (DrGeo) ou affirmés (énoncé).

Pour expliquer récursivement un fait, tu peux sélectionner son numéro et cliquer **expliquer récursivement** dans le menu.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_InitialiserLesFaits
^(EruditeBookSection basicNew title: 'Initialiser les faits'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_InitialiserLesRègles
^(EruditeBookSection basicNew title: 'Initialiser les règles'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_ModèlesDeQuestion
^(EruditeBookSection basicNew title: 'Modèles de question'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_ModifierLaffichageDesCommentaires
^(EruditeBookSection basicNew title: 'Modifier l''''affichage des commentaires'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 17:59:39'!
section_Expert_MenuExpert_Vérifier
^(EruditeBookSection basicNew title: 'Vérifier'; document: ((EruditeDocument contents: '!!!!!!!!Vérifier
Cherche les valeurs des variables des modèles de questions, s''il y a plusieurs modèles tous doivent être satisfaits.

Tu peux aussi vérifier les conditions d''une règle  pour sa mise au point.

Pour vérifier un modèle de question, tu peux le sélectionner et cliquer **vérifier** dans le menu.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/20/2024 20:17:31'!
section_Expert_MenuExpert_WorldMenu
^(EruditeBookSection basicNew title: 'WorldMenu'; document: ((EruditeDocument contents: '!!!!!!Examiner la figure
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel
^(EruditeBookSection basicNew title: 'Tutoriel'; document: ((EruditeDocument contents: '!!!!!!Tutoriel

Le tutoriel se passe dans  un espace de travail, s''il n''y a pas d''espace de travai ouvert en copiant un exemple, un espace de travail s''ouvre avec le code:

Tu peux selectionner le code que tu veux exécuter dans l''espace de travail, 

La combinaison de touches **cmd/p** exécute le code et affiche le résultat de la sélection.

La combinaison de touches **cmd/d** exécute seulement le code de la sélection.
[[[ f :=DrGeoFigure new.''''.]]] embedIt

Tu peux aussi cliquer le bouton droit et cliquer  **print it** ou **do it** 
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_Tutoriel_OuvirUneFigureOuUnExpert;
        add: self section_Expert_Tutoriel_ExempleGénéral;
        add: self section_Expert_Tutoriel_InitialiserAffirmerEtAfficherDesFaits;
        add: self section_Expert_Tutoriel_InitialiserDéfinirDesRèglesDéductions;
        add: self section_Expert_Tutoriel_VérifierUneCondition;
        add: self section_Expert_Tutoriel_ModèlesDeQuestions;
        add: self section_Expert_Tutoriel_Explications;
        add: self section_Expert_Tutoriel_AfficherLesRègles;
        add: self section_Expert_Tutoriel_ChargerDesRègles;
        add: self section_Expert_Tutoriel_LesPrédicats;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/28/2025 23:30:07'!
section_Expert_Tutoriel_AfficherEtInitialiserLesRègles
^(EruditeBookSection basicNew title: 'Afficher et initialiser les règles'; document: ((EruditeDocument contents: '!!!!!!Afficher et initialiser les règles

//<expert>afficheRegles//
Affiche les règles actives.

//<expert>initRegles//
Initialise les règles

**Exemple:**

Afficher des règles.

"afficher des règles."
e afficheRegles. 

[[[
f presenter expertDisplayTutor:''
"afficher les règles."
e afficheRegles.''
]]] doItWithButton: copier l''exemple.

//On devrait avoir un seul apostrophe mais cuis replace à l''affichage un apostrophe par deux apostrophes.
 Deux apostrophes représentent un apostrophe dans une chaîne de caractère, un seul apostrophe marquerait la fin de la chaîne.//

Initialiser les règles.
"Initialiser les règles."
**e initRegles.**
"afficher des règles pour vérifier"
e afficheRegles.

[[[f presenter expertDisplayTutor:''
"Initialiser les règles."
e initRegles.
"afficher des règles pour vérifier"
e afficheRegles..''
]]] doItWithButton: copier l''exemple.













































































".
e afficheRegles
[[[f presenter expertDisplayTutor:''
"afficher des règles."
e afficheRegles.''
]]] doItWithButton: copier l''exemple.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/27/2025 22:15:13'!
section_Expert_Tutoriel_AfficherInitialiserEtAffirmerDesFaits
^(EruditeBookSection basicNew title: 'Afficher,Initialiser et affirmer des faits'; document: ((EruditeDocument contents: '!!!!!!IAfficher,Initialiser et affirmer des faits

**Initialiser des faits**

<expert>**iniFaits.** 
Supprime les faits actuels

Exemple:

"Supprimer les faits existants"
exp initFaits.
[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Supprimer les faits actuels"
exp initFaits.''
]]] doItWithButton: copier l''exemple. 

**Affirmer des faits**
//<expert>//**affirmeFaits:** faits 

Les faits sont affirmés avec la justification **énoncé**
la justification permet de savoir d''où provient l''affirmation.
La justification peut être :

	**énoncé** 						pour un fait **affirmé**.
	**Le nom d''une règle**						pour un fait qui provient d''une 	**règle**.s
	**DrGeo** 						pour un fait qui provient d''une **figure**,

**Exemple:	**

**"Affirmer les faits."
exp affirmeFaits: ''père Pierre Jean
mère Pierre Léa''.**

[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''

"Affirmer les faits."
exp affirmeFaits: ''''père Pierre Jean
mère Pierre Léa''''.
''
]]] doItWithButton: copier l''exemple.

**Afficher les faits**

"Afficher les faits"
expert afficheFaits.
[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Afficher les faits"
exp afficheFaits.''.
]]] doItWithButton: copier l''exemple. 

Exercices : 
	Conserver les faits existants.
	Affirmer les faits pour Marie.
	Affirmer les faits pour que Jules et Eric soit les grandpères de Pierre et de Marie.

[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Solution"

"Pas de initFaits pour garder les faits existants"

"Jules est le grandpère paternel"
exp affirmeFaits: ''''père Jean Jules''''.
 
"Eric est le grandpère maternel"
exp affirmeFaits: ''''père Léa Eric''''.


exp afficheFaits.
"La solution est aussi acceptable avec les noms inversés."''
]]] doItWithButton: Solutions.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/17/2025 09:09:26'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_AfficherLesRègles
^(EruditeBookSection basicNew title: 'Afficher les règles
'; document: ((EruditeDocument contents: '!!!!!!Afficher les règles

//<expert>afficheRegles//
Affiche les règles actives.

Exemple:

**exp afficheRegles. **
[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp afficheRegles.''.
]]] doItWithButton: copier l''exemple.

//On devrait avoir un seul apostrophe mais cuis replace à l''affichage un apostrophe par deux apostrophes.
 Deux apostrophes représentent un apostrophe dans une chaîne de caractère, un seul apostrophe marquerait la fin de la chaîne.//
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/17/2025 09:09:26'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/30/2025 23:38:57'!
section_Expert_Tutoriel_AffirmerOuAfficherDesFaits
^(EruditeBookSection basicNew title: 'Affirmer ou afficher des faits'; document: ((EruditeDocument contents: '!!!!!!Affirmer et afficher des faits.

//<expert>//**affirmeFaits:** faits 

Les faits sont affirmés avec la justification **énoncé**
la justification permet de savoir d''où provient l''affirmation.
La justification peut être :

	**énoncé** 						pour un fait **affirmé**.
	**Le nom d''une règle**						pour un fait qui provient d''une 	**règle**.s
	**DrGeo** 						pour un fait qui provient d''une **figure**,

**Exemple:	**

Il peut être utile d''initialiser les faits avant d''affirmer de nouveaux faits. 
"Supprime les faits existants" 
e initFaits.

S''il y a plusieurs faits	, chaque fait est à la 			ligne.

"Affirmer les faits."

**e affirmeFaits:** ''père Pierre Jean
mère Pierre léa''.

"Afficher tous les faits"
e **afficheFaits**.

[[[f presenter expertDisplayTutor:''
"Supprime les faits existants"
e initFaits.

"Affirmer les faits."
e affirmeFaits: ''''père Pierre Jean
mère Pierre Léa''''.

"Affiche tous les faits"
e afficheFaits.
''.
]]] doItWithButton: copier l''exemple.

Exercices : 
	Conserver les faits existants.
	Affirmer les faits pour Marie.
	Affirmer les faits pour que Jules et Eric soit les grandpères de Pierre et de Marie.

[[[f presenter expertDisplayTutor:''
"Solution"

"Pas de initFaits pour garder les faits existants"

"Jules est le grandpère paternel"
e affirmeFaits: ''''père Jean Jules''''.
 
"Eric est le grandpère maternel"
e affirmeFaits: ''''père Léa Eric''''.

e afficheFaits."Affiche tous les faits"
"La solution est aussi acceptable avec les noms inversés."''
]]] doItWithButton: Solutions.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_ChargerDesRègles
^(EruditeBookSection basicNew title: 'Charger des règles'; document: ((EruditeDocument contents: '!!!!!!Charger des règles
//<Expert>//**ChargeRegle:**  Règles_à_charger

Il y a des règles prédéfinies que tu peux charger.
Ces règles sont dans la classe ExpertRegle.

Pour voir ces règles exécute le message: **règlesPrédéfinies**.

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp règlesPrédéfinies.''.
]]] doItWithButton: copier l''exemple.

Chargement d''une règle:
exp initRegles.
exp chargeRegles: ''famille''.

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp initRegles.
exp chargeRegles: ''''famille''''.
exp afficheRegles.''
]]] doItWithButton: copier l''exemple.

Pour voir les règles chargées.

exp mesRegles.
[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp mesRegles.''

]]] doItWithButton: copier l''exemple.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/5/2024 15:21:47'!
section_Expert_Tutoriel_ChargerDesRègles_ExempleDexpertLeMorpion
^(EruditeBookSection basicNew title: 'Exemple d''expert, le morpion'; document: ((EruditeDocument contents: '!!!!!!morpion
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
	alors: ''''partie terminée''.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/2/2024 15:37:40'!
section_Expert_Tutoriel_ChargerDesRègles_morpion
^(EruditeBookSection basicNew title: 'morpion'; document: ((EruditeDocument contents: '!!!!!!morpion
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
	alors: ''''partie terminée''.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/27/2025 22:15:14'!
section_Expert_Tutoriel_Déductions
^(EruditeBookSection basicNew title: 'Déductions'; document: ((EruditeDocument contents: '!!!!!!Déductions
//<expert>//**deduis**

Lance le processus de déduction.
	
Les règles sont exécutées et, si leurs conditions sont satisfaites, la conclusion est ajoutée aux affirmations.

Exemple: 

C''est le même exemple que pour la définition d''une règle  mais l''attention est sur le message **deduis**


"initialiser les règles"
exp initRegles.

"Définition des  règles"
exp lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''un enfant sont son père et sa mère''.

e lisRegle: ''''grandPère''''
si:''père ?enfant ?père 
père  ?père ?grandPère''''
alors:''grandPère ?grandPère ?enfant''
com:''''Le grandPère est le père du père d''''un enfant.''.

**Essai de la règle.**

"Faits donnés"
exp initFaits.
e affirmeFaits: ''père Pierre Jean
père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Jean Jules
père Léa Eric''.

**"Examiner les règles"**
exp deduis

"affichage des faits après déductions."
exp afficheFaits.
[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''

"Tu peux sélectionner le tout, ce qui affiche le résultat final  ou  sélectionner et exécuter chaque partie ce qui  affichele résultat de chaque étapes."
"Initialiser les règle"
exp initRegles.

"Définition des règles"
exp lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.

exp lisRegle: ''''grandPère''''
si:''''père ?enfant ?père 
père  ?père ?grandPère''''
alors:''''grandPère ?grandPère ?enfant''''
com:''''Le grandPère est le père du père d''''''''un enfant.''''.


"Essai de la règle: Faits donnés"
"Initialiser les faits."
exp initFaits.

"Affirmer les faits."
exp affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Jean Jules
père Léa Eric''''.


"Examiner les règles"
exp deduis.

"affirmation des faits après déductions."
e afficheFaits.
'' 
]]] doItWithButton: copier l''exemple.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/28/2025 23:30:07'!
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
**e lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''un enfant sont son père et sa mère''.
**
"**Déductions**"
e deduis."examine les règles"

**"affichage des faits"**
e afficheFaits.

[[[f presenter expertDisplayTutor:''
"Tu peux sélectionner le tout, ce qui affiche le résultat final  ou  sélectionner et exécuter chaque partie ce qui  affichele résultat de chaque étapes."
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_ExempleGénéral
^(EruditeBookSection basicNew title: 'Exemple général'; document: ((EruditeDocument contents: '!!!!Exemple Général
Pour observer les méthodes du système expert, il faut les mettre en situation parmi les autres méthodes, avec l''Exemple général on peut utiliser les méthodes en ce concentrant sur chaque méthode.


[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Tu peux sélectionner le tout, ce qui affiche le résultat final  ou  sélectionner et exécuter chaque partie ce qui  affichele résultat de chaque étapes."
"Initialiser les règle"
exp initRegles.

"Définition de la règle"
exp lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.

"Essai de la règle: Faits donnés"
"Initialiser les faits."
exp initFaits.

"Affirmer les faits."
exp affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''''.

"Examiner les règles"
exp deduis.

"affichage des modéles de questions,"
exp modèlesQuestions. 
'' 
]]] doItWithButton: copier l''exemple génélral.

Tu retrouvera ce bouton dans chaque section et portera son attention sur une partie de l''exemple pour chaque méthode.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Faits donnés"
exp initFaits.
exp affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''''.

"Définition de la règle"
exp lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.

" Déductions."
exp deduis.
"affirmation des faits"
exp afficheFaits.
exp causeFaitNo:5
.''.
]]] doItWithButton: copier l''exemple.

Essaie avec le numéro d''autres faits. 

<Expert>** causesFaitNo: ** // numéro_ d''un_fait//  (causes au pluriel)

Explique  aussi les faits trouvés dans la condition jusqu''à remonter à l''énoncé.
On dit expliquer récursivement.

e causeFaitNo:5.
[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp causesFaitNo: 5 .
''
]]] doItWithButton: copier cet exemple à la suite de l''exemple précédant.

Cet exemple sera repris dans la section **Les prédicats** dans le cas où un fait dépend de plusieurs règles.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_InitialiserAffirmerEtAfficherDesFaits
^(EruditeBookSection basicNew title: 'Initialiser, affirmer et Afficher des faits '; document: ((EruditeDocument contents: '!!!!Initialiser, affirmer et Afficher des faits.

**Initialiser des faits**

<expert>**iniFaits.** 
Supprime les faits actuels


**Affirmer des faits**
//<expert>//**affirmeFaits:** faits 

Les faits sont affirmés avec la justification **énoncé**
la justification permet de savoir d''où provient l''affirmation.
La justification peut être :

	**énoncé** 						
	pour un fait **affirmé**.

	**Le nom d''une règle**						
	pour un fait qui provient d''une 	**règle**.

	**DrGeo** 						
	pour un fait qui provient d''une **figure**.

**Exemple:	**

[[[fig presenter expertDisplayTutor:''
"Initialiser les faits"
exp initFaits.

" Affirmer les faits."
exp affirmeFaits: ''''père Pierre Jean
mère Pierre Léa''''.

" Afficher les faits"
exp afficheFaits.
''
]]] doItWithButton: copier l''exemple.


Exercices : 
	Conserver les faits existants.
	Affirmer les faits pour Marie.
	Affirmer les faits pour que Jules et Eric soit les grandpères de Pierre et de Marie.

[[[fig presenter expertDisplayTutor:''
"Solution"

"Pas de initFaits pour garder les faits existants"

"Jules est le grandpère paternel"
exp affirmeFaits: ''''père Jean Jules''''.
 
"Eric est le grandpère maternel"
exp affirmeFaits: ''''père Léa Eric''''.


exp afficheFaits.
"La solution est aussi acceptable avec les noms inversés."''
]]] doItWithButton: Solutions.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_InitialiserDéfinirDesRèglesDéductions
^(EruditeBookSection basicNew title: 'Initialiser, définir des règles, déductions.'; document: ((EruditeDocument contents: '!!!!!!Initialiser,  définir des règles, déductions
	**Initialiser les règles**

//<expert>//**initRegles**

Initialise les règles en mémoire.

	**Défnir une règle.**

//<expert>//**lisRegle:si:alors:com:** nom  cond concl com
ou
**lisRegle:si:alors:** nom  cond concl 
nom 		nom de la règle.
cond		condition
concl		conclusion
com		commentaire

	**Exemple:**

**Initialiser les règles**
"Initialiser les règles"
exp initRegles.

**Définir une règle**
"Définition de la règle"
e lisRegle: ''parents''
si:''père ?e ?p
mère ?e ?m''
alors:''parents ?e ?p  ?m'' .
com:''Les parents d''''un enfant sont son père et sa mère''.

**Examiner les règles**
"Examiner les règles"
exp deduis.

**Afficher les faits**
" Afficher les faits"
exp afficheFaits.


[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Initialiser les règles"
exp initRegles.

"Définition de la règle"
exp lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m''''
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.

"Examiner les règles"
exp deduis.

" Afficher les faits"
exp afficheFaits.


''
]]] doItWithButton: copier l''exemple.

	**Exercices :**

On affirme les faits suivants :

père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Jean Jules
père Léa Eric

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Faits donnés à affirmer"
exp initFaits.
exp affirmeFaits: ''''
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

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Solution"

"définition de la règle"
exp lisRegle: ''''grandPère''''
si:''''père ?enfant ?père 
père  ?père ?grandPère''''
alors:''''grandPère ?grandPère ?enfant''''
com:''''Le grandPère est le père du père d''''''''un enfant.''''.

"deductions"
exp deduis.

" Affichage des faits"
exp afficheFaits.
''.
]]] doItWithButton: Solution .// (la solution est suivie de l''essai de la règle)//.

Aller plus loin :

Ecris d''autres règles sur la famile.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/27/2025 22:15:14'!
section_Expert_Tutoriel_InitialiserEtDéfinirDesRègles
^(EruditeBookSection basicNew title: 'Initialiser et définir des règles.'; document: ((EruditeDocument contents: '!!!!!!IAfficher,Initialiser et affirmer des faits

**Initialiser des faits**

<expert>**iniFaits.** 
Supprime les faits actuels

Exemple:

"Supprimer les faits existants"
exp initFaits.
[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Supprimer les faits actuels"
exp initFaits.''
]]] doItWithButton: copier l''exemple. 

**Affirmer des faits**
//<expert>//**affirmeFaits:** faits 

Les faits sont affirmés avec la justification **énoncé**
la justification permet de savoir d''où provient l''affirmation.
La justification peut être :

	**énoncé** 						pour un fait **affirmé**.
	**Le nom d''une règle**						pour un fait qui provient d''une 	**règle**.s
	**DrGeo** 						pour un fait qui provient d''une **figure**,

**Exemple:	**

**"Affirmer les faits."
exp affirmeFaits: ''père Pierre Jean
mère Pierre Léa''.**

[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''

"Affirmer les faits."
exp affirmeFaits: ''''père Pierre Jean
mère Pierre Léa''''.
''
]]] doItWithButton: copier l''exemple.

**Afficher les faits**

"Afficher les faits"
expert afficheFaits.
[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Afficher les faits"
exp afficheFaits.''.
]]] doItWithButton: copier l''exemple. 

Exercices : 
	Conserver les faits existants.
	Affirmer les faits pour Marie.
	Affirmer les faits pour que Jules et Eric soit les grandpères de Pierre et de Marie.

[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Solution"

"Pas de initFaits pour garder les faits existants"

"Jules est le grandpère paternel"
exp affirmeFaits: ''''père Jean Jules''''.
 
"Eric est le grandpère maternel"
exp affirmeFaits: ''''père Léa Eric''''.


exp afficheFaits.
"La solution est aussi acceptable avec les noms inversés."''
]]] doItWithButton: Solutions.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/27/2025 22:15:13'!
section_Expert_Tutoriel_InitialiserLesFaits
^(EruditeBookSection basicNew title: 'Initialiser les faits'; document: ((EruditeDocument contents: '
//<expert>//**iniFaits.** 

Supprime toutes les affirnations.


"Supprimer les faits actuels"
exp initFaits.
 ''.
[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp initFaits.
''.
]]] doItWithButton: copier l''exemple. 

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 6/17/2025 09:09:26'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_LesPrédicats
^(EruditeBookSection basicNew title: 'Les prédicats'; document: ((EruditeDocument contents: '!!!!!!Les prédicats
//<expert> //** sélecteur  **//arguents//

Les prédicats sont des méthodes que tu peux appeler depuis le système expert.
Elles retounent true ou false (vrai ou faux).

Le sélecteur est formé des sélecteurs de la méthode acollés et  les arguents suivent

Les prédicats s''utilisent comme les questions. 
En général on place les prédiats après les questions.

Un antécédant d''une règle ne peut pas avoir que des prédicats, il doit y avoir au moins une questions.

Exemples:

"définirtion de la règle parents"
e initRegles.
e lisRegle: ''parents''
si:''père ?e ?piigg
mère ?e ?m''.
alors:''parents ?e ?p  ?m'' 
com:''Les parents d''''un enfant sont son père et sa mère''.

"defnition de la règle frèreOuSoeur:
exp  lisRegle:''frèreOuSoeur''
si:''parents ?e1 ?p  ?m
parents ?e2  ?p  ?m''.
alors:''frèreOuSoeur ?e1 ?e2''.	

[[[fig presenter expertDisplayTutor:''
"initialiser les faits"
exp initRegles.

"définirtion de la règle parents"
exp lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.

"Définition de la règle frèreOuSoeur"
exp  lisRegle:''''frèreOuSoeur''''
si:''''parents ?e1 ?p  ?m
parents ?e2  ?p  ?m''''
alors:''''frèreOuSoeur ?e1 ?e2''''.

"essai de la règle"
"initialiser les faits"
exp initFaits.

"Affirmation des faits"
exp affirmeFaits: ''''père Pierre  Jean
 mère Pierre  léa
père Marie  Jean
mère Marie  léa''''.
exp deduis. 
exp verifieCondition: ''''frèreOuSoeur ?e1 ?e2''''.''.]]] doItWithButton: copier l''exemple.

On obtient  4  solutions, deux ont le même enfant chaque fois.

Pour éliminer ces solutions, on va dire que ?e1 et ?e2 doivent être différents.

Au lieu d''une condition on va utiliser un **prédicat** qui va faire la comparaison et répondre vrai ou faux
comme une condition.

Un prédicat est une méthode smalltalk appelée par le système expert.

Le nom du  prédicat est formé du nom de la méthode suivi de ses sélecteurs puis des valeurs des paramètres.

Le prédicat qu''on va utiliser est **different:de:**.

**Modification de la règle**

       "Redéfinition de la règle"
	exp  lisRegle:''frèreOuSoeur''
	si:''parents ?e1 ?p  ?m
	parents ?e2  ?p  ?m
   	different:de:?e1 ?e2''
	alors:''frèreOuSoeur ?e1 ?e2''.
	[[[fig presenter expertDisplayTutor:''
"Redéfinition de la règle"
exp lisRegle:''''frèreOuSoeur''''
si:''''parents ?e1 ?p  ?m
parents ?e2  ?p  ?m
different:de: ?e1 ?e2 ''''
alors:''''frèreOuSoeur ?e1 ?e2''''.''.
]]] doItWithButton: copier l''exemple.

**Essai de la règle modifiée**

       "Essai de la règle modifiée"
	"réinitialiser les faits"
	exp initFaits.

	"Affirmation des faits"
	e affirmeFaits: ''
	père Pierre  Jean
 	mère Pierre  léa
	père Marie  Jean
	mère Marie  léa''.

	"déductions"
	exp deduis. 

	"Vérification"
	exp verifieCondition: ''frèreOuSoeur ?e1 ?e2''.
	[[[fig presenter expertDisplayTutor:''
 "Essai de la règle modifiée"
"réinitialiser les faits"
exp initFaits.

"Affirmation des faits"
exp affirmeFaits: ''''père Pierre  Jean
 mère Pierre  léa
père Marie  Jean
mère Marie  léa''''.
exp deduis. 
exp verifieCondition: ''''frèreOuSoeur ?e1 ?e2''''.''.]]] doItWithButton: copier l''exemple.

Maintenant il n''y a que deux réponses.

Tu peux encore fairre mieux  avec le prédicat qui classe en ordre alphabétique  **ordonneMot:et:rep1:rep2:**.

**Nouvelle modification de la règle.**

	"Définition de la règle frèreOuSoeur"
	exp  lisRegle:''frèreOuSoeur''
	si:''parents ?e1 ?p  ?m
	parents ?e2  ?p  ?m
   	different:de:?e1 ?e2
	ordonneMot:et:rep1:rep2: ?e1 ?e2  ?e1 ?e2 ''
	alors:''frèreOuSoeur ?e1 ?e2''.
	[[[fig presenter expertDisplayTutor:''
"Définition de la règle frèreOuSoeur"
exp  lisRegle:''''frèreOuSoeur''''
si:''''parents ?e1 ?p  ?m
parents ?e2  ?p  ?m
different:de: ?e1 ?e2  
ordonneMot:et:rep1:rep2:  ?e1 ?e2  ?e1 ?e2 ''''
alors:''''frèreOuSoeur ?e1 ?e2''''.''.
]]] doItWithButton: copier l''exemple.

**Essai de la nouvelled règle**

	"essai de la règle"
	"réinitialiser les faits"	
	exp initFaits.
	
	"Affirmation des faits"
	exp affirmeFaits: ''père Pierre  Jean
 	mère Pierre  léa
	père Marie  Jean
	mère Marie  léa''.
	
	"Déductions"
	exp deduis. 

	"Vérification"
	exp verifieCondition: ''frèreOuSoeur ?e1 ?e2''.
[[[fig presenter expertDisplayTutor:''
 "Essai de la nouvelle règle "
"réinitialiser les faits"
exp  initFaits.

"Affirmation des faits"
exp affirmeFaits: ''''père Pierre  Jean
 mère Pierre  léa
père Marie  Jean
mère Marie  léa''''.
exp deduis. 
exp verifieCondition: ''''frèreOuSoeur ?e1 ?e2''''.''.]]] doItWithButton: copier l''exemple.

Il n''y a qu''une réponse."
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_ModèlesDeQuestions
^(EruditeBookSection basicNew title: 'Modèles de questions'; document: ((EruditeDocument contents: '!!!!!!Modèles de questions

//<expert>//**modèlesQuestions** 

Un modèles de questions est  une forme généralisée de la conclusion d''une règle formé du premier mot de la conclusion suivi de variables qui vont recevoir les valeurs trouvées par le système expert.

Si les faits sont nombreux, il est plus de pratique de poser des questuonsdes questions au système expert.
Les modèles de questions résument les questions que tu peux poser au système expert au moyen du message **vérifieCondition:** ou avec l''article **vérifier** du sous menu Expert du menu de la figure. (voir section suivante) 

Exemple: 

tu peux faire cet exemple si tu viens de faire la section **Initialiser et définir des règles**, sinon fais l''exemple complet.

exp modèlesQuestions. 
[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp modèlesQuestions. .''.
]]] doItWithButton: copie cet exemple si tu viens de faire la section Initialiser et définir des règles. .


sinon copie l''exemple complet.
[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Tu peux sélectionner le tout, ce qui affiche le résultat final  ou  sélectionner et exécuter chaque partie ce qui  affichele résultat de chaque étapes."
"Initialiser les règle"
exp initRegles.

"Définition de la règle"
exp lisRegle: ''''parents''''
si:''''père ?e ?p
mère ?e ?m''''
alors:''''parents ?e ?p  ?m'''' 
com:''''Les parents d''''''''un enfant sont son père et sa mère''''.

"Essai de la règle: Faits donnés"
"Initialiser les faits."
exp initFaits.

"Affirmer les faits."
exp affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa
père Pierre Jean''''.

"Examiner les règles"
exp deduis.

"affichage des modéles de questions,"
exp modèlesQuestions. 
'' 
]]] doItWithButton: copier l''exemple complet.


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


[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Faits donnés"
exp initFaits.
exp affirmeFaits: ''''père [ Pierre Marie ] Jean''''.'']]] doItWithButton: copier l''exemple pour l''exercice.

complète les affirmations pour la mère, 
deduis et affiche le modèle de  questions.

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"solution"
"Faits donnés"
exp initFaits.
exp affirmeFaits: ''''père [ Pierre Marie ] Jean
mère [ Pierre Marie ] Léa''''.
 exp deduis .  	
exp modèlesQuestions.

'']]] doItWithButton: solution.

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 1/4/2025 14:08:17'!
section_Expert_Tutoriel_ModèlesDeQuestions_UtilisationInteractive
^(EruditeBookSection basicNew title: 'Utilisation interactive'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 12/22/2024 23:40:05'!
section_Expert_Tutoriel_OuvirUnExpert
^(EruditeBookSection basicNew title: 'Ouvir un expert'; document: ((EruditeDocument contents: '!!!!!!Ouvir un expert

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

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_OuvirUneFigureOuUnExpert
^(EruditeBookSection basicNew title: 'Ouvir une figure ou un expert

'; document: ((EruditeDocument contents: '!!!!!!Ouvir une figure 
!!!!!!ou un système expert

//<Expert>//**Expert ** nouveau.
//<DrGeoFigure>//**DrGeoFigure ** nouveau.

 Lors de la création d''une instance de DrGeoFigure, une instance de Expert est créée et placée dans la variabe d''instance **expert** de la figure.

Si l''on clique le bouton vert avant d''exécuter le code ci-dessous la figure la nouvelle figure apparait dans la fenêtre de droite, dans un espace de travail les variables sont déclarées par défaut. C''est utile pour essayer des parties de code.

fig:= DrGeoFigure nouveau.
exp := fig expert.
{exp .fig}
[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp := fig expert.
{exp .fig}'']]] doItWithButton: copier l''exemple.
//{exp .fig} des variables entre { et } séparées par . sont remplacées par un tableau avec leurs valeurs.//
	
Créér seulement une instance de Expert.
exp :=Expert nouveau.
exp
[[[ fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
exp :=Expert nouveau.
exp'']]] doItWithButton: copier l''exemple.

Dans la suite de ce tutoriel, si tu copies un exemple un espace de travail s''ouvre , s''il n''est pas déjà ouvert, avec les variables **fig** et **exp** déjà initialisées.
**fig** contient une DrGeoFigure et **exp** une Expert.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_Tutoriel_VérifierUneCondition
^(EruditeBookSection basicNew title: 'Vérifier une condition.'; document: ((EruditeDocument contents: '!!!!Vérifier une condition.
//<expert>//**vérifieCondition:**cond

**Variables**

Les mots qui commencent par **?** sont des **variables**.

Une variable est dite **libre** si elle n''a pas ecore reçu de valeur  et **instanciée** si elle contient une valeur.

Le lien entre une variable et sa valeur cest rangé dans un ditcionaire.
.

Une **question** est un fait dont certains mots sont remplacés par des variables. 

Une **condition** est formée d''une ou plusieurs **questions**, elle et dite 	**vraie** si toutes ses variables sont instanciées.

Si la condition d''une règle est vraie, alors on peut affirmer la conclusion.

Le premier mot d''une **question** ne doit pas être une **variable.**

**Unification**

L''**unification** compare un fait à une question et donne comme valeur à une variables le mot du fait qui est à la même position dans le fait.

Ce procédé  est effectué lors de la déduction, tu n''aura pas à l''utiliser, il est en exemple ici parce que c''est 
le principe de base du système Expert et pour aider à comprendre comment le système Expert fonctionne.

**Unifier une question avec un fait**.

 Exemple:


"lvar est le dictionaire qui contient les valeurs des variables."
"créer un dictionaire vide"

lvar:=IdentityDictionary new.

"Unifier une question avec un fait"
exp unifie: ''père ?x1 ?x2'' avec: ''père Pierre Jean'' vars:lVar.
"Si l''''unification réussit, la réponse est True."

"Afficher le dictionnaire lvar"
lvar.

[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"lvar est le dictionaire qui contient les valeurs des variables."
"créer un dictionaire vide"
lvar:=IdentityDictionary new.

"Unifier une question avec un fait"
exp unifie: ''''père ?x1 ?x2'''' avec: ''''père Pierre Jean'''' vars:lvar.

"Si l''''unification réussit, la réponse est True."

"Afficher le dictionnaire lvar"
lvar.''.
]]] doItWithButton: copier l''exemple d''unification.

**Condition.**

Une condition est formée de une ou plusieurs questions, une par ligne,

**Vérifier une condition**

Chaque question est comparées aux faits au moyen de l''unificaion.
Si l''unification réussit, les variables reçoivent leurs valeurs, si une variable a déjà reçu une valeur,la comparaison se fait avec cette valeur et si elles ne sont pas égales ,l''unification échoue. 
Si l''unification réussit pour toutes les question, alors la condition est vérifiée et on affiche la condition avec les valeurs trouvèes, il peut y avoir plusieurs réponses.

"Affirmer les faits."
exp affirmeFaits: ''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa''


"Recherche du père de Pierre"
exp vérifieCondition:''père Pierre ?x2''

"Recherche du père de de Marie"
exp vérifieCondition:''père Marie ?x2''

"Recherche des parents de Marie"
exp vérifieCondition:''père Marie ?x2
mère Marie ?x3''
"Vérification d''''une condition"
exp vérifieCondition:''père ?x1 ?x2
mère ?x1 ?x3''.
[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Affirmer les faits."
exp affirmeFaits: ''''père Pierre Jean
mère Pierre Léa
père Marie Jean
mère Marie Léa''''.
"Vérification d''''une condition"
exp  vérifieCondition:''''père  ?x1 ?x2
mère ?x1 ?x3''''.''.
]]] doItWithButton: copier l''exemple.

Le premier modèle de questions met dans la variable ?x1 le nom de l''enfant.
Le deuxième  cherche la mère qui correspond à ?x1.

**Utiliser une valeur.**

Tu peux mettre à la place d''une variable une valeur de cette variable pour préciser une question.
"Une valeur à la place d''''une variable"
"Recherche du père de Pierre"
exp verifieCondition:''père Pierre ?x2''

"Recherche du père de de Marie"
exp vérifieCondition:''père Marie ?x2''

"Recherche des parents de Marie"
exp vérifieCondition:''père Marie ?x2
mère Marie ?x3''.
[[[  fig ifNil: [ fig := DrGeoFigure nouveau.].
fig presenter expertDisplayTutor:''Tutoriel'' string:''
"Une valeur à la place d''''une variable"exp

"Recherche du père de Pierre"
exp verifieCondition:''''père Pierre ?x2''''

"Recherche du père de de Marie"
exp vérifieCondition:''''père Marie ?x2''''

"Recherche des parents de Marie"
exp vérifieCondition:''''père Marie ?x2
mère Marie ?x3''''
'']]] doItWithButton: copier l''exemple.


**Afficher les valeurs o
//<expert>//**vérifieConditionSolution:**cond 

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Expert_UtilisationInteractive
^(EruditeBookSection basicNew title: 'Utilisation interactive'; document: ((EruditeDocument contents: '!!!!!! Utilisation intreractive

Pour ouvrir une figure, Clique sur le bouton ci-dessous[[[  ]]] withDrGeoActions. qui écris  **DrGeoFigure nouveau** dans l''éditeur de code, 

[[[DrGeoFigure nouveau]]] withDrGeoActions.

Clique sur le bouton vert **exécuter**  de l''éditeur de code. [[[DrGIcons iconUI: #play]]] embedIt

Clique dans la figure à droite avec le bouton droit pour avoir un menu avec lequel tu peux construire une figure ou charge une figure proposée dans une section avec **Charger la figure et les modèles de questions**,

Une fois une figure chargée:

Dans le sous-menu Expert, clique sur **Examiner la figure**, un espace de travail nommé **Tutoriel** s''ouvre avec les commandes qui ont été exécutées pour obtenir les **modèles de 	questions.**

Dans cet espace de travail, pour vérifiers un modèle, selectionne le modèle et, dans le sous-menu Expert, clique sur **Vérifier**.

Tu peux aussi copier plusieurs modèles de questions, une par ligne, et selectionner le tout pour vérification c''est utile pour vérifier les conditions d''une règle. Attention, il est souvent nécessaire de modifier la numérotation ou le nom des variables pour qu''une variable représente toujours la même chose.

Il est aussi possible de remplacer des variables par leur valeurs pour des questions plus précises.

On obtient **vrai** si tous les modéles sont vériflés.

Pour expliquer un fait, selectionne le numéro du fait et clique sur **Expliquer**.

Pour avoir la documentation d''un article du menu, laisse la souris dessus sans cliquer.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Expert_UtilisationInteractive_MenuExpert;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
section_LignesCourbes
^(EruditeBookSection basicNew title: 'Lignes courbes'; document: ((EruditeDocument contents: 'La famille des lignes courbres regroupe les cercle, arc de cercle, polygone et lieu de points.

Déplie la section **▶ Lignes courbes** pour explorer ces types de ligne !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_LignesCourbes_Cercle;
        add: self section_LignesCourbes_ArcDeCercle;
        add: self section_LignesCourbes_Polygone;
        add: self section_LignesCourbes_LieuDePoint;
        add: self section_LignesCourbes_CourbeFonction;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
section_LignesDroites_Demidroite
^(EruditeBookSection basicNew title: 'Demi-droite'; document: ((EruditeDocument contents: '!!!!!!Demi-droite
//<demi-droite>// **demiDroiteOrigine:passantPar:** //o p//

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
fig demiDroiteOrigine: 0@0 passantPar: a]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
section_LignesDroites_Explications
^(EruditeBookSection basicNew title: 'Explications'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_LignesDroites_Parallel
^(EruditeBookSection basicNew title: 'Parallel'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_LignesDroites_Perpendicular
^(EruditeBookSection basicNew title: 'Perpendicular'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_LignesDroites_Ray
^(EruditeBookSection basicNew title: 'Ray'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_LignesDroites_StraightLine
^(EruditeBookSection basicNew title: 'Straight line'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines
^(EruditeBookSection basicNew title: 'Lines'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Lines_Segment;
        add: self section_Lines_StraightLine;
        add: self section_Lines_Ray;
        add: self section_Lines_Parallel;
        add: self section_Lines_Perpendicular;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_Parallel
^(EruditeBookSection basicNew title: 'Parallel'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_Perpendicular
^(EruditeBookSection basicNew title: 'Perpendicular'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_Ray
^(EruditeBookSection basicNew title: 'Ray'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_Segment
^(EruditeBookSection basicNew title: 'Segment'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_StraightLine
^(EruditeBookSection basicNew title: 'Straight line'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs
^(EruditeBookSection basicNew title: 'Mesures et valeurs'; document: ((EruditeDocument contents: 'Cette section regroupe les commandes pour obtenir des valeurs numériques : angles, coordonnées, pente, distance et valeurs libres.

Déplie la section **▶ Mesures et valeurs** pour explorer ces types de valeurs numériques !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_MesuresEtValeurs_Angle;
        add: self section_MesuresEtValeurs_Coordonnée;
        add: self section_MesuresEtValeurs_Mesure;
        add: self section_MesuresEtValeurs_ValeurRéglette;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs_Angle
^(EruditeBookSection basicNew title: 'Angle'; document: ((EruditeDocument contents: '!!!!!!Angle géométrique
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs_Coordonnée
^(EruditeBookSection basicNew title: 'Coordonnée'; document: ((EruditeDocument contents: '!!!!!!Abscisse
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
c x]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs_Mesure
^(EruditeBookSection basicNew title: 'Mesure'; document: ((EruditeDocument contents: '!!!!!!Longueur
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
p _ fig penteDe: d]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 16:19:18'!
section_MesuresEtValeurs_Valeur
^(EruditeBookSection basicNew title: 'Valeur'; document: ((EruditeDocument contents: '!!!!!!Valeur libre
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

!!!!!!!!Valeur décimale') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs_ValeurRéglette
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
//<bloc>// **decimal:a:min:max:nom:affciherValeur:** //v1') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_NumériqueTexte
^(EruditeBookSection basicNew title: 'Numérique & Texte'; document: ((EruditeDocument contents: 'Cette section regroupe les commandes pour obtenir des valeurs numériques et texte : angles, coordonnées, pente, distance, valeurs libres, etc.

Déplie la section **▶ Numérique & Texte** pour explorer ces types de valeurs numériques !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_NumériqueTexte_Angle;
        add: self section_NumériqueTexte_Coordonnée;
        add: self section_NumériqueTexte_Mesure;
        add: self section_NumériqueTexte_Equation;
        add: self section_NumériqueTexte_ValeurRéglette;
        add: self section_NumériqueTexte_Texte;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
section_Point
^(EruditeBookSection basicNew title: 'Point'; document: ((EruditeDocument contents: 'Tu peux créer toutes sortes de point : point libre que tu peux ensuite déplacer à la souris, point mobile sur une ligne, point milieu ou d''intersection entre deux lignes. Il est même possible de créer un point dont la position est déterminée par un bloc de code !!

Déplie la section **▶ Point** pour explorer ces types de point !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Point_Libre;
        add: self section_Point_Fixe;
        add: self section_Point_SurLigne;
        add: self section_Point_Milieu;
        add: self section_Point_Intersection;
        add: self section_Point_BlocDeCode;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
section_Point_Libre
^(EruditeBookSection basicNew title: 'Libre'; document: ((EruditeDocument contents: '!!!!!!Point libre
//<point>// **point:** //pointOuBloc//
⇒ point mobile dans le plan

[[[DrGeoFigure nouveau
	point: 5@2;
	point: [ 5 auHasard @ 5 auHasard ] ]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_fixe
^(EruditeBookSection basicNew title: 'fixe'; document: ((EruditeDocument contents: '!!!!!!Point fixe
//<point>// **pointX:Y:** //v1 v2//

[[[DrGeoFigure nouveau
	pointX: 2 Y: 5]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_intersection
^(EruditeBookSection basicNew title: 'intersection'; document: ((EruditeDocument contents: '!!!!!!Point d''Intersection entre deux lignes
//<point>// **intersectionDe:et:** //l1 l2//
⇒ point d’intersection des deux lignes

[[[f intersectionDe: droite et: segment]]]

!!!!!!Intersection alternative
//<point>// **autreIntersectionDe:et:** //l1 l2//
⇒ l’autre point d’intersection des deux lignes, lorsqu’il existe.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_milieu
^(EruditeBookSection basicNew title: 'milieu'; document: ((EruditeDocument contents: '!!!!!!Milieu de deux points
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
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_mobile
^(EruditeBookSection basicNew title: 'mobile'; document: ((EruditeDocument contents: '!!!!!!Point mobile
//<point>// **point:** //pointOuBloc//

[[[| fig |
fig _ DrGeoFigure nouveau.
fig point: 5@2.
fig point: [ 5 auHasard @ 5 auHasard ] ]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_surLigne
^(EruditeBookSection basicNew title: 'sur ligne'; document: ((EruditeDocument contents: '!!!!!!Point sur ligne
//<point>// **pointSurLigne:a:** //curve a//

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 a: 5@3.
f pointSurLigne: s a: 0.5]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Styles_Ligne
^(EruditeBookSection basicNew title: 'Ligne'; document: ((EruditeDocument contents: ' !!!!!!1.3.1. Angle entre demi-droites


"1.3.1.1  Script de la Figure."
f := f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
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


[[[f presenter expertDisplayTutor:''
"1.3.1.1  Script de la Figure."
f := f := DrGeoFigure nouveau.
f expert: e.
e drgeo:f.
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
''
]]] doItWithButton: copier le script.


Remarque:
Les angles qui sont équivalents à un angle de base font partie d''une relation d''équivalence. 

e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''
e verifieCondition: ''''relationCréée ?x1 ?x2 ?x3''''.
''
]]] doItWithButton: copier l''exemple.


Pour le sytème expert définir une relation d''équivalence est plus efficace que d''affimer tous les faits équivalents séparément lorsqu''on vérifie la relation dans une règle. 
On n''affirme que certains faits sont équivalents mais la relation a aussi d''autres faits équivalents. 
Les règles qui affirment des relations d''équivalence on une conclusion **relation créée** pour garder la trace des relations créées.
On peut voir l''ensemble des relations avec le prédicat **relation:rep:**

e verifieCondition: ''point A
relation:rep: équivalent ?res''
e verifieCondition: ''relationCréée ?x1 ?x2 ?x3''.
[[[f presenter expertDisplayTutor:''e verifieCondition: ''''point A
relation:rep: équivalent ?res''''
''
]]] doItWithButton: copier l''exemple.

On voit que tous les angles équivalents se trouvent dans le même ensemble.(Dans cet exemple il n''y a qu''un sous ensemble puisqu''il n''y qu''un angle de base.

Remarque:

Pour vérifier une condition, il faut au moins une affirmation, c''est pour ça que l''affirmation vraie **point A**  est ajoutée au début de la condition à vérifier.s

**Angle saillant ou entrant**

Un angle entre l''angle nul et l''angle plat ( angle entre 0 et 180 degrés) est dit **angle saillant**.

Un angle plus grand que l''angle plat ( plus grand que 180 degrés)  est  dit **angle entrant**.

[[[ f := DrGeoFigure nouveau.
f échelle: 15.
f texte: ''Déplace le point B'' à: -15@20.
s := f point:  2@0.s nommer: ''S''.
a := f point: -7@0.a nommer: ''A''.
b:= f point: ( 0@ -9).b nommer: ''B''. 
b couleur: Color green.
dd1 := f demiDroiteOrigine: s passantPar:  a.
dd1 nommer: ''dd1''.
dd2 := f demiDroiteOrigine: s passantPar:  b.
dd2 nommer: ''dd2''.
c:= f pointSurLigne: dd1 à: 0.9601.c nommer: ''c''.
d:= f pointSurLigne: dd2 à: 0.9643.d nommer: ''D''.
p := f pointSurLigne: dd1 à: 0.9774.
dr := f demiDroiteOrigine: p  passantPar: b.
perp := f perpendiculaireA: dd1 passantPar: s.   
pd1 := f pointSurLigne: perp à: 0.9678.
pd2 := f pointSurLigne: perp à: 0.0290..
demi1 :=f 		 demiDroiteOrigine: p passantPar: b.
demiPerp1 :=f 		 demiDroiteOrigine: s passantPar: pd1.
demiPerp2 :=f 		 demiDroiteOrigine: s passantPar: pd2.
.saillant := f intersectionDe: demiPerp1 et: demi1.
saillant nommer:''angle saillant''.
saillant  couleur:Color blue.
b déplacerA:(- 4@ 2).
f actualiser.
entrant := f intersectionDe: demiPerp2 et: demi1.
entrant nommer:''angle entrant''.
entrant couleur: Color blue.
demiPerp1 cacher.
demiPerp2 cacher.
pd1 cacher.
pd2 cacher.
perp cacher.
dr cacher.
a1:=f arcCenter: s  from: a to: b.
a1 couleur: Color blue.



]]] doItWithButton: chager la figure.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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
(fig point: 0@0) croix.
(fig point: 1@0) rond.
(fig point: 2@0) carré .]]] withDrGeoActions

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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Styles_Texte
^(EruditeBookSection basicNew title: 'Texte'; document: ((EruditeDocument contents: '!!!!!!Texte
**couleurFond:** //uneCouleur//
⇒ modifie la couleur d''arrière plan d''un texte

[[[| fig t |
fig _ DrGeoFigure nouveau.
t _ fig texte: ''Hello''.
t couleurFond: Color green]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
section_Transformations
^(EruditeBookSection basicNew title: 'Transformations'; document: ((EruditeDocument contents: 'Avec les transformations géométriques construis des tranformés d''objets tels des point, segment, droite, demi-droite, vecteur, cercle, arc de cercle, polygone et lieu de point.

Déplie la section **▶ Transformations** pour les découvrir !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Transformations_Rotation;
        add: self section_Transformations_Homothétie;
        add: self section_Transformations_SymétrieCentrale;
        add: self section_Transformations_SymétrieAxiale;
        add: self section_Transformations_Translation;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_TransformationsGéométriques
^(EruditeBookSection basicNew title: 'Transformations géométriques'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:32'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_ValeursNumériques
^(EruditeBookSection basicNew title: 'Valeurs numériques'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 11/29/2025 00:01:31'!
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

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/16/2024 16:01:54'!
section_contrairecontrairerepvars
^(EruditeBookSection basicNew title: 'contraire:contraire:rep:vars:'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/2/2024 11:03:45'!
section_saufPremierrep
^(EruditeBookSection basicNew title: 'saufPremier:rep:'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'drgeo 10/2/2024 11:03:45'!
section_taillerep
^(EruditeBookSection basicNew title: 'taille:rep'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoFigure methodsFor: 'user interface'!
afficherAxes
	^ self axesOn! !

!DrGeoFigure methodsFor: 'user interface'!
afficherGrille
	^ self gridOn! !

!DrGeoFigure methodsFor: 'user interface'!
centrerVueEn: aPoint
	^ self centerTo: aPoint! !

!DrGeoFigure methodsFor: 'user interface' stamp: 'hlsf 12/21/2022 14:17:46'!
échelle: anInteger
	^ self scale: anInteger ! !

!DrGeoFigure methodsFor: 'user interface'!
pleinEcran
	^ self fullscreen ! !

!DrGeoFigure methodsFor: 'text'!
texte: aText
	^ self text: aText! !

!DrGeoFigure methodsFor: 'text' stamp: 'hlsf 12/21/2022 14:18:03'!
texte: aText à: aPosition
	^ self text: aText at: aPosition! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:18:13'!
arcCentre: wrpPt1 de: wrpPt2 à: wrpPt3
	^ self arcCenter: wrpPt1 from: wrpPt2 to: wrpPt3! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:18:37'!
arcDe: wrpPt1 à: wrpPt3 passantPar: wrpPt2
	^ self arc: wrpPt1 to: wrpPt2 to: wrpPt3! !

!DrGeoFigure methodsFor: 'curve'!
bissectriceDe: wrpAngle
	^ self angleBisector: wrpAngle! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:19:14'!
bissectriceSommet: wrpSummit côté1: wrpPt1 côté2: wrpPt2
	^ self angleBisectorSummit: wrpSummit side1: wrpPt1 side2: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve'!
cercleCentre: wrpCenter passantPar: wrpPt
	^ self circleCenter: wrpCenter to: wrpPt! !

!DrGeoFigure methodsFor: 'curve'!
cercleCentre: wrpCenter rayon: wrpValue
	^ self circleCenter: wrpCenter radius: wrpValue! !

!DrGeoFigure methodsFor: 'curve'!
cercleCentre: wrpCenter segment: wrpSegment
	^ self circleCenter: wrpCenter segment: wrpSegment! !

!DrGeoFigure methodsFor: 'curve'!
demiDroiteOrigine: wrpPt1 passantPar: wrpPt2
	^ self ray: wrpPt1 to: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve'!
droitePassantPar: wrpPt1 et: wrpPt2
	^ self line: wrpPt1 to: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve'!
lieuDe: wrpPt1 lorsqueBouge: wrpPt2
	^ self locusOf: wrpPt1 when: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:19:40'!
médiatriceDe: wrpSegment
	^ self perpendicularBisector: wrpSegment! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:20:00'!
médiatriceDe: wrpPt1 à: wrpPt2
	^ self perpendicularBisector: wrpPt1 to: wrpPt2! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:20:20'!
parallèleA: wrpDirection passantPar: wrpPtOrPoint
	^ self parallel: wrpDirection at: wrpPtOrPoint! !

!DrGeoFigure methodsFor: 'curve'!
perpendiculaireA: wrpDirection passantPar: wrpPtOrPoint
	^ self perpendicular: wrpDirection at: wrpPtOrPoint! !

!DrGeoFigure methodsFor: 'curve'!
polygone: collection
	^ self polygon: collection! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:21:16'!
polygoneRégulierCentre: wrpCenter sommet: wrpVertex côtés: wrpValue
	^ self regularPolygonCenter: wrpCenter vertex: wrpVertex sides: wrpValue! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:21:33'!
segmentDe: wrpPt1 à: wrpPt2
	^ self segment: wrpPt1 to: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve'!
vecteur: wrpPt
	^ self vector: wrpPt! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:22:07'!
vecteurOrigine: wrpPt1 extrémité: wrpPt2
	^ self vector: wrpPt1 to: wrpPt2 ! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:19:20'!
courbeDe: f de: x0 à: x1
	^ self plot: f from: x0 to: x1! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:18:47'!
décimal: value à: aPoint min: startValue max: endValue
	^ self float: value at: aPoint from: startValue to: endValue ! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:19:49'!
décimal: value à: aPoint min: startValue max: endValue nom: name
	^ self float: value at: aPoint from: startValue to: endValue name: name! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:20:31'!
décimal: value à: aPoint min: startValue max: endValue nom: name afficherValeur: isValueDisplay
	^ self float: value at: aPoint from: startValue to: endValue name: name showValue: isValueDisplay! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:21:23'!
entier: value à: aPoint min: startValue max: endValue
	^ self integer: value at: aPoint from: startValue to: endValue ! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:22:25'!
entier: value à: aPoint min: startValue max: endValue nom: name
	^ self integer: value at: aPoint from: startValue to: endValue name: name! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:23:22'!
entier: value à: aPoint min: startValue max: endValue nom: name afficherValeur: isValueDisplay
	^ self integer: value at: aPoint from: startValue to: endValue name: name showValue: isValueDisplay! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 3/13/2023 20:57:36'!
exporterVersImage: aFilename
	self exportToImage: aFilename! !

!DrGeoFigure methodsFor: 'helpers'!
faire: aBlock
	^ self do: aBlock! !

!DrGeoFigure methodsFor: 'equation' stamp: 'hlsf 12/21/2022 14:18:52'!
équationDe: wrpLineOrCircle
	^ self equationOf: wrpLineOrCircle! !

!DrGeoFigure methodsFor: 'initialize-release'!
supprimer
	self delete! !

!DrGeoFigure methodsFor: 'point'!
autreIntersectionDe: wrpCurve1 et: wrpCurve2
	^ self altIntersectionOf: wrpCurve1 and: wrpCurve2 ! !

!DrGeoFigure methodsFor: 'point'!
intersectionDe: wrpCurve1 et: wrpCurve2
	^ self intersectionOf: wrpCurve1 and: wrpCurve2 ! !

!DrGeoFigure methodsFor: 'point'!
milieuDe: wrpSegment
	^ self middleOf: wrpSegment ! !

!DrGeoFigure methodsFor: 'point'!
milieuDe: wrpPoint1 et: wrpPoint2
	^ self middleOf: wrpPoint1 and: wrpPoint2 ! !

!DrGeoFigure methodsFor: 'point' stamp: 'hlsf 12/21/2022 14:23:41'!
pointSurLigne: wrpCurve à: abscissa
	^ self pointOnLine: wrpCurve at: abscissa! !

!DrGeoFigure methodsFor: 'processing'!
actualiser
	^ self update! !

!DrGeoFigure methodsFor: 'value'!
abscisseDe:  wrpPointOrWrpVectorOrPoint
	^ self abscissaOf: wrpPointOrWrpVectorOrPoint ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 12/21/2022 15:06:06'!
angleGéométriqueSommet: wrpPt1 de: wrpPt2 à: wrpPt3
	^ self geometricAngle: wrpPt2  to: wrpPt1  to: wrpPt3 ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 12/21/2022 14:25:02'!
angleSommet: wrpPt1 de: wrpPt2 à: wrpPt3
	^ self angle: wrpPt2  to: wrpPt1  to: wrpPt3 ! !

!DrGeoFigure methodsFor: 'value'!
angleVecteur: wrpVecteur1 et: wrpVecteur2
	^ self angle: wrpVecteur1 to: wrpVecteur2 ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 12/21/2022 14:25:39'!
distanceDe: item1 à: item2
	^ self distance: item1 to: item2! !

!DrGeoFigure methodsFor: 'value'!
longueurDe: wrpItem
	^ self lengthOf: wrpItem ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 12/21/2022 14:25:51'!
ordonnéeDe: wrpItem
	^ self ordinateOf: wrpItem ! !

!DrGeoFigure methodsFor: 'value'!
penteDe: wrpLine
	^ self slopeOf: wrpLine! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 4/13/2024 11:09:26'!
valeur: aNumberOrBlock
	^ self value: aNumberOrBlock ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 4/13/2024 11:10:53'!
valeur: aNumberOrBlock parent: wrpValue
	^ self value: aNumberOrBlock parent: wrpValue! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 4/13/2024 11:10:17'!
valeur: aNumberOrBlock parents: wrpValueArray à: aPosition
	^ self value: aNumberOrBlock parents: wrpValueArray at: aPosition! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 12/21/2022 14:26:15'!
homothétieDe: wrpItem centre: wrpCenter facteur: wrpValue
	^ self scale: wrpItem center: wrpCenter factor: wrpValue! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 12/21/2022 14:26:34'!
rotationDe: wrpItem centre: wrpCenter angle: wrpValue
	^ self rotate: wrpItem center: wrpCenter angle: wrpValue! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 3/9/2023 15:16:04'!
rotationDe: wrpItem centre: wrpCenter angleDegrés: wrpValue
	^ self rotate: wrpItem center: wrpCenter angleDegrees: wrpValue! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 12/21/2022 14:26:47'!
symétriqueDe: wrpItem selonAxe: wrpLine
	^ self reflect: wrpItem axis: wrpLine! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 12/21/2022 14:27:01'!
symétriqueDe: wrpItem selonCentre: wrpCenter
	^ self symmetry: wrpItem center: wrpCenter ! !

!DrGeoFigure methodsFor: 'transformations'!
translationDe: wrpItem parVecteur: wrpVecteur
	^ self translate: wrpItem vector: wrpVecteur! !

!DrGeoFigure class methodsFor: 'instance creation'!
nouveau
	^ self new! !

!Object methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:31:23'!
afficher
	self print! !

!Boolean methodsFor: '*DrGeoFrench'!
contraire
	"négation booléenne"
	
	^self not.! !

!Boolean methodsFor: '*DrGeoFrench'!
et: UnBloc
	"et au lieu de and"

	^self and: UnBloc.! !

!Boolean methodsFor: '*DrGeoFrench'!
ou: UnBloc
	"ou au lieu de or"

	^self or: UnBloc.! !

!Boolean methodsFor: '*DrGeoFrench'!
siFaux: UnBloc
	"test négatif"

	^self ifFalse: UnBloc.! !

!Boolean methodsFor: '*DrGeoFrench'!
siFaux: leBlocDuFaux siVrai: leBlocDuVrai
	"test alternatif"

	^self ifFalse: leBlocDuFaux ifTrue: leBlocDuVrai.! !

!Boolean methodsFor: '*DrGeoFrench'!
siVrai: UnBloc
	"test positif"

	^self ifTrue: UnBloc.! !

!Boolean methodsFor: '*DrGeoFrench'!
siVrai: leBlocDuVrai siFaux: leBlocDuFaux
	"test alternatif"

	^self ifTrue: leBlocDuVrai ifFalse: leBlocDuFaux.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:29:20'!
afficherEnBase: UneBase

	^self printStringBase: UneBase.! !

!Number methodsFor: '*DrGeoFrench'!
arrondir
"répond l'arrondi à l'entier le plus proche"
	^self rounded! !

!Number methodsFor: '*DrGeoFrench'!
arrondirA: UnNombre
"répond l'arrondi à UnNombre près.
Par exemple 2 racine arrondirA:  0.01 répond 1.41"

	^self roundTo: UnNombre .! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:49:40'!
arrondirParDéfautA: UnNombre
"répond l'arrondi par défaut;
par exemple, 2 racine arrondirExcesA: 0.01 répond 1.41"
	
	^self roundDownTo: UnNombre! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:50:39'!
arrondirParExcèsA: UnNombre
"répond l'arrondi à l'excès;
par exemple, 2 racine arrondirExcesA: 0.01 répond 1.42"
	^self roundUpTo: UnNombre! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:09'!
auCarré

	^self squared.! !

!Number methodsFor: '*DrGeoFrench'!
auCube

	^self puissance: 3.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:48:38'!
à: UnNombre

	^self to: UnNombre.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:48:53'!
à: UnNombre faire: UnBloc
	"boucle à condition de sortie"

	^self to: UnNombre do: UnBloc.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:48:59'!
à: UnNombre par: UnPas
"répond un intervalle avec un pas"
	^self to: UnNombre by: UnPas.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:49:09'!
à: UnNombre par: UnPas faire: UnBloc

	^self to: UnNombre by: UnPas do: UnBloc.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:51:03'!
commeDécimal

	^self asFloat.! !

!Number methodsFor: '*DrGeoFrench'!
commeEntier

	^self asInteger.! !

!Number methodsFor: '*DrGeoFrench'!
commeNombre

	^self asNumber.! !

!Number methodsFor: '*DrGeoFrench'!
cosinus
	"cosinus en degrés"
	
	^self degreeCos.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:52:37'!
degrés

	^self radiansToDegrees.! !

!Number methodsFor: '*DrGeoFrench'!
enPourcents
	^ String streamContents: [ :str | 
			(self * 100) storeOn: str.
			str nextPutAll: ' %'].! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:53:03'!
estDécimal

	^(self isFloat).! !

!Number methodsFor: '*DrGeoFrench'!
estDivisiblePar: UnNombre

	^self isDivisibleBy: UnNombre.! !

!Number methodsFor: '*DrGeoFrench'!
estEntier

	^(self isInteger).! !

!Number methodsFor: '*DrGeoFrench'!
estInfini

	^self isInfinite.! !

!Number methodsFor: '*DrGeoFrench'!
estNombre

	^self isNumber.! !

!Number methodsFor: '*DrGeoFrench'!
estNul

	^self isZero.! !

!Number methodsFor: '*DrGeoFrench'!
estPasNombre

	^self isNaN.! !

!Number methodsFor: '*DrGeoFrench'!
heures

	^self hours.! !

!Number methodsFor: '*DrGeoFrench'!
impair
	
	^self odd.! !

!Number methodsFor: '*DrGeoFrench'!
inverse

	^self reciprocal.! !

!Number methodsFor: '*DrGeoFrench'!
jours

	^self days.! !

!Number methodsFor: '*DrGeoFrench'!
millisecondes

	^self milliSeconds.! !

!Number methodsFor: '*DrGeoFrench'!
moyenneAvec: unNombre
	
	^((self + unNombre)/2).! !

!Number methodsFor: '*DrGeoFrench'!
nanosecondes

	^self nanoSeconds.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:53:25'!
négatif
	
	^self negative.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:53:33'!
opposé

	^self negated.! !

!Number methodsFor: '*DrGeoFrench'!
pair
	
	^self even.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:53:48'!
partieDécimale
	^self fractionPart! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:54:01'!
partieEntière
	^self integerPart! !

!Number methodsFor: '*DrGeoFrench'!
positif
	
	^self positive.! !

!Number methodsFor: '*DrGeoFrench'!
pourcentsDe: UnNombre
	"répond un pourcentage.
	Par exemple 6 pourcentsDe: 200 répond 12"

	^self * UnNombre / 100.! !

!Number methodsFor: '*DrGeoFrench'!
procheDe: UnNombre

	^self closeTo: UnNombre.! !

!Number methodsFor: '*DrGeoFrench'!
puissance: UnNombre

	^self raisedTo: UnNombre.! !

!Number methodsFor: '*DrGeoFrench'!
racine

	^self sqrt.! !

!Number methodsFor: '*DrGeoFrench'!
racineCubique
	^self nthRoot: 3! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:54:15'!
racineNième: unEntier
	^self nthRoot: unEntier.! !

!Number methodsFor: '*DrGeoFrench'!
radians
	
	^self degreesToRadians.! !

!Number methodsFor: '*DrGeoFrench'!
reste: UnNombre
	^self rem: UnNombre! !

!Number methodsFor: '*DrGeoFrench'!
secondes

	^self seconds.! !

!Number methodsFor: '*DrGeoFrench'!
semaines

	^self weeks.! !

!Number methodsFor: '*DrGeoFrench'!
signe
	
	^self sign.! !

!Number methodsFor: '*DrGeoFrench'!
sinus
	"sinus en degrés"
	
	^self degreeSin.! !

!Number methodsFor: '*DrGeoFrench'!
strictementPositif

	^self strictlyPositive.! !

!Number methodsFor: '*DrGeoFrench'!
tangente
	"tangente en degrés"
	
	^(self sinus / (self cosinus)).! !

!Number methodsFor: '*DrGeoFrench'!
tronquer
	^self floor! !

!Number methodsFor: '*DrGeoFrench'!
tronquerA: UnNombre
"affiche le nombre tronqué à UnNombre près.
Par exemple, 2 racine tronquerA: 0.01 renvoie 1.41"
	^ self truncateTo: UnNombre! !

!Float methodsFor: '*DrGeoFrench'!
commeFraction

	^self asFraction.! !

!Float methodsFor: '*DrGeoFrench' stamp: 'hlsf 1/28/2024 17:18:32'!
commeFractionApprochée

	^self asApproximateFraction ! !

!Float methodsFor: '*DrGeoFrench'!
commeVraieFraction

	^self asTrueFraction.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:54:01'!
aLancienne
	"répond la fraction à l'ancienne, avec partie entière"

	| a b |
	a _ self partieEntière.
	b _ self partieDécimale.
	^(a asString),'+',(b asString).! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:54:01'!
aLegyptienne
	"répond la fraction comme somme de fractions égyptiennes
	soit de numérateurs 1;
	algorithme de Fibonacci-Sylvester"

	| liste b c chaine |
	liste _ #() commeCollectionOrdonnée.
	liste ajouter: self partieEntière.
	b _ self partieDécimale.
	[b numérateur > 1] tantQueVrai: [
		c _ (b inverse partieEntière + 1) inverse.
		b _ b-c.
		liste ajouter: c.
	].
	liste ajouter: b.
	chaine _ (liste commeTableau à: 1) asString.
	liste _ liste retirerTousLorsque: [ :n | n isInteger].
	liste _ liste commeTableau.
	liste faire: [ :elt | chaine _ chaine,' + ',(elt asString)].
	
	^chaine.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:32:14'!
commePari
	"répond la fraction comme probabilité"

	| c |
	c _ self numérateur asString.
	(self numérateur < 2) siVrai: [
		c _ c,' chance contre '.
		] siFaux:[
		c _ c,' chances contre '.
		].
	c _ c,(self dénominateur - self numérateur) asString.
	^c! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:32:14'!
commeProba
	"répond la fraction comme probabilité"

	| c |
	c _ self numérateur asString.
	(self numérateur < 2) siVrai: [
		c _ c,' chance sur '.
		] siFaux:[
		c _ c,' chances sur '.
		].
	c _ c,self dénominateur asString.
	^c! !

!Fraction methodsFor: '*DrGeoFrench'!
de: unNombre

	^self * unNombre.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:31:40'!
dénominateur

	^self denominator.! !

!Fraction methodsFor: '*DrGeoFrench'!
estUnePuissanceDe2

	^self isPowerOfTwo.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:32:14'!
numérateur

	^self numerator.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:30:42'!
réduite

	^self reduced.! !

!Integer methodsFor: '*DrGeoFrench'!
auHasard

	^self atRandom.! !

!Integer methodsFor: '*DrGeoFrench'!
commeFraction

	^self asFraction.! !

!Integer methodsFor: '*DrGeoFrench'!
diviseurs
"diviseurs du nombre placés dans une collection" 
	^ (Array streamContents: [:str |
		1 to: self sqrtFloor do: [ :i | 
			(self rem: i) = 0 ifTrue: [ str nextPut: i; nextPut: self // i ]]]) asSet sorted! !

!Integer methodsFor: '*DrGeoFrench'!
enChiffresRomains

	^self printStringRoman.! !

!Integer methodsFor: '*DrGeoFrench'!
estDivisiblePar: unEntier

	^(self \\ unEntier) =0.! !

!Integer methodsFor: '*DrGeoFrench'!
estPremier

	^self isPrime.! !

!Integer methodsFor: '*DrGeoFrench'!
estPremierAvec: unEntier

	^(self pgdc: unEntier) = 1.! !

!Integer methodsFor: '*DrGeoFrench'!
estProbablementPremier

	^self isProbablyPrime.! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:09'!
estUnCarré
	
	^(self auCarré estEntier).! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:38:39'!
facteursPremiers
	^ Integer primesUpTo: self! !

!Integer methodsFor: '*DrGeoFrench'!
factorielle

	^self factorial.! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:32:43'!
foisRépéter: unBloc

	^self timesRepeat: unBloc.! !

!Integer methodsFor: '*DrGeoFrench'!
multiples: n
"Answer my first n multiple"
	^ Array streamContents: [:str |
		1 to: n do: [ :i | str nextPut: i * self ]]! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:41:26'!
nombreDeChiffres

	^self numberOfDigitsInBase: 10! !

!Integer methodsFor: '*DrGeoFrench'!
nombreDeChiffresEnBase: uneBase

	^self numberOfDigitsInBase: uneBase.! !

!Integer methodsFor: '*DrGeoFrench'!
pgdc: unEntier

	^self gcd: unEntier.! !

!Integer methodsFor: '*DrGeoFrench'!
ppmc: unEntier

	^self lcm: unEntier.! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:33:59'!
précèdent
	"décrémente un entier"

	^self - 1.! !

!Integer methodsFor: '*DrGeoFrench'!
suivant
	"incrémente un entier"

	^self + 1.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
de: unArgument
	
	^self value: unArgument.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
de: unArgument de: unAutre
	
	^self value: unArgument value: unAutre.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
de: unArgument de: unAutre de: unTroisieme
	^self value: unArgument value: unAutre value: unTroisieme.! !

!BlockClosure methodsFor: '*DrGeoFrench' stamp: 'hlsf 1/3/2024 11:05:57'!
de: unArgument de: unAutre de: unTroisieme de: unQuatrieme
	^self value: unArgument value: unAutre value: unTroisieme value: unQuatrieme .! !

!BlockClosure methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:42:27'!
jusquàVrai: unBloc

	^self whileFalse: unBloc.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
tantQueFaux: unBloc

	^self whileFalse: unBloc.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
tantQueVrai: unBloc

	^self whileTrue: unBloc.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
tempsPourFaire
	
	^self timeToRun.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
valeur
	
	^self value.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
valeur: unArgument
	
	^self value: unArgument.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
valeur: unArgument valeur: unAutre
	
	^self value: unArgument value: unAutre.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
valeur: unArgument valeur: unAutre valeur: unTroisieme	
	^self value: unArgument value: unAutre value: unTroisieme.! !

!BlockClosure methodsFor: '*DrGeoFrench' stamp: 'hlsf 1/3/2024 11:06:08'!
valeur: unArgument valeur: unAutre valeur: unTroisieme	 valeur: unQuatrieme
	^self value: unArgument value: unAutre value: unTroisieme value: unQuatrieme .! !

!Collection methodsFor: '*DrGeoFrench'!
ajouter: unObjet

	^self add: unObjet.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:32:43'!
ajouter: unObjet fois: unEntier

	unEntier foisRépéter: [self ajouter: unObjet].! !

!Collection methodsFor: '*DrGeoFrench'!
ajouterSiAbsent: unObjet

	^self addIfNotPresent: unObjet.! !

!Collection methodsFor: '*DrGeoFrench'!
ajouterTout: uneCollection

	^self addAll: uneCollection.! !

!Collection methodsFor: '*DrGeoFrench'!
arrondir

	^self rounded.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:09'!
auCarré

	^self squared.! !

!Collection methodsFor: '*DrGeoFrench'!
auHasard

	^self atRandom.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:21'!
aucunNeVérifie: unBloc

	^self noneSatisfy: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
choisir: unBloc
	
	^self select: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
choisir: bloc puisFaire: unBloc
	
	^self select: bloc thenDo: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
collecter: unBloc
	
	^self collect: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
collecter: unBloc dans: uneCollection
	
	^self collect: unBloc into: uneCollection.! !

!Collection methodsFor: '*DrGeoFrench'!
collecter: unBloc puisChoisir: critere
	^self collect: unBloc thenSelect: critere.! !

!Collection methodsFor: '*DrGeoFrench'!
collecter: unBloc puisFaire: autreBloc
	
	^self collect: unBloc thenDo: autreBloc.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:37'!
commeCollectionOrdonnée

	^self asOrderedCollection.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:49'!
commeCollectionTriée

	^self asSortedCollection.! !

!Collection methodsFor: '*DrGeoFrench'!
commeDictionnaire

	^self asDictionary.! !

!Collection methodsFor: '*DrGeoFrench'!
commeEnsemble

	^self asSet.! !

!Collection methodsFor: '*DrGeoFrench'!
commeSac

	^self asBag.! !

!Collection methodsFor: '*DrGeoFrench'!
commeTableau

	^self asArray.! !

!Collection methodsFor: '*DrGeoFrench'!
compter: unBloc
	
	^self count: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
contient: unObjet
	
	^(self includes: unObjet).! !

!Collection methodsFor: '*DrGeoFrench'!
cosinus
	
	^self degreeCos.! !

!Collection methodsFor: '*DrGeoFrench'!
effectifs
	"construit une table d'effectifs"

	| table cles |
	table _ Dictionary new.
	cles _ self asSet.
	cles do: [ :n | table at: n put: (self count: [ :t | t=n])].
	^table.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:45:02'!
effectifsEnClasses: unEntier
	"construit une table pour histogramme"

	| table cles h |
	h _ self étendue / unEntier.
	table _ Dictionary new.
	cles _ self min to: (self max - 1.0e-6) by: h.
	cles do: [ :n | table at: n put: (self count: [ :t | (t>=n) and: [t<(n+h)]])].
	^table.! !

!Collection methodsFor: '*DrGeoFrench'!
estVide

	^self isEmpty.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:32:43'!
échantillonDeTaille: unEntier 

	"tirage au hasard sans remise"
	| copie ech t n |
	n _ unEntier min: (self taille).
	n _ n max: 0.
	copie _ self collecter: [ :x | x ].
	ech _ #() commeSac.
	n foisRépéter: [ 
		t _ copie auHasard.
		ech ajouter: t.
		copie retirer: t.
		 ].
	^ech.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:45:02'!
étendue

	^self range.! !

!Collection methodsFor: '*DrGeoFrench'!
faire: unBloc
	
	^self do: unBloc.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:45:12'!
fréquences
	"construit une table de fréquences"

	| table cles total |
	total _ self size.
	table _ Dictionary new.
	cles _ self asSet.
	cles do: [ :n | table at: n put: ((self count: [ :t | t=n])/total)].
	^table.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:45:22'!
fréquencesEnClasses: unEntier
	"construit une table pour histogramme"

	| table cles h total |
	total _ self size.
	h _ self étendue / unEntier.
	table _ Dictionary new.
	cles _ self min to: (self max - 0.000001) by: h.
	cles do: [ :n | table at: n put: ((self count: [ :t | (t>=n) and: [t<(n+h)]])/total)].
	^table.! !

!Collection methodsFor: '*DrGeoFrench'!
grouperPar: unBloc

	^self groupedBy: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
grouperPar: unBloc lorsque: condition

	^self groupedBy: unBloc having: condition.! !

!Collection methodsFor: '*DrGeoFrench'!
injecter: valeur dans: unBloc

	^self inject: valeur into: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
inter: uneCollection
	
	^self intersection: uneCollection.! !

!Collection methodsFor: '*DrGeoFrench'!
inverses

	^self reciprocal.! !

!Collection methodsFor: '*DrGeoFrench'!
moyenne

	^self average.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:46:24'!
opposés

	^self negated.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:49'!
premierQuartile

	^(self commeCollectionTriée Q1).! !

!Collection methodsFor: '*DrGeoFrench'!
puissances: unExposant

	^self raisedTo: unExposant.! !

!Collection methodsFor: '*DrGeoFrench'!
racines

	^self sqrt.! !

!Collection methodsFor: '*DrGeoFrench'!
regrouper: unBloc
	
	^self gather: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
rejeter: unBloc
	
	^self reject: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
rejeter: bloc puisFaire: unBloc
	
	^self reject: bloc thenDo: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
retirer: unBloc

	^self remove: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
retirerTousLorsque: unBloc

	^self removeAllSuchThat: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
retirerTout

	^self removeAll.! !

!Collection methodsFor: '*DrGeoFrench'!
retirerToutDans: uneCollection

	^self removeAll: uneCollection.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:47:22'!
réduire: unBloc

	^self reduce: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
sinus
	
	^self degreeSin.! !

!Collection methodsFor: '*DrGeoFrench'!
somme

	^self sum.! !

!Collection methodsFor: '*DrGeoFrench'!
taille

	^self size.! !

!Collection methodsFor: '*DrGeoFrench'!
total

	^self sum.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:47:01'!
tousVérifient: unBloc

	^self allSatisfy: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
trier
	
	^self sorted.! !

!Collection methodsFor: '*DrGeoFrench'!
trierSelon: unBloc
	
	^self sorted: unBloc.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:46:38'!
unVérifie: unBloc

	^self anySatisfy: unBloc.! !

!String methodsFor: '*DrGeoFrench'!
commeNombre
	^ self asNumber! !

!String methodsFor: '*DrGeoFrench'!
contient: unString
	^self includesSubString: unString! !

!String methodsFor: '*DrGeoFrench'!
correspond: unTexte
"
'toute*' correspond: 'Toute' -> true
'toute#' correspond: 'Toute' -> false
'toute#' correspond: 'Toutete' -> false
'toute*' correspond: 'Toutete' -> true
'toute#' correspond: 'Toutes' -> true
"	
	^self match: unTexte! !

!String methodsFor: '*DrGeoFrench'!
enMajuscule
	^self asUppercase! !

!String methodsFor: '*DrGeoFrench'!
enMinuscule
	^self asLowercase! !

!String methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:34:29'!
formater: uneCollection
	^ self format: uneCollection! !

!String methodsFor: '*DrGeoFrench'!
lettrine
	^self capitalized! !

!Array methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:48:38'!
à: unIndice
	
	^self at: unIndice.! !

!Array methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:36:03'!
à: unIndice mettre: unObjet
	
	^self at: unIndice put: unObjet.! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:36:20'!
afficher: unObjet
	^ self show: unObjet; newLine ! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:37:07'!
effacer
	^self clear.! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 9/28/2022 17:55:34'!
espace
	^self space! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:37:13'!
montrer: unObjet
	^self show: unObjet! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 9/28/2022 17:55:42'!
retourLigne
	^ self cr! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
bloquer
	self lock! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
cacher
	self hide! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
couleur: aColor
	self color: aColor! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
decacher
	self unhide! !

!DrGWrappedItem methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:55:58'!
débloquer
	self unlock! !

!DrGWrappedItem methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:10'!
déplacerA: aPoint
	self moveTo: aPoint! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
montrer
	self show! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
nommer: aString
	self name: aString! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
renommer: aString
	self rename: aString! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:55:47'!
épais
	self large! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench'!
fin
	self small! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench'!
plein
	self plain! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:55:40'!
pointillé
	self dotted! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench'!
tiret
	self dashed ! !

!DrGWrappedFinitCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:28'!
flècheDebut
	self backArrow! !

!DrGWrappedFinitCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:41'!
flècheFin
	self forwardArrow! !

!DrGWrappedFinitCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:33'!
flèches
	self bothArrows ! !

!DrGWrappedFilledCurve methodsFor: '*DrGeoFrench'!
remplir
	self filled! !

!DrGWrappedFilledCurve methodsFor: '*DrGeoFrench'!
transparent
	self translucent! !

!DrGWrappedFilledCurve methodsFor: '*DrGeoFrench'!
vider
	self unfilled! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAucun
	self noMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecCercle
	self circleMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecDisque
	self discMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecDoubleTrait
	self doubleMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecSimpleTrait
	self simpleMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecTripleTrait
	self tripleMark ! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:52'!
carré
	self square! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:58'!
coordonnées
	^ self coordinates! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench'!
croix
	self cross! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench'!
moyen
	self medium! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench'!
petit
	self small! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench'!
rond
	self round! !

!DrGWrappedText methodsFor: '*DrGeoFrench'!
couleurFond: aColor
	self backgroundColor: aColor! !

!DrGWrappedText methodsFor: '*DrGeoFrench'!
texte: aString
	self text: aString! !

!DrGWrappedValue methodsFor: '*DrGeoFrench'!
nommer: aString
	self name: aString! !

!DrGWrappedValue methodsFor: '*DrGeoFrench'!
valeur: aNumber
	self value: aNumber ! !
