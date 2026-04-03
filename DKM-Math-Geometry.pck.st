'From Cuis7.7 [latest update: #7823] on 3 April 2026 at 9:22:00 pm'!
'Description '!
!provides: 'DKM-Math-Geometry' 1 11!
!requires: 'DrGeoCore' 1 18 nil!
!requires: 'DKM-Core' 1 6 nil!
!requires: 'DrGeoFrench' 1 17 nil!
SystemOrganization addCategory: #'DKM-Math-Geometry'!


!classDefinition: #InteractiveGeometry category: #'DKM-Math-Geometry'!
DKMPresenter subclass: #InteractiveGeometry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Math-Geometry'!
!classDefinition: 'InteractiveGeometry class' category: #'DKM-Math-Geometry'!
InteractiveGeometry class
	instanceVariableNames: ''!

!classDefinition: #GeometrieInteractive category: #'DKM-Math-Geometry'!
InteractiveGeometry subclass: #GeometrieInteractive
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Math-Geometry'!
!classDefinition: 'GeometrieInteractive class' category: #'DKM-Math-Geometry'!
GeometrieInteractive class
	instanceVariableNames: ''!


!InteractiveGeometry methodsFor: 'DSL' stamp: 'hlsf 11/Jan/2026 19:47:02'!
readMe
"
Browse the class DrGeoSketch (Ctrl-B) for the complet protocol.

"! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'pad 3/Apr/2026 21:11:03'!
codeSample
	^'| sketch triangle ourRandom m n p exp |
sketch := DrGeoSketch new.
triangle := [:p1 :p2 :p3 |
	sketch segment: p1 to: p2.
	sketch segment: p2 to: p3.
	sketch segment: p3 to: p1].

ourRandom := [6 - 11 atRandom].

m := sketch point: ourRandom value @ 0.
n := sketch point: 5 @ 0.
p := sketch point:  ourRandom value @ 3.
triangle value: m value: n value: p.
exp := sketch expert.
exp loadRules: ''EuclideMinimum:''.
sketch view'! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 11/Jan/2026 19:28:29'!
description
	^'Describe a geometric sketch with dedicated instructions. The result is a geometric sketch you can interactively manipulate.' translated! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 17/Jan/2026 23:09:47'!
svgIcon
	^ '<svg width="75" height="75" version="1.1" xmlns="http://www.w3.org/2000/svg"><!!-- GPL Copyright 2010 2026 Hilaire Fernandes--><rect x="1.7783" y="1.6735" width="71.772" height="71.99" rx="7.5" ry="7.5" fill="#aaa" opacity=".96" stroke="#000" stroke-linecap="square" stroke-linejoin="round" stroke-width="3"/><g fill-opacity=".75" fill-rule="evenodd" stroke-linejoin="round"><path d="m29.785 12.675 26.734 40.359-39.146-0.28027 12.412-40.078z" fill="#fff" stroke="#000" stroke-width="3"/><path d="m36.333 5.0316v57.093 6.2641" fill="#0121fd" stroke="#333" stroke-width="2.2075"/><path d="m5.961 26.742 61.64 21.176" fill="#e6e6e6" stroke="#333" stroke-width="2.2075"/></g><path d="m64.499 19.444-56.457 35.549" fill="none" stroke="#333" stroke-linejoin="round" stroke-width="2.2075"/><ellipse transform="matrix(1.1192 0 0 1.1843 31.646 -7.3558)" cx="4.626" cy="37.303" rx="23.13" ry="22.146" fill="none" stroke="#808080" stroke-linecap="square" stroke-linejoin="round" stroke-width="1.7372"/></svg>'! !

!InteractiveGeometry class methodsFor: 'DKM' stamp: 'hlsf 11/Jan/2026 19:28:37'!
title
	^ 'Interactive geometry' translated! !

!InteractiveGeometry class methodsFor: 'user interface' stamp: 'hlsf 12/Jan/2026 20:53:52'!
presenterClass
	^ DrGeoSketch ! !

!InteractiveGeometry class methodsFor: 'AI' stamp: 'hlsf 29/Jan/2026 23:41:11'!
codeSampleForAI
	^ '| mySketch point anotherPoint mobile dependent segment line circle arc ray locus value angle polygon ruler vector |
"## Creating a new sketch instance"
"By default grid and axes are off"
mySketch := DrGeoSketch new.
"## Manipulating sketch"
mySketch centerTo: 15@20.
"scale: integer
Change the scale of the sketch
-integer: the number of pixels used to represent one unit.
The larger this number, the larger the sketch."
mySketch scale: 15.
mySketch axesOn;
	gridOn.
"## Point and straight line"	
point := mySketch point: 5 @ (1/3).
"The default shape of a point is round"
point cross; round; square.
point color: Color blue; name: ''A''.
segment := mySketch segment: point to: 15@-5.
segment large; color: Color red; name: ''AB''.
"Different way to mark a segment in its middle, only one is visible at a time"
segment circleMark; discMark; simpleMark ;doubleMark ; tripleMark .
mySketch middleOf: segment .
line := mySketch line: -4@1 to: 8@-2.
line dashed; small; color: Color orange; name: ''Δ''.
mySketch intersectionOf: line and: segment.
ray := mySketch ray: 0@0 to: point.
ray dotted.
mySketch parallel: line at: point.
mySketch perpendicular: ray at: point.
mySketch perpendicularBisector: segment.
line := mySketch perpendicularBisector: point to: 0@0.
mySketch angleBisectorSummit: 0@0 side1: 8@-1 side2: point.
"## Curved line"
"arc: start to: aPoint to: end
Arc of circle defined by three points
-start: starting point of the arc
-aPoint: a point the arc is passing through
-end: ending point of the arc"
mySketch arc: -8.5@2 to: point to: 12@-4.
"arcCenter: center from: start to: end
Oriented arc of circle (anti-clockwised) defined by its center and two points
-center: a point, center of the circle
-start: starting point of the arc
-end: ending point of the arc"
arc := mySketch arcCenter: 0@0 from: 0@5 to: 12@-2.
arc color: Color magenta.
circle := mySketch circleCenter: 0@0 radius: 10.
circle filled; translucent.
mySketch intersectionOf: circle and: line.
mySketch altIntersectionOf: circle and: line.
mySketch circleCenter: point segment: segment.
mySketch circleCenter: 0@0 to: point.
"## Point and locus"
"pointOnLine: line at: abscissa 
Point mobile on a line
-line: straight or curved line (see DSL line, DSL line curved)
-abscissa: a number in the interval [0 ; 1]"
mobile := mySketch pointOnLine: circle at: 0.5.
mobile name: ''move me!!''; round; large.
dependent := mySketch middleOf: 10@5 and: mobile.
dependent cross; small; color: Color black.
"locusOf: dependent when: mobile
Locus of a point given another point
-mobile: a point mobile on a line (straight or curved)
-dependent: a point dependent by construction on the mobile point"
locus := mySketch locusOf: dependent when: mobile.
"## Plotting a function"
"plot: f from: x0 to: x1
Plot the curve of a one argument function in the x interval [x0 ; x1]
-f: block of code to compute the function. ex: [:x | x + (10 * x) cos]
-x0: minimun abscissa to plot the function
-x1: maximum abscissa"
locus := mySketch plot: [:x | x raisedToInteger: 3] from: -10 to: 10.
locus color: Color blue; name: ''Cf''.
"## Point advanced"
"point: block parent: drgeoItem
Point defined by a block of code
-block: a block of code with a MathItem argument. 
   The block returns a Smalltalk point
-drgeoItem: the Item whose MathItem is passed as argument to the block.
   See DrGMathItem class hierarchy"
anotherPoint := mySketch point: [:aSegment | (aSegment extremity1 * 2 + aSegment extremity2) / 3] parent: segment.
anotherPoint large; color: Color purple; name: ''Barycentric point''.
anotherPoint := (mySketch 
	point: [:aSegment :aPoint | ( (aSegment extremity1 + aSegment extremity2) / 2  + aPoint point) / 2] 
	parents: {segment . point }) color: Color blue.
anotherPoint large; color: Color cyan; name: ''point computed from two other objects''.

"## Value"
mySketch abscissaOf: point.
mySketch ordinateOf: point.
"lengthOf: finitCurve
Length of a curve
-finitCurve: a segment, circle, arc, polygon or vector"
mySketch lengthOf: circle.
mySketch slopeOf: line.
mySketch distance: line to: point.
value := mySketch value: Float pi.
value name: ''π''.
mySketch value: Float pi at: 5@5.
value := mySketch value: [10 atRandom].
value color: Color red; name: ''random number''.
value := mySketch value: [:aCircle | aCircle radius] parent: circle.
value name: ''radius''.
"Distance from a point to a circle"
value := mySketch value: [:aCircle :aPoint | ((aCircle center dist: aPoint point) - aCircle radius) abs]
	 parents: {circle . point } 
	at: 10@10.
value color: Color purple darker; name: ''distance to circle''.

"## Polygon"
polygon := mySketch polygon: {0@0. point. 4@-5/3}.
polygon filled; translucent; color: Color yellow.
value := mySketch value: [(3 to: 10) atRandom].
polygon := mySketch regularPolygonCenter: 0@0 vertex: point sides: value.
polygon large; color: Color red.

"## Angle"
"angle: vertex to: point1 to: point2
Oriented angle in [0 ; 360[ defined by three points
-vertex: a point, vertex of the angle
-point1: a point in one side of the angle
-point2: a point  in the other side of the angle"
angle := mySketch angle: 0@0 to: point to: 0@5.
angle color: Color red; name: ''AOB''.
"geometricAngle: summit to: point1 to: point2
Geometric angle in [0 ; 180] defined by three points
-vertex: a point, vertex of the angle
-point1: a point in one side of the angle
-point2: a point in the other side of the angle"
mySketch geometricAngle: 0@0 to: 1@0 to: 0@-1. 
"angle: vector1 to: vector2
Oriented angle defined by two vectors
-vector1: a point or DrGeo vector
-vector2: a point or DrGeo vector"
mySketch angle: 1@0 to: 0@1. "90 degrees"

"## Geometric transformation"
mySketch reflect: polygon axis: line.
mySketch symmetry: polygon center: 0@0.
value := mySketch value: [(0 to: Float halfPi by: Float pi / 20) atRandom].
mySketch rotate: polygon center: point angle: value.
mySketch rotate: polygon center: 5@5 angle: angle.
ruler := mySketch integer: 10 at: 0@10 from: 1 to: 60 name:''angle'' showValue: true.
mySketch point: [ruler value @ 10].
mySketch value: [ruler value degreesToRadians].
mySketch rotate: polygon center: 0@0 angleDegrees: ruler.
ruler := mySketch float: 1.1 at: 0@15 from: -3 to: 3 name: ''factor'' showValue: true.
polygon := mySketch scale: polygon center: 0@0 factor: ruler.
vector := mySketch vector: 0.5@0.2.
mySketch translate: polygon vector: vector.
mySketch translate: polygon vector: -0.5@-0.2.
"## Free text"
mySketch text: ''This sketch illustrates the Inteactive geometry DSL API''.
mySketch view. '! !

!InteractiveGeometry class methodsFor: 'AI' stamp: 'hlsf 12/Jan/2026 20:54:03'!
dslCategory
	^ 'DSL point' ! !

!GeometrieInteractive class methodsFor: 'DKM' stamp: 'pad 3/Apr/2026 20:48:44'!
codeSample
	^'| figure triangle auHasard m n p  exp |
figure := DrGeoFigure new.
triangle := [:p1 :p2 :p3 |
	figure segmentDe: p1 à: p2.
	figure segmentDe: p2 à: p3.
	figure segmentDe: p3 à: p1].

auHasard := [6 - 11 auHasard ].

m := figure point: auHasard valeur @ 0.
n := figure point: 5 @ 0.
p := figure point:  auHasard valeur @ 3.
triangle valeur: m valeur: n valeur: p.
exp := figure expert.
exp chargeRegles: ''EuclideMinimum:''.
figure vue'! !

!GeometrieInteractive class methodsFor: 'DKM' stamp: 'hlsf 29/Jan/2026 10:04:01'!
description
	^'Décrire une figure géométrique avec des instructions. La figure géométrique résultante peut être manipulée interactivement.'! !

!GeometrieInteractive class methodsFor: 'DKM' stamp: 'hlsf 29/Jan/2026 10:03:14'!
title
	^ 'Géométre interactive'! !

!GeometrieInteractive class methodsFor: 'AI' stamp: 'hlsf 29/Jan/2026 23:42:35'!
codeSampleForAI
	^ '| figure point autrePoint mobile dependent segment droite cercle arc demiDroite lieu valeur angle polygone réglette vecteur |

"## Créer une nouvelle figure"
"Par défaut la grilles et les axes ne sont pas affichés"
figure := DrGeoFigure nouveau.

"## Manipuler la figure"
figure centrerVue: 15@20.
"échelle: entier
Changer l''échelle de la figure
-entier : nombre de pixels utilisés pour représenter une unité.
Plus le nombre est large, plus la figure est grossie."
figure échelle: 15.
figure axesMontrer;
       axesCacher;
       grilleMontrer;
       grilleCacher.

"## Point et ligne droite"
point := figure point: 5 @ (1/3).

"L''aspect par défaut d''un point est rond"
point croix; rond; carré.
point couleur: Couleur bleu; nom: ''''A''''.
segment := figure segmentDe: point à: 15@-5.
segment épais; couleur: Couleur rouge; nom: ''''AB''''.

"Différentes façons de marquer un segment en son milieu, une seule marque visible à la fois"
segment marqueCercle; marqueDisque; marqueSimpleTrait; marqueDoubleTrait; marqueTripleTrait.
figure milieuDe: segment .
droite := figure droitePassantPar: -4@1 et: 8@-2.
droite pointillé; fin; couleur: Couleur orange; nom: ''''Δ''''.
figure intersectionDe: droite et: segment.
demiDroite := figure demiDroiteOrigine: 0@0 passantPar: point.
demiDroite tiret.
figure parallèleA: droite passantPar: point.
figure perpendiculaireA: demiDroite passantPar: point.
figure médiatriceDe: segment.
droite := figure médiatriceDe: point à: 0@0.
figure bissectriceSommet: 0@0 côté1: 8@-1 côté2: point.

"## Ligne courbe"
"arcDe: début  à: fin passantPar: unPoint
Arc de cercle défini par trois points
-début : point de début de l''arc
-fin : point de fin de l''arc
-unPoint : un point par lequel passe l''arc"
figure arcDe: -8.5@2 à: point passantPar: 12@-4.

"arcCentre: centre de: début à: fin
Arc de cercle orienté (sens anti-horaire) défini par son centre et deux points
-centre : un point, centre du cercle
-début : point de début de l''arc
-fin : point de fin de l''arc"
arc := figure arcCentre: 0@0 de: 0@5 à: 12@-2.
arc couleur: Couleur magenta.
cercle := figure cercleCentre: 0@0 rayon: 10.
cercle rempli; translucide.
figure intersectionDe: cercle et: droite.
figure autreIntersectionDe: cercle et: droite.
figure cercleCentre: point segment: segment.
figure circleCentre: 0@0 passantPar: point.

"## Point et lieu de point"
"pointSurLigne: ligne à: abscisse
Point mobile sur une ligne
-ligne : une ligne droite ou courbe (see DSL ligne/ligne courbe)
-abscisse : un nombre de l''intervalle [0 ; 1]"
mobile := figure pointSurLigne: cercle à: 0.5.
mobile nom: ''''bouge moi !!''''; rond; large.
dépendent := figure milieuDe: 10@5 et: mobile.
dépendent croix; petit; couleur: Couleur noir.

"lieuDe: dépendant lorsqueBouge: mobile
Lieu d''un point selon un autre point
-mobile: un point mobile sur une ligne (droite ou courbe)
-dépendant: un point dépendant par construction du point mobile"
lieu := figure lieuDe: dépendent lorsqueBouge: mobile.

"## Affichage de la courbe d''une fonction"
"courbeDe: f de: x0 à: x1
Affiche la courbe d''une fonction à un argument dans l''intervalle [x0 ; x1]
-f : bloc de code pour décrire la fonction. ex: [:x | x + (10 * x) cos]
-x0 : abscisse minimun pour afficher la fonction
-x1 : abscisse maximum"
lieu := figure courbeDe: [:x | x raisedToInteger: 3] de: -10 à: 10.
lieu couleur: Couleur bleu; nom: ''''Cf''''.

"## Point avancé"
"point: block parent: drgeoItem
Point defined by a block of code
-block: a block of code with a MathItem argument. 
   The block returns a Smalltalk point
-drgeoItem: the Item whose MathItem is passed as argument to the block.
   See DrGMathItem class hierarchy"
autrePoint := figure point: [:aSegment | (aSegment extremity1 * 2 + aSegment extremity2) / 3] parent: segment.
autrePoint large; couleur: Couleur pourpre; nom: ''''Point barycentrique''''.
autrePoint := (figure 
	point: [:aSegment :aPoint | ( (aSegment extremity1 + aSegment extremity2) / 2  + aPoint point) / 2] 
	parents: {segment . point }) couleur: Couleur bleu.
autrePoint large; couleur: Couleur cyan; nom: ''''position du point calculée à partir de deux autres objets''''.

"## Valeur"
figure abscisseDe: point.
figure ordonnéeDe: point.

"longueurDe: ligneFinie
Longueur d''une ligne
-ligneFinie : un segment, cercle, arc de cercle, polygone ou vecteur"
figure longueurDe: cercle.

figure penteDe: droite.
figure distance: droite à: point.
valeur := figure valeur: Float pi.
valeur nom: ''''π''''.
figure valeur: Float pi à: 5@5.
valeur := figure valeur: [10 atRandom].
valeur couleur: Couleur rouge; nom: ''''nombre au hasard.
valeur := figure valeur: [:unCercle | unCercle radius] parent: cercle.
valeur nom: ''''rayon''''.
"Distance from a point to a circle"
valeur := figure valeur: [:unCercle :aPoint | ((unCercle center dist: aPoint point) - unCercle radius) abs]
	 parents: {cercle . point } 
	at: 10@10.
valeur couleur: Couleur pourpre foncer; nom: ''''distance à un cercle''''.

"## Polygone"
polygone := figure polygone: {0@0. point. 4@-5/3}.
polygone rempli; translucide; couleur: Couleur jaune.
valeur := figure valeur: [(3 to: 10) atRandom].
polygone := figure polygoneRégulierCentre: 0@0 sommet: point côtés: valeur.
polygone large; couleur: Couleur rouge.

"## Angle"
"angleSommet: sommet de: point1 à: point2
Angle orienté dans [0 ; 360[ defini par trois points
-sommet: un point, sommet de l''angle
-point1: un point sur un côté de l''angle
-point2: un point sur l''autre côté de l''angle"
angle := figure angleSommet: 0@0 de: point à: 0@5.
angle couleur: Couleur rouge; nom: ''''AOB''''.

"angleGéométriqueSommet: sommet de: point1 à: point2
Angle géométrique dans [0 ; 180] défini par trois points
-sommet: un point, sommet de l''angle
-point1: un point sur un côté de l''angle
-point2: un point sur l''autre côté de l''angle"
figure angleGéométriqueSommet: 0@0 de: 1@0 à: 0@-1.

"angleVecteur: vecteur1 et: vecteur2
Angle orienté défini par deux vecteurs
-vecteur1: un point ou vecteur DrGeo
-vecteur2: un point ou vecteur DrGeo"
figure angleVecteur: 1@0 et: 0@1. "90 degrés"

"## Transformation géométrique"
figure symétriqueDe: polygone selonAxe: droite.
figure symétriqueDe: polygone selonCentre: 0@0.
valeur := figure valeur: [(0 to: Float halfPi by: Float pi / 20) atRandom].
figure rotationDe: polygone centre: point angle: valeur.
figure rotationDe: polygone centre: 5@5 angle: angle.
réglette := figure entier: 10 à: 0@10 min: 1 max: 60 nom:''''angle'''' afficherValeur: true.
figure point: [réglette value @ 10].
figure valeur: [réglette value degreesToRadians].
figure rotationDe: polygone centre: 0@0 angleDegrés: réglette.
réglette := figure décimal: 1.1 à: 0@15 min: -3 max: 3 nom: ''''factor'''' afficherValeur: true.
polygone := figure homothétieDe: polygone centre: 0@0 facteur: réglette.
vecteur := figure vecteur: 0.5@0.2.
figure translationDe: polygone parVecteur: vecteur.
figure translationDe: polygone parVecteur: -0.5@-0.2.
"## Texte libre"
figure texte: ''''Cette figure montre API DSL de géométrie interactive.
figure vue.'! !

!GeometrieInteractive class methodsFor: 'AI' stamp: 'hlsf 29/Jan/2026 22:44:24'!
promptForAI
	^ self promptTemplateFr format: (Array with: self title with: self description with: self codeSampleForAI)! !

!GeometrieInteractive class methodsFor: 'user interface' stamp: 'hlsf 29/Jan/2026 10:04:55'!
presenterClass
	^ DrGeoFigure ! !
