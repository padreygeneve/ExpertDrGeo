
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

Ce lien télécharge aussi la version 24.06a de DrGeoCuis en fichier compressé pour linux:
https://github.com/Dynamic-Book/DrGeo/releases/download/24.06/DrGeo-gnulinux-24.06a-beta.zip

Site DrGeo:
https://github.com/Dynamic-Book/drgeo

**Installation du système expert dans CUIS DrGeo**

tèlècharger depuis ce site les fichiers ci-dessous, ouvrir  CUIS DrGeo, draguer ces fichiers et les lâcher dans CUIS DrGeo dans l'ordre ci-dessous.
- DrGeo.pck.st
- DrGeoFrench.pck.st
- Myexpert.pck.st

- Pour un premier chargement, il faut ajouter dans **Kernel/Object/** ***DrGeo** la méthode
  
  **isListe**
  
  **^false**

Remarque:
  - avec Windows si un fichier a déjà été chargé widows ajoute un nombre entre parenthèses pour distinguer le nouveau fichier, il faut enlever ce nombre et ses parenthèses du nom de fichier avant de le lâcher dans DrGeo sinon DrGeo ne le reconnais pas comme un fichier package.

---------------------------------------------------------------------------------------
**version originale 1909 pour DrGeo Pharo**

**Système expert pour DrGeo Pharo version 1909**

*Si vous n'navez pas déjà DrGeo Pharo,
le lien pour installer  DrGeo Pharo en fichier compressé :*

https://launchpad.net/drgeo/+download

**Installation du système expert**

Pour installer le système expert, télécharger depuis ce site et draguer dans DrGeo Pharo le fichier ci-dessous.

ExpertDrGeo1909.cs

- Pour un premier chargement, il faut ajouter dans **Kernel/Object/** ***DrGeo** la méthode
  
  **isListe**
  
  **^false**

Remarque:
  - avec windows si un fichier a déjà été chargé widows ajoute un nombre entre parenthèses pour distinguer le nouveau fichier, il faut enlever ce nombre et ses parenthèses du nom de fichier avant de le lâcher dans DrGeo sinon DrGeo ne le reconnais pas comme un fichier package.

**Pour la documentation**

télécharger depuis ce site le pdf pour Pharo :

testExpertNew3Drivebackup2.pdf
-----------------------------------------------------------------------------------------------------------------------
**Istoa **
Istoa regroupe plusieurs modèles de connaissances appelés DKM
En MATH on y retrouve DrGeo. 

Les fichiers :
DrGeoCore.pck.st  et MyExpert.pck.st  ajoutent à ce DrGeo le système Expert.

En plus on peut ajouter un nouveau DKM à la Physique qui traitent des circuits de résistances en série ou en parallèle.
c'est un DrGeo avec système expert et les règles Electricité dèjà chargées.
Les fichiers à charger en plus sont istoaApp.pck.st et DKM-Physics-ElectricalCircuits.pck.st

**Documentation**

Pour Istoa une documentation qui contient des scripts à copier/coller au sujet du système expert qui traite les cicuits de résistance.

Résistances électriques.pdf

********************************************************************************************************
********************************************************************************************************

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




