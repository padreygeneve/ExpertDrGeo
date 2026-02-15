---------------------------------------------------------------------------------------
 **fichier  de présentation du système expert:**

  en .pdf avec geoEtexpert.pdf
  ( aussi en raw sous le nom presentation.)


-----------------------------------------------------------------------------------------

**Téléchargements de Cuis DrGeo**

La version 24.06a de DrGeoCuis en fichier compressé pour windows ou mlinuse trouve à l'adresse: 
https://github.com/Dynamic-Book/DrGeo/releases

**Installation du système expert dana CUIS DrGeo**

tèlècharger depuis ce site les fichiers, ouvrir  CUIS DrGeo et laisser draguer ces fichiers et les lâcher dans CUIS DrGeo dans l'ordre ci-dessous.
- DrGeo.pck.st
- DrGeoFrench.pck.st
- Myexpert.pck.st

---------------------------------------------------------------------------------------
Le système expert est une adaptation ne cours de la version 1909 de DrGeo Pharo,

**Système expert pour DrGeo Pharo version 1909**
le lien pour installer  DrGeo Pharo en fichier compressé :
https://launchpad.net/drgeo/+download


**Installation du système expert**

Pour installer le système expert,télécharger et laisser tomber dans DrGeo Pharo le fichier ci-dessous depuis ce site.

ExpertDrGeo1909.cs

----------------------------------------------------------------------------------------

Additions in the Erudite section: Expert System
You need to load in this order
- DrGeo.pck.st
- DrGeoFrench.pck.st
- Myexpert.pck.st
- Be sure that filename ends with .pck.st


Install these packages either by:
- Dragging these files into DrGeo
- Or placing them in the DrGeo/NewPackage folder and using Open a file / Install package to install them.

new update 26 07 202

This expert system is an extension of DrGeo. It contains rules to make deductions from DrGeo figures. It is used with the DrGeo script editor, adding a submenu "Expert" to the figure menu for a user-friendly experience, but can also be used with script commands. Different sets of rules allow it to be used for applications other than geometry; one set of rules allows it to handle problems on resistance circuits in e

lectricity and to handle circuits drawn with DrGeo.

It is possible to pas process any subject by creating your own rules. In the context of a computer science course, it helps illustrate the logical pathway of AI, as opposed to the neuro-mimetic approach. It can also be considered a simplification of Prolog, in the same way that Logo is a simplification of LISP.

!!! Experimental version: the package works for: The tutorial, interactive use, the first chapters of Geometry and Expert System, not all predicates are verified !!!

********************************************************************************************************************************
Nouvelle mise à jour  1.10.2025


Ajouts dans Erudite  section: Système Expert.

ll faut charger dans cet ordre:
- DrGeo.pck.st
- DrGeoFrench.pck.st
- Myexpert.pck.st

- avec Wnidows si un fichier a déjà été chargé widows ajoute un nombre entre parenthèses pour distinguer le nouveau fichier, il faut enlever ce nombre et ses parenthèses du nom de fichier avant de le lâcher dans DrGeo sinon DrGeo ne le reconnais pas comme un fichier package.

Intaller ces Packages
soit en lâchant ces fichiers dans DrGeo 
soit en les mettant dans le dossier DrGeo/NewPackage et en utilisant /ouvrir un fichier/ installe package  pour les installer.

Dernière mise à jour 26 07 2025 

Ce site permet d'ajouter un système expert au programme DrGeo ce qui permet d'obtenir 
des déductons à partir d'une figure.

Vous pouvez télécharger CUIS DrGeo-windows-24.06a-beta  à: https://github.com/Dynamic-Book/drgeo

  
Ce système expert contient des règles pour faire des deductions à partir de figures DrGeo.
Il s'utilise avec l'éditeur de script de DrGeo, il ajoute au menu de la figure un sous menu Expert pour son  utilisation conviviale mais peut aussi s'utiliser avec des commandes de script.
Différents jeux de règles permettent de l'utiliser pour d'autres applications que la géométrie; un jeu de règles permet de traiter des problèmes sur les circuits de résistances en électricité est
de traiter des circuits dessinés avec DrGeo.

Il est possibles de traiter son propre sujet en créant ses des règles.
Dans le cadre d'un cours d'informatique il permet d'illustrer la voie logique de l'AI, opposée à la voie du neuro-mimétisme.
Il peut aussi être  considéré  comme une simplification de Prolog, de la même manière que Logo est une simplification de LISP.


!!! version expérimentale  le package Foctionne pour:
  Le tutoriel,
  l'utilisation interactive,
  Les premiers chapitres de Géométrie et système Expert,
  Les prédicats ne sont pas tous vérifiés.

Installation.
  
Télécharger et installer CUIS DrGeo-windows-24.06a-beta  à: https://github.com/Dynamic-Book/drgeo

Telecharger les fichiers:m
Ovrir Drgeo et lâcher  DrGeoFrench.pck.st 
dans la fenêtre. Dans le menu qui s'ouvre choisir installPackage.

faire de même avec le fivhier Myexpert.pck.st

cliquer dans le fond et choirOutils/Editer une figure Smalltalkp
Ouvrir Erudite et utilisr les articles du sous menu Expert.
