
**Introduction**  
Ce système expert contient des règles pour faire des deductions à partir de figures DrGeo.
Il s'utilise avec l'éditeur de script de DrGeo, avec des commandes de script.
Pour une utilisation conviviale, au menu de la figure un sous menu Expert est ajouté.

Différents jeux de règles permettent de l'utiliser pour d'autres applications que la géométrie.

Un jeu de règles permet de traiter des problèmes sur les circuits de résistances en électricité et
de traiter des circuits dessinés avec DrGeo.
Des exemples simples avec peu de règles.

  - Accord de participes passés.
  - Jeu du morpion.
  - Carré magique.

Un trutoriel permet d'apprendre à traiter son propre sujet en créant ses propres règles.

Dans le cadre d'un cours d'informatique il permet d'illustrer la voie logique de l'AI, opposée à la voie du neuro-mimétisme.

Il peut aussi être  considéré  comme une simplification de Prolog, de la même manière que Logo est une simplification de LISP.

-----------------------------------------------------------------------------------------

**Téléchargements de Cuis DrGeo**

*Si vous n'avez pas déjà DrGeo CUIS*

Ce lien télécharge la version 24.06a de DrGeoCuis en fichier compressé pour windows:
[https://github.com/Dynamic-Book/DrGeo/releases](https://github.com/Dynamic-Book/DrGeo/releases/download/24.06/DrGeo-windows-24.06a-beta.zip)

Ce lien télécharge la version 24.06a de DrGeoCuis en fichier compressé pour linux:
https://github.com/Dynamic-Book/DrGeo/releases/download/24.06/DrGeo-gnulinux-24.06a-beta.zip

Site DrGeo:
https://github.com/Dynamic-Book/drgeo

**Installation du système expert dans CUIS DrGeo**

tèlècharger depuis ce site les fichiers ci-dessous, ouvrir  CUIS DrGeo, draguer ces fichiers et les lâcher dans CUIS DrGeo dans l'ordre ci-dessous.
- DrGeo.pck.st
- DrGeoFrench.pck.st
- Myexpert.pck.st

Remarque:
  - avec Windows si un fichier a déjà été chargé widows ajoute un nombre entre parenthèses pour distinguer le nouveau fichier, il faut enlever ce nombre et ses parenthèses du nom de fichier avant de le lâcher dans DrGeo sinon DrGeo ne le reconnais pas comme un fichier package.

---------------------------------------------------------------------------------------
Ce système expert est une adaptation en cours de la version 1909 pour DrGeo Pharo,

**Système expert pour DrGeo Pharo version 1909**

*Si vous n'navez pas déjà DrGeo Pharo,
le lien pour installer  DrGeo Pharo en fichier compressé :*

https://launchpad.net/drgeo/+download

**Installation du système expert**

Pour installer le système expert, télécharger depuis ce site et draguer dans DrGeo Pharo le fichier ci-dessous.

ExpertDrGeo1909.cs

Remarque:
  - avec windows si un fichier a déjà été chargé widows ajoute un nombre entre parenthèses pour distinguer le nouveau fichier, il faut enlever ce nombre et ses parenthèses du nom de fichier avant de le lâcher dans DrGeo sinon DrGeo ne le reconnais pas comme un fichier package.

**Pour la documentation**

télécharger depuis ce site le pdf :

testExpertNew3Drivebackup2.pdf

Pour obtenir une figure dans DrGeo Pharo dans le pdf, copier le script de la figure dans le pdf, puis, dans DrGeo Pharo, coller dans un espace de travail.

----------------------------------------------------------------------------------------

**Istoa**

Dans Istoa, on peut programmer par script une figure dans un espace de travail.

Pour ouvrir un miniDrgeo:

**DrGeoFigure open**

en suite le script.

**Installation du système expert**

Téléchager le fichier Myexpertistoa.pck.st ,le draquer et le lâcher dans istoa.

Ajouter dans la classe **objet**, catégorie **test** la méthode:

isList

^false.

** Exemple de script**

fig := DrGeoFigure open.

a := fig point: 2@5. a nommer:'A'.

o := fig point: 0@0 .

o nommer:'O1'.

seg:=fig segmentDe: o à: a.

seg nommer:'O1A'.

cer := fig cercleCentre: o passantPar:  a.

cer nom: 'cercle'.

est := fig pointSurLigne: cer   à: 0.0.

est nom: 'Est'.

nord := fig pointSurLigne: cer   à: 0.25.

nord nom: 'Nord'.

ouest := fig pointSurLigne: cer   à: 0.5.$

ouest nom: 'Ouest'.

sud := fig pointSurLigne: cer   à: 0.75.

sud nom: 'Sud'.

exp := Expert nouveau.

exp drgeo: fig.

exp chargeRegles:'EuclideMinimum'.

exp initFaits.

exp lisFigureDrgeo.

exp deduis.

"exp modèlesQuestions."

exp vérifieCondition: 'rayon ?x ?y'.

"exp modèlesQuestions."

On peut enlever les " à modèlesQuestions pour voir les modàles de questions à utilise dans **vérifieCondition: **

**Remarque:**

Pour nommer un objet la  méthode est **nom:** au lieu de "*nommer:
Pour rester compatible on peut définir la méthode :

nommer: aString

	self nom: aString

dans la classe DrGeoItem 

DrGeoCore >>Model-Smalltalk >>  DrGeoItem 

fig := DrGeoFigure open.
a := fig point: 2@5. a nommer:'A'.
o := fig point: 0@0 .
o nommer:'O1'.
seg:=fig segmentDe: o à: a.
seg nommer:'O1A'.
cer := fig cercleCentre: o passantPar:  a.	
cer nommer: 'cercle'.
est := fig pointSurLigne: cer   à: 0.0.
est nommer: 'Est'.
nord := fig pointSurLigne: cer   à: 0.25.
nord nommer: 'Nord'.
ouest := fig pointSurLigne: cer   à: 0.5.
ouest nommer: 'Ouest'.
sud := fig pointSurLigne: cer   à: 0.75.
sud nommer: 'Sud'.
exp := Expert nouveau.
exp drgeo: fig.
exp chargeRegles:'EuclideMinimum'.
exp initFaits.
exp lisFigureDrgeo.
exp deduis.
"exp modèlesQuestions."
exp vérifieCondition: 'rayon ?x ?y'.





**Abstract**

 This expert system contains rules for making deductions from DrGeo figures. It is used with DrGeo’s script editor; it adds an Expert submenu to the figure’s menu for user-friendly use, but it can also be used with scripting commands. Different rule sets allow it to be used for applications beyond geometry; one rule set can handle problems on electrical resistance circuits and to process circuits drawn with DrGeo.
It is possible to work on one’s own topic by creating one’s own rules. In the context of an IT course, it helps illustrate the logical path of AI, as opposed to the path of neuromimetism. It can also be considered a simplification of Prolog, in the same way that Logo is a simplification of LISP.

----------------------------------------------------------------------------------------
**Installing the Expert system for CUIS DrGeo**

You need to download in this order from this site the files:
- DrGeo.pck.st
- DrGeoFrench.pck.st
- Myexpert.pck.st
- Be sure that filename ends with .pck.st and just drop the files into DrGeo.

!!! Experimental version: the package works for: The tutorial, interactive use, the first chapters of Geometry and Expert System, not all predicates are verified !!!

******************************************************************************************************************************




