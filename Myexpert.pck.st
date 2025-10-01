'From Cuis7.1 [latest update: #6452] on 30 September 2025 at 12:03:18 am'!
'Description '!
!provides: 'Myexpert' 1 12!
!requires: 'DrGeoFrench' 1 15 nil!
!requires: 'DrGeo' 1 744 nil!
SystemOrganization addCategory: #Myexpert!


!classDefinition: #ExpertWorkspace category: #Myexpert!
Workspace subclass: #ExpertWorkspace
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Myexpert'!
!classDefinition: 'ExpertWorkspace class' category: #Myexpert!
ExpertWorkspace class
	instanceVariableNames: ''!

!classDefinition: #ExpertRelations category: #Myexpert!
Set subclass: #ExpertRelations
	instanceVariableNames: 'expert'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Myexpert'!
!classDefinition: 'ExpertRelations class' category: #Myexpert!
ExpertRelations class
	instanceVariableNames: 'relations'!

!classDefinition: #ExpertList category: #Myexpert!
Object subclass: #ExpertList
	instanceVariableNames: 'head tail'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Myexpert'!
!classDefinition: 'ExpertList class' category: #Myexpert!
ExpertList class
	instanceVariableNames: 'aBlock'!

!classDefinition: #ExpertOutils category: #Myexpert!
Object subclass: #ExpertOutils
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Myexpert'!
!classDefinition: 'ExpertOutils class' category: #Myexpert!
ExpertOutils class
	instanceVariableNames: ''!

!classDefinition: #Expert category: #Myexpert!
ExpertOutils subclass: #Expert
	instanceVariableNames: 'stw nl regles aVerifier faits vars trouve affirmations ordreRegles deductions lrgl drgeo relations retablit constructions com indtexte titre affichage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Myexpert'!
!classDefinition: 'Expert class' category: #Myexpert!
Expert class
	instanceVariableNames: ''!

!classDefinition: #ExpertFait category: #Myexpert!
ExpertOutils subclass: #ExpertFait
	instanceVariableNames: 'name expert fait just fvars lv regles retire no'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Myexpert'!
!classDefinition: 'ExpertFait class' category: #Myexpert!
ExpertFait class
	instanceVariableNames: ''!

!classDefinition: #ExpertRegle category: #Myexpert!
ExpertOutils subclass: #ExpertRegle
	instanceVariableNames: 'name ant concl expert lv lf neg cut gen com n2x'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Myexpert'!
!classDefinition: 'ExpertRegle class' category: #Myexpert!
ExpertRegle class
	instanceVariableNames: ''!


!Expert commentStamp: '<historical>' prior: 0!
Main Class of This Expert System
Class intention
Contains most of the user's commands. 
Class collaborations
This is an addOn for DrGeo .
pad!

!ExpertRegle commentStamp: '<historical>' prior: 0!
I hold a rule.

My Responsibility part: is to verify a rule,store it and display it.

I mainly use the tool unifie ( unify)to verify the facts stored in the data base.

- verifRegle verify  my rule.
- afficheRegle display me .
- antecedents: set  my antecedents .
- concl: set my conclusion.

The set of rules are stored in methods on my class Side.
try:
"|e |
e:=Expert new.
ExpertRegle perform:  #'Electricite:'    withArguments: { e }.
e afficheRegles."																											

.
 The class Expert is my sender . It contains methods for using me.
lisRegle: name  com: comment   .lisregle:
Internal Representation and Key Implementation Points.

    Instance Variables
	ant:		<Object>
	com:		<Object>
	concl:		<Object>
	cut:		<Object>
	expert:		<Object>
	lf:		<Object>
	lv:		<Object>
	name:		<Object>
	neg:		<Object>


    Implementation Points!

!ExpertWorkspace methodsFor: 'accessing' stamp: 'drgeo 11/19/2024 14:41:22'!
bindings
 ^ bindings! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 5/14/2020 21:48'!
expert 
^expert! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 5/14/2020 21:48'!
expert: ex
expert := ex! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 4/15/2020 02:21'!
includes: obj
^(self select:[:x|x=obj] )notEmpty ! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 5/16/2020 03:39'!
relation: obj1 et:  obj2 nom: n
|rel rel1 rel2|
rel:= expert relationsAt: n.
rel isEmptyOrNil  ifTrue: [ ^false ].
rel1 := rel detect: [:x| x includes: obj1] ifNone:[nil] .
rel2 := rel detect: [:x| x includes: obj2] ifNone:[nil].
rel1 ifNil:  [ ^false].
rel2 ifNil: [ ^false ] .
^( rel1 = rel2 )
! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 5/14/2020 11:07'!
relation: obj nom: n
|rel|

rel:= self selectRelation: n.
rel:= rel select: [:s|s includes: obj ].
rel isEmpty ifTrue:[ ^ rel].
^rel asArray first.
! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 12/1/2023 01:41'!
relationCrée: obj1 et: obj2 nom: n
	| rel1 rel2 rel e |
	e := self expert.
	rel := e relationsAt: n.
	rel1 := rel detect: [ :x | x includes: obj1 ] ifNone: [ nil ].
	rel2 := rel detect: [ :x | x includes: obj2 ] ifNone: [ nil ].
	
	(rel1 isNil and: [ rel2 isNil ])
		ifTrue: [ rel1 := self class new.
			rel1
				add: obj1 copy;
				add: obj2 copy.
			rel add: rel1.
			e relations at: n put: rel.
			^ true ].
	(rel1 notNil and: [ rel2 isNil ])
		ifTrue: [ (rel includes: rel1)
				ifTrue: [ rel remove: rel1 ].
			rel1 add: obj2 copy.
			rel add: rel1.
			e relations at: n put: rel.
			^ true ].
	(rel2 notNil and: [ rel1 isNil ])
		ifTrue: [ (rel includes: rel2)
				ifTrue: [ rel remove: rel2 ].
			rel2 add: obj1 copy.
			rel add: rel2.
			e relations at: n put: rel.
			^ true ].
	((rel1 notNil and: [ rel2 notNil ]) and: [ rel1 = rel2 ])
		ifTrue: [ ^ true ].
	rel1 do: [ :x | rel2 add: x ].
	rel remove: rel1 ifAbsent: [].
	^ true! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 5/14/2020 21:43'!
relations
^expert relations! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 5/15/2020 00:24'!
relations: r
expert relations: r
! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 3/31/2023 13:25'!
relationsAt: clef
	^ self relations
		at: clef asSymbol
		ifAbsentPut: [ OrderedCollection new ]! !

!ExpertRelations methodsFor: 'accessing' stamp: 'DrGeoUser 5/15/2020 00:56'!
selectRelation: nom
^(self expert relations) select: [:r|r includes: nom]  .
! !

!ExpertRelations class methodsFor: 'accessing' stamp: 'DrGeoUser 4/25/2020 17:39'!
initRelations 
relations :=IdentityDictionary  new.! !

!ExpertRelations class methodsFor: 'accessing' stamp: 'DrGeoUser 4/13/2020 13:03'!
relations 
^relations! !

!ExpertRelations class methodsFor: 'accessing' stamp: 'DrGeoUser 5/14/2020 17:37'!
relationsAt: clef
^relations at:( clef  asSymbol )ifAbsentPut: [ OrderedCollection new ]! !

!ExpertRelations class methodsFor: 'initialize' stamp: 'DrGeoUser 4/13/2020 13:50'!
new: rel
|n|
n:=self new.
n add:rel.
^n! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 6/7/2021 12:11'!
< alist
|t1 t2|
t1:= self printString .
t2 := alist printString.
^t1 < t2

	! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/7/2023 10:49'!
= aList
	(aList isKindOf: ExpertList)
		ifFalse: [ ^ false ].
	(self isEmpty and: [ aList isEmpty ])
		ifTrue: [ ^ true ].
	(self tail isNil and: [ aList tail notNil ])
		ifTrue: [ ^ false ].
	(aList tail isNil and: [ self tail notNil ])
		ifTrue: [ ^ false ].
	((self head isKindOf: Number) and: [ aList head isKindOf: Number ])
		ifTrue:
			[ ^ self tail = aList tail and: [ self head - aList head < 0.0000001 ] ].
	^ self head = aList head and: [ self tail = aList tail ]! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/16/2013 14:01'!
add:v  


self addLast0:v.
^v! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/31/2013 15:51'!
addFirst:v
|n|
n:=self class new.
n head:v.
n tail: self.
^n! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 7/13/2021 08:36'!
addFirstIfNotIncluded: v  
|n|
(self includes: v)ifTrue: [ ^self ].
n:=self veryDeepCopy .
^ n addFirst: v.
! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/1/2013 12:40'!
addLast0:v  
self tail ifNil: [self head:v.self tail: self class new. ^self ].
self tail addLast0: v
! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 8/23/2024 15:08:05'!
addLast:v  


self addLast0:v.
! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 7/13/2021 08:32'!
addLastIfNotIncluded: v  
|n|
(self includes: v)ifTrue: [ ^self ].
n:=self veryDeepCopy .
^ n addLast0:v.
! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 6/11/2021 17:47'!
all:condition
|cond |
cond := true.
self do: [ :x |(condition value: x)   ifFalse: [  cond:=false ]  ].
^cond.! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/2/2013 16:51'!
allButFirst
^ self tail! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 9/16/2024 18:37:22'!
allButLast 
|c|
c:=self  copyList.
^c allButLast0: c! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/5/2019 18:44'!
allButLast0:l
|last|
self tail ifNil: [^nil].
last:=self tail.


(self  tail tail )isEmpty ifTrue: [last head:nil.last  tail: nil. ^l].

^self tail allButLast0:l

! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 11/20/2020 11:43'!
append: l
^  ExpertList new append: self deepCopy with: l! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 11/20/2020 11:23'!
append: l1 with: l2
|res|
res:=l1.
l2 doFirstLevel: [ :el | res add: el ].
^    res.! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/16/2013 13:03'!
asArray
^self asOrderedCollection asArray .! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/11/2021 13:39'!
asCollection
^self asOrderedCollection! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/14/2013 01:22'!
asOrderedCollection 
|col |
col:=OrderedCollection new .
self doFirstLevel: [:x|col addLast: x].
^col! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 8/3/2020 17:06'!
asSetlist
^ExpertList new: self asOrderedCollection asSet! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/2/2013 17:54'!
asString
^self printString! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 6/7/2021 15:45'!
at:n
(n > self size)ifTrue: [  ^nil ].
(n<1 )ifTrue:[^nil].
(n=	1)ifTrue: [ ^self first].
	^ self allButFirst  at:n - 1.! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 8/3/2020 16:08'!
collect: aBlock
|res|
res:=self class new.
self doFirstLevel: [ :el | res add: ( aBlock value:el)  ].
^res
! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 8/16/2024 10:35:01'!
copyList
|c  |
self isEmpty ifTrue: [^self ].
c:=ExpertList new.
self doFirstLevel:[:i|c add:i].
^c! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 6/14/2021 01:58'!
couples 
^ self couples: ExpertList new.! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 6/14/2021 01:49'!
couples: l2
|p1 p2 couple  l3|
l3:=l2.
p1:= self  first .
p2 := self allButFirst .
p2 isEmpty ifTrue: [  ^l2].
p2:=p2 first.
couple := ExpertList new.
couple add: p1.couple .
couple add: p2. couple. 
l3 add: couple.
^ (self  allButFirst )  couples:  l3.

! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 7/12/2025 01:04:02'!
difference:l2
^self difference:l2 inter:ExpertList new.! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 7/12/2025 01:28:36'!
difference:l2 inter: int
|bf inter ll1 ll2|
inter:=int.
self  size > l2 size ifTrue:[ ll1:=self .ll2:= l2]
ifFalse:[ ll1:=l2 .ll2:= self].
bf :=ll1  allButFirst.
ll1 isEmpty 
	ifTrue: [^int]
	ifFalse: [(ll2 includes: ll1 first )
		ifFalse: [inter add: ll1 first . ^bf difference:  ll2 inter: inter ]
		ifTrue: [ ^bf difference:  ll2 inter: inter ]
	]
	
					 
					
					
					
					
					
				
					
					
					
					
					
					
				
	
 ! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/3/2013 22:34'!
do: aBlock
|el|
self isEmpty ifTrue: [^self].
el:=ExpertList new.
self head isList  ifTrue: [el head:((self head )doRecursively: aBlock)]
ifFalse:[ el head:(aBlock value:self head)].
el tail:((self  tail )doRecursively: aBlock).
^el! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/14/2013 01:25'!
doFirstLevel: aBlock
|el|
self isEmpty ifTrue: [^self].
aBlock value:self head.
(self  tail )doFirstLevel:  aBlock.
! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/2/2013 22:28'!
doRecursively: aBlock
|el|
self isEmpty ifTrue: [^self].
el:=ExpertList new.
self head isList  ifTrue: [el head:((self head )doRecursively: aBlock)]
ifFalse:[ el head:(aBlock value:self head)].
el tail:((self  tail )doRecursively: aBlock).
^el! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/6/2013 13:40'!
faitAsList:aFait
|l|
aFait isList ifTrue: [^aFait].
(aFait isKindOf: OrderedCollection )ifTrue: [l:=ExpertList emptyList .aFait do:[:m|l :=l addLast: m].^l].
aFait isString ifTrue: [^ExpertList  new: aFait ]
 ! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/31/2013 15:53'!
first
^self head! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/30/2013 21:24'!
head
^head
! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/30/2013 21:24'!
head: v
head :=v
! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 5/21/2021 12:54'!
ifEmpty: aBlock
^ self isEmpty 
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/1/2020 23:22'!
includes:obj 
self  isEmpty  ifTrue:[ ^false ].
(( self first)=obj) ifFalse: [ ^ self allButFirst  includes:  obj  ].
^true! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 5/21/2021 13:08'!
index: el
^ self index: el n:0.! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 5/21/2021 13:50'!
index: el n:ind
|i|
self isEmpty ifTrue: [ ^ nil ].
(el =(self first)) ifTrue: [^ ind+1 ].
i := ind+1.
^ (self allButFirst) index: el    n: i! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/17/2020 01:02'!
instancie2: lvars 
| e val|
self ifNil: [ ^self ].
(self first isList )ifTrue: [ ^( (self allButFirst)  instancie2: lvars ) addFirst:(  self  instancie2: lvars )].
self allButFirst ifNil: [^ nil ].
^( (self allButFirst)  instancie2: lvars ) addFirst:( ( ( val:= self  asString) beginsWith: '?')   
	ifTrue: [ e valeur:val vars: lvars ] 
	ifFalse: [ val ] ).
! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 1/6/2020 17:35'!
instancie: lvars
^self do:[:xx|(xx asString beginsWith: '?')ifTrue:[ Expert new valeur: xx vars: lvars] ifFalse:[xx]].! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 11/24/2019 11:21'!
instancie: lvars expert:e
^self do:[:xx|(xx asString beginsWith: '?')ifTrue:[e valeur: xx vars: lvars] ifFalse:[xx]].! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 7/11/2025 14:02:57'!
intersection:l1 with:l2 inter: int
|bf|
bf :=l1 allButFirst.
l1 size < l2 size ifTrue: [l1 isEmpty 
	ifFalse: [(l2 includes: l1 first )
		ifTrue:
			[^8]]].
			
					  
					
					
					
					
					
				
					
					
					
					
					
					
				
	
 ! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 7/11/2025 18:31:18'!
intersectionWith:l2 inter: int
|bf inter frst ll1 ll2|
frst:= self first.
inter:=int.
self  size > l2 size ifTrue:[ ll1:=self .ll2:= l2]
ifFalse:[ ll1:=self .ll2:= l2].
bf :=ll1  allButFirst.
ll1 isEmpty 
	ifTrue: [^int]
	ifFalse: [(ll2 includes: ll1 first )
		ifTrue: [inter add: frst . ^bf intersectionWith:  ll2 inter: inter ]
		ifFalse: [ ^bf intersectionWith:  ll2 inter: inter ]
	]
	
					 
					
					
					
					
					
				
					
					
					
					
					
					
				
	
 ! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/31/2013 18:49'!
isEmpty 
^(self tail isNil )and:[self head isNil ]! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/2/2013 18:03'!
isList
^true! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/31/2013 16:09'!
last
self tail ifNil: [^nil].
self  tail tail ifNil: [^self head].
^self tail last! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/4/2013 02:59'!
makeCollectionOfLists:aString
^((aString subStrings: '
')collect:[:m|ExpertList new: m])asOrderedCollection .! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/1/2013 03:25'!
makeList:  aStream  
^self makeList:aStream list:ExpertList new .! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/1/2013 14:17'!
makeList:st list:alist
|n  lst|
lst:=alist .
n:=st next.
n=#']' ifTrue: [^alist ].
n=#'['  ifTrue: [n:= alist makeList: st list: ExpertList new].
n ifNil: [ ^alist ].

lst:=alist  addLast: n.

^self  makeList:st  list: lst ! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 1/6/2020 19:07'!
makeNom
|rstr wstr|
rstr:=ReadStream  on: self.
wstr:= WriteStream on: ''.
wstr nextPutAll: rstr next.
[ wstr nextPut: $:. wstr nextPutAll: rstr next. rstr atEnd ]whileFalse .
^wstr contents.! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 7/30/2024 09:28:45'!
makeWordCollection: aString 

|res|
	
res :=((aString  subStrings: ' ' 	)collect:[:t |t asSymbol])asOrderedCollection .
('[' =	res first) ifTrue:[ res := res allButFirst ].
('[' =	res last ) ifTrue:[ res := res allButLast].			
					^res! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 1/6/2020 14:18'!
max 
^ self sort last! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 1/6/2020 14:16'!
min 
^ self sort first.! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/4/2013 12:46'!
notEmpty
^self isEmpty not! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 1/6/2020 18:17'!
permute

^(self  addLast: self first) allButFirst .! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 1/6/2020 18:41'!
permuteMin
|m l | 
m:=self min.
l:=self.
[  l:= l permute . m = (l first)] whileFalse .
^l! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 8/3/2020 15:58'!
reject: ablock
|res|
res:=self class new.
self doFirstLevel: [ :el | (ablock value: el ) ifFalse: [res add: el]].
^res! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/1/2013 18:40'!
removeFirst
|h r|
r:=self first.
h:=self .
h head: h tail head.
h tail:  h tail tail.

^r! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 8/3/2020 16:32'!
select: aBlock
|res|
res:=self class new.
self doFirstLevel: [ :el | (aBlock value: el ) ifTrue:   [res add: el]].
^res! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/16/2013 12:55'!
size
^self size:0! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 4/16/2013 12:55'!
size:n
self isEmpty ifTrue: [^n].
^self tail size:n+1.! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 12/20/2021 13:10'!
sum
	| s |
	s := 0.0.
	self do: [ :x | s := s + x  asNumber ].
	^ s! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/31/2013 15:41'!
tail
^tail! !

!ExpertList methodsFor: 'accessing' stamp: 'DrGeoUser 3/31/2013 15:42'!
tail: v
tail :=v! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 7/11/2025 03:41:00'!
tousDifferents: aList
 ^aList tousDifferents 
! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 7/27/2025 23:50:10'!
tousDifférents
	| suite |
	suite := self allButFirst.
	suite isEmpty ifTrue: [ ^ true ].
	(self allButFirst tousDifférentsDe: self first) ifTrue: [ ^ suite tousDifférents ].
	^ false.! !

!ExpertList methodsFor: 'accessing' stamp: 'drgeo 7/27/2025 23:52:25'!
tousDifférents: aList
 ^aList tousDifférents 
! !

!ExpertList methodsFor: 'printing' stamp: 'drgeo 9/19/2024 14:39:23'!
printOn0: aStream 

self isEmpty
		ifTrue: [ aStream nextPutAll: '[ ]'.
			^ self ].
	
	self printOn2: aStream.
	
! !

!ExpertList methodsFor: 'printing' stamp: 'drgeo 11/8/2024 03:34:28'!
printOn1: aStream 

self isEmpty
		ifTrue: [ aStream nextPutAll: '[ ]'.
			^ self ].
	aStream nextPutAll:  ' [ '.
	self printOn2: aStream.
	aStream nextPutAll: ' ] '.	
! !

!ExpertList methodsFor: 'printing' stamp: 'drgeo 9/19/2024 14:45:24'!
printOn2: aStream 
	self isEmpty
		ifTrue: [ ^ '[  ]' ].
	self tail ifNil: [ ^ self ].
	self head class = ExpertList
		ifTrue: [ .
			self head printOn1: aStream 
			]
		ifFalse: [ head
				ifNotNil: [ head isString
						ifTrue: [ aStream nextPutAll: head ]
						ifFalse: [ aStream nextPutAll: head printString ] ].
			self size > 1
				ifTrue: [ aStream nextPut: $  ] ].
	self tail printOn2: aStream ! !

!ExpertList methodsFor: 'printing' stamp: 'drgeo 9/19/2024 14:39:48'!
printOn: aStream
	"aStream nextPutAll: '[ '  ."

	self isEmpty
		ifTrue: [ aStream nextPutAll: '[ ]'.
			^ self ].
	self printOn0: aStream! !

!ExpertList methodsFor: 'sorting' stamp: 'drgeo 7/27/2025 23:58:24'!
asList
^ ExpertList new: self! !

!ExpertList methodsFor: 'sorting' stamp: 'DrGeoUser 5/10/2021 21:17'!
sort 
|lst|
lst:=self.
^lst  sort: [ :x :y |x < y ] ! !

!ExpertList methodsFor: 'sorting' stamp: 'DrGeoUser 5/10/2021 17:45'!
sort: aBlock
|col rstr wstr |
col:=self  asOrderedCollection .
(col size >1)ifFalse: [ ^self ].
col:=col sort:aBlock .
rstr:=ReadStream on: col.
wstr:=WriteStream on: ''.
wstr nextPutAll: rstr next.
[  wstr  nextPutAll:' '.wstr nextPutAll: rstr next. rstr atEnd ]whileFalse .
^ExpertList new: wstr contents.! !

!ExpertList methodsFor: 'as yet unclassified' stamp: 'drgeo 7/27/2025 23:48:12'!
tousDifférentsDe: x
	^ (self includes: x asString) not.! !

!ExpertList class methodsFor: 'opening' stamp: 'DrGeoUser 4/1/2013 12:21'!
emptyList
^self new! !

!ExpertList class methodsFor: 'opening' stamp: 'DrGeoUser 12/21/2021 20:19'!
new: aCollection
|l st|
l:=self new.
(aCollection isList)ifTrue: [ ^  aCollection copy ].
(aCollection isString )ifTrue: [     aCollection ifEmpty: [ ^l ]    .  
st := (l makeWordCollection: aCollection )readStream . 
l:= l makeList: st  .^l].
(aCollection isNumber )ifTrue: [ l add:  aCollection.^ l ].
aCollection  do:[:el|l :=l addLast: el].
^l ! !

!ExpertOutils methodsFor: 'accessing' stamp: 'drgeo 8/17/2024 00:19:01'!
floatString: str
	^ str asString  size
		=
			((str asString)
				select: [ :x | 
					((((x  asciiValue  between: 48 and: 57) or: [ x = $. ]) or: [ x = $- ])or:( x= $/))
						or: [ x = $e ] ]) size! !

!ExpertOutils methodsFor: 'accessing' stamp: 'drgeo 1/23/2025 03:19:43'!
instancie: lVars fait: f
	| res fts |
	lVars ifNil: [ ^ f ].
	(lVars isKindOf: IdentityDictionary)
		ifFalse: [ ^ f ].
	fts:=ExpertList new: f.
	res := fts collect: [ :t4 | self valeur: t4 vars: lVars ].
	"	args := res contents allButFirst.
	$: = concl first last
	ifTrue: [args add: lVars.
			self perform: (concl first , 'vars:') asSymbol withArguments: args asArray].
"
self halt.
	^ res! !

!ExpertOutils methodsFor: 'accessing' stamp: 'drgeo 1/16/2025 20:34:13'!
instancie: f vars:lVars
	| res fts |
	lVars ifNil: [ ^ f ].
	(lVars isKindOf: IdentityDictionary)
		ifFalse: [ ^ f ].
	fts:=ExpertList new: f.
	res := f do: [ :t4 | self valeur: t4 vars: lVars ].
	"	args := res contents allButFirst.
	$: = concl first last
	ifTrue: [args add: lVars.
			self perform: (concl first , 'vars:') asSymbol withArguments: args asArray].
"
	^ res! !

!ExpertOutils methodsFor: 'accessing' stamp: 'DrGeoUser 4/14/2020 14:06'!
relations
^ ExpertRelations new  relations! !

!ExpertOutils methodsFor: 'accessing' stamp: 'DrGeoUser 4/14/2020 14:08'!
relations: rel
ExpertRelations new class relations: rel.! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 12/21/2021 22:54'!
affecte: aVariable valeur: aValue vars: newVars
	| t4 t5 tt4 |
	newVars ifNil: [ ^ aVariable ].
	newVars = false
		ifTrue: [ ^ aVariable ].
	(aVariable asString beginsWith: '?')
		ifFalse: [ ^ false ].
	t4 := aVariable asString asSymbol.
	t5 := newVars
		at: t4
		ifAbsent: [ newVars at: t4 put: aValue.
			^ true ].
	tt4 := self valeur: t4 vars: newVars.
	(tt4 asString includesAnyOf: '12345678890')
		ifTrue: [ (self floatString: tt4 asString)
				ifTrue: [ (tt4 asNumber - t5 asNumber) abs < 0.0001
						ifTrue: [ ^ true ] ] ].
	^ aValue = t5! !

!ExpertOutils methodsFor: 'tools' stamp: 'pad 2/5/2012 18:39'!
appendCollection: t1 with: t2 
(t2  isNil )ifTrue: [^t1].
t1 addAll: t2.
^ t1! !

!ExpertOutils methodsFor: 'tools' stamp: 'pad 2/20/2012 23:47'!
applatis: acollection 
^ ((self applatisSuite: acollection)asSet)asOrderedCollection .! !

!ExpertOutils methodsFor: 'tools' stamp: 'pad 2/20/2012 23:59'!
applatisSuite: acollection 
	| first allButF |
	acollection = false
		ifTrue: [^ false].
	
	acollection class == IdentityDictionary
		ifTrue: [^ acollection].
		acollection
		ifEmpty: [^OrderedCollection new ].
	first := (acollection asOrderedCollection) first.
	allButF := (acollection asOrderedCollection) allButFirst.
	(first class == OrderedCollection)
		ifTrue: [(allButF isEmpty )ifTrue: [^self applatisSuite:    first].
			^ self
				appendCollection: (self applatisSuite: first)
				with: (self applatisSuite: allButF)].
	^ (self
		appendCollection: acollection
		with: (self applatisSuite: allButF))reject:[:t|t isNil ]! !

!ExpertOutils methodsFor: 'tools' stamp: 'pad 2/20/2012 09:57'!
colAsString:col 
	| t1 |
	t1 := (String new: 200) writeStream.
	

col 	do: [:t2 | t2 isString
				ifTrue: [t1 nextPutAll: (t2,' ')]
				ifFalse: [t2 printOn: t1.
					t1 nextPutAll:  ' ']].
	t1 size > 0
		ifTrue: [t1 skip: -1].
	
	^ t1 contents.
! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 9/11/2024 01:49:24'!
colAsString:col debut: deb

^  col collect: [ :c| self string:c asString  debut:deb]! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 10/2/2024 23:14:57'!
colAsStringWithCr:col 
	| t1 |
	t1 := (String new) writeStream.
	

col 	do: [:t2 |t2 isString
				ifTrue: [t1 nextPutAll: (t2,' ')]
				ifFalse: [t2 printOn: t1.
					t1 nextPutAll:  ' '.
].					t1 nextPutAll: ' '.].
	t1 size > 0
		ifTrue: [t1 skip: -1].
	
	^ t1 contents.
! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 10/2/2024 23:20:28'!
colAsStringWithCrForSet:col 
	| t1 |
	t1 := (String new) writeStream.
	

col 	do: [:t2 |t2 isString
				ifTrue: [t1 nextPutAll: '{',(t2  allButFirst)allButLast ,'} ']
				ifFalse: [t2 printOn: t1.
					t1 nextPutAll:  ' '.
].					t1 nextPutAll: '
	'.].

	t1 size > 0
		ifTrue: [t1 skip: -1].	
	
	^ t1 contents.
! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 9/8/2024 21:08:57'!
commentaireDe: aMethod
|ind1 ind2|

! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 5/8/2020 01:47'!
concat: aCollection
| col  res nxt|
aCollection ifEmpty:  [ ^aCollection ].
col:=ReadStream on: aCollection.
res:=WriteStream on: OrderedCollection new . 
[ (nxt:=col next) ifNotNil:[ res nextPutAll: nxt] . col atEnd ]whileFalse .
^res contents.! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 5/10/2022 03:32'!
evaluate: expr
|exp|
exp:= expr.
^ exp := OpalCompiler new
		source:expr ;
		evaluate.! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 4/3/2020 14:31'!
faitAsString:col 
	| t1 st|
	
	col isList ifTrue: [st := col do:[:m|m asString ].^st printString ].
	t1 := (String new) writeStream.

col 	do: [:t2 | t2 isString
				ifTrue: [st:=ExpertList  new: t2.st printOn: t1.t1 nextPutAll: ' ']
				ifFalse: [t2 printOn: t1.
					"t1 nextPutAll:  ' '"  ]].
	t1 size > 0
		ifTrue: [t1 skip: -1].
	
	^ t1 contents.
! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 2/16/2022 15:14'!
keyOf: val lval: lv
^	lv keys at: (lv values indexOf: val)! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 10/8/2024 01:43:02'!
label: obj 

^((self drgeo view drawable itemViews)detect:[:x|(x mathItem) =obj])  labelMorph  ! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 10/8/2024 01:13:07'!
label: obj figure:f
^((f view drawable itemViews)detect:[:x|(x mathItem) =obj])  labelMorph  ! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 1/6/2020 13:21'!
list: aString
^ExpertList new: aString.! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 7/31/2024 16:18:08'!
makeFactCollection: arg1
	| temp2 temp3 |
	temp3 := OrderedCollection new.
	temp2 := OrderedCollection new.
	arg1 do: [ :argm2_5 |
		argm2_5 = '§'
			ifTrue: [
				temp3 ifNotEmpty: [ temp2 add: temp3 ].
				temp3 := OrderedCollection new ]
			ifFalse: [ temp3 add: argm2_5 ]].
	temp3 ifNotEmpty: [ temp2 add: temp3 ].
	^ temp2.! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 1/19/2025 14:48:53'!
makeFactCollectionFromString: aString
|r|
r:= self creeRegle: 'temp'.
r antecedents: aString.
^r ant
"^(self makeFactCollection:( self makeWordCollection:aString))collect: [:c | ExpertList new: c]"
   ! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 4/1/2013 14:28'!
makeList: aString
^ExpertList new: aString.! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 9/6/2024 18:32:51'!
makeNumber: aString 
|res|
aString isPoint ifTrue:[^aString].
aString isNumber ifTrue:[^aString].
res:=Compiler evaluate:aString. 

res  isNumber ifTrue:[^res	 ].
^aString! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 8/16/2014 12:49'!
makeTokenCollection: aString 


	
^aString  findTokens: #($ $( $) ) 	! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 9/16/2014 15:08'!
makeTokenCollection: aString  index:n
|s ind rep|
ind :=n asString.
rep:=''.	
s:=aString  findTokens: #($ $( $) ) .
^s first.	! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 9/6/2024 21:20:28'!
makeWordCollection: arg1
	| temp2 temp3 temp5 |
	arg1 class = OrderedCollection ifTrue: [ ^ arg1 ].
	temp2 := OrderedCollection new.
	temp3 := ''.
	temp5 := true.
	arg1 do: [ :argm4_6 |
		argm4_6 = Character space
			ifTrue: [
				temp5 ifFalse: [
					temp3 ifNotEmpty: [
						temp2 add: temp3.
						temp3 := ''.
						temp5 := true ]]]
			ifFalse: [
				temp5 ifTrue: [ temp5 := false ].
				argm4_6 isLineSeparator
					ifTrue: [
						temp2 add: temp3.
						temp2 add: '§'.
						temp3 := '' ]
					ifFalse: [ temp3 := temp3 , argm4_6 asString ]]].
	temp3 ~= '' ifTrue: [ temp2 add: temp3 ].
	^ temp2.! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 4/4/2020 18:25'!
minimum: str
(str isList) ifTrue: [^( str  asOrderedCollection    sorted) first ].
^ (str   findTokens:  #($; )  )sorted first! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 9/21/2020 19:48'!
nomDizainesPolygone: n
(n =0) ifTrue: [^ '' ].
( n = 1) ifTrue: [^ 'Deca' ].
( n = 2)  ifTrue: [^ 'Icosca' ].
(n > 2) ifTrue: [ ^  (self nomUnitéPolygone: n), 'Conta']
! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 9/21/2020 16:43'!
nomPolygone: n
(n= 100) ifTrue:[^ 'Hectogone'].
^(self nomUnitéPolygone: n\\10  )    , ( self nomDizainesPolygone: n //10),'gone'.
 ! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 9/21/2020 16:39'!
nomUnitéPolygone: n
| unités |
unités:= #( ''  Hen Do  Tri Tetra Penta Hexa Hepta Octo Enea) asOrderedCollection .
^(unités at:((n asNumber)+ 1) )asString! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 2/10/2020 11:46'!
nomsComRegles: listRegles
|n|
n:=0.
^listRegles collect:[:r| n:=n+	1.(( (r com) isNil )or: [(r com) ='']  ) ifTrue:   [ n asString, ' ',r name] 
ifFalse:[  n asString, ' ',r  com] ]! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 2/10/2020 11:43'!
nomsRegles: listRegles
|n|
n:=0.

^listRegles collect:[:r|n:=n+1.  n asString,' ', r name]! !

!ExpertOutils methodsFor: 'tools'!
perform: t1 vars: t2 
	| t3 t4 t5 |
	t3 := t1 removeFirst.
	t3 := (t3 , 'vars:') asSymbol.
	t5 := t1 asOrderedCollection.
	t5 add: t2.
	t4 := t5 asArray.
	^ self perform: t3 withArguments: t4! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 1/6/2020 13:12'!
sort: str
|r s|
str isString ifTrue: [ 
r :=str  findTokens: #($; ).
r:= r sorted.
s := WriteStream on:''.
s  nextPutAll: r first.
r allButFirst  do: [ :m | s nextPutAll:  (';',m)].
^ s contents. ].
^str sort! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 9/11/2024 01:09:46'!
string:str debut: deb

^  str asString copyReplaceFrom: 1  to: deb with: ' '! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 8/22/2020 00:03'!
unifie2: t1 avec: t2 vars: t3 
 "nil"	| t4 t5 t4f t5f|
	
	t4 := t1 copy.
	t5 := t2 copy.
	t4 ifNil: [ t4:= ExpertList  new ].
	t5 ifNil: [ t5:= ExpertList  new ].
	(t4 isEmpty and:  [t5 isEmpty])
		ifTrue: [^ t3].
		(t4 isEmpty
			or: [t5 isEmpty])
		ifTrue: [^ false].
		
	
	t4f:=t4 removeFirst .
	t5f:=t5 removeFirst .
	(t4f isNumber)ifTrue: [ t4f := t4f asString ].
	t4f == t5f
		ifTrue: [
			^ self
				unifie2: t4
				avec: t5
				vars: t3].
			(t4f = t5f)
		ifTrue: [
			^ self
				unifie2: t4
				avec: t5
				vars: t3].
((t4f isKindOf: ExpertList )and:[t5f isKindOf: ExpertList ] )
	ifTrue: [((self unifie2: t4f avec:  t5f vars: t3)=false)
			ifTrue:  [^false]
				 ifFalse: [ ^self unifie2: t4 avec: t5 vars: t3] ].
	(t4f isString and:[	$? = t4f first ])
		ifTrue: [  ( ( (t5f  isString) not)or:[( $? =t5f first)not])
				ifTrue: [(self
							affecte: t4f
							valeur: t5f
							vars: t3)
						ifFalse: [^ false]].
		(t4 isEmpty & t5 isEmpty )ifTrue: [^t3].		
			^ self
				unifie2: t4
				avec: t5
				vars: t3].
	$? = t5f first
		ifTrue: [$? = t4f first
				ifFalse: [(self
							affecte: t5f
							valeur: t4f
							vars: t3)
						ifFalse: [^ false]].
			(t4 isEmpty and: [t5 isEmpty ])ifTrue: [^t3].
			^ self
				unifie2: t4
				avec: t5
				vars: t3].
	
	^ false! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 2/16/2022 15:52'!
unifie: t1 avec: t2 vars: t3
	| t4 t5 t4f t5f |
	t4 := ExpertList new: t1.
	t5 := ExpertList new: t2.
	(t4 isEmpty and: [ t5 isEmpty ])
		ifTrue: [ ^ true ].
	(t4 isEmpty or: [ t5 isEmpty ])
		ifTrue: [ ^ false ].
	t4f := t4 removeFirst.
	t5f := t5 removeFirst.
	t4f = t5f
		ifTrue: [ ^ self unifie: t4 avec: t5 vars: t3 ].
	(t4f isNumber and: [ t5f isNumber not ])
		ifTrue: [ t5f := self makeNumber: t5f ].
	(t4f isNumber not and: [ t5f isNumber ])
		ifTrue: [ t4f := self makeNumber: t4f ].
	(t4f isNumber and: [ t5f isNumber ])
		ifTrue: [ ((t4f - t5f) abs < 1e-3)
				ifTrue: [ t3 at: (self keyOf: t5f lval: t3) put:(( t5f * 1000)rounded /1000).
				t3 at: (self keyOf: t4f lval: t3) put:(( t4f * 1000)rounded /1000).	
					^ true ] ].
	((t4f isKindOf: ExpertList) and: [ t5f isKindOf: ExpertList ])
		ifTrue: [ (self unifie: t4f avec: t5f vars: t3)
				ifTrue: [ (t4 isEmpty and: [ t5 isEmpty ])
						ifTrue: [ ^ true ]
						ifFalse: [ ^ self unifie: t4 avec: t5 vars: t3 ] ]
				ifFalse: [ ^ false ] ].
	(t4f isString and: [ $? = t4f first ])
		ifTrue: [ (t5f isString not or: [ ($? = t5f asString first) not ])
				ifTrue: [ (self affecte: t4f valeur: t5f vars: t3)
						ifFalse: [ ^ false ] ].
			t4 isEmpty & t5 isEmpty
				ifTrue: [ ^ true ].
			^ self unifie: t4 avec: t5 vars: t3 ].
	$? = t5f asString first
		ifTrue: [ $? = t4f asString first
				ifFalse: [ (self affecte: t5f valeur: t4f vars: t3)
						ifFalse: [ ^ false ] ].
			(t4 isEmpty and: [ t5 isEmpty ])
				ifTrue: [ ^ true ].
			^ self unifie: t4 avec: t5 vars: t3 ].
	^ false! !

!ExpertOutils methodsFor: 'tools' stamp: 'drgeo 1/23/2025 02:02:11'!
valeur: t1 vars: t2 
|val|
t1 isList  ifTrue: [^t1  instancie: t2].
	(t1 asString beginsWith: '?')
		ifFalse: [^ t1].
	t2
		ifNil: [^ t1].
	(t2 isKindOf: IdentityDictionary)
		ifFalse: [^ t1].
	val:=(t2
		at: t1 asSymbol
		ifAbsent: [^ t1]).
	val isList ifTrue: [ ^  val instancie: t2 ].
	"self halt."
^val.! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 4/8/2013 15:26'!
verifieFait2: t1 
	| t2 t3 t4  vars res|
	
	t2 := self makeWordCollection: t1.
	t3 := self faits
				at: t2 first
				ifAbsent: [^ OrderedCollection new].
	t4 := t3
				collect: [:t5 | Array
						with: (self
								unifie: t2
								avec: t5 fait
								vars: IdentityDictionary  new)
						with: t5 ].
	t4 := t4
				reject: [:t5 | (t5 first = false) ].
	res:=''.			
	t4
	do: [:t5 |res := res ,'
' , t5 last afficheFait ].
^res! !

!ExpertOutils methodsFor: 'tools' stamp: 'DrGeoUser 11/29/2022 17:22'!
verifieFaits: t1
	| f res st |
	f := self makeFactCollectionFromString: t1.
	res := f collect: [ :t | Array with: t with: ( (self subclasses at:3 )verifieFait: t) ].
	"res collect:  [:m|m last afficheFait ]."
	st := ''.
	res
		do: [ :s | 
			st := st
				,
					'
	' , (self colAsString: s first)
				,
					'
	' , (self colAsStringWithCr: s last) ].
	^ st! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 5/2/2025 17:08:35'!
affichage
^affichage! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 5/2/2025 17:09:28'!
affichage: aff
affichage := aff! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 10/27/2023 16:03'!
afficheAffirmations
	| n nfaits res wres |
	n := 0.
	nfaits := affirmations collect: [ :x | x fait asString ].
	res := ReadStream on: nfaits.
	wres := WriteStream on: ''.
	wres nextPut: Character cr.
	[ n := n + 1.
	wres nextPutAll: n asString.
	wres nextPut: Character space.
	wres nextPutAll: res next.
	wres nextPut: Character cr.
	res atEnd ] whileFalse.
	^wres contents! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 11/18/2024 00:19:25'!
afficheCode
|str|
str :='f:=DrGeoFigure nouveau.
'.
(((self affirmations  collect:[:x|x fait] )select:[:y|(y first)='code'])collect:[:z|z allButFirst asString] )reverseDo:[:v|str:=str,v,'.
'] .
^str! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 4/18/2019 09:04'!
afficheConclusions
	| t1 t2 |
	t2 := ReadStream on: (self regles values
					collect: [:t3 | t3 concl  asString]) asSet asSortedCollection.
	t1 := WriteStream on: ''.
	[t1 cr.
	t1 nextPutAll: t2 next.
	t2 atEnd] whileFalse.
	^ t1 contents! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 11/7/2024 22:56:19'!
afficheFaits
''=self afficheFaits2 ifTrue: [^'base vide' ]
ifFalse: [^self afficheFaits2]! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 7/17/2022 13:33'!
afficheFaits2
|lfaits rstr res wres|
lfaits:=(self faits keys reject: [:x|(x asString ) endsWith: '-regles'])collect:[:m|Array with: m with: (self  faits at:m )].
res :=lfaits collect: [ :x |(  x  last  )select: [ :y | y retire not ]   ].
lfaits := res  collect: [ :x | x   collect: [ :y | y afficheFait2 ]    ].
lfaits := lfaits reject: [ :x| x isEmpty ].
lfaits ifEmpty:[^ ''].
rstr:=ReadStream on: lfaits.
res:=WriteStream on: OrderedCollection new. 
[res nextPutAll: rstr next.rstr atEnd]whileFalse .
res :=res contents sort:   [:a :b |a asNumber <= b asNumber].
res :=ReadStream on: res.
wres :=WriteStream on: ''.
wres nextPut: Character  cr.
[ wres nextPutAll: res next .wres nextPut: Character  cr . res atEnd  ]whileFalse .
^ wres contents.
! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 10/26/2023 21:41'!
affichePrédicats
	| meth keys res |
	meth := ExpertRegle methodDictionary.
	keys := ExpertRegle methodDictionary keys.
	res:=keys
		collect: [ :x | 
			((meth at: x) name substrings: '>>') last , '->'
				, (meth at: x) comment asString , Character cr asString ].
			^res
		! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 6/28/2025 19:27:19'!
afficheRegle: ruleName 
	| r |
	r := ruleName asSymbol.
	r := regles
				at: r
				ifAbsent: [^ ruleName ,' absente'].
	^ r afficheRegle! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/14/2024 14:53:42'!
afficheRegles
	| res rstream |
ordreRegles isEmpty ifTrue:[ ^  'Pas de règles' ].
	res :=WriteStream on: ''.
rstream 	:= ReadStream on: ordreRegles .
		[ res   nextPutAll:  (self regles at:rstream next )afficheRegle . res nextPut:   Character cr. rstream atEnd]whileFalse .

	^ res contents.! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/13/2024 19:51:27'!
afficheReglesConcluants2:hyp
|res lregl antes array regle lv  lvars | 

res:=WriteStream on: ''.
lregl:= ReadStream on: (self reglesConcluants: hyp).
[	array := (lregl next).
	regle := array first.

	lv:=array last.
	lvars:=(regle verifRegle: lv).
	(lvars isEmpty )
	ifTrue: [lvars:=lv ]
	ifFalse: [lvars := lvars first     first].
	
	res cr.
	res nextPutAll: (regle nom). 
	
	antes:= ReadStream on: (regle ant). .
	[	res cr.
		res nextPutAll: (self faitAsString: (regle instancie: lvars fait: (antes	 next ) )).
			
		antes atEnd 	]whileFalse .
		res cr.
	lregl atEnd ]whileFalse .
^res contents .
! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/13/2024 19:58:25'!
afficheReglesConcluants:hyp
|res  antes array regle lv  lvars | 

res:=WriteStream on: ''.
lrgl:= ReadStream on: (self reglesConcluants: hyp).
[	array := (lrgl next).
	regle := array first.

	lv:=array last.
	lvars:=(regle verifRegle: lv).
	(lvars= false) 
	ifTrue: [lvars:=lv ]
	ifFalse: [
		lvars isEmpty ifTrue: [lvars:=lv]
		                     ifFalse: [lvars := lvars first     first]].
	
	res cr.
	res nextPutAll: (regle nom). 
	
	antes:= ReadStream on: (regle ant). .
	[	res cr.
		res nextPutAll: (self faitAsString: (regle instancie: lvars fait: (antes	 next ) )).
			
		antes atEnd 	]whileFalse .
		res cr.
	lrgl atEnd ]whileFalse .
^res contents .
! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 11/21/2024 16:31:22'!
afficheReglesDisplay
self	drgeo presenter expertDisplay:'Règles
' , self afficheRegles.
! !

!Expert methodsFor: 'accessing'!
afficheRègles
	^ self afficheRegles.! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/14/2024 12:46:06'!
affirme: just fait: fait
	| f nouvFait deja |
	f := fait.
	f isString
		ifTrue: [ f := ExpertList new: f ].
	((deja := faits
		at: (f first asSymbol)
		ifAbsent: [ "stw:= stw+1".
			nouvFait := ExpertFait new.
			nouvFait
				fait: f;
				just: just;
				no:stw.
				self addFait: nouvFait.
			"(affirmations includes: nouvFait)
				ifFalse: [ affirmations add: nouvFait ]."
			trouve := true.
			^ true ]) select: [ :t6 | t6 fait = f ])
		ifEmpty: [ nl:= nl+1.
			nouvFait := ExpertFait new.
			nouvFait
				fait: f;
				just: just;
				no:stw.
			self addFait: nouvFait.
			(affirmations includes: nouvFait)
				ifFalse: [ affirmations add: nouvFait ].
			trouve := true.
			^ true ].
	deja
		ifNotEmpty: [ deja
				do: [ :x | 
					x retire: false.
					^ true ] ].
	^ false! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/14/2024 12:48:39'!
affirme: just fait: fait vars: lVars 
	| f nouvFait   args deja|
	f := fait .
	f
		isEmpty ifTrue:  [^ false].
	(f isString)
		ifTrue: [f := ExpertList new: f].
	(deja:=(faits
		at: f first asSymbol
		ifAbsent: [
				
	 (((f first )asString )endsWith: ':' )
		ifTrue: [args := f allButFirst copyList  .
			args add: lVars.
			(self regles  asArray first) perform: (f first  , 'vars:') asSymbol withArguments: args asArray . ^true].

			nouvFait := ExpertFait new.
			"stw:= stw+1."
			nouvFait fait: f;
				 just: just;
				 lv: lVars;
				no:stw.
			self addFait: nouvFait.

			deductions add: nouvFait.

			trouve := true.
			^ true])
select: [:t7 | t7 fait = f])
		ifEmpty: [
			( f first last =$:)
		ifTrue: [args := f allButFirst.
			args add: lVars.
			self perform: (f first , 'vars:') copy asSymbol withArguments: args asArray. ^true].

			nouvFait := ExpertFait new.
			nl:= nl+1.
			nouvFait fait: f;
				 just: just;
				 lv: lVars;
				no:stw.
			self addFait: nouvFait.
		
			deductions add:  nouvFait.

			trouve := true.
			^ true].
 	retablit ifTrue: 	[deja ifNotEmpty: [deja do:[:x|x retire:false.deductions add: x  ]]].
	^ false! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 11/30/2024 14:43:02'!
affirmeFaits: aText
|nf|
nf := self affirmeFaits: 'énoncé' faits: aText.
^ nf size asString, ' faits affirrmés.'
! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 11/8/2024 13:35:43'!
affirmeFaits: just faits: aText 

 	^(self makeFactCollectionFromString:  aText) collect: [:t|self affirme: just fait: t asString].
! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 9/15/2020 10:23'!
ajouteNoms
|  s index x |
self  do:[:m|s:=''.((((m name )='')or: [ ' '  = m name])or:(m name)isNil)
	ifTrue: [index:=index+1. x:=((m  asString  findTokens: #($ $( $) ))first),(index asString) .m name:x]
	 ifFalse: [x:=m name].
	x ifNil: [ x:='' ]].
! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 11/19/2024 18:43:00'!
ajouteNoms:pool
|  s index x |
index :=0.
x :=''.
pool  do:[:m|s:=''.((((m name )='')or: [ ' '  = m name]) or:(m name)isNil)
	ifTrue: [index:=index+1. x:=((m  asString  findTokens: ' )(' )first),(index asString) .m name:x]
	 ifFalse: [x:=m name].
	x ifNil: [ x:='' ]].
^pool.
! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/13/2024 18:28:51'!
causeFaitNo: t1
.
	^ self causeFaitNo: t1 decal: '' detail: nil.! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 12/18/2023 15:32'!
causeFaitNo: n decal: dec
	| aff r jst res faitInstancie decal |
	n > affirmations size
		ifTrue: [ ^ n asString , 'Fait absent' ].
	aff := affirmations select: [ :t9 | t9 notNil ].
	aff := aff at: n.
	jst := aff just.
	res := WriteStream on: ''.
	r := regles
		at: jst asSymbol
		ifAbsent: [ res
				nextPut: Character cr;
				nextPutAll: dec;
				nextPutAll: n asString;
				nextPut: Character space;
				nextPutAll: (self faitAsString: aff fait);
				nextPutAll: ' par ';
				nextPutAll: jst.
			^ res contents ].
	res
		nextPut: Character cr;
		nextPutAll: dec;
		nextPutAll: n asString;
		nextPut: Character space;
		nextPutAll: (self faitAsString: aff fait);
		nextPutAll: '  par la regle ';
		nextPutAll: r nom;
		nextPut: Character cr.
	r com
		ifNotNil: [ res
				nextPutAll: r com;
				nextPut: Character cr ].
	res
		nextPutAll: ' car:';
		nextPut: Character cr.
	r ant
		do: [ :t9 | 
			faitInstancie := self instancie: t9 vars: aff lv.
			res
				nextPut: Character cr;
				nextPutAll: dec;
				nextPutAll: (self nF: faitInstancie) asString;
				nextPut: Character space;
				nextPutAll: faitInstancie printString ].
	^ res contents! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/24/2024 22:53:31'!
causeFaitNo: n decal: dec detail: det
	| aff r jst faitInstancie detail f lv resW ncom justF rgl impl ffinst |
	self initConstructions.
	f := self drgeo.
	detail := det.
	det isNil
		ifTrue: [ detail := true ].
	aff := affirmations select: [ :t9 | t9 notNil ].
	n > aff size
		ifTrue: [ ^ n asString , ' Fait absent' ].
	aff := aff at: n.
	jst := aff just.
	lv := aff lv.
	resW := WriteStream on: ''.
	r := regles
		at: jst asSymbol
		ifAbsent: [ drgeo ifNotNil: [ "self marquerLesObjets: n "].
			resW
				nextPut: Character cr;
				nextPutAll: dec;
				nextPutAll: n asString;
				nextPut: Character space;
				nextPutAll: (self faitAsString: aff fait).
				(#('DrGeo' 'énoncé') includes: aff just)
					ifTrue:[resW nextPutAll: ' par ']				
					ifFalse: [ resW nextPutAll: ' par la règle: '].
				resW nextPutAll: jst;
				nextPut: Character cr.
				(#('DrGeo' 'énoncé') includes: aff just) ifFalse: [ resW nextPutAll: (self regles at: (aff just ) asSymbol )com].
			^ resW contents.].
	drgeo ifNotNil: [" self marquerLesObjets: n "].
	resW
		nextPut: Character cr;
		nextPutAll: dec;
		nextPutAll: n asString;
		nextPut: Character space;
		nextPutAll: (self faitAsString: aff fait);
		nextPutAll: '  par ';
		nextPutAll: r nom;
		nextPut: Character cr.
	r com
		ifNotNil: [ resW
				nextPutAll: ' * ';
				nextPutAll: r com;
				nextPut: Character cr ].
	detail
		ifTrue: [ resW
				nextPutAll: ' car:';
				nextPut: Character cr.
			r ant
				do: [ :t9 | 
					faitInstancie := self instancie: t9 vars: aff lv.
					justF := ''.
					impl := '->'.
					ffinst := faitInstancie first.
					(ffinst printString includes: $:)
						ifTrue: [ self com
								ifTrue: [ impl := ''.
									justF := (ExpertRegle methodDictionary
										at: (ffinst , 'vars:') asSymbol) sourceCode lines at:2.
									justF ifNil: [ justF := '' ].
									justF := Character cr asString , '* '
										, justF allButFirst allButLast ]
								ifFalse: [ impl := ''.
									justF ifNil: [ justF := '' ] ] ]
						ifFalse: [ ncom := self nF: faitInstancie.
							ncom isNumber
								ifTrue: [ justF := rgl := (affirmations at: ncom) just ].
							((justF ~= '*' and: [ self com ]) and: [ rgl notNil ])
								ifTrue: [ justF := self regles at: rgl asSymbol ifAbsent: [ justF := rgl ].
									justF = rgl
										ifFalse: [ com
												ifFalse: [ justF := rgl ]
												ifTrue: [ justF := rgl , Character cr asString , '*' , justF com ] ].
									rgl ifNil: [ justF := rgl ] ] ].
					(faitInstancie first asString endsWith: ':')
						ifTrue: [ ncom := '-- ' ].
					faitInstancie first asString = '~'
						ifTrue: [ justF := ''.
							impl := '' ].
					resW
						nextPut: Character cr;
						nextPutAll: dec;
						nextPutAll: ncom asString;
						nextPut: Character space;
						nextPutAll: faitInstancie asString , impl , justF ] ].
	^ resW contents! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 7/30/2021 19:10'!
causesFaitNo: n  


^ self causesFaitNo: n dec: '' detail: true.! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 5/21/2020 23:02'!
causesFaitNo: n  dec:dec
|jsts f  decal|
decal:=WriteStream on:''.decal nextPutAll: dec; nextPutAll:  '  '.
decal:= decal contents.
jsts:=WriteStream on: ''.
jsts nextPutAll: (self causeFaitNo: n decal: dec).jsts nextPut: Character cr.
f := affirmations at: n.
(#('enonce' 'DrGeo') includes:   (f just))
ifTrue: [^jsts contents ].

( f nosAnt )do:[:m|  jsts nextPutAll: (self causesFaitNo: m dec: decal).jsts nextPut: Character space   ].
^jsts contents 
! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 7/30/2021 18:32'!
causesFaitNo: n  dec:dec detail: det
|jsts f  decal|
decal:=WriteStream on:'  '.decal nextPutAll: dec; nextPutAll:  '  '.
decal:= decal contents.
jsts:=WriteStream on: ''.
jsts nextPutAll: (self causeFaitNo: n decal: dec detail: det ).det ifTrue:[ jsts nextPut: Character cr].
f := affirmations at: n.
(#('enonce' 'DrGeo') includes:   (f just))
ifTrue: [^jsts contents ].
"det ifTrue: ["
( f nosAnt )do:[:m|  jsts nextPutAll: (self causesFaitNo: m dec: decal detail: det).jsts nextPut: Character space   ].
"]
ifFalse:[
( f nosAnt )do:[:m|  jsts nextPutAll: (self causeFaitNo: m  decal: decal detail:  det).jsts nextPut: Character space   ]]."

^jsts contents .
! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/9/2024 02:45:57'!
chargeRegles: desRegles
|rgl|
rgl :=desRegles.
(rgl endsWith: ':')ifFalse:[ rgl:=rgl,':'].
rgl:=rgl asSymbol.
((ExpertRegle class methodDict keys) includes: rgl) ifFalse:[^ 'Pas de règle : ',rgl].
(self stw includes: rgl) ifTrue:[^ 'Règle déjà installée: ',rgl].
ExpertRegle perform: (rgl    ) withArguments:{self}.
self stw add:rgl.
^'Règles : ',self stw asArray printString,' Installées.'.! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 7/11/2022 13:12'!
com 
^com! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 7/11/2022 13:12'!
com: aBoolean
com := aBoolean! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 7/21/2021 15:40'!
constructions
constructions ifNil: [ constructions := ExpertList new].
^ constructions! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 7/21/2021 15:26'!
constructions: cons
constructions ifNil: [ constructions := ExpertList new ].
constructions add: cons! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 2/3/2020 20:02'!
creeRegle: nom 
	| r  |
	nom = ''
		ifTrue: [^ self].

	(regles keys includes: nom asSymbol)
		ifTrue: [^ self regles at: nom asSymbol].
	self addRegle: (r := ExpertRegle new nom: nom).
	ordreRegles add: nom asSymbol.
	r expert: self.
	^ r! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/10/2025 02:37:51'!
deduis
| fst rgl fts  rr wrst rstr  |
deductions:=OrderedCollection new.
fts :=affirmations size.
"stw:=Time primMillisecondClock."

[self regles keysDo: [:r| (self regles at:r )faitsMeConcernants ].
self trouve:false.
fst:=self  faits keys reject: [:k|k endsWith: '-regles'].
rgl := fst collect: [:k| self faits at:(( k,'-regles')asSymbol)  ifAbsent:[ nil]].
rgl :=(self concat:rgl)reject:[:r|r ='temp' or: [ r isNil]].
rgl isEmpty ifTrue:[ ^ 'pas de règles applicables'].
rgl do:[:r|
	
(rr:=self regles at:(r  asSymbol    ) ifAbsent:[ nil ] )ifNotNil: [ rr verifRegle  ] ].trouve.]whileTrue.
deductions:= deductions asSet asOrderedCollection. 
((affirmations size)= fts )ifTrue: [ ^'
	rien de nouveau '].
^ '
	Déductions effectuées '.
 "
wrst :=WriteStream on: ''.
rstr := ReadStream on: deductions.
[  ( rstr atEnd) ifFalse:[ wrst nextPutAll: rstr next fait asString.wrst nextPut: Character cr].rstr atEnd ]whileFalse  .
^ wrst contents.	"! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 2/5/2020 12:20'!
drgeo 
^drgeo! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 2/5/2020 12:19'!
drgeo:drg
drgeo := drg! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 7/30/2024 20:55:45'!
enonceFait: faitOuString 
	self affirme: 'énoncé' fait: faitOuString! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 3/29/2013 18:36'!
enonceFaits: aText 
	(self	makeFactCollectionFromString:  aText)do:
		[:t|self enonceFait: t].
	! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 11/19/2024 17:33:26'!
executeCode
Compiler evaluate: self afficheCode! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 2/10/2020 12:32'!
expertBackward
|p rcl f  tool  l ln action res rstr  index|
p:=drgeo app presenter.
tool:=p tool.
p  expertDisplayStatus:  'Taper l''hypothèse  à vérifier.' .
f :=DrGWizardPage new textEntry:'Taper un but'.
f ifNil: [p  view	statusMessage: tool description .^p].
f ifEmpty: [p  view	statusMessage: tool description .^p].
f:= self  list:f.
rcl:=self reglesConcluant:  f.
ln:=self nomsRegles:rcl .
l:=self nomsComRegles:rcl .

 l:=(l  asOrderedCollection  ).
l addFirst: 'Annuler'  .

action:=(DrGWizardPage new chooseDropList:'                            choisir une règle                             '    list:l) .
(action='Annuler'  )ifTrue:  [ ^p ] .
(action isNil  )ifTrue:  [ ^p ] .
index:=(action asNumber).
res := WriteStream on: ''.
rstr:= ReadStream on: ( rcl at:(index ) )ant reverse.
[ res nextPut:( Character cr );nextPutAll:   ( rstr next)printString  . rstr atEnd] whileFalse.
p expertDisplay: action String: res contents.
! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 11/1/2019 22:34'!
explique:n
^self causeFaitNo: n! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 12/20/2023 18:32'!
faitTelque2: model
	| mod clef trouvés res lvar nouv oldCurs |
	lvar := IdentityDictionary new.
	mod := model.
	mod isList
		ifFalse: [ mod := ExpertList new: mod ].
	clef := mod first.
	(clef = #~ )	ifTrue: [ res := mod allButFirst ]
				ifFalse: 		
	[trouvés := self faits
		at: clef
		ifAbsent: [ self affirmations at: clef ifAbsent: [ ^ model , 'pas trouvé' ] ].

	"			nouv := ExpertFait new.
			nouv fait: mod.
			nouv just: 'Pas trouvé dans les faits'.
			nouv expert: self.
			^ nouv ]."
res := trouvés
				detect: [ :f | (self unifie: mod avec: f fait vars: lvar) ~= false ]
				ifNone: [ nouv := ExpertFait new.
					nouv fait: mod.
					nouv just: 'pas trouvé dans les affirmations'.
					nouv expert: self ] ].
	^ res! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/8/2024 21:40:40'!
faitTelque: f
	| faux l ind res |
	faux := false.
	l := f.
	f isEmpty
		ifTrue: [ ^ false ].
		$~ =  f first  ifTrue:  [ ^ f ].
	f isString
		ifTrue: [ l := self list: f ].
	(l first endsWith: ':')
		ifTrue: [ com
				ifTrue: [ ^ l asString , Character cr asString,
							((ExpertRegle methodDictionary
								at: (l first asString , 'vars:') asSymbol) sourceCode lines at:2) ]
				ifFalse: [ ^ l asString , Character cr asString ] ].
	res := self affirmations
		detect: [ :x | 
			ind := x.
			x fait = f ]
		ifNone: [ res := self affirmations
				detect: [ :m | m = (self faitTelque2: f) ]
				ifNone: [ ^ (affirmations indexOf: ind) asString , ' ' , f ] ].
	^ res afficheFait2! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 4/8/2013 16:54'!
faitsIssusDe:just
|res|
res:=''.
(self affirmations select: [:m|just =m just])do:[:r|res := res,'
', r afficheFait 	].
^res! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 5/14/2020 23:14'!
getRelationsAt: clef
|rels cl|
cl :=clef.
cl isSymbol ifFalse: [ cl := cl asSymbol].
(rels:= self relationsAt: cl)ifNil: [ rels := self initRelationsAt: cl].
^rels! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 11/11/2022 15:41'!
indTexte 
^ indtexte! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 11/11/2022 15:42'!
indTexte: txt
indtexte :=txt! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 5/1/2022 01:53'!
initConstructions

constructions ifNotNil:[ constructions do:[:x |
		(x isKindOf: DrGWrappedItem)ifTrue:[ self supprimerMathitem: x mathItem ].
		( Array = x class)ifTrue: [ (x first) style color:   x last]]].
constructions := ExpertList new. ! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/14/2024 12:20:37'!
initFaits
	self indTexte: nil.
	nl:=0.
	self initConstructions.
	faits := IdentityDictionary new.
	self supprimeMarquesRetire.
	affirmations := OrderedCollection new.
	self initRelations.
	"self couleurPoint: Color red."
	deductions := OrderedCollection .
	^'Base vide'! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/13/2024 19:43:51'!
initRegles
	regles := IdentityDictionary new.
	ordreRegles := OrderedCollection new.
	lrgl:=OrderedCollection new.
	stw :=OrderedCollection new.
	^'règles supprimée'! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 5/14/2020 14:46'!
initRelations
relations:=IdentityDictionary new .! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 3/25/2023 14:19'!
initRelationsAt: clef
	| cl res |
	cl := clef asSymbol.
	res := Set new.
   relations at: cl put: Set new.
	! !

!Expert methodsFor: 'accessing'!
initRègles
	self initRegles.
	^ 'règles supprimée'.! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/13/2024 19:44:40'!
lgl
^lrgl! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/11/2025 23:30:08'!
lisFigure
self lisFigure:( self drgeo).
^'Figure lue.'! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 8/26/2024 17:45:53'!
lisFigure:fig
self lisFigureDrgeo: fig.	! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 8/12/2024 15:44:54'!
lisFigureDrgeo
	| pool s x px p index sub nb pnts pnts2 |
	"f := DrGeoFigure viewLess.
	f drgeo: self drgeo."
	.
	sub :=   drgeo   drawable submorphs		 	select: [ :m | m isKindOf: DrGMorph  ]. 

	"sub do: [ :i | i  mathItem name: i label ]."
	index := 0.
	x := ''.
	pool := (  sub select: [  :cot| cot style hidden = false ]) collect: [ :cost | cost mathItem ].
	pool := pool select: [ :it | it exist ].
	self ajouteNoms: pool.
	
	pool
		do: [ :m | 
			s := ''.
			s := s , m className asString , ' ' , m name.
			(m isKindOf: DrGTextItem)
				ifTrue: [ s := s , ' ' , m text ].
			(m isKindOf: DrGPolygonRegularItem)
				ifTrue: [ pnts := pool
						select:
							[ :pt | DrGPointOncurveItem = pt class or: [ DrGPointFreeItem = pt class ] ].
					pnts2 := ExpertList
						new:
							(pnts
								collect:
									[ :ptn | (pnts detect: [ :i | ptn point = i point ] ifNone: [  ]) name ])
								allButFirst.
					s := s , ' ' , '[ ' , pnts2 asString , ' ]' ].
			(m isKindOf: DrGPolygonNptsItem)
				ifTrue: [ s := s , ' ' , (self polySommets: m name) ].
			(m isKindOf: DrGAngleItem)
				ifTrue: [ nb := m degreeAngle round: 3.
					nb = nb asInteger
						ifTrue: [ nb := nb asInteger ].
					s := s , ' ' , nb asString ]
				ifFalse: [ (m isKindOf: DrGValueItem)
						ifTrue: [ nb := m valueItem.
							nb asInteger = nb
								ifTrue: [ nb := nb asInteger ].
							s := s , ' ' , nb asString ] ].
			p := m parents.
			(m isKindOf: DrGPolygonNptsItem)
				ifTrue: [ p := nil ].
			p
				ifNotNil: [ px := ''.
					p
						do: [ :n | 
							n isNumber
								ifFalse: [ (n name = '' or: n name isNil)
										ifTrue: [ index := index + 1.
											px := (n asString findTokens: #($  $( $))) first
												, index asString.
											n name: px ]
										ifFalse: [ px := n name ] ].
							s := s , ' ' , px.
							(n isKindOf: DrGAngleItem)
								ifTrue: [ nb := m degreeAngle round: 3.
									nb = nb asInteger
										ifTrue: [ nb := nb asInteger ].
									s := s , ' ' , nb asString ]
								ifFalse: [ (n isKindOf: DrGValueItem)
										ifTrue: [ nb := n valueItem.
											nb asInteger = nb
												ifTrue: [ nb := nb asInteger ].
											s := s , ' ' , nb asString ] ] ] ].
			self affirme: 'Drgeo' fait: s ].
	^ pool! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/29/2025 06:02:33'!
lisFigureDrgeo: w
	| pool s x px p index nb f pnts pnts2 |
	"f := DrGeoFigure viewLess.
	f drgeo: self drgeo."
	pool := w domain factory pool.
	"lbmorphs := w area submorphs select: [ :i | DrGLabelMorph = i class ].
	lbmorphs do: [ :i | i costume mathItem name: i contents ]."
	index := 0.
	x := ''.
	self ajouteNoms: pool.
	"pool :=( w app costumes select: [  :cost| cost style hidden = false ]) collect: [ :cost | cost mathItem ].
	pool := pool select: [ :it | it exist ]."
	pool
		do: [ :m | 
			s := ''.
			s := s , m className asString , ' ' , m name.
			(m isKindOf: DrGTextItem)
				ifTrue: [ s := s , ' ' , m text asString ].
			(m isKindOf: DrGPolygonRegularItem)
				ifTrue: [ pnts := pool
						select:
							[ :pt | DrGPointOncurveItem = pt class or: [ DrGPointFreeItem = pt class ] ].
					pnts2 := ExpertList
						new:
							(pnts
								collect:
									[ :ptn | (pnts detect: [ :i | ptn point = i point ] ifNone: [  ]) name ])
								allButFirst.
					s := s , ' ' , '[ ' , pnts2 asString , ' ]' ].
			(m isKindOf: DrGPolygonNptsItem)
				ifTrue: [ s := s , ' ' , (self polySommets: m name) ].
			(m isKindOf: DrGAngleItem)
					ifTrue: [ nb := m degreeAngle roundTo: 3.
					nb = nb asInteger
						ifTrue: [ nb := nb asInteger ].
					s := s , ' ' , nb asString ]
				ifFalse: [ (m isKindOf: DrGValueItem)
						ifTrue: [ nb := m valueItem.
							nb asInteger = nb
								ifTrue: [ nb := nb asInteger ].
							s := s , ' ' , nb asString ] ].
			p := m parents.
			(m isKindOf: DrGPolygonNptsItem)
				ifTrue: [ p := nil ].
			p
				ifNotNil: [ px := ''.
					p
						do: [ :n | 
							n isNumber
								ifFalse: [ (n name = '' or: n name isNil)
										ifTrue: [ index := index + 1.
											px := (n asString findTokens: #($  $( $))) first
												, index asString.
											n name: px ]
										ifFalse: [ px := n name ] ].
							s := s , ' ' , px.
							(n isKindOf: DrGAngleItem)
								ifTrue: [ nb := m degreeAngle round: 3.
									nb = nb asInteger
										ifTrue: [ nb := nb asInteger ].
									s := s , ' ' , nb asString ]
								ifFalse: [ (n isKindOf: DrGValueItem)
										ifTrue: [ nb := n valueItem.
											nb asInteger = nb
												ifTrue: [ nb := nb asInteger ].
											s := s , ' ' , nb asString ] ] ] ].
			self affirme: 'DrGeo' fait: s ].
	^ pool! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 6/30/2019 09:16'!
lisRegle: nom com: c
|r|
(regles keys includes: nom asSymbol)
		ifTrue: [r:= regles at: nom asSymbol]
		ifFalse: [^ self].
r com: c.! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 12/1/2024 21:48:30'!
lisRegle: nom si: ant alors: conc
|r|
r:=self creeRegle: nom.
r antecedents: ant.
r concl: conc.
^'Règle ''',nom,''' définie'! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 12/1/2024 21:46:07'!
lisRegle: nom si: ant alors: conc com:c
|r|
r:=self creeRegle: nom.
r antecedents: ant.
r concl: conc.
r com: c.
^'Règle ''',nom,''' définie'
! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 2/23/2013 12:37'!
lregles
^lregles! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 2/23/2013 12:39'!
lregles:r
lregles:=r! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/13/2024 18:55:21'!
marquerLesObjets: nofait
|fct res fpool|
fct:=self affirmations at: nofait. 
fpool :=self drgeo domain factory pool.
self initConstructions .
res:=OrderedCollection new. fct fait do:[:t|(t isList)
	ifTrue:[ t collect: [  :x|res add:x ]  ]
	ifFalse:[ res add:t]].	
res :=res asSet.
  res :=res collect:[:x|fpool detect:[ :c|x = c  ] ifNone:[nil]].

res:=res asOrderedCollection select: [ :x|x notNil].
res do:  [ :x|self constructions add: (Array with: x with: x style color ).
	x style color: Color cyan. ].

! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/9/2024 03:34:12'!
mesRegles
^self stw asArray
! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 10/14/2021 20:50'!
modelesFaits
|keys f v n m|
keys:=((self faits) keys   ) reject:[:i|i asString  endsWith: '-regles'].
f:=OrderedCollection new.
keys collect:[:i|(self faits at: i  )   do: [:j|f add: j] ].
f :=(f collect:[:j|Array with: j  fait first with: j fait size])asSet.
f:=f collect: [:j|  v:=' ' .n:=0. m:=(j last )asInteger . (m -1)timesRepeat: [ n:=n+1.v:=v,' ?x' , n asString ].((j first),v) asString ].
v:=''.
f:=f asSortedCollection: [ :a :b| a < b.].
f do:[:i|v:=v,i,'
'].
^'
',v  ! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 8/2/2024 00:53:40'!
modèlesQuestions
	| keys f v n m |
	keys := self faits keys
		reject: [ :i | i asString endsWith: '-regles' ].
	f := OrderedCollection new.
	keys collect: [ :i | (self faits at: i) do: [ :j | f add: j ] ].
	f := (f collect: [ :j | Array with: j fait first with: j fait size ])
		asSet.
	f := f
		collect: [ :j | 
			v := ' '.
			n := 0.
			m := j last asInteger.
			m - 1
				timesRepeat: [ n := n + 1.
					v := v , ' ?x' , n asString ].
			(j first , v) asString ].
	v := ''.
	f := f asSortedCollection: [ :a :b | a < b ].
	f
		do: [ :i | 
			v := v , i
				,
					'
' ].
	^'
Modèles de questions.
', v.! !

!Expert methodsFor: 'accessing'!
ordreRegles
	^ ordreRegles! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/13/2024 19:47:33'!
ordreRegles: lrgl1
	ordreRegles := lrgl1! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 3/7/2013 16:00'!
ouvreTranscript
"Transcript := TranscriptStream new.
Transcript openLabel: 'Transcript'."! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 5/2/2022 17:16'!
polySommets: pol 
|pool   poly  pointsSur pointsSurPoly som|
pool:=self drgeo app domain factory pool.
poly :=pool detect:[:x |(x name)=pol].
"pointsSur :=pool select: [:x| DrGPointOncurveItem =x class].
pointsSurPoly :=pointsSur select: [:n|pol =((n parents first )name) ] thenCollect: [:x|x name].
pointsSurPoly addFirst:(poly parents at:2) name."
pointsSurPoly := poly parents collect:[:x|x name].
som:= ' [ ',( self  colAsString:  pointsSurPoly),' ]'.
^som.! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 5/5/2025 22:03:52'!
pressePapier
^ self drgeo presenter expertPressePapier! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 4/25/2022 20:23'!
prouve: aFait
|f1  res n tr|
f1 := self makeList: aFait.
tr:=false.
n:=0.
res:= self affirmations select:  [:f|tr ifFalse:[ n:=n +1].(f1=f fait) ifTrue: [tr:=true].(f1=f fait) ].

^res collect: [:x |n asString , ' ',x fait asString , 'Par la regles: ',x just].
! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 11/1/2024 00:55:58'!
reglesChargées
^(self regles keys collect:[:k|( ((self regles at:k)name)       substringsSeparatedBy: $-) first]) asSet sorted! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 2/3/2020 21:09'!
reglesConcluant: aStringOrList

|r|
r:=ExpertRegle new.
r expert:self .
^r reglesConcluant: aStringOrList.! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 4/25/2022 18:49'!
reglesConcluants:conc
|c lvars res|
lvars :=IdentityDictionary new.
c:=conc. 
 res :=self regles values select:   [:r|(self unifie: (r concl) avec:  c vars: lvars)].
	^res
! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/9/2024 02:25:00'!
reglesPrédéfinies
ExpertRegle class methodDict keys! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 11/24/2020 20:40'!
retablit
^ retablit! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 11/24/2020 20:54'!
retablit: aBoolean
retablit :=  aBoolean.
^retablit.! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 12/15/2021 14:22'!
retireFait: aFait
	| f res |
	
	f := aFait.
	f isString
		ifTrue: [ f := ExpertList new: f ].
	res := self affirmations
		detect: [ :m | m fait = f ]
		ifNone: [ ^ false ].
	self
		affirme: 'retrait'
		fait: f printString , 'retire'
		vars: IdentityDictionary new.
	res retire: true.
	^ true! !

!Expert methodsFor: 'accessing'!
règlesChargées
	^ stw.! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/9/2024 02:28:24'!
règlesPrédéfinies
^ExpertRegle class methodDict keys sort! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 7/28/2025 00:20:26'!
stringVerListe: str
^ ExpertList new: str! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 7/28/2025 00:24:20'!
stringVersListe: str
^ ExpertList new: str! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 5/3/2021 00:42'!
stw
^stw! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 5/3/2021 00:41'!
stw: watch
stw:=watch! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 4/16/2013 12:26'!
supprimeMarqueRetire:aFait
|f|
f:=aFait .
f isString ifTrue: [f:=ExpertList new:f].
(self affirmations detect: [:m|(m fait)= f ])retire: nil.! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 4/16/2013 12:02'!
supprimeMarquesRetire
self  affirmations do:[:m|m retire:nil]! !

!Expert methodsFor: 'accessing' stamp: 'pad 1/16/2012 13:19'!
supprimeRegle: rNom 
	| r |
	r := regles
				at: rNom asSymbol
				ifAbsent: [^ self].
	regles removeKey: rNom asSymbol.
	ordreRegles remove: rNom asSymbol.
	^ r! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 7/21/2021 15:47'!
supprimerMathitem: aMathItem
self drgeo domain deleteMathItem: aMathItem! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/27/2024 19:06:46'!
titre
titre ifNil:[titre ='Expert journal'].
^titre! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 10/27/2024 18:42:36'!
titre:  t
titre :=t! !

!Expert methodsFor: 'accessing' stamp: 'pad 1/24/2012 22:31'!
toutVerifier
|aVer|
aVer:=Set new.
(affirmations select:  [:t|(t regles )notNil ] thenCollect:[:f| f regles])do:[:m|m do: [:r|aVer add: r asSymbol ]].
^aVerifier :=aVer .

! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 3/7/2013 16:00'!
trace: anObject
"Transcript show: anObject ; cr.
^ anObject
"! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/4/2025 20:23:43'!
verifieCondition: cond
	| flse r res resStr ccr wStr rr rr2 c inst dic |
	flse := false.
	cond = '' ifTrue: [ ^'selection vide'].
	dic := IdentityDictionary new.
	r:=self creeRegle: 'temp'.
	r antecedents: cond asString.
	c :=r ant.
	r expert: self.
	
	res := r verifAntecedants.
	res = false
		ifTrue: [ ^ 'faux' ].
	"(res includes: flse )ifTrue: [ ^'faux' ]."
	(1 = res size and: [ res first = flse ])
		ifTrue: [ ^ 'faux' ].
	res := res
		reject: [ :x | x = flse ].
	
	res :=res 	collect: [ :f | 
			c
				collect: [ :con | 
					r concl: con.
					inst := r instancie: f.
					inst = f
						ifTrue: [ inst := false ].
					inst ] ].
	res := res reject: [ :x | x = flse ].
	res
		ifEmpty: [ ^ '
faux' ].
	resStr := ReadStream on: res.
	ccr := Character cr.
	wStr := WriteStream on: ''.
	wStr nextPut: ccr.
	[ rr := resStr next.
	rr ifNil: [ rr := c ].
	rr2 := ReadStream on: rr.
	[ c := self faitTelque: rr2 next asString.
	(c ~= false and: [ c ~= nil ])
		ifTrue: [ wStr nextPutAll: c.
			rr size > 1
				ifTrue: [ wStr nextPut: ccr ] ].
	rr2 atEnd ] whileFalse.
	wStr nextPut: ccr.
	resStr atEnd ] whileFalse.
	"wStr nextPut: ccr."
	^ wStr contents! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/8/2024 18:55:57'!
verifieFait: t1 vars: lvars
	| t2 t3 t4 vars2 |
	t2 :=t1.
	t1 isString
		ifTrue: [t2 := ExpertList new: t1 ].
	t1 class=ExpertFait
		ifTrue: [t2 := ExpertList new: t1 fait ].
	t3 := self faits at:( (t2 first)  asSymbol) ifAbsent: [ ^ OrderedCollection new ].
	t3 := t3 reject: [ :m | m retire ].
	
	t4 := t3
		collect: [ :t5 | 
			vars2 := lvars copy.
			Array
				with: ((self unifie: t2 avec: t5 fait vars: vars2)ifTrue: [ vars2 ]  ) with: t5].
	t4 := t4 reject: [ :t5 | t5 first == nil ].
	
	^ t4
	! !

!Expert methodsFor: 'accessing' stamp: 'DrGeoUser 12/1/2022 14:16'!
verifieFaits
	| f res st |
	f := self makeFactCollectionFromString: self modèlesQuestions.
	res := f
		collect: [ :t | Array with: t with: (self  verifieFait: t) ].
	"res collect:  [:m|m last afficheFait ]."
	st := ''.
	res
		do: [ :s | 
			st := st
				,
					'
	' , (self colAsString: s first)
				,
					'
	' , (self colAsStringWithCr: s last) ].
	^ st! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/4/2025 21:43:44'!
vérifieCondition2: arg1

	| temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp13 |
	temp2 := false.
	arg1 = '' ifTrue: [ ^ 'selection vide' ].
	temp10 := IdentityDictionary new.
	temp3 := self creeRegle: 'temp'.
	temp3 antecedents: arg1 asString.
	temp11 := temp3 ant.
	temp3 expert: self.
	temp4 := temp3 verifAntecedants.
	temp4 = false ifTrue: [ ^ 'faux' ].
	(1 = temp4 size and: [ temp4 first = temp2 ]) ifTrue: [ ^ 'faux' ].
	temp4 := temp4 reject: [ :argm10_14 |
		argm10_14 = temp2 ].
	temp4 := temp4 collect: [ :argm11_14 |
		temp11 collect: [ :argm11_15 |
			temp3 concl: argm11_15.
			temp13 := temp3 instancie: argm11_14.
			temp13 = argm11_14 ifTrue: [ temp13 := false ].
			temp13 ]].
	temp4 := temp4 reject: [ :argm12_14 |
		argm12_14 = temp2 ].
	temp4 ifEmpty: [ ^ '
faux' ].
	temp5 := ReadStream on: temp4.
	temp6 := Character cr.
	temp7 := WriteStream on: ''.
	temp7 nextPut: temp6.
	[
	temp8 := temp5 next.
	temp8 ifNil: [ temp8 := temp11 ].
	temp9 := ReadStream on: temp8.
	[
	temp11 := self faitTelque: temp9 next asString.
	(temp11 ~= false and: [ temp11 ~= nil ]) ifTrue: [
		temp7 nextPutAll: temp11.
		temp8 size > 1 ifTrue: [ temp7 nextPut: temp6 ]].
	temp9 atEnd ] whileFalse.
	temp7 nextPut: temp6.
	temp5 atEnd ] whileFalse.
	temp7 nextPut: temp6.
	^ temp7 contents.! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/4/2025 22:21:14'!
vérifieCondition: cond 
| f v |

f :=self verifieCondition: cond. 
(#( 'faux' false ) includes: f  ) ifTrue: [ ^false ].
	
v := self vérifieConditionVar: cond.
^f,v.! !

!Expert methodsFor: 'accessing' stamp: 'drgeo 9/4/2025 22:09:07'!
vérifieConditionVar: cond 
	| flse r res dic c rep s|
	(cond ='') ifTrue:[^'??'].
	flse := false.
	dic := IdentityDictionary new.
	r :=	self creeRegle: 'temp'. 
	r antecedents:cond. 
	c:=r ant.
	res := r  verifAntecedants. 
	res class =OrderedCollection ifTrue:[s:= Character cr asString.
       res collect:[:m|  s:=s, Character  cr asString .m keys collect:[:k|s:=s,k ,'->', (m at: k ) ,' '] ].
       ^ s].
^false
	
	"(res includes: flse )ifTrue: [ ^'faux' ]."

	"res :=Array with: (res collect:[:fct| (self instancie: fct fait: c first)]) with:res.
	  rep:='
	'.
	res 
	do:[:m|rep :=rep, m first asString,Character cr asString,(		m last asString ),Character cr asString]. 
	 
	^rep.
"

	"(1 = res size and: [ res first = flse ])
		ifTrue: [ ^ 'faux' ].
	res := res 
		reject: [ :x | x = flse ].

	^​ res.
				
	^rep.
		End of block expected ->ifEmpty: [ ^ '
faux' ].


 
	resStr := ReadStream on: res.
	ccr := Character cr.
	wStr := WriteStream on: ''.
	wStr nextPut: ccr.
	[ rr := resStr next.
	rr ifNil: [ rr := c ].
	rr2 := ReadStream on: rr.
	[ c := self faitTelque: rr2 next asString.
	(c ~= false and: [ c ~= nil ])
		ifTrue: [ wStr nextPutAll: c.
			rr size > 1
				ifTrue: [ wStr nextPut: ccr ] ].
	rr2 atEnd ] whileFalse.
	wStr nextPut: ccr.
	resStr atEnd ] whileFalse.
	wStr nextPut: ccr.
	^ wStr contents"! !

!Expert methodsFor: 'initialize' stamp: 'drgeo 9/19/2024 13:27:25'!
Display:wTitle String: aString
	|  t2 | 
	( WorkspaceWindow allInstances includes:wTitle )
		ifFalse:[t2 := self drgeo presenter expertInitJournal ].
(t2 model )actualContents: t2 model  actualContents,' ',aString.
	

	! !

!Expert methodsFor: 'initialize' stamp: 'drgeo 11/15/2024 16:26:40'!
apppfficheCode
((self affirmations collect:[:x|x fait] )select:[:y|y first beginsWith:'f'] )! !

!Expert methodsFor: 'initialize' stamp: 'drgeo 5/5/2025 23:28:02'!
initialize
	affirmations :=''.
	self affichage: nil.
	self initRegles.
	self initFaits.
	self initRelations .
	ExpertRegle interface: self.
	retablit := true.
	com:=true.self.
	nl:=0.​
	stw :=OrderedCollection new.
	stw add: #interface.
	vars := IdentityDictionary new.! !

!Expert methodsFor: 'relations' stamp: 'drgeo 10/13/2024 20:07:49'!
lrgl
^lrgl! !

!Expert methodsFor: 'relations' stamp: 'drgeo 10/13/2024 20:08:38'!
lrgl: r
lrgl :=r! !

!Expert methodsFor: 'relations' stamp: 'DrGeoUser 5/14/2020 21:52'!
relations
^relations! !

!Expert methodsFor: 'relations' stamp: 'DrGeoUser 3/25/2023 23:01'!
relationsAt: clef
	| rel cl |
	cl := clef asSymbol.
	rel := relations at: cl ifAbsent: [ ^Set new].
	^ relations at: cl! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 12/21/2021 00:32'!
addFait: aFait
	| nouvFait faitsAtKey |
	(aFait isKindOf: String)
		ifTrue: [ (nouvFait := ExpertFait new) fait: (ExpertList new: aFait) ].
	(aFait isKindOf: Collection)
		ifTrue: [ (nouvFait := ExpertFait new) fait: aFait ].
	(aFait isKindOf: ExpertFait)
		ifTrue: [ nouvFait := aFait ].
	faitsAtKey := faits
		at: nouvFait key
		ifAbsent: [ faitsAtKey := OrderedCollection new ].
	nouvFait expert: self.
	faitsAtKey add: nouvFait.
	faits at: nouvFait key put: faitsAtKey.
	affirmations add: nouvFait.
	^ aFait.! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 5/12/2020 17:31'!
addRegle: uneRegle 
uneRegle faitsMeConcernants0 .
	self regles at: uneRegle name asSymbol put: uneRegle.
	uneRegle expert: self! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 10/24/2012 10:58'!
afficheWs:m
	"comment stating purpose of message"

	| ws|
	ws := (World submorphs
				select: [:w | w isKindOf: SystemWindow])
				select: [:t | 'affirmations Expert' = t label].
	ws isEmpty
		ifTrue: [ws := Workspace new open.
			ws contents: m.
			ws label: 'affirmations Expert']
		ifFalse: [ws := World submorphs.
			ws := ws
						select: [:w | w isKindOf: SystemWindow].
			ws := ws
						select: [:c | 'affirmations Expert' = c label].
			ws := ws first.
			ws model contents: m].! !

!Expert methodsFor: 'tools'!
affirmations
	^ affirmations! !

!Expert methodsFor: 'tools' stamp: 'pad 1/16/2012 13:56'!
affirmations: lFaits 
	affirmations := lFaits! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 12/21/2021 00:18'!
affirme: aStringOrFait 
	| aFait faitCourant |
	aFait := aStringOrFait.
	(aFait isKindOf: String)
		ifTrue: [aFait := self makeWordCollection: aFait].
	((faits
		at: aFait first asSymbol
		ifAbsent: [faitCourant := ExpertFait new.
			faitCourant fait: aFait.
			self addFait: faitCourant.
			"affirmations add: faitCourant."
			trouve := true.
			^ true])
		select: [:t5 | t5 fait = aFait])
		ifEmpty: [faitCourant := ExpertFait new.
			faitCourant fait: aFait.
			self addFait: faitCourant.
			affirmations add: faitCourant.
			trouve := true.
			^ true].
	^ false! !

!Expert methodsFor: 'tools' stamp: 'drgeo 9/16/2024 18:11:13'!
comment
^ self sourceCode! !

!Expert methodsFor: 'tools' stamp: 'drgeo 9/16/2024 18:26:04'!
comment: method
 ^(self makeFactCollectionFromString: method sourceCode )at:2! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 4/21/2020 13:58'!
couleurPoint: aColor
|points|
drgeo ifNotNil:[points :=self drgeo app costumes select:[:x|x class = DrGPointCostume ].
points do:[:x| x style color:  aColor]].

! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 2/21/2022 12:40'!
deduire
^Cursor wait showWhile: [ self deduis ].! !

!Expert methodsFor: 'tools' stamp: 'pad 2/5/2012 22:40'!
faitAsString: aFait 
((aFait class)==ExpertFait )
ifTrue:[^ super faitAsString: aFait fait].
^ super faitAsString: aFait! !

!Expert methodsFor: 'tools'!
faits
	^ faits! !

!Expert methodsFor: 'tools'!
faitsAsArray
	^ (faits keys
		collect: [:t1 | (faits at: t1 asSymbol)
				collect: [:t2 | t2]]) asArray! !

!Expert methodsFor: 'tools' stamp: 'pad 1/17/2012 17:47'!
faitsAt: key 
	^ faits
		at: key asSymbol
		ifAbsent: [^ nil]! !

!Expert methodsFor: 'tools'!
initVars
	vars := IdentityDictionary new.
	^ vars! !

!Expert methodsFor: 'tools' stamp: 'drgeo 1/23/2025 11:48:56'!
instancie: lVars fait: f
	| res fait |
	fait :=ExpertList new: f.
	(lVars isKindOf: IdentityDictionary)
		ifFalse: [ ^ f ].
	res := fait do: [ :t4 | self valeur: t4 vars: lVars ].
	^ res! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 12/8/2021 03:43'!
instancieNum: lVars fait: f
	| res n |
	n:=0.
	lVars ifNil: [ ^ f ].
	(lVars isKindOf: IdentityDictionary)
		ifFalse: [ ^ f ].
	res := f
		do:
			[ :t4 | (self floatString: t4)  ifTrue: [n:=n+1.'?&',n asString   ] 
				ifFalse: [self valeur: t4 vars: lVars ]
			]	.
	^ res! !

!Expert methodsFor: 'tools' stamp: 'drgeo 9/23/2024 01:53:15'!
listeSelCom: aCategory
| lst  s |
lst := (ExpertRegle methodDict asOrderedCollection) .
lst :=lst select: [:x|(x category)= aCategory] .

lst :=  lst collect: [:x|Array with:x selector asString with:((x sourceCode lines at:2) withoutEnclosing:$")   ].  

s:=''.	
lst  do:[:x|s:=s,x first,' ',(x last,  Character cr asString)]! !

!Expert methodsFor: 'tools' stamp: 'drgeo 9/23/2024 01:59:27'!
listeSelCom: aCategory class:aClass
| lst  s |
lst := (aClass methodDict asOrderedCollection) .
lst :=lst select: [:x|(x category)= aCategory] .

lst :=  lst collect: [:x|Array with:x selector asString with:((x sourceCode lines at:2) withoutEnclosing:$")   ].  

s:=''.	
^lst  do:[:x|s:=s,x first,' ',(x last,  Character cr asString)]! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 8/15/2014 14:22'!
nF: aFait
|f  aff|
aff:=
f:=ExpertList new faitAsList: aFait.
(f first ='~')ifTrue: [f:=f allButFirst ].

	^ affirmations
		indexOf: (affirmations
				detect: [:t2 | (f  faitAsList: t2 fait)
						= f]			
				ifNone: [^ '--'])
				
	! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 6/15/2021 02:34'!
polySommets
|subs  poly polyName  som|
subs:=self drgeo area submorphs.
poly :=subs detect:[:x| DrGPolygoneMorph =x class].
polyName := poly costume name.
som:=ExpertList new: (poly costume mathItem parents collect:[:x | x name]).

^ '[  ', som printString ,' ]' .! !

!Expert methodsFor: 'tools'!
regles
	^ regles! !

!Expert methodsFor: 'tools' stamp: 'pad 1/17/2012 18:07'!
regles: r 
	regles := r! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 12/22/2021 02:25'!
reglesConcluantFait: f
	| r |
	^ self regles keys
		select: [ :x | 
			(self
				unifie: f
				avec: (r := self regles at: x asSymbol) concl
				vars: IdentityDictionary new) ]
				! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 11/17/2020 10:40'!
retablitFait: aFait
|f   res|

f:=aFait .
f isString ifTrue: [f:=ExpertList new:f].
res:=(self affirmations detect: [:m|(m fait)= f ]ifNone: [ ^false]).
self affirme: 'rétabli' fait: f  printString  vars: IdentityDictionary new.
res retire: true.
^true.! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 11/17/2020 16:02'!
retablitFait: aFait regle:name
|f   res|

f:=aFait .
f isString ifTrue: [f:=ExpertList new:f].
res:=(self affirmations detect: [:m|(m fait)= f ]ifNone: [ ^true]).
self affirme:('retablit par ' , name) fait: res fait printString ,' retabli' vars: IdentityDictionary new.
res retire: nil.
^true.! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 2/21/2022 15:42'!
retireFait: aFait regle: name
	| f res |
	f := aFait.
	f isString
		ifTrue: [ f := ExpertList new: f ].
	res := self affirmations
		detect: [ :m | m fait = f ]
		ifNone: [ ^ false ].
	self
		affirme:  name
		fait: f printString , ' retire'
		vars: IdentityDictionary new.
	res retire: true.
	^ true! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 4/1/2019 12:47'!
rounded: val  dec: n
|p|
p:=10 raisedTo:  n.
^(((val *p)  rounded)/p) .
 

	"comment stating purpose of message"

	! !

!Expert methodsFor: 'tools' stamp: 'pad 1/17/2012 18:08'!
setFaits: lFaits 
	faits := lFaits! !

!Expert methodsFor: 'tools' stamp: 'drgeo 10/13/2024 19:48:07'!
setRegles: lRegl
	regles := lRegl! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 4/6/2019 01:32'!
standard
|k cncl m|
k:=self regles keys.
cncl:=k collect:[:i|(regles at:i )concl].
^cncl collect:[:z|m:=0. z  collect:[:i|(i beginsWith: '?' )ifTrue:[m:=m+1.('?'  , (m asString  )) ]ifFalse:[i asString ] ]].! !

!Expert methodsFor: 'tools'!
trouve
	^ trouve! !

!Expert methodsFor: 'tools' stamp: 'pad 1/17/2012 18:09'!
trouve: aBoolean 
	trouve := aBoolean! !

!Expert methodsFor: 'tools'!
vars
	^ vars! !

!Expert methodsFor: 'tools' stamp: 'drgeo 7/30/2024 22:29:31'!
verifFait: fait vars:lvars
|f  lv res|
f:= fait.
(f isString) ifTrue: [ f := ExpertList  new: f ].
res :=(self faits at: f first ) collect:   [ :xx| lv:=lvars copy.  (self  unifie: xx  fait avec: f vars: lv )   ].
^lv
! !

!Expert methodsFor: 'tools' stamp: 'DrGeoUser 8/13/2020 11:50'!
verifieFait: t1 
|res r|
	r:=(self verifieFait: t1 vars: IdentityDictionary new) collect:  [:m|m last afficheFait ].
	res :=WriteStream on: ''.
	r do: [ :m|res nextPutAll: '
'.res nextPutAll:  m ].
^res contents.! !

!Expert class methodsFor: 'initialize' stamp: 'drgeo 8/27/2024 01:05:01'!
nouveau
^ self  new! !

!ExpertFait methodsFor: 'accessing' stamp: 'drgeo 9/7/2024 20:35:37'!
afficheFait
|fs res|
fs:=(expert faitAsString: self ).

res:= self no asString,' ',fs,' -> ',self just.


^res
! !

!ExpertFait methodsFor: 'accessing' stamp: 'DrGeoUser 7/11/2022 17:26'!
afficheFait2
	| fs res rgl |
	fs := expert faitAsString: self.
	res := (expert affirmations indexOf: self) asString , ' ' , fs
		, ' ->' , self just.
	rgl := self expert regles at: self just asSymbol ifAbsent: [ nil ].
	rgl isNil
		ifTrue: [ ^ res ].
	rgl := rgl com.
	(rgl isNil or: [ expert com not ])
		ifTrue: [ ^ res ].
	rgl := Character cr asString , ' * ' , rgl .
	^ res , rgl! !

!ExpertFait methodsFor: 'accessing' stamp: 'DrGeoUser 8/22/2020 12:25'!
egal: alist
|l vars|
vars :=IdentityDictionary new.  
l:=alist.
(l isString) ifTrue: [ l:= expert list: alist  ].
^ expert unifie: self fait avec:l vars: vars.! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 1/24/2012 15:46'!
expert 
^expert! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 1/24/2012 15:47'!
expert:anExpert 
expert := anExpert! !

!ExpertFait methodsFor: 'accessing'!
fait
	^ fait! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 1/18/2012 00:28'!
fait: f
	fait := f! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 2/20/2012 10:00'!
faitAsString 
^super faitAsString: self fait
! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 2/12/2012 19:17'!
isExpertFait
^true.! !

!ExpertFait methodsFor: 'accessing'!
just
	^ just! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 1/18/2012 00:29'!
just: j 
	just := j! !

!ExpertFait methodsFor: 'accessing'!
key
	^ fait first asSymbol! !

!ExpertFait methodsFor: 'accessing'!
lv
	^ lv! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 1/18/2012 00:29'!
lv: v 
	lv := v! !

!ExpertFait methodsFor: 'accessing' stamp: 'DrGeoUser 3/18/2020 00:00'!
monIndex
^ expert affirmations indexOf: self.! !

!ExpertFait methodsFor: 'accessing' stamp: 'DrGeoUser 3/17/2020 23:12'!
nF
expert affirmations  indexOf: self! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 2/5/2012 21:35'!
nosAnt
|e|
e:=expert .

^ ((((e regles )at:( self just asSymbol  )  ifAbsent:[^ #() ]) ant ) collect: [:t|(( e   instancie: t  vars: self lv)  )] )collect:[:m|e nF: (e faitAsString: m )] thenSelect:[:m|m isNumber]! !

!ExpertFait methodsFor: 'accessing' stamp: 'pad 1/24/2012 22:25'!
regles
|r|
r:=( ((self fait) first) ,'-regles' )asSymbol.
((expert faits keys)includes: r)
ifTrue:[^(expert faits) at:r].
^nil
! !

!ExpertFait methodsFor: 'accessing' stamp: 'DrGeoUser 4/15/2013 20:27'!
retire
retire ifNil: [retire:=false].
^retire
! !

!ExpertFait methodsFor: 'accessing' stamp: 'DrGeoUser 4/15/2013 20:29'!
retire:aBoolean
retire :=aBoolean ! !

!ExpertFait methodsFor: 'as yet unclassified' stamp: 'drgeo 9/7/2024 19:33:17'!
no
^no! !

!ExpertFait methodsFor: 'as yet unclassified' stamp: 'drgeo 9/7/2024 19:34:21'!
no: nb
no :=nb! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 11/6/2023 20:58'!
abs: mot1 rep: rep vars: lVars
"Retourne la valeur absolue d'un nombre"
	| t5 |
	t5 := self instanciedValue: mot1 vars: lVars.
	t5 ifNil: [ ^ false ].
	^ self affecte: rep valeur: (self makeNumber: t5) abs vars: lVars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/26/2023 02:18'!
arrondis: n rep: res vars: lvars
"La valeur arrondie"
	| nb n2 nn2x nn2y |
	nb := self instanciedValue: n vars: lvars.
	nb ifNil: [ ^ false ].
	nb isSymbol
		ifTrue: [ nb := nb asNumber ].
	nb isPoint
		ifTrue: [ n2 := (nb + 0.0005) * 1000.
			nn2x := ((n2 x + 0.00005) * 1000) asInteger.
			nn2y := ((n2 y + 0.00005) * 1000) asInteger.
			n2 := nn2x @ nn2y.
			^ self affecte: res valeur: n2 / 1000.0 vars: lvars ].
	nb isString
		ifTrue: [ nb := OpalCompiler new
				source: nb;
				evaluate ].
	nb isFloat
		ifTrue: [ n2 := (nb + 0.0005) * 1000.
			^ self affecte: res valeur: n2 asInteger / 1000.0 vars: lvars ].
	nb isInteger
		ifTrue: [ ^ self affecte: res valeur: nb asFloat vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:44'!
difference: mot1 et: mot2 rep: rep vars: lVars
	"La différence de deux nombres"

	| t5 t6 res |
	t5 := self instanciedValue: mot1 vars: lVars.
	t6 := self instanciedValue: mot2 vars: lVars.
	(t5 isNil or: [ t6 isNil ])
		ifTrue: [ ^ false ].
	t5 := self makeNumber: t5.
	t6 := self makeNumber: t6.
	(t5 isString or: [ t6 isString ])
		ifTrue: [ res := t5 asString , ' - ' , t6 asString ]
		ifFalse: [ res := t5 - t6.
			res isNumber
				ifTrue: [ res asFraction = res asInteger
						ifTrue: [ res := res asInteger ] ] ].
	^ self affecte: rep valeur: res vars: lVars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/26/2023 02:22'!
différence: mot1 et: mot2 rep: rep vars: lVars
"La différeence de deux nombres"
	^ self
		difference: mot1
		et: mot2
		rep: rep
		vars: lVars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:44'!
ensembleAjoute: obj ensemble: ens rep: rep vars: lvars
	"Ajoute un objet à un ensemble"

	| ob en res |
	ob := self valeur: obj vars: lvars.
	res := self valeur: ens vars: lvars.
	((ob asString beginsWith: '?') and: [ ob = obj ])
		ifTrue: [ ^ false ].
	((en asString beginsWith: '?') and: [ en = ens ])
		ifTrue: [ ^ false ].
	res := en add: obj.
	^ self affecte: rep valeur: res vars: lvars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'drgeo 8/17/2024 03:27:52'!
égal: mot1 à: mot2 vars: lVars
	"égalité numérique de deux nombres ou de deux points"

	| t5 t6 |
	t5 := self instanciedValue: mot1 vars: lVars .
	(t5 isString )ifTrue: [t6:=Compiler	 evaluate: t5].
	t6 := self instanciedValue: mot2 vars: lVars. 
	(t6 isString )ifTrue: [t6:=Compiler	 evaluate: t6].
		t5 ifNil: [ ^ self affecte: mot1 valeur: t6 vars: lVars ].
	t6 ifNil: [ ^ self affecte: mot2 valeur: t5 vars: lVars ].
	(t5 isNumber and: [ t6 isNumber ])
		ifTrue: [ ^ t5 = t6 ].
	(t5 isPoint and: [ t6 isPoint ])
		ifTrue: [ ^ t5 = t6 ].
	"t5 ifNotNil: [ t5 := self makeNumber: t5 ].
	t6 ifNotNil: [ t6 := self makeNumber: t6 ]."
	(t5 isPoint and: [ t6 isPoint ])
		ifTrue: [ ^ (t5 - t6) abs < (0.001 @ 0.001) ].
	(t5 isNumber
		and: [ t6 isNumber and: [ t5 isFloat or: [ t6 isFloat ] ] ])
		ifTrue: [ ^ (t5 - t6) abs < 0.001 ].
	^ t5 = t6! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:44'!
gensym
	"Génère le nombres suivant, commence à 0"

	gen ifNil: [ gen := 0 ].
	^ gen := gen + 1! !

!ExpertRegle methodsFor: 'numbers' stamp: 'drgeo 8/1/2025 11:02:32'!
inférieur: mot1 à: mot2 vars: lVar

"<"

	| t5 t6 |
	
	t5 := self valeur: mot1 vars: lVar.
	t6 := self valeur: mot2 vars: lVar.
	t5 := self makeNumber: t5 asString.
	t6 := self makeNumber: t6  asString.
	^ t5 < t6! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:46'!
inférieurOuEgal: mot1 à: mot2 vars: lVars
"<="
	| t5 t6 |
	t5 := self valeur: mot1 vars: lVars.
	t6 := self valeur: mot2 vars: lVars.
	t5 := self makeNumber: t5.
	t6 := self makeNumber: t6.
	^ t5 <= t6! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:43'!
initGensym
	"IRemet le générateur de nombres à 0"

	gen := 0! !

!ExpertRegle methodsFor: 'numbers' stamp: 'drgeo 8/17/2024 02:42:58'!
négatif: mot1 rep: rep vars: lVars
"Inverse le signe d'un nnombre"
	| t5 res |
	t5 := self valeur: mot1 vars: lVars. -543.617@3632.852 .

	res := t5 negated.
	self affecte: rep valeur: res asString vars: lVars.
	^ true! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/26/2023 02:44'!
produit: mot1 et: mot2 rep: rep vars: lVars
"le produit de deux nombres"
	| t5 t6 |
	t5 := self instanciedValue: mot1 vars: lVars.
	t6 := self instanciedValue: mot2 vars: lVars.
	(t5 notNil and: t6 notNil)
		ifTrue: [ ((t5 := self makeNumber: t5) ~= false
				and: [ (t6 := self makeNumber: t6) ~= false ])
				ifTrue: [ ^ self affecte: rep valeur: (t5 * t6) asString vars: lVars ] ].
	^ false! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:47'!
quotient: mot1 et: mot2 rep: rep vars: lVars
	"le quotient de deux nombres"

	| t5 t6 res |
	t5 := self instanciedValue: mot1 vars: lVars.
	t6 := self instanciedValue: mot2 vars: lVars.
	t5 ifNil: [ ^ false ].
	t6 ifNil: [ ^ false ].
	t5 := self makeNumber: t5.
	t6 := self makeNumber: t6.
	(t5 isNumber and: [ t6 isNumber ])
		ifFalse: [ ^ false ].
	res := t5 / t6.
	^ self affecte: rep valeur: res asString vars: lVars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/26/2023 02:47'!
racine: mot1 rep: rep vars: lVars
"La racine carrée d'un nombre comme fraction"
	| t5 res |
	t5 := self valeur: mot1 vars: lVars.
	t5 := OpalCompiler new
		source: t5;
		evaluate.
	res := t5 sqrt.
	res asFraction = res asInteger
		ifTrue: [ res := res asInteger ]
		ifFalse: [ res := res asFraction ].
	self affecte: rep valeur: res asString vars: lVars.
	^ true! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:48'!
racineDecimal: mot1 rep: rep vars: lVars
	"La racine décimale d'un nombre"

	| t5 res |
	t5 := self valeur: mot1 vars: lVars.
	t5 := self makeNumber: t5.
	res := t5 sqrt asFloat.
	^ self affecte: rep valeur: res asString vars: lVars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/26/2023 02:49'!
racineFraction: mot1 rep: rep vars: lVars

"La racine carrée d'un nombre comme fraction"
	| t5 res |
	t5 := self valeur: mot1 vars: lVars.
	t5 := self makeNumber: t5.
	res := t5 sqrt asFraction.
	^ self affecte: rep valeur: res asString vars: lVars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:55'!
racineSymbol: mot1 rep: rep vars: lVars
" La racine carrée sous forme de symbole  V¯ n"
	| t5 t5asNumber res rac |
	rac := 'V' , 175 asCharacter asString.
	t5 := self valeur: mot1 vars: lVars.
	((mot1 beginsWith: '?') and: [ mot1 = t5 ])
		ifTrue: [ ^ false ].
	t5asNumber := self makeNumber: t5.
	t5asNumber isNumber
		ifTrue: [ res := t5asNumber sqrt.
			res isFloat
				ifTrue: [ res := rac , t5 ].
			^ self affecte: rep valeur: res asString vars: lVars ].
	^ self affecte: rep valeur: rac , t5 asString vars: lVars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'drgeo 3/28/2025 19:17:23'!
somme: mot1 et: mot2 rep: rep vars: lVars
"La somme de deux nombres"

	| t5 t6 t7 res |.
	
	t5 := self instanciedValue: mot1 vars: lVars.
	t6 := self instanciedValue: mot2 vars: lVars.
	t7 := self instanciedValue: rep vars: lVars.
	t7 ifNotNil: [t7 :=self makeNumber: t7].
	(t6 isNil and: t5 notNil )ifTrue: [ 	self difference: rep et:  mot1 rep: mot2 vars:  lVars. 
	^self affecte: mot2 valeur: res vars: lVars].
	(t5 isNil and: t6 notNil )ifTrue: [ 	self difference: rep et:  mot2 rep: mot1 vars:  lVars. 
	^self affecte: mot1 valeur: res vars: lVars].
	(t6 isNil or: t5 isNil )ifTrue:[ ^ false ].

		t5 := self makeNumber: t5. 
	t6 := self makeNumber: t6.
	(t5 isNumber and: [ t6 isNumber ]) 
		ifFalse: [ ^ false ].
	res := t5 + t6.
	t7 ifNil:[^ self affecte: rep valeur: res vars: lVars].
	^ t7 =res.
	! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 10/27/2023 10:57'!
supérieur: mot1 à: mot2 vars: lVars
	">"

	| t5 t6 |
	t5 := self instanciedValue: mot1 vars: lVars.
	t6 := self instanciedValue: mot2 vars: lVars.
	t5 ifNil: [ ^ false ].
	t6 ifNil: [ ^ false ].
	t5 := self makeNumber: t5.
	t6 := self makeNumber: t6.
	^ t5 > t6! !

!ExpertRegle methodsFor: 'numbers' stamp: 'DrGeoUser 11/6/2023 21:58'!
supérieurOuEgal: mot1 à: mot2 vars: lVars
">="
	| t5 t6 |
	t5 := self valeur: mot1 vars: lVars.
	t6 := self valeur: mot2 vars: lVars.
	t5 := self makeNumber: t5.
	t6 := self makeNumber: t6.
	^ t5 >= t6! !

!ExpertRegle methodsFor: 'numbers' stamp: 'drgeo 4/29/2025 15:41:18'!
x: mot1 rep: rep vars: lVars
"Coordonnée x d'un objet  point"
	| t5 |
	t5 := self instanciedValue: mot1 vars: lVars.
	t5 ifNil: [ ^ false ].
	^ self affecte: rep valeur: (self makeNumber: t5 x)  vars: lVars! !

!ExpertRegle methodsFor: 'numbers' stamp: 'drgeo 4/29/2025 15:43:41'!
y: mot1 rep: rep vars: lVars
"Coordonnée y d'un objet point"
	| t5 |
	t5 := self instanciedValue: mot1 vars: lVars.
	t5 ifNil: [ ^ false ].
	^ self affecte: rep valeur: (self makeNumber: t5 y)  vars: lVars! !

!ExpertRegle methodsFor: 'relations' stamp: 'DrGeoUser 11/6/2023 22:48'!
ajoute: obj ensemble: ens vars: lvars
"Ajoute un élément à  un ensemble"
	| ob en |
	ob := self valeur: obj vars: lvars.
	en := self valeur: ens vars: lvars.
	en add: obj.
	^ true! !

!ExpertRegle methodsFor: 'relations' stamp: 'drgeo 9/16/2024 17:19:11'!
contient: list el: el vars: lvars
"Vérifie si une liste contient un élément"
	| t1 t2 res |
	t1 := self instanciedValue: list vars: lvars.
	t2 := self instanciedValue: el vars: lvars.
	(t1 isNil or: [ t2 isNil ])
		ifTrue: [ ^ false ].
	(t1 isKindOf: Symbol)
		ifTrue: [ ^ (t1 asString indexOf: (t2 at: 1)) > 0 ].
	^ t1 includes: t2! !

!ExpertRegle methodsFor: 'relations' stamp: 'DrGeoUser 11/6/2023 22:49'!
nonRelation: obj1 et: obj2 nom: n vars: lvars
"Vérifie qu'il n'y a pas de relation"
	| ob1 ob2 nom rel |
	ob1 := self valeur: obj1 vars: lvars.
	ob2 := self valeur: obj2 vars: lvars.
	ob1 = ob2
		ifTrue: [ ^ true ].
	(ob1 = obj1 and: [ obj1 isString and: [ obj1 beginsWith: '?' ] ])
		ifTrue: [ ^ false ].
	(ob2 = obj2 and: [ obj2 isString and: [ obj2 beginsWith: '?' ] ])
		ifTrue: [ ^ false ].
	"ob1 isList
		ifTrue: [ ob1 := ob1 sort ].
	ob2 isList
		ifTrue: [ ob2 := ob2 sort ]."
	nom := self valeur: n vars: lvars.
	rel := ExpertRelations new.
	rel expert: expert.
	^ (rel relation: ob1 et: ob2 nom: nom) not! !

!ExpertRegle methodsFor: 'relations' stamp: 'DrGeoUser 12/2/2023 12:04'!
relation: obj1 et: obj2 nom: n vars: lvars
	"Relation entre deux objets, nom de la relation"

	| ob1 ob2 nom rel |
	ob1 :=  self instanciedValue: obj1 vars: lvars.
	ob2 :=  self instanciedValue: obj2 vars: lvars.
	ob1 isNil
		ifTrue: [ ^ false ].
	ob2 isNil
		ifTrue: [ ^ false ].
	ob1 = ob2
		ifTrue: [ ^ true ].
	(ob1 = obj1 and: [ obj1 isString and: [ obj1 beginsWith: '?' ] ])
		ifTrue: [ ^ false ].
	(ob2 = obj2 and: [ obj2 isString and: [ obj2 beginsWith: '?' ] ])
		ifTrue: [ ^ false ].
	"ob1 isList
		ifTrue: [ ob1 := ob1 sort ].
	ob2 isList
		ifTrue: [ ob2 := ob2 sort ]."
	nom := self valeur: n vars: lvars.
	rel := ExpertRelations new.
	rel expert: expert.
	^ rel relation: ob1 et: ob2 nom: nom! !

!ExpertRegle methodsFor: 'relations' stamp: 'DrGeoUser 11/6/2023 22:57'!
relation: nom rep: res vars: lvars
"Affiche les éléments en relation sous forme de listes"
	| rel n e result |
	self expert relations ifEmpty: [ ^ false ].
	result := ExpertList new.
	e := self expert.
	n := self instanciedValue: nom asString vars: lvars.
	n
		ifNotNil: [ rel := self expert relations at: n asSymbol.
			rel := rel collect: [ :r | ExpertList new: r ].
			self affecte: res valeur: (ExpertList new: rel) vars: lvars.
			^ true ].
	^ false! !

!ExpertRegle methodsFor: 'relations' stamp: 'DrGeoUser 12/2/2023 12:19'!
relationCrée: obj1 et: obj2 nom: n vars: lvars
	"Etablit une relation"

	| ob1 ob2 nom rel |
	ob1 := self instanciedValue:  obj1 vars:   lvars.
	ob2 := self instanciedValue:  obj2 vars:   lvars.
	ob1 isNil
		ifTrue: [ ^ false ].
	ob2 isNil
		ifTrue: [ ^ false ].
	ob1 = ob2
		ifTrue: [ ^ false ].
	"ob1 isList
		ifTrue: [ ob1 := ob1 sort ].
	ob2 isList
		ifTrue: [ ob2 := ob2 sort ]."
	nom := self valeur: n vars: lvars.
	rel := ExpertRelations new.
	rel expert: self expert.
	rel relationCrée: ob1 et: ob2 nom: nom.
	^ true! !

!ExpertRegle methodsFor: 'relations' stamp: 'DrGeoUser 11/7/2023 13:45'!
relationsClés: rep vars: lVar
	"Affiche les relations définies"

	| res |
	res := self valeur: rep vars: lVar.
	self expert
		affecte: res
		valeur: self expert relations keys
		vars: lVar.
	^ true! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 6/4/2025 11:52:05'!
abcisseDe: pt sur: dr rep: res vars: lvars
"Abcisse d'un point sur une ligne"
	| point droite pool ptMat item |
.
	pool := self expert drgeo domain factory pool.
	item := [ :x | pool detect: [ :it | x = it name ] ifNone: [ nil ] ].
	point := self instanciedValue: pt vars: lvars.
	droite := self instanciedValue: dr vars: lvars.
	point ifNil: [ ^ false ].
	droite ifNil: [ ^ false ].
	ptMat := item value: point.
	(ptMat isKindOf: DrGPointOncurveItem )ifFalse:[^false ].
	(item value: droite) ifNil: [ ^ false ].
	"(DrGPointOncurveItem = ptMat class)ifTrue: ["
	^ self
		affecte: res
		valeur: ((item value: droite) abscissaOf: ptMat point)
		vars: lvars	" ].
^false."! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 10/27/2023 11:11'!
aireTriangle: p1 avec: p2 avec: p3 rep: r vars: lvar
"Aire calculée à partir des coordonnées de 3 points,double de l'aire du triangle formé par les 3 points,
positive si le triangle est orienté à gauche, sens trigonométrique"
	| pt1 pt2 pt3 res pool |
	pool := self expert drgeo domain factory pool.
	pt1 := self instanciedValue: p1 vars: lvar.
	pt2 := self instanciedValue: p2 vars: lvar.
	pt3 := self instanciedValue: p3 vars: lvar.
	pt1 ifNil: [ ^ false ].
	pt2 ifNil: [ ^ false ].
	pt3 ifNil: [ ^ false ].
	pt1 := (pool detect: [ :x | pt1 = x name ] ifNone: [ ^ false ]) point.
	pt2 := (pool detect: [ :x | pt2 = x name ] ifNone: [ ^ false ]) point.
	pt3 := (pool detect: [ :x | pt3 = x name ] ifNone: [ ^ false ]) point.
	res := pt1 triangleArea: pt2 with: pt3.
	^ self affecte: r valeur: res vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 4/1/2025 14:40:35'!
aireTriangleNegative: p1 avec: p2 avec: p3 rep: r vars: lvar
"vérifie si l'aire du triangle formé par les 3 points est négative,
le triangle est orienté à droite, sens trigonométrique inverses"

	| res |
	self
		aireTriangle: p1
		avec: p2
		avec: p3
		rep: r 
		vars: lvar.
	res := self valeur: r vars: lvar.
	 self affecte: r valeur: res vars: lvar .
	^ true! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 10/3/2024 01:17:08'!
aireTriangleNegative: p1 avec: p2 avec: p3 vars: lvar
	"Aire calculée à partir des coordonnées de 3 points,double de l'aire du triangle formé par les 3 points,
es négative, le triangle est orienté à droite, sens trigonométrique inverse"

	| r lvar2 |
	r := '?&x'.
	lvar2 := lvar veryDeepCopy .
	(self
		aireTriangle: p1
		avec: p2
		avec: p3
		rep: r
		vars: lvar2)
		ifTrue: [ ^ (self valeur: r vars: lvar2) < 0 ].
	^ false! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 10/28/2023 00:20'!
aireTrianglePositive: p1 avec: p2 avec: p3 rep: r vars: lvar
	"vérifie si l'aire du triangle formé par les 3 points est positive,
le triangle est orienté à gauche, sens trigonométrique"
	| res |
	self
		aireTriangle: p1
		avec: p2
		avec: p3
		rep: r
		vars: lvar.
	res := self valeur: r vars: lvar.
	res >= 0
		ifTrue: [ ^ self affecte: r valeur: res vars: lvar ].
	^ false! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 3/15/2025 18:09:01'!
aireTrianglePositive: p1 avec: p2 avec: p3 vars: lvar
	"vérifie si l'aire du triangle formé par les 3 points est positive,
le triangle est orienté à gauche, sens trigonométrique"
	| r lvar2 |
	r := '?&x'.
	lvar2 := lvar copy.
	(self
		aireTriangle: p1
		avec: p2
		avec: p3
		rep: r
		vars: lvar2)
		ifTrue: [ ^ (self valeur: r vars: lvar2) >= 0 ].
	^ false! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 11/6/2023 21:01'!
degrés: p rep: res vars: lvar
"retourne la valeur d'un angle qui a le  point pour sommet."
	| pt result pool |
	pool := self expert drgeo domain factory pool.
	pt := self instanciedValue: p vars: lvar.
	pt ifNil: [ ^ false ].
	pt := pt asString.
	result := (pool detect: [ :x | pt = x name ] ifNone: [ ^ false ])
		degreeAngle.
	^ self affecte: res valeur: result vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 11/7/2023 13:36'!
justeAprès: list el: el rep: res vars: lvars
	"L'élément qui suit un élément d'une liste"

	| t1 t2 t3 flse r |
	flse := false.
	t1 := self instanciedValue: list vars: lvars.
	t1 ifNil: [ ^ flse ].
	t2 := self instanciedValue: el vars: lvars.
	t2 ifNil: [ ^ flse ].
	t3 := self valeur: res vars: lvars.
	r := (t1 asArray indexOf: t2) + 1.
	r <= t1 asArray size
		ifTrue: [ ^ self affecte: res valeur: (t1 at: r) vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 11/7/2023 02:35'!
justeAvant: list el: el rep: res vars: lvars
	"L'élément qui précède un élément d'une liste"

	| t1 t2 t3 flse r |
	flse := false.
	t1 := self instanciedValue: list vars: lvars.
	t1 ifNil: [ ^ flse ].
	t2 := self instanciedValue: el vars: lvars.
	t2 ifNil: [ ^ flse ].
	t3 := self valeur: res vars: lvars.
	r := (t1 asArray indexOf: t2) - 1.
	r > 0
		ifTrue: [ ^ self affecte: res valeur: (t1 at: r) vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 11/6/2023 21:23'!
nomPolygone: n rep: res vars: lvars
"Retourne le nom d'un polygone de moins de cent côtés"
	| r nb |
	nb := (self instanciedValue: n vars: lvars) asNumber.
	^ self affecte: res valeur: (self nomPolygone: nb) vars: lvars! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 6/4/2025 08:52:30'!
nonPointConfondu: p1 avec: p2 vars: lvar
"Vérifie que deux pointsne sont pas confondus "
	| pt1 pt2 result1 result2 res pool |
	pool := self expert drgeo domain factory pool.
	pt1 := self instanciedValue: p1 vars: lvar.
	pt2 := self instanciedValue: p2 vars: lvar.
	pt1 ifNil: [ ^ false ].
	pt2 ifNil: [ ^ false ].
	result1 := (pool detect: [ :x | pt1 = x name ] ifNone: [ ^ false ])
		point.
	result2 := (pool detect: [ :x | pt2 = x name ] ifNone: [ ^ false ])
		point.
	res := (result1 - result2) abs.
	^ (res x < 0.0001 and: [ res y < 0.0001 ]) not! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 11/6/2023 21:31'!
origine: obj rep: res vars: lvar
"le premier parent d'un segment ou d'une droite"
	| ob result pool sub objet |
	pool := self expert drgeo domain factory pool.
	ob := self instanciedValue: obj vars: lvar.
	ob ifNil: [ ^ false ].
	(sub := ob substrings: ':') size = 2
		ifTrue: [ result := sub first ]
		ifFalse: [ objet := pool detect: [ :x | ob = x name ] ifNone: [ ^ false ].
			result := objet parents first name ].
	result.
	^ self affecte: res valeur: result vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 11/6/2023 21:32'!
parents: p rep: res vars: lvar
	"les parents d'un objet."

	| pt result pool lst |
	pool := self expert drgeo domain factory pool.
	pt := self instanciedValue: p vars: lvar.
	pt ifNil: [ ^ false ].
	pt := pt asString.
	result := (pool detect: [ :x | pt = x name ] ifNone: [ ^ false ])
		parents.
	result := ExpertList new: (result collect: [ :x | x name ]).
	^ self affecte: res valeur: result vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 10/28/2023 00:30'!
pente: dr rep: res vars: lvar
"Ccalcule la pente d'une droite"
	| drt result pool |
	pool := self expert drgeo domain factory pool.
	drt := self instanciedValue: dr vars: lvar.
	drt ifNil: [ ^ false ].
	drt := drt asString.
	result := pool detect: [ :x | drt = x name ] ifNone: [ ^ false ].
	(result isKindOf: DrGLineItem)
		ifFalse: [ ^ false ].
	result := result direction.
	0 = result x
		ifTrue: [ self affecte: res valeur: Float infinity vars: lvar.
			^ true ].
	result := result y / result x.
	^ self affecte: res valeur: result vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 9/4/2024 13:46:56'!
point: p entre: a et: b vars: lvars
"un point entre deux autres. "
	| pv av bv ap bp pp f drgeo |
	drgeo:= self expert drgeo. 
	pv := self valeur: p vars: lvars.
	((pv beginsWith: '?') and: [ pv = p ])
		ifTrue: [ ^ false ].
	av := self valeur: a vars: lvars.
	((av beginsWith: '?') and: [ av = a ])
		ifTrue: [ ^ false ].
	bv := self valeur: b vars: lvars.
	((bv beginsWith: '?') and: [ av = a ])
		ifTrue: [ ^ false ].
	av = bv
		ifTrue: [ ^ false ].
	av = pv
		ifTrue: [ ^ false ].
	bv = pv
		ifTrue: [ ^ false ].
	ap := ((self expert drgeo  view submorphs
		select: [ :m | m class = DrGPointMorph ])
		detect: [ :n | n costume name = av ]
		ifNone: [ ^ false ]) costume mathItem point.
	bp := ((f drgeo area submorphs
		select: [ :m | m class = DrGPointMorph ])
		detect: [ :n | n costume name = bv ]
		ifNone: [ ^ false ]) costume mathItem point.
	pp := ((f drgeo area submorphs
		select: [ :m | m class = DrGPointMorph ])
		detect: [ :n | n costume name = pv ]
		ifNone: [ ^ false ]) costume mathItem point.
	ap x = bp x
		ifTrue: [ ap y < bp y
				ifTrue: [ ^ pp y between: ap y and: bp y ]
				ifFalse: [ ^ pp y between: bp y and: ap y ] ]
		ifFalse: [ ap x < bp x
				ifTrue: [ ^ pp x between: ap x and: bp x ]
				ifFalse: [ ^ pp x between: bp x and: ap x ] ]! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 4/27/2025 13:20:12'!
point: arg1 rep: arg2 vars: arg3
"Affiche les coordonnées d'un point."
	| temp4 temp5 temp6 |
	temp6 := self expert drgeo domain factory pool.
	"retourne un objet point"
	temp4 := self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 := temp4 asString.
	temp5 := (temp6
		detect: [ :argm4_7 |
			temp4 = argm4_7 name ]
		ifNone: [ ^ false ]) point.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 10/28/2023 00:34'!
pointConfondu: p1 avec: p2 vars: lvar
"Signale des pointscofondus, des points avec les mêmecoordonnées"
	| pt1 pt2 result1 result2 res pool |
	pool := self expert drgeo domain factory pool.
	pt1 := self instanciedValue: p1 vars: lvar.
	pt2 := self instanciedValue: p2 vars: lvar.
	pt1 ifNil: [ ^ false ].
	pt2 ifNil: [ ^ false ].
	result1 := (pool detect: [ :x | pt1 = x name ] ifNone: [ ^ false ])
		point.
	result2 := (pool detect: [ :x | pt2 = x name ] ifNone: [ ^ false ])
		point.
		
	res :=(result1 -  result2) abs.
	^ (res x) < 0.0001 and: [ (res y) < 0.0001 ]! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 10/26/2023 17:16'!
pointDifferent: p1 de: p2 vars: lvar
"Vérifie que deux points sont difflérents, non confondus"
	| pt1 pt2 result1 result2 res pool |
	pool := self expert drgeo domain factory pool.
	pt1 := self instanciedValue: p1 vars: lvar.
	pt2 := self instanciedValue: p2 vars: lvar.
	pt1 ifNil: [ ^ false ].
	pt2 ifNil: [ ^ false ].
	result1 := (pool detect: [ :x | pt1 = x name ] ifNone: [ ^ false ])
		point.
	result2 := (pool detect: [ :x | pt2 = x name ] ifNone: [ ^ false ])
		point.
	res := (result1 - result2) abs.
	^ (res x < 0.0001 and: [ res y < 0.0001 ]) not! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 5/26/2025 11:04:32'!
pointsSur: droite rep: res vars: lvar
"la liste de points sur un droite ordonnés suivant le sens de la droite"
	| dr drorig pool ptsSur virt item |
	pool := expert drgeo domain factory pool.
	dr := self instanciedValue: droite vars: lvar.
	"((dr class) = DrGLineItem) ifFalse: [ ^false ]."
	ptsSur := OrderedCollection new.
	dr ifNil: [ ^ false ].
	item := [ :x | pool detect: [ :it | x = it name ] ifNone: [ ^ false ] ].
	dr := item value: dr.
	drorig := dr origin.
	"ptsSur := pool
		select: [ :x | 
			(x class = DrGPointOncurveItem and: [ x parents notNil ])
				and: [ x parents includes: dr ] ]
		thenCollect: [ :x | x name ]."
	virt := expert affirmations
		select: [ :x | x fait asString beginsWith: 'pointSur ' , dr name asString ]
		thenCollect: [ :x | x fait last asString ].
	virt do: [ :x | ptsSur add: x ].
	"ptsSur add: dr parents last name.
(((dr parents first class) = DrGPointFreeItem) or:  [ (dr parents first class) = DrGPointOncurveItem ])ifTrue: [ ptsSur add:dr parents first name  ].
(dr parents size )>1 ifTrue:  
[(((dr parents second class) = DrGPointFreeItem) or:  [ (dr parents second class) = DrGPointOncurveItem ])ifTrue: [ ptsSur add:dr parents second  name ]]
ifFalse:[^ false]."
	ptsSur := ptsSur asSet asOrderedCollection.
	ptsSur
		sort: [ :x :y | 
			(dr abscissaOf: (item value: x) point)
				< (dr abscissaOf: (item value: y) point) ].
	"(drorig=( item value: ptsSur first )point  ) ifFalse:[ ptsSur sort: [:x :y |( dr abscissaOf: (item value:  x)  point) > ( dr abscissaOf: (item value: y)  point )]]."
	ptsSur := ExpertList new: ptsSur.
	^ self affecte: res valeur: ptsSur vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 10/28/2023 00:37'!
pointsSurCercle: cercle rep: res vars: lvar
"Les points sur le cercle, ordonnés suivant leur abcisse"
	| cr pool ptsSur item val virt |
	pool := expert drgeo domain factory pool.
	cr := self instanciedValue: cercle vars: lvar.
	"((dr class) = DrGLineItem) ifFalse: [ ^false ]."
	cr ifNil: [ ^ false ].
	item := [ :x | pool detect: [ :it | x = it name ] ].
	cr := item value: cr.
	ptsSur := OrderedCollection new.
	"val := pool
		select: [ :x | x class = DrGPointOncurveItem and: [ x parents includes: cr ] ].
	val := val asSet asOrderedCollection."
	virt := expert affirmations
		select: [ :x | x fait asString beginsWith: 'pointSur ' , cr name asString ]
		thenCollect: [ :x | x fait last asString ].
	virt do: [ :x | ptsSur add: x ].
	ptsSur := ptsSur asSet asOrderedCollection.
	ptsSur
		sort: [ :x :y | 
			(cr abscissaOf: (item value: x) point)
				< (cr abscissaOf: (item value: y) point) ].
	ptsSur := ExpertList new: ptsSur.
	^ self affecte: res valeur: ptsSur vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 4/5/2025 19:55:27'!
pointsSurVirt: demidr droite:droite rep: res vars: lvar
"la lisre de points sur un droite ordonnés suivant le sens de la droite"
	| dr drorig pool ptsSur virt item dd |
	pool := expert drgeo domain factory pool.
	dr := self instanciedValue: droite vars: lvar.
	dd := self instanciedValue: demidr vars: lvar.
	"((dr class) = DrGLineItem) ifFalse: [ ^false ]."
	ptsSur := OrderedCollection new.
	dr ifNil: [ ^ false ].
	item := [ :x | pool detect: [ :it | x = it name ] ifNone: [ ^ false ] ].
	dr := item value: dr.
	drorig := dr origin.
	"ptsSur := pool
		select: [ :x | 
			(x class = DrGPointOncurveItem and: [ x parents notNil ])
				and: [ x parents includes: dr ] ]
		thenCollect: [ :x | x name ]."
	virt := expert affirmations
		select: [ :x | x fait asString beginsWith: 'pointSur ' , dd  asString ]
		thenCollect: [ :x | x fait last asString ].
	virt do: [ :x | ptsSur add: x ].
	"ptsSur add: dr parents last name.
(((dr parents first class) = DrGPointFreeItem) or:  [ (dr parents first class) = DrGPointOncurveItem ])ifTrue: [ ptsSur add:dr parents first name  ].
(dr parents size )>1 ifTrue:  
[(((dr parents second class) = DrGPointFreeItem) or:  [ (dr parents second class) = DrGPointOncurveItem ])ifTrue: [ ptsSur add:dr parents second  name ]]
ifFalse:[^ false]."
	ptsSur := ptsSur asSet asOrderedCollection.
	ptsSur
		sort: [ :x :y | 
			(dr abscissaOf: (item value: x) point)
				< (dr abscissaOf: (item value: y) point) ].
	"(drorig=( item value: ptsSur first )point  ) ifFalse:[ ptsSur sort: [:x :y |( dr abscissaOf: (item value:  x)  point) > ( dr abscissaOf: (item value: y)  point )]]."
	ptsSur := ExpertList new: ptsSur.
	^ self affecte: res valeur: ptsSur vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 4/10/2025 13:30:05'!
pointsSurdd: droite rep: res vars: lvar

"la liste de points sur un droite ordonnés suivant le sens de la droite"
	| dr drorig pool ptsSur virt item   nm|
	"self halt."
	pool := expert drgeo domain factory pool.
	dr := self instanciedValue: droite vars: lvar. 
	"((dr class) = DrGLineItem) ifFalse: [ ^false ]."
	ptsSur := OrderedCollection new.
	dr ifNil: [ ^ false ].
	dr :=#trans.
	item := [ :x | pool detect: [ :it | x = it name ] ifNone: [  x ] ].
	nm := item value: dr. 
	nm class = Symbol ifFalse:[ drorig := nm origin].
	"ptsSur := pool
		select: [ :x | 
			(x class = DrGPointOncurveItem and: [ x parents notNil ])
				and: [ x parents includes: dr ] ]
		thenCollect: [ :x | x name ]."
	virt := expert affirmations
		select: [ :x | x fait asString beginsWith: 'pointSur ' , dr ]
		thenCollect: [ :x | x fait last asString ].
	virt do: [ :x | x notEmpty ifTrue: [   ptsSur add: x ]  ].
	
	ptsSur := ExpertList new: ptsSur.
	^ self affecte: res valeur: ptsSur vars: lvar. 
	"ptsSur add: dr parents last name.
(((dr parents first class) = DrGPointFreeItem) or:  [ (dr parents first class) = DrGPointOncurveItem ])ifTrue: [ ptsSur add:dr parents first name  ].
(dr parents size )>1 ifTrue:  
[(((dr parents second class) = DrGPointFreeItem) or:  [ (dr parents second class) = DrGPointOncurveItem ])ifTrue: [ ptsSur add:dr parents second  name ]]
ifFalse:[^ false]."
	"ptsSur := ptsSur asSet asOrderedCollection.
	ptsSur
		sort: [ :x :y | 
			(dr abscissaOf: (item value: x) point)
				< (dr abscissaOf: (item value: y) point) ].
	(drorig=( item value: ptsSur first )point  ) ifFalse:[ ptsSur sort: [:x :y |( dr abscissaOf: (item value:  x)  point) > ( dr abscissaOf: (item value: y)  point )]]."
	! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 11/6/2023 21:36'!
pointx: p1 rep: res vars: lvars
"La coordonnée x d'un point"
	| pp1 points rep rres drgeo |
	pp1 := self valeur: p1 vars: lvars.
	rres := self valeur: res vars: lvars.
	pp1 class = Point
		ifFalse: [ ((pp1 beginsWith: '?') and: [ p1 = pp1 ])
				ifTrue: [ ^ false ].
			drgeo := self expert drgeo app.
			points := drgeo costumes.
			pp1 := points
				detect: [ :p | pp1 = p mathItem name ]
				ifNone: [ ^ false ].
			pp1 := pp1 mathItem point ].
	rep := pp1 x.
	^ self affecte: rres valeur: rep vars: lvars! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 11/6/2023 21:58'!
pointy: p1 rep: res vars: lvars
"La coordonnée x d'un point"
	| pp1 points rep rres drgeo |
	pp1 := self valeur: p1 vars: lvars.
	rres := self valeur: res vars: lvars.
	pp1 class = Point
		ifFalse: [ ((pp1 beginsWith: '?') and: [ p1 = pp1 ])
				ifTrue: [ ^ false ].
			drgeo := self expert drgeo app.
			points := drgeo costumes.
			pp1 := points
				detect: [ :p | pp1 = p mathItem name ]
				ifNone: [ ^ false ].
			pp1 := pp1 mathItem point ].
	rep := pp1 y.
	^ self affecte: rres valeur: rep vars: lvars! !

!ExpertRegle methodsFor: 'geometry' stamp: 'DrGeoUser 10/28/2023 00:38'!
triangleArea: p1 with: p2 with: p3 rep: r vars: lvar
	"Aire à partir des coordonnées de 3  points"

	| pt1 pt2 pt3 res pool |
	pool := self expert drgeo domain factory pool.
	pt1 := self instanciedValue: p1 vars: lvar.
	pt2 := self instanciedValue: p2 vars: lvar.
	pt3 := self instanciedValue: p3 vars: lvar.
	pt1 ifNil: [ ^ false ].
	pt2 ifNil: [ ^ false ].
	pt3 ifNil: [ ^ false ].
	pt1 := (pool detect: [ :x | pt1 = x name ]) point.
	pt2 := (pool detect: [ :x | pt2 = x name ]) point.
	pt3 := (pool detect: [ :x | pt3 = x name ]) point.
	res := pt1 triangleArea: pt2 with: pt3.
	^ self affecte: r valeur: res vars: lvar! !

!ExpertRegle methodsFor: 'geometry' stamp: 'drgeo 3/7/2025 17:50:28'!
vecteur: obj rep: res vars: lvar
"Le point à l'extrémité du vecteur d'origine 0@0 de même direction  qu'une sorte de droite"
	| vect rep pool |
	vect := self instanciedValue: obj vars: lvar.
	vect ifNil: [ ^ false ].
	pool := self expert drgeo domain factory pool.
	rep := pool detect: [ :x | x name = vect ] ifNone: [^false].
	
	^ self affecte: res valeur: rep direction vars: lvar! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/2/2025 20:53:59'!
afficheTexte: cont a: pt vars: lvars
	"Affiche à une position et nomme un texte dans la figure"

	| f  txt ici |
	
	f := self expert drgeo.
	txt := (self instanciedValue: cont vars: lvars) asString.
	ici := self instanciedValue: pt asString vars: lvars.
	ici :=Compiler evaluate: ici.
	f texte: txt à: ici.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/2/2025 19:20:13'!
afficheTexte: cont à: pt vars: lvars
	"Affiche à une position et nomme un texte dans la figure"

	| f  txt ici |
	
	f := self expert drgeo.
	txt := (self instanciedValue: cont vars: lvars) asString.
	ici := self instanciedValue: pt asString vars: lvars.
	ici :=Compiler evaluate: ici.
	f texte: txt à: ici.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/28/2025 18:52:31'!
afficheTexte: nom contenu: cont a: pt vars: lvars
	"Affiche à une position et nomme un texte dans la figure"
	| f  nm txt aff ici |
	
	f := self expert drgeo.
	nm :=( self instanciedValue: nom vars: lvars) asString.
	txt := (self instanciedValue: cont vars: lvars) asString.
	ici := self instanciedValue: pt asString vars: lvars.
	ici :=Compiler evaluate: ici.
	nm ifNil: [ ^ false ].
	txt ifNil: [ ^ false ].
	aff := f  texte: txt à: ici.
	aff couleur: Color cyan.
	aff nommer: nm.
	self expert constructions: aff.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/28/2025 18:16:28'!
afficheTexte: nom contenu: cont à: pt vars: lvars
^self afficheTexte: nom contenu: cont a: pt vars: lvars.
	"Affiche à une position et nomme un texte dans la figure"
! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/2/2025 19:26:00'!
afficheTexte: cont  vars: lvars
	"Affiche à une position et nomme un texte dans la figure"
|  txt f  |
	
	txt := (self instanciedValue: cont vars: lvars) asString..
	
f :=	self  expert  drgeo .
f texte: txt.

^true.! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/28/2025 19:43:23'!
alerte: mess vars: lvars
	"Provoqe une alerte avec un message"
|t1  |
t1 :=self instanciedValue: mess vars: lvars.
PopUpMenu inform: t1 printString.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/28/2025 21:00:11'!
angleCentre: po de: pa a: pb coul: coul vars: lvars
"Marque la valeur d'un angle en couleur"
	| f drgeo pool o a b ang pto pta ptb couleur color |
	f := self expert drgeo .
	pool := f domain factory pool.
	o := self instanciedValue: po vars: lvars.
	a := self instanciedValue: pa vars: lvars.
	b := self instanciedValue: pb vars: lvars.
	couleur := self instanciedValue: coul vars: lvars.
	o ifNil: [ ^ false ].
	a ifNil: [ ^ false ].
	b ifNil: [ ^ false ].
	pta := pool detect: [ :x | x  name = a ] ifNone: [ ^ false ].
	pto := pool detect: [ :x | x  name = o ] ifNone: [ ^ false ].
	ptb := pool detect: [ :x | x  name = b ] ifNone: [ ^ false ].
	couleur = 'noir'
		ifTrue: [ color := Color black ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	couleur = 'rouge'
		ifTrue: [ color := Color red ].
	couleur = 'jaune'
		ifTrue: [ color := Color yellow ].
	couleur = 'bleu'
		ifTrue: [ color := Color blue ].
	"true"
	couleur = 'cyan'
		ifTrue: [ color := Color cyan ].
	couleur = 'magenta'
		ifTrue: [ color := Color magenta ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	ang := f angleSommet: pto de: pta à: ptb.
	ang style color: color.
	self expert constructions: ang.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/6/2023 21:00'!
angleGeometriqueCentre: po de: pa a: pb coul: coul vars: lvars
"Marque la valleur d'un angle géométrique en couleur"
	| f drgeo cost o a b ang pto pta ptb couleur color |
	f := DrGeoFigure viewLess.
	drgeo := self expert drgeo app.
	cost := drgeo costumes.
	f drgeo: drgeo.
	o := self instanciedValue: po vars: lvars.
	a := self instanciedValue: pa vars: lvars.
	b := self instanciedValue: pb vars: lvars.
	couleur := self instanciedValue: coul vars: lvars.
	o ifNil: [ ^ false ].
	a ifNil: [ ^ false ].
	b ifNil: [ ^ false ].
	pta := cost detect: [ :x | x mathItem name = a ].
	pto := cost detect: [ :x | x mathItem name = o ].
	ptb := cost detect: [ :x | x mathItem name = b ].
	couleur = 'noir'
		ifTrue: [ color := Color black ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	couleur = 'rouge'
		ifTrue: [ color := Color red ].
	couleur = 'jaune'
		ifTrue: [ color := Color yellow ].
	couleur = 'bleu'
		ifTrue: [ color := Color blue ].
	"true"
	couleur = 'cyan'
		ifTrue: [ color := Color cyan ].
	couleur = 'magenta'
		ifTrue: [ color := Color magenta ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	ang := f angleGeometriqueCentre: pto de: pta a: ptb.
	ang style color: color.
	self expert constructions: ang.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/7/2023 13:31'!
angleGeometriqueCentre: po de: pa a: pb vars: lvars
	"Marque la valleur d'un angle géométrique en cyan"

	| f drgeo cost o a b ang pto pta ptb |
	f := DrGeoFigure viewLess.
	drgeo := self expert drgeo app.
	cost := drgeo costumes.
	f drgeo: drgeo.
	o := self instanciedValue: po vars: lvars.
	a := self instanciedValue: pa vars: lvars.
	b := self instanciedValue: pb vars: lvars.
	o ifNil: [ ^ false ].
	a ifNil: [ ^ false ].
	b ifNil: [ ^ false ].
	pta := cost detect: [ :x | x mathItem name = a ].
	pto := cost detect: [ :x | x mathItem name = o ].
	ptb := cost detect: [ :x | x mathItem name = b ].
	ang := f angleGeometriqueCentre: pto de: pta a: ptb.
	ang style color: Color cyan.
	self expert constructions: ang.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/2/2025 21:39:19'!
angleGeometriqueSommet: po de: pa a: pb coul: coul vars: lvars
"Marque la valleur d'un angle géométrique en couleur"

|  s a b f  couleur ang col |
	
	s:= (self instanciedValue: po vars: lvars) asString.
	a:= (self instanciedValue: pa vars: lvars) asString.
	b:= (self instanciedValue: pb vars: lvars) asString..
	couleur:=  (self instanciedValue: coul vars: lvars) asString..
	couleur ='rouge' ifTrue: [ col := Color red ].
	couleur ='bleue' ifTrue: [ col := Color blue ].
	couleur ='vert'    ifTrue: [ col := Color green ].
	couleur ='jaune'  ifTrue: [ col := Color yellow ].
f :=	self  expert  drgeo .
ang := f  angleGéométriqueSommet: s de: a  à:  b.
ang couleur: col.
^true! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/2/2025 23:53:41'!
angleGeometriqueSommet: po de: pa a: pb vars: lvars
"Marque la valleur d'un angle géométrique en couleur"
|  s a b f  |

	s:= (self instanciedValue: po vars: lvars) asString.
	a:= (self instanciedValue: pa vars: lvars) asString.
	b:= (self instanciedValue: pb vars: lvars) asString..
	s:=Compiler evaluate: s.
	a:=Compiler evaluate: a.
	b:=Compiler evaluate: b.
f :=	self  expert  drgeo .
f  angleGéométriqueSommet: s de: a  à:  b.
f  actualiser.
^true.! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/2/2025 23:28:37'!
angleGeometriqueSommet: po de: pa à: pb vars: lvars
"Marque la valleur d'un angle géométrique en couleur"

|  s a b f  |

	s:= (self instanciedValue: po vars: lvars) asString.
	a:= (self instanciedValue: pa vars: lvars) asString.
	b:= (self instanciedValue: pb vars: lvars) asString..
	s:=Compiler evaluate: s.
	a:=Compiler evaluate: a.
	b:=Compiler evaluate: b.
f :=	self  expert  drgeo .
f  angleGéométriqueSommet: s de: a  à:  b.
f  actualiser.
^true.! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/3/2025 00:15:43'!
angleGéométriqueSommet: po de: pa à: pb vars: lvars
"Marque la valleur d'un angle géométrique en couleur"

|  s a b f  |

	s:= (self instanciedValue: po vars: lvars) asString.
	a:= (self instanciedValue: pa vars: lvars) asString.
	b:= (self instanciedValue: pb vars: lvars) asString..
	s:=Compiler evaluate: s.
	a:=Compiler evaluate: a.
	b:=Compiler evaluate: b.
f :=	self  expert  drgeo .
f  angleGéométriqueSommet: s de: a  à:  b.
f  actualiser.
^true.! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/28/2025 21:03:26'!
angleSommet: po de: pa a: pb coul: coul vars: lvars
"Marque la valeur d'un angle en couleur"
	| f drgeo pool o a b ang pto pta ptb couleur color |
	f := self expert drgeo .
	pool := f domain factory pool.
	o := self instanciedValue: po vars: lvars.
	a := self instanciedValue: pa vars: lvars.
	b := self instanciedValue: pb vars: lvars.
	couleur := self instanciedValue: coul vars: lvars.
	o ifNil: [ ^ false ].
	a ifNil: [ ^ false ].
	b ifNil: [ ^ false ].
	pta := pool detect: [ :x | x  name = a ] ifNone: [ ^ false ].
	pto := pool detect: [ :x | x  name = o ] ifNone: [ ^ false ].
	ptb := pool detect: [ :x | x  name = b ] ifNone: [ ^ false ].
	couleur = 'noir'
		ifTrue: [ color := Color black ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	couleur = 'rouge'
		ifTrue: [ color := Color red ].
	couleur = 'jaune'
		ifTrue: [ color := Color yellow ].
	couleur = 'bleu'
		ifTrue: [ color := Color blue ].
	"true"
	couleur = 'cyan'
		ifTrue: [ color := Color cyan ].
	couleur = 'magenta'
		ifTrue: [ color := Color magenta ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	ang := f angleSommet: pto de: pta à: ptb.
	ang style color: color.
	self expert constructions: ang.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'drgeo 9/28/2025 21:44:31'!
angleSommet: po de: pa à: pb coul: coul vars: lvars
"Marque la valeur d'un angle en couleur"
	| f drgeo pool o a b ang pto pta ptb couleur color |
	self halt.
	f := self expert drgeo .
	pool := f domain factory pool.
	o := self instanciedValue: po vars: lvars.
	a := self instanciedValue: pa vars: lvars.
	b := self instanciedValue: pb vars: lvars.
	couleur := self instanciedValue: coul vars: lvars.
	o ifNil: [ ^ false ].
	a ifNil: [ ^ false ].
	b ifNil: [ ^ false ].
	pta := pool detect: [ :x | x  name = a ] ifNone: [ ^ false ].
	pto := pool detect: [ :x | x  name = o ] ifNone: [ ^ false ].
	ptb := pool detect: [ :x | x  name = b ] ifNone: [ ^ false ].
	couleur = 'noir'
		ifTrue: [ color := Color black ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	couleur = 'rouge'
		ifTrue: [ color := Color red ].
	couleur = 'jaune'
		ifTrue: [ color := Color yellow ].
	couleur = 'bleu'
		ifTrue: [ color := Color blue ].
	"true"
	couleur = 'cyan'
		ifTrue: [ color := Color cyan ].
	couleur = 'magenta'
		ifTrue: [ color := Color magenta ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	ang := f angleSommet: pto de: pta à: ptb.
	ang style color: color.
	self expert constructions: ang.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/6/2023 21:00'!
couleurObjet: n couleur: coul vars: lvars
"Mets en couleur un objet"
	| col nom objs app obj |
	app := self expert drgeo app.
	col := self valeur: coul vars: lvars.
	col = 'vert'
		ifTrue: [ col := Color green ].
	col = 'bleu'
		ifTrue: [ col := Color blue ].
	col = 'rouge'
		ifTrue: [ col := Color red ].
	col = 'magenta'
		ifTrue: [ col := Color magenta ].
	col = 'jaune'
		ifTrue: [ col := Color yellow ].
	col = 'cyan'
		ifTrue: [ col := Color cyan ].
	col = 'noir'
		ifTrue: [ col := Color black ].
	nom := self valeur: n vars: lvars.
	objs := app costumes.
	obj := objs detect: [ :x | nom = x name ] ifNone: [ ^ false ].
	self expert constructions
		add: (Array with: obj with: obj style color).
	obj style color: col.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/6/2023 21:00'!
couleurPoint: n couleur: coul vars: lvars
"Mets en couleur un point"
	| col nom points app |
	app := self expert drgeo app.
	col := self valeur: coul vars: lvars.
	col = 'vert'
		ifTrue: [ col := Color green ].
	col = 'bleu'
		ifTrue: [ col := Color blue ].
	col = 'rouge'
		ifTrue: [ col := Color red ].
	col = 'magenta'
		ifTrue: [ col := Color magenta ].
	col = 'jaune'
		ifTrue: [ col := Color yellow ].
	col = 'cyan'
		ifTrue: [ col := Color cyan ].
	col = 'noir'
		ifTrue: [ col := Color black ].
	nom := self valeur: n vars: lvars.
	points := app costumes select: [ :x | x class = DrGPointCostume ].
	(points detect: [ :x | nom = x name ] ifNone: [ ^ false ]) style
		color: col.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/6/2023 21:00'!
créePointMilieu: med Point: pt1 et: pt2 vars: lvars
"Crée le point au milieu d'une médiatrice"
	| f drg md point1 point2 pool item seg |
	drg := self expert drgeo app.
	f := DrGeoFigure viewLess.
	f drgeo: drg.
	pool := drg costumes.
	item := [ :x | pool detect: [ :it | x = it mathItem name ] ifNone: [ nil ] ].
	md := self instanciedValue: med vars: lvars.
	point1 := self instanciedValue: pt1 vars: lvars.
	point2 := self instanciedValue: pt2 vars: lvars.
	point1 := item value: point1.
	point2 := item value: point2.
	md := item value: md.
	seg := f segment: point1 to: point2.
	f intersectionOf: seg and: md.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/6/2023 21:01'!
distanceDe: pa a: pb coul: coul vars: lvars
"Affiche la distance entre eux points"
	| f drgeo cost a b dist pta ptb couleur color ptaMit ptbMit mx my |
	f := DrGeoFigure viewLess.
	drgeo := self expert drgeo app.
	cost := drgeo costumes.
	f drgeo: drgeo.
	a := self instanciedValue: pa vars: lvars.
	b := self instanciedValue: pb vars: lvars.
	couleur := self instanciedValue: coul vars: lvars.
	a ifNil: [ ^ false ].
	b ifNil: [ ^ false ].
	pta := cost detect: [ :x | x mathItem name = a ].
	ptb := cost detect: [ :x | x mathItem name = b ].
	couleur = 'noir'
		ifTrue: [ color := Color black ].
	couleur = 'blanc'
		ifTrue: [ color := Color white ].
	couleur = 'rouge'
		ifTrue: [ color := Color red ].
	couleur = 'jaune'
		ifTrue: [ color := Color yellow ].
	couleur = 'bleu'
		ifTrue: [ color := Color blue ].
	"true"
	couleur = 'cyan'
		ifTrue: [ color := Color cyan ].
	couleur = 'magenta'
		ifTrue: [ color := Color magenta ].
	dist := f distanceDe: pta a: ptb.
	dist style color: color.
	ptaMit := pta mathItem point.
	ptbMit := ptb mathItem point.
	mx := (ptaMit x - ptbMit x) / 2.
	my := (ptaMit y - ptbMit y) / 2.
	dist deplacerA: (ptbMit x + mx) @ (ptbMit y + my).
	f actualiser.
	self expert constructions: dist.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/7/2023 02:10'!
execute: acte vars: lvars
	"Evalue une action"

	| f drgeo act |
	f := DrGeoFigure viewLess.
	drgeo := self expert drgeo app.
	f drgeo: drgeo.
	act := (self instanciedValue: acte vars: lvars) asString.
	act ifNil: [ ^ false ].
	OpalCompiler new
		source:
			'f := DrGeoFigure viewLess.
	drgeo := DrGeo allInstances first  .
	f drgeo: drgeo.' , 'f  ' , act;
		evaluate.
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/7/2023 01:41'!
polyAjouteETNuméroteSommets: pol vars: lvars
	"Ajoute et numérote les sommets d'un objet polygone régulier"

	| f drg poly nomPoly nSom costumes sommets mit pt |
	drg := self expert drgeo app.
	f := DrGeoFigure viewLess.
	f drgeo: drg.
	nomPoly := self valeur: pol vars: lvars.
	(nomPoly = pol and: [ nomPoly beginsWith: '?' ])
		ifTrue: [ ^ false ].
	costumes := drg costumes.
	poly := costumes detect: [ :x | x name = nomPoly ].
	nSom := poly mathItem parents last valueItem - 1.
	sommets := costumes
		select: [ :x | 
			mit := x mathItem.
			mit class = DrGPointOncurveItem
				and: [ poly mathItem = mit parents first ] ].
	"n:=-1.
test:=true.
test:=sommets collect:[:x |test ifTrue: [n:=n+1] .test := (( x mathItem abscissa )=(n/6))].
((nSom-1 )=test size)"
	sommets size = nSom
		ifFalse: [ 0 to: nSom - 1 do: [ :nb | 
				pt := f pointSurLigne: poly a: nb / (nSom + 1).
				pt nommer: 'P' , (nb + 1) asString ] ].
	^ true! !

!ExpertRegle methodsFor: 'actions' stamp: 'DrGeoUser 11/7/2023 01:40'!
polyAjouteSommets: pol vars: lvars
	"Ajoute les sommets d'un polygone"

	| f drg poly nomPoly nSom costumes sommets mit |
	drg := self expert drgeo app.
	f := DrGeoFigure viewLess.
	f drgeo: drg.
	nomPoly := self valeur: pol vars: lvars.
	(nomPoly = pol and: [ nomPoly beginsWith: '?' ])
		ifTrue: [ ^ false ].
	costumes := drg costumes.
	poly := costumes detect: [ :x | x name = nomPoly ].
	nSom := poly mathItem parents last valueItem - 1.
	sommets := costumes
		select: [ :x | 
			mit := x mathItem.
			mit class = DrGPointOncurveItem
				and: [ poly mathItem = mit parents first ] ].
	"n:=-1.
test:=true.
test:=sommets collect:[:x |test ifTrue: [n:=n+1] .test := (( x mathItem abscissa )=(n/6))].
((nSom-1 )=test size)"
	sommets size = nSom
		ifFalse:
			[ 0 to: nSom - 1 do: [ :nb | f pointSurLigne: poly a: nb / (nSom + 1) ] ].
	^ true! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 1/26/2020 21:23'!
active: regle
self class  perform:  regle asSymbol withArguments:    expert.! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/16/2012 20:04'!
activeconcl: lVars 
	| res args |
args := res allButFirst.
	$: = concl first last
		ifTrue: [args add: lVars.
			self perform: (concl first , 'vars:') asSymbol withArguments: args asArray].

		^ res! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/12/2012 23:10'!
afficheConclusion
|res c|
res:= WriteStream on: ''.
c :=ReadStream on: self concl.
[res nextPutAll:( c next )asString.
(c atEnd)ifFalse:  [res nextPutAll:  ' '].
c atEnd ]whileFalse .

^ res contents.! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/20/2012 21:37'!
afficheConclusions
|res conc item|
res:='' writeStream .
conc :=(self instancieConcl )readStream .
[item :=( conc next) readStream. 
res cr.
	[res  nextPutAll: item next.
	res space.
	item atEnd ]whileFalse .
conc atEnd ]whileFalse .
^ res contents ! !

!ExpertRegle methodsFor: 'accessing' stamp: 'drgeo 6/18/2025 00:39:25'!
afficheRegle
	| temp1 temp2 temp3 |
	temp1 := WriteStream on: ''.
	temp2 := ReadStream on: self ant.
	temp1 nextPutAll: Character cr asString.
	temp1 nextPutAll: 'e lisRegle: '.
	temp1 nextPut: $'.
	temp1 nextPutAll: self nom.
	temp1 nextPut: $'.
	temp1 nextPut: Character cr.
	temp1 nextPutAll: 'si: '''.
	[
	temp3 := temp2 next.
	temp1 nextPutAll: temp3 printString.
	temp2 atEnd ifFalse: [ temp1 nextPut: Character cr ].
	temp2 atEnd ] whileFalse.
	temp1 nextPut: Character cr.
	temp1 nextPutAll: 'alors: '''.
	temp1 nextPutAll: concl printString.
	com ifNotNil: [
		temp1 nextPut: Character cr.
		temp1 nextPutAll: 'com: '.
		com printOn: temp1 ].
	temp1 nextPut: $.. 
	^ temp1 contents.! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/9/2012 01:17'!
afficheRegle1
	| a c f |
	a := ''.
	ant
		do: [:t5 | 
			f := ''.
			t5
				do: [:t6 | f := f , t6 , ' '].
			a := a , f , '
	'].
	c := ''.
	concl
		do: [:t5 | c := c , t5 , ' '].
	^ '
	Regle: ' , name , '
	si:
	' , a , '
	alors:
	' , c! !

!ExpertRegle methodsFor: 'accessing'!
ant
	^ ant! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 1/18/2012 00:45'!
ant: a 	
	ant := a! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/20/2012 11:05'!
antAstring
|res a|
res:=''writeStream .
ant do:
[:x| res nextPutAll: (expert  faitAsString: x).
	res cr].

^res contents! !

!ExpertRegle methodsFor: 'accessing' stamp: 'drgeo 9/5/2024 15:50:33'!
antecedents: aString 

	self
		ant: ((aString subStrings:'
')collect: [:m|ExpertList new:m])asOrderedCollection .
				
"self faitsMeConcernants ".
	! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 10/23/2023 02:33'!
com
com ifNil: [^''].
	^ com! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 6/30/2019 09:03'!
com: c
com :=c.! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/20/2023 03:16'!
commentaireRegle
	| cr keys rgls rgl e |
	e := DrGeo allInstances last view expert.
	cr := Character cr asString.
	keys := e regles keys sort.
	
	
	rgl := keys
		collect: [ :x | 
			rgl := e regles at: x.
			rgl name , ' >> ' , rgl concl asString , ' modèle: '
				, rgl concl first , ' ' , (rgl concl size - 1) asString , cr , '*'
				, rgl com , cr ].
	^ rgl! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/20/2023 02:59'!
commentaireRegle: groupe
	| cr keys rgls rgl e |
	e := DrGeo allInstances last view expert.
	cr := Character cr asString.
	keys := e regles keys.
	rgls := e regles keys select: [ :x | x beginsWith: groupe  asString ].
	rgls sort.
	rgl := rgls
		collect: [ :x | 
			rgl := e regles at: x.
			rgl name , ' >> ' , rgl concl asString , ' modèle: '
				, rgl concl first , ' ' , (rgl concl size - 1) asString , cr , '*'
				, rgl com , cr ].
	^ rgl! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/9/2023 01:45'!
commentaireRegle: groupe expert: e
	| cr keys rgls rgl |
	cr := Character cr asString.
	keys := e regles keys.
	rgls := e regles keys select: [ :x | x beginsWith: groupe ].
	rgls sort.
	rgl := rgls
		collect: [ :x | 
			rgl := e regles at: x.
			rgl name  , ' >> ' ,  rgl concl asString , cr , '*' , rgl com , cr ].
	^ rgl! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/7/2023 12:36'!
commentaires: cat
	| dict cr predicats |
	dict := ExpertRegle methodDictionary.
	cr := Character cr asString.
	predicats := dict keys select: [ :x | (dict at: x) category = cat ].
	predicats := predicats sort.
	^ predicats
		collect: [ :x | x asString , '	->' , (dict at: x) comment asString , cr ]! !

!ExpertRegle methodsFor: 'accessing'!
concl
	^ concl! !

!ExpertRegle methodsFor: 'accessing' stamp: 'drgeo 7/30/2024 09:34:53'!
concl: c 
	| conclusion |
	conclusion := c.
	(conclusion isString)
		ifTrue: [conclusion := ExpertList new: c].
	^ concl := conclusion! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 4/13/2020 11:44'!
contient: obj relation: res
^ res includes: obj ! !

!ExpertRegle methodsFor: 'accessing'!
expert
	^ expert! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 1/18/2012 00:49'!
expert: exp 
	expert := exp! !

!ExpertRegle methodsFor: 'accessing' stamp: 'drgeo 10/13/2024 19:49:33'!
faitsMeConcernants
|lregl|

ant ifNotNil: 
	[ lf:=ant select: [:r|(r notEmpty)and:[ r notNil] ]
		thenCollect: [:t2 | (t2 first) ]   . 
			
		 lregl:=  lf collect:[:t|lregl:=	self expert faits at: ((t,'-regles')asSymbol)
		                                         ifAbsent:[Set new].
			lregl add:self nom.
		self expert faits at: (t,'-regles')asSymbol put:lregl]
 	].
^lf.! !

!ExpertRegle methodsFor: 'accessing' stamp: 'drgeo 10/13/2024 19:50:28'!
faitsMeConcernants0
||
ant ifNotNil: [ lf :=( (ant select: [:r|r notEmpty ])
				collect: [:t2 | (t2 first) ])asSet. ]
	! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/11/2022 15:39'!
findText: txt
self expert indTexte: txt! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/11/2022 15:50'!
indTexte
	^ self expert indTexte! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/11/2022 15:52'!
indTexte: txt
self expert indTexte: txt! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/20/2012 12:35'!
initLv
lv :=Set  new.! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 8/3/2020 21:16'!
instancie: lVars 
^self instancie: lVars fait: concl.! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/4/2019 15:57'!
instancie: lVars fait: f
	| res |
	lVars
		ifNil: [^ f ].
	(lVars isKindOf: IdentityDictionary)
		ifFalse: [^ f].

res:=	f	do: [:t4 |self valeur: t4 vars: lVars ].
"	args := res contents allButFirst.
	$: = concl first last
	ifTrue: [args add: lVars.
			self perform: (concl first , 'vars:') asSymbol withArguments: args asArray].
"
	^ res ! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/20/2012 21:40'!
instancieConcl
^(((expert  applatis: (self lv asOrderedCollection ) )asSet )asOrderedCollection )collect: [:m|self instancie:  m] 
! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 12/8/2021 17:47'!
instancieNum:  f
	| res n faits |
	faits := ExpertList new: f.
	n := 0.
	
	res := faits
		do: [ :t4 | 
			(self expert floatString: t4)
				ifTrue: [ n := n + 1.
					'?&' , n asString ]
				ifFalse: [t4 ]].
	^ res! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 12/8/2021 04:17'!
instancieNum: lVars fait: f
	| res n faits |
	faits := ExpertList new: f.
	n := 0.
	lVars ifNil: [ ^ f ].
	(lVars isKindOf: IdentityDictionary)
		ifFalse: [ ^ f ].
	res := faits
		do: [ :t4 | 
			(self expert  floatString: t4)
				ifTrue: [ n := n + 1.
					'?&' , n asString ]
				ifFalse: [ self valeur: t4 vars: lVars ] ].
	^ res! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 1/18/2012 19:21'!
lf
^lf! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 5/12/2020 18:13'!
lf: aSet
lf := aSet .! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/21/2012 00:45'!
lv
^lv asOrderedCollection ! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/20/2012 11:57'!
lv:t
lv:=t! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 9/25/2012 23:48'!
lvAdd:t
lv ifNil: [lv:=Set new ].
lv add: t.
^t ! !

!ExpertRegle methodsFor: 'accessing'!
name
	^ name! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 1/18/2012 01:07'!
name: nom 
	name := nom! !

!ExpertRegle methodsFor: 'accessing'!
nom
	^ name! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 1/18/2012 01:10'!
nom: monNom 
	name := monNom! !

!ExpertRegle methodsFor: 'accessing' stamp: 'drgeo 9/28/2025 21:48:14'!
perform: aCond vars: lVars 
	| sel args c nSel|
	sel := aCond removeFirst.
		nSel:=(sel  findBetweenSubStrs:  ':' )size .
	sel := (sel asString, 'vars:') asSymbol.
	c := aCond .
	"(nSel < c size)ifTrue: [c :=(Array with: c )asOrderedCollection ]."
	c add: lVars.
	args := c asArray.
	^ self  perform: sel   withArguments: args .
	
	! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 11/29/2022 16:32'!
predComm: pred
	| txt start last |
	txt := (ExpertRegle methodDict at: (pred asSymbol)) sourceCode.
	start := txt indexOf: $" startingAt: 1.
	last := txt indexOf: $" startingAt: start + 1.
	^ txt collect: [ :x | x ] from: start + 1 to: last - 1! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 2/3/2020 20:58'!
reglesConcluant: aStringOrList
|f   l  u|
f:=aStringOrList.
f isString ifTrue: [ f:=self expert list: f  ].
l:= expert  regles keys.
l:=l collect:[:r|(expert regles at:r asSymbol )].
^ l select: ( [ :x| lv:=IdentityDictionary new.u:=expert unifie: (x concl )avec:  f vars: lv . u~=false]).

! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 1/18/2012 01:11'!
renomme: nouvNom 
	| ancNom |
	ancNom := self nom.
	self nom: nouvNom.
	expert regles at: nouvNom asSymbol put: self.
	expert regles removeKey: ancNom asSymbol.
	^ ancNom! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 8/3/2020 18:05'!
varLibre: vl val: vaieur vars: lvars
((vl isString) and: [vl beginsWith: '?' ] )ifTrue:[ ^ (vl = vaieur ) ].
^ false.

! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 6/10/2020 11:03'!
varLibre: vl vars: lvars
(vl asString beginsWith: '?' )ifFalse:  [ true ].
^(self valeur: vl vars: lvars) = vl.
! !

!ExpertRegle methodsFor: 'accessing' stamp: 'drgeo 1/19/2025 21:59:26'!
verifAnt: antes vars: lvars
	| base lant lfClef myAnt aFirst r |
	neg := false.
	cut := false.
	"self halt."
	lant := antes copy.
	lant class ~= OrderedCollection
		ifTrue: [ ^ false ].
	aFirst := OrderedCollection new.
	lant ifNil: [ ^ false ].
	lfClef := lant first first asSymbol.
	lfClef = #!!
		ifTrue: [ lant first removeFirst.
			cut := true.
			lant first isEmpty
				ifFalse: [ lfClef := lant first first asSymbol ] ].
	lfClef = #~
		ifTrue: [ lant first removeFirst.
			neg := true ].
	lant first isEmpty
		ifFalse: [ lfClef := lant first first asSymbol ].
		
		"Traitement des prédicats"
		
	lfClef last=$:
		ifTrue: [ r := self perform: lant  first copyList vars: lvars.  
			neg
				ifTrue: [ r := r not ].
			r
				ifTrue: [ aFirst := lvars ]
				ifFalse: [ ^ false ].
			lant removeFirst.
			lant ifEmpty: [ ^ self lvAdd: lvars ].
			^ self verifAnt: lant vars: lvars ].
		"traitement des faits"
	base := self expert faitsAt: lfClef.
	base
		ifNil: [ neg
				ifTrue: [ ^ lvars ].
			^ false ].
	base := base reject: [ :m | m retire ].
	aFirst := base
		collect: [ :t10 | 
			myAnt := lvars copy.
			r := self unifie: lant first avec: t10 fait vars: myAnt.
			r ~= false
				ifTrue: [ r := true ].
			r
				ifTrue: [ r := myAnt ].
			neg
				ifTrue: [ r ~= false
						ifTrue: [ r := false ]
						ifFalse: [ r := myAnt ] ].
			r ].
	neg
		ifTrue: [ (aFirst includes: false)
				ifTrue: [ aFirst := OrderedCollection new ] ].
	aFirst := aFirst select: [ :t10 | (t10 = false) not ].
	lant removeFirst.
	lant ifEmpty: [ ^ self lvAdd: (self applatis: aFirst) ].
	^ (self applatis: aFirst)
		collect: [ :t10 | self verifAnt: lant vars: t10 ]! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 2/18/2013 00:33'!
verifAntecedants
^  self verifAntecedants: IdentityDictionary new! !

!ExpertRegle methodsFor: 'accessing' stamp: 'drgeo 1/19/2025 21:36:55'!
verifAntecedants:lvars
	| res flse|
	"self halt."
	flse:=false.
	self initLv.
	res := self verifAnt: self ant copy vars: lvars. 

	res
		ifNil: [^ false].
	res = flse
		ifTrue: [^false].
	res:=
	self	applatis: (res	reject:  [:t2 | (t2 = flse) or:[t2 isNil ]]) .
	res:= (res asSet) .
	res:=res asOrderedCollection .
	 cut ifTrue:  [cut:=false. res ifNotEmpty: [res:= OrderedCollection with: res first]].
	^res! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/18/2012 23:52'!
verifHyp
|lv|
lv :=self verifAnt: self ant  vars: (IdentityDictionary  new) .
^ lv collect:[:m | (self ant)collect: [:m1|   self instancie: m  fait: m1]].

! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/29/2012 11:47'!
verifHyp: lvars 
|lv2|
lv2 :=self verifAnt: self ant  vars: lvars .
^( lv2 collect:[:m | (self ant)collect: [:m1|   self instancie: m  fait: m1]]).

! !

!ExpertRegle methodsFor: 'accessing' stamp: 'pad 2/28/2012 13:40'!
verifRegle
	^ self verifRegle: IdentityDictionary new.! !

!ExpertRegle methodsFor: 'accessing' stamp: 'DrGeoUser 6/28/2022 20:48'!
verifRegle: lvars
	| etat res  |
	"Transcript show:'
	verifie :', self nom ;cr ."
	"neg:=false.
	w:=  expert drgeo app view."
	   
	etat := (self verifAntecedants:lvars)
				ifNil: [^ false].
	(etat =false)ifTrue: [^ false].
	etat ifEmpty:  [^ true].
		
	etat ~= false
		ifTrue: [res := etat
						select: [:t3 | (t3 notNil ) and: [t3 ~= false ]	]		
						thenCollect: [:t3 | Array
								with: t3
								with: (self instancie: t3)].
"	expert trace: res."
			res
				do: [:t3 | t3
						ifNotEmpty: [self expert
								affirme: self name
								fait: t3 last asString
								vars: t3 first]]].
	^ self applatis: res! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 01:46'!
addFirst: list el: elem rep: res vars: lvars
	"Ajoute en premier un élément à une liste"

	| l rep el |
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	el := self valeur: elem vars: lvars.
	(el = elem and: [ el asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	rep := self valeur: res vars: lvars.
	l isList
		ifTrue: [ ^ self affecte: rep valeur: (l addFirst: el) vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 01:58'!
addLast: list el: elem rep: res vars: lvars
	"Ajoute un élément à la fin d'une liste"

	| l rep el |
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	el := self valeur: elem vars: lvars.
	(el = elem and: [ el asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	rep := self valeur: res vars: lvars.
	l isList
		ifTrue: [ ^ self affecte: rep valeur: (l addLast: el) vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 01:49'!
ajoute: mot liste: l rep: res vars: lvars
"Ajoute  un élément à la fin d'une liste"
	| t4 t5 faux |
	faux := false.
	t4 := self valeur: mot vars: lvars.
	t4 = mot
		ifTrue: [ ^ faux ].
	t5 := self valeur: l vars: lvars.
	(t5 = l and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ faux ].
	t5 := t5 addLast: t4.
	^ self affecte: res valeur: t5 vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 01:56'!
ajouteDernierUnique: list el: elem rep: res vars: lvars
	"Ajoute un élément à la fin d'une liste, s'il n'est pas déjà dans la liste"

	| l rep el |
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	el := self valeur: elem vars: lvars.
	(el = elem and: [ el asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	rep := self valeur: res vars: lvars.
	l isList
		ifTrue:
			[ ^ self affecte: rep valeur: (l addLastIfNotIncluded: el) vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 01:59'!
ajoutePremier: list el: elem rep: res vars: lvars
	"Ajoute un élément à la tête d'une liste"

	| l rep el |
	l := self instanciedValue: list vars: lvars.
	l ifNil: [ ^ false ].
	el := self instanciedValue: elem vars: lvars.
	el ifNil: [ ^ false ].
	rep := self valeur: res vars: lvars.
	l isList
		ifTrue: [ ^ self affecte: rep valeur: (l := l addFirst: el) vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 02:04'!
ajoutePremierUnique: list el: elem rep: res vars: lvars
	"Ajoute un élément à la tête d'une liste, s'il n'est pas déjà dans la liste"

	| l rep el |
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	el := self valeur: elem vars: lvars.
	(el = elem and: [ el asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	rep := self valeur: res vars: lvars.
	l isList
		ifTrue: [ ^ self
				affecte: rep
				valeur: (l addFirstIfNotIncluded: el)
				vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 12/8/2023 12:25'!
commencePar: n début: mot vars: lvar
	"vérifie si un mot commence par début ou si c'est  une liste "

	| nm mt |
	mt := self instanciedValue: mot vars: lvar.
	mt ifNil: [ ^ false ].
	nm := self instanciedValue: n vars: lvar.
	nm ifNil: [ ^ false ].
	nm isList ifTrue:  [  ^ false ].
	 ^ nm beginsWith: mt .
! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 12/8/2023 12:30'!
commencePar: n débutOuListe: mot vars: lvar
	"vérifie si un mot commence par début ou si c'est  une liste "

	| nm mt |
	mt := self instanciedValue: mot vars: lvar.
	mt ifNil: [ ^ false ].
	nm := self instanciedValue: n vars: lvar.
	nm ifNil: [ ^ false ].
	nm class = ExpertList ifTrue: [ ^ true ].
	^ nm beginsWith: mt! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/26/2023 01:44'!
constructions: cons rep: res vars: lvars
"Construit un objet dans la figure"
	| constr |
	constr := cons instanciedValue: cons vars: lvars.
	constr ifNil: [ ^ false ].
	^ self affecte: res valeur: constr vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/27/2023 20:12'!
contient: obj liste: l vars: lvars
"Vérifie si un objet est présent dans une liste"
	| t1 t2 faux |
	faux := false.
	t1 := self valeur: obj vars: lvars.
	t2 := self valeur: l vars: lvars.
	t1 = l
		ifTrue: [ ^ faux ].
	t2 = obj
		ifTrue: [ ^ faux ].
	^ t2 includes: t1! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/6/2023 21:02'!
couples: list rep: res vars: lvars
"Associe une liste de deux points à un nom pour former un couple"
	| lst |
	lst := self instanciedValue: list vars: lvars.
	lst ifNil: [ ^ false ].
	lst isList
		ifTrue: [ ^ self affecte: res valeur: lst couples vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/26/2023 01:49'!
dernier: list rep: res vars: lvars
"Le dernier élément d'une liste"
	| l rep |
	l := self valeur: list vars: lvars.
	rep := self valeur: res vars: lvars.
	(l = res and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	l isList
		ifTrue: [ l isEmpty
				ifTrue: [ ^ false ].
			^ self affecte: rep valeur: l last vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/26/2023 01:50'!
derniers: list rep: res vars: lvars
"Les derniers éléments d'une liste de listes"
	| lst |
	lst := self valeur: list vars: lvars.
	(lst = list and: [ lst beginsWith: '?' ])
		ifTrue: [ ^ false ].
	^ self
		affecte: res
		valeur: (lst collect: [ :x | x last ])
		vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 02:02'!
enleverDe: list el: el rep: res vars: lvars
	"Enlève un élément à une liste, si la liste restante n'a qu'un élément  retourne cet élément"

	| t1 t2 t3 flse r |
	flse := false.
	t1 := self valeur: list vars: lvars.
	t1 ifNil: [ ^ false ].
	t2 := self valeur: el vars: lvars.
	(t1 includes: t2)
		ifFalse: [ ^ false ].
	t2 ifNil: [ ^ false ].
	t3 := self valeur: res vars: lvars.
	t2 ifNil: [ ^ false ].
	r := t1 reject: [ :x | t2 = x ].
	1 = r size
		ifTrue: [ r := r first ].
	(self varLibre: el val: t2 vars: lvars)
		ifTrue: [ ^ flse ].
	((t3 asString beginsWith: '?') and: [ t3 = res asString ])
		ifTrue: [ ^ self affecte: t3 valeur: r vars: lvars ].
	^ self unifie: t3 avec: r vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 02:27'!
excludes: list el: el vars: lvars
	"Vérifie qu'un élément n'appartient pas à un ensemble"

	| t1 t2 |
	t1 := self valeur: list vars: lvars.
	t2 := self valeur: el vars: lvars.
	^ (t1 includes: t2) not! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/26/2023 02:17'!
élément: list à: n rep: res vars: lvars
"L'élément de la liste à une position n"
	| lst ind |
	lst := self valeur: list vars: lvars.
	(lst = list and: [ lst beginsWith: '?' ])
		ifTrue: [ ^ false ].
	ind := self instanciedValue: n vars: lvars.
	^ self affecte: res valeur: (lst at: ind asNumber) vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/6/2023 21:03'!
includes: list el: el vars: lvar
"Vérifie qu'une liste contient un élément"
	| t1 t2 |
	t1 := self valeur: list vars: lvar.
	t2 := self valeur: el vars: lvar.
	^ t1 includes: t2! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 02:31'!
index: list el: el rep: res vars: lvars
	"Retourne l'indice d'un élément dans une liste"

	| t1 t2 t3 flse r l |
	flse := false.
	t1 := self instanciedValue: list vars: lvars.
	t1 ifNil: [ ^ flse ].
	t1 isList
		ifFalse: [ l := ExpertList new.
			l add: t1 asSymbol.
			t1 := l ].
	t1 isList.
	t2 := self instanciedValue: el vars: lvars.
	t2 ifNil: [ ^ flse ].
	t3 := self valeur: res vars: lvars.
	r := t1 index: t2.
	r ifNotNil: [ ^ self affecte: res valeur: r vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'drgeo 4/11/2025 03:47:02'!
inverse: list rep:res vars: lvars
| lst inv |

lst := self valeur: list vars: lvars.
inv :=ExpertList new.
lst do: [ :x|inv  addFirst: x].
 ^self
		affecte: res
		valeur: inv
		vars: lvars.

! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/6/2023 21:03'!
joint: l1 avec: l2 rep: res vars: lvars
"Réunit les éléments de deux listes"
	| ll1 ll2 |
	ll1 := self valeur: l1 vars: lvars.
	ll2 := self valeur: l2 vars: lvars.
	^ self affecte: res valeur: (ll1 append: ll2) vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 13:42'!
min: alist rep: rep vars: lvars
	"Le plus petit élément d'une  liste"

	| l res |
	l := self valeur: alist vars: lvars.
	res := l min.
	^ self affecte: rep valeur: res vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/26/2023 02:00'!
nonContient: list el: el vars: lvars
"Vérifie qu'un élément n'est pas dans une liste"
	| t1 t2 res |
	t1 := self instanciedValue: list vars: lvars.
	t2 := self instanciedValue: el vars: lvars.
	(t1 isNil or: [ t2 isNil ])
		ifTrue: [ ^ false ].
	(t1 isKindOf: ByteSymbol)
		ifTrue: [ ^ (t1 asString indexOf: (t2 at: 1)) > 0 ].
	^ (t1 includes: t2) not! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 02:39'!
nonTousPositifs: list vars: lvars
	"Vérifie que les éléments d'une liste ne sont pas tous positifs"

	| l |
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	l isList
		ifFalse: [ ^ false ].
	^ (l all: [ :x | x > 0 ]) not! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 02:41'!
premier: list rep: res vars: lvars
	"Le premier élément d'une liste"

	| l rep |
	l := self valeur: list vars: lvars.
	(l = res and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	l isEmpty
		ifTrue: [ ^ false ].
	rep := self valeur: res vars: lvars.
	l isList
		ifTrue: [ l isEmpty
				ifTrue: [ ^ false ].
			^ self affecte: rep valeur: l first vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 13:38'!
premiers: list rep: res vars: lvars
	"Les premiers des éléments d'une liste de listes"

	| lst |
	lst := self valeur: list vars: lvars.
	(lst isString
		and: [ lst = list and: [ lst asString beginsWith: '?' ] ])
		ifTrue: [ ^ false ].
	^ self
		affecte: res
		valeur:
			(lst
				collect: [ :x | 
					x isList
						ifTrue: [ x first ]
						ifFalse: [ (ExpertList
								new: (self expert verifieCondition: 'segment ' , x , ' ?s'))
								allButLast allButLast last first asString ] ])
		vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 02:43'!
saufDernier: list rep: res vars: lvars
	"Les éléments d'une liste sauf le dernier"

	| l rep |
	l := self valeur: list vars: lvars.
	rep := self valeur: res vars: lvars.
	l size = 1
		ifFalse: [ ^ self affecte: rep valeur: l allButLast vars: lvars ].
	^ self affecte: rep valeur: ExpertList new vars: lvars! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/6/2023 21:05'!
saufPremier: list rep: res vars: lvars
	"Les éléments d'une liste sauf le premier"
	| l rep |
	l := self valeur: list vars: lvars.
	rep := self valeur: res vars: lvars.
	(l = res and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	l isList
		ifTrue: [ ^ self affecte: rep valeur: l allButFirst vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/26/2023 02:06'!
somme: list rep: res vars: lvar
"La somme de tous les éléments d'une liste"
	| lst |
	lst := self instanciedValue: list vars: lvar.
	lst ifNotNil: [ ^ self affecte: res valeur: lst sum vars: lvar ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 13:43'!
sort: mot block: bl rep: rep vars: lvars
	"Trie les éléments d'une liste selon un critère décrit dans le block"

	| t4 faux result |
	faux := false.
	t4 := self valeur: mot vars: lvars.
	(t4 = mot and: [ t4 asString beginsWith: '?' ])
		ifFalse: [ (rep asString beginsWith: '?')
				ifTrue: [ result := t4 sort: bl.
					^ self affecte: rep valeur: result vars: lvars ]
				ifFalse: [ ^ result = mot ] ].
	^ faux! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 03:01'!
taille: list rep: res vars: lvars
	"Le nombre d'éléments de la liste"

	| l rep |
	l := self valeur: list vars: lvars.
	rep := self valeur: res vars: lvars.
	(l = res and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	l isList
		ifTrue: [ l isEmpty
				ifTrue: [ ^ self affecte: rep valeur: 0 vars: lvars ].
			^ self affecte: rep valeur: l size vars: lvars ].
	^ false! !

!ExpertRegle methodsFor: 'list' stamp: 'drgeo 7/28/2025 00:34:32'!
tousDifferents: list vars: lvars
	"Vérifie que tous les éléments de la liste sont différents"

	| l |
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	l isList
		ifFalse: [ ^ false ].
	^ l tousDifférents ! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/26/2023 02:11'!
tousNégatifs: list vars: lvars
	"Vérifie que tous les éléments de la liste sont négatifs"

	| l |
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	l isList
		ifFalse: [ ^ false ].
	^ l all: [ :x | x asNumber < 0 ]! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 10/26/2023 02:11'!
tousPositifs: list vars: lvars
	"Vérifie que tous les éléments de la liste sont positifs"

	| l |
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifTrue: [ ^ false ].
	l isList
		ifFalse: [ ^ false ].
	^ l all: [ :x | x asNumber > 0 ]! !

!ExpertRegle methodsFor: 'list' stamp: 'DrGeoUser 11/7/2023 02:48'!
triePointsSur: mot droite: d rep: rep vars: lvars
	"Trie les points sur une droite"

	| t4 faux result pool dr item |
	faux := false.
	dr := self valeur: d vars: lvars.
	dr isList
		ifTrue: [ ^ false ].
	pool := self expert drgeo domain factory pool.
	item := [ :x | pool detect: [ :it | x = it name ] ifNone: [ nil ] ].
	dr := item value: dr.
	dr ifNil: [ ^ false ].
	t4 := self valeur: mot vars: lvars.
	(t4 = mot and: [ t4 asString beginsWith: '?' ])
		ifFalse: [ (rep asString beginsWith: '?')
				ifTrue: [ result := t4
						sort: [ :x :y | 
							(dr abscissaOf: (item value: x) point)
								< (dr abscissaOf: (item value: y) point) ] ].
			^ self affecte: rep valeur: result vars: lvars ].
	^ faux! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/7/2023 01:54'!
ajouteDernier: list el: elem rep: res vars: lvars
	"Ajoute un élément à la fin d'une liste"

	| l rep el result1 |
	rep := nil.
	el := nil.
	result1 := false.
	l := self valeur: list vars: lvars.
	(l = list and: [ l asString beginsWith: '?' ])
		ifFalse: [ el := self valeur: elem vars: lvars ].
	(el = elem and: [ el asString beginsWith: '?' ])
		ifFalse: [ rep := self valeur: res vars: lvars ].
	l isList
		ifTrue: [ result1 := self affecte: rep valeur: (l addLast: el) vars: lvars ].
	^ result1! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:12'!
alignés: p1 avec: p2 et: p3 vars: lvars
"Vérifie que trois points sont alignés"
	| pp1 pp2 pp3 pp1Point pp2Point pp3Point f points deltap pente |
	pp1 := self valeur: p1 vars: lvars.
	pp2 := self valeur: p2 vars: lvars.
	pp3 := self valeur: p3 vars: lvars.
	((pp1 beginsWith: '?') and: [ p1 = pp1 ])
		ifTrue: [ ^ false ].
	((pp2 beginsWith: '?') and: [ p2 = pp2 ])
		ifTrue: [ ^ false ].
	((pp3 beginsWith: '?') and: [ p3 = pp3 ])
		ifTrue: [ ^ false ].
	f := DrGeoFigure viewLess.
	f drgeo: self expert drgeo app.
	points := f drgeo area submorphs
		select: [ :x | DrGPointMorph = x class ].
	pp1 := points
		detect: [ :p | pp1 = p costume name ]
		ifNone: [ ^ false ].
	pp2 := points
		detect: [ :p | pp2 = p costume name ]
		ifNone: [ ^ false ].
	pp3 := points
		detect: [ :p | pp3 = p costume name ]
		ifNone: [ ^ false ].
	pp1Point := pp1 costume mathItem point.
	pp2Point := pp2 costume mathItem point.
	pp3Point := pp3 costume mathItem point.
	deltap := pp3Point - pp2Point.
	0 ~= deltap x
		ifTrue: [ pente := deltap y / deltap x.
			^ pp1Point
				=
					((pp1Point x - pp3Point x) @ (pp3Point y + (pente * pp1Point x))) ]
		ifFalse: [ ^ pp1Point x = pp2Point x and: [ pp1Point x = pp3Point x ] ]! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'drgeo 11/17/2024 19:51:58'!
asLowerCase:str rep: res vars:lvars
|rep|
rep:= (self instanciedValue: str vars: lvars )asLowercase .
self affecte: res valeur: rep vars: lvars.
^true! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:57'!
compteFaits: aFait rep: r vars: lVars
	"Compte le nombre de mêmes faits correspondant à un modèle de question pour un faits sous forme de liste"

	| n |
	n := ((self expert verifieFait: aFait vars: lVars)
		select: [ :x | x first notNil ]) size.
	^ self affecte: r valeur: n asString vars: lVars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'drgeo 10/16/2024 15:43:42'!
contraire: cont mot: mot rep: res vars: lvars
	"décrit le contraire d''un mot"

	| m c |
	m := self instanciedValue: mot vars: lvars.
	c := self instanciedValue: cont vars: lvars.
	^ self expert affecte: res valeur: cont vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:57'!
créeNom: alist rep: rep vars: lvars
	"Construit un nom à partir des éléments d''une liste"

	| lst |
	lst := self valeur: alist vars: lvars.
	lst := lst makeNom.
	^ self affecte: rep valeur: lst vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 10/27/2023 20:27'!
créeNomMin: aList rep: rep vars: lvars
"Crée un nom pour une permutation minimum des éléments de la liste"
	| lst0 lst lst2 lstLast |
	lst0 := lst := self valeur: aList vars: lvars.
	lst := lst permuteMin.
	lstLast := lst last.
	lst2 := lst allButFirst first.
	lst2 > lstLast
		ifTrue: [ ^ false ].
	lst := lst makeNom.
	^ self affecte: rep valeur: lst vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:57'!
créeNomUnique: mot rep: res vars: lvars
"Crée un nom suivi d'u numéro unique. "
	^ self expert
		affecte: res
		valeur: mot , self gensym asString
		vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 10/27/2023 23:08'!
different: x de: y vars: lVars
" Vérifie que deux objets sont différents"
	| t4 t5 pool item diff tt4 tt5 |
	
	"	pool := self expert drgeo app domain factory pool.
	item := [ :nom | pool detect: [ :n | nom = n name ] ifNone: [ nil ] ].
	
	tt4 := item value: t4.
	tt5 := item value: t5."
	t4 := self instanciedValue: x vars: lVars.
	t5 := self instanciedValue: y vars: lVars.
		(t5 isNil or: [ t4 isNil ])ifTrue: [ ^ false ].
		
	(t4 isNumber and: [ t5 isNumber ])
		ifTrue: [ ^ (t4 - t5) abs > 0.001 ].
	"(tt4 notNil and: [ tt5 notNil ])
		ifTrue: [ ((tt4 isKindOf: DrGPointItem) and: [ tt5 isKindOf: DrGPointItem ])
				ifTrue: [ diff := (tt4 point - tt5 point) abs.
					^ diff x > 0.001 or: [ diff y > 0.001 ] ] ]."

	"t4 isNumber
		ifTrue: [ t4 := t4 asString ].
	t5 isNumber
		ifTrue: [ t5 := t5 asString ]."
	"xclass := (item value: t4)   .
	yclass := (item value: t5)  . 
    ( ( yclass  class superclass =DrGPointItem ) and: [  xclass class superclass =DrGPointItem ] )
       	ifTrue: 
		  [  ((xclass point - yclass point  )   abs )<  (0.0001@0.0001) ifTrue: [ ^ false ] ]."
	^ t4 ~= t5! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 10/27/2023 20:39'!
direction: p rep: res vars: lvar
"Retourne un point qui est l''extrémité d''un vecteur qui a pour origine le point 0@0. "
	| pt result pool obj |
	pool := self expert drgeo domain factory pool.
	pt := self instanciedValue: p vars: lvar.
	pt ifNil: [ ^ false ].
	obj := pool detect: [ :x | pt = x name ] ifNone: [ ^ false ].
	result := obj direction.
	^ self affecte: res valeur: result vars: lvar! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 10/27/2023 20:52'!
distance: p1 a: p2 rep: res vars: lvars
"La distance entre deux points"
	| pp1 pp2 f points rep rres drgeo |
	pp1 := self valeur: p1 vars: lvars.
	pp2 := self valeur: p2 vars: lvars.
	rres := self valeur: res vars: lvars.
	((pp1 beginsWith: '?') and: [ p1 = pp1 ])
		ifTrue: [ ^ false ].
	((pp2 beginsWith: '?') and: [ p2 = pp2 ])
		ifTrue: [ ^ false ].
	drgeo := self expert drgeo app.
	points := drgeo costumes.
	pp1 := points
		detect: [ :p | pp1 = p mathItem name ]
		ifNone: [ ^ false ].
	pp2 := points
		detect: [ :p | pp2 = p mathItem name ]
		ifNone: [ ^ false ].
	pp1 := pp1 mathItem point.
	pp2 := pp2 mathItem point.
	rep := pp1 distanceTo: pp2.
	^ self affecte: rres valeur: rep vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 10/27/2023 20:53'!
distance: p1 à: p2 rep: res vars: lvars
"La distance entre deux points"
	| pp1 pp2 f points rep rres drgeo |
	pp1 := self valeur: p1 vars: lvars.
	pp2 := self valeur: p2 vars: lvars.
	rres := self valeur: res vars: lvars.
	pp1 isString
		ifTrue: [ ((pp1 beginsWith: '?') and: [ p1 = pp1 ])
				ifTrue: [ ^ false ] ].
	pp2 isString
		ifTrue: [ ((pp2 beginsWith: '?') and: [ p2 = pp2 ])
				ifTrue: [ ^ false ] ].
	drgeo := self expert drgeo app.
	points := drgeo costumes.
	pp1 := points
		detect: [ :p | pp1 = p mathItem name ]
		ifNone: [ ^ false ].
	pp2 := points
		detect: [ :p | pp2 = p mathItem name ]
		ifNone: [ ^ false ].
	pp1 := pp1 mathItem point.
	pp2 := pp2 mathItem point.
	rep := pp1 distanceTo: pp2.
	^ self affecte: rres valeur: rep vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:31'!
extrémité: obj rep: res vars: lvar
	"Le deuxième parent d'un segment ou d'une droite"

	| ob result pool objet |
	pool := self expert drgeo domain factory pool.
	ob := self instanciedValue: obj vars: lvar.
	ob ifNil: [ ^ false ].
	objet := pool detect: [ :x | ob = x name ].
	result := objet parents last name.
	^ self affecte: res valeur: result vars: lvar! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/7/2023 03:56'!
égaux: x et: y vars: lVars
"Vérifie si des objets sont égaux, si l'un des termes n'et pas  instancié, unifie ce terme avec l'autre terme"
	| t4 t5 |
	t4 := self instanciedValue: x vars: lVars.
	t5 := self instanciedValue: y vars: lVars.
	(t5 notNil and: [ t4 notNil ])
		ifTrue: [ ^ t4 = t5 ].
	(t4 isNil and: [ t5 notNil ])
		ifTrue: [ t5 isList
				ifTrue: [ t5 := ExpertList new: '[ [  ' , t5 printString , ' ] ]' ].
			^ self unifie: x avec: t5 vars: lVars ].
	(t5 isNil and: [ t4 notNil ])
		ifTrue: [ t4 isList
				ifTrue: [ t4 := ExpertList new: '[ [  ' , t4 printString , ' ] ]' ].
			^ self unifie: y avec: t4 vars: lVars ].
	^ false! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 10/27/2023 20:59'!
instanciedValue: val vars: lvars
"Valeur attribuée à une variable, retourne faux si la variable n''a  pas reçu de valeur "
	| res |
	res := self valeur: val vars: lvars.
	((val asString beginsWith: '?') and: [ res = val ])
		ifTrue: [ ^ nil ].
	^ res! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'drgeo 4/12/2025 15:19:12'!
listeEnMot: m1 rep:res vars: lvar
|mot rep |
"self halt."
rep :=''. 
mot:= self instanciedValue: m1 vars: lvar. 
mot isList ifTrue: [mot do:[:mm| rep:= rep , (mm asString)] .
^ self affecte: res valeur: rep vars: lvar].
^false.! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 10/27/2023 21:00'!
max: alist rep: rep vars: lvars
"Le maximum d''une liste"
	| l res |
	l := self valeur: alist vars: lvars.
	res := l max.
	^ self affecte: rep valeur: res vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/28/2023 14:17'!
membre: obj liste: l vars: lvars
	"Vérifie si un objet est présent dans une liste, obj peut être  une variable libre"

	| t1 t2 faux pool drgeo res |
	pool := drgeo domain factory pool.
	faux := false.
	t1 := self valeur: obj vars: lvars.
	t2 := self valeur: l vars: lvars.
	t1 = obj
		ifTrue: [ res := pool select: [ :x | x isKindOf: DrGPointFreeItem ].
			res do: [ :m | self affecte: res valeur: m vars: lvars ].
			^ true ].
	t2 = l
		ifTrue: [ ^ faux ].
	^ t2 includes: t1! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 10/27/2023 21:36'!
minMot: mot rep: rep vars: lvars
"Le plus  petit caractère d'un mot"
	| t4 |
	t4 := self valeur: mot vars: lvars.
	t4 = mot
		ifTrue: [ ^ false ].
	^ self affecte: rep valeur: t4 min vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'drgeo 8/8/2025 01:48:48'!
minimum: mot rep: rep vars: lvars
	"Le minimum d'une liste"
	| t4 |
	t4 := self instanciedValue: mot vars: lvars.
	t4 ifNil: [ ^ false ].
	^ self affecte: rep valeur: (self minimum: t4) vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:21'!
mot: mot1 et: mot2 et: mot3 rep: rep vars: lVars
"Forme un mot à partir de trois mots"
	| t5 t6 t7 |
	t5 := self valeur: mot1 vars: lVars.
	t6 := self valeur: mot2 vars: lVars.
	t7 := self valeur: mot3 vars: lVars.
	^ self
		affecte: rep
		valeur: t5 asString , t6 asString , t7 asString
		vars: lVars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:56'!
mot: mot1 et: mot2 rep: rep vars: lVars
"Forme un mot à partir de deux mots"
	| t5 t6 |
	t5 := self valeur: mot1 vars: lVars.
	t6 := self valeur: mot2 vars: lVars.
	^ self affecte: rep valeur: t5 asString , t6 asString vars: lVars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'drgeo 4/12/2025 14:26:22'!
mot: m1 rep:res vars: lvar
|mot rep |
rep :=''.
mot:= self instanciedValue: m1 vars: lvar.
mot isList ifTrue: [mot do:[:mm| rep:= rep , mm asString] ]
ifFalse: [^false ].
^ self affecte: res valeur: rep vars: lvar! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:25'!
objet: p rep: res vars: lvar
"Retourne l'objet qui a ce nom"
	| pt result pool |
	pool := self expert drgeo domain factory pool.
	pt := self instanciedValue: p vars: lvar.
	pt ifNil: [ ^ false ].
	result := pool detect: [ :x | pt = x name ].
	^ self affecte: res valeur: result vars: lvar! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'drgeo 10/12/2024 20:03:47'!
ordonneMot: mot1 et: mot2 rep1: rep1 rep2: rep2 vars: lVars
" Place deux mots en ordre alphabétique"

	| t5 t6 t1 t2 tt5 tt6 |
	((t1 := t5 := mot1) isList and: [ (t2 := t6 := mot2) isList ])
		ifTrue: [ t5 := mot1 instancie: lVars.
			t6 := mot2 instancie: lVars.
			(t5 select: [ :x | (self instanciedValue: x vars: lv) = nil ])
				notEmpty
				ifTrue: [ ^ false ].
			(t6 select: [ :x | (self instanciedValue: x vars: lv) = nil ])
				notEmpty
				ifTrue: [ ^ false ] ]
		ifFalse: [ t1 := t5 := self valeur: mot1 vars: lVars.
			t1 isList
				ifFalse: [ (t1 = mot1 and: [ mot1 beginsWith: '?' ])
						ifTrue: [ ^ false ] ].
			t2 := t6 := self valeur: mot2 vars: lVars.
			t2 isList
				ifFalse: [ (t2 = mot1 and: [ mot2 beginsWith: '?' ])
						ifTrue: [ ^ false ] ] ].
	(t5 isNumber and: [ t6 isNumber ])
		ifTrue: [ t5 > t6
				ifTrue: [ ^ (self affecte: rep1 valeur: t5 vars: lVars)
						and: [ self affecte: rep2 valeur: t6 vars: lVars ] ]
				ifFalse: [ ^ (self affecte: rep1 valeur: t6 vars: lVars)
						and: [ self affecte: rep2 valeur: t5 vars: lVars ] ] ].
	(tt5 := t5) isList
		ifTrue: [ tt5 := t5 printString ].
	(tt6 := t6) isList
		ifTrue: [ tt6 := t6 printString ].
	tt5 asString < tt6 asString
		ifTrue: [ ^ (self affecte: rep1 valeur: t5 vars: lVars)
				and: [ self affecte: rep2 valeur: t6 vars: lVars ] ]
		ifFalse: [ ^ (self affecte: rep1 valeur: t6 vars: lVars)
				and: [ self affecte: rep2 valeur: t5 vars: lVars ] ]! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/7/2023 04:08'!
ordonneMot: mot1 et: mot2 rep: rep vars: lVars
	"Forme un mot à partir de deuxmots, en les  mettant dans l'ordre alphabètique "

	| t5 t6 a |
	t5 := self valeur: mot1 vars: lVars.
	t6 := self valeur: mot2 vars: lVars.
	(t5 isList and: [ t6 isList ])
		ifTrue: [  ].
	a := {t5.
	t6} sort: [ :x :y | x < y ].
	^ self affecte: rep valeur: a first , a last vars: lVars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:44'!
renomme: obj nom: nom vars: lvar
"Renomme un  objet"
	| ob pool nm objet |
	pool := self expert drgeo domain factory pool.
	ob := self instanciedValue: obj vars: lvar.
	nm := self instanciedValue: nom vars: lvar.
	ob ifNil: [ ^ false ].
	nm ifNil: [ ^ false ].
	objet := pool detect: [ :x | ob = x name ] ifNone: [ ^ true ].
	objet name: nm.
	^ true! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:56'!
retablitFait: aFait vars: v
"rétablit un fait"
	| f |
	f := self expert instancie: aFait vars: v.
	^ self expert retablitFait: f regle: self name! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:56'!
retireFait: aFait vars: v
"Retire un fait, le fait est marqué retiré et plus vu parmis les faits"
	| f |
	f := self expert instancie: aFait vars: v.
	^ self expert retireFait: f regle: self name! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 8/31/2023 16:39'!
sort: mot rep: rep vars: lvars
	| t4 faux result |
	faux := false.
	t4 := self valeur: mot vars: lvars.
	(t4 = mot and: [ t4 asString beginsWith: '?' ])
		ifFalse: [ (rep asString beginsWith: '?')
				ifTrue: [ result := t4 sort.
					^ self affecte: rep valeur: result vars: lvars ]
				ifFalse: [ ^ result = mot ] ].
	^ faux! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:56'!
suivant: nom rep: res vars: lvars
"Génère le nom suivant un nom unique"
	| t1 t2 faux |
	faux := false.
	t1 := self valeur: nom vars: lvars.
	(t1 = nom and: [ t1 beginsWith: '?' ])
		ifTrue: [ ^ faux ].
	t2 := self valeur: nom vars: lvars.
	(t2 = nom and: [ t1 beginsWith: '?' ])
		ifTrue: [ ^ faux ].
	^ self affecte: res valeur: t1 , self gensym asString vars: lvars! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 21:56'!
total: larg vars: lvar
"Remplace le dernier élément d'une liste de nombres par le total des précédents"
	| l last tot val |
	l := larg reverse asOrderedCollection.
	last := l removeFirst.
	l := l reverse.
	tot := 0.
	l
		do: [ :m | 
			val := (self valeur: m vars: lvar) asNumber.
			tot := tot + val ].
	^ self affecte: last valeur: tot vars: lvar! !

!ExpertRegle methodsFor: 'miscellaneous' stamp: 'DrGeoUser 11/6/2023 22:24'!
trie: mot rep: rep vars: lvars
"Trie les lettres d'un mot"
	| t4 faux result |
	faux := false.
	t4 := self valeur: mot vars: lvars.
	(t4 = mot and: [ t4 asString beginsWith: '?' ])
		ifFalse: [ (rep asString beginsWith: '?')
				ifTrue: [ result := t4 sort.
					^ self affecte: rep valeur: result vars: lvars ]
				ifFalse: [ ^ result = mot ] ].
	^ faux! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 11/22/2023 18:42'!
Electricite: e
	e initRegles.
	ExpertRegle interfaceElectricite:  e.
	ExpertRegle ohmRegles: e.
	ExpertRegle circuitRegles: e! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 10/9/2020 18:12'!
Epidémie: e 
e initRegles.
e lisRegle: 'interface-Arc3pts' 
si:  'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
alors: 'arc3pts ?a ?p1 ?p2 ?p3'
com: 'Lecture d''un fait sur la figure: arc de p1 à p2 à p3'.

e lisRegle: 'interface-Textes' 
si:  'DrGTextItem ?txt ?act ?x'
alors: '?act ?x'
com: 'Lecture d''un texte affirmation sur la figure'.


e lisRegle: 'ami'
si: 'arc3pts ?n ?x ?p ?y'
alors: 'ami ?x ?y '
com:'Relation ami selon les arcs dessinés'.


e lisRegle: 'infecte1'
si:  'ami ?x ?y
~ confiné ?x
infecté ?y'
alors: 'infecté ?x'
com:'Infection de x. Si contact avec un ami infecté et non confiné alors: infection.'.

e lisRegle: 'infecte2'
si:  'ami ?x ?y
~ confiné ?y
infecté ?x'
alors: 'infecté ?y'
com:'Infection de y. Si contact avec un ami infecté et non confiné alors: infection.'.

e lisRegle: 'marqueInfecté0'
si:'infecté0 ?x
couleurPoint:couleur: ?x magenta'
alors: 'infecté ?x'
com:'Un infecté0 est un infecté; marque en noir un infecté0'.

e lisRegle: 'marqueInfecté'
si:'infecté ?x
~ infecté0 ?x
couleurPoint:couleur: ?x bleu'
alors: 'marque ?x infecté'
com:'Marque en bleu les personnes infectées.'.

e lisRegle: 'marqueConfiné'
si: 'confiné ?x 
couleurPoint:couleur: ?x vert '
alors: 'marque ?x confiné '
com:'Marque en vert les personnes confinées.'.

e lisRegle: 'personne1'
si:  'ami ?x ?y'
alors: 'personne ?y'
com:'X est une personne.'.

e lisRegle: 'personne2'
si:  'ami ?x ?y'
alors: 'personne ?x'
com:'Y est une personne.'.! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 3/25/2023 12:59'!
Euclide: e
	e initRegles.
	e retablit: false.
	ExpertRegle interface: e.
	ExpertRegle relations: e.
	ExpertRegle mesure: e.
	ExpertRegle egalites: e.
	ExpertRegle objetsSur: e.
	ExpertRegle isometrieRegles: e.
	ExpertRegle paralPerpRegles: e.
	ExpertRegle polygones: e.
	ExpertRegle figuresRectilignes: e.
	ExpertRegle figuresNonRectilignes: e.
	ExpertRegle translations: e.
	ExpertRegle homothétie: e.
	ExpertRegle angles: e.
	ExpertRegle symetrieCentrale: e.
	ExpertRegle symetrieAxiale: e! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 8/23/2024 15:11:41'!
EuclideMinimum: e
	e initRegles.
	e retablit: false.
	ExpertRegle interface: e.
	ExpertRegle relations: e.
	ExpertRegle mesure: e.
	ExpertRegle egalites: e.
	ExpertRegle objetsSur: e.
	ExpertRegle isometrieRegles: e.
	ExpertRegle paralPerpRegles: e.
	ExpertRegle polygones: e.
	ExpertRegle figuresRectilignes: e.
	"ExpertRegle figuresNonRectilignes: e".
	! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 9/14/2025 02:43:29'!
angleSuite:e

e lisRegle: 'angle-angleEquivalent1' 
si:  'angle0 [ ?x1 ?s ?x2 ]
angle0 [ ?x1 ?s ?x2 ] [ classement: nonPlat ]
demi-droite ?dd1 ?s ?ex1
demi-droite ?dd2 ?s ?ex2
pointSur ?dd1 ?x1 
pointSur ?dd1 ?p
pointSur ?dd2 ?x2
different:de: ?p ?x1
different:de: ?p ?s'
alors:  'angle0 [ ?x1 ?s ?x2 ]  [ équivalent: [ ?p ?s ?x2 ]  ]'
com: 'Des points sur les mêmes demi-droites  forment un angle équivalent à l''angle de base .'.

e lisRegle: 'angle-angleEquivalent2' 
si:  'angle0 [ ?x1 ?s ?x2 ]
angle0 [ ?x1 ?s ?x2 ] [ classement: nonPlat ]
demi-droite ?dd1 ?s ?ex1
demi-droite ?dd2 ?s ?ex2
pointSur ?dd1 ?x1 
pointSur ?dd2 ?p
pointSur ?dd2 ?x2
different:de: ?p ?x2
different:de: ?p ?s'
alors:  'angle0 [ ?x1 ?s ?x2 ]  [ équivalent: [ ?x1 ?s ?p ]  ]'
com: 'Des points sur les mêmes demi-droites  forment un angle équivalent à l''angle de base .'.
! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 9/14/2025 02:57:09'!
angles: e

e lisRegle: 'pointSur demi-droite'
si: 'demi-droite ?dd ?or ?ex
droite ?d
pointSur ?d ?p
pointSur ?d ?or
pointSur ?d ?ex
position  ?or ?pos ?ex ?d
position  ?or ?pos ?p ?d'
alors: 'pointSur ?dd ?p'
com: 'Un point sur une droite à la même position que un parent de la demi-droite est aussi sur le demi-droite'.  
"ordonneMot:et:rep1:rep2: ?x2 ?x3  ?x2 ?x3"
	e
		lisRegle: 'angles-alignés1'
		si:
			'droite ?d
demi-droite ?dd1 ?x1 ?x2
demi-droite ?dd2 ?x1 ?x3
pointSur ?d ?x1
pointSur ?d ?x2
pointSur ?d ?x3
tousDifferents: [  ?x1 ?x2 ?x3 ]
pointsSur ?d ?pts
justeAvant:el:rep: ?pts  ?x1  ?x3
justeAprès:el:rep: ?pts ?x1  ?x2'
		alors: 'angle0 [ ?x2 ?x1 ?x3 ] [ classement:  plat ]'
		com:
			'Si les trois points qui définissent un angle sont alignés, l''angle est plat'.  
			
			
	e
		lisRegle: 'angles-saillant'
		si:
			'mesure  [ ?x2 ?x1 ?x3 ] ?m
inférieur:à: ?m 180'
		alors: 'angle0 [ ?x2 ?x1 ?x3 ] [ classement:  saillant ]'
		com:
			'Si un angle est inférieur à un angle plat,il est saillant'.  
			
			e
		lisRegle: 'angles-rentrant'
		si:
			'mesure  [ ?x2 ?x1 ?x3 ] ?m
supérieur:à: ?m 180'
		alors: 'angle0 [ ?x2 ?x1 ?x3 ] [ classement:  rentrant ]'
		com:
			'Si un angle est inférieur à un angle plat,il est rentrant'.  
				
			
	e	lisRegle: 'angles-PlatsComplémentaires'
		si:
			'angle0 [ ?x1 ?O ?x2 ] [ classement: NonPlat ] '
		alors: 'angle0 [ ?x2 ?O ?x1 ]'
		com:
			'Si un angle est plat, l''angle complémentaire de l''autre côté l'' est aussi. '.  
			
e			
lisRegle: 'angles-nul'
		si:
			'angle0 [ ?x1 ?s ?x2 ]
égaux:et: ?x1 ?x2'
		alors: 'angle0  [ ?x ?s ?x ] [ classement:  nul ]'
		com:
			'Si deux points qui définissent un angle sont les mêmes, l''angle est nul'.  			
	e
		lisRegle: 'angles-angleDef1ApAv'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
pointSur ?d1 ?O
pointSur ?d2 ?O
pointsSur ?d1 ?pts1
pointsSur ?d2 ?pts2
justeAprès:el:rep: ?pts2 ?O ?apO1
justeAvant:el:rep: ?pts1 ?O ?avO2
different:de: ?O ?apO1
different:de: ?O ?avO2
different:de: ?d1 ?d2
aireTriangleNegative:avec:avec: ?apO1 ?O ?avO2'
		alors: '  angle0 [ ?apO1 ?O ?avO2 ] [ position:  [ Après Avant ] ]'
		com:
			'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
			
	e
		lisRegle: 'angles-angleDef2AvAv'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
pointSur ?d1 ?O
pointSur ?d2 ?O
pointsSur ?d1 ?pts1
pointsSur ?d2 ?pts2
justeAvant:el:rep: ?pts1 ?O ?avO1
justeAvant:el:rep: ?pts2 ?O ?avO2
different:de: ?O ?avO1
different:de: ?O ?avO2
different:de: ?d1 ?d2
aireTriangleNegative:avec:avec: ?avO1 ?O ?avO2'
		alors: 'angle0 [ ?avO1 ?O ?avO2 ] [  position: [  Avant Avant ] ]' 
		com:
			'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
	e
		lisRegle: 'angles-angleDef3AvAp'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
pointSur ?d1 ?O
pointSur ?d2 ?O
pointsSur ?d1 ?pts1
pointsSur ?d2 ?pts2
justeAvant:el:rep: ?pts1 ?O ?avO1
justeAprès:el:rep: ?pts2 ?O ?apO2
different:de: ?O ?avO1
different:de: ?O ?apO2
different:de: ?d1 ?d2
aireTriangleNegative:avec:avec: ?avO1 ?O ?apO2'
		alors: 'angle0 [ ?avO1 ?O ?apO2 ] [ position: [ Avant Après ] ]'
		com:
			'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
	e
		lisRegle: 'angles-angleDef4ApAp'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
pointSur ?d1 ?O
pointSur ?d2 ?O
pointsSur ?d1 ?pts1
pointsSur ?d2 ?pts2
justeAprès:el:rep: ?pts1 ?O ?apO1
justeAprès:el:rep: ?pts2 ?O ?apO2
different:de: ?O ?apO1
different:de: ?O ?apO2
different:de: ?d1 ?d2
aireTriangleNegative:avec:avec: ?apO1 ?O ?apO2'
		alors: 'angle0 [ ?apO1 ?O ?apO2 ] [ position: [ Après Après ] ]'
		com:
			'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.			
			
			 
			"e lisRegle:  'angleo-angle0AussiAngle2'
			si:  'angle0 [ 	?x1 ?s ?x2 ]'
			alors:  'angle ?a  [ 	?x1 ?s ?x2 ]' 
			com: 'L''angle de base est aussi un angle.'."
			
			e lisRegle: 'angle0-angle' 
si:  'angle0 ?x1 ?x2'

alors:  'angle0 ?x1'
com: 'L''angle avec les points les plus proches du sommet est dit angle de base, noté angle0.'.


e
		lisRegle: 'angles-inscrit'
		si:
			'angle0 [ ?p1 ?s ?p2 ] [ plusProche ]
cercle ?c
pointSur ?c ?p1
pointSur ?c ?p2
pointSur ?c ?s'
		alors: 'angle0  [ ?p1 ?s ?p2 ]  [ Inscrit: ?c ]'
		com:
			'Un angle inscrit dans un cercle a son sommet sur le cercle et ses côtés interceptent le cercle.'.
	e
		lisRegle: 'angles-inscritsIsométrique'
		si:
			'angle0  [ ?p1 ?s1 ?p2 ]  [ Inscrit: ?c ]
angle0  [ ?p1 ?s2 ?p2 ]  [ Inscrit: ?c ]
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
different:de: ?s1 ?s2
relationCrée:et:nom:   [ ?p1 ?ss1 ?p2 ]  [ ?p1 ?ss2 ?p2 ] isométrique'
		alors: 'relationCréée  [ ?p1 ?ss1 ?p2 ]  [ ?p1 ?ss2 ?p2 ] isométrique'
		com:
			'Des angles inscrits  dans un  même cercle et interceptant le même arc sont isométriques'.
	e
		lisRegle: 'angles-inscritsIsométriqueClassement'
		si:
			' angle0  ?a1 [ ?cl ]
angle0 ?a2
contient:el: [ aigu droit obtus  ] ?cl
relation:et:nom: ?a1 ?a2 isométrique
different:de: ?a1 ?a2'
		alors: 'angle0 ?a2 [ ?cl ]'
		com: ''.
	'Des angles  isométriques ont le même classement.'.
	e
		lisRegle: 'angles-AuCentre1'
		si:
			'cercle ?c [ centre: ?o ]
angle0 [ ?p1 ?o ?p2 ] [ plusProche ]
pointSur ?c ?p1
pointSur ?c ?p2
pointSur ?c ?s'
		alors: 'angle0  [ ?p1 ?s ?p2 ]  [ AuCentre:  ?c ]'
		com:
			'Un angle au centre d''un cercle a son sommet au centre du  cercle et ses côtés interceptent le cercle.'.
		e
		lisRegle: 'angles-angleInscritMesure'
		si:
			'angle0  [ ?x1 ?s ?x2 ] [ Inscrit: ?c ]
angle0 [ ?x1 ?o ?x2 ]  [ AuCentre: ?c ]'
		alors:
			'égal [ mesure [ ?x1 ?o ?x2 ]  ] [ double [  mesure  [ ?x1 ?s ?x2 ]  ] ] ]'
		com:
			'La mesure de l''angle au centre esi le double de l''angle inscrit de même arc.'.
	e
		lisRegle: 'angles-inscritIsométrie'
		si:
			'angle0   [  ?x1 ?s1 ?y1 ]  [ Inscrit: ?c ]
angle0   [  ?x2 ?s2 ?y2 ]  [ Inscrit: ?c ]
ordonneMot:et:rep1:rep2:   [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ]  [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ] 
relationCrée:et:nom:  [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ] isométrique
different:de: [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ]'
		alors: 'relationCréée [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ] isométrique'
		com:
			'Des angle inscrit dans un cercle qui interceptent le cercle sur les mêmes points sont isométriques.'.
	e
		lisRegle: 'angles-AuCentre'
		si:
			'angle0 [  ?x ?o ?y ] 
cercle ?c [ centre: ?o ]
pointSur ?c ?x
pointSur ?c ?y'
		alors: 'angle0 [  ?x ?o ?y ]  [ AuCentre: ?c ]'
		com:
			'Un angle au centre  son sommet au centre d''un cercle et ses côtés interceptent le cercle.'.
	e
		lisRegle: 'angles-ClassementDroit1'
		si:
			' perpendiculaire [ ?x1 ?y1 ] [ ?x2 ?y2 ]
pointSur ?d1 ?x1 
pointSur ?d1 ?y1
sorteDeDroite ?d1
pointSur ?d2 ?x2 
pointSur ?d2 ?y2
sorteDeDroite ?d2
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?dd1 ?dd2
intersection ?I  ?dd1 ?dd2
enleverDe:el:rep: [ ?x1 ?y1 ] ?I ?rep1
enleverDe:el:rep: [ ?x2 ?y2 ] ?I ?rep2
angle0 [ ?x  ?I ?y ]
relation:et:nom: [ ?rep1 ?I ?rep2  ] [ ?x  ?I ?y ] équivalent'
		alors: 'angle0  [ ?x  ?I ?y ] [ classement: droit ]'
		com: 'L''angle entre des droites perpendiculaires est classé angle droit.'.
	e
		lisRegle: 'angles-ClassementDroit2'
		si:
			'perpendiculaire [ ?x1 ?y1 ] [ ?x2 ?y2 ]
pointSur ?d1 ?x1 
pointSur ?d1 ?y1
sorteDeDroite ?
pointSur ?d2 ?x2 
pointSur ?d2 ?y2
sorteDeDroite ?d2
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?dd1 ?dd2
intersection ?I  ?dd1 ?dd2
enleverDe:el:rep: [ ?x1 ?y1 ] ?I ?rep1
enleverDe:el:rep: [ ?x2 ?y2 ] ?I ?rep2
angle0 [ ?x  ?I ?y ]
relation:et:nom: [ ?rep2 ?I ?rep1  ] [ ?x  ?I ?y ] équivalent'
		alors: 'angle0  [ ?x  ?I ?y ] [ classement: droit ]'
		com: 'L''angle entre des droites perpendiculaires est classé angle droit.'.

	"e lisRegle: 'angles-equivalentAVAP'
 si: 'angle [ ?x1 ?s ?x2 ] [ position: [ Avant Après ] ] 
position ?x1 Avant ?s ?d
pointsSur:rep: ?d ?pts1
index:el:rep: ?pts1 ?s ?ind1
somme:et:rep:  ?ind1 -1 ?somme
élément:à:rep: ?pts1 ?somme ?el
position ?x2 Après ?s ?d2
pointsSur:rep: ?d2 ?pts2
index:el:rep: ?pts2 ?s ?ind2
somme:et:rep:  ?ind2 1 ?somme2
élément:à:rep: ?pts2 ?somme2 ?el2'
alors: 'angle [ ?x1 ?s ?x2 ] [ équivalent: [ ?el ?s ?el2 ]'
com: 'Des angles de même sommet et avec des extrémités sur les mêmes droites sont équivalents.'.

e lisRegle: 'angles-equivalentAVAV'
 si: 'angle [ ?x1 ?s ?x2 ] [ position: [ Avant Avant ] ] 
position ?x1 Avant ?s ?d
pointsSur:rep: ?d ?pts1
index:el:rep: ?pts1 ?s ?ind1
somme:et:rep:  ?ind1 -1 ?somme
élément:à:rep: ?pts1 ?somme ?el
position ?x2 Avant ?s ?d2
pointsSur:rep: ?d2 ?pts2
index:el:rep: ?pts2 ?s ?ind2
somme:et:rep:  ?ind2 -1 ?somme2
élément:à:rep: ?pts2 ?somme2 ?el2'
alors: 'angle [ ?x1 ?s ?x2 ] [ équivalent: [ ?el ?s ?el2 ]'
com: 'Des angles de même sommet et avec des extrémités sur les mêmes droites sont équivalents.'.

e lisRegle: 'angles-equivalentApAp'
 si: 'angle [ ?x1 ?s ?x2 ] [ position: [ Après Après ] ] 
position ?x1 Après ?s ?d
pointsSur:rep: ?d ?pts1
index:el:rep: ?pts1 ?s ?ind1
somme:et:rep:  ?ind1 1 ?somme
élément:à:rep: ?pts1 ?somme ?el
position ?x2 Après ?s ?d2
pointsSur:rep: ?d2 ?pts2
index:el:rep: ?pts2 ?s ?ind2
somme:et:rep:  ?ind2 1 ?somme2
élément:à:rep: ?pts2 ?somme2 ?el2'
alors: 'angle [ ?x1 ?s ?x2 ] [ équivalent: [ ?el ?s ?el2 ]'
com: 'Des angles de même sommet et avec des extrémités sur les mêmes droites sont équivalents.'.

		e
		lisRegle: 'angles-équivalentMêmesPropriétés1'
		si:
			'angle0 ?x ?prop 
angle ?y [ équivalent: ?x ]'
		alors: 'angle ?y ?prop'
		com: 'Des angles équivalents ont les mêmes propriétés.'.

	e lisRegle: 'angles-équivalentMêmesPropriétés2' 
si: 'angle ?x1 [  ?prop ?x ]
angle ?y [ équivalent: ?x ]
different:de: ?prop  équivalent:'
alors:  'angle ?x1  [ ?prop ?y ]'
com: 'Des angles équivalents ont les mêmes propriétés.'.
	e
		lisRegle: 'angles-équivalentMêmeMesure'
		si:
			'angle0 ?x
mesure [ ?x ] ?m
angle ?y [ équivalent: ?x ]'
		alors: 'mesure ?y ?m déduite'
		com: 'Des angles équivalents ont les mêmes propriétés.'.

	e
		lisRegle: 'angles-angleDef2'
		si:
			'intersection ?o ?d2 ?d1
sorteDeDroite ?d1
sorteDeDroite ?d2
pointSur ?d1 ?p1
pointSur ?d2 ?p2
position ?pos1 ?p1 ?o ?dd1
position ?pos2  ?p2 ?o ?dd2
pointsSur:rep: ?d1 ?pts1
pointsSur:rep: ?d2 ?pts2
index:el:rep: ?pts1 ?o ?indO1
index:el:rep: ?pts2 ?o ?indO2
index:el:rep: ?pts1  ?p1 ?indp1
index:el:rep: ?pts2  ?p2 ?indp2
difference:et:rep: ?indO1 ?indp1 ?diff1
difference:et:rep: ?indO2 ?indp2 ?diff2
abs:rep: ?diff1 ?absdiff1
abs:rep: ?diff2 ?absdiff2
égal:à: ?absdiff1 1 
égal:à: ?absdiff2 1 
mot:et:rep: ?d1 ?pos1 ?res1
mot:et:rep: ?res1 ?o ?rres1
mot:et:rep: ?d2 ?pos2 ?res2
mot:et:rep: ?res2 ?o ?rres2
aireTriangleNegative:avec:avec: ?p1 ?o ?p2
different:de: ?o ?p1
different:de: ?o ?p2
different:de: ?p1 ?p2
'
		alors: 'angle [ ?p1 ?o ?p2 ]  [ demi-droites: [  ?rres1 ?rres2 ]  ]'
		com: 'définition d''un angle par des demi-droites'.
	e
		lisRegle: 'angles-angleDef1'
		si:
			'intersection ?o ?d1 ?d2
sorteDeDroite ?d1
sorteDeDroite ?d2
pointSur ?d1 ?p1
pointSur ?d2 ?p2
position ?pos1 ?p1 ?o ?dd1
position ?pos2  ?p2 ?o ?dd2
pointsSur:rep: ?d1 ?pts1
pointsSur:rep: ?d2 ?pts2
index:el:rep: ?pts1 ?o ?indO1
index:el:rep: ?pts2 ?o ?indO2
index:el:rep: ?pts1  ?p1 ?indp1
index:el:rep: ?pts2  ?p2 ?indp2
difference:et:rep: ?indO1 ?indp1 ?diff1
difference:et:rep: ?indO2 ?indp2 ?diff2
abs:rep: ?diff1 ?absdiff1
abs:rep: ?diff2 ?absdiff2
égal:à: ?absdiff1 1 
égal:à: ?absdiff2 1 
mot:et:rep: ?d1 ?pos1 ?res1
mot:et:rep: ?res1 ?o ?rres1
mot:et:rep: ?d2 ?pos2 ?res2
mot:et:rep: ?res2 ?o ?rres2
aireTriangleNegative:avec:avec: ?p1 ?o ?p2
different:de: ?o ?p1
different:de: ?o ?p2
different:de: ?p1 ?p2
'
		alors: 'angle [ ?p1 ?o ?p2 ]  [ demi-droites: [  ?rres1 ?rres2 ]  ]'
		com: 'définition d''un angle par des demi-droites'.	"
	e
		lisRegle: 'angles-angleDefA'
		si:
			'angle0 [ ?p1 ?o ?p2 ]
sorteDeDroite ?d1
sorteDeDroite ?d2
pointSur ?d1 ?p1
pointSur ?d2 ?p2
position  ?p1 ?pos1 ?o ?d1
position  ?p2 ?pos2 ?o ?d2
aireTriangleNegative:avec:avec: ?p1 ?o ?p2
angle0 [ ?p1 ?o ?p2 ] [ plusProche ]'
		alors: 'angle0 [ ?p1 ?o ?p2 ] [  position:  [ ?pos1 ?pos2 ] ]'
		com: 'Angle défini par la position de ses extrémités'.
	e
		lisRegle: 'angles-plusProche2'
		si:
			'angle0  [ ?x1  ?O ?x2 ] 
pointsConfondus  ?x3 ?x1
contient:el: [  ?x3 ?x1 ] ?x1
enleverDe:el:rep: [ ?x3 ?x1 ] ?x1 ?ang'
		alors: 'angle0 [ ?ang ?O ?x2 ] [ classement: nonPlat  ]'
		com: 'Autre angle plus proche avec des points confondus'.
	e
		lisRegle: 'angles-plusProche3'
		si:
			'angle0  [ ?x1  ?O ?x2 ]
pointsConfondus  ?x3 ?x2
contient:el: [  ?x3 ?x2 ] ?x2
enleverDe:el:rep: [ ?x3 ?x2 ] ?x2 ?ang'
		alors: 'angle0 [ ?x1 ?O ?ang ] [ classement: nonPlat ]'
		com: 'Autre angle plus proche avec des points confondus'.
	"e
		lisRegle: 'angles-angleDef02'
		si:
			'sorteDeDroite ?dd1
sorteDeDroite ?dd2
ordonneMot:et:rep1:rep2: ?dd1 ?dd2 ?d1 ?d2
intersection ?O ?d1 ?d2
pointsSur ?d1 ?pts1
pointsSur ?d2 ?pts2
justeAvant:el:rep: ?pts1 ?O ?avO1
justeAvant:el:rep: ?pts2 ?O ?avO2
different:de: ?O ?avO2
different:de: ?O ?avO1
aireTriangleNegative:avec:avec: ?avO1 ?O ?avO2'
		alors: 'angle0 [ ?avO1 ?O ?avO2 ] [ classement: nonPlat  ]'
		com:
			'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
	e
		lisRegle: 'angles-angleDef03'
		si:
			'sorteDeDroite ?dd1
sorteDeDroite ?dd2
ordonneMot:et:rep1:rep2: ?dd1 ?dd2 ?d1 ?d2
intersection ?O ?d1 ?d2
pointsSur ?d1 ?pts1
pointsSur ?d2 ?pts2
justeAprès:el:rep: ?pts1 ?O ?avO1
justeAvant:el:rep: ?pts2 ?O ?avO2
different:de: ?O ?avO2
different:de: ?O ?avO1
aireTriangleNegative:avec:avec: ?avO1 ?O ?avO2'
		alors: 'angle0 [ ?avO1 ?O ?avO2 ] [ classement: nonPlat  ]'
		com:
			'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
	e
		lisRegle: 'angles-angleDef04'
		si:
			'sorteDeDroite ?dd1
sorteDeDroite ?dd2
ordonneMot:et:rep1:rep2: ?dd1 ?dd2 ?d1 ?d2
intersection ?O ?d1 ?d2
pointsSur ?d1 ?pts1
pointsSur ?d2 ?pts2
justeAprès:el:rep: ?pts1 ?O ?avO1
justeAprès:el:rep: ?pts2 ?O ?avO2
different:de: ?O ?avO2
different:de: ?O ?avO1
aireTriangleNegative:avec:avec: ?avO1 ?O ?avO2'
		alors: 'angle0 [ ?avO1 ?O ?avO2 ] [ classement: nonPlat  ]'
		com:
			'Angle non plat défini par la position de ses extrémités les plus proches du sommet'."

	e
		lisRegle: 'angles-angleDeBaseNonplats'
		si:
			'angle0 [ ?p1 ?o ?p2 ] [ classement: nonPlat  ]
aireTriangle:avec:avec:rep:  ?p1 ?o ?p2 ?res
abs:rep: ?res ?absres
supérieur:à: ?absres  1e-10'
		alors: 'angle0 [ position: ?p1 ?o ?p2 ]'
		com:
			'Angle non plat sans ses propriétés et avec les extrémités les plus proches du sommet.'.
			
e
		lisRegle: 'angles-angleDeBaseNonplats'
		si:
			'angle0 [ ?p1 ?o ?p2 ] [ position: [ ?x ?y  ] ]'
		alors: 'angle0 [ ?p1 ?o ?p2 ] [ classement: nonPlat ]'
		com:
			'Angle non plat sans ses propriétés et avec les extrémités les plus proches du sommet.'.
	"e
		lisRegle: 'angles-angleNonplatsPropNonPlat'
		si:
			'angle0 [ ?p1 ?o ?p2 ] [ classement: nonPlat  ]
angle0 [ ?p1 ?o ?p2 ] [ ?x ]
different:de: plat ?x'
		alors: 'angle0 [ ?p1 ?o ?p2 ] [ nonPlat ]'
		com:
			'Angle sans ses propriétés et avec les extrémités les plus proches du sommet.'."
	e
		lisRegle: 'angles-Obtus1'
		si:
			'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x1 ?x2 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil    ?pos ?im ?m
égaux:et: Avant ?pos
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ obtus ]'
		com:
			'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est avant l''intersection avec une médiatrice d''un côté, l''agle est obtus, supérieur à un droit.'.
	e
		lisRegle: 'angles-Aigu1'
		si:
			'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x1 ?x2 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil    ?pos ?im ?m
égaux:et: Après ?pos
different:de: ?m ?m2
different:de: ?mil   ?im 
'
		alors: ' angle0 [ ?x1 ?x2 ?x3 ] [ aigu ]'
		com:
			'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est avant l''intersection avec une médiatrice d''un côté, l''agle est aigu, inférieur à un droit.'.
	e
		lisRegle: 'angles-médiatricesAngleDroit1'
		si:
			'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x1 ?x2 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
pointConfondu:avec: ?im ?mil
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ classement: droit]'
		com:
			'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est confondu avec  l''intersection d''une médiatrice d''un côté, l''agle est droit'.
	e
		lisRegle: 'angles-aigu2'
		si:
			'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x2 ?x3 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil   Après ?im ?m
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ aigu ]'
		com:
			'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est avant l''intersection avec une médiatrice d''un côté, l''agle est aigu, inférieur à un droit.'.
	e
		lisRegle: 'angles-obtus2'
		si:
			'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x2 ?x3 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil    Avant ?im ?m
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ obtus ]'
		com:
			'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est avant l''intersection avec une médiatrice d''un côté, l''agle est obtus, supérieur à un droit'.
	"e
		lisRegle: 's-testDroit'
		si:
			'angle [ ?x1 ?s ?x2 ] [ équivalent: [ ?xx1 ?s ?xx2 ] ]
droite ?d ?s ?x1
intersection ?i2 ?d ?d3
perpendiculaire ?perp ?d1  ?p
pointSur ?d1 ?x2	
point:rep: ?i2 ?ptI2
point:rep: ?p ?ptp
égal:à:  ?ptI2 ?ptp'
		alors: 'angle0  [ ?xx1 ?s ?xx2  ] [ droit ]'
		com:
			'Si une droite coupe la droite issue du sommet de cet angle et perpendiculaire à un côté  de cet angle 
au point de son intersection avec l''autre côté de l''angle, l''angle est droit.'."
	e
		lisRegle: 'angles-testAigu'
		si:
			'perpendiculaire ?x ?y ?o
intersection ?i ?x ?d
pointSur ?d ?i
pointSur ?d ?x2
pointSur ?d ?x1
angle0 [ ?x1 ?o ?x2 ]
position ?x1 ?pos1 ?1 ?d
position ?x2 ?pos2 ?1 ?d
égaux:et: ?pos1 ?pos2
~ pointsConfondus ?x1 ?i 
different:de: ?i ?x1'
		alors: 'angle0  [ ?x1 ?o ?x2 ] [ classement: aigu ]'
		com:
			'Si une droite coupe la droite issue du sommet de cet angle et perpendiculaire à un côté de cet angle 
avant son intersection avec l''autre côté de l''angle, l''angle est aigu.'.
	e
		lisRegle: 'angles-testDroit'
		si:
			'perpendiculaire ?x ?y ?o
intersection ?i ?x ?d
pointSur ?d ?i
pointSur ?d ?x2
pointSur ?d ?x1
angle0 [ ?x1 ?o ?x2 ]
pointsConfondus ?x1 ?i 
different:de: ?i ?x1'
		alors: 'angle0  [ ?x1 ?o ?x2 ] [ classement: droit ]'
		com:
			'Si une droite coupe la droite issue du sommet de cet angle et perpendiculaire à un côté de cet angle 
à l''intersection avec l''autre côté de l''angle, l''angle est droit.'.
	e
		lisRegle: 'angles-testObtus'
		si:
			'perpendiculaire ?x ?y ?o
intersection ?i ?x ?d
pointSur ?d ?i
pointSur ?d ?x2
pointSur ?d ?x1
angle0 [ ?x1 ?o ?x2 ]
position ?x1 ?pos1 ?1 ?d
position ?x2 ?pos2 ?1 ?d
different:de: ?pos1 ?pos2
~ pointsConfondus ?x1 ?i 
different:de: ?i ?x1'
		alors: 'angle0 [ ?x1 ?o ?x2 ] [ classement: obtus ]'
		com:
			'Si une droite coupe la droite issue du sommet de cet angle et perpendiculaire à un côté  de cet angle 
après son intersection avec l''autre côté de l''angle, l''angle est obtus.'.
	e
		lisRegle: 'angles-médiatricesAngleDroit2'
		si:
			'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x2 ?x3 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil    pointConfonduAvec ?im ?m
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ classement: droit ]'
		com:
			'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est confondu avec  l''intersection d''une médiatrice d''un côté, l''agle est droit'.
	e
		lisRegle: 'angles-opposésSommets1'
		si:
			'angle0  ?x1 [  supplémentaire: ?x2 ]
angle0  ?x3 [  supplémentaire: ?x1 ]'
		alors: 'angle0 ?x2 [ opposé:  ?x3  ]'
		com:
			'Deux angles sont opposés par le sommet s''ils sont supplémentaires au même angle'.
	e
		lisRegle: 'angles-opposésSommets2'
		si:
			'angle0  ?x1 [  supplémentaire: ?x2 ]
angle0  ?x1 [  supplémentaire: ?x3 ]
ordonneMot:et:rep1:rep2: ?x2 ?x3  ?x2 ?x3
different:de: ?x2 ?x3'
		alors: 'angle0 ?x2 [ opposé:  ?x3  ]'
		com:
			'Deux angles sont opposés par le sommet s''ils sont supplémentaires au même angle'.

	e
		lisRegle: 'angles-angleAdjacentMesure'
		si:
			'angle 0 [ ?x1 ?o ?x2 ] [  adjacent: [ ?x2 ?o ?x3 ] ]
mesure [ ?x1 ?o ?x2 ] ?m1
mesure [ ?x2 ?o ?x3 ] ?m2
somme:et:rep: ?m1 ?m2 ?m3
inférieurOuEgal:à: ?m3  180
different:de: 180.0 ?m3'
		alors: 'mesure [ ?x1 ?o ?x3 ] ?m3 déduite'
		com:
			'La mesure de la somme de deux angles adjacents est la somme des mesures des angles.'.
	e
		lisRegle: 'angles-mesureTroisièmeAngle1'
		si:
			'polygone ?pol  [  Trigone ]
polygone ?pol  [  sommets: [ ?s1 ?s2 ?s3] ]
mesure [ ?s2  ?s1 ?s3 ] ?m1 donnée
mesure [ ?s3   ?s2 ?s1 ] ?m2 donnée
somme:et:rep: ?m1 ?m2 ?ms
difference:et:rep: 180 ?ms ?m3'
		alors: 'mesure [ ?s1 ?s3 ?s2 ] ?m3 déduite'
		com: 'Un angle du Trigone est égal à 180 - somme des deux autres.'.
	e
		lisRegle: 'angles-mesureTroisièmeAngle2'
		si:
			'polygone ?pol  [  Trigone ]
polygone ?pol  [  sommets: [ ?s1 ?s2 ?s3] ]
mesure [ ?s3 ?s2 ?s1 ] ?m1 donnée
mesure [ ?s1 ?s3 ?s2 ] ?m2 donnée
somme:et:rep: ?m1 ?m2 ?ms
difference:et:rep: 180 ?ms ?m3'
		alors: 'mesure [ ?s2 ?s1 ?s3 ] ?m3 déduite'
		com: 'Un angle du Trigone est égal à 180 - somme des deux autres.'.
	e
		lisRegle: 'angles-mesureTroisièmeAngle3'
		si:
			'polygone ?pol  [  Trigone ]
polygone ?pol  [  sommets: [ ?s1 ?s2 ?s3] ]
mesure [ ?s1  ?s3 ?s2 ] ?m1 donnée
mesure [ ?s2  ?s1 ?s3 ] ?m2 donnée
somme:et:rep: ?m1 ?m2 ?ms
difference:et:rep: 180 ?ms ?m3'
		alors: 'mesure [ ?s3 ?s2 ?s1 ] ?m3 déduite'
		com: 'Un angle du Trigone est égal à 180 - somme des deux autres.'.
	e
		lisRegle: 'angles-mesureAnglesOpposés2'
		si:
			'mesure  ?a1  ?v ?source
angle0 ?a1 [ opposé:  [ ?x1 ?o ?x2 ]  
~ mesure [ ?x1 ?o ?x2 ] ?v donnée'
		alors: 'mesure [ ?x1 ?o ?x2 ] ?v déduite'.
	e
		lisRegle: 'angles-mesureAnglesOpposés1'
		si:
			'angle0 [ ?x1 ?o ?x2 ] [ opposé:  ?a1 ] 
ordonneMot:et:rep1:rep2:  ?a1 [ ?x1 ?o ?x2 ]  ?aa1 ?aa2
relationCrée:et:nom: ?aa1 ?aa2 isométrique'
		alors: 'relationCréée ?aa1 ?aa2 isométrique'
		com: 'Des angles opposés sont isométriques'.
	e
		lisRegle: 'angles-mesureAnglesOpposés2'
		si:
			'mesure  ?a1  ?v ?source
angle0 ?a1 [ opposé:  [ ?x1 ?o ?x2 ]
ordonneMot:et:rep1:rep2:  ?a1 [ ?x1 ?o ?x2 ]  ?aa1 ?aa2
relationCrée:et:nom: ?aa1 ?aa2 isométrique'
		alors: 'relationCréée ?aa1 ?aa2 isométrique'
		com: 'Des angles opposés sont isométriques'.
	e
		lisRegle: 'angles-mesureAnglescorrespondant1Isométrie'
		si:
			'angle0 [ ?x1 ?o ?x2 ] [ correspondant:  ?a1 ] 
ordonneMot:et:rep1:rep2:  ?a1 [ ?x1 ?o ?x2 ]  ?aa1 ?aa2
relationCrée:et:nom: ?aa1 ?aa2 isométrique'
		alors: 'relationCréée   ?aa1 ?aa2 isométrique'
		com: 'Des angles correspondants sont isométriques'.
	e
		lisRegle: 'angles-mesureAnglescorrespondant2Isométrie'
		si:
			'mesure  ?a1  ?v ?source
angle0	[ ?x1 ?o ?x2 ] 		
angle0 ?a1 [ correspondant:  [ ?x1 ?o ?x2 ] ]
ordonneMot:et:rep1:rep2:  ?a1 [ ?x1 ?o ?x2 ]  ?aa1 ?aa2
relationCrée:et:nom: ?aa1 ?aa2 isométrique'
		alors: 'relationCréée ?aa1 ?aa2 isométrique'
		com: 'Des angles correspondants sont isométriques'.
	e
		lisRegle: 'angles-mesureAngles supplémentaire1'
		si:
			'mesure  ?a1 ?v ?source 
angle0 ?a1 [ supplémentaire:  ?a2 ]
difference:et:rep: 180 ?v ?v1
supérieur:à: ?v1 0'
		alors: 'mesure ?a2 ?v1 déduite'
		com: 'La somme de deux angles supplémentaires est 180'.
	e
		lisRegle: 'angles-mesureAngles supplémentaire2'
		si:
			'mesure  ?a2  ?v ?source
angle0 ?a1 [ supplémentaire:  ?a2 ]
difference:et:rep: 180 ?v ?v1
supérieur:à:  ?v1 0
~ mesure ?a1 ?v1 donnée'
		alors: 'mesure ?a1 ?v1 déduite'.
	e
		lisRegle: 'angles-mesureAngles supplémentaireDroit1'
		si:
			'angle0 ?a1 [  classement: droit  ]
angle0 ?a1 [ supplémentaire:  ?a2 ]'
		alors: 'angle0 ?a2 [ classement: droit ]'
		com:
			'Si l''un de deux angles supplémentaires est droit, alors l''autre est aussi droit'.
	e
		lisRegle: 'angles-mesureAngles supplémentaireDroit2'
		si:
			'angle0 ?a2 [  classement: droit ]
angle0 ?a1 [ supplémentaire:  ?a2 ]'
		alors: 'angle0 ?a1 [ classement: droit]'
		com:
			'Si l''un de deux angles supplémentaires est droit, alors l''autre est aussi droit'.
	e
		lisRegle: 'angles-adjacentAngles1'
		si:
			'angle0 [ ?x1 ?o ?x2 ] [ classement: nonPlat ]
angle0 [ ?x2 ?o ?x3 ] [ classement: nonPlat ]'
		alors: 'angle0   [ ?x1 ?o ?x2 ]  [ adjacent:  [ ?x2 ?o ?x3  ] ]'  
		com: 'Des angles qui ont un côté commun sont adjacents.'.
"	e
		lisRegle: 'angles-supplémentaires1'
		si:
			'angle0 [  ?x1 ?O ?x2 ] [ adjacent: [  ?x3 ?O ?x13 ]  ]  
angle0 [  ?x2 ?O ?x3  ]  [ classement: plat  ]
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep:
different:de: ?x2 ?x3'
		alors: 'angle0  [  ?x2 ?O ?x1 ]  [  supplémentaire:  [  ?x1 ?O ?x3 ]  ]'
		com:
			'Si la somme de deux angles est un angle plat, ces angles sont  supplémentaires.'."
	e
		lisRegle: 'angles-supplémentaires1'
		si:'angle0 [ ?x3 ?s ?x1 ] [ adjacent: [ ?x2 ?s ?x4 ]
angle0 [ ?x4 ?s ?x3 ] [ classement: plat ]'
		alors: 'angle0  [ ?x3 ?s ?x1 ] [  supplémentaire:  [ ?x2 ?s ?x4 ] ]'
		com:
			'Si la somme de deux angles est un angle plat, ces angles sont  supplémentaires.'.
		e
		lisRegle: 'angles-supplémentaires2'
		si:
			' angle0 [ ?x3 ?s ?x1 ] [ adjacent: [ ?x1 ?s ?x4 ]
angle0 [ ?x3 ?s ?x4 ] [ classement: plat ]'
		alors: 'angle0 [ ?x3 ?s ?x1 ]  [  supplémentaire: [ ?x1 ?s ?x4 ] ]'
		com:
			'La somme de deux angles est un angle plat, ces angles sont  supplémentaires.'.
	"e
		lisRegle: 'angles-supplémentaires2'
		si: 'angle0 ?x1 [  supplémentaire: ?x2 ]'
		alors: 'angle0 ?x2  [  supplémentaire: ?x1 ]'
		com: 'La somme de deux angles supplémentaires est 180°'."
	e
		lisRegle: 'angles-bissect'
		si:
			'angle [  ?a ?o ?b ]
isométrique [ ?a ?o ] [ ?b ?o ]
médiatrice ?m [ ?a ?b ]'
		alors: 'bissectrice ?m angle [ ?a ?o ?b ]'
		com:
			'La bissectriceDe:  d''un angle est la médiatrice de points situés à même distance du sommet; la médiatrice d''un triangle isocèle est aussi la bissectrice.'.
	e
		lisRegle: 'angles-bissectriceAnglesIsométriques'
		si:
			'bissectrice  ?bis [ ?x1 ?o ?x3 ]
milieu [ ?x1 ?x3 ] ?m
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3
relationCrée:et:nom: [ ?x1 ?o ?m ] [ ?m ?o ?x3 ] isométrique
different:de: ?o ?m'
		alors: 'relationCréée   [ ?x1 ?o ?m ] [ ?m ?o ?x3 ] isométrique'
		com:
			'La bissectrice d''un angle divise cet angle en deux angles isométriques.'.
	e
		lisRegle: 'angles-AnglePlatDef'
		si: 'alignement  [ ?x1 ?o ?x2 ]'
		alors: 'angle0  [ ?x1 ?o ?x2 ]  [ classement: plat ]'
		com:
			'Un angle plat est un angle de 180°, les côtés de  l''angle sont sur une même droite ainsi que les points qui définissent l''angle'.
	"
	"
	e
		lisRegle: 'angles-AnglePlusProche'
		si:
			'angle0  ?x1 [ position: ?x2 ?x3 ]'
		alors: 'angle0 ?x1'
		com:
			'L'' angle le plus proche, l''angle avec ses extrémiés les plus proches de son sommet'.
	e
		lisRegle: 'angles-Angle platDef2'
		si: 'angle0  [ classement: plat ]'
		alors: 'angle0 [ classement: nonPlat  ]'
		com:
			'L'' angle qui sert à la définition de l''angle plat  est aussi le plus proche'.
	e
		lisRegle: 'angles-droit->perpendiculaire'
		si:
			'angle0 [ ?x ?O ?y ] [  d roit ]
ordonneMot:et:rep1:rep2: [  ?x ?O ] [  ?O ?y  ] ?xx ?yy'
		alors: 'perpendiculaire  ?xx ?yy '
		com: ' Les côtés d''un angle droit sont perpendiculaire.'.
	e
		lisRegle: 'angles-AngleSupplémentairesDroit1'
		si:
			'angle0 [ ?x1 ?o ?x2 ] [ supplémentaire: ?sup ]
relation:et:nom: [ ?x1 ?o ?x2 ]  ?sup isométrique'
		alors: 'angle0  [ ?x1 ?o ?x2 ]  [ classement: droit ]'
		com:
			'Définition: Losqu''une droite coupe une autre droite avec des angles isométriques de chaque côté, ces angles sont dits droits et les droites sont dites perpendiculaires.'.
	e
		lisRegle: 'angles-SupplémentairesAngleDroit2'
		si:
			'angle0 [ ?x1 ?o ?x2 ] [ supplémentaire: ?sup ]
relation:et:nom: [ ?x1 ?o ?x2 ]  ?sup isométrique'
		alors: 'angle0  ?sup  [ classement: droit ]'
		com:
			'Définition: Losqu''une droite coupe une autre droite avec des angles isométriques de chaque côté, ces angles sont dits droits et les droites sont dites perpendiculaires.'.
	e
		lisRegle: 'angles-AngleDroit3'
		si:
			'angle0 [ ?x1 ?o ?x2 ]
intersection  ?o ?d2 ?d1
pointSur ?d1 ?x1
pointSur ?d2 ?x2
perpendiculaire ?d1 ?d2'
		alors: 'angle0  [ ?x1 ?o ?x2 ]  [ classement: droit]'
		com:
			'Définition: Un angle droit est un angle dont la mesure est 90°. Un angle droit a ses côtés perpendiculaires'.
	e
		lisRegle: 'angles-AngleAigu'
		si:
			'angle ?x1
angle ?x1 [ position: [  ?pos1 ?pos2 ] ]
different:de: ?pos1 ?pos2
~ angle ?x1 [ classement: droit]'
		alors: 'angle ?x1 [ aigu ]'
		com:
			'Un angle aigus est un angle > 0° et  < 90°. C''est aussi un angle  avec des positions différentes. (Après  Avant  ou Avant Après)'.
	e
		lisRegle: 'angles-AngleObtus'
		si:
			'angle ?x1
angle ?x1 [ position: [  ?pos1 ?pos2 ] ]
~ angle ?x1 [ classement: droit]
égaux:et: ?pos1 ?pos2'
		alors: 'angle ?x1 [ obtus ]'
		com:
			'Un angle obtu est un angle > 90° et  < 180°. C''est aussi un angle  avec des mêmes positions. (Avant Avant  ou Après Après)'.
		e
		lisRegle: 'angles-correspondant'
		si: 'angle0  ?x1 [ position:  [ ?x ?y ]  ]
angle0  ?x2 [ position:  [ ?x ?y ]  ]
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?x1 ?x2'		
	alors:'angle0 ?x1 [ correspondant: ?x2 ]'
	com:'Des angles de même position sont correspondants'.
	
	e
lisRegle: 'angles-correspondant2'
	si: 'angle0  ?x1 [ position:  [ Après Avant  ]  ]
angle0  ?x2 [ position:  [ Après Avant]  ]
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?x1 ?x2'		
	alors:'angle0 ?x1 [ correspondant ?x2 ]'
	com:'Des angles de même position sont correspondants'.
			


			

			
	
		
	
	e
		lisRegle: 'angles-alterneInterne1'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
sorteDeDroite ?d3
relation:et:nom: ?d1 ?d2 parallèle
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?ddd3
intersection ?o1 ?dd1 ?dd3
intersection ?o2 ?dd2 ?ddd3
ordonneMot:et:rep1:rep2: ?o1 ?o2  ?o1 ?o2
relation:et:nom: ?d1 ?d2 parallèle
angle0  [ ?x1 ?o1 ?y1 ]
angle0  [ ?x2 ?o2 ?y2  ]
position ?y2 Après ?o2 ?d3
position ?y1 Avant ?o1 ?d3
relation:et:nom: ?d1 ?d2 parallèle
angle0 [ ?x1 ?o1 ?y1 ] [ classement: nonPlat ]
angle0 [ ?x2 ?o2 ?y2 ] [ classement: nonPlat ]
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
different:de: ?o1 ?o2'
		alors: 'angle0 ?a1 [  alterneInterne:  ?a2 ]'
		com:
			'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''intérieur de ces parallèles sont alternes internes.'.
			
			e
		lisRegle: 'angles-alterneinterne2'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
sorteDeDroite ?d3
relation:et:nom: ?d1 ?d2 parallèle
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?ddd3
intersection ?o1 ?dd1 ?dd3
intersection ?o2 ?dd2 ?ddd3
ordonneMot:et:rep1:rep2: ?o1 ?o2  ?o1 ?o2
relation:et:nom: ?d1 ?d2 parallèle
angle0  [ ?x1 ?o1 ?y1 ]
angle0  [ ?x2 ?o2 ?y2  ]
position ?x1 Avant ?o1 ?d3
position ?x2 Après ?o2 ?d3
different:de: ?o1 ?o2
angle0 [ ?x1 ?o1 ?y1 ] [ classement: nonPlat ]
angle0 [ ?x2 ?o2 ?y2  ] [ classement: nonPlat ]
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2'
		alors: 'angle0 ?a1 [  alterneInterne:  ?a2 ]'
		com:
			'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''intérieur de ces parallèles sont alternes internes.'.

	e
	lisRegle: 'angles-alterneExterne1'
	si: 'sorteDeDroite ?d1
sorteDeDroite ?d2
sorteDeDroite ?d3
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?ddd3
intersection ?o1 ?dd1 ?dd3
intersection ?o2 ?dd2 ?ddd3
ordonneMot:et:rep1:rep2: ?o1 ?o2  ?o1 ?o2
relation:et:nom: ?d1 ?d2 parallèle
angle0  [ ?x1 ?o1 ?y1 ]
angle0  [ ?x2 ?o2 ?y2  ]
position ?x2 Avant ?o2 ?d2
position ?x1 Après ?o1 ?d1
relation:et:nom: ?d1 ?d2 parallèle
angle0 [ ?x1 ?o1 ?y1 ] [ classement: nonPlat ]
angle0 [ ?x2 ?o2 ?y2  ]  [ classement: nonPlat ]
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2 ]
different:de: ?o1 ?o2'
		alors: 'angle0 ?a1 [  alterneExterne:  ?a2 ]'
		com:
			'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''extérieur de ces parallèles sont alternes externes.'.			
			
	e
		lisRegle: 'angles-alterneExterne2'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
sorteDeDroite ?d3
relation:et:nom: ?d1 ?d2 parallèle
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?ddd3
intersection ?o1 ?dd1 ?dd3
intersection ?o2 ?dd2 ?ddd3
ordonneMot:et:rep1:rep2: ?o1 ?o2  ?o1 ?o2
relation:et:nom: ?d1 ?d2 parallèle
angle0  [ ?x1 ?o1 ?y1 ]
angle0  [ ?x2 ?o2 ?y2  ]
position ?x1 Après ?o1 ?d3
position ?x2 Avant ?o2 ?d3
relation:et:nom: ?d1 ?d2 parallèle
angle0 [ ?x1 ?o1 ?y1 ] [ classement: nonPlat ]
angle0 [ ?x2 ?o2 ?y2 ] [ classement: nonPlat ]
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
different:de: ?o1 ?o2'
		alors: 'angle0 ?a1 [  alterneExterne:  ?a2 ]'
		com:
			'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''extérieur de ces parallèles sont alternes externes.'.
			
ExpertRegle angleSuite: e.
! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 12/18/2023 13:11'!
circuitRegles: e
	e retablit: false.
	ExpertRegle interface: e.
	e
		lisRegle: 'Circuits-AreteSegment'
		si:
			'segment ?s
parents:rep: ?s  ?par
premier:rep: ?par ?x
dernier:rep: ?par ?y'
		alors: 'arete ?s ?x ?y'
		com: 'arête comme segment.'.
	e
		lisRegle: 'Circuits-AreteArc'
		si: 'arc3pts ?a ?x ?y ?z'
		alors: 'arete ?a ?x ?z'
		com: 'arête comme arc.'.
	"	e
		lisRegle: 'Circuit-Resistance'
		si:
			'arete ?a ?x ?z
different:de: ?x ?z'
		alors: '?a ?x ?z'
		com: 'le nom de l''arête est aussi le circuit.'."
	e
		lisRegle: 'Circuit-Circuit'
		si: 'arete [  ?x1 ?x2 ?x3 ] ?x ?z'
		alors: '?x1 ?x2 ?x3'
		com: ' L''élément de circuit est le nom de l''arête'.
	e
		lisRegle: 'CircuitsEntrant'
		si:
			'point ?p
compteFaits:rep:   [ arete ?a ?x ?p ] ?r'
		alors: 'entrant ?p ?r'
		com: 'Le nombred''arêtes qui arrivent sur un noeud.'.
	e
		lisRegle: 'Circuits-Sortant'
		si:
			'point ?p
compteFaits:rep:   [ arete ?a ?p ?x ] ?r'
		alors: 'sortant ?p ?r'
		com: 'Le nombred''arêtes qui reprtentt d''un noeud.'.
	e
		lisRegle: 'Circuits-NouvelleAreteconducteur1'
		si:
			'arete ?cond1 ?x  ?n1
commencePar:début: ?cond1 S
arete ?r ?n1 ?n2
commencePar:débutOuListe: ?r  R
entrant ?n1  1
sortant ?n1 1
retireFait: arete ?cond1 ?x  ?n1
retireFait: arete ?r ?n1 ?n2'
		alors: 'arete ?r ?x  ?n2'
		com: 'Retire les conducteurs.'.
	e
		lisRegle: 'Circuits-NouvelleAreteconducteur2'
		si:
			'arete ?cond2 ?n2 ?y
commencePar:début: ?cond2 S
arete ?r ?n1 ?n2
commencePar:débutOuListe: ?r  R
entrant ?n2 1
sortant ?n2 1
retireFait: arete ?cond2 ?n2 ?y
retireFait: arete ?r ?n1 ?n2'
		alors: 'arete  ?r  ?n1 ?y'
		com: 'Retire les conducteurs.'.
	e
		lisRegle: 'Circuits-PAR2'
		si:
			'arete ?v ?x ?y
arete ?v2 ?x ?y
sortant ?x ?n1
entrant ?y ?n1
ordonneMot:et:rep1:rep2: ?v ?v2 ?r1 ?r2
different:de: ?v ?v2
'
		alors: 'PAR  ?r1 ?r2  ?x ?y'
		com:
			'Des résistances en parallèle sortent d''un même noeud et entrent dans un même noeud.'.
	e
		lisRegle: 'Circuits-NouvelleAretePAR'
		si:
			'PAR ?r1  ?r2  ?n1 ?n2
retireFait: arete ?r1 ?n1 ?n2
retireFait: arete ?r2 ?n1 ?n2
retireFait: PAR ?r1  ?r2  ?n1 ?n2'
		alors: 'arete [ parallele ?r1 ?r2 ] ?n1 ?n2'
		com:
			'On remplace les deux résistances en parallèle par une arête nommée: arete [ parallele ?r1 ?r2 ] ?n1 ?n2.'.
	e
		lisRegle: 'Circuits-SER'
		si:
			'arete ?a1 ?x ?n
commencePar:débutOuListe: ?a1 R
arete ?a2 ?n ?z
sortant ?n 1
entrant ?n 1
commencePar:débutOuListe: ?a2 R
different:de: ?a1 ?a2'
		alors: 'SER ?a1 ?a2 ?x ?z'
		com:
			'Pour les résistances en série, le noeud entre  les résistances a une résistance entrant et une sortant.'.
	e
		lisRegle: 'Circuits-NouvelleAreteSER'
		si:
			'SER ?r1 ?r2 ?n1 ?n2
different:de: ?r1 ?r2
arete ?r1 ?n1 ?x
arete ?r2 ?x  ?n2
retireFait: SER ?r1  ?r2  ?n1 ?n2
retireFait: arete ?r1 ?n1 ?x
retireFait: arete ?r2 ?x ?n2'
		alors: 'arete [ serie ?r1 ?r2 ] ?n1 ?n2'
		com:
			'On remplace les deux résistances en série par une arête nommée: arete [ serie ?r1 ?r2 ] ?n1 ?n2.'.
	e
		lisRegle: 'Circuits-ElementDeCircuit'
		si:
			'arete [ ?a ?r1 ?r2 ] ?n1 ?n2
different:de: ?r1 ?r2'
		alors: '?a ?r1 ?r2'
		com: 'l''élément de circuit est le nom de l''arête.'.
	e
		lisRegle: 'Circuits-CircuitAuxBornes+et-'
		si: 'arete [ ?a ?r1 ?r2 ] + - '
		alors: 'circuit  ?a ?r1 ?r2  + -  '
		com: 'Les circuits qui vont de + à -.'! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 11/19/2024 21:42:05'!
code: e
	| t2 |
	e
		lisRegle: 'interface-texte1'
		si: 'DrGTextItem ?x ?y ?z ?w'
		alors: '?y ?z   ?w'
		com: 'Donnée sous forme de  texte.'.
	e
		lisRegle: 'interface-texte2'
		si: 'DrGTextItem ?x ?y ?z ?u  ?w'
		alors: '?y ?z ?u  ?w'
		com: 'Donnée sous forme de  texte.'.
		
	t2 := e creeRegle: 'Code-DrGPointFreeItem'.
	t2 antecedents: 'DrGPointFreeItem  ?p
point:rep: ?p ?res
asLowerCase:rep: ?p ?lp'.
	t2 concl: 'code ?lp := f point:  ?res'.
	t2 com: 'Code d''un point'.
	

	
	t2 := e creeRegle: 'Code-Segment'.
	t2 antecedents:
'DrGSegment2ptsItem ?s ?x ?y
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy
point:rep: ?xx ?res1
asLowerCase:rep: ?xx ?lxx
point:rep: ?yy ?res2
asLowerCase:rep: ?yy ?lyy
asLowerCase:rep: ?s ?ls'.
t2 concl: 'code ?ls := f segmentDe: ?lxx à: ?lyy'.
t2 com: 'code segment'.


	t2 := e creeRegle: 'Code-Droite'.
	t2 antecedents:
'DrGLine2ptsItem ?s ?x ?y
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy
point:rep: ?xx ?res1
asLowerCase:rep: ?xx ?lxx
point:rep: ?yy ?res2
asLowerCase:rep: ?yy ?lyy
asLowerCase:rep: ?s ?ls'.
t2 concl: 'code ?ls := f droitePassantPar: ?lxx et: ?lyy'.
t2 com: 'code droite'.
! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 5/7/2023 19:17'!
egalites: e
	e
		lisRegle: 'egalité-Points'
		si:
			'point ?p1
point ?p2
point:rep: ?p1 ?pt1
point:rep:  ?p2  ?pt2
égal:à: ?pt1 ?pt2
different:de: ?p1 ?p2'
		alors: 'egal ?p1 ?p2'
		com: 'Des points de même coordonnées  sont égaux.'.
	e
		lisRegle: 'egalité-PointSur1'
		si:
			'egal ?p1 ?p2
point ?p1
point ?p2
pointSur ?obj ?p1'
		alors: 'pointSur ?obj  ?p2'
		com: 'Des points de même coordonnées  sont égaux.'.
	e
		lisRegle: 'egalité-PointSur2'
		si:
			'egal ?p1 ?p2
point ?p1
point ?p2
pointSur ?obj ?p2'
		alors: 'pointSur ?obj  ?p1'
		com: 'Des points de même coordonnées  sont égaux.'.
	e
		lisRegle: 'egalité-AnglesdoubleSomme'
		si:
			'égal [ somme ?x1 ?x2 ] ?x3
égal [ double ?x1 ] [ mesure ?xd1 ]
égal [ double ?x2 ] [ mesure ?xd2 ] 
égal   [ somme [ mesure ?xd1 ] [ mesure ?xd2 ] ] ?xd3
different:de: ?xd1 ?xd2'
		alors: 'égal ?xd3  [ double ?x3 ]'
		com:
			'La somme des doubles de mesures est égale au double de la somme des mesures.
2x + 2y = 2 (x + Y)'.


	"e lisRegle: 'egalites-reflexivite' si:
'segment ?s ?x ?y'
  alors: 'egal ?s ?s'.
r:=e creeRegle: 'egalites-Transitivite1'.
r antecedents: 'egal ?x ?y
egal ?y ?z
different:de: ?x ?y
different:de: ?y ?z
different:de: ?x ?z
'.
r concl: 'egal ?x ?z'.
r com: 'Transivité de la relation égal : Si a =b et b=c alors a = b .'.


r:=e creeRegle: 'egalites-Commutativite'.
r antecedents: 'egal ?x ?y
egal ?z ?y
different:de: ?x ?y
'.
r concl: 'egal ?y ?x'.



r:=e creeRegle: 'egalites-RetireQuantitésEgales1'.
r antecedents: 'somme ?x ?y ?z
somme ?m ?n ?z
egal ?y ?n
'.
r concl: 'egal ?x ?m'.

r:=e creeRegle: 'egalites-RetireQuantitésEgales2'.
r antecedents: 'somme ?x ?y ?z
somme ?m ?n ?z
egal ?x ?m
'.
r concl: 'egal ?y ?n'.


r:=e creeRegle: 'egalites-SommeSegments'.
r antecedents: 'droite ?d ?a ?b
segment ?s1 [ ?x ?y ]
segment ?s2 [ ?y ?z ]
segment ?s3 [ ?x ?z ]
pointSur ?d ?x
pointSur ?d ?y
pointSur ?d ?z
'.

r concl: 'somme ?s1 ?s2 ?s3'.
	
	

e lisRegle: 'egalites-mediatrice1'
 si:  'mediatrice ?m ?a ?b
pointSur ?m ?p
segment ?s1 ?p ?a
segment ?s2 ?p ?b'

alors: 'egal ?s1 ?s2'.

e lisRegle: 'egalites-mediatrice2'
 si:  'mediatrice ?m ?a ?b
pointSur ?m ?p
segment ?s1 ?p ?a
segment ?s2  ?b ?p'

alors: 'egal ?s1 ?s2'.

e lisRegle: 'egalites-mediatrice3'
 si:  'mediatrice ?m ?a ?b
pointSur ?m ?p
segment ?s1 ?a ?p
segment ?s2  ?p ?b'

alors: 'egal ?s1 ?s2'.

e lisRegle: 'egalites-triangleIsocele2' 
si:   'triangle ?t [ sommets: ?a ?b ?c ]
triangle ?t [ isocele de sommet ?b ]
segment ?s1  ?a ?b
segment ?s2  ?c  ?b'
alors: 'egal ?s1  ?s2'.

e lisRegle: 'egalites-triangleIsocele1' 
si:   'triangle ?t [ sommets: ?a ?b ?c ]
triangle ?t [ isocele de sommet ?a ]
segment ?s1  ?c ?a
segment ?s2  ?b  ?a'
alors: 'egal ?s1  ?s2'.


e lisRegle: 'egalites-triangleIsocele3' 
si:   'triangle ?t [ sommets: ?a ?b ?c ]
triangle ?t [ isocele de sommet ?c ]
segment ?s1  ?a?c
segment ?s2  ?b  ?c'
alors: 'egal ?s1  ?s2'.
e lisRegle: 'egalites-translationSegment' 
si: 'translation segment ?s ?so ?v'
alors: 'egal ?s ?so'
"! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 4/4/2020 02:34'!
ensemble:e
e lisRegle: 'initparallèle1'
si: 'parallèle [ ?x1 ?y1 ] [ ?x2 ?y2 ] 
ordonneMot:et:rep1:rep2: ?x1 ?y1 ?xx1 ?yy1 
ordonneMot:et:rep1:rep2: ?x2 ?y2 ?xx2 ?yy2 
segment [ ?xx1 ?yy1 ] 
segment [ ?xx2 ?yy2 ] 
different:de: ?x1 ?x2 
different:de: ?y1 ?y2 
créeNomUnique:rep: paral ?res
~ parallèle ?z ?x 
ajoute:liste:rep: [ ?xx1 ?yy1 ] [ ] ?rep3
ajoute:liste:rep: [ ?xx1 ?yy1 ] ?rep4'
alors: 'parallèle ?res ?rep4'.

e lisRegle: 'initparallèle2'
si: 'parallèle [ ?x1 ?y1 ] [ ?x2 ?y2 ] 
ordonneMot:et:rep1:rep2: ?x1 ?y1 ?xx1 ?yy1 
ordonneMot:et:rep1:rep2: ?x2 ?y2 ?xx2 ?yy2 
segment [ ?xx1 ?yy1 ] 
segment [ ?xx2 ?yy2 ] 
different:de: ?x1 ?x2 
different:de: ?y1 ?y2 
parallèle [ ?xx1 ?yy1 ] ?x 
~ contient:liste: [ ?xx2 ?yy2 ] ?x 
ajoute:liste:rep: [ ?xx2 ?yy2 ] ?x ?rep3 '
alors: 'parallèles [ ?xx1 ?yy1 ] ?rep3 '.
! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 6/28/2025 18:39:26'!
famille: e
e initRegles .
e lisRegle: 'parents'
si:'père  ?e ?p
mère  ?e ?m'
alors:'parents ?e ?m  ?p' 
com:'Les parents d''un enfant sont son père et sa mère'.

e  lisRegle:'frèreOuSoeur'
si:'parents ?e1 ?p  ?m
parents ?e2  ?p  ?m
different:de: ?e1 ?e2
ordonneMot:et:rep1:rep2: ?e1 ?e2  ?x1 ?x2'

alors:'frèreOuSoeur ?x1 ?x2'.

e lisRegle: 'parents2'
si:'parents ?e1 ?m  ?p
parents ?e2 ?m  ?p
different:de: ?e1 ?e2
ordonneMot:et:rep1:rep2: ?e1 ?e2  ?x1 ?x2'
alors:'parents2 [ ?x1 ?x2 ] ?m  ?p'   
com:'Les parents d''un enfant sont son père et sa mère'.! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 9/12/2025 00:39:54'!
figuresNonRectilignes: e
	e
		lisRegle: 'figuresNonRectilignes-AngleAuCentre'
		si:
			'angle0  [ ?x1 ?o ?x2 ]
sorteDeCerclee ?c [ centre: ?o ]
pointSur ?c ?a
pointSur ?c ?bs
relation:et:nom: [ ?a ?o ?b ]  [ ?x1 ?o ?x2 ] équivsalent
different:de: ?a ?b'
		alors: 'sorteDeCercle ?c [  angleAuCentre:  [ ?a ?o ?b ] ]'
		com:
			'Un angle au centre d''un cercle a son sommet au centre du cercle et ses extrémités interceptent le cercle'.
	e
		lisRegle: 'figuresNonRectilignes-PointSurCercle'
		si: 'sorteDeCercle ?c ?o ?x'
		alors: 'pointSur ?c ?x'
		com: 'Le point qui définit un cercle par deux points est sur ce cercle'.
	e
		lisRegle: 'figuresNonRectilignes-RayonCouple'
		si:
			'sorteDeCercle ?c [ centre: ?o ]
pointSur ?c ?p
ordonneMot:et:rep1:rep2: ?o ?p ?oo ?pp'
		alors: 'sorteDeCercle  ?c [ rayonCouple: [ ?oo ?pp ] ]'
		com:
			'Le couple  qui a un point au centre d''un cercle et  l''autre sur ce cercle est un rayon du cercle.
Les éléments d''un couple  sont dans l''ordre alphabétique '.
	e
		lisRegle: 'figuresNonRectilignes-CercleRayonCouple'
		si:
			'sorteDeCercle ?c
cercle ?c
sorteDeCercle ?c ?p'
		alors: 'cercle  ?c ?p'
		com: 'Transfertdes propriètés d''une sorte de cercle au cercle'.
	e
		lisRegle: 'figuresNonRectilignes-RayonSegment'
		si:
			'sorteDeCercle  ?c [ rayon: [ ?oo ?pp ]
segment ?s [ ?oo ?pp ]'
		alors: 'sorteDeCercle  ?c [ rayon: ?s ]'
		com:
			'Le segment qui a une extrémité au centre d''un cercle et  l''autre sur ce cercle est un rayon du cercle'.
	e
		lisRegle: 'figuresNonRectilignes-médiatrice-Cercles'
		si:
			'sorteDeCercle ?x1 ?o1 ?p1
sorteDeCercle ?x2 ?o2 ?p2
droite ?d ?i2 ?i1
intersection ?i1 ?x1 ?x2
intersection ?i2 ?x1 ?x2
relation:et:nom: ?x1 ?x2 isométrique
different:de: ?x1 ?x2'
		alors: 'médiatrice ?d [ ?o1 ?o2 ]'
		com:
			'La médiatrice est le lieu des points équidistants à deux points ou aux extrémités d''un segment.
Sa construction peut se faire à l''aide de deux cercles, de même rayon, centrés sur les points; la médiatrice passe par les intersections des cercles '.
	e
		lisRegle: 'figuresNonRectilignes-médiatrice'
		si:
			'cercle ?c [ centre: ?o ]
corde ?c  [  ?p1 ?p2 ]
perpendiculaire ?perp ?cor ?o
point:rep: ?o ?pto
point:rep: ?p1 ?ptp1
point:rep: ?p2 ?ptp2
aireTriangle:avec:avec:rep: ?ptp1 ?pto ?ptp2 ?aire
inférieur:à: 0 ?aire'
		alors: 'médiatrice ?perp  [ ?p1 ?p2 ]'
		com:
			'La perpendiculaire issue du centre d''un cercle à une corde de ce cercle est une médiatrice de  la corde.'.
	e
		lisRegle: 'figuresNonRectilignes-cercleOrthogonauxRayons0'
		si:
			'cercle ?c1 [ rayon: [ ?x1 ?x2 ] ]
cercle ?c2 [ rayon: [ ?x3 ?x4 ] ]
ordonneMot:et:rep1:rep2: [ ?x1 ?x2 ]  [ ?x3 ?x4 ]  ?xx1 ?xx2
perpendiculaire ?xx1 ?xx2
ordonneMot:et:rep1:rep2:   ?c1 ?c2   ?cc1 ?cc2
different:de: ?c1 ?c2'
		alors: 'orthogonal   ?cc1 ?cc2'
		com:
			'Un cercle est  orthogonal  à un autre cercle si à l''intersecton des cercles, les rayons des cercles sont perpendiculaires'.
	e
		lisRegle: 'figuresNonRectilignes-cercleOrthogonauxDroiteDesCentres'
		si:
			'cercle ?c1 [ centre: ?o1 ]
cercle ?c2  [ centre: ?o2 ]
pointSur ?c2 ?p
sorteDeDroite ?do1P 
pointSur ?do1P  ?o1
pointSur ?do1P ?p
perpendiculaire   ?perp ?do1P ?o2
different:de: ?c1 ?c2'
		alors: 'cercle ?c1 [  droiteDesCentres: [ ?p ?perp ] ]'
		com:
			'Soit un point A, soit un cercle Corth orthogonal à un crcle C.
La perpendiculaire  à la droite reliant le point A  au centre du cercle C, issue du  centre du cercle Corth est la droite des centres.
Tous les cercles passant par le point A et ayant leurs centres sur cette droite sont orthogonaux au cercle C.'.
	e
		lisRegle: 'figuresNonRectilignes-cercleOrthogonaux'
		si:
			'intersection ?o2  ?x ?y 
cercle ?c2 [ centre: ?o2   ]
cercle ?c1 [ droiteDesCentres: [ ?p ?d ] ]
contient:el: [ ?x ?y ] ?d
pointSur ?d ?o2
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
different:de: ?c1 ?c2'
		alors: 'orthogonal ?cc1 ?cc2'
		com:
			'Un cercle qui a son centre  sur la droite des centres d''un cercle est orthogonal à ce cercle.'.
	"	e
		lisRegle: 'figuresNonRectilignes-cercleOrthogonauxRayonsPerpendiculaire'
		si:
			'cercle ?c1 [ rayon: [ ?o1 ?p ]  ]
cercle ?c2 [ rayon: [ ?o2  ?p ]  ]
orthogonal ?c1 ?c2
ordonneMot:et:rep1:rep2: ?o1 ?o2 ?cc1 ?cc2
different:de: ?c1 ?c2'
		alors: 'perpendiculaire [ ?cc1 ?p ]  [ ?cc2  ?p ]'
		com:
			'Si les cercles sont orthogonaux , les rayons reliant le centre du cercle au point d''intersection sont perpendiculaires'."
	e
		lisRegle: 'figuresNonRectilignes-CerclesOrthogonauxTangente1'
		si:
			'orthogonal  ?c1 ?c2
cercle ?c2 [ centre: ?o ]
cercle ?c1 [ rayon: [ ?o1 ?p1 ] ] 
cercle ?c2 [ rayon: [ ?o2 ?p2 ] ]
enleverDe:el:rep: [ ?o2 ?p2 ] ?o ?p
pointSur ?c1 ?p
different:de: mesure ?o1
different:de: mesure ?o2'
		alors: 'cercle ?c1 [ tangente: [  [ ?o2  ?p2 ] ?p ] ]'
		com:
			'Si deux cercles, sont orthogonaux le rayon de l''un est tangente de l''autre'.
	e
		lisRegle: 'figuresNonRectilignes-CreclesOrthogonauxTangente2'
		si:
			'orthogonal  ?c1 ?c2
cercle ?c1 [  centre: ?o1 ]
cercle ?c2 [ rayon: [ ?o2 ?p2 ] ]
enleverDe:el:rep: [ ?o2 ?p2 ] ?o2 ?p
pointSur ?c1  ?p
different:de: mesure ?o1
different:de: mesure ?o2'	
		alors: 'cercle ?c2 [ tangente: [  [ ?o1  ?p2 ] ?p ] ]'
		com:
			'Si deux cercles, sont orthogonaux le rayon de l''un est tangente de l''autre'.
	e
		lisRegle: 'figuresNonRectilignes-pointSurCercleMédiatrice1'
		si:
			'médiatrice ?m  [ ?x1 ?x2 ]
cercle ?c [ centre: ?o ]
pointSur ?m ?o
pointSur ?c ?x1'
		alors: 'pointSur ?c ?x2'
		com:
			'Si le centre d''un cercle est sur la médiatrice de deux points et que l''un des points est sur le cercle, l''autre l''est aussi.'.
	e
		lisRegle: 'figuresNonRectilignes-pointSurCercleMédiatrice2'
		si:
			'médiatrice ?m  [ ?x1 ?x2 ]
cercle ?c [ centre: ?o ]
pointSur ?m ?o
pointSur ?c ?x2'
		alors: 'pointSur ?c ?x1'
		com:
			'Si le centre d''un cercle est sur la médiatrice de deux points et que l''un des points est sur le cercle, l''autre l''est aussi.'.
	e
		lisRegle: 'figuresNonRectilignes-cercleOrthogonalPassantParUnPoint'
		si:
			'cercle ?c1 [ rayon: [ ?o1 ?p ]
médiatrice ?m [ ?ps ?p  ]
cercle ?c1 [  tangente: [  ?t ?p ] ]
intersection ?o2  ?t ?m
cercle  ?c2 [ centre: ?o2 ]'
		alors: 'cercle ?c2 [ orthogonal: [ ?c1 point: ?ps ] ]'
		com: 'Le cercle c2  passant par un point P , orthogonal à un cercle c1'.
	e
		lisRegle: 'figuresNonRectilignes-cercleOrthogonalPassantParDeuxPts'
		si:
			'cercle ?c3 [ centre: ?o3 ]
cercle ?c1 [ centre: ?o1 ]
droiteDesCentres  ?x1 ?o1 ?x3
intersection  ?o3  ?x1 ?m
médiatrice ?m [ ?a ?b ]'
		alors: 'cercle ?c3 [ orthogonal: [ ?c1 points: ?a ?b ]'
		com:
			'Un cercle c2  orthogonal à un cercle c1 et passant par les points A et B'.
	e
		lisRegle: 'figuresNonRectilignes-cercleOrthogonalDroiteDesCentres'
		si:
			'cercle ?c2 [ orthogonal: [ ?c1 point: ?ps ] 
cercle ?c1 [  centre: ?o1 ]
sorteDeDroite ?d1  ?ps  ?o1
perpendiculaire ?d2 ?d1 ?o2'
		alors: 'droiteDesCentres ?d2 ?o1 ?ps'
		com:
			'Droite des centres, c2  orthogonal à un cercle c1 et passant par un point P'.

	e lisRegle: 'figuresNonRectilignes-cerclesOrthogonaux'
 si:  'cercle ?x1 [ tangente: [  ?t1 ?p ] ]
cercle ?x2 [ tangente: [  ?t2 ?p ] ]
perpendiculaire ?t2 ?t1
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2'
alors: 'orthogonal ?xx1 ?xx2'
com:  'Deux cercles sont orthogonaux si leurs tangentes sont perpendiculaires'.

	"e
		lisRegle: 'figuresNonRectilignes-cerclesOrthogonaux2'
		si:
			'cercle ?c2 [  orthogonal: [ ?c1 point: ?ps ] ]
ordonneMot:et:rep1:rep2: ?c2 ?c1 ?xx1 ?xx2'
		alors: 'orthogonal ?xx1 ?xx2'
		com: 'Un cercle orthogonal à un cercle donné passant par un point.'."
	"	e
		lisRegle: 'figuresNonRectilignes-cerclesOrthogonaux3'
		si:
			'cercle ?c3 [ orthogonal: [ ?c1 points: ?a ?b ] ]
ordonneMot:et:rep1:rep2: ?c3 ?c1 ?xx1 ?xx2'
		alors: 'orthogonal ?xx1 ?xx2'
		com: 'Un cercle orthogonal à un cercle donné passant par deux points.'."
	e
		lisRegle: 'figuresNonRectilignes-isométrieSegment'
		si:
			'pointSur ?c ?p
cercle ?c [  rayon: [ mesure [ ?p1 ?p2 ] ]  ]  ]
cercle ?c [  centre: ?o  ]
relationCrée:et:nom: [ ?p1 ?p2 ]  [ ?o  ?p ] isométrique'
		alors: 'relationCréée  [ ?p1 ?p2 ]  [ ?o  ?p ] isométrique'
		com:
			'Tout rayon d''un cercle défini par un segment est isométrique à ce segment .'.
	e
		lisRegle: 'figuresNonRectilignes-médiatriceCorde'
		si:
			'pointSur  ?x1 ?x2
pointSur  ?x1 ?x3
milieu [  ?x2 ?x3  ] ?m
cercle ?x1 [ centre: ?o  ]
ordonneMot:et:rep1:rep2:  ?o ?m ?oo ?mm
sorteDeDroite ?d ?oo ?mm'
		alors: 'médiatrice ?d [ ?x2 ?x3 ]'.
	"	e
		lisRegle: 'figuresNonRectilignes-CercleRayon0'
		si:
			'sorteDeCercle ?c [ centre: ?o ] 
segment ?s ?ss
pointSur ?c ?z
contient:el: ?ss ?z
contient:el: ?ss ?o'
		alors: 'sorteDeCercle  ?c [ rayon: ?ss ]'
		com:
			'Le rayon d''un cercle est un couple de deux points, l''un est le centre du cercle, l''autre un point sur le cercle'."
	e
		lisRegle: 'figuresNonRectilignes-CercleCouples'
		si: 'sorteDeCercle  ?c [ rayon: [ ?oo  ?xx ] ]'
		alors: 'rayon ?c [ ?oo ?xx ]'
		com: 'Le rayon d''un cercle pour compatibilité avec d''autres règles'.
	e
		lisRegle: 'figuresNonRectilignes-Cercle'
		si: 'sorteDeCercle ?c ?centre ?p'
		alors: 'sorteDeCercle ?c [ centre: ?centre ]'
		com: 'Définition du centre d'' un cercle'.
	e
		lisRegle: 'figuresNonRectilignes-sorteDeCercleCentre'
		si: 'cercle ?c [ centre: ?c0 ]'
		alors: 'sorteDeCercle ?c  [ centre:  ?c0  ]'
		com: 'SotreDeCercle , centre du cercle'.
	e
		lisRegle: 'figuresNonRectilignes-sorteDeCerclePointSur'
		si:
			'sorteDeCercle ?c ?i ?p
pointSur ?c  ?pts'
		alors: 'sorteDeCercle ?c  [ pointSur: ?pts  ]'
		com: 'SorteDeCercle , point sur ce  cercle.'.
	e
		lisRegle: 'figuresNonRectilignes-CerclePar3pts'
		si:
			'intersection ?i ?m1 ?m2
médiatrice ?m1 ?pts1
médiatrice ?m2 ?pts2
cercle ?c [ centre: ?i ]
point ?p
contient:el: ?pts1 ?p
contient:el: ?pts2 ?p
enleverDe:el:rep: ?pts1 ?p ?p1
enleverDe:el:rep: ?pts2 ?p ?p2'
		alors: 'cercle ?c  [ cerclePar3Points: [ ?p1 ?p ?p2 ]  ]'
		com:
			'Cercle par 3 points, l'' intersection des médiatrices de deux paires de points est le centre du cercle'.
	e
		lisRegle: 'figuresNonRectilignes-CerclePar3ptsPoint1'
		si: 'cercle ?c  [ cerclePar3Points: [ ?p1 ?p ?p2 ] ]'
		alors: 'pointSur ?c ?p1'
		com:
			'Un des 3 points par où passe un cercle par 3 points est sur le cercle.'.
	e
		lisRegle: 'figuresNonRectilignes-CerclePar3ptsPoint2'
		si: 'cercle ?c  [ cerclePar3Points: [ ?p1 ?p ?p2 ] ]'
		alors: 'pointSur ?c ?p'
		com:
			'Un des 3 points par où passe un cercle par 3 points est sur le cercle.'.
	e
		lisRegle: 'figuresNonRectilignes-CerclePar3ptsPoint3'
		si: 'cercle ?c  [ cerclePar3Points: [ ?p1 ?p ?p2 ] ]'
		alors: 'pointSur ?c ?p2'
		com:
			'Un des 3 points par où passe un cercle par 3 points est sur le cercle.'.
	e
		lisRegle: 'figuresNonRectilignes-isométrie-Rayons'
		si:
			' sorteDeCercle  ?c [ rayon: [ ?x1  ?y1 ] ] 
sorteDeCercle  ?c [ rayon:  [ ?x2  ?y2 ]  ]
ordonneMot:et:rep1:rep2:  [ ?x1  ?y1 ] [ ?x2  ?y2 ]  ?r1 ?r2
relationCrée:et:nom: ?r1 ?r2  isométrique
different:de: [ ?x1  ?y1 ] [ ?x2  ?y2 ]'
		alors: 'relationCréée ?r1 ?r2 isométrique'
		com: 'Les rayons d''une même sorteDeCercle sont isométriques.'.
	e
		lisRegle: 'figuresNonRectilignes-isométrie-Cercle1'
		si:
			'sorteDeCercle  ?c1 [ rayon: ?r ]
sorteDeCercle  ?c2 [ rayon: ?r ]
different:de: ?c1 ?c2
relationCrée:et:nom:?c1 ?c2  isométrique'
		alors: 'relationCréée  ?c1 ?c2 isométrique'
		com:
			'Si deux cercles différents, ont même rayon ou des rayons de même mesure, alors les cercles sont isométriques.'.
	e
		lisRegle: 'figuresNonRectilignes-isométrie-CercleSegment'
		si:
			'cercle ?c1 ?s
segment ?s
cercle ?c2 ?s
different:de: ?c1 ?c2
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
relationCrée:et:nom: ?cc1 ?cc2 isométrique'
		alors: 'relationCréée  ?cc1 ?cc2 isométrique'
		com:
			'Si  deux cercles différents sont définis par un même segment, alors les cercles sont isométriques, ils ont un même rayon.'.
	e
		lisRegle: 'figuresNonRectilignes-isométrie-CercleValeurCentre'
		si: 'cercle ?c1 ?centre ?val  ?n'
		alors: 'cercle ?c1 [ centre: ?centre ]'
		com: 'Centre d''un cercle défini par le centre et une mesure du rayon'.
	e
		lisRegle: 'figuresNonRectilignes-isométrie-CercleValeurMesureRayon'
		si: 'cercle ?c1 ?centre ?val  ?n'
		alors: 'cercle ?c1 [ rayon:  [ mesure  ?val ]'
		com: 'Mesure du rayon d''un cercle dont le rayon est donné par une valeur'.
	"e
		lisRegle: 'figuresNonRectilignes-isométrie-CercleSegmentMesureRayon'
		si: 'cercle ?c1 [ segment: ?s ]'
		alors: 'cercle ?c1 [ rayon:  [ mesure  ?s ] ]'
		com: 'Mesure du rayon d''un cercle dont le rayon est donné par une valeur'."
	e
		lisRegle: 'figuresNonRectilignes-isométrie-CercleSegmentIsométrieCercles'
		si:
			'cercle ?c1 [ segment: ?seg ]
segment ?s ?y
cercle ?c2 [ rayon: ?seg ]
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
relationCrée:et:nom: ?cc1  ?cc2 isométrique'
		alors: 'relationCréée ?cc1  ?cc2 isométrique'
		com:
			'Un cercle défini par un segment est isométrique au cercle qui a ce segment pour rayon'.
	e
		lisRegle: 'figuresNonRectilignes-isométrie-CercleSegmentIsométriques'
		si:
			' cercle ?c1 [ segment: [ ?x1 ?y1 ]
cercle ?c1 [ rayon: [ ?x2 ?y2 ] ]
ordonneMot:et:rep1:rep2: [ ?x1 ?y1 ] [ ?x2 ?y2 ] ?r1 ?r2
relationCrée:et:nom: ?r1 ?r2 isométrique'
		alors: 'relationCréée ?r1 ?r2 isométrique'
		com:
			'Un cercle défini par un segment a ses rayons isométriques à ce segment'.
	e
		lisRegle: 'figuresNonRectilignes-isométrie-CercleIsométriques'
		si:
			'isométrique ?c1 ?c2
sorteDeCercle ?c1
sorteDeCercle ?c2
sorteDeCercle  ?c1 [ rayon: ?r1 ]
sorteDeCercle  ?c2 [ rayon: ?r2 ]
different:de: ?c1 ?c2
relationCrée:et:nom:  ?r1 ?r2 isométrique'
		alors: 'relationCréée ?r1 ?r2 isométrique'
		com:
			'Si  deux cercles différents sont isométriques, alors leurs rayons sont isométriques.'.
	e
		lisRegle: 'figuresNonRectilignes-diamètre1'
		si:
			'sorteDeCercle ?c [ centre: ?o  ]
pointSur ?c ?x1
pointSur ?c ?x2
alignement [ ?x1 ?o ?x2 ]
different:de: ?x1 ?x2'
		alors: 'sorteDeCercle ?c [ diamètre: [ ?x1 ?x2 ] ]'.
	e
		lisRegle: 'figuresNonRectilignes-diamètre3'
		si:
			'sorteDeCercle ?c [ centre: ?o  ]
DrGArcCenterAngleItem ?c ?o ?x2  ?x1
alignement [ ?x1 ?o ?x2 ]
different:de: ?x1 ?x2'
		alors: 'sorteDeCercle ?c [ diamètre: [ ?x1 ?x2 ] ]'
		com:
			'Si deux points sur un cercle sont alignés avec le centre de ce cercle le couple de points est un diamètre du .'.
	e
		lisRegle: 'figuresNonRectilignes-diamètre2'
		si:
			'sorteDeCercle ?c [ centre: ?o  ]
pointSur ?c ?x1
pointSur ?c ?x2
alignement [ ?x2 ?o ?x1 ]
different:de: ?x1 ?x2'
		alors: 'sorteDeCercle ?c [ diamètre: [ ?x2 ?x1 ]'
		com:
			'Si deux points sont alignés avec le centre de ce cercle le couple de points est un diamètre du cercle.'.
		e
		lisRegle: 'figuresNonRectilignes-alignementDiamètreRayon'
		si:
			'alignement [ ?x1 ?o ?x2 ]
cercle ?c [ rayon: [ ?o ?x1 ] ]
cercle ?c [ rayon: [ ?o ?x2 ] ]'
		alors: 'cercle ?c [  diamètre: [ ?x1 ?x2 ] ]'
		com:
			'Si les extémités de deux rayons sont alignées avec le centre de ce cercle le couple des extrémité des rayons est un diamètre du cercle'.
	e
		lisRegle: 'figuresNonRectilignes-Médiatricediamètre'
		si:
			'médiatrice ?d 
cercle ?c ?centre ?z 
intersection ?x1 ?c ?d
intersection ?x2 ?c ?d
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2'
		alors: 'diamètre ?c [ ?xx1 ?xx2 ]'
		com:
			'Le segment qui relie les intersections d''une médiatrice d''un diamètre d''un cercle  avec ce cercle est un diamètre de ce cercle'.
	e
		lisRegle: 'figuresNonRectilignes-diamètreCercleSegment'
		si:
			'diamètre ?c [ ?x1 ?x2 ] 
vecteur   ?s  ?x1 ?x2
ordonneMot:et:rep1:rep2: ?v1 ?v2 ?x1 ?x2
~ segment ?s2[ ?x1 ?x2 ]'
		alors: 'segment ?s [ ?x1 ?x2 ]'
		com:
			'Si le diamètre d''un cercle est un vecteur, il est aussi un segment de mêmes extrémités, pour compatibilité avec les règles qui utilisent des segments.'.
	e
		lisRegle: 'figuresNonRectilignes-diamètreCercleIsometrie'
		si:
			'diamètre ?c ?d1
diamètre ?c ?d2
different:de: ?d1 ?d2
relationCrée:et:nom: ?d1 ?d2 isométrique'
		alors: 'relationCréée  ?d1 ?d2 isométrique'
		com: 'Les diamètres d''un même cerccle sont isométriques'.
	e
		lisRegle: 'figuresNonRectilignes-diamètreArc2'
		si:
			'arcCentré  ?a  ?centre ?x3 ?x4
segment ?s [ ?x3 ?x4 ]
pointSur  ?s ?centre'
		alors: 'diamètre ?a [ ?x3 ?x4 ]'.
	e
		lisRegle: 'figuresNonRectilignes-diamètreArc'
		si:
			'arcCentré  ?arc ?centre ?x1 ?x2
milieu ?x1 ?x2 ?centre'
		alors: 'arcCentré  ?arc [   diamètre: [ ?x1 ?x2   ]'
		com:
			'Si le centre de l''arc est le  milieu des extrémités alors le segment reliant les extémités est un diamètre'.
	e
		lisRegle: 'figuresNonRectilignes-ArcIsométriques'
		si:
			'arcCentré ?arc1 ?o ?a ?b
arcCentré ?arc2 ?o ?b ?c
relation:et:nom:  [ ?a ?b ] [  ?c  ?b ] isométrique
relationCrée:et:nom:  ?arc1 ?arc2  isométrique'
		alors: 'relationCréée  ?arc1 ?arc2   isométrique'
		com:
			'Des arcs centrés de même centre sont isométriques si leur extrémités sont des couples isométriques'.
	e
		lisRegle: 'figuresNonRectilignes-ArcIsométriquesAngleDroit1'
		si:
			'arcCentré  ?x1 ?x2 ?x3 ?x4
arcCentré  ?x5  ?x2 ?x7 ?x8
angle0 [ ?x3 ?x2 ?x4 ] [ supplémentaire: [ ?x7 ?x2 ?x8 ] ]
relation:et:nom: ?x1 ?x5 isométrique
different:de: ?x1 ?x5
relationCrée:et:nom: [ ?x3 ?x2 ?x4  ]  [ ?x7 ?x2 ?x8 ] isométrique'
		alors: 'relationCréée [ ?x3 ?x2 ?x4  ]  [ ?x7 ?x2 ?x8 ] isométrique'
		com:
			'Si deux arcs centrés partagent un demi-cercle et sont isométriques, ils partagent le demi-cercle en deux parties égales, leurs extrémités sont les extrémités d''angles supplémentaires et isométriques'.
e
		lisRegle: 'figuresNonRectilignes-ArcIsométriquesAngleDroit2'
		si:
			'arcCentré  ?x1 ?x2 ?x3 ?x4
arcCentré  ?x5  ?x2 ?x7 ?x8
angle0 [ ?x3 ?x2 ?x4 ] [ supplémentaire: [ ?x7 ?x2 ?x8 ] ]
relation:et:nom: ?x1 ?x5 isométrique
different:de: ?x1 ?x5
relationCrée:et:nom: [ ?x3 ?x2 ?x4  ]  [ ?x7 ?x2 ?x8 ] isométrique'
		alors: 'relationCréée [ ?x3 ?x2 ?x4  ]  [ ?x7 ?x2 ?x8 ] isométrique'
		com:
			'Si deux arcs centrés partagent un demi-cercle et sont isométriques, ils partagent le demi-cercle en deux parties égales, leurs extrémités sont les extrémités d''angles supplémentaires et isométriques'.
	e
		lisRegle: 'figuresNonRectilignes-AngleAigu'
		si:
			'angle0 [ ?x1 ?o  ?y1 ] [ supplémentaire:  ?x2 ] 
sorteDeCercle ?cer 
sorteDeCercle ?cer [ diamètre: ?diam ]
médiatrice ?m ?diam
pointsSurCercle:rep:  ?cer ?pts
ordonneMot:et:rep1:rep2: ?cer ?m  ?ccer ?mm
intersection ?i  ?ccer ?mm
index:el:rep: ?pts ?i ?indCer
index:el:rep: ?pts ?x1 ?ind
different:de: ?ind ?indCer
supérieur:à:  ?ind ?indCer'
		alors: 'angle0 [  ?x1 ?o  ?y1 ] [ classement: aigu ]'
		com: 'angle aigu en premier'.
	e
		lisRegle: 'figuresNonRectilignes-AngleObtus'
		si:
			'angle0 [ ?x1 ?o  ?y1 ] [ supplémentaire:  ?x2 ] 
sorteDeCercle ?cer 
sorteDeCercle ?cer [ diamètre: ?diam ]
médiatrice ?m ?diam
pointsSurCercle:rep:  ?cer ?pts
ordonneMot:et:rep1:rep2: ?cer ?m  ?ccer ?mm
intersection ?i  ?ccer ?mm
index:el:rep: ?pts ?i ?indCer
index:el:rep: ?pts ?x1 ?ind
different:de: ?ind ?indCer
inférieur:à:  ?ind ?indCer'
		alors: 'angle0 [  ?x1 ?o  ?y1 ] [ classement: obtus'
		com: 'angle obtus en premier'.
	e
		lisRegle: 'figuresNonRectilignes-AngleObtus2'
		si:
			'angle0 [ ?x1 ?o  ?y1 ] [ supplémentaire: [ ?x2 ?o ?y2 ]  ] 
sorteDeCercle ?cer 
sorteDeCercle ?cer [ diamètre: ?diam ]
médiatrice ?m ?diam
pointsSurCercle:rep:  ?cer ?pts
ordonneMot:et:rep1:rep2: ?cer ?m  ?ccer ?mm
intersection ?i  ?ccer ?mm
index:el:rep: ?pts ?i ?indCer
index:el:rep: ?pts ?y2 ?ind
different:de: ?ind ?indCer
supérieur:à:  ?ind ?indCer'
		alors: 'angle0 [  ?x2 ?o  ?y2 ] [ classement: obtus ]'
		com: 'angle obtus en dernier'.
	e
		lisRegle: 'figuresNonRectilignes-AngleAigu2'
		si:
			'angle0 [ ?x1 ?o  ?y1 ] [ supplémentaire: [ ?x2 ?o ?y2 ]  ] 
sorteDeCercle ?cer 
sorteDeCercle ?cer [ diamètre: ?diam ]
médiatrice ?m ?diam
pointsSurCercle:rep:  ?cer ?pts
ordonneMot:et:rep1:rep2: ?cer ?m  ?ccer ?mm
intersection ?i  ?ccer ?mm
index:el:rep: ?pts ?i ?indCer
index:el:rep: ?pts ?y2 ?ind
different:de: ?ind ?indCer
inférieur:à:  ?ind ?indCer'
		alors: 'angle0 [  ?x2 ?o  ?y2 ] [ classement: aigu ]'
		com: 'angle aigu en dernier'.
	e
		lisRegle: 'figuresNonRectilignes-diamètreIntersection'
		si:
			'droite ?d 
sorteDeCercle ?c ?centre ?z
intersection ?x1 ?c ?d
intersection ?x2 ?c ?d 
pointSur ?d  ?centre
~egal ?x1 ?x2
different:de: ?x1 ?x2'
		alors: ' cercle ?c [  diamètre: [ ?x1 ?x2 ]  ]'.
	e
		lisRegle: 'figuresNonRectilignes-Milieu'
		si:
			'sorteDeCercle ?c   [diamètre: ?c [ ?x ?y ]
sorteDeCercle ?c ?centre ?z'
		alors: 'sorteDeCercle ?c [ milieu [ ?x ?y ] ?centre'
		com: 'Le milieu   d''un diamètre est le centre du sorteDeCercle.'.
	e
		lisRegle: 'figuresNonRectilignes-AngleInscritDemiCercle'
		si:
			'cercle ?c [ diamètre: [ ?x1 ?x2 ] ]
pointSur ?c ?p
ordonneMot:et:rep1:rep2: ?x1 ?p  ?xx1 ?pp 
ordonneMot:et:rep1:rep2: ?p ?x2 ?ppp ?xx
different:de: ?p ?x1
different:de: ?p ?x2'
		alors: 'perpendiculaire [ ?xx1 ?pp ] [ ?ppp ?xx ]'
		com:
			'Un angle incrit dans un demi cercle est un angle droit, il a ses extrémités aux extrémités d''un diamètre.'.
	e
		lisRegle: 'figuresNonRectilignes-AngleIncrit'
		si:
			'cercle ?c 
pointSur ?c ?p1
pointSur ?c ?p2
pointSur ?c ?p3
angle0 [ ?x1 ?p2 ?x3 ]
relation:et:nom: [  ?p1 ?p2 ?p3 ] [ ?x1 ?p2 ?x3 ] équivalent'
		alors: 'cercle ?c [ angleInscrit: [ ?p1 ?p2 ?p3  ] ]'
		com:
			'Un angle inscrit dans un cercle a son sommet sur ce cercle et ses extrémités interceptent le cercle'.
	e
		lisRegle: 'figuresNonRectilignes-alignementMilieu'
		si:
			'milieu ?o [  ?x1 ?x2 ]
relationCrée:et:nom: [ ?o ?x1 ] [ ?x2 ?o ] isométrique
different:de: ?x1 ?x2'
		alors: 'relationCréée [ ?o  ?x1 ] [ ?x2 ?o] isométrique'
		com:
			'si un point est le milieu de deux points,  les couples qui le reiie à chaque point sont isométriques.'.
	e
		lisRegle: 'figuresNonRectilignes-PuissancePoint'
		si:
			'cercle ?c [  centre: ?O ]
pointSur ?d ?P
ordonneMot:et:rep1:rep2: ?c ?d ?cc ?dd
intersection ?i1  ?cc ?dd
intersection ?i2 ?cc ?dd 
ordonneMot:et:rep1:rep2: ?i1 ?P ?ii1 ?oo1
ordonneMot:et:rep1:rep2: ?i2 ?P ?ii2 ?oo2
ordonneMot:et:rep1:rep2: ?i1 ?i2  ?ii1 ?ii2 
different:de: ?i1 ?i2
different:de: ?P ?i1
different:de: ?P ?i2'
		alors:
			'puissanceFormule ?P ?c ?d [  produit [ mesure [ ?ii1 ?oo1 ] ] [ mesure [  ?ii2 ?oo2 ]  ] ]'
		com:
			'La puissance d''un point par rapport à un cercle est le produit des distances de ce point aux intersections d''une droite passant par ce point et coupant le cercle.'.
	e
		lisRegle: 'figuresNonRectilignes-EgalitéPuissanceMêmeCercleMêmePoint'
		si:
			'puissanceFormule  ?O ?c1 ?d1 [ produit [ mesure ?x1 ] [ mesure ?y1 ] ]
puissanceFormule  ?O ?c1 ?d2 [ produit [ mesure ?x2 ] [ mesure ?y2 ] ]
pointSur ?d1 ?O
pointSur ?d2 ?O
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?d1 ?d2
different:de: ?d1 ?d2'
		alors:
			'égal [ produit [ mesure ?x1 ] [ mesure ?y1 ] ]  [ produit [ mesure ?x2 ] [ mesure ?y2 ] ]'
		com: 'Les puisances d''un même point sont égales pour un cercle donné'.
	e
		lisRegle: 'figuresNonRectilignes-ValeurPuissance'
		si:
			'puissanceFormule ?O ?c ?d [  produit [ mesure ?m1 ] [ mesure ?m2 ] 
mesure ?m1 ?v1
mesure ?m2 ?v2
produit:et:rep: ?v1 ?v2 ?res
arrondis:rep:  ?res ?resArr
arrondis:rep:  ?v1 ?v1Arr
arrondis:rep:  ?v2 ?v2Arr'
		alors: 'puissance ?O ?c ?resArr [ ?m1 ?v1Arr ] [ ?m2 ?v2Arr ]'
		com:
			'Calcul de la puissance d''un point par rapport à un cercle à partir des mesures.'.
	e
		lisRegle: 'figuresNonRectilignes-AngleIncritDemiCercle'
		si:
			'sorteDeCercle ?c [ diamètre: [ ?p1 ?p3 ] ]
sorteDeCercle ?c [ centre: ?o ]
pointSur ?c ?p1
pointSur ?c ?p2
pointSur ?c ?p3
angle0 [ ?p1 ?p2 ?p3 ]'
		alors: 'angle0 [ ?p1 ?p2 ?p3 ] [ inscrit: [ demi-cercle [ ?p1 ?o ?p3  ] ]'
		com:
			'Si  deux points sont les extrémité d'' un diamètre d''un cercle, l''angle qui a son sommet sur ce cercle et comme extrémités les extrémités du diamètre du cercle est un angle inscrit dans un demi cercle, c''est un angle droit.'.
	e
		lisRegle: 'figuresNonRectilignes-AngleInscritDemiCercleDroit'
		si:
			'angle0  End of statement list encountered ->[ ?p1 ?p2 ?p3 ] [ inscrit: [ demi-cercle [ ?p1 ?o ?p3  ] ]'
		alors: 'angle0 [ ?p1 ?p2 ?p3 ] [  droit  ]'
		com: 'Un angle inscrit dans un demi cercle est droit.'.
	e
		lisRegle: 'figuresNonRectilignes-tangente001'
		si:
			'cercle ?c [ rayon: ?r ]
cercle ?c [ centre: ?O ]
enleverDe:el:rep: ?r ?O ?p
intersection  ?p ?x2 ?x3
perpendiculaire ?x2 ?x3
segment ?s ?r
enleverDe:el:rep: [ ?x2 ?x3 ] ?s ?t'
		alors: 'sorteDeCercle ?c [ tangente: [ point:  ?p tangente: ?t ] ]'
		com: 'Tangente en un point à un cercle. '.
	e
		lisRegle: 'figuresNonRectilignes-tangentePerp1'
		si:
			'sorteDeCercle ?c [ rayon: ?r  ]
sorteDeCercle ?c [ centre: ?cent ]
enleverDe:el:rep: ?r  ?cent ?p
perpendiculaire ?x1 ?x2 
coupleSur ?x1 ?r
coupleSur ?x2 ?tanj'
		alors: 'sorteDeCercle ?c [ tangente:  [ point: ?p tangente: ?tanj ]   ]'
		com: 'Tangente en un point à un cercle. '.
	e
		lisRegle: 'figuresNonRectilignes-PropriétésSorteDeCercle'
		si:
			'cercle ?c
sorteDeCercle ?c ?prop'
		alors: 'cercle ?c ?prop'
		com: 'transfert propriétés sorteDeCercle au cercle.'.
	e
		lisRegle: 'figuresNonRectilignes-tangentePerp2'
		si:
			'sorteDeCercle ?c [ rayon: ?r  ]
sorteDeCercle ?c [ centre: ?cent ]
enleverDe:el:rep: ?r  ?cent ?p
perpendiculaire ?x1 ?x2 ?p
coupleSur ?x1 ?tanj
coupleSur ?x2 ?r'
		alors: 'cercle ?c [ tangente:  [  ?tanj  ?p ] ]'
		com: 'Tangente en un point à un sorteDeCercle. '.
	e
		lisRegle: 'figuresNonRectilignes-tangente002'
		si:
			'sorteDeCercle ?c [ rayon: [ ?p1 ?p2  ] ]
sorteDeCercle ?c  [ centre: ?O ]
enleverDe:el:rep: [ ?p1 ?p2  ] ?O ?p
perpendiculaire  [ ?p1 ?p2 ] [  ?x1 ?x2 ]
different:de: [ ?p1 ?p2 ] [  ?x1 ?x2 ]'
		alors:
			'sorteDeCercle ?c [ tangente: [ point: ?p tangente:  [  ?x1 ?x2  ]  ] ]'
		com: 'Tangente en un point à un Cercle. '.
	ExpertRegle figuresNonRectilignesSuite: e! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 9/12/2025 11:29:30'!
figuresNonRectilignesSuite: e
	e
		lisRegle: 'figuresNonRectilignes-couple'
		si: 'sorteDeCercle ?c  [ rayonCouple:  ?couple  ]'
		alors: 'couple ?couple'
		com: 'Un couple de points, les points sont dans l''ordre alphabétique.'.
	e
		lisRegle: 'figuresNonRectilignes-RayonCercle'
		si: 'sorteDeCercle ?c [ centre: ?o ]
pointSur ?c ?p'
		alors: 'sorteDeCercle  ?c [ rayon: [ ?o ?p ] ]'
		com: 'Le rayon d''un cercle va du centre vers le cercle'.
	e
		lisRegle: 'figuresNonRectilignes-cerclesOrthogonaux1'
		si: 'orthogonal ?c1 ?c2'
		alors: 'cercle ?c1 [ orthogonal: ?c2  ]'
		com: 'Deux cercles sont orthogonaux si le rayon de l''un  et de l''autre sont perpendiculaire'.
	e
		lisRegle: 'figuresNonRectilignes-cerclesOrthogonaux2'
		si: 'orthogonal ?c1 ?c2'
		alors: 'cercle ?c2 [ orthogonal: ?c1  ]'
		com: 'Deux cercles sont orthogonaux si le rayon de l''un  et de l''autre sont perpendiculaire'.
	e
		lisRegle: 'figuresNonRectilignes-OrthogonalPerp'
		si: 'orthogonal ?x1 ?x2
cercle  ?x1 [ rayon: [ ?t1 ?p ]  ]             
cercle  ?x2 [  rayon: [ ?t2 ?p ]  ]
ordonneMot:et:rep1:rep2: [ ?t1 ?p ] [ ?t2 ?p ] ?r1 ?r2'
		alors: 'perpendiculaire ?r1 ?r2'
		com: 'les rayons passant par l''intersection de deux cercles orthogonaux sont perpendiculaires.'.
	e
		lisRegle: 'figuresNonRectilignes-cercleDiamètresIsométriques'
		si: 'cercle ?c [ diamètre: ?d1 ]
cercle ?c [ diamètre: ?d2 ]
different:de: ?d1 ?d2
relationCrée:et:nom:  ?d1 ?d2  isométrique'
		alors: 'relationCréée  ?d1 ?d2 isomérique'
		com: 'Les diamètre d''un même cercle sont isométriques'.! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 4/24/2025 17:14:05'!
figuresRectilignes: e
	e
		lisRegle: 'égalitéParallèleParallèleDirection'
		si:
			'sorteDeDroite ?x1
sorteDeDroite ?x2
égalité Parallèle ParallèleDirection
relation:et:nom: ?x1 ?x2 parallèleDirection
relationCrée:et:nom: ?x1 ?x2 parallèle'
		alors: 'relationCrée:et:nom: ?x1 ?2 parallèle'
		com: 'égalitéParallèleParallèleDirection'.


	"	e
		lisRegle: 'figuresRectilignes-droitePointsSur'
		si:
			'sorteDeDroite ?d
pointSur ?d ?p1
pointSur ?d ?p2
ordonneMot:et:rep1:rep2: ?p1 ?p2 ?p1 ?p2 
mot:et:et:rep: ?p1 : ?p2 ?nom
different:de: ?p1 ?p2'
		alors: 'segment ?nom [ ?p1 ?p2 ]'
		com: 'Des points sur une droite foment un segment'."
	e
		lisRegle: 'figuresRectilignes-SegmentConfondus'
		si:
			'segment ?s ?ss
segment ?s2 ?ss
different:de: ?s2 ?s'
		alors: 'confondu ?s ?s2'
		com: 'Des segments avec les mêmes extrémités sont confondus'.
	e
		lisRegle: 'figuresRectilignes-origineLigne'
		si:
			'sorteDeDroite ?d ?x ?y
DrGLine2ptsItem ?d ?or ?extr'
		alors: 'origine ?d ?or'
		com: 'Le premier des parents d''une sorte de droite est son origine.'.
	e
		lisRegle: 'figuresRectilignes-origineDemiDroite'
		si:
			'sorteDeDroite ?d ?x ?y
DrGRay2ptsItem ?d ?or ?extr'
		alors: 'origine ?d ?or'
		com: 'Le premier des parents d''une sorte de droite'.
	e
		lisRegle: 'figuresRectilignes-origineSegment'
		si:
			'sorteDeDroite ?d ?x ?y'
		alors: 'parent1 ?d ?x'
		com: 'Le premier des parents d''une sorte de droite.'.
	e
		lisRegle: 'figuresRectilignes-pointLigneParent2'
		si:
			'sorteDeDroite ?d ?x ?y'
		alors: 'parent2 ?d ?y'
		com:
			'Le deuxième des parents d''une sorte de droite'.
	"e
		lisRegle: 'figuresRectilignes-DemiDroiteFin'
		si:
			'sorteDeDroite ?d ?x ?y
DrGRay2ptsItem ?d ?or ?extr'
		alors: 'fin ?d ?extr'
		com:
			'Le deuxième des parents d''une sorte de droite est son extrémité'.
	e
		lisRegle: 'figuresRectilignes-Fin'
		si:
			'sorteDeDroite ?d ?x ?y
DrGSegment2ptsItem ?d ?or ?extr'
		alors: 'fin ?d ?extr'
		com:
			'Le deuxième des parents d''une sorte de droite est est sa fin'.
			
				e
		lisRegle: 'figuresRectilignes-Extrémité'
		si:
			'sorteDeDroite ?d ?x ?y
DrGSegment2ptsItem ?d ?or ?extr'
		alors: 'extrémité ?d ?extr'
		com:
			'Le deuxième des parents d''une sorte de droite est est sa fin'.
			
			
						e
		lisRegle: 'figuresRectilignes-Extrémités'
		si:
			'origine ?x ?or
extrémité ?x ?extr'
		alors: 'extrémités ?x [ ?or ?extr ]'
		com:
			'Les parents d''une sorte de droite sont ses extrémités'."

	e
		lisRegle: 'figuresRectilignes-AlignementPoints'
		si:
			'point ?x
point ?y
point ?z
different:de: ?x ?y
different:de: ?y ?z
different:de: ?x ?z
aireTriangle:avec:avec:rep: ?x ?y ?z ?res
égal:à: ?res 0
ordonneMot:et:rep1:rep2: ?y ?z ?y ?z
point:entre:et: ?x ?y ?z'
		alors: 'alignement  [ ?y ?x ?z ]'
		com:
			'Si l''aire du triangle formé par trois points est nulle, les points sont alignés'.
	e
		lisRegle: 'figuresRectilignes-Milieu'
		si: 'milieu  [ ?x ?y ] ?m'
		alors: 'alignement [ ?x ?m ?y ]'
		com: 'Le milieu d''un couple est aligné avec les extrémités.'.
	e
		lisRegle: 'figuresRectilignes-bissectrice-def'
		si: 'bissectrice ?m [ ] ?x1 ?x2 ?x3 ] '
		alors: 'bissectrice ?m'.
	"	e
		lisRegle: 'figuresRectilignes-bissectrice-def2'
		si:
			'médiatrice ?m  [ ?x1 ?x2 ]
pointSur  ?m  ?o'
		alors: 'bissectrice  ?m [ ?x1 ?o ?x2 ]'
		com:
			'Un point sur la médiatrice d''un segment (ou de deux points) est le sommet d''un angle formé avec les extrémités du segment (ou des deux points), la médiatrice du segment est aussi la bissectrice de cet angle.'."
	e
		lisRegle: 'figuresRectilignes-médiatriceConstruction'
		si:
			'cercle ?c1 [ centre: ?a ]
cercle ?c2 [ centre: ?b ]
cercle ?c1 [  rayon: [  ?a ?b ] ]
cercle ?c2 [  rayon: [  ?a ?b ] ]
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
intersection ?i2 ?ccc1  ?cc2
intersection ?i1 ?cc1  ?cc2
sorteDeDroite ?d ?i1 ?i2
different:de: ?i1 ?i2
different:de: ?c1 ?c2'
		alors: 'médiatrice ?d [ ?a ?b ]'
		com:
			'La médiatrice de deux points ou d''un segment est le lieu des points équidistants des extrémités du segment ou des deux points.'.
	e
		lisRegle: 'figuresRectilignes-médiatricePerpSegment'
		si:
			'perpendiculaire ?perp ?s ?p
segment ?s [ ?a ?b ]
milieu ?s  ?p'
		alors: 'médiatrice ?perp [ ?a ?b ]'.
	e
		lisRegle: 'figuresRectilignes-médiatricePerpSegmentPointSur'
		si:
			'médiatrice ?perp [ ?a ?b ]
milieu [  ?a ?b  ] ?mil'
		alors: 'pointSur ?perp ?mil'.
	e
		lisRegle: 'figuresRectilignes-médiatriceIsométrie'
		si:
			'médiatrice  ?x1  [ ?a ?b ]
pointSur ?x1 ?p
milieu ?x2 ?m
different:de: ?m ?p
relationCrée:et:nom: [  ?a ?p ] [  ?b  ?p  ]  isométrique'
		alors: 'relationCréée [  ?a ?p ] [  ?b ?p ]  isométrique'
		com:
			'Un point sur la  médiatrice d''un segment est à égale distance des extrémités de ce segment ou du couple de ces extrémités.'.
	e
		lisRegle: 'figuresRectilignes-médiatricePerpRec'
		si:
			'médiatrice ?m ?s
ordonneMot:et:rep1:rep2: ?m ?s ?mm ?ss'
		alors: 'perpendiculaire ?mm ?ss'
		com:
			'La médiatrice  d''un segment ou de deux points est prependiculaire à ce segment ou ces deux points ou à la droite qui relie les deux points.'.
	e
		lisRegle: 'figuresRectilignes-médiatrices3Points1'
		si:
			'intersection ?i ?m1 ?m2
médiatrice  ?m1 ?x1
médiatrice  ?m2 ?x2
médiatrice  ?m3 ?x3
different:de: ?m3 ?m1
different:de: ?m3 ?m2'
		alors: 'intersection ?i ?m1 ?m3'
		com:
			'L''intersection des médiatrices de deux points implique l''intersection de ces médairices avec la médiatrice d''un de ces points et le troizième point'.
	e
		lisRegle: 'figuresRectilignes-médiatrices3Points2'
		si:
			'intersection ?i ?m1 ?m2
médiatrice  ?m1 ?x1
médiatrice  ?m2 ?x2
médiatrice  ?m3 ?x3
different:de: ?m3 ?m1
different:de: ?m3 ?m2'
		alors: 'intersection ?i ?m1 ?m3'
		com:
			'L''intersection des médiatrices de deux points implique l''intersection de ces médairices avec la médiatrice d''un de ces points et le troizième point'.
	e
		lisRegle: 'figuresRectilignes-médiatrices3Points1PointSur'
		si:
			'intersection ?i ?m2 ?m1
médiatrice  ?m1 ?x1
médiatrice  ?m2 ?x2
médiatrice  ?m3 [ ?y1 ?y2 ]
milieu  [ ?y1 ?y2 ] ?mil 
different:de: ?m3   ?m1
different:de: ?m3 ?m2'
		alors: 'pointSur  ?m3  ?mil'
		com:
			'L''intersection des médiatrices de deux points implique que  le  milieu des points définissant la médiatrice soit sur la médiatrice.'.
	e
		lisRegle: 'figuresRectilignes-médiatrices3Points2PointSur'
		si:
			'intersection ?i ?m2 ?m1
médiatrice  ?m1 ?x1
médiatrice  ?m2 ?x2
médiatrice  ?m3 [ ?y1 ?y2 ]
milieu  [ ?y1 ?y2 ] ?mil 
different:de: ?m3   ?m1
different:de: ?m3 ?m2'
		alors: 'pointSur ?m3 ?mil'
		com:
			'L''intersection des médiatrices de deux points implique que  le  milieu des points définissant la médiatrice soit sur la médiatrice.'.
	e
		lisRegle: 'figuresRectilignes-pointSurMédiatriceMilieu'
		si:
			'médiatrice ?m  [ ?p1 ?p2 ]
milieu ?mil ?p1 ?p2'
		alors: 'pointSur ?m  ?mil'
		com:
			'Le  milieu des points définissant une médiatrice est sur la médiatrice.'.
	"triangles"
	e
		lisRegle: 'figuresRectilignes-trianglePlat0'
		si:
			'alignement [ ?a ?b ?c ]
créeNom:rep:   [ ?a ?b ?c ] ?t'
		alors: 'triangle ?t [ plat ]'.
	e
		lisRegle: 'figuresRectilignes-triangleNonPlat'
		si:
			'triangle ?x [ sommets: [ ?a ?b ?c ] ]
aireTriangle:avec:avec:rep: ?a ?b ?c ?aire
abs:rep: ?aire     ?absaire
supérieur:à:   ?absaire 0'
		alors: 'triangle ?x [ non_plat ]'
		com: 'On élimine les triangles plats'.
	e
		lisRegle: 'figuresRectilignes-triangleNonPlatSommetA'
		si:
			'triangle ?x [ non_plat ]
triangle ?x [ sommets: [ ?a ?b ?c ] ]'
		alors: 'triangle ?x [ sommet: [ ?a  angle: [ ?b ?a ?c ] ]'
		com: 'Un sommet du triangle et son angle'.
	e
		lisRegle: 'figuresRectilignes-triangleNonPlatSommetB'
		si:
			'triangle ?x [ non_plat ]
triangle ?x [ sommets: [ ?a ?b ?c ] ]'
		alors: 'triangle ?x [ sommet: [ ?b angle: [  ?c ?b  ?a ] ]'
		com: 'Un sommet du triangle et son angle'.
	e
		lisRegle: 'figuresRectilignes-triangleNonPlatSommetC'
		si:
			'triangle ?x [ non_plat ]
triangle ?x [ sommets: [ ?a ?b ?c ] ]'
		alors: 'triangle ?x [ sommet: [ ?c angle: [   ?b ?c  ?a ] ]'
		com: 'Un sommet du triangle et son angle'.
	e
		lisRegle: 'figuresRectilignes-TriangleAnglesEquivalents'
		si:
			'triangle ?t [ sommets: ?som ]
angle0 [ ?x ?s ?y  ]
point ?s
point ?x1
point ?y1
contient:el: ?som ?s
contient:el: ?som ?x1
contient:el: ?som ?y1
different:de:  [ ?x1 ?s ?y1 ]  [  ?x ?s ?y  ] 
relation:et:nom:   [ ?x1 ?s ?y1 ]  [  ?x ?s ?y  ] équivalent'
		alors: 'triangle ?t [ angle: [  [ ?x1 ?s ?y1 ] équivalent [  ?x ?s ?y  ] ]'
		com: 'Angle au sommet d''un triangle'.
	e
		lisRegle: 'figuresRectilignes-AireTriangle0'
		si:
			'triangle ?t [ hauteur: ?h ]
triangle ?t [ sommets: ?som ]
premier:rep: ?h ?pr
enleverDe:el:rep: ?som ?pr ?res
point ?x1
point ?x2
mesure [ ?x1 ?x2 ] ?mBase donnée
contient:el:  ?res ?x1
contient:el:  ?res ?x2
mesure ?h ?mh donnée
produit:et:rep: ?mh ?mBase ?prod
quotient:et:rep: ?prod 2 ?aire0
~ mesure [ aire0 triangle ?t ] ?aire déduite'
		alors: 'mesure [ aire0 triangle ?t ] ?aire0 déduite'
		com: 'aire triangle = base x hauteur / 2'.
	e
		lisRegle: 'figuresRectilignes-AireTriangle0Inverse1'
		si:
			'triangle ?t [ hauteur: ?h ]
mesure [ aire0 triangle ?t  ] ?aire 
triangle ?t [ sommets: ?som ]
premier:rep: ?h ?pr
enleverDe:el:rep: ?som ?pr ?res
point ?x1
point ?x2
mesure [ ?x1 ?x2 ] ?mBase donnée
contient:el:  ?res ?x1
contient:el:  ?res ?x2
produit:et:rep: ?aire 2 ?prod
quotient:et:rep: ?prod ?mBase ?mh
~ mesure ?h ?m donnée'
		alors: 'mesure  ?h  ?mh déduite'
		com: 'hauteur triangle = (aire x 2  )/ base '.
	e
		lisRegle: 'figuresRectilignes-AireTriangle0Inverse2'
		si:
			'triangle ?t [ hauteur: [ ?pr1 ?dr1 ] ]
triangle ?t [ hauteur: [ ?pr2 ?dr2 ] ]
mesure [ aire0 triangle ?t  ] ?aire 
triangle ?t [ sommets: ?som ]
mesure  [ ?pr2 ?dr2 ] ?mh2 donnée
enleverDe:el:rep: ?som ?pr1 ?res1
enleverDe:el:rep: ?som ?pr2 ?res2
mesure [ ?x1 ?x2 ] ?mBase donnée
point ?x1
point ?x2
contient:el: ?res1 ?x1
contient:el: ?res1 ?x2
produit:et:rep:  ?aire 2 ?prod
quotient:et:rep: ?prod ?mh2 ?mbs2
segment ?s [ ?x3 ?x4 ]
point ?x3
point ?x4
contient:el: ?res2 ?x3
contient:el: ?res2 ?x4
different:de:  [ ?pr1 ?dr1 ]  [ ?pr2 ?dr2 ]
~ mesure  [ ?x3 ?x4 ] ?mbs2 donnée'
		alors: 'mesure  [ ?x3 ?x4 ] ?mbs2 déduite'
		com: 'Base = (aire x 2  )/hauteur '.
	e
		lisRegle: 'figuresRectilignes-AireTriangle'
		si:
			'mesure [ aire0 triangle ?t  ] ?aire0
arrondis:rep: ?aire0 ?aire'
		alors: 'triangle ?t [ aire: ?aire ] '
		com:
			'aire calculée à  partir d''une hauteur du triangle et de la base correspondante. Aire triangle = base x hauteur / 2'.
	e
		lisRegle: 'figuresRectilignes-AngleObtusHauteurs'
		si:
			'triangle  ?x1  [ hauteur: ?x2 ]
triangle ?x1 [ sommets: ?som ]
coupleSur ?d ?x2 
position Après I ?s ?d
contient:el: ?som ?s'
		alors: 'triangle ?x1 [ angle_obtus: [ sommet: ?s ] ]'
		com:
			'Si l''intersection des hauteurs est sur la hauteur issue du sommet et après ce sommet hors du triangle, l''angle à ce sommet est obtus.'.
	e
		lisRegle: 'figuresRectilignes-AngleObtusMédiatrices'
		si:
			'médiatrice  ?x1 [ ?x2 ?x3 ]
position Avant  ?pt O ?x1
triangle ?t [ sommets: ?som ]
enleverDe:el:rep: ?som ?x2 ?res
enleverDe:el:rep:  ?res ?x3 ?s'
		alors: 'triangle ?x1 [ angle_obtus: [ sommet: ?s ] ]'
		com:
			'Si l''intersection des médiatrices est après l''intersection d''une médatrice avec un côté d''un triangle, l''angle à ce sommet est obtus.'.

	"	e
		lisRegle: 'figuresRectilignes-PérimètreTriangle'
		si:
			'triangle ?t [ côtés: [ [ ?x1 ?y1 ] [ ?x2 ?y2 ] [ ?x3 ?y3 ] ] ]
mesure [ ?x1 ?y1 ] ?m1
mesure  [ ?x2 ?y2 ] ?m2
mesure  [ ?x3 ?y3 ]  ?m3
somme:rep: [  ?m1 ?m2 ?m3 ] ?per'
		alors: 'triangle ?t [ périmètre: ?per ]'
		com: 'périmètre = somme des mesures des côtés.'.
	e
		lisRegle: 'figuresRectilignes-PérimètreTriangleMesureCôté'
		si:
			'triangle ?t [  côtés: ?cot
triangle ?t [ périmètre: ?per ]
point ?p1
point ?p2
enleverDe:el: [  ?p1 ?p2 ] ?diffCot
mesure [  ?p1 ?p2 ] ?m12
différence:et:rep: ?per ?m12 ?diff'
		alors: 'triangle ?t [ mesure: [  somme ?diffcot ] ?diff ]'
		com: 'périmètre  moins un côté = somme des mesures des dux autres côtés.'."
	e
		lisRegle: 'figuresRectilignes-triangleAngleExtérieur1'
		si:
			'triangle ?t [ isocèle: [ sommet: ?s  angles:  [ ?p1 ?p2  ?s ]   ?ang ] ]
angle [ ?p1 ?s ?p2 ] [ supplémentaire: ?sup ]'
		alors:
			'triangle ?t [ angleExtérieur: [ [ mesure  ?sup ] = somme [ mesure [ ?p1 ?p2  ?s ] ]  [ mesure  ?ang ] ]  ]'
		com:
			'La mesure de l''angle extérieur à un sommet d''un triangle est égal à la somme des mesures des angles aux deux autres sommets'.
	e
		lisRegle: 'figuresRectilignes-triangleAngleExtérieur2'
		si:
			'triangle ?t [ isocèle: [ sommet: ?s  angles:  [ ?p1 ?p2  ?s ]   ?ang ] ]
angle [ ?p2 ?s ?p1 ] [ supplémentaire: ?sup ] ]'
		alors:
			'triangle ?t [ angleExtérieur: [ [ mesure  ?sup  ] = somme [ mesure [ ?p1 ?p2  ?s ] ]  [ mesure  ?ang ] ]  ]'
		com:
			'La mesure de l''angle extérieur à un sommet d''un triangle est égal à la somme des mesures des angles aux deux autres sommets'.
	e
		lisRegle: 'figuresRectilignes-triangleAngleIsométriques'
		si:
			'triangle ?t [ isocèle: [ sommet: ?s angles: ?a1 ?a2 ] ]
relationCrée:et:nom: ?a1 ?a2 isométrique'
		alors: 'relationCréée  ?a1 ?a2 isométrique'
		com: 'Angles isométriques d''un triangle isocèles'.
	"		lisRegle: 'figuresRectilignes-triangleAngleExtérieur2'
		si:
			'angle [ ?p1 ?p2 ?p3 ] [ supplémentaire: ?a ]
triangle ?t [ sommets: ?som ]
contient:el: ?som ?p1
contient:el: ?som ?p2
contient:el: ?som ?p3'
		alors:
			'somme [ mesure  [  ?p2 ?p3 ?p1 ] ]  [ mesure   [  ?p3 ?p1 ?p2 ] ]  ?a'
		com:
			'La mesure de l''angle extérieur à un sommet d''un triangle est égal à la somme des mesures des angles aux deux autres sommets'."
	e
		lisRegle: 'figuresRectilignes-trianglesommeMesureAngleExtérieur'
		si:
			'triangle ?t [ angleExtérieur: [ [ mesure  ?sup ] = somme [ mesure [ ?p1 ?p2  ?s ] ]  [ mesure  ?ang ] ]  ]'
		alors:
			'somme [ mesure  [   ?p1 ?p2  ?s ] ]  [ mesure  ?ang ] [ mesure ?sup ]'
		com:
			'La mesure de l''angle extérieur à un sommet d''un triangle est égal à la somme des mesures des angles aux deux autres sommets'.
	"	e
		lisRegle: 'figuresRectilignes-triangleAngleExtérieur1'
		si:
			'triangle ?t [ angleExtérieur: [ [ mesure  ?a ] = somme [ mesure  [  ?p2 ?p3 ?p1 ] ]  [ mesure   [  ?p3 ?p1 ?p2 ] ] ]  ]'
		alors:
			'somme [ mesure  [  ?p2 ?p3 ?p1 ] ]  [ mesure   [  ?p3 ?p1 ?p2 ] ]  [ double mesure  [  ?p2 ?p3 ?p1 ] ]'
		com: ''.
	e
		lisRegle: 'figuresRectilignes-triangleAngleExtérieur3'
		si:
			'triangle ?t [ angleExtérieur: [ [ mesure  ?a ] = somme [ mesure  [  ?p2 ?p3 ?p1 ] ]  [ mesure   [  ?p3 ?p1 ?p2 ] ] ]  ]'
		alors:
			'somme [ mesure  [  ?p2 ?p3 ?p1 ] ]  [ mesure   [  ?p3 ?p1 ?p2 ] ]  [ double mesure  [  ?p3  ?p1 ?p2 ] ]'
		com: ''.
	e
		lisRegle: 'figuresRectilignes-triangleAngledouble'
		si:
			'triangle  ?x1 [ angleExtérieur: [  [ mesure  ?a  ] = somme  [ mesure  ?x3 ]  [ mesure  ?x4  ]  ]  ]  ]
triangle  ?x1 [ anglesIsométriques:  ?x3 ?x4 ]'
		alors:
			'triangle ?t    [ angleDouble:   [ [ mesure  ?a  ] = double  [ mesure  ?x3 ] ] ]'
		com:
			'Pour un triangle isocèle la somme des angles isométriques est le double d''un des angles'.
"
	e
		lisRegle: 'figuresRectilignes-triangleIsocèleMesureAnglesisométriqueOk1'
		si:
			'triangle  ?t [ isocèle:  [ sommet: ?s angles: ?ang1 ?ang2 ] ]
relationCrée:et:nom:  ?ang1 ?ang2 isométrique'
		alors: 'relationCréée   ?ang1 ?ang2 isométrique'
		com:
			'Pour un triangle isocèle les angles autres que celui à l''intersection des côtés isométriques sont isométriques'.

	"	e
		lisRegle: 'figuresRectilignes-triangleIsocèleAngles1'
		si:
			'triangle ?t [  sommets: [ ?a  ?b ?c  ]
relation:et:nom: [ ?b  ?a  ?c  ] [  ?a ?c  ?b  ] isométrique'
		alors:
			' triangle  ?t [ isocèle: [ sommet: ?b  angles:  [ ?b  ?a  ?c  ] [  ?a ?c  ?b   ] ] ]'
		com: 'Angles isométriques d'' un triagle isocèle'.
	e
		lisRegle: 'figuresRectilignes-triangleIsocèleAngles2'
		si:
			'triangle ?t [  sommets: [ ?a  ?b   ?c  ]
relation:et:nom: [  ?a ?c ?b   ] [ ?c ?b ?a  ]  isométrique'
		alors:
			'triangle  ?t [ isocèle: [ sommet: ?a   angles:  [ ?a  ?c ?b  ] [ ?c  ?b ?a ]  ]  ]'
		com: 'Angles isométriques d'' un triangle isocèle'.
	e
		lisRegle: 'figuresRectilignes-triangleIsocèleAngles3'
		si:
			'triangle ?t [  sommets: [ ?a   ?b  ?c ]  ]
relation:et:nom: [ ?c ?b  ?a   ] [   ?b ?a  ?c   ]  isométrique'
		alors:
			'triangle  ?t [ isocèle: [ sommet: ?c  angles:   [ ?c ?b  ?a   ] [ ?b  ?a  ?c  ] ] ]'
		com: 'Angles isométriques d'' un triangle isocèle'."
	e
		lisRegle: 'figuresRectilignes-triangleIsocèleMesureAnglesisométriqueSommet1'
		si:
			'mesure ?x3
mesure ?x4
relation:et:nom: [  mesure ?x3 ] [ mesure ?x4 ] isométrique'
		alors: 'somme [  mesure ?x3 ] [ mesure ?x4 ] [ double  mesure ?x4 ]'
		com:
			'Si deux angles ont  des mesures isométriques, leur somme est le double de l''une d''eux.'.
	e
		lisRegle: 'figuresRectilignes-triangleIsocèleMesureAnglesisométriqueSomme2'
		si:
			'mesure ?x3
mesure ?x4
relation:et:nom: [  mesure ?x3 ] [ mesure ?x4 ] isométrique'
		alors: ' somme [  mesure ?x3 ] [ mesure ?x4 ] [ double  mesure ?x3 ]'
		com:
			'Si deux angles ont  des mesures isométriques, la somme de leurs mesures est le double de l''une des mesures'.
	e
		lisRegle: 'figuresRectilignes-PointSurmédiatrice1'
		si:
			'segment ?s [ ?c ?b ]
médiatrice ?m ?s
pointSur ?m ?pt
segment ?s1 [ ?b ?pt ]
segment ?s2 [ ?c ?pt ]
relationCrée:et:nom: ?s1 ?s2 '
		alors: 'relationCréée  ?s1 ?s2 isométrique'
		com:
			'Soit m la médiatrice d''un segment s et P un point sur cette médiatrice, les segments reliant P aux extrémités de s sont isométriques.'.
	e
		lisRegle: 'figuresRectilignes-triangleisocèle1'
		si:
			'triangle ?t [ côtés: [ [ ?a ?b ] [ ?b ?c ]  [ ?a ?c ] ]
triangle ?t [  orientation: gauche ]
relation:et:nom: [ ?a ?b ] [ ?b ?c ] isométrique'
		alors:
			'triangle ?t [ isocèle:  [ sommet:  ?b angles: [ ?b  ?a ?c ] [ ?a ?c ?b ] ] ]'
		com:
			'Un triangle qui a 2 côtés isométriques est isocèle du sommet  à l''intersection de ces côtés, les angles autres que le sommet sont isométriques.'.
	e
		lisRegle: 'figuresRectilignes-triangleisocèle2'
		si:
			'triangle ?t [ côtés: [ [ ?a ?b ] [ ?b ?c ]  [ ?a ?c ] ]
triangle ?t [ orientation: gauche ]
relation:et:nom: [ ?a ?c ]  [ ?b  ?c ] isométrique'
		alors:
			'triangle ?t [ isocèle:  [ sommet:  ?c angles: [ ?b ?a ?c ] [ ?c ?b ?a  ]  ] ]'
		com:
			'Un triangle qui a 2 côtés isométriques est isocèle du sommet  à l''intersection de ces côtés, les angles autres que le sommet sont isométriques.'.
	e
		lisRegle: 'figuresRectilignes-triangleisocèle3'
		si:
			'triangle ?t [ côtés: [ [ ?a ?b ] [ ?b ?c ]  [ ?a ?c ] ]
relation:et:nom:  [ ?a ?c ]  [ ?a ?b ]  isométrique'
		alors:
			'triangle ?t [ isocèle:  [ sommet:  ?a angles: [ ?c ?b ?a ] [  ?a ?c ?b  ] ] ]'
		com:
			'Un triangle qui a 2 côtés isométriques est isocèle du sommet  à l''intersection de ces côtés, les angles autres que le sommet sont isométriques.'.

	"	e
		lisRegle: 'figuresRectilignes-triangleisocèle'
		si:
			'triangle ?t [ sommets: ?som ]
			
segment ?s1 [ ?x ?y ]
segment ?s2 [ ?x2 ?y2 ]
intersection ?s ?s1 ?s2
isométrique [ ?a ?b ] [ ?c ?d ]
contient:el:  [ ?x ?y ] ?a
contient:el:  [ ?x ?y ] ?b
contient:el:  [ ?x2 ?y2 ] ?c
contient:el:  [ ?x2 ?y2 ] ?d
contient:el: ?som ?a
contient:el: ?som ?b
contient:el: ?som ?c 
contient:el: ?som ?d
enleverDe:el:rep: ?som ?s ?ang
premier:rep: ?ang ?p1
dernier:rep: ?ang ?p2'
		alors:
			'triangle ?t [ isocèle: [ sommet: ?s  ]'
		com:
			'Un triangle qui a deux côtés isométriques est isocèle, de sommet à l''intersection des côtés isométriques.'."
	"	e
		lisRegle: 'figuresRectilignes-triangleisocèleAnglesIsométriques2a'
		si: 'triangle ?x1 [ anglesIsométriques:  [  ?x2  ?a ?b ] [  ?a ?b ?x2 ] ]'
		alors:
			'somme  [  mesure [  ?x2  ?a ?b ] ] [ mesure [  ?a ?b ?x2 ] ] [ double mesure [  ?x2  ?a ?b ] ]'
		com:
			'Si un triangle  est isocèle en un sommet les deux autres angles sont isométriques et leur somme est le double d''un des angles'.
	e
		lisRegle: 'figuresRectilignes-triangleisocèleAnglesIsométriques2b'
		si: 'triangle ?x1 [ anglesIsométriques:  [  ?x2  ?a ?b ] [  ?a ?b ?x2 ] ]'
		alors:
			'somme  [  mesure [  ?x2  ?a ?b ] ] [ mesure [  ?a ?b ?x2 ] ] [ double mesure [  ?a ?b ?x2 ] ]'
		com:
			'Si un triangle  est isocèle en un sommet les deux autres angles sont isométriqueset leur somme est le double d''un des angles'.
"
	e
		lisRegle: 'figuresRectilignes-triangleisocèleCôtéOpposé1'
		si:
			'triangle ?t [ anglesIsométriques:  [  ?x2  ?a ?b ] [  ?a ?b ?x2 ] ]
segment ?s [ ?a ?b ]'
		alors: 'triangle ?t [ segmentOpposé: ?s ] ]'
		com: 'Le segment opposé au sommet du triangle isocèle'.
	e
		lisRegle: 'figuresRectilignes-triangleisocèleCôtéOpposé2'
		si:
			'triangle ?t [ anglesIsométriques:  [  ?x2  ?a ?b ] [  ?a ?b ?x2 ] ]
segment ?s [ ?b ?a ]'
		alors: 'triangle ?t [ segmentOpposé: ?s ] ]'
		com: 'Le segment opposé au sommet du triangle isocèle'.
	e
		lisRegle: 'figuresRectilignes-triangleRectangle1'
		si:
			'triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
triangle ?t [  sommets: [  ?a ?b ?c ] ]
perpendiculaire ?s1 ?s3'
		alors: 'triangle ?t   [ rectangle: [ sommet: ?a côtés: ?s1 ?s3 ] ]'
		com:
			'Un triangle qui a deux côtés perpendiculaires est rectangle au point d''intersection de ces côtés'.
	e
		lisRegle: 'figuresRectilignes-triangleRectangle2'
		si:
			'triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
triangle ?t [  sommets: [  ?a ?b ?c ] ]
perpendiculaire ?s1 ?s2'
		alors: 'triangle ?t   [ rectangle: [ sommet: ?b côtés: ?s1 ?s2 ] ]'
		com:
			'Un triangle qui a deux côtés perpendiculaires est rectangle au point d''intersection de ces côtés'.
	e
		lisRegle: 'figuresRectilignes-triangleRectangle3'
		si:
			'triangle ?t [  sommets: [  ?a ?b ?c ] ]
triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ]           
perpendiculaire ?s2 ?s3'
		alors: 'triangle ?t   [ rectangle: [ sommet: ?c côtés: ?s2 ?s3 ] ]'
		com:
			'Un triangle qui a deux côtés perpendiculaires est rectangle au point d''intersection de ces côtés'.
	e
		lisRegle: 'figuresRectilignes-trianglesRectanglesIsométriques'
		si:
			'triangle ?t1  [ rectangle: [ sommet:  ?p1 ]
adjacent ?s1 ?s2 ?x ?p1 ?y
adjacent ?ss1 ?ss2 ?xx ?p2 ?yy
triangle ?t2  [ rectangle: [ sommet:  ?p2 ]
different:de: ?t1 ?t2
relation:et:nom:  ?s1 ?ss1 isométrique
relation:et:nom: ?s2 ?ss2 isométrique
relationCrée:et:nom: ?t1 ?t2 isométrique'
		alors: 'relationCréée  ?t1 ?t2 isométrique'
		com:
			'Deux triangles rectangle avec les côtés issus de l''angle droit respectivement isométriques sont isométriqueq'.
	e
		lisRegle: 'figuresRectilignes-trianglesIsométrique'
		si:
			'triangle ?t1 [ côtés: [ ?c11 ?c12 ?c13 ] ]
triangle ?t2 [ côtés: [ ?c21 ?c22 ?c23 ] ]
relation:et:nom: ?c11 ?c23 isométrique
relation:et:nom: ?c12 ?c21 isométrique
relation:et:nom: ?c13 ?c22 isométrique
different:de: ?t1 ?t2
'
		alors: 'isométrique ?t1 ?t2'
		com:
			'Deux triangles ayant respectivement leus côtés isométriques sont isométrique'.
	e
		lisRegle: 'figuresRectilignes-triangleEquilatéral'
		si:
			'triangle ?t [  isocèle: [ sommet: ?s1 ] ]
triangle ?t [  isocèle: [ sommet: ?s2 ] ]
different:de: ?s1 ?s2
'
		alors: 'triangle ?t [ équilatéral ]'
		com: 'Si un triangle est isocèle en deux sommets, il est équilatéral.'.
	e
		lisRegle: 'figuresRectilignes-triangleEquilateral2'
		si:
			'triangle ?t  [  côtés: [ [ ?x1 ?y1 ] [ ?x2 ?y2 ] [ ?x3 ?y3 ]  ] ]
triangle ?t [ non_plat  ]
ordonneMot:et:rep1:rep2:   ?x1 ?y1  ?xx1 ?yy1 
ordonneMot:et:rep1:rep2:   ?x2 ?y2  ?xx2 ?yy2  
ordonneMot:et:rep1:rep2:   ?x3 ?y3  ?xx3 ?yy3  
relation:et:nom:  [ ?xx2 ?yy2 ] [ ?xx1 ?yy1 ]  isométrique
relation:et:nom:  [ ?xx3 ?yy3 ] [ ?xx1 ?yy1 ]  isométrique
'
		alors: 'triangle ?t [ équilatéral ]'
		com:
			'Un triangle qui a les trois côtés isométriques est un triangle équilatéral.'.
	"	e
		lisRegle: 'figuresRectilignes-Hauteurs1'
		si:
			'point ?x
triangle ?t [ côtés: ?cot ]
triangle ?t [ sommets: ?som ]
contient:el: ?som ?x
enleverDe:el:rep: ?som ?x [ ?x1 ?x2 ]
sorteDeDroite ?d ?x1 ?x2
perpendiculaire ?d ?haut 
ordonneMot:et:rep1:rep2: ?haut ?d ?hhaut ?dd
intersection ?i  ?hhaut ?dd'
		alors: 'triangle ?t [  hauteur: [ ?x ?i ]  ]'.
	e
		lisRegle: 'figuresRectilignes-Hauteurs2'
		si:
			' triangle ?t [ sommets: ?sommets  ]
intersection ?x  ?hhaut ?dd
pointSur ?s ?x 
segment ?s ?ss
enleverDe:el:rep: ?ss ?x ?som
contient:el: ?sommets ?som
ordonneMot:et:rep1:rep2: ?x ?som ?xx ?ssom'
		alors: 'triangle ?t [  hauteur: [ ?xx ?ssom ]  ]'."
	"	e
		lisRegle: 'figuresRectilignes-Hauteurs1'
		si:
			'point ?x
triangle ?t [ côtés: ?cot ]
triangle ?t [ sommets: ?som ]
contient:el: ?som ?x
enleverDe:el:rep: ?som ?x ?base
premier:rep: ?base ?bs2
dernier:rep: ?base ?bs1
perpendiculaire   [ ?bs1 ?bs2 ] ?haut
premier:rep: ?haut ?pr
égaux:et: ?x ?pr'
		alors: 'triangle ?t [  hauteur: ?haut ]'.
	e
		lisRegle: 'figuresRectilignes-Hauteur2'
		si:
			'triangle ?t [  sommets: ?som ]
perpendiculaire  ?x1 ?x2 ?x3
contient:el: ?som ?x3
intersection  ?i   ?x2 ?x1'
		alors: 'triangle ?t [  hauteur: [  ?i ?x3 ] ]'."
	e
		lisRegle: 'figuresRectilignes-MédianesTriangle1'
		si:
			'triangle ?t [ sommets: [ ?pt ?b ?c ] ]
triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
triangle ?t [ non_plat ]
milieu ?s2  ?m 
segment   ?med [ ?pt  ?m ]'
		alors: 'triangle ?t [ médiane: [ ?med ?pt ?m ] ]'
		com: 'Une médiane du triangle.'.
	e
		lisRegle: 'figuresRectilignes-MédianesTriangle2'
		si:
			'triangle ?t [ sommets: [ ?a ?pt ?c ] ]
triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
triangle ?t [ non_plat ]
milieu  ?s3 ?m 
segment   ?med [ ?pt  ?m ]'
		alors: 'triangle ?t [ médiane: [ ?med ?pt ?m ] ]'
		com: 'Une médiane du triangle.'.
	e
		lisRegle: 'figuresRectilignes-MédianesTriangle3'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?pt ] ]
triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
milieu  ?s1 ?m 
segment   ?med [ ?pt  ?m ]'
		alors: 'triangle ?t [ médiane: [ ?med ?pt ?m ] ]'
		com: 'Une médiane du triangle.'.

	"e lisRegle:  'figuresRectilignes-isoBarycentre'
si:  'triangle ?t [ médiane:  ?med1 ?pt1 ?m1 ]
triangle ?t [ médiane:  ?med2 ?pt2 ?m2 ]
different:de: ?med1 ?med2
intersection ?bary ?med1 ?med2
'
alors:  'triangle ?t [ isobarycentre: ?bary  ]'
com: 'L''isobarycentre d''un triangle est l''intersection de 2 médianes'.
"
	e
		lisRegle: 'figuresRectilignes-MédiatriceTriangle1'
		si:
			'triangle ?t [ côtés:  [ ?s1 ?s2 ?s3  ] ]
triangle ?t [ non_plat ] 
médiatrice  ?m ?s1'
		alors: 'triangle ?t [ médiatrice: [ ?m  ?s1 ] ]'
		com: 'Une  médiatrice du triangle.'.
	e
		lisRegle: 'figuresRectilignes-MédiatriceTriangle2'
		si:
			'triangle ?t [ côtés: [ ?s1 ?s2 ?s3  ] ]
triangle ?t [ non_plat ] 
médiatrice ?m  ?s2'
		alors: 'triangle ?t [ médiatrice: [ ?m  ?s2 ] ]'
		com: 'Une  médiatrice du triangle.'.
	e
		lisRegle: 'figuresRectilignes-MédiatriceTriangle3'
		si:
			'triangle ?t [ côtés: [ ?s1 ?s2 ?s3  ] ]
triangle ?t [ non_plat ]
médiatrice ?m ?s3'
		alors: 'triangle ?t [ médiatrice: [ ?m  ?s3 ] ]'
		com: 'Une  médiatrice du triangle.'.
	e
		lisRegle: 'figuresRectilignes-Médiatriceisocèle1'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
triangle ?t [ non_plat ]
médiatrice ?m  [ ?b ?c ] 
pointSur ?m ?a'
		alors: 'triangle ?t [ isocèle:  [ sommet: ?a ] ]'
		com:
			'Un triangle qui a un sommet sur la médiatrice de son côté opposé est isocèle.'.
	e
		lisRegle: 'figuresRectilignes-Médiatriceisocèle2'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
triangle ?t [ non_plat ]
médiatrice ?m  [ ?a ?c ] 
pointSur ?m ?b'
		alors: 'triangle ?t [ isocèle: [ sommet: ?b ] ]'
		com:
			'Un triangle qui a un sommet sur la médiatrice de son côté opposé est isocèle.'.
	e
		lisRegle: 'figuresRectilignes-Médiatriceisocèle3'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
triangle ?t [ non_plat ]
triangle ?t [  médiatrice: [ ?m  [ ?a ?b ] ] ]
pointSur ?m ?c'
		alors: 'triangle ?t [ isocèle: [ sommet: ?c ] ]'
		com:
			'Un triangle qui a un sommet sur la médiatrice de son côté opposé est isocèle.'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscrit1'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
cercle ?cer ?i ?xf
triangle ?t  [ médiatrice: [ ?m1  ?s1 ] ]
triangle ?t  [ médiatrice: [ ?m2 ?s2 ] ]
intersection ?i ?m1 ?m2'
		alors: 'triangle ?t [ cercleCirconscrit: ?cer ]'
		com: 'Cercle circonscrit à un triangle'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscrit2'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
cercle ?cer ?i ?x
triangle ?t [ médiatrice: ?m1 ?s1 ]
triangle ?t [ médiatrice: ?m2 ?s2 ]
intersection ?i ?m1 ?m2'
		alors: 'triangle ?t [ cercle circonscrit: ?cer ]'
		com: 'Cercle circonscrit à un triangle'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscrit3'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
cercle ?cer ?i ?c
triangle ?t  [ médiatrice: ?m1 ?s1 ]
triangle ?t  [ médiatrice: ?m2 ?s2 ]
intersection ?i ?m1 ?m2'
		alors: 'triangle ?t [ cercle circonscrit: ?cer ]'
		com: 'Cercle circonscrit à un triangle'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur1.1'
		si:
			'triangle ?t [ cercle circonscrit: ?cer ?i ?c ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?x'
		com: 'point sur cercle circonscrit'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur1.2'
		si:
			'triangle ?t [ cercle circonscrit: ?cer ?i ?c ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?b'
		com: 'point sur cercle circonscrit'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur2.1'
		si:
			'triangle ?t  [ cercle circonscrit: ?cer ?i ?a ]
triangle ?t [ sommets: [  ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?b'
		com: 'point sur cercle circonscrit'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur2.2'
		si:
			'triangle ?t [ cercle circonscrit: ?cer ?i ?a ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?c'
		com: 'point sur cercle circonscrit'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur3.1'
		si:
			'triangle ?t  [ cercle circonscrit: ?cer ?i ?b ]
triangle ?t [ sommets: [ ?a ?b ?c ] ['
		alors: 'pointSur ?cer ?a'
		com: 'point sur cercle circonscrit'.
	e
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur3.2'
		si:
			'triangle ?t [ cercle circonscrit: ?cer ?i ?b ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?c'
		com: ''.

	"	e
		lisRegle: 'figuresRectilignes-MédiatriceisocèleIsometrie1'
		si:
			'triangle ?t [ isocèle: [ sommet: ?c ] ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]
relationCrée:et:nom: [ ?c ?a ] [ ?c ?b ] isométrique'
		alors: 'relationCrée  [ ?c ?a ] [ ?a ?c] isométrique'
		com:
			'Définition d''un triangle isocèle.
Si un triangle est isocèle en un sommet, les couples reliant ce sommet à chacun des autres sommets sont isométriques.'.
	e
		lisRegle: 'figuresRectilignes-MédiatriceisocèleIsometrie2'
		si:
			'triangle ?t [ isocèle: [ sommet: ?a ] ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]
relationCrée:et:nom: [ ?c ?a ] [ ?a ?b ] isométrique'
		alors: 'relationCrée  [ ?c ?a ] [ ?a ?b ] isométrique'
		com:
			'Définition d''un triangle isocèle.
Si un triangle est isocèle en un sommet, les couples reliant ce sommet à chacun des autres sommets sont isométriques.'.
	e
		lisRegle: 'figuresRectilignes-MédiatriceisocèleIsometrie3'
		si:
			'triangle ?t [ isocèle: [   sommet: ?b ] ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]
relationCrée:et:nom: [ ?c ?b ] [ ?a ?b ] isométrique'
		alors: 'relationCrée  [ ?c ?b ] [ ?a ?b ] isométrique'
		com:
			'Définition d''un triangle isocèle.
Si un triangle est isocèle en un sommet, les couples reliant ce sommet à chacun des autres sommets sont isométriques.'."

	ExpertRegle figuresRectilignesuite: e! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 9/11/2025 20:53:34'!
figuresRectilignesSuite2: e


	e
		lisRegle: 'figuresRectilignes-bissectriceTriangle1'
		si:
			' triangle ?t [ sommets: [ ?a ?b ?c ] ]
bissectrice  ?x1 [ ?y ?a ?z ]'
		alors: ' triangle ?t [ bissectrice: [ ?x1  sommet: ?a ] ]'
		com: 'Bissectrice de l''angle à un sommet.'.
	e
		lisRegle: 'figuresRectilignes-bissectriceTriangle2'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
bissectrice  ?x1 [ ?y ?b ?z ]'
		alors: ' triangle ?t [ bissectrice: [ ?x1 sommet: ?b ] ]'
		com: 'Bissectrice de l''angle à un sommet.'.
	e
		lisRegle: 'figuresRectilignes-bissectriceTriangle3'
		si:
			'bissectrice  ?x1 [ ?x ?c ?y ]
 triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: ' triangle ?t [ bissectrice: [ ?x1 sommet: ?c ]  ]'
		com: 'Bissectrice de l''angle à un  sommet.'.
	e
		lisRegle: 'figuresRectilignes-bissectriceTriangle1b'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
bissectrice  ?bis ?b ?a ?c
'
		alors: ' triangle ?t [ bissectrice: [ ?bis sommet: ?a ] ]'
		com: 'Bissectrice de l''angle à un  sommet.'.
	e
		lisRegle: 'figuresRectilignes-bissectriceTriangle2b'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c ] ]
bissectrice  ?bis ?a ?c ?b
'
		alors: ' triangle ?t [ bissectrice: [ ?bis sommet: ?c ] ]'
		com: 'Bissectrice de l''angle à un  sommet.'.
	e
		lisRegle: 'figuresRectilignes-bissectriceTriangle3b'
		si:
			'triangle ?t [ sommets: [ ?a ?b ?c>>>] ]
bissectrice  ?bis ?c ?b ?a
'
		alors: ' triangle ?t [ bissectrice: [ ?bis sommet: ?b ]  ]'
		com: 'Bissectrice de l''angle à un  sommet.'.
	e
		lisRegle: 'figuresRectilignes-CercleInscrit'
		si:
			'triangle ?t [ non_plat ]
triangle ?t [ sommets: [  ?a ?b ?c] ]
bissectrice ?bis1
bissectrice ?bis2
intersection ?i ?bis1 ?bis2
cercle ?cc ?i ?p
ordonneMot:et:rep1:rep2: ?bis1 ?bis2 ?bbis1 ?bbis2'
		alors:
			'triangle ?t [ cercleInscrit: [ ?cc  centre:  ?i intersection: ?bbis1 ?bbis2 ] ]'
		com:
			'L''intersection des bissetrices d''un triangle est le centre du cercle inscrit dans un triangle'.
	e
		lisRegle: 'figuresRectilignes-sommeAngles2'
		si:
			'triangle ?t  [ sommets: [  ?A ?O ?S ] ]
cercle ?cer [ centre: ?O ]
droite ?d
ordonneMot:et:rep1:rep2: ?d ?cer ?dd ?ccer
intersection ?I ?dd ?ccer
angle0 [ ?A ?S ?O ]
angle0 [ ?O ?A ?S ]
different:de: ?I ?S'
		alors:
			'égal  [ somme  [ mesure [ ?A ?S ?O ]  ]  [ mesure    [ ?O ?A ?S  ] ]  ]   [ mesure [ ?A ?O ?I ]  ]'
		com:
			'La somme des mesures de  deux angles d''un triangle est égale à la mesure du supplémentaire du  troisième angle'.
	e
		lisRegle: 'figuresRectilignes-PolygoneRayons'
		si:
			'polygoneRégulier?p [  sommets: ?s ]
polygone ?p [  centre: ?c ]
point ?x
contient:el: ?s ?x
ordonneMot:et:rep1:rep2: ?c ?x ?cc ?xx'
		alors: 'polygone ?p [ rayon: [ ?cc ?xx  ] ]'
		com:
			'Un rayon de polygone relie un sommet au centre du polygone, c''est aussi un rayon du cercle circonscrit au polygone'.
	e
		lisRegle: 'figuresRectilignes-PolygoneNbcôtés'
		si: 'polygoneRégulier ?x1 [ nombre_de_sommets: ?x6 ] ]'
		alors: 'polygoneRégulier ?x1 [ nombre_de_côtés: ?x6 ] ]'
		com:
			'Un polygoneRégulier régulier: a un nombre de côtés égal au nombre de sommets'.
	e
		lisRegle: 'figuresRectilignes-PolygoneSommets'
		si: 'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6'
		alors: 'polygoneRégulier ?x1  [ sommets: ?x2 ] ]'
		com:
			'Les sommets d''un polygone régulier de n côtés, en vert le sommet qui définit le polygone, ajoute les sommets, si nécessaires'.
	e
		lisRegle: 'figuresRectilignes-Polygone3def'
		si: 'polygoneRégulier ?x1 [ nombre_de_côtés: 3 ] ]'
		alors: 'polygoneRégulier  ?x1 [  quadrilatère ]'
		com: 'Un polygone de 3sommets définit un triangle'.
	e
		lisRegle: 'figuresRectilignes-Polygone4def'
		si: 'polygoneRégulier ?x1 [ nombre_de_côtés: 4] ]'
		alors: 'polygoneRégulier  ?x1 [  quadrilatère ]'
		com: 'Un polygone de 4 sommets définit un quadrilatère'.
	e
		lisRegle: 'figuresRectilignes-PolygoneNomCôté<=100'
		si:
			'polygoneRégulier ?x1 [ nombre_de_côtés: ?nc ]
inférieurOuEgal:à: ?nc  100
nomPolygone:rep: ?nc ?res'
		alors: 'polygoneRégulier  ?x1 [ nom:   ?res ]'
		com: 'nomme un polygone de moins de cent côtés selon la nomenclatutre'.
	e
		lisRegle: 'figuresRectilignes-PolygoneNomGénéral'
		si: 'polygoneRégulier ?x1 [ nombre_de_côtés: ?nc ]'
		alors: 'polygoneRégulier  ?x1 [ PolygoneRégulier ]'
		com: 'nomme un polygone régulier'.
	e
		lisRegle: 'figuresRectilignes-PolygoneCréeDernierCôtés1'
		si:
			'créeCôtés ?c [ ?x ]
premier:rep: ?c ?p
premier:rep: ?p ?p1
addLast:el:rep: ?c  [ ?x ?p1 ] ?res
retireFait: créeCôtés ?c [ ?x ]'
		alors: 'créeCôtés ?res'
		com:
			'Crée le dernier côtés d''un polygone à partir de ses sommets reliant le dernier sommet au premier'.
	e
		lisRegle: 'figuresRectilignes-PolygoneCôtés'
		si: 'créeCôtés ?res'
		alors: 'polygoneRégulier ?x1  [ côtés: ?res ] ]'
		com: 'Les côtés d''un polygone régulier de n côtés.'.
	e
		lisRegle: 'figuresRectilignes-PolygoneCréeCôtés'
		si:
			'créeCôtés ?c ?som
retireFait: créeCôtés ?c ?som
premier:rep: ?som ?p
saufPremier:rep: ?som ?sp
premier:rep: ?sp ?p2
addLast:el:rep: ?c  [  ?p ?p2 ] ?res'
		alors: 'créeCôtés ?res ?sp'
		com: 'Crée les côtés d''un polygone à partir de ses sommets'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèrePérimètre'
		si: 'polygone Tetragone?q [ périmètre:  ?p ]'
		alors: 'quadrilatère ?q [  périmètre:  ?p ]'
		com: 'Le périmètre d''un quadrilatèe'.
	e
		lisRegle: 'figuresRectilignes-polygoneCréeCôté'
		si:
			'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6
premier:rep: ?x2 ?p
saufPremier:rep: ?x2 ?sp
premier:rep: ?sp ?p2'
		alors: 'créeCôtés [  [  ?p ?p2  ]  ] ?sp '.
	e
		lisRegle: 'figuresRectilignes-PolygoneCôtésDef'
		si:
			'créeCôtés  ?c ?x
polygoneRégulier ?p [  nombre_de_côtés: ?nc ]
taille:rep: ?c ?tc
égaux:et: ?nc ?tc
retireFait: créeCôtés  ?c ?x'
		alors: 'polygoneRégulier ?p [ côtés: ?c ]'
		com: 'Arrête la création des côtés d''un polygone à partir de ses sommets'.
	e
		lisRegle: 'figuresRectilignes-PolygoneAngleAuCentre'
		si:
			'polygoneRégulier ?p [  nombre_de_sommets: ?n ]
quotient:et:rep: 360 ?n ?angle'
		alors: 'polygoneRégulier ?p [ angle_au_centre: ?angle ]'
		com: 'L''angle au centre = 360 / nombre_de_côtés'.
	e
		lisRegle: 'figuresRectilignes-PolygoneAngleEntreCôtés'
		si:
			'polygoneRégulier ?p [ angle_au_centre: ?angle ]
difference:et:rep: 180 ?angle ?rep1'
		alors: 'polygoneRégulier ?p [ angle_entre_côtés: ?rep1 ]'
		com:
			'L''angle entre côtés  = 180 - angle_au_centre, somme des angles entre rayon et côté'.
	e
		lisRegle: 'figuresRectilignes-PolygoneAngleEntreRayonEtCôtés'
		si:
			'polygoneRégulier ?p [ angle_entre_côtés: ?angle ]
quotient:et:rep:  ?angle 2 ?rep1'
		alors: 'polygoneRégulier ?p  [ angle_entre_rayon_et_côté: ?rep1 ]'
		com: 'L''angle entre rayon et côtés  = moitié de angle_entre_côtés'.
	e
		lisRegle: 'figuresRectilignes-adjacent1'
		si:
			'segment ?s1 [ ?a ?b ]
segment ?s2 [ ?b ?c ]
different:de: ?a ?c'
		alors: 'adjacent ?s1 ?s2 ?a ?b ?c'
		com: 'Segment adjacents.'.
	"	e
		lisRegle: 'figuresRectilignes-adjacent2'
		si:
			'segment ?s1 [ ?a ?b ]
segment ?s2 [ ?c ?b ]
different:de: ?s1 ?s2
different:de: ?a ?c'
		alors: 'adjacent ?s1 ?s2 ?a ?b ?c'
		e
		lisRegle: 'figuresRectilignes-adjacent3'
		si:
			'segment ?s1 [ ?b ?a ]
segment ?s2 [ ?b ?c ]
different:de: ?a ?c'
		alors: 'adjacent ?s1 ?s2 ?a ?b ?c'.
	e
		lisRegle: 'figuresRectilignes-adjacent4'
		si:
			'segment ?s1 [ ?b ?a ]
segment ?s2 [ ?c ?b ]
different:de: ?s1 ?s2
different:de: ?a ?c'
		alors: 'adjacent ?s1 ?s2 ?a ?b ?c'	
	e
		lisRegle: 'figuresRectilignes-adjacentIntersection'
		si:
			'segment ?s1
segment ?s2
adjacent ?s1 ?s2 ?x ?y ?z'
		alors: 'intersection ?y  ?s1 ?s2' "
	e
		lisRegle: 'figuresRectilignes-AireHeron'
		si:
			'triangle ?x2 [ côtés: [ ?c1  ?c2 ?c3 ]
mesuresDe [ ?c1  ?c2 ?c3 ]   [ [ ] ]   ?per
quotient:et:rep: ?per 2 ?d
mesure ?c1 ?mc1
mesure ?c2 ?mc2
mesure ?c3 ?mc3
difference:et:rep: ?d ?mc1 ?diffmc1
difference:et:rep: ?d ?mc2 ?diffmc2
difference:et:rep: ?d ?mc3 ?diffmc3
produit:et:rep: ?d ?diffmc1 ?prod1
produit:et:rep: ?prod1 ?diffmc2 ?prod2
produit:et:rep: ?prod2 ?diffmc3 ?aire2
racineDecimal:rep: ?aire2 ?aire0
arrondis:rep:  ?aire0 ?aire'
		alors: 'mesure  [ aireHéron triangle ?x2 ] ?aire déduite'
		com:
			'Aire du triangle par la formule de Héron
demi périmètre P, côtés a b c , aire = racine  ( p (p-a)  (p-b) (p-c)  ).'.
	e
		lisRegle: 'figuresRectilignes-AireHéron'
		si:
			'mesure  [ aireHéron triangle ?x1 ] ?aire déduite
arrondis:rep:  ?aire ?aireArr.'
		alors: 'triangle ?x1 [ aireHéron: ?aireArr ]'
		com:
			'Aire du triangle par la formule de Héron
demi périmètre P, côtés a b c , aire = racine  ( p (p-a)  (p-b) (p-c)  ).'.
	e
		lisRegle: 'figuresRectilignes-HauteurHeron1'
		si:
			'mesure [ aireHéron triangle ?t ]  ?m
triangle ?t [ sommets: [  ?s1 ?s2 ?s3  ] 
enleverDe:el:rep:  [  ?s1 ?s2 ?s3  ]  ?s1 ?cot
mesure  ?cot ?mc1
produit:et:rep: ?m 2 ?2m
quotient:et:rep: ?2m ?mc1 ?mh 
mot:et:rep: H ?s1 ?nomH'
		alors: 'mesure [ hauteur [ ?s1 ?nomH ] ] ?mh déduite'
		com: 'Hauteur calculée partir de l''aire.'.
	e
		lisRegle: 'figuresRectilignes-HauteurHeron2'
		si:
			'mesure [ aireHéron triangle ?t ]  ?m
triangle ?t [ sommets: [  ?s1 ?s2 ?s3  ] 
enleverDe:el:rep:  [  ?s1 ?s2 ?s3  ]  ?s2 ?cot
mesure  ?cot ?mc1
produit:et:rep: ?m 2 ?2m
quotient:et:rep: ?2m ?mc1 ?mh 
mot:et:rep: H ?s2 ?nomH'
		alors: 'mesure [ hauteur [ ?s2 ?nomH ] ] ?mh déduite'
		com: 'Hauteur calculée partir de l''aire.'.
	e
		lisRegle: 'figuresRectilignes-HauteurHeron3'
		si:
			'mesure [ aireHéron triangle ?t ]  ?m
triangle ?t [ sommets: [  ?s1 ?s2 ?s3  ] 
enleverDe:el:rep:  [  ?s1 ?s2 ?s3  ]  ?s3 ?cot
mesure  ?cot ?mc1
produit:et:rep: ?m 2 ?2m
quotient:et:rep: ?2m ?mc1 ?mh 
mot:et:rep: H ?s3 ?nomH'
		alors: 'mesure [ hauteur [ ?s3 ?nomH ] ] ?mh déduite'
		com: 'Hauteur calculée partir de l''aire.'.
	e
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangleEn1'
		si:
			'quadrilatère  ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
perpendiculaire  ?c1 ?c2
point ?x
contient:el: ?c1 ?x
contient:el: ?c2 ?x'
		alors: 'quadrilatère ?x1q [ rectangleEn: ?x  ] '
		com:
			'Si deux côtés d'' un quadrilatère sont perpendiculaires, le quadrilatère est rectangle en l''intersection des côtés.'.
	e
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangleEn2'
		si:
			'quadrilatère  ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
perpendiculaire  ?c2 ?c3
point ?x
contient:el: ?c3 ?x
contient:el: ?c2 ?x'
		alors: 'quadrilatère ?x1 [ rectangleEn: ?x  ]'
		com:
			'Si deux côtés d''un quadrilatère sont perpendiculaires, le quadrilatère est rectangle en l''intersection des côtés.'.
	e
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangleEn3'
		si:
			'quadrilatère  ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
perpendiculaire  ?c3 ?c4
point ?x
contient:el: ?c3 ?x
contient:el: ?c4 ?x'
		alors: 'quadrilatère ?x1 [ rectangleEn: ?x ]'
		com:
			'Si deux côtés d'' un quadrilatère sont perpendiculaires, le quadrilatère est rectangle en l''intersection des côtés.'.
	e
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangleEn4'
		si:
			'quadrilatère  ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
perpendiculaire  ?c1 ?c4
point ?x
contient:el: ?c3 ?x
contient:el: ?c4 ?x'
		alors: 'quadrilatère ?x1 [ rectangleEn: ?x ]'
		com:
			'Si deux côtés d'' un quadrilatère sont perpendiculaires, le quadrilatère est rectangle en l''intersection des côtés.'.
	e
		lisRegle: 'figuresRectilignes-parallèlesAuxPerpendicuiaires'
		si:
			'perpendiculaire  ?x1 ?x2
segment ?x1 
segment ?x2 
segment ?x3 
segment ?x4 
relation:et:nom:  ?x3 ?x1 parallèle
relation:et:nom: ?x4 ?x2 parallèle'
		alors: 'perpendiculaire ?x3  ?x4'
		com:
			'Si des segments sont  perpendiculaires et respectivement parallèles à un autre segment, ces segments sont perpendiculaires.'! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 5/3/2024 02:31'!
figuresRectilignesuite: e
	e
		lisRegle: 'figuresRectilignes-sommeAngles1'
		si:
			'triangle ?t  [ sommets: [  ?B ?O ?S ] ]
cercle ?cer [ centre: ?O ]
droite ?d
ordonneMot:et:rep1:rep2: ?d ?cer ?dd ?ccer
intersection ?I ?dd ?ccer
angle0 [ ?S ?B ?O ]
angle0 [ ?O ?S ?B ]
different:de: ?I ?S'
		alors:
			'égal  [ somme  [ mesure  [ ?O ?S ?B ]  ]  [ mesure  [ ?S ?B ?O ]  ]  ]   [ mesure [ ?I ?O  ?B ]   ]'
		com:
			'La somme des mesures de  deux angles d''un triangle est égale à la mesure du supplémentaire du  troisième angle'.
	"quadrilatère"
	e
		lisRegle: 'figuresRectilignes-quadrilatèrediagonale1'
		si: 'quadrilatère ?l [ sommets: [ ?a ?b ?c ?d ] ]'
		alors: 'quadrilatère ?l [  diagonale: [ ?a ?c  ] ]'
		com: 'diagonale reliant le premier au troisième sommet.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèrediagonale2'
		si: 'quadrilatère ?l [ sommets: [ ?a ?b ?c ?d ] ]'
		alors: 'quadrilatère ?l [  diagonale:   [ ?b ?d  ] ] '
		com: 'diagonale reliant le deuxième au dernier sommet.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèrediagonalesPerp'
		si:
			'quadrilatère  ?x1 [ diagonale: [ diagonale1  [ ?x ?y  ]  ]  ]
quadrilatère  ?x1 [ diagonale: [ diagonale2  [ ?a ?b  ]  ]  ]
perpendiculaire [ ?x ?y  ] ?p 
sorteDeDroite ?p
pointSur ?p ?x2
pointSur ?p ?y2
different:de: ?x ?x2
different:de: ?y ?y2
different:de: ?x2 ?y2
'
		alors: 'perpendiculaire [ ?x ?y ] [ ?x2 ?y2 ]'
		com:
			'Les diagonales  sont perpendiclaires si les extrémités de l''une des diagonales sont sur la médiatrice de l''autre .'.
	"	e
		lisRegle: 'figuresRectilignes-quadrilatèrediagonaleSegment'
		si:
			'quadrilatère ?l [ diagonale: [ ?p [ ?b ?d ] ] ]
segment ?s [ ?d ?b ]'
		alors: 'quadrilatère ?l [ parallélogramme ?s ]'."

	"e lisRegle: 'figuresRectilignes-quadrilatèreSegments '
si:  'quadrilatère ?l [ sommets: [ ?a ?b ?c ?d ] ]
ordonneMot:et:rep1:rep2: ?a ?b ?aa ?bb
ordonneMot:et:rep1:rep2: ?b  ?c ?bb2 ?cc
ordonneMot:et:rep1:rep2: ?c ?d ?cc2 ?dd
ordonneMot:et:rep1:rep2: ?d ?a ?dd2 ?aa2 ]'
alors: 'quadrilatère ?l [ côtés:  [ [ ?aa ?bb ] [ ?bb2 ?cc ] [ ?cc2 ?dd ] [ ?dd2 ?aa2 ] ] ]'  .
"
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeDef1'
		si:
			'quadrilatère ?l [ côtés: [ ?ss1 ?ss2 ?ss3 ?ss4 ] 
segment ?s1 ?ss1
segment ?s3 ?ss3
relation:et:nom: ?s1 ?s3 parallèle'
		alors: 'quadrilatère ?l [ trapèze [ bases: [ ?ss1 ?ss3 ] ] ]'
		com:
			'Un quadrilatère avec une paire de côtés parallèles est un trapèze. Ces côtés sont appelés Bases'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeDef2'
		si:
			'quadrilatère ?l [ côtés: [ ?ss1 ?ss2 ?ss3  ?ss4 ] ]
segment ?s2 ?ss2
segment ?s4 ?ss4
relation:et:nom: ?s2  ?s4 parallèle'
		alors: 'quadrilatère ?l [ trapèze [ bases: [  ?ss2 ]   ?ss4 ] ]'
		com:
			'Un quadrilatère avec une paire de côtés parallèles est un trapèze. Ces côtés sont appelés Bases'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeDef1Direction'
		si:
			'quadrilatère ?l [ côtés: [ ?ss1 ?ss2 ?ss3 ?ss4 ] 
segment ?s1 ?ss1
segment ?s3 ?ss3
relation:et:nom: ?s1 ?s3 parallèleDirection'
		alors: 'quadrilatère ?l [ trapèze [ bases: [ ?ss1 ?ss3 ] ] ]'
		com:
			'Un quadrilatère avec une paire de côtés de même direction est un trapèze. Ces côtés sont appelés Bases'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeDef2Direction'
		si:
			'quadrilatère ?l [ côtés: [ ?ss1 ?ss2 ?ss3  ?ss4 ] ]
segment ?s2 ?ss2
segment ?s4 ?ss4
relation:et:nom: ?s2  ?s4 parallèleDirection'
		alors: 'quadrilatère ?l [ trapèze [ bases: [  ?ss2 ]   ?ss4 ] ]'
		com:
			'Un quadrilatère avec une paire de côtés de même direction est un trapèze. Ces côtés sont appelés Bases'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèze'
		si: 'quadrilatère ?l [ trapèze [ bases: [ ?b1 ?b2 ] ] ]'
		alors: 'quadrilatère ?l [ trapèze ]'
		com: 'Pour afficher seulement le type de quadrilatère'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeRectangle-Hauteur1'
		si:
			'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ]  ]  ] 
distance [ ?b1 ?b2 ] [  ?p1 ?p2 ]'
		alors:
			'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ] ] [ hauteur: [ ?p1 ?p2 ] ]'
		com:
			'La mesure de la hauteur d''un trapèze est  la distance entre les bases'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeRectangle-Hauteur2'
		si:
			'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ]  ] [ hauteur: [ ?p1 ?p2 ]  ] 
segment ?s1 ?b1
segment ?s2 ?b2
pointSur ?b1 ?a
pointSur ?b2 ?b
segmenrt ?s3 [ ?a ?b ]
perpendiculaire ?s3 ?b1
perpendiculaire ?s2 ?s1'
		alors: 'quadrilatère ?q [ hauteur: ?s1 ]'
		com:
			'La mesure de la hauteur d''un trapèze est  la distance entre les bases'.


	"	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeRectangle-Hauteur1'
		si:
			'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ]  ]  ] 
quadrilatère ?q  [ rectangleEn: ?a ]
quadrilatère ?q  [ rectangleEn: ?b ]
segment ?s [ ?a ?b ]
contient:el: ?cot  [ ?a ?b ]'
		alors: 'quadrilatère ?q [ bases: [ ?b1 ?b2 ] hauteur: ?s ]'
		com:
			'La hauteur d'' un trapèze rectangle est le côté perpendiculaire aux bases avec ses extrémités sur les bases'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeRectangle-Hauteur2'
		si:
			'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ]  ]  ] 
quadrilatère ?q [  côtés: ?cot ] 
quadrilatère ?q  [ rectangleEn: ?a ]
 quadrilatère ?q  [ rectangleEn: ?b ]
segment ?s [ ?b ?a ]
contient:el: ?cot [ ?b ?a ]'
		alors: 'quadrilatère ?q [ bases: [ ?b1 ?b2 ] hauteur: ?s ]'
		com: ''.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèze-aire'
		si:
			'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ]  hauteurs: ?h ]  ] 
segment ?s1 ?b1
segment ?s2 ?b2
segment ?h ?hh
mesure ?b1 ?mb1
mesure ?b2 ?mb2
mesure ?hh  ?mhh
somme:et:rep: ?mb1 ?mb2 ?sombases
produit:et:rep: ?sombases ?mhh ?prod
quotient:et:rep:  ?prod 2 ?aire'
		alors: 'quadrilatère ?q [ aire:  [ trapèze ?aire ] ]'
		com: 'L''aire d''un trapèze est (somme des bases) * hauteur / 2'."
	"	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeIsocèleParallélogramme1'
		si:
			'quadrilatère ?q [ côtés: [  ?s1 ?s2 ?s3 ?s4 ] ] 
quadrilatère ?q [ trapèze [ bases: ?s1 ?s3  ] ]
parallèle ?s2 ?s4'
		alors: 'quadrilatère ?q [ parallélogramme ]'
		com:
			'Si les bases d''un trapèze isocèle  sont isométriques, le trapèze est un parallélogramme'."
	"	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeIsocèlediagonale2'
		si:
			'segment ?s [ ?p1 ?p2 ]
segment ?s2 [ ?p3 ?p2 ]
alignement  [ ?p1  ?p3 ?p2 ]
quadrilatère ?q [ trapèze  [ bases: ?b ] ]
quadrilatère [ isocèle: ?x  ]
contient:el: ?b [ ?p1 ?p2 ]'
		alors: 'quadrilatère ?q [ parallélogramme]'
		com:
			'Si les bases d''un trapèze isocèle sont isométriques, le trapèze est un diagonale'."
	"	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeIsométrie2'
		si:
			'quadrilatère ?q [ sommets: [  ?a ?b ?c ?d2  ]
angleOrienté ?ang [ ?val ?c ?b ?a ] 
alignement [  ?c   ?d2 ?d1 ]
inférieur:à:  ?val 90'
		alors: 'isométrique [ ?a ?b ] [ ?c ?d1 ]'
		com:
			'Isométrie des bases d''un trapèze isométrique et diagonale, angle aigu'."
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeIRectangle3a'
		si:
			'quadrilatère ?q [ sommets: [  ?a ?b ?c ?d2  ]
quadrilatère ?q [  rectangleEn: ?a ]
quadrilatère ?q [  rectangleEn: ?b ]
quadrilatère ?q [  rectangleEn: ?c ]
quadrilatère ?q [  rectangleEn: ?d ]
'
		alors: 'quadrilatère ?q [ rectangle ]'
		com: 'Un trapèze rectangle en chaque sommet est un rectangle.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeIsocèle3b'
		si:
			'quadrilatère ?q [ sommets: [  ?a ?b ?c ?d1  ]
angleOrienté ?ang [ ?val ?c ?b ?a ] 
alignement [  ?c   ?d2 ?d1 ]
égal:à:  ?val 90'
		alors: 'quadrilatère ?q [ rectangle ]'
		com: 'Trapèze isocèle et rectangle, une seule intersection, angle droit.'.
	e
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangle1'
		si:
			'quadrilatère ?q [ trapèze  [ bases:  [  ?b1  ?b2 ]    ]  [ hauteur:  [ ?h1 ?h2 ]  ]  ] 
quadrilatère ?q [ côtés: ?cot ]
contient:el: ?cot [ ?h1 ?h2 ]'
		alors: 'quadrilatère ?q [  rectangleEn:  ?h1 ]'
		com:
			'Un quadrilatère qui a 2 côtés perpendiclaires est rectangle  en l''intersection de ces deux côtés.'.
	e
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangle2'
		si:
			'quadrilatère ?q [ trapèze  [ bases:  [  ?b1  ?b2 ]    ]  [ hauteur:  [ ?h1 ?h2 ]  ]  ] 
quadrilatère ?q [ côtés: ?cot ]
contient:el: ?cot [ ?h1 ?h2 ]'
		alors: 'quadrilatère ?q [  rectangleEn: ?h2 ]'
		com:
			'Un quadrilatère qui a 2 côtés perpendiclaires est rectangle  en l''intersection de ces deux côtés.'.


	"e lisRegle: 'figuresRectilignes-QuadrilatèreRectangleHauteur'
 si:  'quadrilatère ?q [ ?nom [ bases: ?b ] ]
quadrilatère ?q [ côtés: ?cot ]
point ?x
point ?y
contient:el: ?b [ ?x ?y ]
contient:el: ?cot [ ?x ?y ]
enleverDe:el:rep: ?b [ ?x ?y ] ?res'
alors:  'quadrilatère ?q [  hauteur: [ distance ?b  ?m ]  ]'
com:  'Le côté perpendiculaire qui n''est pas une base est la hauteur du trapèze.'.

"
	"	e
		lisRegle: 'figuresRectilignes-trapèzeHauteur1'
		si:
			'quadrilatère ?q [  trapèze [  bases: [  ?b1 ?b2 ] ] ]
coupleSur  ?obj2 ?b2
coupleSur  ?obj1 ?b1
perpendiculaire  ?b1 [ ?x1 ?x2 ]
pointSur ?obj1 ?x1
pointSur ?obj2 ?x2'
		alors:
			'quadrilatère ?q [ trapèze [  bases: [  ?b1 ?b2 ] hauteur: [ ?x1 ?x2 ] ] ]'
		com: 'La hauteur d''un trapèze est la distance entre les bases.'."
	"	e
		lisRegle: 'figuresRectilignes-trapèzeHauteur2'
		si:
			'quadrilatère ?q [  trapèze [  bases: [  ?b1 ?b2 ] ] ]
coupleSur  ?obj2 ?b2
coupleSur  ?obj1 ?b1
perpendiculaire  ?b2 [ ?x1 ?x2 ] 
pointSur ?obj1 ?x2
pointSur ?obj2 ?x1'
		alors:
			'quadrilatère ?q [ trapèze [  bases: [  ?b1 ?b2 ] hauteur: [ ?x1 ?x2 ] ] ]'
		com: 'La hauteur d''un trapèze est la distance entre les bases.'."

	"	e
		lisRegle: 'figuresRectilignes-trapèzeHauteur3'
		si:
			'quadrilatère ?q [  trapèze [  bases: [  ?b1 ?b2 ] ] ]
coupleSur  ?obj2 ?b2
coupleSur  ?obj1 ?b1
perpendiculaire  ?b2 [ ?x1 ?x2 ]
pointSur ?obj1 ?x1
pointSur ?obj2 ?x2'
		alors:
			'quadrilatère ?q [ trapèze [  bases: [  ?b1 ?b2 ] hauteur: [ ?x1 ?x2 ] ] ]'
		com: 'La hauteur d''un trapèze est la distance entre les bases.'.
	e	lisRegle: 'figuresRectilignes-trapèzeHauteur4'
		si:
			'quadrilatère ?q [  trapèze [  bases: [  ?b1 ?b2 ] ] ]
coupleSur  ?obj2 ?b2
coupleSur  ?obj1 ?b1
perpendiculaire  ?b2 [ ?x1 ?x2 ] 
pointSur ?obj1 ?x2
pointSur ?obj2 ?x1'
		alors:
			'quadrilatère ?q [ trapèze [  bases: [  ?b1 ?b2 ] hauteur: [ ?x1 ?x2 ] ] ]'
		com: 'La hauteur d''un trapèze est la distance entre les bases.'."
	e
		lisRegle: 'figuresRectilignes-distanceBases'
		si:
			'quadrilatère ?t [ trapèze [ bases: [ ?b1 ?b2 ] ]
coupleSur ?d1 ?b1
coupleSur ?d2 ?b2
perpendiculaire ?perp ?d1
pointSur ?perp ?p1
pointSur ?d1 ?p1
pointSur ?perp ?p2
pointSur ?d2 ?p2
ordonneMot:et:rep1:rep2:  ?p1 ?p2   ?pp1 ?pp2
different:de: ?p1 ?p2'
		alors: 'distance [ ?b1 ?b2 ] [ ?pp1 ?pp2 ]'
		com:
			'La distance entre deux parallèles est la distance entre les intersections des parallèles avec une perpendiculaire aux parallèles'.
	e
		lisRegle: 'figuresRectilignes-trapèzeAire0'
		si:
			'quadrilatère ?q [ trapèze  [ bases:  [  ?b1 ?b2  ] ] [ hauteur:  ?h ]  ] 
mesure ?h ?mh
mesure  [ moyenne  ?b1 ?b2  ] ?moy
produit:et:rep: ?moy ?mh ?aire'
		alors: 'mesure [ aire0  trapèze ?q ] ?aire déduite'
		com: 'Aire de trapèze = (moyenne des bases) x hauteur.'.
	e
		lisRegle: 'figuresRectilignes-trapèzeAireMesure'
		si:
			'quadrilatère ?q [ aire0: [ ?aire trapèze [  bases: [  ?b1 ?b2 ] hauteur: ?h ] ]
~ mesure [ aire trapèze ?q ] ?aire donnée'
		alors: 'mesure [ aire trapèze ?q ] ?aire déduite'
		com: 'Mesure de l''aire d''un trapèze.'.
	e
		lisRegle: 'figuresRectilignes-trapèzeMoyenne>DesBases'
		si:
			'quadrilatère ?q [ trapèze [  bases: [  ?b1 ?b2 ] ] [ hauteur: [ ?x1 ?x2 ] ] 
mesure ?b1 ?mb1
mesure ?b2 ?mb2
somme:et:rep: ?mb1 ?mb2 ?som
quotient:et:rep: ?som 2 ?moy
~ mesure  [ moyenne  ?b1 ?b2  ] ?moy'
		alors: 'mesure  [ moyenne  ?b1 ?b2  ] ?moy'
		com: 'calcul de la moyenne des bases'.
	e
		lisRegle: 'figuresRectilignes-trapèzeHauteurCalcul'
		si:
			'mesure [ aire trapèze ?q ] ?aire
mesure  [ moyenne  ?b1 ?b2  ] ?moy
quadrilatère ?q [  trapèze [  bases: [  ?b1 ?b2 ] hauteur: ?h ] ] 
quotient:et:rep: ?aire ?moy ?mh
~ mesure ?h ?mh'
		alors: 'mesure ?h ?mh'
		com: 'Calcul de la Hauteur à partir de la moyenne des bases.'.
	e
		lisRegle: 'figuresRectilignes-trapèzeMoyenneBasesCalcul'
		si:
			'mesure [ aire cerf-volant ?q ] ?aire
mesure ?h ?mh
quadrilatère ?q [  trapèze [  bases: [  ?b1 ?b2 ] hauteur: ?h ] ] 
quotient:et:rep: ?aire ?mh ?moy 
~ mesure [ moyenne [ ?b1 ?b2 ] ]   ?mh'
		alors: 'mesure [ moyenne [ ?b1 ?b2 ] ]   ?mh'
		com: 'Calcul de la moyenne des bases à partir de l''aire et de la hauteur'.
	e
		lisRegle: 'figuresRectilignes-trapèzeAire'
		si:
			'mesure [ aire  ?q ]  ?aire
arrondis:rep: ?aire ?aireArr'
		alors: 'quadrilatère ?q [ aire: ?aireArr ]'
		com: 'Aire arrondie'.
	e
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle1'
		si:
			'quadrilatère ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
quadrilatère  ?x1 [ trapèze [ bases: [ ?c1 ?c3 ] ] ]
relation:et:nom:   ?c2 ?c4 isométrique'
		alors: 'quadrilatère ?x1 [ isocèle: [ côtés: [  ?c2 ?c4 ] ] ]'
		com: 'Un trapèze qui a les côtès opposés isométriques est isocèle.'.
	e
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle1Trapèze'
		si: 'quadrilatère ?x1 [ isocèle: [ côtés: [ ?c2 ?c4 ] ] ]'
		alors: 'quadrilatère ?x1 [ trapèze ]'
		com: 'Pour afficher seulement le type de quadrilatère'.
	e
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle2'
		si:
			'quadrilatère ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
relation:et:nom:   ?c1 ?c3 isométrique'
		alors: 'quadrilatère ?x1 [ isocèle: [  côtés:   ?c1 ?c3 ] ]'
		com: 'Un trapèze qui a les côtès opposés isométriques est isocèle.'.
	e
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle2Trapèze'
		si: 'quadrilatère ?x1 [ trapèze_isocèle2: [ côtés: ?c1 ?c3 ] ]'
		alors: 'quadrilatère ?x1 [ trapèze_isocèle ]'
		com: 'Pour afficher seulement le type de quadrilatère'.
	e
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle3'
		si:
			'quadrilatère ?q [ isocèle: [ côtés: ?x [ ?a ?e ] ] ]
quadrilatère ?q [ trapèze [ bases: [ [ ?a ?b ] [  ?p ?e ] ]  ] ]
perpendiculaire ?perp ?d ?e
segment ?s [ ?aa ?bb ]
intersection ?i ?perp ?s
relationCrée:et:nom:   ?c1 ?c3 isométrique'
		alors: 'relationCréée TrapèzeIsocèle3 [ ?a ?b ] [ ?p ?e ] isométrique'
		com:
			'Un trapèze isocèle avec une des bases ayant une intersection avec la perpendiculaire à cette base issue de l''extémité du côtè opposé, a ses bases  isométriques et est un aussi un parallélogramme.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèrediagonaleParalléloBases'
		si:
			'quadrilatère  ?x1 [ trapèze ?x2 ]
quadrilatère  ?x1 [ trapèze  ?x3 ]
different:de: ?x2 ?x3'
		alors: 'quadrilatère ?x1 [ parallélogramme  ]'
		com:
			'Si chaque paire de côtés opposés d''un quadrilatère sont les bases d''un trapèze, le quadrilatère est un parallélogramme.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreCôtésParallèlesEtIsocèles'
		si:
			'quadrilatère  ?x1 [ isocèle: [ côtés: [ ?c1 ?c2 ] ]
mêmePente ?c1 ?c2'
		alors: 'quadrilatère ?x1 [ parallélogramme  ]'
		com:
			'Si les côtés d''un trapèze isocèle ont une même pente,  ce trapèze est un parallélogramme.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreCôtésParallèlesEtIsocèlesAngle droit'
		si:
			'segment ?s1 ?c1
segment ?s2 ?c2
pente:rep: ?s1 ?p1
pente:rep: ?s2 ?p2
abs:rep: ?p1 ?pp1
abs:rep: ?p2 ?pp2
supérieur:à: ?pp1 1.0e13
supérieur:à: ?pp2 1.0e13'
		alors: 'mêmePente ?s1 ?s2'
		com: 'Des segments pente infinie ont une même pente.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreCôtésParallèlesEtIsocèlesAngle droit'
		si:
			'égaux:et: ?c1 [ B  C ]
segment ?s1 ?c1
segment ?s2 ?c2
pente:rep: ?s1 ?p1
pente:rep: ?s2 ?p2
égal:à: ?p1 ?p2
different:de: ?s1 ?s2'
		alors: 'mêmePente ?c1 ?c2'
		com: 'Des segments de même pente en valeur absolue.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreParallélogrammeIsométrieSeg1'
		si:
			'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3 ?s4 ] ]
quadrilatère ?l [  parallélogramme  ]
relationCrée:et:nom:  ?s2 ?s4 isométrique'
		alors: 'relationCréée  ?s2 ?s4 isométrique'
		com: 'les côtés opposés d''un parallélogramme sont isométriques.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreParallélogrammeIsométrieSeg2'
		si:
			'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3 ?s4 ] ]
quadrilatère ?l [  parallélogramme  ]
relationCrée:et:nom:  ?s1 ?s3 isométrique'
		alors: 'relationCréée  ?s1 ?s3 isométrique'
		com: 'les côtés opposés d''un parallélogramme sont isométriques.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreParallelogrammeIsometrieRéciproque1'
		si:
			'quadrilatère ?q [  segments: [ ?s1 ?s2 ?s3 ?s4 ] ]
isométrique  ?s1 ?s3
isométrique  ?s2 ?s4'
		alors: 'quadrilatère ?q [ parallelogramme ]'
		com:
			'Si un quadrilatère a 2 paires de côtés opposés isométriques, c''est un parallèlogramme.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreParallelogrammeParallèle1'
		si:
			'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3 ?s4 ] ]
quadrilatère ?l [  parallélogramme ]
segment ?s1 ?ss1
segment ?s3 ?ss3'
		alors: 'parallèle ?ss1 ?ss3'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreParallelogrammeParallèle2'
		si:
			'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3  ?s4 ]  ]
quadrilatère ?l [  prallélogramme  ]
segment ?s2 ?ss2
segment ?s4 ?ss4'
		alors: 'parallèle ?ss2 ?ss4'
		com: 'Les côtés opposés d''un paralélogramme sont parallèles.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreParallèlogramme'
		si:
			'quadrilatère ?l [ côtés: [  ?s1 ?s2 ?s3 ?s4 ] ]
segment ?seg1 ?s1
segment ?seg2 ?s2
segment ?seg3 ?s3
segment ?seg4 ?s4
parallèle ?seg1 ?seg3
parallèle ?seg2 ?seg4
'
		alors: 'quadrilatère ?l [ parallélogramme ]'
		com:
			'Un quadilatère avec deux paires de côtés parallèles est un parallélogramme.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLosangeparallèlögramme'
		si: 'quadrilatère ?l [ losange ]'
		alors: 'quadrilatère ?l [ parallélogramme ]'
		com: 'Un losange est aussi un parallélogramme.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLosangeparallèles1'
		si:
			'quadrilatère ?l [ losange ]
quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3  ?s4 ]'
		alors: 'parallèle ?s1 ?s3'
		com: ' Les côtés opposés d''un losange sont parallèles.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLosangeparallèles2'
		si:
			'quadrilatère ?l [ losange ] 
quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3  ?s4 ]'
		alors: 'parallèle ?s2 ?s4'
		com: ' Les côtés opposés d''un losange sont parallèles.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreCarré1'
		si:
			'quadrilatère ?l [ rectangle ]
quadrilatère ?l [ losange  ]'
		alors: 'quadrilatère ?l [  carré  ]'
		com:
			'Si un quadrilatère est à la fois un losange et un rectangle, c''est un carré'.
	"e
		lisRegle: 'figuresRectilignes-quadrilatèreCarré2'
		si:
			'quadrilatère  ?x1 [ losange ]
quadrilatère  ?x1 [ diagonale: ?d1 ]
quadrilatère  ?x1 [ diagonale: ?d2 ]
relation:et:nom: ?d1 ?d2 isométrique
different:de: ?d1  ?d2'
		alors: 'quadrilatère ?x1 [  carré  ]'
		com:
			'Si un quadrilatère est un losange avec des diagonales isométriques c''est un carré'."
	e
		lisRegle: 'figuresRectilignes-quadrilatèreCarréIsométrie'
		si:
			'quadrilatère  ?q [ carré ]
quadrilatère ?q [ diagonale: [ diagonale1 ?d1 ] ]
quadrilatère ?q [ diagonale: [ diagonale2 ?d2 ] ]'
		alors: 'isométrique ?d1 ?d2'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreRectangle'
		si:
			'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3 ?s4 ] ] 
quadrilatère ?l [ parallélogramme]
perpendiculaire ?s1 ?s2
perpendiculaire ?s2 ?s3'
		alors: 'quadrilatère ?l [ rectangle   ]'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLosange3'
		si:
			'quadrilatère ?q [ diagonale: ?x1 ] 
 quadrilatère ?q [ diagonale: ?x2 ] 
perpendiculaire ?x1 ?x2
different:de:  ?x1 ?x2'
		alors: 'quadrilatère ?q [ losange ]'
		com:
			'Un quadrilatère avec les diagonales qui se coupent en leur milieu et sont perpendiculaires est un losange'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLosange'
		si:
			'quadrilatère ?q [ côtés: [ [ ?x1 ?y1 ]   [ ?x2 ?y2 ]   [ ?x3 ?y3 ]  [ ?x4 ?y4 ]   ] ]
relation:et:nom:   [ ?x1 ?y1 ] [ ?x2 ?y2 ] isométrique
relation:et:nom:   [ ?x1 ?y1 ] [ ?x3 ?y3 ] isométrique
relation:et:nom:   [ ?x1 ?y1 ] [ ?x4 ?y4 ] isométrique'
		alors: 'quadrilatère ?q [ losange ]'
		com:
			'Un quadrilatère avec tous les côtés isométriques entre eux est un losange'.
	e
		lisRegle: 'figuresRectilignes-LosangeaussiCerf-volant'
		si: 'quadrilatère ?q [ losange ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com: 'Un losange est aussi un cerf-volant'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantIsométrie1'
		si:
			'quadrilatère ?q [ côtés: [ ?x1 ?x2 ?x3 ?x4 ] ]
relation:et:nom: ?x1 ?x2 isométrique
relation:et:nom: ?x4 ?x3 isométrique
tousDifferents: [ ?x1 ?x2 ?x3 ?x4 ]'
		alors: 'quadrilatère ?q [ cerf-volant1 ]'
		com:
			'Un quadrilatère avec deux paires de côtés isométriques est un cerf-volant'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantIsométrie2'
		si:
			'quadrilatère ?q [ côtés: [ ?x1 ?x2 ?x3 ?x4 ] ]
relation:et:nom: ?x1 ?x4 isométrique
relation:et:nom: ?x2 ?x3 isométrique
tousDifferents: [ ?x1 ?x2 ?x3 ?x4 ]'
		alors: 'quadrilatère ?q [ cerf-volant2 ]'
		com:
			'Un quadrilatère avec deux paires de côtés isométriques est un cerf-volant'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volant1Cerf-Volant'
		si: 'quadrilatère ?q [ cerf-volant1 ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com:
			'Un quadrilatère avec deux paires de côtés isométriques est un cerf-volant.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volant2Cerf-Volant'
		si: 'quadrilatère ?q [ cerf-volant2 ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com:
			'Un quadrilatère avec deux paires de côtés isométriques est un cerf-volant.'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreCerfVolantDiagonales'
		si:
			'perpendiculaire [ ?x1 ?x2 ] [ ?x3 ?x4 ]
quadrilatère ?q [ diagonale: ?diag1  ]
quadrilatère ?q [ diagonale: ?diag2  ]
contient:el: ?diag1 ?x1
contient:el: ?diag1 ?x2
contient:el: ?diag2 ?x3
contient:el: ?diag2 ?x4'
		alors: 'quadrilatère ?q [  cerf-volant ]'
		com:
			'Si les diagonales d''un quadrilatère sont perpendiculaires, alors le quadrilatère est un cerf-volant.'.
	"e
		lisRegle: 'FiguresRectilignes-quadrilatèreCerfVolantDef2'
		si: 'quadrilatère ?q [ cerf-volant1 ]'
		alors: 'quadrilatère ?q [  cerf-volant ]'
		com: ''."
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLosange'
		si:
			'quadrilatère ?q [ cerf-volant1 ]
quadrilatère ?q [ cerf-volant2 ]'
		alors: 'quadrilatère ?q [ losange ]'
		com: 'Un quadrilatère formés de deux  cerf-volants est un losange'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantRéflexion'
		si:
			'quadrilatère  ?x1 [ diagonale: [ ?x2 ?x3 ] ]
reflexion  ?xr1 ?xr2 ?r
contient:el: [  ?x2 ?x3 ] ?xr1 
contient:el: [  ?x2 ?x3 ] ?xr2'
		alors: 'quadrilatère  ?x1 [ cerf-volant ]'
		com:
			'Un quadrilatère dont une diagonale a pour extrémités un sommet et l''image d''un sommet par une réflection dont l''axe  passe par les deux autre sommets est un cerf-volant'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantRéflexion'
		si:
			'quadrilatère  ?x1 [ diagonale: [ ?x2 ?x3 ] ]
quadrilatère  ?x1 [ diagonale: [ ?x4 ?x5 ] ]
reflexion ?x2 ?x3 ?r
droite ?r ?x4 ?x5'
		alors: 'quadrilatère  ?x1 [ cerf-volant ]'
		com:
			'Un quadrilatère dont une diagonale a pour extrémités un sommet et l''image d''un sommet par une réflection dont l''axe  passe par les deux autre sommets est un cerf-volant'.
	"	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantPointSur1'
		si:
			'quadrilatère  ?q  [ sommets: [ ?s1 ?s2 ?s3 ?s4 ] ]
segment  ?s  [ ?s1 ?s3 ]
milieu [ ?s1 ?s3 ] ?m
cercle ?c [  centre: ?m  ]'
		alors: 'pointSur ?c ?s4'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantPointSur2'
		si:
			'quadrilatère  ?q  [ sommets: [ ?s1 ?s2 ?s3 ?s4 ] ]
segment  ?s  [ ?s1 ?s3 ]
milieu [ ?s1 ?s3 ] ?m
cercle ?c [  centre: ?m  ]'
		alors: ' pointSur ?c ?s2'."
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantdiagonales1'
		si:
			'quadrilatère ?q [ sommets: ?som ]
quadrilatère ?q [  diagonale: [ ?x1 ?x2 ] ]
quadrilatère ?q [  diagonale: [ ?x3 ?x4 ] ]
perpendiculaire  [ ?x3 ?x4 ] [ ?x1 ?x2 ] 
different:de: [ ?x3 ?x4 ] [ ?x1 ?x2 ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com:
			'Un quadrilatère est un cerf-volan si ses diagonales se coupent à angle droit, la diagonale qui est la médiatrice de deux sommets opposés est l''axe de symétrie du cerf-volant'.
	e
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantdiagonales2'
		si:
			'quadrilatère ?q [ sommets: ?som ]
quadrilatère ?q [  diagonale: [ ?x1 ?x2 ] ]
quadrilatère ?q [  diagonale: [ ?x3 ?x4 ] ]
perpendiculaire   [ ?x1 ?x2 ]  [ ?x3 ?x4 ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com:
			'Un quadrilatère est un cerf-volant si ses diagonales se coupent à angle droit, la diagonale qui est la médiatrice de deux sommets opposés est l''axe de symétrie du cerf-volant'.
	e
		lisRegle: 'figuresRectilignes-Milieudiagonales1'
		si:
			'quadrilatère ?q [ cerf-volant ]
symetrieCentrale  ?x1 ?y2 ?centre
ordonneMot:et:rep1:rep2: ?x1 ?y2 ?xx1 ?yy2
quadrilatère ?q [ diagonale: [ ?xx1 ?yy2 ] ]
quadrilatère ?q [ diagonale: [ ?x3 ?y4 ] ]
médiatrice ?m [ ?x3 ?x4 ]
pointSur ?m ?xx1
pointSur ?m ?yy2'
		alors: 'milieu [ ?x3 ?x4 ] ?centre'
		com:
			'Si les extrémités d''une diagonale d''un cerf-volant sont un point et son image par une symétrie centrale de centre O et sur la médiatrice de l''autre diagonale, les diagonales se coupent en leur milieu, au centre de symétrie.'.
	e
		lisRegle: 'figuresRectilignes-Cerf-volantAire0'
		si:
			'quadrilatère ?q [  cerf-volant ]
quadrilatère ?q [ diagonale: [ ?a ?c  ] ]
quadrilatère ?q [ diagonale: [ ?b ?d ] ]
mesure  [ ?a ?c ] ?m1
mesure  [ ?b ?d ] ?m2
produit:et:rep: ?m1 ?m2 ?prod
quotient:et:rep:  ?prod 2  ?aire0
different:de: [ ?a ?c ]  [ ?b ?d ]
~ aire [ quadrilatère ?q ] ?aire0'
		alors: 'mesure [ aire quadrilatère ?q ] ?aire0'
		com: 'l''aire d''un cerf-volant = (produit des diagonales ) /2'.
	e
		lisRegle: 'figuresRectilignes-Cerf.volantAireDiagonale1'
		si:
			'quadrilatère ?q [ diagonale: [ diagonale1 [ ?a ?b  ] ]
quadrilatère ?q [ diagonale: [ diagonale2 [ ?d ?e  ] ]
mesure  [ trapèze ?q aire ] ?mta
mesure  [ ?d ?e ] ?m2
quotient:et:rep: ?mta   ?m2  ?res
produit:et:rep: ?res  2 ?m1
'
		alors: 'mesure [  ?a ?c ] ?m1'
		com: 'calcul de la diagonale2'.
	e
		lisRegle: 'figuresRectilignes-QuadrilatèreAire'
		si:
			'mesure [ aire quadrilatère ?q ] ?aire0
arrondis:rep: ?aire0 ?aire'
		alors: 'quadrilatère ?q [ aire: ?aire ]'
		com: 'Aire arrondie'.
	e
		lisRegle: 'figuresRectilignes-Cerf.volantMesureAire'
		si:
			'quadrilatère ?q [ aire0: [ ?aire0 cerf-volant [] ]
arrondis:rep: ?aire0 ?aire
~ mesure [ aire cerf-volant ?q  ] ?aire'
		alors: 'mesure [ aire cerf-volant ?q  ] ?aire'
		com: 'Mesure aire cerf-volant'.
	e
		lisRegle: 'figuresRectilignes-Approximation1'
		si:
			'quadrilatère ?q [ aire0: [ ?aire2 ?type2  ?val2  ] ]
quadrilatère ?q [ aire0: [ ?aire1 ?type1  ?val1 ] ]
different:de: ?val1 ?val2
supérieur:à: ?aire2 ?aire1
retireFait: quadrilatère ?q [ aire0: [ ?aire2 ?type2  ?val1 ] ]'
		alors: 'quadrilatère ?q [ aire0: [ ?aire1 ?type2 ?val2 ] ]'
		com: 'Approximation d''une valeur.'.
	e
		lisRegle: 'figuresRectilignes-MesureCôté'
		si:
			'quadrilatère ?q [ aire0: [ ?aire ?type ?val ] ]
quadrilatère ?q [ trapèze  [ bases:  [  ?b1 ?b2 ] hauteur: ?h  ]  ] 
mesure ?h ?mh
quotient:et:rep: ?aire ?mh ?quo'
		alors: 'mesure [ moyenne [ ?b1 ?b2 ] ] ?quo'
		com: 'la moyenne des mesures des bases est l''aire divisée par la hauteur'.
	e
		lisRegle: 'figuresRectilignes-diagonale'
		si:
			'quadrilatère ?q [ trapèze ]
quadrilatère ?q [ cerf-volant ]
quadrilatère ?q [  aire0: [ ?aire ?x ?z ] ] ]
produit:et:rep: 2 ?aire ?prod
racineDecimal:rep: ?prod ?mesDiag
quadrilatère ?q [  diagonale: ?diag ]'
		alors: 'mesure ?diag ?mesDiag'
		com: 'Diagonale calculée à partir de l''aire du carré'.
	e
		lisRegle: 'figuresRectilignes-diagonale'
		si:
			'quadrilatère ?q [ trapèze ]
quadrilatère ?q [ cerf-volant ]
quadrilatère ?q [  aire0: [ ?aire ?x ?z ] ] ]
produit:et:rep: 2 ?aire ?prod
quadrilatère ?q [  diagonale: ?diag1 ]
quadrilatère ?q [  diagonale: ?diag2 ]
different:de: ?diag1 ?diag2'
		alors: 'mesure [ produit ?diag1 ?diag2 ] ?prod'
		com: 'Diagonale calculée à partir de l''aire du carré'.
	e
		lisRegle: 'figuresRectilignes-aireInverseMoyenne des bases'
		si:
			'quadrilatère A:B:C:D  [ aire0:  [ ?aire trapèze  [ bases:  [  [ ?x1 ?y1 ] [ ?x2 ?y2 ] ] hauteur:  ?h  ]  ]  ] 
mesure ?h ?mh
quotient:et:rep:  ?aire ?mh ?mb
~ mesure  [ moyenne [ ?x1 ?y1 ]  [ ?x2 ?y2 ]  ] ?mb'
		alors: 'mesure  [ moyenne [ ?x1 ?y1 ]  [ ?x2 ?y2 ]  ] ?mb'
		com: 'Calcul de la moyenne des bases à partir de l''aire du trapèze.'.
	e
		lisRegle: 'figuresRectilignes-PositionPoint'
		si:
			'sorteDeDroite  ?d ?x ?y
sens ?d direct
point ?p
triangle ?t [ sommets: ?som ]
contient:el: ?som ?x
contient:el: ?som ?y
contient:el: ?som ?p
different:de: ?p ?x
different:de: ?p ?y
triangle ?t [ orientation: ?or ]'
		alors: 'point ?p  [ situé_à: [ ?or  de ?d  ] '
		com:
			'Position d''un point par rapport à une droite, dépend de l''orientation du triangle formé par les points qui définissent la droite et le point'.
	e
		lisRegle: 'figuresRectilignes-PositionPointInverse1'
		si:
			'sorteDeDroite  ?d ?x ?y
sens ?d inverse
point ?p
triangle ?t [ sommets: ?som ]
contient:el: ?som ?x
contient:el: ?som ?y
contient:el: ?som ?p
different:de: ?p ?x
different:de: ?p ?y
triangle ?t [ orientation: ?or ]
égaux:sorteDeDroite  ?d ?x ?y
sens ?d inverse
point ?p
triangle ?t [ sommets: ?som ]
contient:el: ?som ?x
contient:el: ?som ?y
contient:el: ?som ?p
different:de: ?p ?x
different:de: ?p ?y
triangle ?t [ orientation: ?or ]
égaux:et: ?or gauche ?or gauche'
		alors: 'point ?p  [ situé_à: droite  de ?d ]'
		com:
			'Position d''un point par rapport à une droite, dépend de l''orientation du triangle formé par les points qui définissent la droite et le point'.
	e
		lisRegle: 'figuresRectilignes-PositionPointInverse2'
		si:
			'sorteDeDroite  ?d ?x ?y
sens ?d inverse
point ?p
triangle ?t [ sommets: ?som ]
contient:el: ?som ?x
contient:el: ?som ?y
contient:el: ?som ?p
different:de: ?p ?x
different:de: ?p ?y
triangle ?t [ orientation: ?or ]
égaux:et: ?or droite'
		alors: 'point ?p  [ situé_à: gauche  de ?d ]'
		com:
			'Position d''un point par rapport à une droite, dépend de l''orientation du triangle formé par les points qui définissent la droite et le point'.


	"e
		lisRegle: 'figuresRectilignes-PolygoneCôtés End of statement list encountered ->'
		si: 'polygoneRégulier ?pl [ sommets: ?som ]'
		alors: 'créeCôtés  [ ] ?som'
		com: 'Lance la création des côtés d''un polygone à partir de ses sommets'."
	ExpertRegle figuresRectilignesSuite2: e
	"	e
		lisRegle: 'figuresRectilignes-adjacent3'
		si:
			'segment ?s1 [ ?b ?a ]
segment ?s2 [ ?b ?c ]
different:de: ?s1 ?s2'
		alors: 'adjacent ?s1 ?s2 ?a ?b ?c'.
		e
		lisRegle: 'figuresRectilignes-adjacentRec'
		si: 'adjacent ?s1 ?s2 ?a ?b ?c
		alors: 'adjacent ?s2 ?s1 ?a ?b ?c'.

		e
		lisRegle: 'figuresRectilignes-adjacent2'
		si:
			'point ?b
segment  ?s1 ?ss1
segment  ?s2 ?ss2
contient:el: ?ss1 ?b
contient:el: ?ss2 ?b
enleverDe:el:rep: ?ss1 ?b ?a
enleverDe:el:rep: ?ss2 ?b ?c
different:de: ?a ?c

aireTriangle:avec:avec:rep: ?a ?b ?c ?aire
inférieur:à: ?aire 0'
		alors: 'adjacent ?s2 ?s1 ?a ?b ?c'."
	"
e lisRegle: 'figuresRectilignes-adjacent3'
 si:  'segment ?s1 [ ?y ?x ]
segment  ?s2 [ ?y ?z ]
different:de:  ?x ?z
different:de: ?y ?x
different:de: ?y ?z'
alors: 'adjacent ?s1 ?s2 ?x ?y ?z'.

e lisRegle: 'figuresRectilignes-adjacent4'
 si:  'segment ?s1 [ ?y ?x ]
segment  ?s2 [ ?z ?y ]
different:de:  ?x ?z
different:de: ?y ?x
different:de: ?y ?z'
alors: 'adjacent ?s1 ?s2 ?x ?y ?z'.

e lisRegle: 'figuresRectilignes-adj' 
si:  'segment ?s1 [ ?x1 ?y1 ]
segment ?s2 [ ?x2 ?y2 ]
point ?x
contient:el:  [ ?x1 ?y1 ] ?x
contient:el:  [ ?x2 ?y2 ] ?x
different:de: ?s1 ?s2
enleverDe:el:rep: [ ?x1 ?y1 ]  ?x [ ?p1 ]
enleverDe:el:rep: [ ?x2 ?y2 ]  ?x [ ?p2 ]'
alors: 'adjacent  ?s1 ?s2 ?p1 ?x ?p2'.
"! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 12/2/2023 14:24'!
homothétie: e
	"e
		lisRegle: 'homothétie'
		si: 'homothétie ?ix ?c ?x ?nom ?v'
		alors: 'homothétie ?ix ?c ?x ?v'."

	e
		lisRegle: 'homothétie-thales'
		si:
			'homothétie ?ix ?x ?c ?v2
homothétie  ?iy ?y ?c ?v1
égal ?v1 ?v2
ordonneMot:et:rep1:rep2:    [  ?ix ?iy ]  [ ?x ?y ]   [  ?ix ?iy ] [ ?x ?y ] 
ordonneMot:et:rep1:rep2:  ?ix ?iy ?iix ?iiy
ordonneMot:et:rep1:rep2:  ?x ?y ?xx ?yy
relationCrée:et:nom:   [  ?ix ?iy ]  [ ?xx ?yy ]  parallèle
different:de: ?x ?y
different:de: ?x ?iy
different:de: ?y ?ix'
		alors: 'relationCréée  [  ?iix ?iiy ]  [ ?xx ?yy ]  parallèle'
		com: 'un segment et son image par homothétie sont parallèles'.
	e
		lisRegle: 'homothétie-defPoint'
		si: 'homothétie ?ix ?c ?x ?v'
		alors: 'point ?ix'
		com: 'l''image d''un point par une homothétie est un point'.
	e
		lisRegle: 'homothétie-rec'
		si:
			'homothétie ?ix ?c ?x ?v
quotient:et:rep: 1 ?v ?rep'
		alors: 'homothétie ?ix ?x ?c ?rep'
		com:
			'L''image d''une d''un point par une homothétie de centre C et  de rapport v  est la même que l''image de C par l''homothétie de centre x de rapport 1 / v '.
	e
		lisRegle: 'homothétie-SegmentsRapport1'
		si:
			'intersection ?O ?d1 ?d2
égal  [ quotient  [ mesure  [  ?y1 ?O ]  ]  [ mesure  [ ?y2 ?O ]  ]  ]  [ quotient  [ mesure  [ ?y3 ?O ]  ]  [ mesure  [  ?y4 ?O]  ]  ] 
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?d1 ?d2
pointSur ?d1 ?y1
pointSur ?d1 ?y2
pointSur ?d2 ?y3
pointSur ?d2 ?y4
different:de: ?O ?y1
different:de: ?O ?y2
different:de: ?O ?y3
different:de: ?O ?y4
different:de: [  ?y1 ?O ]  [ ?y2 ?O  ] '
		alors:
			'homothétie ?y1 ?y2 ?O [ quotient  [ mesure  [ ?y1 ?O ]  ]  [ mesure  [  ?y2 ?O ]  ]  ] '
		com:
			'Si de l''intersection de  deux droites on a des segments reliant deux points de chaque droite, dans un même rapport, un des points est l''image par une homothétie ayant ce point pour centre et de rapport le quotient des mesures des segments correspondant pour chaque droite.'.
	e
		lisRegle: 'homothétie-SegmentsRapport2'
		si:
			'intersection ?O ?d1 ?d2
égal  [ quotient  [ mesure  [ ?y1 ?O ]  ]  [ mesure  [ ?y2 ?O ]  ]  ]  [ quotient  [ mesure  [ ?y3 ?O ]  ]  [ mesure  [ ?y4 ?O]  ]  ]
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?d1 ?d2
pointSur ?d1 ?y1
pointSur ?d1 ?y2
pointSur ?d2 ?y3
pointSur ?d2 ?y4
different:de: ?O ?y1
different:de: ?O ?y2
different:de: ?O ?y3
different:de: ?O ?y4
different:de: [ ?y3 ?O ]  [  ?y4 ?O ]'
		alors:
			'homothétie ?y3 ?y4 ?O   [ quotient  [ mesure  [ ?y3 ?O ]  ]  [ mesure  [ ?y4  ?O ]  ]  ]'
		com:
			'Si de l''intersection de deux droites on a des segments reliant deux points de chaque droite, dans un même rapport, un des points est l''image par une homothétie ayant ce point pour centre et de rapport le quotient des mesures des segments correspondant pour chaque droite.'! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 9/5/2025 16:40:35'!
interface: e 
	| t2 |
	e
		lisRegle: 'interface-texte1'
		si: 'DrGTextItem ?x ?y ?z ?w'
		alors: '?y ?z   ?w'
		com: 'Donnée sous forme de  texte.'.
	e
		lisRegle: 'interface-texte2'
		si: 'DrGTextItem ?x ?y ?z ?u  ?w'
		alors: '?y ?z ?u  ?w'
		com: 'Donnée sous forme de  texte.'.
	t2 := e creeRegle: 'interface-DrGPointFreeItem'.
	t2 antecedents: 'DrGPointFreeItem  ?p '.
	t2 concl: 'point ?p'.
	t2 com: 'Qualification d''un point'.
	t2 := e creeRegle: 'interface-PointInter-def'.
	t2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	t2 concl: 'point ?p'.
	t2 com: 'Qualification d''un point'.
	t2 := e creeRegle: 'interface-PointInter-defPointSur1'.
	t2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	t2 concl: 'pointSur ?o1 ?p'.
	t2 com: 'Le point d''intersection est sur le premier objet'.
	t2 := e creeRegle: 'interface-PointInter-defPointSur2'.
	t2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	t2 concl: 'pointSur ?o2 ?p'.
	t2 com: 'Le point d''intersection est sur le deuxième objet'.
	t2 := e creeRegle: 'interface-PointSurLigne-def'.
	t2 antecedents: 'DrGPointOncurveItem ?p ?d'.
	t2 concl: 'point ?p'.
	t2 com: 'point sur une ligne'.
	t2 := e creeRegle: 'interface-PointSurLigne-pointSur'.
	t2 antecedents: 'DrGPointOncurveItem ?p ?l'.
	t2 concl: 'pointSur ?l  ?p'.
	t2 com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-Segment'.
	t2
		antecedents:
			'DrGSegment2ptsItem ?s ?x ?y
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy'.
	t2 concl: 'segment ?s [ ?xx ?yy ]'.
	t2 com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-Segment-def'.
	t2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	t2 concl: 'segment ?s'.
	t2 com: 'Qualification d''une sorte de segment.'.
	t2 := e creeRegle: 'interface-SegmentpointSur1'.
	t2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	t2 concl: 'pointSur ?s ?x'.
	t2 com: 'L''origine d''un  segment est un point sur ce segment.'.
	t2 := e creeRegle: 'interface-SegmentpointSur2'.
	t2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	t2 concl: 'pointSur ?s ?y'.
	t2 com: 'L''extrémité d''un  segment est un point sur ce segment.'.
	e
		lisRegle: 'interface-Segment-extremité1'
		si: 'segment ?s [ ?a ?b ]'
		alors: 'point ?a'
		com: 'l''origine d''un segment est un point'.
	e
		lisRegle: 'interface-Segment-extremité2'
		si: 'segment ?s [ ?a ?b ]'
		alors: 'point ?b'
		com: 'la fin  d''un  segment est un point'.
	t2 := e creeRegle: 'interface-SegmentSorteDeDroite-def'.
	t2 antecedents: 'segment ?s'.
	t2 concl: 'sorteDeDroite ?s'.
	t2 com: 'Qualification d''une sorte de droite.'.
	t2 := e creeRegle: 'interface-SegmentSorteDeDroite-def2'.
	t2
		antecedents:
			'segment ?s [ ?xx ?yy ]
different:de: ?xx ?yy'.
	t2 concl: 'sorteDeDroite ?s ?xx ?yy'.
	t2 com: 'Un segment est une sorte de droite.'.
	t2 := e creeRegle: 'interface-SegmentSorteDeSegment-def2'.
	t2 antecedents: 'segment ?s [ ?xx ?yy ]'.
	t2 concl: 'sorteDeSegment ?s [ ?xx ?yy ]'.
	t2 com: 'Un segment est une sorte de segment.'.
	t2 := e creeRegle: 'interface-Vecteur'.
	t2 antecedents: 'DrGVector2ptsItem  ?v ?a ?b'.
	t2 concl: 'vecteur ?v [ ?a ?b ]'.
	t2 com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-SegmentVecteur-def2'.
	t2 antecedents: 'vecteur ?s [ ?xx ?yy ]'.
	t2 concl: 'sorteDeSegment ?s [ ?xx ?yy ]'.
	t2 com: 'Qualification d''une sorte de segment.'.
	t2 := e creeRegle: 'interface-Vecteur-def'.
	t2 antecedents: 'DrGVector2ptsItem  ?v ?a ?b'.
	t2 concl: 'vecteur ?v'.
	t2 com: 'Qualification d''une sorte de cercle.'.
	e
		lisRegle: 'interface-Cercle2pts'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'cercle ?C ?p2 ?p1'
		com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-sorteDeCercle2pts'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'sorteDeCercle ?C ?p2 ?p1'
		com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-Cercle2pts-def'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'cercle ?C'
		com: 'Qualification d''une sorte de cercle.'.
	e
		lisRegle: 'interface-sorteDeCercle2ptsRayon-def'
		si: 'cercle ?c ?o ?p
		pointSur ?c ?pt
ordonneMot:et:rep1:rep2:  ?o ?pt ?x1 ?x2
segment ?s [ ?x1 ?x2 ]'
		alors: 'cercle ?c rayon [ ?o ?pt ]'
		com: 'Qualification d''une sorte de cercle.'.
	e
		lisRegle: 'interface-CercleSegment-def'
		si: 'DrGCircleSegmentItem ?c  ?P ?Seg'
		alors: 'sorteDeCercle ?c'
		com: 'Qualification d''une sorte de cercle.'.
	e
		lisRegle: 'interface-CercleSegmentPointSur'
		si:
			'DrGCircleSegmentItem ?c  ?P ?Seg
pointSur ?c ?Ps'
		alors: 'cercle ?c ?P ?Ps'
		com:
			'Si cercle C de rayon segment Seg et centre P et point sur cercle Ps alors  cercle C  P Ps'.
	e
		lisRegle: 'interface-CercleSegmentCentre'
		si: 'DrGCircleSegmentItem ?c  ?P ?Seg'
		alors: 'cercle ?c [ centre: ?P ]'
		com: 'Centre d''un cercle dont le rayon est défini par un segment'.
	e
		lisRegle: 'interface-CercleSegmentSegment'
		si:
			'DrGCircleSegmentItem ?c  ?P ?Seg
segment ?Seg ?s'
		alors: 'cercle ?c [ segment: ?s ]'
		com: 'Cercle dont le rayon est défini par un segment'.
	e
		lisRegle: 'interface-CercleSegmentSegment-def'
		si:
			'DrGCircleSegmentItem ?c  ?P ?Seg
segment ?Seg ?s'
		alors: 'cercle ?c'
		com: ' Qualification d''un cercle.'.
	e
		lisRegle: 'interface-CerclePointSur'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'pointSur ?C ?p1'
		com:
			'Si un cercle est défini par son centre et un point alors ce point est sur le cercle'.
	e
		lisRegle: 'interface-Cercle-def'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'cercle ?C'
		com: 'Qualification d''un cercle'.
	e
		lisRegle: 'interface-Cercle-Segment1'
		si:
			'DrGCircleSegmentItem ?c ?p ?s
segment ?s [ ?p ?p2 ]'
		alors: 'pointSur ?c ?p2'
		com: ''.
	e
		lisRegle: 'interface-Cercle-Segment2'
		si:
			'DrGCircleSegmentItem ?c ?p ?s
segment ?s [ ?p2 ?p ]'
		alors: 'pointSur ?c ?p2'
		com: ''.
	e
		lisRegle: 'interface-Cercle-Segment'
		si: 'DrGCircleSegmentItem ?c ?p ?s'
		alors: 'cercle  ?c ?s'
		com: ''.
	e
		lisRegle: 'interface-sorteDeCercle-Segment'
		si: 'DrGCircleSegmentItem ?c ?p ?s'
		alors: 'sorteDeCercle  ?c ?s'
		com: ''.
	e
		lisRegle: 'interface-Arc3pts'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc3pts ?a ?p1 ?p2 ?p3'
		com: 'Lecture d''un fait sur la figure: arc de p1'.
	e
		lisRegle: 'interface-sorteDeCercleArc3pts'
		si:
			'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3
trie:rep: [ ?p1 ?p2 ?p3 ] ?rep'
		alors: 'sorteDeCercle ?a [ cerclePar3Points: ?rep'
		com: 'Un arc 3pts est une sorte de cercle par 3 pts'.
	e
		lisRegle: 'interface-Arc3pts-def'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc ?a'
		com: 'Qualification d''un arc'.
	e
		lisRegle: 'interface-Arc3pts-def'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'sorteDeCercle ?a'
		com: 'Qualification d''une sorte de Cercle'.
	e
		lisRegle: 'interface-Arc-def-Cercle'
		si: 'arc ?a'
		alors: 'sorteDeCercle ?a'
		com: 'Qualification d''une sorte de cercle'.
	e
		lisRegle: 'interface-sorteDeCercle-pointSur1'
		si: 'sorteDeCercle ?c [ cerclePar3Points: [ ?p1 ?p2 ?p3 ]  ]'
		alors: 'pointSur  ?c ?p1'
		com: 'Si arc 3 points p1 p2 p3 alors p1 sur l''arc'.
	e
		lisRegle: 'interface-sorteDeCercle-pointSur2'
		si: 'sorteDeCercle ?c [ cerclePar3Points: [ ?p1 ?p2 ?p3 ]  ]'
		alors: 'pointSur  ?c ?p2'
		com: 'Si  sorte de cercle points p1 p2 p3 alors p1 sur la sorte de cercle'.
	e
		lisRegle: 'interface-sorteDeCercle-pointSur3'
		si: 'sorteDeCercle ?c [ cerclePar3Points: [ ?p1 ?p2 ?p3 ]  ]'
		alors: 'pointSur  ?c ?p3'
		com: 'Si  sorte de cercle points p1 p2 p3 alors p2 sur la sorte de cercle'.
	e
		lisRegle: 'interface-SorteDeCercleCentre'
		si:
			'sorteDeCercle ?c [ cerclePar3Points: ?pts ]
intersection ?i ?m1 ?m2
médiatrice ?m1 [  ?x ?y ]
médiatrice ?m2 [  ?z ?w ]
includes:el: ?pts ?x
includes:el: ?pts ?y
includes:el: ?pts ?z
includes:el: ?pts ?w'
		alors: 'sorteDeCercle  ?c [ centre: ?i ]'
		com:
			'Le centre d''un cercle par 3 points est l''intersection de méd1atrices de deux couple de ses trois points'.
	e
		lisRegle: 'interface-Arc3pts-Centre'
		si:
			'arc3pts  ?a ?p1 ?p2 ?p3
médiatrice ?m1 ?p1 ?p2
médiatrice ?m2 ?p2 ?p3
different:de: ?m1 ?m2
intersection ?i ?m1 ?m2'
		alors: 'arcCentré ?a ?i ?p1 ?p3'
		com:
			'Le centre d''un arc 3 pts  est l''intersection des médiatreces du point central et de chaque extrémité,
Il permet de définir l''arc comme l''arc centré équivalent.'.
	e
		lisRegle: 'interface-Arc3ptsRayon'
		si:
			'arc ?a
centre ?a ?c
pointSur ?a ?P
segment ?s [ ?c ?p ]'
		alors: 'rayon ?a ?s'
		com: 'Rayon d''un arc'.
	e
		lisRegle: 'interface-ArcCentré'
		si: 'DrGArcCenterAngleItem ?arc ?c ?x  ?y'
		alors: 'arcCentré ?arc ?c ?x ?y'
		com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-ArcCentré-Centre'
		si: 'arcCentré ?arc ?c ?x ?y'
		alors: 'sorteDeCercle ?arc ?c ?x'
		com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-ArcCentré-def'
		si: 'DrGArcCenterAngleItem ?arc ?c ?x  ?y'
		alors: 'arc ?arc'
		com: 'Qualification d''un arc centré'.
	e
		lisRegle: 'interface-ArcCentré-pointSur1'
		si: 'DrGArcCenterAngleItem ?arc ?c ?x  ?y'
		alors: 'pointSur  ?arc ?x'
		com: 'L''extrémité 1 d''un arc centré est sur l''arc.'.
	e
		lisRegle: 'interface-ArcCentré-pointSur2'
		si: 'DrGArcCenterAngleItem ?arc ?c ?x  ?y'
		alors: 'pointSur  ?arc ?y'
		com:
			' L''extrémité 2 définit l''angle d''ouverture et n''est pas nécessairement sur l''arc'.
	e
		lisRegle: 'interface-SorteDeCercle-pointSur1'
		si: 'sorteDeCercle ?arc ?c ?x  ?y'
		alors: 'pointSur  ?arc ?x'
		com:
			'L''extrémité 1 d''un arc centré est sur l''arc.
Par contre l''extrémité 2 définit l''angle d''ouverture et n''est pas nécessairement sur l''arc'.


	"e lisRegle: 'interface-ArcCenter-pointSurExtrémiéSur droite'
 si:  'DrGArcCenterAngleItem ?arc ?c ?x  ?y
droite ?d ?c ?y
intersection ?p ?d ?arc'

alors: 'pointSur  ?arc ?d'
com: 'L''exrtémité2 d''un arc centré est sur l''arc'."

	e lisRegle: 'interface-Cercle-Rayon'
 si:  'cercle ?c
poinSur ?c ?p
centre  ?c ?o
segment ?s ?o ?p'
alors: 'rayon  ?c ?s'
com: 'Rayon d''un  objet définit comme cercle.'
.	t2 := e creeRegle: 'interface-Droite'.
	t2
		antecedents:
			'DrGLine2ptsItem ?d ?a ?b
ordonneMot:et:rep1:rep2: ?a ?b ?aa ?bb'.
	t2 concl: 'droite ?d ?aa ?bb'.
	t2 com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-DroiteSensDirect'
		si:
			'sorteDeDroite ?d ?x1 ?x2
position ?x1 Avant ?x2 ?d'
		alors: 'sens ?d direct'
		com:
			'Le sens d''une sorte de droite est direct si son parent1 est Avant son parent2.'.
			
	
	e
		lisRegle: 'interface-DroiteSensIndirect'
		si:
			'sorteDeDroite ?d ?x1 ?x2
position ?x1 Après ?x2 ?d'
		alors: 'sens ?d inverse'
		com:
			'Le sens d''une sorte de droite est inverse si son  parent1 Après son parent2.'.
	t2 := e creeRegle: 'interface-sorteDeDroite'.
	t2
		antecedents:
			'DrGLine2ptsItem ?d ?a ?b
ordonneMot:et:rep1:rep2: ?a ?b ?aa ?bb'.
	t2 concl: 'sorteDeDroite ?d ?aa ?bb'.
	t2 com: 'Une droite est une sorte de droite'.
	
	t2 := e creeRegle: 'interface-sorteDeDroiteParallèles'.
	t2 antecedents: 'parallèle ?ppar ?dd ?p
direction ?ppar ?dirPar
direction ?dd ?dirdd	
relationCrée:et:nom: ?dirPar ?dirdd	 parallèle'.
	t2 concl: 'relationCréée?dirPar ?dirdd	 parallèle'.
	t2 com: 'Deux  sorte de droites parallèles'.
	
	t2 := e creeRegle: 'interface-Droite-def'.
	t2 antecedents: 'DrGLine2ptsItem ?d ?a ?b'.
	t2 concl: 'droite ?d'.
	t2 com: 'Qualification d''une  droite'.
	
	t2 := e creeRegle: 'interface-demi-Droite'.
	t2 antecedents: 'DrGRay2ptsItem ?dd ?p1 ?p2'.
	t2 concl: 'demi-droite ?dd ?p1 ?p2'.
	t2 com: 'Qualification d''une  demi-droite'.
	
	t2 := e creeRegle: 'interface-demi-DroitepointSurOr'.
	t2 antecedents: 'demi-droite ?dd ?p1 ?p2'.
	t2 concl: 'pointSur ?dd ?p1'.
	t2
		com: 'L''origine d''une demi-droite est un point de cette demi-droite'.
	t2 := e creeRegle: 'interface-demi-DroitepointSurExt'.
	t2 antecedents: 'demi-droite ?dd ?p1 ?p2'.
	t2 concl: 'pointSur ?dd ?p2'.
	t2
		com:
			'Le point qui définit une demi-droite est un point de cette demi-droite'.
	
	
	t2 := e creeRegle: 'interface-demi-Droite-sorteDeDroiteRéelle'.
	t2 antecedents:
			'DrGRay2ptsItem ?dd ?p1 ?p2'.
	t2 concl: 'sorteDeDroite ?dd ?p1 ?p2'.
	t2 com: 'Une demi-droite est une sorte de droite'.
	
	t2 := e creeRegle: 'interface-Droite-sorteDeDroite-def'.
	t2 antecedents:
			'sorteDeDroite ?dd ?pp1 ?pp2'..
	t2 concl: 'sorteDeDroite ?dd'.
	t2 com: 'Une droite  est une sorte de droite'.
	
	t2 := e creeRegle: 'interface-sorteDeDroite-def'.
	t2 antecedents: 'droite ?d ?a ?b'.
	t2 concl: 'sorteDeDroite ?d'.
	t2 com: 'Définition une sorteDeDroite'.
	
	t2 := e creeRegle: 'interface-demi-Droite-sorteDeDroiteParallèle.def'.
	t2
		antecedents: 
			'parallèle ?par ?p ?d'.
	t2 concl: 'sorteDeDroite ?par ?p ?d'.
	t2 com: 'Une parallèle est une sorte de droite'.
	
	 t2 := e creeRegle: 'interface-demi-Droite-sorteDeDroiteParallèle'.
	t2
		antecedents: 
			'parallèle ?par ?p ?d'.
	t2 concl: 'sorteDeDroite ?par'.
	t2 com: 'Une parallèle est une sorte de droite'.
	t2 := e creeRegle: 'interface-sorteDeDroite-def'.
	t2 antecedents: 'droite ?d ?a ?b'.
	t2 concl: 'sorteDeDroite ?d'.
	t2 com: 'Définition une sorteDeDroite'.
	"t2 := e creeRegle: 'interface-demi-droite-sorteDeDroite-def'.
	t2 antecedents: 'demi-droite ?d ?a ?b'.
	t2 concl: 'sorteDeDroite ?d'.
	t2 com: 'Qualification d''une  sorteDeDroite'."
	t2 := e creeRegle: 'interface-Médiatrice0'.
	t2 antecedents: 'DrGLinePerpendicularBisector2ptsItem ?m ?a ?b'.
	t2 concl: 'médiatrice ?m [ ?a ?b ]'.
	e
		lisRegle: 'interface-sorteDroiteCouple'
		si: 'sorteDeDroite [ ?a ?b ] '
		alors: 'sorteDeDroite   [ ?a ?b ] ?a ?b'
		com:
			'Un couple de points est considéré comme une sorte de droite passant par les points'.
	t2 := e creeRegle: 'interface-Mediatrice-def'.
	t2 antecedents: 'DrGPerpendicularBisectorItem ?s ?a'.
	t2 concl: 'médiatrice ?s'.
	t2 := e creeRegle: 'interface-MediatriceSorteDeDroite-def'.
	t2 antecedents: 'DrGPerpendicularBisectorItem ?s ?a'.
	t2 concl: 'sorteDeDroite ?s'.
	t2 com: 'Qualification d''une sorteDeDroite'.
	t2 := e creeRegle: 'interface-Mediatrice-def0'.
	t2 antecedents: 'DrGLinePerpendicularBisector2ptsItem ?s ?a ?b'.
	t2 concl: 'médiatrice ?s'.
	t2 := e creeRegle: 'interface-MediatriceSorteDedroite-def0'.
	t2 antecedents: 'DrGLinePerpendicularBisector2ptsItem ?s ?a ?b'.
	t2 concl: 'sorteDeDroite ?s'.
	t2 com: 'Qualification d''une sorteDeDroite'.


	"t2 := e creeRegle: 'interface-SorteDeDroiteMediatrice-pointSur'.
t2 antecedents: 'médiatrice ?m
pointSur ?m ?x
pointSur ?m ?y
different:de: ?x ?y'.

t2 concl: 'sorteDeDroite ?m ?x ?y'.
t2 com: 'Une médiatrice est une sorte de droite'."
	t2 := e creeRegle: 'interface-Mediatrice-perpendiculaire'.
	t2
		antecedents:
			'médiatrice ?m ?a ?b
droite ?d ?a ?b'.
	t2 concl: 'perpendiculaire ?m ?d'.
	t2 := e creeRegle: 'interface-Médiatrice-segmentPerp'.
	t2
		antecedents:
			'médiatrice ?m ?a ?b
segment ?s [ ?a ?b ]'.
	t2 concl: 'perpendiculaire ?s ?m'.
	e
		lisRegle: 'interface-DroitePerpendiculaire-enP'
		si:
			'DrGLinePerpendicularItem ?perp1 ?dAB ?p
ordonneMot:et:rep1:rep2:  ?perp1 ?dAB ?p1 ?p2'
		alors: 'perpendiculaire ?p1  ?p2 ?p'
		com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-DroitePerpendiculaire-enP-def1'
		si: 'DrGLinePerpendicularItem ?perp1 ?dAB ?C'
		alors: 'perpendiculaire ?perp1'
		com: 'Lecture d''un fait sur la figure définition'.
	e
		lisRegle: 'interface-DroitePerpendiculaire-enP-def1pointSur'
		si: 'DrGLinePerpendicularItem ?perp1 ?dAB ?C'
		alors: 'pointSur ?perp1 ?C'
		com:
			'Le point qui définit par où passe la perpendiculaire est sur cette perpendiculaire'.
	
	
	ExpertRegle interfacesuite: e! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 11/22/2023 18:37'!
interfaceElectricite: e
	| t2 |
	e
		lisRegle: 'interface-texte1'
		si: 'DrGTextItem ?x ?y ?z ?w'
		alors: '?y ?z   ?w'
		com: 'Donnée sous forme de  texte.'.
	e
		lisRegle: 'interface-texte2'
		si: 'DrGTextItem ?x ?y ?z ?u  ?w'
		alors: '?y ?z ?u  ?w'
		com: 'Donnée sous forme de  texte.'.
	t2 := e creeRegle: 'interface-DrGPointFreeItem'.
	t2 antecedents: 'DrGPointFreeItem  ?p '.
	t2 concl: 'point ?p'.
	t2 com: 'Qualification d''un point'.
	t2 := e creeRegle: 'interface-PointInter-def'.
	t2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	t2 concl: 'point ?p'.
	t2 com: 'Qualification d''un point'.
	t2 := e creeRegle: 'interface-PointInter-defPointSur1'.
	t2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	t2 concl: 'pointSur ?o1 ?p'.
	t2 com: 'Le point d''intersection est sur le premier objet'.
	t2 := e creeRegle: 'interface-PointInter-defPointSur2'.
	t2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	t2 concl: 'pointSur ?o2 ?p'.
	t2 com: 'Le point d''intersection est sur le deuxième objet'.
	t2 := e creeRegle: 'interfacePointSurLigne-def'.
	t2 antecedents: 'DrGPointOncurveItem ?p ?d'.
	t2 concl: 'point ?p'.
	t2 com: 'point sur une ligne'.
	t2 := e creeRegle: 'interface-PointSurLigne-pointSur'.
	t2 antecedents: 'DrGPointOncurveItem ?p ?l'.
	t2 concl: 'pointSur ?l  ?p'.
	t2 com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-Segment'.
	t2
		antecedents:
			'DrGSegment2ptsItem ?s ?x ?y
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy'.
	t2 concl: 'segment ?s [ ?xx ?yy ]'.
	t2 com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-Segment-def'.
	t2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	t2 concl: 'segment ?s'.
	t2 com: 'Qualification d''une sorte de segment.'.
	t2 := e creeRegle: 'interface-SegmentpointSur1'.
	t2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	t2 concl: 'pointSur ?s ?x'.
	t2 com: 'L''origine d''un  segment est un point sur ce segment.'.
	t2 := e creeRegle: 'interface-SegmentpointSur2'.
	t2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	t2 concl: 'pointSur ?s ?y'.
	t2 com: 'L''extrémité d''un  segment est un point sur ce segment.'.
	e
		lisRegle: 'interface-Segment-extremité1'
		si: 'segment ?s [ ?a ?b ]'
		alors: 'point ?a'
		com: 'l''origine d''un segment est un point'.
	e
		lisRegle: 'interface-Segment-extremité2'
		si: 'segment ?s [ ?a ?b ]'
		alors: 'point ?b'
		com: 'la fin  d''un  segment est un point'.
	t2 := e creeRegle: 'interface-SegmentSorteDeDroite-def'.
	t2 antecedents: 'segment ?s'.
	t2 concl: 'sorteDeDroite ?s'.
	t2 com: 'Qualification d''une sorte de droite.'.
	t2 := e creeRegle: 'interface-SegmentSorteDeDroite-def2'.
	t2
		antecedents:
			'segment ?s [ ?xx ?yy ]
different:de: ?xx ?yy'.
	t2 concl: 'sorteDeDroite ?s ?xx ?yy'.
	t2 com: 'Un segment est une sorte de droite.'.
	t2 := e creeRegle: 'interface-SegmentSorteDeSegment-def2'.
	t2 antecedents: 'segment ?s [ ?xx ?yy ]'.
	t2 concl: 'sorteDeSegment ?s [ ?xx ?yy ]'.
	t2 com: 'Un segment est une sorte de segment.'.
	
e
		lisRegle: 'interface-Arc3pts'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc3pts ?a ?p1 ?p2 ?p3'
		com: 'Lecture d''un fait sur la figure: arc de p1'.
	e
		lisRegle: 'interface-sorteDeCercleArc3pts'
		si:
			'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3
trie:rep: [ ?p1 ?p2 ?p3 ] ?rep'
		alors: 'sorteDeCercle ?a [ cerclePar3Points: ?rep'
		com: 'Un arc 3pts est une sorte de cercle par 3 pts'.
	e
		lisRegle: 'interface-Arc3pts-def'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc ?a'
		com: 'Qualification d''un arc'.
	e
		lisRegle: 'interface-Arc3pts-def'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'sorteDeCercle ?a'
		com: 'Qualification d''une sorte de Cercle'.! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 9/5/2025 14:26:34'!
interfacesuite2:e

e    		lisRegle:'pointSur demi-droite'
		si:' demi-droite ?dd ?p1 ?p2
pointSur ?d ?p1
pointSur ?d ?p2
position ?p2 ?pos ?p1 ?d
pointSur ?d ?x
position ?x ?pos ?p1 ?d
different:de: ?x ?p2'
		alors:'pointSur ?dd ?x'
		com:'Un point sur la moitié d''une droite qui est aussi sur une demi-droite'.

e
		lisRegle: 'interface-DroitePerpendiculaire-enP-def2'
		si: 'DrGLinePerpendicularItem ?perp1 ?dAB ?C'
		alors: 'perpendiculaire ?dAB'
		com: 'Lecture d''un fait sur la figure définition'.
	e
		lisRegle: 'interface-DroitePerpendiculaire-SorteDedroite'
		si: 'perpendiculaire ?d'
		alors: 'sorteDeDroite  ?d'
		com: 'Une perpendiculaire est une sorte de droite'.
	e
		lisRegle: 'interface-DroitePerpendiculaire-SorteDedroite2'
		si: 'perpendiculaire ?perp ?d ?p'
		alors: 'sorteDeDroite  ?perp ?d ?p'
		com:
			'Une perpendiculaire  à une droite par un point est une sorte de droite'.
e
		lisRegle: 'interface-sorteDeDroitePerpendiculairesOrdonnées'
		si:
			'DrGLinePerpendicularItem ?perp1 ?dAB ?C
		ordonneMot:et:rep1:rep2  ?perp1 ?dAB  ?x ?y:'
		alors: 'perpendiculaire ?x ?y'
		com: 'Lecture d''un fait sur la figure'.
		
e lisRegle:'interface-pointNégatif'
si: 'point ?x1 ?x2 ?x3
mot:et:rep: ?x2 ?x3 ?x4'
alors: 'point ?x1 ?x4'
com: 'un point négatif avec le - collé au @ '.



"e lisRegle: 'interface-demi-droiteVirtuelleAvant' 
si:  'entre  ?O ?x2 ?x1 ?d
mot:et:rep:  ?O ?x2 ?dd'
alors: 'demi-droite ?dd ?O ?x2'
com: 'L''origine de la droite est avant le parent'.	
		
e lisRegle: 'interface-demi-droiteVirtuelleAprès' 
si:  'entre  ?O ?x1 ?x2 ?d
mot:et:rep:  ?O ?x2 ?dd'
alors: 'demi-droite ?dd ?O ?x2'
com: 'L''origine de la droite est après le parent'.	

e lisRegle: 'interface-demi-droiteVirtuelleAvant' 
si:  'entre  ?O ?x2 ?x1 ?d
mot:et:rep:  ?O ?x1 ?dd'
alors: 'demi-droite ?dd ?O ?x2'
com: 'L''origine de la droite est après le parent'.	

e lisRegle: 'interface-demi-droiteVirtuelleAprèsPremier' 
si:  'pointsSur ?d ?pts
premier:rep: ?pts ?prem
justeAprès:el:rep: ?pts ?prem ?suiv
mot:et:rep:  ?prem ?suiv ?dd'
alors: 'demi-droite ?dd ?prem ?suiv'
com: 'L''origine de la droite est avant le parent'.	

e lisRegle: 'interface-demi-droiteVirtuelleAvantDernier' 
si:  'pointsSur ?d ?pts
dernier:rep: ?pts ?der
justeAvant:el:rep: ?pts ?der ?prec
mot:et:rep:  ?der ?prec ?dd'
alors: 'demi-droite ?dd ?der ?prec'
com: 'L''origine de la droite est après le parent'.	
"
! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 6/7/2025 23:37:09'!
interfacesuite: e
	| t2 |
	e
		lisRegle: 'interface-sorteDeDroitePerpendiculaire-enP2Def'
		si: 'perpendiculaire ?perp1'
		alors: 'sorteDeDroite ?perp1'
		com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-sorteDeDroitePerpendiculaire-fdemienP2DefDroite'
		si: 'perpendiculaire ?perp1'
		alors: 'sorteDeDroite ?perp1'
		com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-Droiteparallèle'.
	t2 antecedents: 'DrGLineParallelItem ?par ?d ?p'.
	t2 concl: 'parallèle ?par ?d ?p'.
	t2 com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-Droiteparallèle-def'
		si: 'DrGLineParallelItem ?Par ?d ?p'
		alors: 'parallèle ?Par'
		com: 'Lecture d''un fait sur la figure'.
	e
		lisRegle: 'interface-Droiteparallèle-def'
		si: 'DrGLineParallelItem ?Par ?d ?p'
		alors: 'droite ?Par'
		com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-Droiteparallèle-defParallele'.
	t2 antecedents: 'parallèle ?Par'.
	t2 concl: 'sorteDeDroite ?Par'.
	t2 com: 'une parallèle est une sorte de droite'.
	t2 := e creeRegle: 'interface-Droiteparallèle-defParalelleDroite'.
	t2
		antecedents:
			'parallèle ?Par
~ segment ?Par'.
	t2 concl: 'droite ?Par'.
	t2 com: 'Qualification d''une droite'.
	t2 := e creeRegle: 'interface-DroiteparallèlePtSur'.
	t2 antecedents: ' DrGLineParallelItem ?Par ?d ?p'.
	t2 concl: 'pointSur ?Par ?p'.
	t2
		com: 'Si une droite parallèle par P alors P est sur la droite parallèle'.
	t2 := e creeRegle: 'interface-MilieuSegment'.
	t2
		antecedents:
			'DrGPointMiddlesegmentItem ?m ?s
segment ?s [ ?x ?y ]'.
	t2 concl: 'milieu [ ?x ?y ]   ?m'.
	t2 com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-Milieu2ptsSegment'.
	t2
		antecedents:
			'milieu ?s ?m
segment ?s  [ ?A ?B ]'.
	t2 concl: 'milieu [ ?A ?B ] ?m'.
	t2
		com:
			'le milieu d''un segment est aussi le milieu du couple définit par le segment'.
	t2 := e creeRegle: 'interface-Milieu2pts'.
	t2
		antecedents:
			'DrGPointMiddle2ptsItem ?I ?A ?B
ordonneMot:et:rep1:rep2: ?A ?B ?AA ?BB'.
	t2 concl: 'milieu [ ?AA ?BB ] ?I'.
	t2 com: 'Milieu d''un couple de points'.
	t2 := e creeRegle: 'interface-Milieu-def'.
	t2 antecedents: 'milieu [ ?A ?B  ]  ?I '.
	t2 concl: 'point  ?I'.
	t2 com: 'Le milieu est un point'.
	"e
		lisRegle: 'interface-intersectionAvecDroite'
		si:
			'droite ?d ?a ?b
intersection  ?p1 ?d ?x1
intersection  ?p2  ?d ?x2
~ segment ?s  [ ?p1 ?p2 ] 
different:de:  ?x1 ?x2
different:de: ?p1 ?p2
mot:et:rep: ?p1 ?p2 ?s'
		alors: 'droite ?d [ ?p1 ?p2 ]'
		com: 'segment  définit par une intersectiion'."
"	e
		lisRegle: 'interface-pointsSurDD'
		si:
			'demi-droite ?dd ?or ?ext
pointSur ?d ?or
pointSur ?d ?ext
pointsSurVirt:droite:rep:  ?dd  ?d  ?x1'
		alors: 'pointsSur ?dd ?x1'
		com:
			'Les points sur une demi-droite dans l''ordre suivant le sens de la droite.'.
"
	e
		lisRegle: 'interface-pointsSur'
		si:
			'sorteDeDroite ?d
pointsSur:rep: ?d ?pts'
		alors: 'pointsSur ?d ?pts'
		com:
			'Les points sur une sorte de droite dans l''ordre suivant le sens de la droite.'.
			
			
	e
		lisRegle: 'interface-ParallèleSens'
		
		
		si:
			'parallèle ?par ?d ?p
sens ?d ?s'
		alors: 'sens ?par ?s'
		com:
			'une parallèle a le même sens que la droite à laquelle elle est parallèle.'.
	e
		lisRegle: 'interface-Mediatrice-defSorte'
		si: 'médiatrice ?s'
		alors: 'sorteDeDroite  ?s'
		com: 'Qualification d''une sorte de droite'.
	"e lisRegle: 'interface-médiatriceMilieu' 
si:  'médiatrice ?m [ ?a ?b ]
mot:et:rep: milieu ?a ?res1
mot:et:rep:  ?res1 ?b  ?mil'
alors: 'milieu ?a ?b ?mil'
 com: 'Définition du point mileu du segment ou du couple de points définissant  la médiatrice'.
"
	e
		lisRegle: 'interface-médiatriceMilieuPointSurCrée'
		si:
			'créeObjets
médiatrice ?m [ ?a ?b ]'
		alors: 'créePointMilieu:Point:et:  ?m ?a ?b'
		com:
			'Le milieu du segment ou du couple de points définissant  la médiatrice est sur la médiatrice.'.
	e
		lisRegle: 'interface-médiatriceMilieuPointSur'
		si:
			'médiatrice ?m [ ?a ?b ]
point ?x
segment ?s
intersection ?p ?m ?s'
		alors: 'pointSur ?m ?p'
		com:
			'Le milieu du segment ou du couple de points définissant  la médiatrice est sur la médiatrice.'.
	t2 := e creeRegle: 'interface-MilieuSegment0'.
	t2
		antecedents:
			'DrGPointMiddlesegmentItem ?I ?s
segment ?s  [ ?A ?B ]'.
	t2 concl: 'milieu [ ?A ?B ] ?I'.
	t2 com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-PointIntersection'.
	t2
		antecedents:
			'DrGPointIntersectionItem ?pt ?L1 ?L2 
ordonneMot:et:rep1:rep2: ?L1 ?L2 ?LL1 ?LL2'.
	t2 concl: 'intersection ?pt ?LL1 ?LL2'.
	t2 com: 'Lecture d''un fait sur la figure'.
	t2 := e creeRegle: 'interface-PointSurLigne'.
	t2 antecedents: 'DrGPointOncurveItem ?pt ?L'.
	t2 concl: 'pointSur  ?L ?pt'.
	t2 com: 'Point sur un élément géométrique'.
	t2 := e creeRegle: 'interface-PointIntersection-pointSur1'.
	t2 antecedents: 'DrGPoint-IntersectionItem ?pt ?L1 ?L2 '.
	t2 concl: 'pointSur  ?L1 ?pt'.
	t2 com: 'Poine intersection sur un élément géométrique'.
	t2 := e creeRegle: 'interface-PointIntersection-pointSur2'.
	t2 antecedents: 'DrGPointIntersectionItem ?pt ?L1 ?L2 '.
	t2 concl: 'pointSur ?L2 ?pt'.
	t2 com: 'Point2 intersection sur un élément géométrique'.
	t2 := e creeRegle: 'interface-PointSur'.
	t2 antecedents: 'DrGLine2ptsItem ?D1 ?A ?B'.
	t2 concl: 'pointSur ?D1 ?A'.
	t2 com: 'Point sur un élément géométrique'.
	t2 := e creeRegle: 'interface-PointSurDroite2'.
	t2 antecedents: 'DrGLine2ptsItem ?D1 ?A ?B'.
	t2 concl: 'pointSur ?D1 ?B'.
	t2 com: 'Point sur un élément géométrique'.

	"t2 := e creeRegle: 'interface-Intersection'.
t2 antecedents: 'pointSur ?o1 ?pt
pointSur ?o2 ?pt
different:de: ?o1 ?o2
ordonneMot:et:rep1:rep2: ?o1 ?o2 ?oo1 ?oo2'.
t2 concl: 'intersection ?pt ?oo1 ?oo2'. 
t2 com: 'Un même point sur deux éléments géométriques => intersection'."
	e
		lisRegle: 'interface-SymCentralePoint'
		si: 'DrGPointSymmetryItem  ?image  ?pt  ?centre'
		alors: 'symetrieCentrale  ?image  ?pt  ?centre'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-SymCentralePoint-def'
		si: 'DrGPointSymmetryItem  ?image  ?pt  ?centre'
		alors: 'point  ?image'
		com: 'Qualification d''un point'.
	e
		lisRegle: 'interface-SymCentraleArc'
		si: 'DrGArcSymmetryItem  ?image  ?pt  ?centre'
		alors: 'symetrieCentrale  ?image  ?pt  ?centre'.
	e
		lisRegle: 'interface-SymCentraleImage'
		si: 'DrGSegmentSymmetryItem  ?image  ?obj  ?centre'
		alors: 'symetrieCentrale  ?image  ?obj  ?centre'.
	e
		lisRegle: 'interface-SymCentraleSegment.def'
		si:
			'DrGSegmentSymmetryItem  ?image  ?seg ?centre
segment ?seg'
		alors: 'segment  ?image'
		com: 'Qualification d''un segment'.
	e
		lisRegle: 'interface-SymCentralePoint.def'
		si:
			'DrGSegmentSymmetryItem  ?image  ?pt  ?centre
point ?pt'
		alors: 'point  ?image'
		com: 'Qualification d''un point'.

	"
t2 := e creeRegle: 'interface-Segments'.
t2 antecedents: 'pointSur ?D ?p1
pointSur ?D ?p2
different:de: ?p1 ?p2
mot:et:rep:  ?p1 ?p2 ?s
mot:et:rep: s ?s ?s2
~ segment ?x ?p1 ?p2'.
t2 concl: 'segment ?s2  ?p1 ?p2 ' "
	e
		lisRegle: 'interface-Homothetie'
		si: 'DrGPointHomothetyItem ?J ?S ?N ?vn ?val'
		alors: 'homothétie ?J ?S ?N ?val'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-DrGSegmentHomothetyItem1'
		si: 'DrGSegmentHomothetyItem ?J ?S ?N ?vn ?val'
		alors: 'homothétie ?J ?S ?N ?val'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-DrGSegmentHomothetyItem-def'
		si: 'DrGSegmentHomothetyItem ?J ?S ?N ?vn ?val'
		alors: 'segment  ?J'
		com: 'Qualification d''un segment'.
	e
		lisRegle: 'interface-DrGSegmentHomothetie-segment'
		si:
			'DrGSegmentHomothetyItem ?J ?S ?N ?vn ?val
segment ?S [ ?a ?b ]
DrGPointHomothetyItem ?aa ?a ?N ?vn ?val
DrGPointHomothetyItem ?bb ?b ?N ?vn ?val
ordonneMot:et:rep1:rep2: ?aa ?bb ?aas ?bbs
'
		alors: 'segment  ?J [ ?aas  ?bbs ]'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-Homothetie-def'
		si: 'DrGPointHomothetyItem ?J ?S ?N ?vn ?val'
		alors: 'point ?J'
		com: 'Qualification d''un point'.
	e
		lisRegle: 'interface-Médiatrice1'
		si:
			'DrGPerpendicularBisectorItem ?d ?s
segment ?s [ ?x ?y ]'
		alors: 'médiatrice ?d [ ?x ?y ]'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-reflexionPoint'
		si: 'DrGPointReflexionItem ?image ?p ?d'
		alors: 'reflexion  ?image ?p ?d'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-reflexionPoin.Axet'
		si: 'DrGPointReflexionItem ?image ?p ?d'
		alors: 'axeSymétrie ?d'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-reflexionPoint-def'
		si: 'DrGPointReflexionItem ?image ?p ?d'
		alors: 'point  ?image'
		com: 'Qualification d''unpoint'.
	e
		lisRegle: 'interface-reflexionSegment'
		si: 'DrGSegmentReflexionItem ?image ?p ?d'
		alors: 'reflexion  ?image ?p ?d'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-bissectrice'
		si: 'DrGAngleBisector3ptsItem ?D ?P1 ?P2 ?P3'
		alors: 'bissectrice  ?D [ ?P1 ?P2 ?P3 ]'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-bissectrice-def0'
		si: 'DrGAngleBisector3ptsItem ?D ?P1 ?P2 ?P3'
		alors: 'bissectrice  ?D'
		com: 'Qualification de la bissectrice'.
	e
		lisRegle: 'interface-bissectrice-droite-def'
		si: 'bissectrice ?D'
		alors: 'sorteDedroite  ?D'
		com: 'Qualification d''une sorte de droite'.
	e
		lisRegle: 'interface-TranslationPoint'
		si: 'DrGPointTranslationItem ?p ?po ?v '
		alors: 'translation point ?p ?po ?v'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-TranslationPoint-def'
		si: 'DrGPointTranslationItem ?p ?po ?v '
		alors: 'point ?p'
		com: 'Qualification d''un point'.
	e
		lisRegle: 'interface-TranslationSegmentPoints'
		si:
			'translation segment ?s ?so ?v 
segment ?so ?ao ?bo 
translation point ?a ?ao ?v
translation point ?b ?bo ?v'
		alors: 'segment ?s [ ?a ?b ]'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-Translation'
		si: 'DrGSegmentTranslationItem ?s ?so ?v '
		alors: 'translation segment ?s ?so ?v'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-PolygoneNbSommets'
		si:
			'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6
couleurPoint:couleur: ?x4 bleu
polyAjouteETNuméroteSommets: ?x1'
		alors: 'polygoneRégulier ?x1 [ nombre_de_sommets: ?x6 ] ]'
		com: 'Un polygone régulier: nombre de sommets, fait de la figure'.
	e
		lisRegle: 'interface-PolygonePointSurPremierSommet'
		si: 'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6'
		alors: 'pointSur ?x1 ?x4'
		com:
			'Le sommet qui définit le  polygone  est sur ce polygone, fait de la figure'.
	e
		lisRegle: 'interface-PolygoneCentre'
		si: 'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6'
		alors: 'polygoneRégulier ?x1 [ centre: ?x3 ] ]'
		com: 'Un polygone régulier: centre, fait de la figure'.
	e
		lisRegle: 'interface-PolygoneIrrégulier'
		si:
			'DrGPolygonNptsItem  ?x1 ?x2
premier:rep:  ?x2 ?p2
dernier:rep: ?x2  ?p1
couples:rep: ?x2 ?res
ajouteDernier:el:rep:  ?res  [  ?p1 ?p2  ] ?res2
'
		alors: 'lignePolygonaleFermée ?res2'
		com:
			'Un polygone irrégulier, est une ligne polygonale fermée , fait de la figure'.
	e
		lisRegle: 'interface-Cercle'
		si: 'DrGCircleRadiusItem  ?x1 ?x2 ?x3 ?x4'
		alors: 'cercle ?x1 ?x2  ?x3 ?x4'.
	e
		lisRegle: 'interface-Cercle-def2'
		si: 'DrGCircleRadiusItem  ?x1 ?x2 ?x3 ?x4'
		alors: 'cercle ?x1'
		com: 'Qualification d''un cercle'.
	e
		lisRegle: 'interface-Cercle-rayon2'
		si:
			'DrGCircleRadiusItem  ?x1 ?x2  ?x3 ?x4
pointSur ?x1 ?p
segment ?s [ ?x2 ?p ]'
		alors: 'rayon ?x1 ?s'.
	e
		lisRegle: 'interface-lieu'
		si: 'DrGLocus2ptsItem ?l  ?pLibre ?pdependant'
		alors: 'lieu ?l  ?pLibre ?pdependant'.
	e
		lisRegle: 'interface-longueurSegment'
		si:
			'DrGValueSegmentlengthItem  ?nom ?val  ?s
segment ?s [ ?a ?b ]
arrondis:rep: ?val ?val2'
		alors: 'mesure [ ?a ?b ] ?val donnée'.
	e
		lisRegle: 'interface-longueurSegment2'
		si:
			'DrGValueSegmentlengthItem  mesure ?nom ?val  ?s
segment ?s [ ?a ?b ]
arrondis:rep: ?val ?val2'
		alors: 'mesure [ ?a ?b ] ?val donnée'.
	e
		lisRegle: 'interface-distancePoints1'
		si:
			'DrGValueDistance2ptsItem mesure ?m ?val ?p1 ?p2
ordonneMot:et:rep1:rep2: ?p1 ?p2 ?pp1  ?pp2'
		alors: 'mesure [ ?pp1 ?pp2 ] ?val donnée'.
	e
		lisRegle: 'interface-ValeurScript'
		si: 'DrGValueScriptItem  ?nom ?val ?a1 ?Val1  ?a2 ?Val2'
		alors: 'valeurScript ?nom ?val  ?a1 ?Val1 ?a2 ?Val2'.
	e
		lisRegle: 'interface-distancePoints2'
		si:
			' DrGValueDistance2ptsItem  ?m ?val ?p1 ?p2
ordonneMot:et:rep1:rep2: ?p1 ?p2 ?pp1  ?pp2'
		alors: 'mesure  [ ?pp1 ?pp2 ] ?val donnée'.
	e
		lisRegle: 'interface-angleOrienté1'
		si: 'DrGAngle3ptsOrientedItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6'
		alors: 'mesure ?x2 ?x3 donnée'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-angleOrienté2'
		si: 'DrGAngle3ptsOrientedItem  ?x1 ?x2 ?x3 ?x4 ?x5'
		alors: 'mesure [ ?x3 ?x4 ?x5 ] ?x2 donnée'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-angleOrienté3'
		si: 'DrGAngle3ptsOrientedItem  ?x1 ?x2 ?x3 ?x4 ?x5'
		alors: 'angleOrienté ?x1  [  ?x3 ?x4 ?x5 ]'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-DrGAngle3ptsItem1'
		si:
			'DrGAngle3ptsItem  ?x1 ?x2 ?x3 ?x4 ?x5
aireTriangleNegative:avec:avec: ?x3 ?x4 ?x5'
		alors: 'mesure [ ?x3 ?x4 ?x5 ] ?x2 donnée'.
	e
		lisRegle: 'interface-DrGAngle3ptsItem2'
		si:
			'DrGAngle3ptsItem  ?x1 ?x2 ?x3 ?x4 ?x5
aireTrianglePositive:avec:avec: ?x3 ?x4 ?x5'
		alors: 'mesure [ ?x5 ?x4 ?x3 ] ?x2 donnée'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-DrGAngle3ptsItem3'
		si: 'DrGAngle3ptsItem  ?x1 ?x2 ?x3 ?x4 ?x5'
		alors: 'angle ?x1 [ ?x3 ?x4 ?x5 ]'
		com: 'Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-demi-droite'
		si: 'DrGRay2ptsItem ?dd  ?pOrig ?y ?p'
		alors: 'demi-droite  ?dd  ?pOrig   ?y ?p'
		com: 'définition d''une demi-droite, Lecture d''un fait de la figure'.
	e
		lisRegle: 'interface-demi-droite-def0'
		si: 'demi-droite  ?dd  ?pOrig   ?y'
		alors: 'demi-droite  ?dd'
		com: 'Qualification d''une demi-droite'.
	e
		lisRegle: 'interface-pointTranslaté'
		si: 'translation  ?x1 ?x2 ?x3 ?x4'
		alors: 'point ?x2'
		com: 'L''image d''un point par translation est un point. '.
		
	e
		lisRegle: 'interface-pointXY'
		si: 'point ?x1 ?x2
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y'
		alors: 'point ?x1  x= ?x y= ?y'
		com: 'Les coordonnées d''un point'.
		
		e
		lisRegle: 'interface-pointPos'
		si: 'point ?x1
point:rep: ?x1 ?pos'
		alors: 'point ?x1 ?pos'
		com: 'La position (point) d''un point'.
		
e lisRegle: 'interface-demi-droite1PlusPrèsAvant' 
si:  'demi-droite ?i
pointsSur:rep: ?d ?l
justeAvant:el:rep: ?l1 ?i ?res1
mot:et:rep: ?i ?res1 ?nom1'
alors: 'demi-droite ?nom1 ?i ?res1'.

e lisRegle: 'interface-demi-droite1PlusPrèsAprès' 
si:  'demi-droite ?i
pointsSur:rep: ?d ?l
justeAprès:el:rep: ?l1 ?i ?res1
mot:et:rep: ?i ?res1 ?nom1'
alors: 'demi-droite ?nom1 ?i ?res1'.
		 
e lisRegle: 'interface-demi-droite1' 
si:  'intersection ?i ?d1 ?d2
droite ?d1
droite ?d2
pointsSur:rep: ?d1 ?l1
justeAvant:el:rep: ?l1 ?i ?res1
mot:et:rep: ?i ?res1 ?nom1'
alors: 'demi-droite ?nom1 ?i ?res1'
com: 'Demi-droite sur une droite'.

e lisRegle: 'interface-demi-droite2' 
si:  'intersection ?i ?d1 ?d2
droite ?d1
droite ?d2
pointsSur:rep: ?d2 ?l2
justeAvant:el:rep: ?l2 ?i ?res2
mot:et:rep: ?i ?res2 ?nom2'
alors: 'demi-droite ?nom2 ?i ?res2'
com: 'Demi-droite sur une droite'.

e lisRegle: 'interface-demi-droite3' 
si:  'intersection ?i ?d1 ?d2
droite ?d1
droite ?d2
pointsSur:rep: ?d1 ?l1
justeAprès:el:rep: ?l1 ?i ?res1
mot:et:rep: ?i ?res1 ?nom1'
alors: 'demi-droite ?nom1 ?i ?res1'
com: 'Demi-droite sur une droite'.

e lisRegle: 'interface-demi-droite4' 
si:  'intersection ?i ?d1 ?d2
droite ?d1
droite ?d2
pointsSur:rep: ?d2 ?l2
justeAprès:el:rep: ?l2 ?i ?res2
mot:et:rep: ?i ?res2 ?nom2'
alors: 'demi-droite ?nom2 ?i ?res2'
com: 'Demi-droite sur une droite'.

"e lisRegle: 'interface-demi-droitePointSurAprés' 
si:  'demi-droite ?dd ?or ?parent
pointSur ?d ?or
pointSur ?d ?p
position ?p Après ?parent ?dd
different:de: ?or ?p
different:de: parent ?p
'
alors: 'pointSur ?dd ?p'
com: 'Un point sur la droite qui après le parent d''une demi-droite est aussi sur la demi-droite'."



			
ExpertRegle interfacesuite2: e.! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 10/31/2024 23:28:48'!
isometrieOld: e
	| r |
	"Angles"
	e
		lisRegle: 'isométrie-milieu'
		si:
			'milieu [ ?x ?y ] ?m
relationCrée:et:nom:  [ ?x ?m ] [ ?y ?m ] isométrique '
		alors: 'relationCréée  [ ?x ?m ] [ ?y ?m ] isométrique'
		com:
			'Le segmentqui relie l''origine d''un segment à son milieu est isométrique au segment qui relie son milieu à son extrémité.'.
	e
		lisRegle: 'isométrie-AlternesInternes'
		si: 'angle ?a1 [  alterneInterne: ?a2 ]'
		alors: 'isométrique ?a1 ?a2'
		com: 'Des angles Alternes Internes sont isométriques'.
	e
		lisRegle: 'isométrie-AlternesExternes'
		si: 'angle ?a1 [  alterneExterne: ?a2 ]'
		alors: 'isométrique ?a1 ?a2'
		com: 'Des angles Alternes Internes sont isométriques'.

	"Segment"
	"	e
		lisRegle: 'isométrie-segmentsCouplesIsométriques'
		si:
			'segment ?s1 [ ?a1 ?a2 ]
segment ?s2  [ ?b1 ?b2 ]
ordonneMot:et:rep1:rep2: [ ?a1 ?a2 ] [ ?b1 ?b2 ] [ ?a1 ?a2 ] [ ?b1 ?b2 ]
relation:et:nom:  [ ?a1 ?a2 ] [ ?b1 ?b2 ] isométrique
different:de: ?s1 ?s2
relationCrée:et:nom: ?s1 ?s2 isométrique'
		alors: 'relationCréée ?s1 ?s2 isométrique'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'."
	"
	e
		lisRegle: 'isométrie-segmentsCouplesIsométriques2'
		si:
			'segment ?s1 [ ?a2 ?a1 ]
segment ?s2  [ ?b1 ?b2 ]
relation:et:nom:  [ ?a1 ?a2 ] [ ?b1 ?b2 ] isométrique
relationCrée:et:nom:  ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'relation segments_couples_isométrique isométriques ?s1 ?s2  créée'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'.
	e
		lisRegle: 'isométrie-segmentsCouplesIsométriques3'
		si:
			'segment ?s1 [ ?a1 ?a2 ]
segment ?s2  [ ?b2 ?b1 ]
relation:et:nom:  [ ?a1 ?a2 ] [ ?b1 ?b2 ] isométrique
relationCrée:et:nom:  ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'relation segments_couples_isométrique ?s1 ?s2  isométriques créée'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'.
	e
		lisRegle: 'isométrie-segmentsCouplesIsométriques4'
		si:
			'segment ?s1 [ ?a2 ?a1 ]
segment ?s2  [ ?b2 ?b1 ]
relation:et:nom:  [ ?a1 ?a2 ] [ ?b1 ?b2 ] isométrique
relationCrée:et:nom:  ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'relation segments_couples_isométrique ?s1 ?s2  isométriques créée'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'.


	
"
	"	e
		lisRegle: 'isométrie-segments->CouplesIsométriques'
		si:
			'segment ?s1 [ ?a1 ?a2 ]
segment ?s2  [ ?b2 ?a2 ]
relation:et:nom:  ?s1 ?s2 isométrique
relationCrée:et:nom:  [ ?a1 ?a2 ] [ ?b2 ?a2 ] isométrique
different:de: ?s1 ?s2'
		alors: 'relationCréée  ?s1 ?s2 isométrique'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'."
	"
	e
		lisRegle: 'isométrie-segmentsIsocèles'
		si:
			'adjacent  ?s1 ?s2 ?a ?b ?c
médiatrice ?m   End of statement list encountered ->[ ?a ?c ]
pointSur ?m ?b'
		alors: 'isométrique ?s1 ?s2'
		com:
			'La médiatrice de deux points est l''ensemble des points à égale distance de ces deux points.
Des segments adjacents dont le sommet est sur la médiatrice de leur autre extrémité sont isométriques.'.
	
	e
		lisRegle: 'isométrie-segmentsIsocèles2'
		si:
			'adjacent  ?s1 ?s2 ?a ?b ?c
médiatrice ?m  [ ?a ?c ]
pointSur ?m ?b'
		alors: 'isométrique [ ?a ?b ] [ ?b ?c ]'
		com:
			'Des couples adjacents dont le sommet est sur la médiatrice de leur autre extrémité sont isométriques.'.
			
				e
		lisRegle: 'isométrie-segmentsIsocèles2rec'
		si:
			'adjacent  ?s1 ?s2 ?a ?b ?c
médiatrice ?m  [ ?c ?a ]
pointSur ?m ?b'
		alors: 'isométrique [ ?a ?b ] [ ?b ?c ]'
		com:
			'Des couples adjacents dont le sommet est sur la médiatrice de leur autre extrémité sont isométriques.'."
	e
		lisRegle: 'isométrie-CoupleExplicite'
		si:
			'relation isométrique explicite
point ?x
point ?y
point ?o
relation:et:nom: [ ?o ?x ] [ ?o ?y ] isométrique
ordonneMot:et:rep1:rep2:  [ ?o ?x ] [ ?o ?y ]  [ ?o ?x ] [ ?o ?y ]
different:de:  [ ?o ?x ] [ ?o ?y ]'
		alors: 'isométrique  [ ?o ?x ] [ ?o ?y ] '.
	e
		lisRegle: 'isométrie-SegmentExplicite'
		si:
			'relation isométrique explicite
segment ?s1
segment ?s2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
relation:et:nom: ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'isométrique  ?ss1 ?ss2'.	"
	e
		lisRegle: 'isométrie-SegmentIsométriques'
		si:
			'segment ?s1 [ ?x1 ?x2 ]
segment ?s2 [ ?y1 ?y2 ]
relation:et:nom:  [ ?x1 ?x2 ]  [ ?y1 ?y2 ] isométrique
different:de: ?s1 ?s2
relationCrée:et:nom ?s1 ?s2 isométrique'
		alors: 'isométrique créée'.

	"
	e
		lisRegle: 'isométrie-SegmentsParallèles1'
		si:
			'segment  ?x2 [  ?a ?b ] 
segment  ?x3 [  ?a ?d ] 
 intersection  ?x1 ?x2 ?x3
parallèle ?x4 ?x3
parallèle ?x5 ?x2
intersection ?c ?x4 ?x5'
		alors: 'isométrique [ ?a ?b ] [ ?c ?d ]'.
	e
		lisRegle: 'isométrie-SegmentsParallèles2'
		si:
			'segment  ?x2 [  ?a ?b ] 
segment  ?x3 [  ?a ?d ] 
 intersection  ?x1 ?x2 ?x3
parallèle ?x4 ?x3
parallèle ?x5 ?x2
intersection ?c ?x4 ?x5'
		alors: 'isométrique [ ?a ?d ] [ ?b ?c ]'.
	"
	e
		lisRegle: 'isométrie-cercleDéfiniParRayon'
		si:
			'DrGCircle2ptsItem ?c ?b ?a
DrGCircleSegmentItem  ?x1 ?x2 ?x3
segment ?x3 [ ?b ?a ]
segment  ?c ?r1
segment ?x1 ?r2
relationCrée:et:nom: ?r1 ?r2 isométrique'
		alors: 'isométrique cercleDéfiniParRayon ?r1 ?r2 crée'
		com:
			'Le rayon d''un cercle défini par son centre et un segment est isométrique à ce segment'.
	e
		lisRegle: 'isométrie-cercleDéfiniParRayonExplicite'
		si:
			'relation isométrique explicite
			
DrGCircle2ptsItem ?c ?b ?a
DrGCircleSegmentItem  ?x1 ?x2 ?x3
segment ?x3 [ ?b ?a ]
segment  ?c ?r1
segment ?x1 ?r2'
		alors: 'isométrique ?r1 ?r2'
		com:
			'Le rayon d''un cercle défini par son centre et un segment est isométrique à ce segment'.

	symétrieCentrale
	e
		lisRegle: 'isométrie-SymCentraleSegments1'
		si:
			'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
ordonneMot:et:rep1:rep2: ?A ?B ?AA ?BB
ordonneMot:et:rep1:rep2: ?C ?D ?CC ?DD
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?DD ?BB
different:de: ?CC ?AA'
		alors: 'isométrique [ ?AA ?BB ] [ ?CC ?DD ]'.

	"
	e
		lisRegle: 'isométrie-SymCentraleSegments2'
		si:
			'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
ordonneMot:et:rep1:rep2: ?A ?B ?AA ?BB
ordonneMot:et:rep1:rep2: ?C ?D ?CC ?DD
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'isométrique [ ?B ?C ] [ ?A  ?D ]'.
	e
		lisRegle: 'isométrie-SymCentraleSegmentsparallèles1'
		si:
			'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'parallèle [ ?B ?C ] [ ?A  ?D ]'.
	e
		lisRegle: 'isométrie-SymCentraleSegmentsparallèles2'
		si:
			'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'parallèle [ ?A ?B ] [ ?C  ?D ]'.

	"symétrieAxiale"
	e
		lisRegle: 'isométries-réflexion'
		si:
			'segment [  ?x ?y ]
reflexion ?xi ?x ?axe
reflexion ?yi ?y ?axe'
		alors: 'isométrique [ ?x ?y ] [ ?xi  ?yi ]'
		com:
			'L''image d''un segment par symértie axiale est isométrique au segment'.

	"r =e creeRegle: 'isométries-Transitivite'.
r antecedents: 'isométrique ?x ?y
isométrique ?y ?z
different:de: ?x ?z'.

r concl: 'isométrique ?x ?z'.
r com: 'Transitivité de la relation  isométrique: Si isométrique x y et isométrique y z alors isométrique x z'.



	"
	r := e creeRegle: 'isométries-RetireQuantitésEgales1'.
	r
		antecedents:
			'somme ?x ?y ?z
somme ?m ?n ?o
isométrique ?y ?n
'.
	r concl: 'isométrique ?x ?m'.
	r := e creeRegle: 'isométries-RetireQuantitésEgales2'.
	r
		antecedents:
			'somme ?x ?y ?z
somme ?m ?n ?o
isométrique ?x ?m
'.
	r concl: 'isométrique ?y ?n'.
	"	r := e creeRegle: 'isométries-SommeSegments'.
	r
		antecedents:
			'droite ?d ?a ?b
segment ?s1 [ ?x ?y ]
segment ?s2 [ ?y ?z ]
segment ?s3 [ ?x ?z ]
pointSur ?d ?x
pointSur ?d ?y
pointSur ?d ?z
'.
	r concl: 'somme ?s1 ?s2 ?s3'."
	"
	e
		lisRegle: 'isométries-mediatrice'
		si:
			'médiatrice ?m ?a ?b
pointSur ?m ?p
segment  [ ?p ?a ]
segment   [ ?b ?p2 ]'
		alors: 'isométrique [ ?p ?a ] [ ?b ?p ]'.
	e
		lisRegle: 'isométrie-triangleIsocele1'
		si:
			'triangle ?t [ sommets: ?a ?b ?c ]
triangle ?t [ isocele de sommet ?a ]
segment ?s1  [ ?c ?a ]
segment ?s2  [ ?b  ?a ]'
		alors: 'isométrique ?s1  ?s2'.
	e
		lisRegle: 'isométrie-triangleIsocele3'
		si:
			'triangle ?t [ sommets: ?a ?b ?c ]
triangle ?t [ isocele de sommet ?c ]
segment ?s1  [ ?a ?c ]
segment ?s2  [ ?b  ?c ]'
		alors: 'isométrique ?s1  ?s2'.
	e
		lisRegle: 'isométrie-translationSegment'
		si: 'translation segment ?s [ ?so ?v ]'
		alors: 'isométrique ?s ?so'.
	"
	e
		lisRegle: 'isométrie-RayonExplicite'
		si:
			'relation isométrique explicite
cercle ?c [  rayon: [ ?x1 ?y1 ] ] 
cercle ?c [ rayon: [ ?x2 ?y2 ] ]
different:de: ?y1 ?y2'
		alors: 'isométrique [ ?x1 ?y1 ] [ ?x2 ?y2 ]'
		com: 'Les rayons d''un même cercle sont isométriques'.
	e
		lisRegle: 'isométrie-RayonRelationSegments'
		si:
			'cercle ?c [  rayon: ?x1 ] 
cercle ?c [ rayon: ?x2 ] 
segment ?x1
segment ?x2
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2
relationCrée:et:nom: ?xx1 ?xx2 isométrique
different:de: ?x1 ?x2'
		alors: 'relationCréée  ?xx1 ?xx2 isométrique'
		com: 'Les rayons d''un même cercle sont isométriques'.
	e
		lisRegle: 'isométrie-RayonCouple'
		si:
			'cercle ?c [  rayon: [ ?x1 ?x2 ]  ] 
cercle ?c [ rayon: [ ?x3 ?x4 ]  ]
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2
ordonneMot:et:rep1:rep2: ?x3 ?x4 ?xx3 ?xx4 
ordonneMot:et:rep1:rep2: [ ?xx1 ?xx2 ] [ ?xx3 ?xx4 ]  ?r1 ?r2
relationCrée:et:nom: ?r1 ?r2 isométrique
different:de: [ ?x1 ?x2 ] [ ?x3 ?x4 ]'
		alors: 'relationCréée   ?r1 ?r2 isométrique'
		com: 'Les rayons d''un même cercle sont isométriques'.
	e
		lisRegle: 'isométrie-triangleIsocèle'
		si:
			'triangle ?t1  [ isocèle: [ sommet: ?s1  ] ]
triangle ?t1 [ sommets: ?som1 ]
enleverDe:el:rep: ?som1 ?s1 ?r1
triangle ?t2  [ isocèle: [ sommet: ?s2  ] ]
triangle ?t2 [ sommets: ?som2 ]
enleverDe:el:rep: ?som2 ?s2 ?r2
different:de: ?t1 ?t2
ordonneMot:et:rep1:rep2: ?t1 ?t2 ?t1 ?t2
relation:et:nom: ?r1 ?r2 isométrique'
		alors: 'isométrique ?t1 ?t2'
		com:
			'Deux triangles isocèles de sommets s1 s2 sont isométriques si les côtés opposés aux sommets sont isométriques'.
	e
		lisRegle: 'isométrie-anglesTriangle1'
		si:
			'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?c2 ?a2 ?b2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [  ?a1 ?b1 ?c1 ]   [ ?a2 ?b2 ?c2 ]  ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [  ?a1 ?b1 ?c1 ] [  ?b2 ?c2 ?a2  ]'
		com:
			'Des triangles isométriques on leurs angles correspondants isométriques'.
	e
		lisRegle: 'isométrie-anglesTriangle2'
		si:
			'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?a2 ?b2 ?c2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [   ?c1 ?a1 ?b1 ]   [ ?c2 ?a2 ?b2  ]  ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [  ?ang1 ] [  ?ang2 ]'
		com:
			'Des triangles isométriques on leurs angles correspondants isométriques'.
	e
		lisRegle: 'isométrie-anglesTriangle3'
		si:
			'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?a2 ?b2 ?c2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [  ?b1 ?c1 ?a1  ]    [ ?b2 ?c2 ?a2  ] ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [ ?ang1 ] [  ?ang2 ]'! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 10/31/2024 23:36:08'!
isometrieRegles: e
	| r |
	"Angles"
	e
		lisRegle: 'isométrie-milieu'
		si:
			'milieu [ ?x ?y ] ?m
relationCrée:et:nom:  [ ?x ?m ] [ ?y ?m ] isométrique '
		alors: 'relationCréée  [ ?x ?m ] [ ?y ?m ] isométrique'
		com:
			'Le segmentqui relie l''origine d''un segment à son milieu est isométrique au segment qui relie son milieu à son extrémité.'.
	e
		lisRegle: 'isométrie-AlternesInternes'
		si: 'angle ?a1 [  alterneInterne: ?a2 ]'
		alors: 'isométrique ?a1 ?a2'
		com: 'Des angles Alternes Internes sont isométriques'.
	e
		lisRegle: 'isométrie-AlternesExternes'
		si: 'angle ?a1 [  alterneExterne: ?a2 ]'
		alors: 'isométrique ?a1 ?a2'
		com: 'Des angles Alternes Internes sont isométriques'.

	"Segment"
	"	e
		lisRegle: 'isométrie-segmentsCouplesIsométriques'
		si:
			'segment ?s1 [ ?a1 ?a2 ]
segment ?s2  [ ?b1 ?b2 ]
ordonneMot:et:rep1:rep2: [ ?a1 ?a2 ] [ ?b1 ?b2 ] [ ?a1 ?a2 ] [ ?b1 ?b2 ]
relation:et:nom:  [ ?a1 ?a2 ] [ ?b1 ?b2 ] isométrique
different:de: ?s1 ?s2
relationCrée:et:nom: ?s1 ?s2 isométrique'
		alors: 'relationCréée ?s1 ?s2 isométrique'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'."
	"
	e
		lisRegle: 'isométrie-segmentsCouplesIsométriques2'
		si:
			'segment ?s1 [ ?a2 ?a1 ]
segment ?s2  [ ?b1 ?b2 ]
relation:et:nom:  [ ?a1 ?a2 ] [ ?b1 ?b2 ] isométrique
relationCrée:et:nom:  ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'relation segments_couples_isométrique isométriques ?s1 ?s2  créée'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'.
	e
		lisRegle: 'isométrie-segmentsCouplesIsométriques3'
		si:
			'segment ?s1 [ ?a1 ?a2 ]
segment ?s2  [ ?b2 ?b1 ]
relation:et:nom:  [ ?a1 ?a2 ] [ ?b1 ?b2 ] isométrique
relationCrée:et:nom:  ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'relation segments_couples_isométrique ?s1 ?s2  isométriques créée'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'.
	e
		lisRegle: 'isométrie-segmentsCouplesIsométriques4'
		si:
			'segment ?s1 [ ?a2 ?a1 ]
segment ?s2  [ ?b2 ?b1 ]
relation:et:nom:  [ ?a1 ?a2 ] [ ?b1 ?b2 ] isométrique
relationCrée:et:nom:  ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'relation segments_couples_isométrique ?s1 ?s2  isométriques créée'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'.


	
"
	"	e
		lisRegle: 'isométrie-segments->CouplesIsométriques'
		si:
			'segment ?s1 [ ?a1 ?a2 ]
segment ?s2  [ ?b2 ?a2 ]
relation:et:nom:  ?s1 ?s2 isométrique
relationCrée:et:nom:  [ ?a1 ?a2 ] [ ?b2 ?a2 ] isométrique
different:de: ?s1 ?s2'
		alors: 'relationCréée  ?s1 ?s2 isométrique'
		com:
			'Si les extrémités de deux segments sont des couples isométriques, alors les segments sont isométriques.'."
	"
	e
		lisRegle: 'isométrie-segmentsIsocèles'
		si:
			'adjacent  ?s1 ?s2 ?a ?b ?c
médiatrice ?m   End of statement list encountered ->[ ?a ?c ]
pointSur ?m ?b'
		alors: 'isométrique ?s1 ?s2'
		com:
			'La médiatrice de deux points est l''ensemble des points à égale distance de ces deux points.
Des segments adjacents dont le sommet est sur la médiatrice de leur autre extrémité sont isométriques.'.
	
	e
		lisRegle: 'isométrie-segmentsIsocèles2'
		si:
			'adjacent  ?s1 ?s2 ?a ?b ?c
médiatrice ?m  [ ?a ?c ]
pointSur ?m ?b'
		alors: 'isométrique [ ?a ?b ] [ ?b ?c ]'
		com:
			'Des couples adjacents dont le sommet est sur la médiatrice de leur autre extrémité sont isométriques.'.
			
				e
		lisRegle: 'isométrie-segmentsIsocèles2rec'
		si:
			'adjacent  ?s1 ?s2 ?a ?b ?c
médiatrice ?m  [ ?c ?a ]
pointSur ?m ?b'
		alors: 'isométrique [ ?a ?b ] [ ?b ?c ]'
		com:
			'Des couples adjacents dont le sommet est sur la médiatrice de leur autre extrémité sont isométriques.'."
	e
		lisRegle: 'isométrie-CoupleExplicite'
		si:
			'relation isométrique explicite
point ?x
point ?y
point ?o
relation:et:nom: [ ?o ?x ] [ ?o ?y ] isométrique
ordonneMot:et:rep1:rep2:  [ ?o ?x ] [ ?o ?y ]  [ ?o ?x ] [ ?o ?y ]
different:de:  [ ?o ?x ] [ ?o ?y ]'
		alors: 'isométrique  [ ?o ?x ] [ ?o ?y ] '.
	e
		lisRegle: 'isométrie-SegmentExplicite'
		si:
			'relation isométrique explicite
segment ?s1
segment ?s2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
relation:et:nom: ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'isométrique  ?ss1 ?ss2'.	"
	e
		lisRegle: 'isométrie-SegmentIsométriques'
		si:
			'segment ?s1 [ ?x1 ?x2 ]
segment ?s2 [ ?y1 ?y2 ]
relation:et:nom:  [ ?x1 ?x2 ]  [ ?y1 ?y2 ] isométrique
different:de: ?s1 ?s2
relationCrée:et:nom ?s1 ?s2 isométrique'
		alors: 'isométrique créée'.

	"
	e
		lisRegle: 'isométrie-SegmentsParallèles1'
		si:
			'segment  ?x2 [  ?a ?b ] 
segment  ?x3 [  ?a ?d ] 
 intersection  ?x1 ?x2 ?x3
parallèle ?x4 ?x3
parallèle ?x5 ?x2
intersection ?c ?x4 ?x5'
		alors: 'isométrique [ ?a ?b ] [ ?c ?d ]'.
	e
		lisRegle: 'isométrie-SegmentsParallèles2'
		si:
			'segment  ?x2 [  ?a ?b ] 
segment  ?x3 [  ?a ?d ] 
 intersection  ?x1 ?x2 ?x3
parallèle ?x4 ?x3
parallèle ?x5 ?x2
intersection ?c ?x4 ?x5'
		alors: 'isométrique [ ?a ?d ] [ ?b ?c ]'.
	"
	e
		lisRegle: 'isométrie-cercleDéfiniParRayon'
		si:
			'DrGCircle2ptsItem ?c ?b ?a
DrGCircleSegmentItem  ?x1 ?x2 ?x3
segment ?x3 [ ?b ?a ]
segment  ?c ?r1
segment ?x1 ?r2
relationCrée:et:nom: ?r1 ?r2 isométrique'
		alors: 'isométrique cercleDéfiniParRayon ?r1 ?r2 crée'
		com:
			'Le rayon d''un cercle défini par son centre et un segment est isométrique à ce segment'.
	e
		lisRegle: 'isométrie-cercleDéfiniParRayonExplicite'
		si:
			'relation isométrique explicite
			
DrGCircle2ptsItem ?c ?b ?a
DrGCircleSegmentItem  ?x1 ?x2 ?x3
segment ?x3 [ ?b ?a ]
segment  ?c ?r1
segment ?x1 ?r2'
		alors: 'isométrique ?r1 ?r2'
		com:
			'Le rayon d''un cercle défini par son centre et un segment est isométrique à ce segment'.

	symétrieCentrale
	e
		lisRegle: 'isométrie-SymCentraleSegments1'
		si:
			'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
ordonneMot:et:rep1:rep2: ?A ?B ?AA ?BB
ordonneMot:et:rep1:rep2: ?C ?D ?CC ?DD
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?DD ?BB
different:de: ?CC ?AA'
		alors: 'isométrique [ ?AA ?BB ] [ ?CC ?DD ]'.

	"
	e
		lisRegle: 'isométrie-SymCentraleSegments2'
		si:
			'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
ordonneMot:et:rep1:rep2: ?A ?B ?AA ?BB
ordonneMot:et:rep1:rep2: ?C ?D ?CC ?DD
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'isométrique [ ?B ?C ] [ ?A  ?D ]'.
	e
		lisRegle: 'isométrie-SymCentraleSegmentsparallèles1'
		si:
			'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'parallèle [ ?B ?C ] [ ?A  ?D ]'.
	e
		lisRegle: 'isométrie-SymCentraleSegmentsparallèles2'
		si:
			'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'parallèle [ ?A ?B ] [ ?C  ?D ]'.

	"symétrieAxiale"
	e
		lisRegle: 'isométrie-réflexion'
		si:
			'segment [  ?x ?y ]
reflexion ?xi ?x ?axe
reflexion ?yi ?y ?axe'
		alors: 'isométrique [ ?x ?y ] [ ?xi  ?yi ]'
		com:
			'L''image d''un segment par symértie axiale est isométrique au segment'.

	"r =e creeRegle: 'isométrie-Transitivite'.
r antecedents: 'isométrique ?x ?y
isométrique ?y ?z
different:de: ?x ?z'.

r concl: 'isométrique ?x ?z'.
r com: 'Transitivité de la relation  isométrique: Si isométrique x y et isométrique y z alors isométrique x z'.



	"
	r := e creeRegle: 'isométrie-RetireQuantitésEgales1'.
	r
		antecedents:
			'somme ?x ?y ?z
somme ?m ?n ?o
isométrique ?y ?n
'.
	r concl: 'isométrique ?x ?m'.
	r := e creeRegle: 'isométrie-RetireQuantitésEgales2'.
	r
		antecedents:
			'somme ?x ?y ?z
somme ?m ?n ?o
isométrique ?x ?m
'.
	r concl: 'isométrique ?y ?n'.
	"	r := e creeRegle: 'isométrie-SommeSegments'.
	r
		antecedents:
			'droite ?d ?a ?b
segment ?s1 [ ?x ?y ]
segment ?s2 [ ?y ?z ]
segment ?s3 [ ?x ?z ]
pointSur ?d ?x
pointSur ?d ?y
pointSur ?d ?z
'.
	r gconcl: 'somme ?s1 ?s2 ?s3'."
	"
	e
		lisRegle: 'isométrie-mediatrice'
		si:
			'médiatrice ?m ?a ?b
pointSur ?m ?p
segment  [ ?p ?a ]
segment   [ ?b ?p2 ]'
		alors: 'isométrique [ ?p ?a ] [ ?b ?p ]'.
	e
		lisRegle: 'isométrie-triangleIsocele1'
		si:
			'triangle ?t [ sommets: ?a ?b ?c ]
triangle ?t [ isocele de sommet ?a ]
segment ?s1  [ ?c ?a ]
segment ?s2  [ ?b  ?a ]'
		alors: 'isométrique ?s1  ?s2'.
	e
		lisRegle: 'isométrie-triangleIsocele3'
		si:
			'triangle ?t [ sommets: ?a ?b ?c ]
triangle ?t [ isocele de sommet ?c ]
segment ?s1  [ ?a ?c ]
segment ?s2  [ ?b  ?c ]'
		alors: 'isométrique ?s1  ?s2'.
	e
		lisRegle: 'isométrie-translationSegment'
		si: 'translation segment ?s [ ?so ?v ]'
		alors: 'isométrique ?s ?so'.
	"
	e
		lisRegle: 'isométrie-RayonExplicite'
		si:
			'relation isométrique explicite
cercle ?c [  rayon: [ ?x1 ?y1 ] ] 
cercle ?c [ rayon: [ ?x2 ?y2 ] ]
different:de: ?y1 ?y2'
		alors: 'isométrique [ ?x1 ?y1 ] [ ?x2 ?y2 ]'
		com: 'Les rayons d''un même cercle sont isométriques'.
	e
		lisRegle: 'isométrie-RayonRelationSegments'
		si:
			'cercle ?c [  rayon: ?x1 ] 
cercle ?c [ rayon: ?x2 ] 
segment ?x1
segment ?x2
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2
relationCrée:et:nom: ?xx1 ?xx2 isométrique
different:de: ?x1 ?x2'
		alors: 'relationCréée  ?xx1 ?xx2 isométrique'
		com: 'Les rayons d''un même cercle sont isométriques'.
	e
		lisRegle: 'isométrie-RayonCouple'
		si:
			'cercle ?c [  rayon: [ ?x1 ?x2 ]  ] 
cercle ?c [ rayon: [ ?x3 ?x4 ]  ]
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2
ordonneMot:et:rep1:rep2: ?x3 ?x4 ?xx3 ?xx4 
ordonneMot:et:rep1:rep2: [ ?xx1 ?xx2 ] [ ?xx3 ?xx4 ]  ?r1 ?r2
relationCrée:et:nom: ?r1 ?r2 isométrique
different:de: [ ?x1 ?x2 ] [ ?x3 ?x4 ]'
		alors: 'relationCréée   ?r1 ?r2 isométrique'
		com: 'Les rayons d''un même cercle sont isométriques'.
	e
		lisRegle: 'isométrie-triangleIsocèle'
		si:
			'triangle ?t1  [ isocèle: [ sommet: ?s1  ] ]
triangle ?t1 [ sommets: ?som1 ]
enleverDe:el:rep: ?som1 ?s1 ?r1
triangle ?t2  [ isocèle: [ sommet: ?s2  ] ]
triangle ?t2 [ sommets: ?som2 ]
enleverDe:el:rep: ?som2 ?s2 ?r2
different:de: ?t1 ?t2
ordonneMot:et:rep1:rep2: ?t1 ?t2 ?t1 ?t2
relation:et:nom: ?r1 ?r2 isométrique'
		alors: 'isométrique ?t1 ?t2'
		com:
			'Deux triangles isocèles de sommets s1 s2 sont isométriques si les côtés opposés aux sommets sont isométriques'.
	e
		lisRegle: 'isométrie-anglesTriangle1'
		si:
			'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?c2 ?a2 ?b2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [  ?a1 ?b1 ?c1 ]   [ ?a2 ?b2 ?c2 ]  ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [  ?a1 ?b1 ?c1 ] [  ?b2 ?c2 ?a2  ]'
		com:
			'Des triangles isométriques on leurs angles correspondants isométriques'.
	e
		lisRegle: 'isométrie-anglesTriangle2'
		si:
			'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?a2 ?b2 ?c2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [   ?c1 ?a1 ?b1 ]   [ ?c2 ?a2 ?b2  ]  ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [  ?ang1 ] [  ?ang2 ]'
		com:
			'Des triangles isométriques on leurs angles correspondants isométriques'.
	e
		lisRegle: 'isométrie-anglesTriangle3'
		si:
			'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?a2 ?b2 ?c2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [  ?b1 ?c1 ?a1  ]    [ ?b2 ?c2 ?a2  ] ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [ ?ang1 ] [  ?ang2 ]'! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 11/20/2023 16:53'!
mesure: e
	e
		lisRegle: 'mesure-trianglePérimètreAffichemesure'
		si:
			'triangle ?t [ périmètre: ?p ]
affiche mesure déduite'
		alors: 'afficher [ périmètre: ?t ] ?p'
		com: 'mesure du Périmètre d''un polygone'.
	e
		lisRegle: 'mesure-QuadrilatèrePérimètreAffichemesure'
		si:
			'quadrilatère ?t [ périmètre: ?p ]
affiche mesure déduite'
		alors: 'afficher [ périmètre: ?t ] ?p'
		com: 'mesure du Périmètre d''un polygone'.
	e
		lisRegle: 'mesure-mesureAnglesAffiche'
		si:
			'affiche mesure déduite
			angle0 [ ?x1 ?o ?x2 ] ?v1
mesure [ ?x1 ?o ?x2 ] ?v1 déduite
different:de: 180 ?v1'
		alors: 'afficher angle0 [ ?x1 ?o ?x2 ] ?v1'.
	e
		lisRegle: 'mesure-sommeDemesuresinit'
		si:
			'mesuresDe  ?lmes ?m
dernier:rep: ?lmes ?der
mesure ?der ?mder
somme:et:rep:  ?mder ?m ?res
saufDernier:rep: ?lmes ?lmesSp'
		alors: 'mesuresDe  [ ?der ]  ?lmesSp ?res'
		com: 'addition des mesures d''une liste'.
	e
		lisRegle: 'mesure-sommeDemesuresSuite'
		si:
			'mesuresDe  ?x ?lmes ?m
dernier:rep: ?lmes ?der
mesure ?der ?mder
somme:et:rep:  ?mder ?m ?res
saufDernier:rep: ?lmes ?lmesSd      
ajoutePremier:el:rep: ?x ?der ?l'
		alors: 'mesuresDe  ?l  ?lmesSd ?res'
		com: 'addition des mesures d''une liste'.
	e
		lisRegle: 'mesure-mesureSimple'
		si: 'mesure ?x ?m ?cond'
		alors: 'mesure ?x ?m'
		com: 'La mesure sans justification.'.
	e
		lisRegle: 'mesure-mesureAireAffiche1'
		si:
			'affiche mesure déduite
mesure [ aire ?obj ?t  ] ?aire déduite
arrondis:rep: ?aire ?aire2'
		alors: 'afficher [ aire ?obj ?t  ?aire2 ]'.
	e
		lisRegle: 'mesure-mesureAireAffiche2'
		si:
			'affiche mesure déduite
mesure [ aire0 ?obj ?t  ] ?aire déduite
arrondis:rep: ?aire ?aire2'
		alors: 'afficher [ aire ?obj ?t  ?aire2 ]'.
	e
		lisRegle: 'mesure-mesureAireHéronAffiche'
		si:
			'affiche mesure déduite
mesure [ aireHéron ?obj ?t  ] ?aire déduite
arrondis:rep: ?aire ?aire2'
		alors: 'afficher [ aireHéron ?obj ?t  ?aire2 ]'.
	e
		lisRegle: 'mesure-aireQuadrilatère0'
		si: 'quadrilatère ?q  [ aire: ?a ]'
		alors: 'mesure [ aire quadrilatère ?q ] ?a déduite'
		com: 'mesure de l''aire d''un quadrilatère.'.
	e
		lisRegle: 'mesure-mesureSegmentsAffiche'
		si:
			'affiche mesure déduite
point ?a
point ?b
mesure   [ ?a ?b ] ?v1 déduite
~ mesure [ ?a ?b ] ?v1 donnée
~ mesure [ ?b ?a ] ?v1 donnée'
		alors: 'afficher  [ ?a ?b ] ?v1'.
	e
		lisRegle: 'mesure-mesureAnglesAffichage'
		si:
			'afficher angle0  [ ?x1 ?o ?x2 ] ?v1
~ mesure [ ?x1 ?o ?x2 ] ?v donnée'
		alors: 'angleCentre:de:a:coul: ?o ?x1 ?x2 cyan'.
	e
		lisRegle: 'mesure-mesurePérimétreAffichage'
		si:
			'afficher [ périmètre: ?t ] ?p
retireFait: afficher [ périmètre: ?t ] ?p'
		alors: 'afficheTexte:a: [ périmètre: ?t ?p ] nil'.
	e
		lisRegle: 'mesure-mesureAireHéronAffichage'
		si:
			'afficher [ aireHéron ?obj ?t  ?aire0 ]
retireFait: afficher [ aireHéron ?obj ?t  ?aire0 ]'
		alors: 'afficheTexte:a: [ aireHéron ?obj ?t ?aire0 ] nil'.
	e
		lisRegle: 'mesure-mesureAireAffichage'
		si:
			'afficher [ aire ?obj ?t  ?aire0 ]
retireFait: afficher [ aire ?obj ?t  ?aire0 ]'
		alors: 'afficheTexte:a: [ aire ?obj ?t ?aire0 ] nil'.
	e
		lisRegle: 'mesure-mesureAirePolygoneAffichage'
		si:
			'afficher [ aire Polygone ?x1 ?res ]	
arrondis:rep: ?res ?aire'
		alors: 'afficheTexte:a: [ aire Polygone ?x1 ?aire ] nil'.
	e
		lisRegle: 'mesure-mesureDistanceAffichage'
		si:
			'afficher [ ?a ?b ]  ?mes
different:de: ?a  périmètre:'
		alors: 'distanceDe:a:coul: ?a ?b  cyan'.
	e
		lisRegle: 'mesure-produit1'
		si:
			'mesure  [ produit ?b1 ?b2 ] ?mb
mesure ?b1 ?mb1
quotient:et:rep: ?mb ?mb1 ?mb2

~mesure ?b2 ?mb2'
		alors: 'mesure ?b2 ?mb2'
		com: 'premier terme d''un produit.'.
	e
		lisRegle: 'mesure-produit1'
		si:
			'mesure  [ produit ?b1 ?b2 ] ?mb
mesure ?b2 ?mb2
quotient:et:rep: ?mb ?mb1 ?mb2
~mesure ?b1 ?mb1'
		alors: 'mesure ?b1 ?mb1'
		com: 'Deuxième terme d''un produit'.
	e
		lisRegle: 'mesure-moyenneIsométrie1'
		si:
			'mesure  [ moyenne [ ?b1 ?b2 ] ] ?mb
relation:et:nom: ?b1 ?b2 isométrique'
		alors: 'mesure ?b1 ?mb'
		com:
			'la mesure d''une moyenne de deux objets isométriques est égale à la mesure d''un des objets.'.
	e
		lisRegle: 'mesure-moyenneIsométrie2'
		si:
			'mesure  [ moyenne [ ?b1 ?b2 ] ] ?mb
relation:et:nom: ?b1 ?b2 isométrique'
		alors: 'mesure ?b2 ?mb'
		com:
			'la mesure d''une moyenne de deux objets isométriques est égale à la mesure d''un des objets.'.
	e
		lisRegle: 'mesure-moyenne1'
		si:
			'mesure  [ moyenne ?b1 ?b2 ] ?mb
mesure ?b1 ?mb1
produit:et:rep: ?mb 2 ?bb
difference:et:rep: ?bb ?mb1 ?mb2
~mesure ?b2 ?mb2'
		alors: 'mesure ?b2 ?mb2'
		com: 'premier terme d''une moyenne.'.
	e
		lisRegle: 'mesure-moyenne2'
		si:
			'mesure  [ moyenne ?b1 ?b2 ] ?mb
mesure ?b2 ?mb2
produit:et:rep: ?mb 2 ?bb
difference:et:rep: ?bb ?mb2 ?mb1
~ mesure ?b1 ?mb1'
		alors: 'mesure ?b1 ?mb1 '
		com: 'Deuxième terme d''une moyenne.'.
	e
		lisRegle: 'mesure-moyenne3'
		si:
			'mesure ?b1 ?mb1		
mesure ?b2 ?mb2
somme:et:rep: ?mb1 ?mb2 ?mbb
quotient:et:rep: ?mbb 2 ?moy
~ mesure  [ moyenne ?b1 ?b2 ] ?moy'
		alors: 'mesure  [ moyenne ?b1 ?b2 ] ?moy'
		com: 'Calcul d''une moyenne.'.
	e
		lisRegle: 'mesure-distanceParallèles'
		si:
			'parallèle ?d1 ?d2 ?pt
perpendiculaire ?perp  ?d1 ?p
pointSur ?d2 ?p
intersection ?i ?perp ?d1
different:de: ?p ?i
mesure ?x ?m
contient:el: ?x ?i
contient:el: ?x ?p
~ mesure [ aire trapèze ?q ] ?aire'
		alors: 'mesure [ distance parallèles [ ?d1 ?d2 ] ] ?m'
		com:
			'la distance entre 2 parallèles est la mesure de la distance entre les intersections d''une perpendiculaire aux parallèles avec ces parallèles.'.



	"e lisRegle: 'mesure-isométrie1' 
si:  'isométrique ?x ?y
mesure ?x ?val'
alors:  'mesure ?y ?val'
com: 'Des objets isométriques ont même mesure'.
e lisRegle: 'mesure-isométrie1Aff' 
si:  'isométrique ?x ?y
mesure ?x ?val'
alors:  'affiche: [ mesure ?y ?val ]'
com: 'Des objets isométriques ont même mesure'."
	e
		lisRegle: 'mesure-anglePlat'
		si: 'angle0 [ ?x ?o ?y ] [ plat ]'
		alors: 'mesure [ ?x ?o ?y ]  180 déduite'
		com: 'Un angle plat est 180°, sa mesure est 180.'.
	e
		lisRegle: 'mesure-angleDroit'
		si: 'angle0 [ ?x ?o ?y ] [ droit ]'
		alors: 'mesure [ ?x ?o ?y ] 90 déduite'
		com: 'Un angle droit est  90°, sa mesure est 90.'.
	e
		lisRegle: 'mesure-anglesSupplémentaires'
		si:
			'angle  [ ?x ?o ?y ]  [ supplémentaires  [ ?x ?o ?z ]  ]
mesure [ ?x ?o ?z ] ?m1
difference:et:rep: 180 ?m1 ?rep'
		alors: 'mesure  [ ?x ?o ?y ] ?rep'
		com:
			'La somme deux angles supplémentaires forment un angle plat , si l''on connait la mesure d''un des angles, la mesure de l''autre  est 180 - angle'.
	e
		lisRegle: 'mesure-isométrieAnglesNumérique'
		si:
			'angle0 ?obj1
angle0 ?obj2
mesure ?obj1 ?m1 ?val
relation:et:nom:  ?obj1  ?obj2 isométrique
different:de: ?obj1  ?obj2
~  mesure ?obj2 ?m1 donnée'
		alors: 'mesure ?obj2 ?m1  déduite'
		com: 'Des objets isométriques ont même mesure'.
	e
		lisRegle: 'mesure-isométrieAnglesSymbolique'
		si:
			'angle0 ?obj1
angle0 ?obj2
relation:et:nom:  ?obj1  ?obj2 isométrique
different:de: ?obj1  ?obj2
different:de: ?obj1  ?obj2'
		alors: 'égal [ mesure ?obj1 ] [ mesure ?obj2 ]'
		com: 'Les mesures d'' objets isométriques sont égales'.
	"e
		lisRegle: 'mesure-mesureCoupleInversé'
		si: 'mesure [ ?x ?y ] ?m'
		alors: 'mesure [ ?y ?x ] ?m'
		com:
			'La mesure de distance entre deux points  est la  même si on inverse les points'."
	e
		lisRegle: 'mesure-isométrieCouples'
		si:
			'mesure [ ?a ?b ] ?val
point ?x
point ?y
relation:et:nom: [ ?x ?y ] [ ?a ?b ] isométrique
different:de: [ ?x ?y ] [ ?a ?b ]
different:de: [ ?x ?y ] [ ?b ?a ]
'
		alors: 'mesure [ ?x ?y ] ?val déduite'
		com: 'Des objets isométriques ont même mesure'.
	"	e
		lisRegle: 'mesure-isométrieSommeAnglesIsométriques'
		si:
			'angle0 ?x 
angle0 ?y 
different:de: ?x ?y
relation:et:nom: ?x ?y isométrique'
		alors: 'égal [ somme [ mesure ?x ] [ mesure ?y ] ] [  2  mesure ?x ]'
		com:
			'La somme des mesures de deux objets isométriques est le double de la mesure d''un  objets '."
	"e
		lisRegle: 'mesure-isométrieSommedoubles'
		si:
			'somme [ double mesure ?x ] [   double mesure ?y ]
different:de: ?x ?y'
		alors:
			'somme [ double mesure ?x ] [  double mesure ?y ] [  2  somme  [ mesure ?y ] [ mesure ?x ]'
		com:
			'La somme de mesures doubles  est le double de la somme des mesures . '."
	e
		lisRegle: 'mesure-isométrieEgalité'
		si:
			'somme ?x ?y ?z
somme ?x ?y  ?w
different:de:  ?z ?w'
		alors: 'égal ?z ?w'
		com:
			'Si les termes d''une sommes	sont les mêmes, alors les résultats sont égaux'.
	e
		lisRegle: 'mesure-sommeSegment'
		si:
			'segment ?s [  ?a ?c ]
pointSur ?s ?b
different:de: ?b  ?a
different:de: ?b ?c
different:de: ?a ?c'
		alors:
			'somme [ mesure [ ?a ?b ]  ]  [ mesure [ ?b ?c ] ] [  mesure [ ?a ?c ] ]'.
	e
		lisRegle: 'mesure-AnglesEgalitéTransitivité'
		si:
			'égal ?x ?y
égal ?x  ?z
different:de: ?y ?z'
		alors: 'égal  ?y ?z'
		com:
			'Transitivité de l''égalité. x = y et x = z => y =  z.
		'.
	e
		lisRegle: 'mesure-sommeAnglesEgaux'
		si:
			'égal [ mesure ?x1 ] [ mesure ?x2 ]
ordonneMot:et:rep1:rep2: [ mesure ?x1 ] [ mesure ?x2 ]   ?a ?b
different:de: ?x1 ?x2'
		alors: 'égal  [ somme ?a ?b ] [ double   [ mesure ?x1 ] '
		com:
			'Si les  termes d''une somme sont égaux, la somme est le doule de l''un d''eux'.
	"	e
		lisRegle: 'mesure-sommeAnglesEgaux2'
		si:
			'égal [ mesure ?x1 ] [ mesure ?x2 ]
ordonneMot:et:rep1:rep2: [ mesure ?x1 ] [ mesure ?x2 ]    ?a ?b
different:de: ?x1 ?x2'
		alors: 'égal  [ somme  ?a ?b ] [ double   [ mesure ?x2 ] ]'
		com:
			'Si les termes d''une somme sont égaux la somme est égale au double de l''un des terme'."
	e
		lisRegle: 'mesure-SommeDedoubles '
		si:
			' angle0 [  ?x1 ?o ?x2 ]  [ AuCentre: ?c ]
angle0 [  ?x1 ?s ?x2 ] [ Inscrit: ?c ]égal [ mesure  [ ?I ?O ?A ]  ]  [ double  [ mesure  [ ?A ?S ?O ]  ]  '
		alors:
			'égal [ mesure [  ?x1 ?o ?x2 ]  ] [ double [ mesure [[  ?x1 ?s ?x2 ] ]'
		com:
			'Si chaque terme d''une somme est le double d''un terme d''une autre somme, les sommes sont le double l''une de l''autre.'.
	e
		lisRegle: 'mesure-EgalitésPartiesSommes1'
		si:
			'égal  [ somme ?x1 ?x2 ] [ double ?x3 ]
égal  [ somme ?x1 ?x2 ] ?x4
different:de:[ double ?x3 ]  ?x4'
		alors: 'égal [ double ?x3 ]  ?x4'
		com:
			'Si les termes de deux sommes sont égaux les résutats sont égaux, en calcul formel, on peut égaler les résultats'.
	e
		lisRegle: 'mesure-EgalitésPartiesSommes2'
		si:
			'égal  [ somme ?x1 ?x2 ] ?x3
égal  [ somme ?x4  ?x2 ] ?x3
different:de: ?x1 ?x4'
		alors: 'égal ?x1 ?x4'
		com:
			'Si deux sommes sont égales et l''un des termes d''une somme est égal à un terme de l''autre somme, les autres termes sont égaux'.
	e
		lisRegle: 'mesure-EgalitésPartiesSommes3'
		si:
			'égal  [ somme ?x1 ?x2 ] ?x3
égal  [ somme ?x2  ?x4 ] ?x3'
		alors: 'égal ?x1 ?x4'
		com:
			'Si deux sommes sont égales et l''un des termes d''une somme est égal à un terme de l''autre somme, les autres termes sont égaux'.
	e
		lisRegle: 'mesure-EgalitésPartiesSommes4'
		si:
			'égal  [ somme  ?x2 ?x1 ] ?x3
égal  [ somme ?x4 ?x2 ] ?x3'
		alors: 'égal ?x2 ?x4'
		com:
			'Si deux sommes sont égales et l''un des termes d''une somme est égal à un terme de l''autre somme, les autres termes sont égaux'.
	e
		lisRegle: 'mesure-rapportDouble'
		si:
			'égal [ somme [  mesure  ?x  ]     [ mesure ?y ]  ] [ mesure [ double ?x2 ]
égal [ somme  [ mesure ?x ]   [ mesure  ?y ] ]  ?z
different:de: ?z [ double ?x2 ]'
		alors: 'égal ?z [ double ?x2 ]'
		com: 'Rapport de 1 à 2 entre deux mesures.'.
	"	e
		lisRegle: 'mesure-sommeDoubles'
		si:
			'égal   [ mesure  ?y1  ] [ double [ mesure ?x1 ] ]
 égal   [ mesure  ?y2  ] [ double [ mesure ?x2 ] ]
different:de:  ?y1 ?y2
égal [ somme [ mesure  ?y1  ] [ mesure  ?y2 ] ] [   mesure  ?somy ] 
égal [ somme [ mesure ?x1 ]  [ mesure ?x2 ] ] ]  [ mesure ?somx ]'
		alors: 'égal [  mesure ?somy  ] [  double mesure [ ?somx ] ]'
		com: ' La somme des double est égale au double  des sommes.'."
	"	e
		lisRegle: 'EgalitéTransitivité1'
		si:
			'égal ?x ?z
égal ?y ?z
ordonneMot:et:rep1:rep2:  ?x ?y ?x ?y
different:de: ?x ?y
'
		alors: 'égal ?x ?y'
		com: 'Transitivité de la relation égal.'."
	e
		lisRegle: 'mesure-EgalitéProduitsFacteurCommun1'
		si:
			' égal  [ produit ?x1 ?y1 ]   [ produit ?x2 ?y2 ] ]
égal  [ produit ?x3 ?y1 ]   [ produit ?x4 ?y2 ] ]
ordonneMot:et:rep1:rep2:  ?x1 ?x3  ?x1 ?x3
different:de: ?x1 ?x3'
		alors: 'égal  [ quotient ?x1 ?x2 ] [ quotient ?x3 ?x4 ]'
		com:
			'En divisant une égalité par l''autre, les facteurs communs s''éliminent,'.
	e
		lisRegle: 'mesure-EgalitéProduitsFacteurCommun2'
		si:
			'égal  [ produit ?x1 ?y1 ]   [ produit ?x2 ?y2 ] ]
égal  [ produit ?x1 ?y3 ]   [ produit ?x2 ?y4 ] ]
ordonneMot:et:rep1:rep2:  ?y1 ?y3  ?y1 ?y3
different:de: ?y1 ?y3'
		alors: 'égal  [ quotient ?y1 ?y2 ] [ quotient ?y3 ?y4 ]'
		com:
			'En divisant une égalité par l''autre, les facteurs communs s''éliminent,'.
	e
		lisRegle: 'mesure-Egalité>EchangeMoyens'
		si: 'égal  [ quotient ?x1 ?x2 ] [ quotient ?x3 ?x4 ]'
		alors: 'égal  [ quotient ?x1 ?x3 ] [ quotient ?x2 ?x4 ]'
		com:
			'Dans une égalité entre quotients l''égalité subsiste si on échange les moyens.'.
	"	e
		lisRegle: 'mesure-objetsAnglesIsométriques'
		si:
			'angle0 ?x1
angle0 ?x2
relation:et:nom: ?x1 ?x2 isométrique
relationCrée:et:nom: [ mesureDe: ?x1 ] [ mesureDe: ?x2 ]  isométrique'
		alors: 'relationCréée [ mesureDe: ?x1 ] [ mesureDe: ?x2 ]  isométrique'
		com: 'Des angles isométriques ont des mesure isométriques'.
"
	"	e
		lisRegle: 'mesure-preuveAngleInscrit'
		si:
			'égal [ double [ mesure [ ?x1 ?s ?x2 ]  ] ]  [ mesure ?y5 ]
angle0 [ ?y1 ?s ?y2 ] [ Inscrit: ?c ]
 égal [ double [ mesure [ ?x3 ?s ?x4 ]  ] ]  [ mesure ?y6 ]
angle0 [ ?y3 ?s ?y4 ] [ Inscrit: ?c ]
different:de: ?x1 ?x3
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3'
		alors:
			'égal  [ somme  [ double [ mesure [ ?x1 ?s ?x2 ]  ] ]   [ double [ mesure [ ?x3 ?s ?x4 ]  ] ]  ] [  somme [ mesure ?y5 ]  [ mesure ?y6 ] ]'
		com:
			'La somme de quantités doubles est égale au double de la somme des quantités.'."
	e
		lisRegle: 'mesure-additionmesuresAngles'
		si:
			'angle0 [  ?x1 ?s ?x2 ]
angle0 [  ?x2 ?s ?x3 ]'
		alors:
			'égal [  somme [ mesure  [  ?x1 ?s ?x2 ]  ] [  mesure [  ?x2 ?s ?x3  ]  ]  ] [  mesure [ ?x1 ?s ?x3 ] ]'
		com: 'Somme de deux angles adjacents.'
	"	e
		lisRegle: 'EgalitéTransitivité1'
		si:
			'égal ?z ?x 
égal  ?z ?y
ordonneMot:et:rep1:rep2:  ?x ?y ?x ?y
different:de: ?x ?y'
		alors: 'égal ?x ?y'
		com: 'Transitivité de la relation égal.'."! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 10/1/2024 02:16:48'!
morpion: e
	"jeu du morpion"

	|    |
	
e lisRegle:  'Fin'
si:  'ligne h1 ?1 ?2 ?3
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
different:de: ?9 -'
alors: 'partie terminée'.



	e lisRegle:  'v1' 
	si:  'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
	
	alors: 'ligne v1 ?1 ?4 ?7'.
	
	e lisRegle:  'v2' 
	si:  'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
	
	alors: 'ligne v2 ?2 ?5 ?8'.
	
	e lisRegle:  'v3' 
	si:  'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
	
	alors: 'ligne v3 ?3 ?6 ?9'.
	
	e lisRegle:  'd1' 
	si:  'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
	
	alors: 'ligne d1 ?1 ?5 ?9'.
	
e lisRegle:  'd2' 
	si:  'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
	
	alors: 'ligne d2 ?3 ?5 ?7'.
	

e lisRegle:  'adversaire o' 
	si:  'joueur x'	
	alors: 'adversaire o'.
	
e lisRegle:  'adversaire x' 
	si:  'joueur o'	
	alors: 'adversaire x'.
	
e lisRegle:'a gagné'  
	si:  'joueur ?j
ligne ?l ?j ?j ?j' 
	alors:  'Joueur ?j [  a gagné ligne ?l ]'.
	
	
e lisRegle:  'gagne 1' 
	si:  'joueur ?j
ligne ?l - ?j ?j'	
	alors: 'joueur ?j [ gagne en jouant ?l case 1 ]'.
	
e lisRegle:  'gagne 2' 
	si:  'joueur ?j
ligne ?l ?j - ?j'	
	alors: 'joueur ?j [ gagne en jouant ?l case 2 ]'.
	
	
e lisRegle:  'gagne 3' 
	si:  'joueur ?j
ligne ?l ?j ?j  -'	
	alors: 'joueur ?j [ gagne en jouant ?l case 3 ]'.
	
e lisRegle:  'contre 1' 
	si:  'adversaire ?a
joueur ?j
ligne ?l - ?a ?a'	
	alors: 'j]oueur ?j [ contre ?a  en jouant ?l case 1'.
	 
e lisRegle:  'contre 2' 
	si:  'adversaire ?a
joueur ?j
ligne ?l ?a - ?a'	
	alors: 'joueur ?j [ contre ?a  en jouant ?l case 2 ]'.
	
	
e lisRegle:  'contre 3' 
	si:  'adversaire ?a
joueur ?j
ligne ?l ?a ?a -'	
	alors: 'joueur ?j [ contre ?a  en jouant ?l case 3 ]'.
	
	e lisRegle: 'menace1'
	si: 'joueur ?j
adversaire ?a
ligne ?l ?j - -' 
	alors: 'joueur ?j [ menace ?a en jouant ligne ?l case 2 ou 3 ]'.	
		
		e lisRegle: 'menace2'
	si: 'joueur ?j
adversaire ?a
ligne ?l - ?j -' 
	alors: 'joueur ?j [ menace ?a en jouant ligne ?l case 1 ou 3 ]'.	
		e lisRegle: 'menace3'
	si: 'joueur ?j
adversaire ?a
ligne ?l - - ?j' 
	alors: 'joueur ?j [ menace ?a en jouant ligne ?l case 1 ou 2 ]'.
	
"e lisRegle: 'piege1.1a' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?j -
ligne h1 - ?j -'
	alors: 'joueur ?j piège ?a ligne h1 case 1'.
	
e lisRegle: 'piege1.1b' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?j
ligne h1 - ?j -'
	alors: 'joueur ?j piège ?a ligne h1 case 1'.
	
e lisRegle: 'piege1.1c' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?j -
ligne h1 - - ?j'
	alors: 'joueur ?j piège ?a ligne h1 case 1'.
	
e lisRegle: 'piege 1.1d' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?j
ligne h1 - - ?j'
	alors: 'joueur ?j piège ?a ligne h1 case 3'.
	
e lisRegle: 'piege1.2a' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?j -
ligne h1 ?j - -'
	alors: 'joueur ?j piège ?a ligne h1 case 2'.
	
e lisRegle: 'piege1.2b' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?j
ligne h1 ?j - -'
	alors: 'joueur ?j piège ?a ligne h1 case 2'.
	
e lisRegle: 'piege1.2c' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?j -
ligne h1 - - ?j'
	alors: 'joueur ?j piège ?a ligne h1 case 2'.
	
e lisRegle: 'piege 1.2d' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?j
ligne h1 - - ?j'
	alors: 'joueur ?j piège ?a ligne h1 case 2'.




	
	
e lisRegle: 'piege1.3a' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?j -
ligne h1 - ?j -'
	alors: 'joueur ?j piège ?a ligne h1 case 3'.
	
e lisRegle: 'piege1.3b' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?j
ligne h1 - ?j -'
	alors: 'joueur ?j piège ?a ligne h1 case 3'.
	
e lisRegle: 'piege1.3c' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?j -
ligne h1 ?j - -'
	alors: 'joueur ?j piège ?a ligne h1 case 3'.
	
e lisRegle: 'piege 1.3d' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?j
ligne h1 ?j - -'
	alors: 'joueur ?j piège ?a ligne h1 case 3'.

	
	
	
e lisRegle: 'piege2.1a' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?j -
ligne h2 - ?j -'
	alors: 'joueur ?j piège ?a ligne h2 case 1'.
	
e lisRegle: 'piege2.1b' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?j
ligne h2 - ?j -'
	alors: 'joueur ?j piège ?a ligne h2 case 1'.
	
e lisRegle: 'piege2.1c' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?j -
ligne h2 - - ?j'
	alors: 'joueur ?j piège ?a ligne h2 case 1'.
	
e lisRegle: 'piege 2.1d' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?j
ligne h2 - - ?j'
	alors: 'joueur ?j piège ?a ligne h2 case 3'.
	
e lisRegle: 'piege2.2a' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?j -
ligne h2 ?j - -'
	alors: 'joueur ?j piège ?a ligne h2 case 2'.
	
e lisRegle: 'piege2.2b' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?j
ligne h2 ?j - -'
	alors: 'joueur ?j piège ?a ligne h2 case 2'.
	
e lisRegle: 'piege2.2c' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?j -
ligne h2 - - ?j'
	alors: 'joueur ?j piège ?a ligne h2 case 2'.
	
e lisRegle: 'piege 2.2d' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?j
ligne h2 - - ?j'
	alors: 'joueur ?j piège ?a ligne h2 case 2'.


	
e lisRegle: 'piege2.3a' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?j -
ligne h2 - ?j -'
	alors: 'joueur ?j piège ?a ligne h2 case 3'.
	
e lisRegle: 'piege2.3b' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?j
ligne h2 - ?j -'
	alors: 'joueur ?j piège ?a ligne h2 case 3'.
	
e lisRegle: 'piege2.3c' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?j -
ligne h2 ?j - -'
	alors: 'joueur ?j piège ?a ligne h2 case 3'.
	
e lisRegle: 'piege 2.3d' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?j
ligne h2 ?j - -'
	alors: 'joueur ?j piège ?a ligne h2 case 3'.


	
	
e lisRegle: 'piege3.1a' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?j -
ligne h3 - ?j -'
	alors: 'joueur ?j piège ?a ligne h3 case 1'.
	
e lisRegle: 'piege3.1b' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?j
ligne h3 - ?j -'
	alors: 'joueur ?j piège ?a ligne h3 case 1'.
	
e lisRegle: 'piege 3.1c' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?j -
ligne h3 - - ?j'
	alors: 'joueur ?j piège ?a ligne h3 case 1'.
	
e lisRegle: 'piege 3.1d' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?j
ligne h3 - - ?j'
	alors: 'joueur ?j piège ?a ligne h3 case 3'.
	
e lisRegle: 'piege3.2a' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?j -
ligne h3 ?j - -'
	alors: 'joueur ?j piège ?a ligne h3 case 2'.
	
e lisRegle: 'piege3.2b' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?j
ligne h3 ?j - -'
	alors: 'joueur ?j piège ?a ligne h3 case 2'.
	
e lisRegle: 'piege3.2c' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?j -
ligne h3 - - ?j'
	alors: 'joueur ?j piège ?a ligne h3 case 2'.
	
e lisRegle: 'piege 2.2d' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?j
ligne h2 - - ?j'
	alors: 'joueur ?j piège ?a ligne h2 case 2'.




	
	
e lisRegle: 'piege2.3a' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?j -
ligne h2 - ?j -'
	alors: 'joueur ?j piège ?a ligne h2 case 3'.
	
e lisRegle: 'piege2.3b' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?j
ligne h2 - ?j -'
	alors: 'joueur ?j piège ?a ligne h2 case 3'.
	
e lisRegle: 'piege2.3c' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?j -
ligne h2 ?j - -'
	alors: 'joueur ?j piège ?a ligne h2 case 3'.
	
e lisRegle: 'piege 3.3d' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?j
ligne h3 ?j - -'
	alors: 'joueur ?j piège ?a ligne h3 case 3'.

e lisRegle: 'piegediag1.h1a' 
si:  'joueur ?j
adversaire ?a
ligne h1 - ?j -
ligne d1 - ?j -'
alors:  'joueur ?j piège ?a  ligne h1 case 1'.


	e lisRegle: 'piegediag1.h1b' 
si:  'joueur ?j
adversaire ?a
ligne h1 - - ?j
ligne d1 - ?j -'
alors:  'joueur ?j piège ?a  ligne h1 case 1'.

 	e lisRegle: 'piegediag1.h1c' 
si:  'joueur ?j
adversaire ?a
ligne h1 - ?j -
ligne d1 - - ?j'
alors:  'joueur ?j piège ?a  ligne h1 case 1'.
	
		e lisRegle: 'piegediag1.h1d' 
si:  'joueur ?j
adversaire ?a
ligne h1 - - ?j
ligne d1 - - ?j'
alors:  'joueur ?j piège ?a  ligne h1 case 1'.

		e lisRegle: 'piegediag1.h2a' 
si:  'joueur ?j
adversaire ?a
ligne h2 - - ?j
ligne d1 - - ?j'
alors:  'joueur ?j piège ?a  ligne h2 case 2'.


		e lisRegle: 'piegediag1.h2b' 
si:  'joueur ?j
adversaire ?a
ligne h2 ?j - - 
ligne d1 - - ?j'
alors:  'joueur ?j piège ?a  ligne h2 case 2'.

	
			e lisRegle: 'piegediag1.h2c' 
si:  'joueur ?j
adversaire ?a
ligne h2 ?j - -
ligne d1 ?j - -'
alors:  'joueur ?j piège ?a  ligne h2 case 2'.

			e lisRegle: 'piegediag1.h2d' 
si:  'joueur ?j
adversaire ?a
ligne h2 ?j - -
ligne d1 - - ?j'
alors:  'joueur ?j piège ?a  ligne h2 case 2'.


		e lisRegle: 'piegediag1.h3a' 
si:  'joueur ?j
adversaire ?a
ligne h3 - ?j -
ligne d1 - - ?j'
alors:  'joueur ?j piège ?a  ligne h3 case 3'.

		e lisRegle: 'piegediag1.h3b' 
si:  'joueur ?j
adversaire ?a
ligne h3 ?j - - 
ligne d1 - ?j -'
alors:  'joueur ?j piège ?a  ligne h3 case 3'.






	
			e lisRegle: 'piegediag1.h3c' 
si:  'joueur ?j
adversaire ?a
ligne h3 ?j - -
ligne d1 ?j - -'
alors:  'joueur ?j piège ?a  ligne h3 case 3'.


			e lisRegle: 'piegediag1.h3d' 
si:  'joueur ?j
adversaire ?a
ligne h3 ?j - -
ligne d1 - ?j -'
alors:  'joueur ?j piège ?a  ligne h3 case 3'.


e lisRegle: 'piegediag2.h1a' 
si:  'joueur ?j
adversaire ?a
ligne h1 - ?j -
ligne d2 - ?j -'
alors:  'joueur ?j piège ?a  ligne h1 case 3'.


	e lisRegle: 'piegediag2.h1b' 
si:  'joueur ?j
adversaire ?a
ligne h1 ?j - -
ligne d2 - ?j -'
alors:  'joueur ?j piège ?a  ligne h1 case 3'.

 	e lisRegle: 'piegediag2.h1c' 
si:  'joueur ?j
adversaire ?a
ligne h1 - ?j -
ligne d2 ?j - -'
alors:  'joueur ?j piège ?a  ligne h1 case 3'.
	
		e lisRegle: 'piegediag2.h1d' 
si:  'joueur ?j
adversaire ?a
ligne h1 ?j - -
ligne d2 ?j - -'
alors:  'joueur ?j piège ?a  ligne h1 case 3'.

		e lisRegle: 'piegediag2.h2a' 
si:  'joueur ?j
adversaire ?a
ligne h2 - - ?j
ligne d2 - - ?j'
alors:  'joueur ?j piège ?a  ligne h2 case 2'.


		e lisRegle: 'piegediag1.h2b' 
si:  'joueur ?j
adversaire ?a
ligne h2 ?j - - 
ligne d2 - - ?j'
alors:  'joueur ?j piège ?a  ligne h2 case 2'.

	
			e lisRegle: 'piegediag1.h2c' 
si:  'joueur ?j
adversaire ?a
ligne h2 ?j - -
ligne d2 ?j - -'
alors:  'joueur ?j piège ?a  ligne h2 case 2'.

			e lisRegle: 'piegediag1.h2d' 
si:  'joueur ?j
adversaire ?a
ligne h2 ?j - -
ligne d2 - - ?j'
alors:  'joueur ?j piège ?a  ligne h2 case 2'.


		e lisRegle: 'piegediag2.h3a' 
si:  'joueur ?j
adversaire ?a
ligne h3 - ?j -
ligne d2 ?j - -'
alors:  'joueur ?j piège ?a  ligne h3 case 1'.

		e lisRegle: 'piegediag2.h3b' 
si:  'joueur ?j
adversaire ?a
ligne h3 ?j - - 
ligne d2 - ?j -'
alors:  'joueur ?j piège ?a  ligne h3 case 1'.


			e lisRegle: 'piegediag2.h3c' 
si:  'joueur ?j
adversaire ?a
ligne h3 - - ?j
ligne d2 ?j - -'
alors:  'joueur ?j piège ?a  ligne h3 case 1'.


			e lisRegle: 'piegediag2.h3d' 
si:  'joueur ?j
adversaire ?a
ligne h3 - - ?j
ligne d2 - ?j -'
alors:  'joueur ?j piège ?a  ligne h3 case 1'.




e lisRegle: 'contrepiege1.1a' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?a -
ligne h1 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h1 case 1'.
	
e lisRegle: 'contrepiege1.1b' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?a
ligne h1 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h1 case 1'.
	
e lisRegle: 'contrepiege1.1c' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?a -
ligne h1 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h1 case 1'.
	
e lisRegle: 'contrepiege 1.1d' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?a
ligne h1 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h1 case 3'.
	
e lisRegle: 'contrepiege1.2a' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?a -
ligne h1 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h1 case 2'.
	
e lisRegle: 'contrepiege1.2b' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?a
ligne h1 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h1 case 2'.
	
e lisRegle: 'contrepiege1.2c' 
	si:  'joueur ?a
adversaire ?a
ligne v2 - ?a -
ligne h1 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h1 case 2'.
	
e lisRegle: 'contrepiege 1.2d' 
	si:  'joueur ?a
adversaire ?a
ligne v2 - - ?a
ligne h1 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h1 case 2'.




	
	
e lisRegle: 'contrepiege1.3a' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?a -
ligne h1 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h1 case 3'.
	
e lisRegle: 'contrepiege1.3b' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?a
ligne h1 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h1 case 3'.
	
e lisRegle: 'contrepiege1.3c' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?a -
ligne h1 ?a - -'
	alors: 'joueur ?j contre  ?a ligne h1 case 3'.
	
e lisRegle: 'contrepiege 1.3d' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?a
ligne h1 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h1 case 3'.

	
	
	
e lisRegle: 'contrepiege2.1a' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?a -
ligne h2 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 1'.
	
e lisRegle: 'contrepiege2.1b' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?a
ligne h2 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 1'.
	
e lisRegle: 'contrepiege2.1c' 
	si:  'joueur ?a
adversaire ?a
ligne v1 - ?a -
ligne h2 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h2 case 1'.
	
e lisRegle: 'contrepiege 2.1d' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?a
ligne h2 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h2 case 3'.
	
e lisRegle: 'contrepiege2.2a' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?a -
ligne h2 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 2'.
	
e lisRegle: 'contrepiege2.2b' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?a
ligne h2 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 2'.
	
e lisRegle: 'contrepiege2.2c' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?a -
ligne h2 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h2 case 2'.
	
e lisRegle: 'contrepiege 2.2d' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?a
ligne h2 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h2 case 2'.


	
e lisRegle: 'contrepiege2.3a' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?a -
ligne h2 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 3'.
	
e lisRegle: 'contrepiege2.3b' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?a
ligne h2 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 3'.
	
e lisRegle: 'contrepiege2.3c' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?a -
ligne h2 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 3'.
	
e lisRegle: 'contrepiege 2.3d' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?a
ligne h2 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 3'.


	
	
e lisRegle: 'contrepiege3.1a' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?a -
ligne h3 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h3 case 1'.
	
e lisRegle: 'contrepiege3.1b' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?a
ligne h3 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h3 case 1'.
	
e lisRegle: 'contrepiege 3.1c' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - ?a -
ligne h3 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h3 case 1'.
	
e lisRegle: 'contrepiege 3.1d' 
	si:  'joueur ?j
adversaire ?a
ligne v1 - - ?a
ligne h3 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h3 case 3'.
	
e lisRegle: 'contrepiege3.2a' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?a -
ligne h3 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h3 case 2'.
	
e lisRegle: 'contrepiege3.2b' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?a
ligne h3 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h3 case 2'.
	
e lisRegle: 'contrepiege3.2c' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - ?a -
ligne h3 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h3 case 2'.
	
e lisRegle: 'contrepiege 2.2d' 
	si:  'joueur ?j
adversaire ?a
ligne v2 - - ?a
ligne h2 - - ?a'
	alors: 'joueur ?j contre piège ?a ligne h2 case 2'.




	
	
e lisRegle: 'contrepiege2.3a' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?a -
ligne h2 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 3'.
	
e lisRegle: 'contrepiege2.3b' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?a
ligne h2 - ?a -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 3'.
	
e lisRegle: 'contrepiege2.3c' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - ?a -
ligne h2 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h2 case 3'.
	
e lisRegle: 'contrepiege 3.3d' 
	si:  'joueur ?j
adversaire ?a
ligne v3 - - ?a
ligne h3 ?a - -'
	alors: 'joueur ?j contre piège ?a ligne h3 case 3'."


	
	

! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 4/2/2019 00:33'!
morpionInterface: e
	
e lisRegle:'interface1-1'
 	si:  'DrGTextItem ?T ligne h1 ?1 ?2 ?3'
	alors: 	'ligne h1 ?1 ?2 ?3'.

e lisRegle:'interface1-2'
 	si:  'DrGTextItem ?T ligne h2 ?4 ?5 ?6'
	alors: 	'ligne h2 ?4 ?5 ?6'.
		
e lisRegle:'interface1-3'
 	si:  'DrGTextItem ?T ligne h3 ?7 ?8 ?9'
	alors: 	'ligne h3 ?7 ?8 ?9'.
		
		
e lisRegle:'interface2'
si: 'DrGTextItem ?T joueur ?j'
alors:'joueur ?j'.
		
	




! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 6/7/2025 17:31:09'!
objetsSur: e
	| i |
	"e lisRegle: 'interface-Polygone6' 
si: 'DrGPolygonNptsItem ?poly ?p1 ?p2 ?p3 ?p4 ?p5 ?p6'
alors: 'hexagone ?poly [  sommets: ?p1 ?p2 ?p3   ?p4 ?p5 ?p6 ]'
com: 'Un polygone de 6 sommets définit un hexagone'.
"
	e
		lisRegle: 'objetsSur-pointsConfondus'
		si:
			'point ?x
point ?y
pointConfondu:avec: ?x ?y
ordonneMot:et:rep1:rep2:  ?x ?y ?x ?y
different:de: ?x ?y'
		alors: 'pointsConfondus ?x ?y'
		com: ' Des points de noms différents mais de même coordonées'.
	e
		lisRegle: 'objetsSur-droitesConfondues'
		si:
			'sorteDeDroite ?x
sorteDeDroite  ?y
pointSur ?x ?p1
pointSur ?x ?p2
pointSur ?y ?p1
pointSur ?y ?p2 
different:de: ?x ?y
different:de: ?p1 ?p2
relationCrée:et:nom: ?x ?y confondues'
		alors: 'relationCréée  ?x ?y confondues'.
	e
		lisRegle: 'objetsSur-droitesConfonduesPerpendiculaire'
		si:
			'sorteDeDroites ?x 
sorteDeDroites ?y
sorteDeDroite ?z
ordonneMot:et:rep1:rep2: ?x ?z ?xx ?zz
relation:et:nom: ?x ?y confondues
perpendiculaire ?xx ?zz
ordonneMot:et:rep1:rep2: ?y ?z ?yy ?zzz'
		alors: 'perpendiculaire ?yy ?zzz'
		com:
			'Si l''une de deux sortes de droites confondues est perpendiculaire à une autre droite, l''autre l''est aussi.'.
	e
		lisRegle: 'objetsSur-MilieuSegment'
		si:
			'segment ?s [ ?x ?y ]
milieu  [ ?x ?y ] ?m'
		alors: 'pointSur ?s ?m'
		com: 'Le milieu d''un segment est un point sur ce segment.'.
	e
		lisRegle: 'objetsSur-reflexion'
		si:
			'reflexion  ?x1 ?x2 ?x3
perpendiculaire ?x4 ?x3
pointSur ?x4 ?x2'
		alors: 'pointSur ?x4 ?x1'
		com:
			'Si un point est sur une perpendiculaire à l''axe de réflexion, son image l''est aussi'.
	e
		lisRegle: 'objetsSur-SegmentSur'
		si:
			'segment ?s  [ ?p1 ?p2 ]
droite ?x
pointSur ?x ?p1
pointSur ?x ?p2
different:de: ?s ?x'
		alors: 'segmentSur ?x ?s'
		com:
			'Si les extrémités d''un segment sont sur une droite, alors le segment est  sur la droite'.
	e
		lisRegle: 'objetsSur-IntersectionSur1'
		si:
			'segmentSur ?x ?s
intersection ?i ?s ?y
pointSur ?x ?i
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy
different:de: ?x ?y'
		alors: 'intersection ?i ?xx ?yy'
		com:
			'Si il y a une intersection sur un segment et ce segment sur cette droite, alors l''intersection est aussi sur la droite'.
	e
		lisRegle: 'objetsSur-IntersectionSur2'
		si:
			'segmentSur ?x ?s
intersection ?i ?y ?s
pointSur ?x ?i
different:de: ?x ?y'
		alors: 'intersection ?i ?y ?x'
		com:
			'Si il y a une intersection sur un segment et ce segment sur cette droite, alors l''intersection est aussi sur la droite'.
	e
		lisRegle: 'objetsSur-pointSurAlignement'
		si:
			'angle  [ ?x ?y ?z ] plat
segment ?s [ ?x ?z ]'
		alors: 'pointSur ?s ?y '
		com:
			'Le sommet d''un angle plat est sur le segment qui a pour extrémités les points de l''angle autres que le sommet,'.
	e
		lisRegle: 'objetsSur-Milieu'
		si:
			'milieu ?p1 ?p2 ?m
droite ?d
pointSur ?d ?p1
pointSur ?d ?p2'
		alors: 'pointSur ?d ?m'
		com: 'le milieu de deux points sur une droite est aussi sur cette droite'.
	i := e creeRegle: 'objetsSur-PointSurLigne'.
	i antecedents: 'DrGPointOncurveItem ?pt ?L'.
	i concl: 'pointSur  ?L ?pt'.
	"i := e creeRegle: 'objetsSur-PointSurSegment1'.
	i antecedents: 'DrGSegment2ptsItem ?s ?a ?b'.
	i concl: 'pointSur  ?s ?a'.
	i := e creeRegle: 'objetsSur-PointSurSegment2'.
	i antecedents: 'DrGSegment2ptsItem ?s ?a ?b'.
	i concl: 'pointSur  ?s ?b'."

	"i:=e creeRegle: 'interfaceSegment-droite'.
i antecedents: 'DrGSegment2ptsItem ?s ?a ?b
mot:et:rep: d ?a ?m1
mot:et:rep: ?m1 ?b ?m'.

i concl: 'DrGLine2ptsItem ?m ?a ?b'."
	i := e creeRegle: 'objetsSur-PointSurSegmentMilieu1'.
	i
		antecedents:
			'DrGSegment2ptsItem ?s ?a ?b
milieu ?s ?m'.
	i concl: 'pointSur  ?s ?m'.
	"
i:=e creeRegle: 'objetsSur-PointSurSegmentMilieu2'.
i antecedents: 'DrGSegment2ptsItem ?s ?a ?b
milieu ?s ?m
mot:et:rep: s ?a ?m1
mot:et:rep: ?m1  ?m ?s1'.

i concl: 'segment  [ ?s1 ?a ?m ]'.

i:=e creeRegle: 'objetsSur-PointSurSegmentMilieu3'.
i antecedents: 'DrGSegment2ptsItem ?s ?a ?b
milieu ?s ?m
mot:et:rep: s ?m ?m1
mot:et:rep: ?m1  ?b ?s1
'.

i concl: 'segment  [ ?s1 ?m ?b ]'.

i:=e creeRegle: 'objetsSur-PointSurSegmentMilieu4'.
i antecedents: 'DrGSegment2ptsItem ?s ?a ?b
milieu ?s ?m
segment  ?s1 [ ?m ?b ]'.

i concl: 'segmentSur   ?s ?s1'.

 "
	i := e creeRegle: 'objetsSur-PointIntersection1'.
	i antecedents: 'DrGPointIntersectionItem ?pt ?L1 ?L2 '.
	i concl: 'pointSur  ?L1 ?pt'.
	i com: 'le point interesection est sur le premier objet.'.
	i := e creeRegle: 'objetsSur-PointIntersection2'.
	i antecedents: 'DrGPointIntersectionItem ?pt ?L1 ?L2 '.
	i concl: 'pointSur ?L2 ?pt'.
	i com: 'le point interesection est sur le deuxième objet.'.
	"i := e creeRegle: 'objetsSur-PointSurDroite1'.
	i antecedents: 'DrGLine2ptsItem ?D1 ?A ?B'.
	i concl: 'pointSur ?D1 ?A'.
	i := e creeRegle: 'objetsSur-PointSurDroite2'.
	i antecedents: 'DrGLine2ptsItem ?D1 ?A ?B'.
	i concl: 'pointSur ?D1 ?B'."
	i := e creeRegle: 'objetsSur-PointSurDemi-droiteDroite1'.
	i
		antecedents:
			'demi-droite ?dd ?a ?b
sorteDeDroite ?sd
pointsSur ?dd ?pts
pointSur ?sd ?x
pointSur ?sd ?y
contient:el: ?pts  ?x
contient:el: ?pts  ?y
different:de: ?x ?y
different:de: ?dd ?sd'.
	i concl: 'demi-droiteSur ?sd ?dd'.
	i := e creeRegle: 'objetsSur-PointSurDemi--droiteDroite2'.
	i antecedents: 'DrGRay2ptsItem ?D1 ?A ?B'.
	i concl: 'pointSur ?D1 ?B'.
	
	i := e creeRegle: 'objetsSur-PointSurSorteDeDroite1'.
	i antecedents:
			'sorteDeDroite ?d ?A ?B
point ?A
point ?B'.
	i concl: 'pointSur ?d ?A'.
	i
		com: 'Un point qui définit sorte de droite est sur  cette sorte de droite'.
	i := e creeRegle: 'objetsSur-PointSurSorteDeDroite2'.
	i
		antecedents:
			'sorteDeDroite ?d ?A ?B
point ?A
point ?B'.
	i concl: 'pointSur ?d ?B'.
	i
		com:
			'Un point qui définit une sorte de droite est sur  cette sorte de droite'.
	i := e creeRegle: 'objetsSur-PointSurPerpendiculairePassantParUnPoint'.
	i antecedents: 'perpendiculaire ?p ?d ?x'.
	i concl: 'pointSur ?p ?x'.
	i
		com:
			'Le  point par où passe une perpendiculaire est  sur cette perpendiculaire'.
	"	i := e creeRegle: 'objetsSur-PointsSurPerpendiculaire1'.
	i
		antecedents:
			'perpendiculaire [ ?a  ?b ]   ?d
sorteDeDroite  ?d2
different:de:    [ ?a ?b ] d2
pointSur ?d2 ?a
pointSur ?d2 ?b
ordonneMot:et:rep1:rep2:  ?d2 ?d ?dd2 ?dd'.
	i concl: 'perpendiculaire ?dd2 ?dd'.
	i com: 'Sorte de droite située sur une perpendiculaire.'.
	i := e creeRegle: 'objetsSur-PointsSurPerpendiculaires2'.
	i
		antecedents:
			'perpendiculaire ?d [ ?a  ?b ]  
sorteDeDroite  ?d2
different:de:    [ ?a ?b ] d2
pointSur ?d2 ?a
pointSur ?d2 ?b
ordonneMot:et:rep1:rep2:  ?d2 ?d ?dd2 ?dd'.
	i concl: 'perpendiculaire ?dd2 ?dd'.
	i com: 'Sorte de droite située sur une perpendiculaire.'."
	i := e creeRegle: 'objetSsur-PointSurDroite3'.
	i antecedents: 'DrGLine2ptsItem ?D1 ?A ?B'.
	i concl: 'pointSur ?D1 ?A'.
	i := e creeRegle: 'objetsSur-PointSurDroite4'.
	i antecedents: 'droite ?D1 ?A ?B'.
	i concl: 'pointSur ?D1 ?B'.	"
	"
	i := e creeRegle: 'objetsSur-SegmentSurSorteDeDroite'.
	i
		antecedents:
			'segment ?s [  ?a ?b ]
sorteDeDroite ?d
pointSur ?d ?a
pointSur ?d ?b
different:de: ?d ?s'.
	i concl: 'segmentSur ?d [ ?a ?b ]'.
	i := e creeRegle: 'objetsSur-CoupleSurSorteDeDroite'.
	i
		antecedents:
			' sorteDeDroite ?d
pointSur ?d ?a
pointSur ?d ?b
ordonneMot:et:rep1:rep2: ?a ?b ?aa ?bb
pointDifferent:de: ?a ?b'.
	i concl: 'coupleSur ?d [ ?aa ?bb ]'.
	i com: 'Un couple sur une sorte de droite'.
	e
		lisRegle: 'objetsSur-PointSur-parallèle'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
coupleSur ?d1 ?s1
parallèle ?d2  ?d1
coupleSur ?d2 ?s2
égaux:et: ?s1 [  ?x1 ?y1 ]
égaux:et: ?s2 [  ?x2 ?y2 ]
different:de: ?d1 ?d2
different:de: ?s1 ?s2
different:de: [  ?x1 ?y1 ] [ ?y2 ?x2 ]'
		alors: 'parallèle ?s1 ?s2'
		com: 'Des segments sur des sortes de droites parallèles sont parallèles'.
	e
		lisRegle: 'objetsSur-PointSurParallèle'
		si:
			'parallèle ?d2  ?d1
coupleSur ?d1 ?s1
coupleSur ?d2 ?s2
different:de: ?d1 ?d2
different:de: ?s1 ?s2
égaux:et: ?s1 [  ?x1 ?y1 ]
égaux:et: ?s2 [  ?x2 ?y2 ]
different:de: [  ?x1 ?y1 ] [ ?y2 ?x2 ]
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2'
		alors: 'parallèle ?ss1 ?ss2'
		com: 'Des couples sur des sortes de droites parallèles sont parallèles'.
		
			e
		lisRegle: 'objetsSur-transversale'
		si:'intersection ?i1 ?d1  ?d3
intersection ?i2 ?d2  ?d3
ordonneMot:et:rep1:rep2: ?d1 ?d2  ?d1 ?d2
relation:et:nom: ?d1 ?d2 parallèle
different:de: ?d1 ?d2
different:de: ?d3 ?d1
different:de: ?d3 ?d2'
		alors: 'transversale ?d3 [ ?i1 ?i2 ]'
		com: 'une droite qui coupe des parallèles et ses intersections avec les paralléles.'.
	i := e creeRegle: 'objetsSur-VecteurSurDroite'.
	i
		antecedents:
			'vecteur ?s ?x ?y
pointSur ?D1 ?x
pointSur ?D1 ?y
different:de: ?x ?y
droite ?D1 
'.
	i concl: 'vecteurSur ?D1 ?s'.
	e
		lisRegle: 'objetsSur-SegmentSurBissectrice'
		si:
			'segment ?s [ ?x ?p2 ]
bissectrice  ?D1 ?p1 ?p2 ?p3
pointSur ?D1 ?x
different:de: ?x  ?p2'
		alors: 'segmentSur ?D1 ?s'.
	i := e creeRegle: 'objetsSur-VecteurSursegment'.
	i
		antecedents:
			'vecteur ?s ?x ?y
segment ?D1 [ ?x ?y ]'.
	i concl: 'segmentSur ?D1 ?s'.
	e
		lisRegle: 'objetsSur-SegmentSurBissectrice'
		si:
			'segment ?s [ ?x ?p2 ]
bissectrice  ?b ?p1 ?p2 ?p3
pointSur ?b ?x
different:de: ?x  ?p2
different:de: ?x  ?p3
different:de: ?x ?p1'
		alors: 'segmentSur ?b ?s'.
	i := e creeRegle: 'objetsSur-SegmentSurMediatrice'.
	i
		antecedents:
			'mediatrice  ?D1 ?p1 ?p2 
pointSur ?D1 ?x
pointSur ?D1 ?y
segment ?s [ ?x ?y ]
different:de: ?x ?y'.
	i concl: 'segmentSur ?D1 ?s'.
	i := e creeRegle: 'objetsSur-SegmentSurSegment'.
	i
		antecedents:
			'segment ?s [ ?x ?y ]
segment ?s1 [ ?a ?b ]
pointSur ?s1 ?x
pointSur ?s1 ?y
different:de: ?s ?s1
different:de: ?x ?y
different:de: ?x ?a
different:de: ?y ?b
'.
	i concl: 'segmentSur ?s1 ?s'.
	e
		lisRegle: 'objetsSur-SegmentSurPerp1'
		si:
			'perpendiculaire  ?D1 ?a ?b
pointSur ?D1 ?x
pointSur ?D1 ?y
segment ?s [ ?x ?y ]
different:de: ?D1 ?s'
		alors: 'segmentSur ?D1 ?s'.
	e
		lisRegle: 'objetsSur-SegmentSurPerp2'
		si:
			'perpendiculaire  ?D1 ?a ?b
pointSur ?a ?x
pointSur ?a ?y
segment ?s [ ?x ?y ]
different:de: ?a ?s'
		alors: 'segmentSur ?a ?s'.
	e
		lisRegle: 'objetsSur-SegmentSurParal'
		si:
			'segment ?s [ ?x ?y ]
pointSur ?D1 ?x
pointSur ?D1 ?y
parallèle  ?D1 ?a 
different:de: ?D1 ?s'
		alors: 'segmentSur ?D1 ?s'.
	e
		lisRegle: 'objetsSur-perpendiculaiereSegmentSurPerp2'
		si:
			'segment ?s [ ?x ?y ]
pointSur ?D1 ?x
pointSur ?D1 ?y
different:de: ?x ?y
perpendiculaire  ?D1 ?D2'
		alors: 'perpendiculaire [ ?x ?y ] ?D2'.
	"	i := e creeRegle: 'objetsSur-CordesurCercle'.
	i
		antecedents:
			'cercle ?C 
pointSur ?C ?x
pointSur ?C ?y
sorteDeDroite ?d 
pointSur ?d ?x
pointSur ?d ?y
coupleSur ?d [ ?x ?y ]
different:de: ?x ?y'.
	i concl: 'corde ?C [ ?x ?y ]'.
	i
		com:
			'Un couple sur une droite qui a ses deux points sur un même cercle est une corde de ce cercle'."
	e
		lisRegle: 'objetsSur-cordeSegment'
		si:
			'segment ?s [  ?p1 ?p2  ]
cercle ?c
pointSur ?c ?p1
pointSur ?c ?p2'
		alors: 'cercle ?c [ corde: ?s ]'
		com:
			'Un segment qui a ses extrémités sur un cercle est une corde sde ce cercle'.
	i := e creeRegle: 'objetsSur-SegmentSurDroite2'.
	i
		antecedents:
			'segment ?s [ ?x ?y ]
pointSur ?D1 ?x
pointSur ?D1 ?y
different:de: ?x ?y
different:de: ?D1 ?s
droite ?D1 ?a ?b'.
	i concl: 'segmentSur ?D1 ?s'.
	e
		lisRegle: 'objetsSur-cordeCouple'
		si:
			'cercle ?c
pointSur ?c ?p1
pointSur ?c ?p2
different:de: ?p1 ?p2'
		alors: 'cercle ?c [  corde: [ ?p1 ?p2 ] ]'
		com:
			'Un segment qui a ses extrémités sur un cercle est une corde de ce cercle'.
	i := e creeRegle: 'objetsSur-SegmentSurDroite2'.
	i
		antecedents:
			'segment ?s [ ?x ?y ]
pointSur ?D1 ?x
pointSur ?D1 ?y
different:de: ?x ?y
different:de: ?D1 ?s
droite ?D1 ?a ?b'.
	i concl: 'segmentSur ?D1 ?s'.
	e
		lisRegle: 'objetsSur-cerclePointOpposé1'
		si:
			'cercle ?cer
cercle ?cer [  c: ?o ]
pointSur ?cer ?p1
milieu [ ?p1 ?p2 ] ?o'
		alors: 'pointSur ?cer ?p2'
		com:
			'Si le milieu d''un couple de points est le centre d''un cercle et l''un des points du couple sur le cercle, alors l''autre point du couple est aussi sur  ce cercle.'.
	e
		lisRegle: 'objetsSur-cerclePointOpposé2'
		si:
			'cercle ?cer
cercle ?cer [  centre: ?o ]
pointSur ?cer ?p2
milieu [ ?p1 ?p2 ] ?o'
		alors: 'pointSur ?cer ?p1'
		com:
			'Si le milieu d''un couple de points est le centre d''un cercle et l''un des points du couple sur le cercle, alors l''autre point du couple est aussi sur  ce cercle.'.
	"	e
		lisRegle: 'pointSur-diamètreCercle1'
		si:
			'cercle ?cercle 
cercle ?cercle [ centre: ?centre ] 
pointSur ?cercle ?p1
pointSur ?cercle ?p2
milieu [ ?p1 ?p2 ] ?centre'
		alors: 'diamètre ?cercle   [ ?p ?p2 ]'
		com:
			'Si un segment a une extrémité sur un cercle et son milieu au centre du cercle c''est un diamètre'."
	e
		lisRegle: 'objetsSur-diamètreCercle2'
		si:
			'cercle ?cercle 
cerle ?cercle [ centre: ?centre ] 
milieu ?s ?centre
pointSur ?cercle ?p2
segment ?s [ ?p2 ?p ]'
		alors: 'diamètre ?cercle   [ ?p ?p2 ]'
		com:
			'Si un segment ou un couple a une extrémité sur un cercle et son milieu au centre du cercle c''est un diamètre'.
	e
		lisRegle: 'objetsSur-diamètreCercle2'
		si:
			'cercle ?cercle 
cerle ?cercle [ centre: ?centre ] 
milieu ?s ?centre
segment ?s [ ?p ?p2 ]
pointSur ?s ?p2'
		alors: 'diamètre ?cercle   [ ?p ?p2 ]'
		com:
			'Si un segment a une extrémité sur un cercle et son milieu au centre du cercle c''est un diamètre'.
	e
		lisRegle: 'objetsSur-diamètreCercleExtrémités1'
		si:
			'diamètre ?cercle  ?s
cercle ?cercle ?centre ?x
segment ?s [ ?p1 ?p2 ]
pointSur ?cercle ?p1'
		alors: 'pointSur ?cercle  ?p1'
		com:
			'Si un segment est le diamètre d''un cerlce ses extrémités sont sur le cercle.'.
	e
		lisRegle: 'objetsSur-diamètreCercleExtrémités2'
		si:
			'diamètre ?cercle  ?s
cercle ?cercle ?centre ?x
segment ?s [ ?p1 ?p2 ]
pointSur ?cercle ?p2'
		alors: 'pointSur ?cercle  ?p1'
		com:
			'Si un segment est le diamètre d''un cerlce ses extrémités sont sur le cercle.'.
	i := e creeRegle: 'objetsSur-Segmentparallèles'.
	i
		antecedents:
			'parallèle ?d1 ?d2
segmentSur ?d1 ?s1
segmentSur ?d2 ?s2
different:de: ?d1 ?d2
different:de:  ?S1 ?S2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2'.
	i concl: 'parallèle ?ss1 ?ss2'.
	i := e creeRegle: 'objetsSur-droitesparallèles'.
	i
		antecedents:
			'parallèle ?s1 ?s2
segmentSur ?d1 ?s1
segmentSur ?d2 ?s2
droite ?d1 ?i ?j
droite ?d2 ?k ?l
different:de: ?d1 ?d2
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?dd1 ?dd2'.
	i concl: 'parallèle ?dd1 ?dd2'.
	i := e creeRegle: 'objetsSur-Intersectiondroites'.
	i
		antecedents:
			'droite ?o2
droite ?o1
pointSur ?o1 ?pt
pointSur ?o2 ?pt
different:de: ?o1 ?o2
ordonneMot:et:rep1:rep2:  ?o1 ?o2 ?oo1 ?oo2'.
	i concl: 'intersection ?pt ?oo1 ?oo2'.
"	i := e creeRegle: 'objetsSur-Intersection1'.
	i
		antecedents:
			'pointSur ?o1 ?pt
pointSur ?o2 ?pt
sorteDeDroite ?o1
sorteDeDroite  ?o2
ordonneMot:et:rep1:rep2:  ?o1 ?o2  ?o1 ?o2
nonRelation:et:nom: ?o1 ?o2 parallèle
different:de: ?o1 ?o2'.
	i concl: 'intersection ?pt ?o1 ?o2'.
	i
		com:
			'Un point sur deux objets différents est une intersection de ces objets.'."
	i := e creeRegle: 'objetsSur-PointIntersection'.
	i
		antecedents:
			'intersection ?pt ?o1 ?o2 
'.
	i concl: 'point ?pt'.
	i := e creeRegle: 'objetsSur-PointIntersection1'.
	i
		antecedents:
			'intersection ?pt ?o1 ?o2 
'.
	i concl: 'pointSur ?o1 ?pt'.
	i com: 'Le point d''intersection est sur le premier objet'.
	i := e creeRegle: 'objetsSur-PointIntersection2'.
	i
		antecedents:
			'intersection ?pt ?o1 ?o2 
'.
	i concl: 'pointSur ?o2  ?pt'.
	i com: 'Le point d''intersection est sur le deuxième objet'.
	e
		lisRegle: 'objetsSur-symCentrale'
		si:
			'symetrieCentrale ?cible  ?orig  ?centre
point ?orig
pointSur  ?obj  ?orig
symetrieCentrale ?cible2  ?obj ?centre
'
		alors: 'pointSur ?cible2 ?cible'.
	"
i :=e creeRegle: 'interfaceSegments'.
i antecedents: 'pointSur ?D ?p1
pointSur ?D ?p2
~ segment ?x [ ?p1 ?p2 ]
different:de: ?p1 ?p2
mot:et:rep:  ?p1 ?p2 ?s
mot:et:rep: s ?s ?s2'.
i concl: 'segment ?s2  [ ?p1 ?p2 ] '."

	"e lisRegle: 'objetsSur-diamètre'
si: 'cercle  ?c ?centre  ?x
segment ?s [ ?p1 ?pt ]
pointSur ?c ?pt
pointSur ?s  ?centre
intersection ?p1 ?c  ?s'
alors: 'pointSur ?c ?p1'."
	e
		lisRegle: 'objetsSur-PointSur-milieuSurSegment'
		si:
			'segment ?s [ ?a ?b ]
milieu ?a ?b ?i'
		alors: 'milieu ?s ?i'
		com:
			'le milieu entre deux points reliés par un segment est aussi le milieu du segment'.
	e
		lisRegle: 'objetsSur-PointSur-milieuSurSegment'
		si:
			'segment ?s [ ?a ?b ]
milieu ?a ?b ?i'
		alors: 'milieu ?s ?i'
		com:
			'le milieu entre deux points reliés par un segment est aussi le milieu du segment'.
	e
		lisRegle: 'objetsSur-confondus'
		si:
			'angle0 [ ?a ?s ?b  ]
médiatrice ?d1 [ ?a ?b ]
pointsSur:rep: ?d1 ?pts0
enleverDe:el:rep: ?pts0 ?s ?pts1
pointSur ?d1 ?O
pointSur ?d1 ?p1
point:rep: ?O ?ptO
point:rep: ?p1 ?ptp1
index:el:rep:  ?pts1 ?p1  ?ind1
index:el:rep:  ?pts1 ?O  ?indO
supérieur:à: ?ind1 ?indO
pointConfondu:avec: ?p1 ?O'
		alors: 'position  ?p1 ConfonduAvec ?O ?d1'
		com: 'Des points confondus sur une droite'.
	e
		lisRegle: 'objetsSur-angleAprès1'
		si:
			'angle0 [ ?a ?s ?b  ]
médiatrice ?d1 [ ?a ?b ]
pointsSur:rep: ?d1 ?pts0
enleverDe:el:rep: ?pts0 ?s ?pts1
pointSur ?d1 ?p1
index:el:rep:  ?pts1 ?p1  ?ind1
index:el:rep:  ?pts1 ?O  ?indO
point:rep: ?O ?ptO
point:rep: ?p1 ?ptp1
supérieur:à: ?ind1 ?indO
different:de: ?ptp1 ?ptO
nonPointConfondu:avec: ?p1 ?O'
		alors: 'position  ?p1 Après ?O ?d1'
		com: 'Un point sur une droite Après un autre.'.
	e
		lisRegle: 'objetsSur-angleAprès2'
		si:
			'angle0 [ ?a ?s ?b  ]
médiatrice ?d1 [ ?a ?b ]
pointsSur:rep: ?d1 ?pts0
enleverDe:el:rep: ?pts0 ?s ?pts1
pointSur ?d1 ?O
pointSur ?d1 ?p1
point:rep: ?O ?ptO
point:rep: ?p1 ?ptp1
index:el:rep:  ?pts1 ?p1  ?ind1
index:el:rep:  ?pts1 ?O  ?indO
supérieur:à: ?ind1 ?indO
different:de: ?ptp1 ?ptO
nonPointConfondu:avec: ?p1 ?O'
		alors: 'position  ?p1 Après ?O ?d1'
		com: 'Un point sur une droite Après un autre.'.
	e
		lisRegle: 'objetsSur-angleAvant1'
		si:
			'angle0 [ ?a ?s ?b  ]
médiatrice ?d1 [ ?a ?b ]
pointsSur:rep: ?d1 ?pts0
enleverDe:el:rep: ?pts0 ?s ?pts1
pointSur ?d1 ?p1
pointSur ?d1 ?O
point:rep: ?O ?ptO
point:rep: ?p1 ?ptp1
index:el:rep:  ?pts1 ?p1  ?ind1
index:el:rep:  ?pts1 ?O  ?indO
inférieur:à: ?ind1 ?indO
different:de: ?ptp1 ?ptO
nonPointConfondu:avec: ?p1 ?O'
		alors: 'position ?p1 Avant ?O ?d1'
		com: 'Un point sur une droite Avant un autre.'.
	e
		lisRegle: 'objetsSur-angleAvant2'
		si:
			'angle0 [ ?a ?s ?b  ]
médiatrice ?d1 [ ?a ?b ]
pointsSur:rep: ?d1 ?pts0
enleverDe:el:rep: ?pts0 ?s ?pts1
pointSur ?d1 ?p1
point:rep: ?O ?ptO
point:rep: ?p1 ?ptp1
index:el:rep:  ?pts1 ?p1  ?ind1
index:el:rep:  ?pts1 ?O  ?indO
inférieur:à: ?ind1 ?indO
different:de: ?ptp1 ?ptO
nonPointConfondu:avec: ?p1 ?O'
		alors: 'position  ?p1 Avant ?O ?d1'
		com: 'Un point sur une droite Avant un autre.'.
	e
		lisRegle: 'objetsSur-positionSecanteAvant1'
		si:
			' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d3 ?pts
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
intersection ?O ?dd1 ?dd3
justeAvant:el:rep: ?pts ?O ?x'
		alors: 'position ?x Avant ?O ?d3'
		com: 'Un point avant un autre sur la sécante de deux parallèles.'.
	e
		lisRegle: 'objetsSur-positionSecanteAprès1'
		si:
			' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d3 ?pts
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
intersection ?O ?dd1 ?dd3
justeAprès:el:rep: ?pts ?O ?x'
		alors: 'position ?x Après ?O ?d3'
		com: 'Un point avant un autre sur la sécante de deux parallèles.'.
	e
		lisRegle: 'objetsSur-positionSecanteAvant2'
		si:
			' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d3 ?pts
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?dd3
intersection ?O ?dd2 ?dd3
justeAvant:el:rep: ?pts ?O ?x'
		alors: 'position ?x Avant ?O ?d3'
		com: 'Un point avant un autre sur la sécante de deux parallèles.'.
	e
		lisRegle: 'objetsSur-positionSecanteAprès2'
		si:
			' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d3 ?pts
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?dd3
intersection ?O ?dd2 ?dd3
justeAprès:el:rep: ?pts ?O ?x'
		alors: 'position ?x Après ?O ?d3'
		com: 'Un point avant un autre sur la sécante de deux parallèles.'.
	e
		lisRegle: 'objetsSur-positionSecanteAvant3'
		si:
			'parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d1 ?pts
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
intersection ?O ?dd1 ?dd3
justeAvant:el:rep: ?pts ?O ?x'
		alors: 'position ?x Avant ?O ?d1'
		com: 'Un point avant un autre sur l''une des deux parallèles.'.
	e
		lisRegle: 'objetsSur-positionSecanteAprès3'
		si:
			'parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d1 ?pts
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
intersection ?O ?dd1 ?dd3
justeAprès:el:rep: ?pts ?O ?x'
		alors: 'position ?x Après ?O ?d1'
		com: 'Un point avant un autre sur l''une des deux parallèles.'.
	e
		lisRegle: 'objetsSur-positionSecanteAvant4'
		si:
			' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d2 ?pts
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?dd3
intersection ?O ?dd2 ?dd3
justeAvant:el:rep: ?pts ?O ?x'
		alors: 'position ?x Avant ?O ?d2'
		com: 'Un point avant un autre sur l''une des deux parallèles.'.
	e
		lisRegle: 'objetsSur-positionSecanteAprès4'
		si:
			'parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d2 ?pts
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?dd3
intersection ?O ?dd2 ?dd3
justeAprès:el:rep: ?pts ?O ?x'
		alors: 'position ?x Après ?O ?d2'
		com: 'Un point avant un autre sur l''une des  deux parallèles.'.
	e
		lisRegle: 'objetsSur-Entre'
		si:
			'position  ?x Avant ?y ?d1
position  ?x Après ?z ?d1
different:de: ?y ?z'
		alors: 'entre ?x ?y  ?z ?d1'
		com: 'Un point sur une droite entre deux points.'.
	e
		lisRegle: 'objetsSur-PerpendiculaireCouple'
		si:
			'coupleSur ?x [ ?x1 ?x2 ]
coupleSur ?y [  ?y1 ?y2  ]
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy
ordonneMot:et:rep1:rep2: ?cplx ?cply ?cplxx ?cplyy
perpendiculaire ?xx ?yy
different:de: ?x ?y'
		alors: 'perpendiculaire ?cplxx ?cplyy'
		com:
			'Si des couples sont sur des objets perpendiculaires, alors les couples sont aussi perpendiculaires.'.
	e
		lisRegle: 'objetsSur-Après1'
		si:
			'sorteDeDroite ?d1
pointSur ?d1 ?p1
pointSur ?d1 ?p2 
pointsSur ?d1 ?pts1
index:el:rep:  ?pts1 ?p1  ?ind1
index:el:rep:  ?pts1 ?p2  ?ind2
supérieur:à: ?ind1 ?ind2
different:de: ?p2 ?p1
nonPointConfondu:avec: ?p1 ?p2'
		alors: 'position  ?p1 Après ?p2 ?d1'
		com: 'Un point sur une droite Après un autre.'.
	e
		lisRegle: 'objetsSur-Avant1'
		si:
			' sorteDeDroite ?d1
pointSur ?d1 ?p1
pointSur ?d1 ?p2 
pointsSur ?d1 ?pts1
index:el:rep:  ?pts1 ?p1  ?ind1
index:el:rep:  ?pts1 ?p2  ?ind2
inférieur:à: ?ind1 ?ind2
different:de: ?p2 ?p1
nonPointConfondu:avec: ?p1 ?p2'
		alors: 'position ?p1 Avant ?p2 ?d1'
		com: 'Un point sur une droite Avant un autre.'




	"e lisRegle: 'objetsSur-pointsSurInit1'
si: 'pointSur ?obj ?p'

alors: 'pointsSur ?obj [ ?p ]'.

e lisRegle: 'objetsSur-pointsSurSuite'
si: 'sorAvantroite ?obj
pointSur ?obj ?p
pointsSur ?obj ?res0
ajouteDernierUnique:el:rep: ?res0 ?p ?res
triePointsSur:droite:rep: ?res  ?obj  ?res1'
alors: 'pointsSur ?obj ?res1'.

e lisRegle: 'objetsSur-pointsSurInit2'
si: 'pointSur ?obj ?p
intersection ?p ?x ?obj'
alors: 'pointsSur ?obj [ ?p ]'.

e lisRegle: 'objetsSur-plusGrandPointsSur'
si: 'pointsSur ?x1 ?x2
taille:rep: ?x2 ?rep
pointsSur ?x1 ?x3
taille:rep: ?x3 ?rep2
inférieur:à: ?rep ?rep2
retireFait: pointsSur ?x1 ?x2'
alors: 'pointsSur ?x1 ?x2 retiré'. "! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 12/20/2023 17:27'!
ohmRegles: e
	e
		lisRegle: 'Ohm-Regles-texte'
		si: 'DrGTextItem ?x ?y ?z ?v ?u'
		alors: '?y ?z  ?v ?u'
		com: 'lecture de données texte.'.
	"e
		lisRegle: 'valeurResistance'
		si: 'DrGItem ?nom resistance ?n ?v'
		alors: 'resistance ?n ?v Ohm-s'.
	e
		lisRegle: 'valeurCourant'
		si: 'DrTextGItem ?nom courant  ?n ?v'
		alors: 'courant ?n ?v A'.
	e
		lisRegle: 'valeurTension'
		si: 'DrGValueValueItem ?nom tension  ?n ?v'
		alors: 'tension ?n ?v V'."
	e
		lisRegle: 'Ohm-ResistanceEqSerie'
		si:
			'serie ?R1 ?R2
resistance ?R1 ?r1 ?u
resistance ?R2 ?r2 ?u
somme:et:rep: ?r1 ?r2 ?r'
		alors: 'resistance [ serie ?R1 ?R2 ] ?r ?u'
		com:
			'La résistance équivalente à deux résitances en série est égale à la somme des résistances. '.
	e
		lisRegle: 'Ohm-CourantSerie1'
		si:
			'serie ?r1 ?r2
courant ?r1 ?i A'
		alors: 'courant ?r2 ?i A'
		com:
			'Dans des résistance en série, le courant  est le même pour  chaque résistance.'.
	e
		lisRegle: 'Ohm-CourantSerie2'
		si:
			'serie ?r1 ?r2
courant ?r2 ?i A'
		alors: 'courant ?r1 ?i A'
		com:
			'Dans des résistance en série, le courant  est le même pour  chaque résistance.'.
	e
		lisRegle: 'Ohm-CourantSerie3'
		si:
			'serie ?r1 ?r2
courant ?r2 ?i A'
		alors: 'courant [ serie ?r1 ?r2 ] ?i A'
		com:
			'Dans un circuit de deux résistance en série, le courant  est le même que pour chaque résistance.'.
	e
		lisRegle: 'Ohm-CourantSerie4'
		si:
			'serie ?r1 ?r2
courant ?r1 ?i A'
		alors: 'courant [ serie ?r1  ?r2 ] ?i A'
		com:
			'Dans un circuit de deux résistance en série, le courant  est le même que pour chaque résistance.'.
	e
		lisRegle: 'Ohm-CourantSerie5'
		si:
			'serie ?r1 ?r2
courant [ serie ?r1  ?r2 ] ?i A'
		alors: 'courant ?r1 ?i A'
		com:
			'Dans un circuit de deux résistance en série, le courant  est le même pour une résistance que pour le circuit.'.
	e
		lisRegle: 'Ohm-CourantSerie6'
		si:
			'serie ?r1 ?r2
courant [ serie ?r1  ?r2 ] ?i A'
		alors: 'courant ?r2 ?i A'
		com:
			'Dans un circuit de deux résistance en série, le courant  est le même pour une résistance que pour le circuit.'.
	e
		lisRegle: 'Ohm-ResistanceEqParallele'
		si:
			'parallele ?R1 ?R2
resistance ?R1 ?r1 ?u
resistance ?R2 ?r2 ?u
quotient:et:rep: 1 ?r1 ?q1
quotient:et:rep: 1 ?r2 ?q2
somme:et:rep: ?q1 ?q2 ?q
quotient:et:rep: 1 ?q ?req
~ resistance [ parallele ?R1 ?R2 ] ?xreq Ohm-s'
		alors: 'resistance [ parallele ?R1 ?R2 ] ?req Ohm-s'
		com:
			'La résistance équvalente au circuit de deux résistances en parallèle est l''inverse de la somme des inverses des résistances.'.
	e
		lisRegle: 'Ohm-CourantParallele1'
		si:
			'parallele ?r1 ?r2
courant ?r1 ?i1 A
courant ?r2 ?i2 A
somme:et:rep: ?i1 ?i2 ?i'
		alors: 'courant [ parallele ?r1  ?r2 ] ?i A'
		com:
			'Le courant dans un circuit de deux résisrances en parallèles est la somme des courants dans chaque résistance.'.
	e
		lisRegle: 'Ohm-CourantParallele'
		si: 'courant [ parallele ?r1  ?r2 ] ?i A'
		alors: 'parallele ?r1 ?r2'
		com:
			'Si l''on affrme le courant dans deux résistances en parallèle, on affirme que les résistances sont en parallèle.'.
	e
		lisRegle: 'Ohm-CourantParallele2'
		si:
			'courant [ parallele ?r1  ?r2 ] ?i A
courant ?r2 ?i2 A
difference:et:rep: ?i ?i2 ?i1
~ courant ?r1 ?xi1 A'
		alors: 'courant ?r1 ?i1 A'
		com:
			'Si l''on connait le courant dans une résistance, et  le courant dans un circuit de deux résistances en parallèles
, on peut calculer le courant dans l''autre résistance.'.
	e
		lisRegle: 'Ohm-CourantParallele3'
		si:
			'courant [ parallele ?r1  ?r2 ] ?i A
courant ?r1 ?i1 A
difference:et:rep: ?i ?i1 ?i2
~ courant ?r2 ?xi2 A'
		alors: 'courant ?r2 ?i2 A'
		com:
			'Si l''on connait le courant dans une résistance, et  le courant dans un circuit de deux résistances en parallèles
, on peut calculer le courant dans l''autre résistance.'.
	e
		lisRegle: 'Ohm-TensionSerie1'
		si:
			'tension [ serie ?r1 ?r2 ] ?u  V
tension ?r2 ?u2 V
difference:et:rep: ?u ?u2 ?u1
~ tension ?r1 ?xu1 V'
		alors: 'tension ?r1 ?u1 V'
		com:
			'Si l''on connait la tension dans une résistance, et  la tension du circuit de deux résistances en série
, on peut calculer la tension de l''autre résistance.'.
	e
		lisRegle: 'Ohm-TensionSerie'
		si: 'tension [ serie ?r1 ?r2 ] ?u  V'
		alors: 'serie ?r1 ?r2'
		com:
			'Si l''on affime  la tension du circuit de deux résistances en série,
on peut affirmer que les résistances sont en série.'.
	e
		lisRegle: 'Ohm-TensionSerie2'
		si:
			'tension [ serie ?r1 ?r2 ] ?u  V
tension ?r1 ?u1 V
difference:et:rep: ?u ?u1 ?u2
~ tension ?r2 ?xu2 V'
		alors: 'tension ?r2 ?u2 V'
		com:
			'Si l''on connait la tension dans une résistance, et  la tension du circuit de deux résistances en série,
 on peut calculer la tension de l''autre résistance.'.
	e
		lisRegle: 'Ohm-TensionSerie3'
		si:
			'serie ?r1 ?r2
tension ?r1 ?u1 V
tension ?r2 ?u2 V
somme:et:rep: ?u1 ?u2 ?u
~ tension [ serie ?r1 ?r2 ] ?xu  V'
		alors: 'tension [ serie ?r1 ?r2 ] ?u  V'
		com:
			'La tension d''un circuit de deux résistances en série est la somme des tensions des résistances.'.
	e
		lisRegle: 'Ohm-TensionParallele1'
		si:
			'parallele ?r1 ?r2
tension ?r2 ?u V
~ tension ?r1 ?xu V'
		alors: 'tension ?r1 ?u V'
		com: ' Des résistances  en parallèle ont la même  tension.'.
	e
		lisRegle: 'Ohm-TensionParallele2'
		si:
			'parallele ?r1 ?r2
tension ?r1 ?u V
~ tension ?r2 ?xu V'
		alors: 'tension ?r2 ?u V'
		com: 'Des résistances en parallèle ont la même tension.'.
	e
		lisRegle: 'Ohm-TensionParallele3'
		si:
			'parallele ?r1 ?r2
tension ?r1 ?u V
~ tension [ parallele ?r1 ?r2  ] ?xu V'
		alors: 'tension [ parallele ?r1 ?r2  ] ?u V'
		com:
			'Dans un circuit de résistances en parallèle, le circuit a la même tension que chaque résistance.'.
	e
		lisRegle: 'Ohm-TensionParallele5'
		si:
			'tension [ parallele ?r1 ?r2  ] ?u V
~ tension ?r1 ?xu V'
		alors: 'tension ?r1 ?u V'
		com:
			'Dans un circuit de résistances en parallèle, chaque résistance a la même tension que le circuit.'.
	e
		lisRegle: 'Ohm-TensionParallele6'
		si:
			'tension [ parallele ?r1 ?r2  ] ?u V
~ tension ?r2 ?xu V'
		alors: 'tension ?r2 ?u V'
		com:
			'Dans un circuit de résistances en parallèle, chaque résistance a la même tension que le circuit.'.
	e
		lisRegle: 'Ohm-TensionParallele4'
		si:
			'parallele ?r1 ?r2
tension ?r2 ?u V
~ tension [ parallele ?r1 ?r2  ] ?xu V'
		alors: 'tension [ parallele ?r1 ?r2  ] ?u V'
		com:
			'Dans un circuit de résistances en parallèle, le circuit a la même tension que chaque résistance.'.
	e
		lisRegle: 'Ohm-CircuitSerie1'
		si: 'serie [ serie ?r1 ?r2 ] ?r3'
		alors: 'serie ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	e
		lisRegle: 'Ohm-CircuitSerie2'
		si: 'serie ?r3 [ serie ?r1 ?r2 ]'
		alors: 'serie ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	e
		lisRegle: 'Ohm-CircuitSerie3'
		si: 'parallele [ serie ?r1 ?r2 ] ?r3'
		alors: 'serie ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	e
		lisRegle: 'Ohm-CircuitSerie4'
		si: 'parallele ?r3 [ serie ?r1 ?r2 ]'
		alors: 'serie ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	e
		lisRegle: 'Ohm-CircuitParallele1'
		si: 'parallele [ parallele ?r1 ?r2 ] ?r3'
		alors: 'parallele ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	e
		lisRegle: 'Ohm-CircuitParallele2'
		si: 'parallele ?r3 [ parallele ?r1 ?r2 ]'
		alors: 'parallele ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	e
		lisRegle: 'Ohm-CircuitParallele3'
		si: 'serie [ parallele ?r1 ?r2 ] ?r3'
		alors: 'parallele ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	e
		lisRegle: 'Ohm-CircuitParallele4'
		si: 'serie ?r3 [ parallele ?r1 ?r2 ]'
		alors: 'parallele ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	e
		lisRegle: 'Ohm-Resistance'
		si:
			'courant ?r1 ?i A
tension ?r1 ?u V
quotient:et:rep:   ?u ?i ?r
~ resistance ?r1 ?xr Ohm-s'
		alors: 'resistance ?r1 ?r Ohm-s'
		com: 'loi d''Ohm : R = U / I'.
	e
		lisRegle: 'Ohm-Courant'
		si:
			'resistance ?r1 ?r Ohm-s
tension ?r1 ?u V
quotient:et:rep:   ?u ?r ?i
~ courant ?r1 ?xi A'
		alors: 'courant ?r1 ?i A'
		com: 'loi d''Ohm : I = U / R'.
	e
		lisRegle: 'Ohm-Tension'
		si:
			'resistance ?r1 ?r Ohm-s
courant ?r1 ?i A
produit:et:rep:   ?i ?r ?u
~ tension ?r1 ?u V'
		alors: 'tension ?r1 ?u V'
		com: 'loi d''Ohm : U = R * I'! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 5/6/2025 01:04:24'!
paralPerpRegles: e
	"e
		lisRegle: 'paralPerp-perpendiculaireSym'
		si: 'perpendiculaire ?x ?y'
		alors: 'perpendiculaire ?y ?x'
		com: 'Symétrie de la relation perpendiculaire'."

	e
		lisRegle: 'paralPerp-MêmeDirectioninv'
		si:
			'sorteDeDroite ?s1
sorteDeDroite ?s2
vecteur:rep: ?s1  ?vs1
vecteur:rep: ?s2 ?vs2
arrondis:rep:  ?vs1  ?~vs1
arrondis:rep: ?vs2  ?~vs2
négatif:rep: ?~vs2  ?~vs2neg
égal:à: ?~vs1 ?~vs2neg
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
relationCrée:et:nom: ?ss1 ?ss2 parallèleDirection'
		alors: 'relationCréée ?ss1 ?ss2 parallèleDirection'
		com: 'Des sortes de droites de même direction  sont parallèles'.
	e
		lisRegle: 'paralPerp-MêmeDirection'
		si:
			'segment ?s1
segment ?s2
vecteur:rep: ?s1  ?vs1
vecteur:rep: ?s2 ?vs2
arrondis:rep:  ?vs1  ?vs1Ar
abs:rep: ?vs1Ar ?vs1ArAbs
arrondis:rep: ?vs2  ?vs2Ar
abs:rep: ?vs2Ar ?vs2ArAbs
égal:à: ?vs1Ar ?vs2Ar
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
relationCrée:et:nom: ?ss1 ?ss2 parallèleDirection
different:de: ?s1 ?s2'
		alors: 'relationCréée ?ss1 ?ss2 parallèleDirection'
		com: 'Des sortes de droites de même direction  sont parallèles'.
	e
		lisRegle: 'paralPerp-confondue'
		si:
			'point ?p
pointSur ?x1 ?p
pointSur ?x2 ?p
different:de: ?x1 ?x2
relation:et:nom: ?x1 ?x2 parallèle'
		alors: 'parallèlesConfondues ?x1 ?x2'
		com:
			'Si un  même point est sur deux parallèles, alors ces parallèles sont  confondues.'.
	e
		lisRegle: 'paralPerp-angleDroit'
		si:
			'angle [  ?x1 ?o ?x2 ] ?j1
mesure [ ?x1 ?o ?x2 ] 90 ?j 
segment ?perp1 [ ?o  ?x1 ]
segment ?perp2 [ ?x2 ?o  ]'
		alors: 'perpendiculaire ?perp1 ?perp2'
		com: 'Deux couples de points formant un angle de 90° sont perpendiculaires'.
	e
		lisRegle: 'paralPerp-segmentsCouples'
		si:
			'segment ?s1 [ ?x1 ?y1 ]
segment ?s2 [ ?x2 ?y2 ]
different:de: ?s1 ?s2
relation:et:nom: ?s1 ?s2 parallèle
relationCrée:et:nom: [ ?x1 ?y1 ] [ ?x2 ?y2 ] parallèle
ordonneMot:et:rep1:rep2:  [ ?x1 ?y1 ] [ ?x2 ?y2 ] ?x ?y ]'
		alors: 'relationCréée ?x ?y parallèle'
		com: 'Si les segments sont paralèles, leurs couples le sont aussi'.
	"e
		lisRegle: 'paralPerp-segmentsCouplesEntreEux'
		si:
			'segment ?s [ ?x1 ?x2 ]
relationCrée:et:nom: ?s  [ ?x1 ?x2 ] parallèle'
		alors: 'relationCréée  ?s [ ?x1 ?x2 ]  parallèle'
		com:
			'Les segments et leurs couples sont parallèle, réflexivité de la relation'."
	"e
		lisRegle: 'paralPerp-segmentsCouplesRec'
		si:
			'segment ?s1 ?ss1
segment ?s2 ?ss2
different:de: ?s1 ?s2
relation:et:nom: ?ss1 ?ss2 parallèle
ordonneMot:et:rep1:rep2: ?s1  ?s2 ?sss1  ?sss2
relationCrée:et:nom: ?sss1  ?sss2 parallèle'
		alors: 'relationCréée ?sss1 ?sss2  parallèle'."
	e
		lisRegle: 'paralPerp-SegmentsPerpendiculairesSegmentCouples1'
		si:
			'perpendiculaire ?s1  ?s2
segment ?s1 ?c1
segment ?s2 ?c2
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
different:de: ?s1 ?s2'
		alors: 'perpendiculaire ?cc1 ?cc2'
		com:
			'Si des segments  sont perpendiculaires, les couples de leurs extémités le sont aussi'.
	e
		lisRegle: 'paralPerp-SegmentsPerpendiculairesSegmentCouples2'
		si:
			' coupleSur ?d [ ?x1 ?x2 ]
perpendiculaire [  ?x3 ?x4 ] ?d
ordonneMot:et:rep1:rep2:  [ ?x3 ?x4 ]  [ ?x1 ?x2 ]  ?a ?b'
		alors: 'perpendiculaire ?a ?b'
		com:
			'Si des segments  sont perpendiculaires, les couples de leurs extémités le sont aussi '.
	e
		lisRegle: 'paralPerp-SegmentsPerpendiculairesCouplesSegment'
		si:
			'perpendiculaire ?c1 ?c2
segment ?s1 ?c1
segment ?s2 ?c2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
'
		alors: 'perpendiculaire ?ss1 ?ss2'
		com:
			'Si des couples  sont perpendiculaires, les segments de leurs extémités le sont aussi'.
	e
		lisRegle: 'paralPerp-perpendiculaireCouple1'
		si:
			'sorteDeDroite ?x1
sorteDeDroite ?x2
perpendiculaire ?d1 ?d2
coupleSur ?d2  [ ?x1 ?x2 ]'
		alors: 'perpendiculaire  ?d1 [ ?x1 ?x2 ]'
		com:
			'Des couples sur des sortes de droites perpendiculaires sont perpendiculaires'.
	"
	e
		lisRegle: 'paralPerp-perpendiculaireCouple2'
		si:
			'perpendiculaire ?d1  ?d2
coupleSur ?d2 ?c2
ordonneMot:et:rep1:rep2: ?d1 ?c2 ?dd1 ?cc2
'
		alors: 'perpendiculaire  ?dd1 ?cc2'
		com:
			'Des couples sur des sortes de droites perpendiculaires sont perpendiculaires'.
	e
		lisRegle: 'paralPerp-perpendiculaireCouple3'
		si:
			'perpendiculaire ?d1  ?d2
coupleSur ?d1 ?c1
coupleSur ?d2 ?c2'
		alors: 'perpendiculaire  ?c1 ?c2'
		com:
			'Des couples sur des sortes de droites perpendiculaires sont perpendiculaires'."
	e
		lisRegle: 'paralPerp-parallèleCouple'
		si:
			'coupleSur  ?x1 ?xx1
coupleSur  ?x2 ?xx2
parallèle ?x1 ?x2
relationCrée:et:nom:  ?xx1 ?xx2 parallèle
different:de: ?xx1 ?xx2
different:de: ?x1 ?x2'
		alors: 'relationCréée  ?xx1 ?xx2 parallèle'
		com: 'Des couples sur des droites parallèles sont parallèles.'.

	"			e lisRegle: 'paralPerp-parallèleCouple2'
			 si:  'sorteDeDroite ?d
coupleSur  ?d ?xx1
coupleSur  ?d ?xx2
égaux:et: ?xx1  [ ?x1 ?y1 ]
égaux:et: ?xx2 [ ?x2 ?y2 ]
different:de: ?xx1 ?xx2'
			alors:  'parallèle ?xx1 ?xx2'
			com: 'Des couples sur une même droite sont parallèles. (parallèles confondues).'. "
	e
		lisRegle: 'paralPerp-CréeRelationparallèleSorteDeDroite'
		si:
			'parallèle ?x ?y
sorteDeDroite ?x
sorteDeDroite ?y
relationCrée:et:nom: ?x ?y parallèle'
		alors: 'relationCréée ?x ?y parallèle'
		com: 'Création d'' une relation.'.
	"	e
		lisRegle: 'paralPerp-VecteursSensOpposés'
		si:
			' vecteur ?ss ?s
vecteur:rep: ?ss ?v1
pointx:rep: ?v1 ?x
pointy:rep: ?v1 ?y
vecteur ?ss2 ?s2
vecteur:rep: ?ss2 ?v2
pointx:rep: ?v2 ?x2
pointy:rep: ?v2 ?y2
different:de: ?ss ?ss2
produit:et:rep: ?x2 -1 ?xx2
produit:et:rep: ?y2 -1 ?yy2
different:de: ?ss ?ss2
égal:à: ?xx1 ?xx2
égal:à: ?yy1 ?yy2'
		alors: 'parallèle ?ss ?ss2'
		com:
			'Des vecteurs qui ont  même orientation de sens différents sont parallèles.'."
	e
		lisRegle: 'paralPerp-VecteursMêmeSens'
		si:
			'vecteur ?ss ?s
vecteur:rep: ?ss ?v1
pointx:rep: ?v1 ?x
pointy:rep: ?v1 ?y
vecteur ?ss2 ?s2
vecteur:rep: ?ss2 ?v2
different:de: ?ss ?ss2
égal:à: ?v1 ?v2
relationCrée: parallèle ?ss ?ss2'
		alors: 'relatiionCréée  ?ss ?ss2 parallèle'
		com:
			'Des vecteurs qui ont  même orientation et de même sens  sont parallèles.'.
	"	e
		lisRegle: 'paralPerp-VecteurSurSegmentsParallèles'
		si:
			'se End of statement list encountered ->gmentSur ?ob1 ?v1
segmentSur ?ob2  ?v2
parallèle ?v1 ?v2
different:de: ?v1 ?v2
different:de: ?ob1 ?ob2'
		alors: 'parallèle ?ob1 ?ob2'
		com:
			'Si des vecteurs sur des objets sont parallèles, alors les objets sont aussi parallèles.'.
		e
		lisRegle: 'paralPerp-CréeRelationParallèleCouple1'
		si:
			'parallèle [  ?x1 ?y1  ]  [  ?x2 ?y2  ]
different:de: ?x1 ?y1
different:de: ?x2 ?y2
relationCrée:et:nom: [  ?x1 ?y1  ]  [  ?x2 ?y2  ] parallèle'
		alors: 'relationCréée  ?x ?y parallèle'
		com: 'Création d'' une relation.'.
	e
		lisRegle: 'paralPerp-CréeRelationParallèleCouple2'
		si:
			'parallèle [  ?x1 ?y1  ]  [  ?x2 ?y2  ]
different:de: ?x1 ?y1
different:de: ?x2 ?y2
relationCrée:et:nom:  [ ?y1  ?x1 ]  [  ?x2 ?y2  ] parallèle
different:de: ?x1 ?y1
different:de: ?x2 ?y2'
		alors: 'relationCréée  ?x ?y parallèle'
		com: 'Création d'' une relation.'.
	e
		lisRegle: 'paralPerp-CréeRelationParallèleCouple3'
		si:
			'parallèle  [ ?x1 ?y1 ]  [ ?x2 ?y2 ]
different:de: ?x1 ?y1
different:de: ?x2 ?y2
relationCrée:et:nom: [ ?x1 ?y1 ]  [ ?y2 ?x2 ] parallèle
'
		alors: 'relationCrée  ?x ?y parallèle'
		com: 'Création d'' une relation.'.
	e
		lisRegle: 'paralPerp-CréeRelationParallèleCouple4'
		si:
			'parallèle  [ ?x1 ?y1  ]  [  ?x2 ?y2  ]
different:de: ?x1 ?y1
different:de: ?x2 ?y2
relationCrée:et:nom:  [ ?y1  ?x2 ]  [ ?y2  ?x2  ] parallèle'
		alors: 'relationCréée  ?x ?y parallèle'
		com: 'Création d'' une relation.'."
	e
		lisRegle: 'paralPerp-constructionParallèle '
		si:
			'segment ?sAB  [ ?a ?b ]
segment ?sAC [ ?a ?c ]
segment ?sBD [  ?b ?d ] ]
different:de:  [ ?a ?b ]  [ ?a ?d ]
relation [ ?a ?b ] [ ?c ?d ] isométrique
relationCrée:  [ ?a ?b ] [ ?c ?d ] parallèle'
		alors: 'relationCréée  [ ?a ?b ] [  ?c ?d ] parallèle'
		com:
			'Si un segment a à chacune des ses extrémités un segment parallèle , isométrique et du même côté, le segment reliant l''autre extrémité de chacun de ces segments est parallèle  à ce segment'.
	e
		lisRegle: 'paralPerp-perpendiculaire'
		si: 'perpendiculaire ?p1 ?p2 ?p'
		alors: 'perpendiculaire ?p1 ?p2'.
	e
		lisRegle: 'paralPerp-perpendiculaireCouple'
		si:
			'perpendiculaire  ?x1 ?x2
segment ?s1  ?x1
segment ?s2 ?x2'
		alors: 'perpendiculaire ?x1 ?x2'
		com: 'Si des segments sont perpendiculaires, leurs couples le sont aussi.'.
	e
		lisRegle: 'paralPerp-parallèleDef1'
		si:
			'parallèle ?x1 ?x2
segment ?x1 [ ?a ?b ]'
		alors: 'parallèle ?x1'
		com: 'Une segment parallèle à un autre est de type parallèle.'.
	e
		lisRegle: 'paralPerp-parallèleDef2'
		si:
			'parallèle ?x1 ?x2
sorteDeSegment ?x2 [ ?a ?b ]'
		alors: 'parallèle ?x2'
		com: 'Une segment parallèle à un autre est de type parallèle.'.
	e
		lisRegle: 'paralPerp-SegmentsParallèles'
		si:
			'parallèle [ ?A ?B ] [ ?C  ?D ]
segment ?s2 [ ?C ?D ]
segment ?s1 [ ?A ?B ]
relationCrée:et:nom: ?s1 ?s2  parallèle'
		alors: 'relationCréée ?s1 ?s2 parallèle'
		com:
			'Si les couples sur des segments sont parallèles, les couples le sont aussi.'.
	e
		lisRegle: 'paralPerp-parallèleParUnPoint'
		si:
			'parallèle ?par ?d ?p
ordonneMot:et:rep1:rep2: ?d ?par ?dd ?ppar
relationCrée:et:nom: ?dd  ?ppar parallèle'
		alors: 'relationCréée ?dd  ?ppar parallèle'
		com: 'Construction d''une parallèle par un poin.t'.
	"	e
		lisRegle: 'paralPerp-parallèle'
		si:
			'sorteDeDroite  ?x1
sorteDeDroite  ?x2
relation:et:nom:  ?x1 ?x2 parallèle
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?x1 ?x2
different:de: ?x1 ?x2'
		alors: 'parallèle ?x1 ?x2'
		com: 'Droites parallèles ordonnées par  leur nom'."
	e
		lisRegle: 'paralPerp-PerpendiculaireParUnPointConstruction'
		si:
			'cercle ?c [ centre:  ?p ]
droite ?d
intersection ?a ?c ?d
intersection ?b ?c ?d
cercle ?c1 [ rayon: [ ?a ?p ]
cercle ?c2 [ rayon: [ ?b ?p ]
intersection ?p ?c1 ?c2
intersection ?i ?c1 ?c2
sorteDeDroite ?perp ?p ?i
different:de: ?c1 ?c2
different:de: ?p ?i'
		alors: 'perpendiculaire ?perp  ?d'
		com:
			'Construction d''une perpendiculaire par un point, en construisant la médiatrice passant par ce point.'.
	e
		lisRegle: 'paralPerp-Segmentparallèles'
		si:
			'droite ?d1
droite ?d2
segmentSur ?d1 ?s1
segmentSur ?d2 ?s2
relation:et:nom:  ?d1 ?d2 parallèle
relationCrée:et:nom: ?s1 ?s2 parallèle
different:de:   ?d1 ?d2
different:de: ?s1 ?s2'
		alors: 'relationCréée  ?s1 ?s2 parallèle'
		com: 'Les segments sur deux droites parallèles, sont parallèles'.
	e
		lisRegle: 'paralPerp-Segmentparallèles2'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
segmentSur ?d1 ?s1
relation:et:nom:  ?d1 ?d2 parallèle
relationCrée:et:nom:  ?d2 ?s1 parallèle
different:de:  ?d1 ?d2
different:de: ?d2 ?s1'
		alors: 'relationCréée  ?d2 ?s1 parallèle'
		com:
			'Un segment sur une droite parallèle à une autre droite, est aussi parallèle à cette droite.'.
	e
		lisRegle: 'paralPerp-SegmentSurParallèleEntreEux'
		si:
			'sorteDeDroite ?d1
sorteDeDroite ?d2
parallèle ?d1 ?d2
different:de:   ?d1 ?d2
segmentSur ?d1 ?s1
segment ?s1 [  ?x1 ?x2 ] 
relationCrée:et:nom:  ?d2  [  ?x1 ?x2 ]  parallèle
different:de: ?d2 ?s1'
		alors: 'relationCréée  ?d2 [  ?x1 ?x2 ] parallèle'
		com:
			'Le couple d''un segment sur une droite parallèle à une autre droite, est aussi parallèle à cette droite.'.
	e
		lisRegle: 'paralPerp-SegmentsPerpendiculaires'
		si:
			'perpendiculaire ?p1 ?p2
segmentSur ?p1 ?s1
segmentSur ?p2 ?s2'
		alors: 'perpendiculaire ?s1 ?s2'
		com:
			'Des segments sur des sortes de droites perpendiculaires sont perpendiculaires'.
	e
		lisRegle: 'paralPerp-SegmentsPerpendiculairesObjetCouples'
		si:
			'perpendiculaire [ ?x1 ?x2 ] [ ?y1 ?Y2 ]
coupleSur   ?obj1 [ ?x1 ?x2 ] 
coupleSur   ?obj2 [ ?y1 ?Y2 ]
ordonneMot:et:rep1:rep2: ?obj1 ?obj2 ?aa ?bb'
		alors: 'perpendiculaire ?aa ?bb'
		com:
			'Si des segments  sont perpendiculaires, les couples de leurs extémités sont perpendiculaires'.
	e
		lisRegle: 'paralPerp-SegmentsparallèlesETPerpendiculaires'
		si:
			'perpendiculaire ?p1 ?p2
parallèle ?p1 ?p3
different:de:   ?p1 ?p2
different:de: ?p1 ?p3'
		alors: 'perpendiculaire ?p3 ?p2'
		com:
			'Si une droite d1 est parallèle à une droite d2 elle même perpendiclaire à une droite d3, cette droite d1 est aussi perpendiculaire à d3'.
	e
		lisRegle: 'paralPerp-médiatrice'
		si:
			'perpendiculaire  ?x1 ?x2 ?x3
segment ?x2 [ ?a ?b ] ]
milieu [ ?a ?b ] ?x3'
		alors: 'médiatrice ?x1 [ ?a ?b ]'
		com:
			'Une perpendiculaire à un segment  et passant par le milieu de ce segment  est une médiatrice de ces points.'.
			
		e
		lisRegle: 'paralPerp-médiatriceEtSorteDeDroite.'
		si:
			'médiatrice ?med [ ?p1 ?p2 ]
sorteDeDroite ?sd
pointSur ?sd ?p1
pointSur ?sd ?p2
ordonneMot:et:rep1:rep2: ?med ?sd ?x1 ?x2'
		alors: 'perpendiculaire ?x1 ?x2'
		com:
			'Une médiatrice de deux points est perpendiculaire à la sorte de droite qui passe par ces points'.		
			
						
		e
		lisRegle: 'paralPerp-médiatriceEtcouple'
		si:
			'médiatrice ?med [ ?p1 ?p2 ]
ordonneMot:et:rep1:rep2: ?p1 ?p2 ?x1 ?x2'

		alors: 'couple ?x1 ?x2'
		com:
			'Une médiatrice de deux points détermine  un couple de ces deux points'.		
			
		e
		lisRegle: 'paralPerp-médiatricePerpendiculaireCouple'
		si:
			'médiatrice ?med [ ?p1 ?p2 ]
ordonneMot:et:rep1:rep2: ?p1 ?p2 ?x1 ?x2'

		alors: 'perpendiculaire ?med [ ?x1 ?x2 ]'
		com:
			'Une médiatrice de deux points est perpendiculaire au couple de ces deux points'.		
			
	e

		lisRegle: 'paralPerp-SegmentparallèlesRéc'
		si:
			'droite ?d1
droite ?d2
segmentSur ?d1 ?s1
segmentSur ?d2 ?s2
segment ?s1 ?ss1
segment ?s2 ?ss2
parallèle ?s1 ?s2
relationCrée:et:nom:  ?s1 ?s2 parallèle 
different:de: ?s1 ?s2'
		alors: 'relationCréée ?d1 ?d2 parallèle'
		com:
			'Si des segments sont sur des droites et leurs couples sont parallèles, les droites sont aussi parallèles.'.
	e
		lisRegle: 'paralPerp-SegmentsPerpendiculaires'
		si:
			'perpendiculaire ?p1 ?p2
different:de:   ?p1 ?p2
segmentSur ?p1 ?s1
segmentSur ?p2 ?s2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2'
		alors: 'perpendiculaire ?ss1 ?ss2'
		com:
			'Des segments sur des sortes de droites perpendiculaires sont perpendiculaires'.
			
			
			
			
	e	
		lisRegle: 'paralPerp-SegmentsparallèlesETPerpendiculaires'
		si:
			'perpendiculaire ?p1 ?p2
parallèle ?p1 ?p3
different:de:   ?p1 ?p2
different:de: ?p1 ?p3'
		alors: 'perpendiculaire  ?p3 ?p2'
		com:
			'Si une droite d1 est parallèle à une droite d2 elle même perpendiclaire à une droite d3, cette droite d1 est aussi perpendiculaire à d3'.
	e
		lisRegle: 'paralPerp-Milieu'
		si:
			'adjacent ?s1 ?s2 ?a ?b ?c
milieu ?s1 ?i
milieu ?s2 ?j
segment ?sij [ ?i ?j ]
segment sAC [ ?a ?c ]
relationCrée:et:nom: [ ?a ?c j ]  [ ?i ? j parallèle'
		alors: 'relationCréée  [ ?a ?c j ]  [ ?i ? j parallèle'
		com: 'Réciproque de Thales (rapport 1/2)'.
	e
		lisRegle: 'paralPerp-PerpMêmeDroite1'
		si:
			'perpendiculaire ?d1 ?perp1
perpendiculaire ?d1 ?perp2
sorteDeDroite  ?perp1
sorteDeDroite ?perp2
ordonneMot:et:rep1:rep2:  ?perp1 ?perp2  ?pperp1 ?pperp2
different:de: ?perp1 ?perp2
relationCrée:et:nom: ?pperp1 ?pperp2 parallèle'
		alors: 'relationCréée ?pperp1 ?pperp2 parallèle'
		com:
			'Deux droites perpendiculaires à une même sorte de droite sont parallèles.'.
	"	e
		lisRegle: 'paralPerp-PerpMêmeDroite4'
		si:
			'perpendiculaire ?perp1 ?d1
perpendiculaire ?perp2 ?d1
different:de: ?perp1 ?perp2
~segmentSur ?perp1 ?perp2
ordonneMot:et:rep1:rep2:  ?perp1 ?perp2  ?pperp1 ?pperp2
relationCrée:et:nom: ?pperp1 ?pperp2 parallèle'
		alors: 'relationCréeé ?pperp1 ?pperp2 parallèle'."
	e
		lisRegle: 'paralPerp-parallèleSym'
		si:
			'symetrie centrale ?x ?p ?xx
segment ?s1 [ ?x ?y ]
symetrie centrale ?yy ?pp ?yy
segment ?s1 ?[ xx ?yy ]
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
relationCrée:et:nom:'
		alors: 'relationCréée ?ss1 ?ss2 parallèle'.	"
	e
		lisRegle: 'paralPerp-Thales3'
		si:
			'parallèle ?par ?d2 ?i
droite ?d2 ?x ?p
pointSur ?d ?i
droite ?d ?ch ?x
droite ?d3 ?ch ?p
intersection  ?par ?d3 ?PP'
		alors: 'homothétie ?ch ?i ?x image de ?p ?PP'
		com: 'Thales pour une homothétie.'."
	e
		lisRegle: 'paralPerp-Thales0'
		si: 'homothétie ?ch ?i ?x image de ?m ?mm'
		alors: 'homothétie ?ch ?i ?x image de ?x ?i'.
	e
		lisRegle: 'paralPerp-homothétieMilieu1'
		si: 'milieu [ ?a ?b ] ?mil'
		alors: 'homothétie  ?a  ?mil ?b  0.5'
		com:
			'Le milieu d''un segment est l''image d''une extémité par une homothétie qui a pour centre l''autre extrémité'.
	e
		lisRegle: 'paralPerp-homothétieMilieu2'
		si: 'milieu [ ?a ?b ] ?mil'
		alors: 'homothétie  ?b  ?mil ?a  0.5'
		com:
			'Le milieu d''un segment est l''image d''une extémité par une homothétie qui a pour centre l''autre extrémité'.
	"	e
		lisRegle: 'paralPerp-ParalMilieu1'
		si:
			'milieu  [ ?ch  ?x ] ?i
milieu [ ?ch ?y ] ?j 
different:de: ?i ?j
different:de: ?x ?y
relationCrée:et:nom: [ ?i ?j ] [ ?x ?y ] parallèle'
		alors: ' relationCréée [ ?i ?j ] [ ?x ?y ] parallèle'."
	e
		lisRegle: 'paralPerp-Translation'
		si:
			'translation segment ?s [ ?so ?v ]
relationCrée:et:nom: ?ss ?sso parallèle'
		alors: 'relationCréée ?ss ?sso parallèle'

	"	e
		lisRegle: 'paralPerp-SegmentsEgauxEtparallèlesEgalité1'
		si:
			'isométrique ?s1 ?s2
sorteDeSegment ?s1 [ ?x1 ?y1 ]
sorteDeSegment  ?s2 [ ?x2 ?y2 ]
parallèle ?s1 ?s2
direction:rep: ?s1  ?dir1
direction:rep: ?s2 ?dir2
égal:à: ?dir1 ?dir2
isométrique ?s1 ?s2
sorteDeSegment ?s3 [ ?x1 ?x2 ]
sorteDeSegment ?s4 [ ?y1 ?y2 ]'
		alors: 'isométrique ?s3 ?s4'
		com:
			'les segments  qui relient les extrémités de segments parallèles et isométriques sont isométriques'.
	e
		lisRegle: 'paralPerp-SegmentsEgauxEtparallèlesEgalité2'
		si:
			'isométrique ?s1 ?s2
sorteDeSegment ?s1 [ ?x1 ?y1 ]
sorteDeSegment  ?s2 [ ?x2 ?y2 ]
parallèle ?s1 ?s2
direction:rep: ?s1  ?dir1
direction:rep: ?s2 ?dir2
isométrique ?s1 ?s2
sorteDeSegment ?s3 [ ?x1 ?y2 ]
sorteDeSegment ?s4 [ ?y1 ?x2 ]
different:de: ?dir1 ?dir2'
		alors: 'isométrique[ ?s3 ?s4]'
		com:
			'les segments  qui relient les extrémités de segments parallèles et isométriques sont isométriques'.
	e
		lisRegle: 'paralPerp-SegmentsEgauxEtparallèlesExtrémités'
		si:
			'sorteDeSegment ?s1 [ ?x1 ?y1 ]
sorteDeSegment  ?s2 [ ?x2 ?y2 ]
sorteDeSegment  ?s3 [  ?y2 ?x1 ]
sorteDeSegment  ?s4 [ ?y1 ?x2 ]
relation:et:nom:  ?s1 ?s2 parallèle
relation:et:nom: ?s1 ?s2 isométrique
different:de: ?x1 ?y1
different:de: ?x2 ?y2
different:de: ?s1 ?s2'
		alors: 'parallèle ?s3 ?s4'
		com:
			'les segments  qui relient les extrémités de segments parallèles et isométriques sont parallèles'.
	e
		lisRegle: 'paralPerp-droitesParallèlesDéfinition'
		si:
			'intersection ?i1 ?d1 ?d2
intersection ?i2 ?d1 ?d3
droite ?d1
droite ?d2
droite ?d3
isométrique [ ?x ?i1 ?y ] [ ?xx ?i2 ?yy]
pointSur ?d1 ?x
pointSur ?d1 ?xx
different:de: ?i1 ?i2'
		alors: 'parallèle ?d2 ?d3'
		com: 'Des segments de même directions  sont parallèles.'
"! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 10/31/2024 21:55:52'!
polygones: e
	e
		lisRegle: 'polygones-créeNomPolygone'
		si:
			'lignePolygonaleFermée0  ?x1
taille:rep: ?x1 ?taille
égal:à: 4 ?taille
premiers:rep: ?x1 ?prems
tousDifferents: ?prems
créeNom:rep: ?prems  ?nomPoly
nomPolygone:rep: ?taille ?nom'
		alors: 'lignePolygonaleFermée ?x1  [ ?nomPoly  ?nom ]'
		com: 'Un polygone de 4 côtés est unTetragone'.
	"	e
		lisRegle: 'polygones-objetPolygone'
		si:
			'DrGPolygonNptsItem  ?x1 ?som
lignePolygonaleFermée  ?l2
premiers:rep: ?l2 ?prems
égaux:et:  ?som ?prems
taille:rep: ?som ?t
tousDifferents: ?som
nomPolygone:rep: ?t ?nom
créeNom:rep: ?som ?nomPoly
renomme:nom: ?x1 ?nomPoly'
		alors: 'lignePolygonaleFermée ?l2 [ ?nomPoly  ?nom ]'
		com: 'Liste des côtés et nom du polygone selon le nombre de côtés.'."
	e
		lisRegle: 'polygones--objetPolygoneNom'
		si: 'lignePolygonaleFermée ?l2 [ ?nomPoly  ?nom  ] '
		alors: 'polygone ?nomPoly  [  ?nom ]'
		com: 'Nom du polygone selon le nombre de sommets ou de côtès'.
	e
		lisRegle: 'polygones--objetPolygoneDef'
		si: 'lignePolygonaleFermée ?l2 [ ?nomPoly  ?nom ] ?l'
		alors: 'polygone ?nomPoly'
		com: 'Définition d''un objet.'.
	e
		lisRegle: 'polygones--objetPolygonePointSur'
		si:
			'point ?x
polygone ?nm  ?p [ sommets: ?som ]
contient:el: ?som ?x'
		alors: 'pointSur ?p ?x'
		com: 'Un sommet d''un polygone est un point sur ce polygone.'.
	e
		lisRegle: 'polygones-objetPolygoneSommets'
		si: 'polygone ?nomPoly [ sommets: ?som ] ?l'
		alors: 'polygone ?nomPoly  [ sommets: ?som ]'
		com: 'Liste des sommets du polygone.'.
	e
		lisRegle: 'polygones-objetPolygoneCôtés'
		si: 'polygone ?nomPoly [ sommets: ?som ] ?l'
		alors: 'polygone ?nomPoly  [ côtés:  ?l ]'
		com: 'Liste des sommets du polygone.'.
	e
		lisRegle: 'polygones--PérimètreInit'
		si: 'polygone ?nomPoly  [ côtés: ?cot ]'
		alors: 'mesuresDe ?cot 0'
		com: 'Initialse le calcul du périmètre'.
	e
		lisRegle: 'polygones--Périmètre'
		si:
			'polygone ?nomPoly  [ côtés: ?cot ]
mesuresDe  ?cot ?x ?m
arrondis:rep:  ?m ?per'
		alors: 'polygone ?nomPoly [ périmètre: ?per ]'
		com: 'Périmètre d''un polygone'.
	e
		lisRegle: 'polygones--Aire'
		si:
			'polygone ?nomPoly  [ côtés: ?cot ]

mesure  [ aire0  trapèze ?t ] ?m ] 
arrondis:rep: ?m ?mArr'
		alors: 'polygone ?nomPoly [ aire:  ?mArr ]'
		com: 'Aire d''un polygone'.
	e
		lisRegle: 'polygones--PérimètreMesure'
		si: 'polygone ?nomPoly [ périmètre: ?m ]'
		alors: 'mesure [ périmètre ?nomPoly ] ?m déduite'
		com: 'Mesure du Périmètre d''un polygone'.
	e
		lisRegle: 'polygones-lignePolygonaleCrée'
		si: 'adjacent ?s1 ?s2 ?x1 ?s ?x2'
		alors: 'lignePolygonale [  [ ?x1 ?s ] [ ?s ?x2 ] ]'.
	e
		lisRegle: 'polygones-lignePolygonaleSuite1'
		si:
			'lignePolygonale ?l
dernier:rep: ?l ?der
segment ?s ?der
adjacent ?s ?s2 ?a ?b ?c
ajouteDernierUnique:el:rep: ?l [ ?b ?c ]  ?l2'
		alors: 'lignePolygonale ?l2'.
	e
		lisRegle: 'polygones-lignePolygonaleRetrait1'
		si:
			'lignePolygonale ?l1
lignePolygonale ?l2
taille:rep: ?l1 ?t1
taille:rep: ?l2 ?t2
inférieur:à: ?t1 ?t2
retireFait: lignePolygonale ?l1'
		alors: 'lignePolygonale0 ?l1'.
	"	e
		lisRegle: 'polygones-triangleinit'
		si:
			'lignePolygonaleFermée ?l  [  Trigone ?nom ]
saufPremier:rep: ?l ?l2 
premier:rep: ?l ?pr
premier:rep: ?pr ?p1
premier:rep: ?l2 ?cot
premier:rep: ?cot ?p2
dernier:rep: ?cot ?p3
ajoutePremier:el:rep: ?cot ?p1 ?triangle
aireTriangle:avec:avec:rep:  ?p1 ?p2 ?p3 ?aire
ajouteDernier:el:rep: ?triangle ?aire ?triangle2
supérieur:à: ?aire 0'
		alors: 'triangle   ?nom [ triangles: [ ?triangle2 ]   ]'."
	e
		lisRegle: 'polygones-lignePolygonaleRetrait2'
		si:
			'lignePolygonale ?l2
lignePolygonale ?l1
taille:rep: ?l1 ?t1
taille:rep: ?l2 ?t2
inférieur:à: ?t1 ?t2
'
		alors: 'lignePolygonale ?l2'.
	e
		lisRegle: 'polygones-triangleinit'
		si:
			'lignePolygonaleFermée ?l  [  Trigone ?nom ]
saufPremier:rep: ?l ?l2 
premier:rep: ?l ?pr
premier:rep: ?pr ?p1
premier:rep: ?l2 ?cot
premier:rep: ?cot ?p2
dernier:rep: ?cot ?p3
ajoutePremier:el:rep: ?cot ?p1 ?triangle
aireTriangle:avec:avec:rep:  ?p1 ?p2 ?p3 ?aire
ajouteDernier:el:rep: ?triangle ?aire ?triangle2
supérieur:à: ?aire 1.0e-4'
		alors: 'triangle   ?nom [ triangles: [ ?triangle2 ]   ]'.
	e
		lisRegle: 'polygones-aire-triangle'
		si:
			'triangle   ?nom [ triangles: [ ?triangle2 ]   ]
dernier:rep: ?triangle2 ?aire0
supérieur:à: ?aire0 0
abs:rep: ?aire0 ?aire'
		alors: 'triangle   ?nom [ aire_triangles: ?aire  ]'.
	e
		lisRegle: 'polygones-QuadrilatèreTrianglesSuite'
		si:
			'quadrilatère0  ?nom [ triangles: ?ts  ?l2 ]
quadrilatère ?nom [  sommets: ?som ]
premier:rep: ?som ?p1
premier:rep: ?l2 ?cot
saufPremier:rep: ?l2 ?l3
ajoutePremier:el:rep: ?cot  ?p1 ?triangle0
premier:rep: ?cot ?p2
dernier:rep: ?cot ?p3
aireTriangle:avec:avec:rep: ?p1 ?p2 ?p3 ?aire
ajouteDernier:el:rep: ?triangle0 ?aire ?triangle
ajouteDernier:el:rep: ?ts ?triangle  ?triangles'
		alors: 'quadrilatère0 ?nom [ triangles: ?triangles ?l3 ]'.
	e
		lisRegle: 'polygones-Quadrilatère-DefTetragone'
		si:
			'polygone   ?nom [ Tetragone  ]
polygone   ?nom ?x'
		alors: 'quadrilatère ?nom ?x'
		com:
			'Un tetragone est un quadrilatère; propriété du tetragone  attribuée au quadrilatère.'.
	e
		lisRegle: 'polygones-TrigoneHauteurs'
		si:
			'triangle ?t [ sommets: ?som ]
triangle ?t [ côtés: ?cot ]
perpendiculaire ?x1 ?x2 ?x
contient:el: ?som ?x
segment ?s ?ss
nonContient:el:  ?cot ?ss
'
		alors: 'polygone ?t [ hauteur: ?ss  ]'
		com:
			'La hauteur d''un Trigone est le couple formé d''un sommet et 
de l''intersection de la perpendiculaire au côté opposé à ce sommet et de ce côté opposé.'.
	e
		lisRegle: 'polygones-Triangle-Def'
		si:
			'polygone   ?nom [ Trigone ] 
polygone ?nom [ sommets: [ ?a ?b ?c ] ]
aireTriangle:avec:avec:rep: ?a ?b ?c ?aire
abs:rep: ?aire ?aireAbs
supérieur:à: ?aireAbs  0.0
polygone ?nom ?x'
		alors: 'triangle ?nom ?x'
		com:
			'Transfert des propriétés du trigone au triangle si le trigone n''est pas plat'.
	e
		lisRegle: 'polygones-PolygoneInit'
		si:
			'lignePolygonaleFermée ?l  [  ?nomPoly ?nom ]
taille:rep: ?l ?t
supérieur:à: ?t 4
saufPremier:rep: ?l ?l2 
premier:rep: ?l2 ?cot
premier:rep: ?l ?prem
premier:rep: ?prem ?p1
ajoutePremier:el:rep: ?cot ?p1 ?triangle
premier:rep: ?cot ?p2
dernier:rep: ?cot ?p3
aireTriangle:avec:avec:rep:  ?p1 ?p2 ?p3 ?aire
ajouteDernier:el:rep: ?triangle ?aire ?triangle2
saufPremier:rep: ?l2 ?l3'
		alors:
			'polygone0 ?nomPoly   ?nom [ triangles: [  [ ?triangle2  ]     ?l3 ]    ]'.
	e
		lisRegle: 'polygones-PolygoneTrianglesSuite1'
		si:
			'lignePolygonaleFermée ?l [  ?nomPolygone  ?nom ]
polygone0  ?nomPolygone  ?nom [ triangles: [ ?ts  ?l2 ]  ] 
premier:rep: ?ts ?premts
premier:rep: ?premts  ?p1
premier:rep: ?l2 ?cot
saufPremier:rep: ?l2 ?l3
ajoutePremier:el:rep: ?cot ?p1 ?triangle
premier:rep: ?cot ?p2
dernier:rep: ?cot ?p3
aireTriangle:avec:avec:rep:  ?p1 ?p2 ?p3 ?aire
ajouteDernier:el:rep: ?triangle ?aire ?triangle2
ajouteDernier:el:rep: ?ts ?triangle2 ?triangles'
		alors: 'polygone0  ?nomPolygone  ?nom [ triangles: [ ?triangles  ?l3 ]  ]'.
	e
		lisRegle: 'polygones-Triangles'
		si:
			'lignePolygonaleFermée ?l [ triangle: ?t ]
triangle ?t [  sommets: ?som  ]
premier:rep: ?som ?p1
saurPremier:rep: ?som ?som1
permier:rep: ?som1 ?p2
saurPremier:rep: ?som1 ?som2
permier:rep: ?som2 ?p3
aireTriangle:avec:avec:rep:  ?p1 ?p2 ?p3 ?aire
supérieur:à: ?aire 0'
		alors: ' triangle  ?t  [ triangles: ?som ]'.
	e
		lisRegle: 'polygones-PolygoneTrianglesSuite2'
		si:
			'polygone0  ?nomPolygone  ?nom [ triangles: [ ?triangles  ?l2  ]  ]
dernier:rep: ?l2 ?der
taille:rep: ?der ?t
égal:à: ?t 0'
		alors: 'polygone1  ?nomPolygone  ?nom [ triangles: ?triangles   ]'.
	e
		lisRegle: 'polygones-aire'
		si:
			'polygone1  ?x1 ?x2 [  triangles: ?x3 ]
derniers:rep: ?x3  ?res
somme:rep:  ?res ?res2'
		alors: 'polygone   ?x1 [  aire_triangles: ?res2 ]'
		com:
			'Aire d''un polygone à partir du polygone découpé en triangles. 
Cette aire est positive si le polygone est orienté à gauche, négative si le polygone est orienté à droite.'.
	e
		lisRegle: 'polygones-aireAffiche'
		si:
			'polygone   ?x1 [  aire_triangles: ?res2 ]
affiche mesure déduite'
		alors: 'afficher [ aire ?x1 ] ?res2 déduite'
		com: ''.
	e
		lisRegle: 'polygones-lignePolygonaleFermée'
		si:
			'lignePolygonale0 ?l
premier:rep: ?l ?pr
premier:rep: ?pr ?a
dernier:rep: ?l ?der
dernier:rep: ?der ?b
égaux:et: ?a ?b
premiers:rep: ?l ?prems
minimum:rep: ?prems ?min
égaux:et: ?a ?min
'
		alors: 'lignePolygonaleFermée0 ?l'.
	e
		lisRegle: 'polygones-lignePolygonaleFermée2'
		si:
			'lignePolygonale ?l
premier:rep: ?l ?pr
premier:rep: ?pr ?a
dernier:rep: ?l ?der
dernier:rep: ?der ?b
ordonneMot:et:rep1:rep2: ?a ?b ?aa ?bb
segment ?s [  ?aa ?bb  ]
ajouteDernier:el:rep: ?l [ ?aa ?bb ] ?l2
premiers:rep: ?l ?prems
minimum:rep: ?prems ?min
égaux:et: ?a ?min
'
		alors: 'lignePolygonaleFermée0 ?l2'.
	e
		lisRegle: 'polygones-lignePolygonaleFermée0'
		si:
			'lignePolygonale0 ?l
premier:rep: ?l ?pr
premier:rep: ?pr ?a
dernier:rep: ?l ?der
dernier:rep: ?der ?b
égaux:et: ?a ?b
premiers:rep: ?l ?prems
minimum:rep: ?prems ?min
égaux:et: ?a ?min'
		alors: 'lignePolygonaleFermée0 ?l'.


	"	e
		lisRegle: 'p-lignePolygonaleFerméePermutation'
		si:
			'lignePolygonaleFermée0 ?l
saufPremier:rep: ?l ?l2
premier:rep: ?l ?pr
ajouteDernier:el:rep: ?l2 ?pr ?l3'
		alors: 'lignePolygonaleFermée0 ?l3'."
	e
		lisRegle: 'polygones-lignePolygonaleFerméeSommets'
		si:
			'lignePolygonaleFermée  ?l2 [ ?nomPoly ?nom ]
premiers:rep: ?l2 ?som
tousDifferents: ?som'
		alors: 'polygone ?nomPoly  [ sommets:    ?som  ]'
		com:
			'Liste des sommets d''une ligne polygonale fermée fomant un polygone et nom du polygone selon le nombre de côtés.'.
	e
		lisRegle: 'polygones-lignePolygonaleFermée3'
		si:
			'lignePolygonaleFermée0 ?l
minimum:rep: ?l ?min
premier:rep: ?l ?pr
égaux:et:  ?pr ?min
saufDernier:rep: ?l ?sd
dernier:rep: ?l ?der
premier:rep: ?der ?prd
dernier:rep: ?der ?derd
ordonneMot:et:rep1:rep2:  ?prd ?derd ?a ?b
égaux:et: [ ?a ?b ] ?nouvDer
ajouteDernier:el:rep: ?sd ?nouvDer  ?lor'
		alors: 'lignePolygonaleFermée ?lor'
		com:
			'Une ligne qui a un segment qui joint son dernier point à son premier est une ligne polygonaleFermée'.
	e
		lisRegle: 'polygones-lignePolygonaleFermeture'
		si:
			'lignePolygonaleFermée   ?lor
segment ?s ?x
sens ?s inverse
contient:el: ?lor    ?x 
'
		alors: 'lignePolygonaleFermée ?lor fermeture: ?s'
		com:
			'La fermeture  d''une ilgne polygonale est le segment qui joint le début  à la fin  de cette ligne pour la fermer, il est en sens inverse'.


	"	e
		lisRegle: 'polygones-lignePolygonaleFermée4'
		si:
			'lignePolygonaleFermée2 ?l
minimum:rep: ?l ?min'
		alors: 'lignePolygonaleFermée ?l'."
	"	e
		lisRegle: 'polygones-lignePolygonaleFerméeCôtés'
		si:
			'lignePolygonaleFermée0  ?l2
lignePolygonaleFermée  ?l2 [  ?nomPoly   ?nom ]'
		alors: 'polygone ?nomPoly  [ côtés:    ?l2  ]'
		com: 'Liste des côtés d''un polygone'."
	e
		lisRegle: 'polygones-lignePolygonaleFerméeConvexité'
		si:
			'polygone ?nomPoly  [ sommets:    ?l2  ]
taille:rep: ?l2 ?t
premier:rep: ?l2 ?p2
saufPremier:rep:  ?l2  ?l1
premier:rep: ?l1 ?p3
dernier:rep: ?l2 ?p1
aireTriangle:avec:avec:rep: ?p1 ?p2 ?p3 ?a1
ajouteDernier:el:rep:  ?l2 ?p2 ?suite'
		alors: 'convexité0  ?nomPoly   [   [ ?p1  ?p2 ?p3 ?a1  ]   ]  ?suite'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeConvexitéTriangle'
		si:
			'polygone ?nomPoly  [ sommets:    ?l2  ]
taille:rep: ?l2 ?t
égal:à: ?t 3
premier:rep: ?l2 ?p2
saufPremier:rep:  ?l2  ?l1
premier:rep: ?l1 ?p3
dernier:rep: ?l2 ?p1
aireTriangle:avec:avec:rep: ?p1 ?p2 ?p3 ?a1'
		alors: 'convexité0  ?nomPoly   [   [ ?p1  ?p2 ?p3 ?a1  ]   ]  [  ]'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeConvexitéSuite'
		si:
			'convexité0     ?nomPoly ?conv     ?l2
dernier:rep: ?l2 ?p3
saufDernier:rep:  ?l2 ?l3
dernier:rep: ?l3 ?p2
saufDernier:rep:  ?l3 ?l4
dernier:rep: ?l4 ?p1
aireTriangle:avec:avec:rep: ?p1 ?p2 ?p3 ?a1
saufDernier:rep:  ?l4 ?suite
ajoutePremier:el:rep: ?conv [ ?p1 ?p2 ?p3 ?a1  ] ?conv2'
		alors: 'convexité0   ?nomPoly  ?conv2  ?l3 '.
	e
		lisRegle: 'polygones-OrientationGauche'
		si:
			'polygone  ?nom [  sommets: ?som ]
convexité0     ?nom ?conv    [ [  ] ]
derniers:rep: ?conv ?ders
tousPositifs: ?ders'
		alors: 'polygone  ?nom [ orientation: gauche ]'
		com: 'Polygone orienté à gauche, sens inverse des aiguilles d''une montre'.
	e
		lisRegle: 'polygones-OrientationDroite'
		si:
			'polygone   ?nom [  sommets: ?som ]
convexité0     ?nom ?conv     [ [ ] 
derniers:rep: ?conv ?ders
tousNégatifs: ?ders'
		alors: 'polygone ?nom [ orientation: droite ]'
		com: 'Polygone orienté à droite,sens  des aiguilles d''une montre'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeConvexe'
		si:
			'polygone  ?nom [  sommets: ?som ]
convexité0     ?nom ?conv  ?l2 
taille:rep: ?l2 ?t
inférieur:à:  ?t 3
derniers:rep: ?conv ?der
tousPositifs: ?der'
		alors: 'polygone   ?nom [  convexité:  [  convexe  ] ]'
		com:
			'Si l''aire de tous les  triangle formé de trois sommets consécutifs est de même signe, le polygone est convexe.'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeConvexeNeg'
		si:
			'polygone  ?nom [  sommets: ?som ]
convexité0     ?nom ?conv  ?l2 
taille:rep: ?l2 ?t
inférieur:à:  ?t 3
derniers:rep: ?conv ?der
tousNégatifs: ?der'
		alors: 'polygone   ?nom [  convexité:  [  convexe  ] ]'
		com:
			'Si l''aire de tous les  triangle formé de trois sommets consécutifs est de même signe, le polygone est convexe.'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeNonConvexe'
		si:
			'polygone ?nom  [  sommets: ?som ]
tousDifferents: ?som
convexité0     ?nom ?conv  ?l2 
taille:rep: ?l2 ?t
inférieur:à:  ?t 3
derniers:rep: ?conv ?der
~ tousPositifs: ?der
~ tousNégatifs: ?der'
		alors: 'polygone  ?nom  [ convexité: [ non convexe ] ]'
		com:
			'Si ni l''aire de tous les  triangle formé de trois sommets consécutifs est négative,  ni l''aire de tous les  triangle formé de trois sommets consécutifs est posittive , le polygone est non convexe.'.
	"	e
		lisRegle: 'polygones-lignePolygonaleFerméeSommetsTriangle'
		si:
			'lignePolygonaleFermée ?l2 [ Trigone ?q ]
premiers:rep:  ?l2 ?som'
		alors: 'triangle ?q  [ sommets:   ?som  ]'
		com: 'Liste des sommets qui constituent une ligne polygonale fermée'."
	e
		lisRegle: 'polygones-lignePolygonaleFerméeSommets2'
		si:
			'lignePolygonaleFermée0  ?x1
saufDernier:rep: ?x1 ?sd
dernier:rep: ?x1 ?der 
premier:rep: ?der ?pder
dernier:rep:  ?der ?dder
premiers:rep: ?sd ?prems
contient:el: ?prems ?pder
ajouteDernier:el:rep: ?prems ?dder  ?prems2
créeNom:rep: ?prems2 ?p'
		alors: 'polygone ?p [ sommets:   ?prems2 ]  ?x1'
		com: 'Liste des sommets qui constituent une ligne polygonale fermée'.
	"	e
		lisRegle: 'polygones-lignePolygonaleFerméeSommetsTriangle2'
		si:
			'lignePolygonaleFermée0  ?x1
saufDernier:rep: ?x1 ?sd
dernier:rep: ?x1 ?der 
premier:rep: ?der ?pder
dernier:rep:  ?der ?dder
premiers:rep: ?sd ?prems
contient:el: ?prems ?dder
ajouteDernier:el:rep: ?prems ?pder  ?prems2
créeNom:rep: ?prems2 ?p'
		alors: 'polygone ?p [ sommets:   ?prems2 ]'
		com: 'Liste des sommets qui constituent une ligne polygonale fermée'.
	"
	e
		lisRegle: 'polygones-triangleDef'
		si:
			'polygone ?poly [ Trigone ]
polygone  ?nom [  côtés: ?c ]
taille:rep: ?c ?t
égal:à: 3 ?t'
		alors: 'triangle ?nom [ côtés: ?c ]'
		com: 'Un polygone de trois côtés est un triangle.'.
	e
		lisRegle: 'polygones-trianglePlatDef'
		si:
			'polygone ?poly [ Trigone ]
polygone  ?nom [  sommets: [ ?x1 ?x2 ?x3 ] ]
alignement ?x
contient:el: ?x ?x1
contient:el: ?x ?x2
contient:el: ?x ?x3
taille:rep:  [ ?x1 ?x2 ?x3  ] ?t
égal:à: 3 ?t'
		alors: 'triangle ?nom [ plat ]'
		com: 'Si les sommets d''un triangle sont alignés, le triangle est plat.'.
	"	e
		lisRegle: 'polygones-triangleSommets'
		si:
			'triangle ?nom [  côtés: ?c ]
premiers:rep: ?c ?som'
		alors: 'triangle ?nom [ sommets: ?som ]'
		com: 'les sommets sont les origines des segments'."
	e
		lisRegle: 'polygones-lignePolygonaleFerméeNoms'
		si:
			'lignePolygonaleFermée0 ?l2
polygone ?nom [ sommets: ?som ]
taille:rep: ?som ?t
nomPolygone:rep: ?t ?nomPoly'
		alors: 'polygone ?nom [  ?nomPoly   ]'.
	"e
		lisRegle: 'polygones-lignePolygonaleFerméeNoms2'
		si:
			'lignePolygonaleFermée0 ?l2
polygone ?p [  sommets: ?som ]
taille:rep: ?som ?t
'
		alors: 'lignePolygonaleFermée ?l2 [   ?nomPoly  ?nom  ]'."
	e
		lisRegle: 'polygones-lignePolygonaleFerméeTriangle'
		si:
			'lignePolygonaleFermée ?l2 [  Trigone ?nom ]
taille:rep: ?l2 ?x
égal:à: ?x 3
premiers:rep: ?l2 ?som
premier:rep: ?som ?p1
saufPremier:rep: ?som ?som1
premier:rep: ?som1 ?p2
saufPremier:rep: ?som1 ?som2
premier:rep: ?som2 ?p3
aireTriangle:avec:avec:rep: ?p1 ?p2 ?p3 ?aire
supérieur:à: ?aire 0
nomPolygone:rep: ?x ?nom
créeNom:rep: ?som ?nomPoly'
		alors: 'lignePolygonaleFermée ?l2 [ ?nomPoly ]'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeTriangle'
		si: 'lignePolygonaleFermée ?l2 [ Trigone ?nomPoly ]'
		alors: 'lignePolygonaleFermée ?l2 [ triangle ?nomPoly ]'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeQuadrilatère'
		si: 'lignePolygonaleFermée ?l2 [ Tetragone ?nomPoly ]'
		alors: 'lignePolygonaleFermée ?l2 [ quadrilatère ?nomPoly ]'	"
	e
		lisRegle: 'polygones-lignePolygonaleFerméeSommetsQuadrilatère'
		si:
			'lignePolygonaleFermée ?l2 [ Tetragone ?q ]
premiers:rep:  ?l2 ?prem
'
		alors: 'quadrilatère ?q  [ sommets:    ?prem   ]'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeCôtésQuadrilatère'
		si: 'lignePolygonaleFermée ?l  [ Tetragone ?nomPoly ]'
		alors: 'quadrilatère ?nomPoly  [ côtés:  ?l ]'.
	e
		lisRegle: 'polygones-lignePolygonaleFerméeCôtésTriangle'
		si: 'lignePolygonaleFermée ?l  [ Trigone ?nomPoly ]'
		alors: 'triangle ?nomPoly  [ côtés:  ?l ]'.
	e
		lisRegle: 'polygones-segments'
		si:
			'polygone ?nomPoly ?poly [ côtés: ?cot ]
point ?p1
point ?p2
contient:el: ?cot  [  ?p1 ?p2  ]
mot:et:rep: ?p1 ?p2 ?nom0 
mot:et:rep: s ?nom0 ?nom'
		alors: 'segment ?nom [  ?p1 ?p2 ]'.
	e
		lisRegle: 'PolygoneTriangle'
		si:
			'lignePolygonaleFermée ?l2
premiers:rep: ?l2 ?som
taille:rep: ?l2 ?x
égal:à: ?x 3
nomPolygone:rep: ?x ?nom
créeNom:rep: ?som ?nomPoly
'
		alors: '?nomPoly  [ côtés:  ?l2  ]' "! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 8/17/2023 09:47'!
relations: e
	e
		lisRegle: 'relations-RelationExplicite'
		si:
			'relation ?rel explicite
relationCréée  ?obj1 ?obj2 ?rel
ordonneMot:et:rep1:rep2:  ?obj1 ?obj2  ?oobj1 ?oobj2'
		alors: '?rel ?oobj1 ?oobj2'
		com: 'Affirmaion explicite d''une relation.'.
	e
		lisRegle: 'relations-def'
		si:
			'relation ?rel 
relation:rep: ?rel ?rep'
		alors: 'relation ?rel ?rep'.
	e
		lisRegle: 'relations-isométrieCréation'
		si:
			'isométrique ?a ?b
relationCrée:et:nom: ?a ?b isométrique'
		alors: 'relation isométrique  ?a ?b créée'.
	e
		lisRegle: 'relations-angleEquivalentCréation'
		si:
			'angle ?x [ équivalent: ?y ]
relationCrée:et:nom: ?x ?y  angleEquivalent'
		alors: 'relation angleEquivalent  ?x ?y créée'
	"	e
		lisRegle: 'relations-isométrieCréation2'
		si:
			'isométrique [ ?a ?b ] [ ?c ?d ]
relationCrée:et:nom:  [ ?a ?b ] [ ?d ?c ]  isométrique'
		alors: 'relation isométrique  [ ?a ?b ] [ ?d ?c ] créée'.
	e
		lisRegle: 'relations-isométrieCréation3'
		si:
			'isométrique [ ?a ?b ] [ ?c ?d ]
relationCrée:et:nom:  [ ?b ?a  ] [ ?d ?c ]  isométrique'
		alors: 'relation isométrique  [ ?b ?a ] [ ?d ?c ] créée'.
e
		lisRegle: 'relations-isométrieCréation4'
		si:	
			'isométrique [ ?a ?b ] [ ?c ?d ]
relationCrée:et:nom: [ ?b ?a ] [ ?c ?d  ] isométrique'
		alors: 'relation isométrique  [ ?b ?a ] [ ?c ?d  ] créée' "! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 9/27/2014 22:51'!
representant: e
e lisRegle: 'triangle' 
si: 'segment ?s1 ?x ?y
segment ?s2 ?y ?z
segment ?s3 ?z ?x
ordonneMot:et:rep1:rep2: ?y ?z ?o ?p
ordonneMot:et:rep1:rep2: ?x ?o ?m ?n
ordonneMot:et:rep1:rep2: ?n ?p ?q ?r
mot:et:rep: ?m ?q ?m1
mot:et:rep: ?m1 ?r ?m2
'
alors:  'triangle ?m2  [ ?s1 ?s2 ?s3 ]'.

e lisRegle: 'triangleIsocele' 
si:  'triangle ?t [ ?s1 ?s2 ?s3 ]
egal ?s1 ?s2
segment ?s1 ?a ?b'
alors: 'triangle ?t isocele de sommet  ?b'.

e lisRegle: 'triangleEquilateral' 
si:  'triangle ?t isocele de sommet  ?s1
triangle ?t isocele de sommet  ?s2
different:de:  ?s1 ?s2
'
alors:
'triangle ?t equilateral '.



! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 11/20/2023 20:43'!
symetrieAxiale: e
	e
		lisRegle: 'symetrieAxiale-reflexionPoint'
		si:
			'reflexion ?p ?ip ?axe 
point ?p
segment ?s  ?p ?ip'
		alors: 'perpendiculaire ?s  ?axe'.
	e
		lisRegle: 'symetrieAxiale-reflexionPointCouple'
		si:
			'reflexion ?p ?ip ?axe 
~ pointSur ?axe  ?p'
		alors: 'perpendiculaire [ ?p ?ip ] ?axe'
		com:
			'Un point et son image par une réflexion (symétrie axiale) forment un couple perpendiculaire à l''axe de réflexion.'.
	e
		lisRegle: 'symetrieAxiale-reflexionSegment'
		si:
			'reflexion ?ip ?p ?axe 
pointSur ?axe ?p2 
point ?p
point ?p2
ordonneMot:et:rep1:rep2:  ?p ?p2 ?pp ?pp2
ordonneMot:et:rep1:rep2:  ?ip ?p2 ?ipp ?ppp2
'
		alors: 'isométrique [ ?pp ?pp2 ] [ ?ipp ?ppp2 ] '
		com:
			'Les segments reliant un point sur l''axe et respectivement un point et son image par une rélexion (symétrie axiale) sont isométriques'.
	e
		lisRegle: 'symetrieAxiale-ReflexionImages1'
		si:
			'reflexion ?p ?ip ?axe 
translation point ?p ?ipt1 ?v
translation point ?ip ?iipt1 ?v'
		alors: 'reflexion ?ipt1 ?iipt1 ?axe'
		com:
			'si un point a une  image par translation et une image par réflexion
alors son image par translation a aussi une image par la même réflexion.'.
	e
		lisRegle: 'symetrieAxiale-ReflexionImages2'
		si:
			'reflexion ?ip ?p ?axe 
translation point ?ipt1 ?ip ?v
translation point ?iipt1 ?p ?v'
		alors: 'reflexion ?ipt1 ?iipt1 ?axe'
		com:
			'si un point a une  image par translation et une image par réflexion
alors son image par translation a aussi une image par la même réflexion.'.
	e
		lisRegle: 'symetrieAxiale-ReflexionI-parallèles'
		si:
			'reflexion ?xi ?x ?axe
reflexion ?yi ?y ?axe
different:de: ?xi ?yi
different:de: ?x ?y'
		alors: 'parallèle  [ ?xi ?x ]  [ ?yi ?y ]'
		com:
			'les segment reliant un point et son image par symétrie axiale sont parallèles'! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 10/15/2021 12:35'!
symetrieCentrale: e
e lisRegle: 'symetrieCentrale-Arc' 
si:  'symetrieCentrale ?Arc2 ?Arc1 ?csym
arcCentré ?Arc1 ?centre ?p1 ?p2
symetrieCentrale ?centre2 ?centre  ?csym
symetrieCentrale ?pp1 ?p1  ?csym
symetrieCentrale ?pp2 ?p2  ?csym'
alors: 'arcCentré ?Arc2 ?centre2  ?pp1 ?pp2'.

e lisRegle:  'symetrieCentrale-isométrie'
si:  'symetrieCentrale  ?x1 ?x2 ?x3
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?xx1 ?xx3
ordonneMot:et:rep1:rep2: ?x2 ?x3 ?xx2 ?xx33'
alors:  'isométrique [ ?xx1 ?xx3 ] [ ?xx2 ?xx33 ]'
com: 'Le centre de symétrie partage en 2 segments isométriques le segment relliant un point à son image.'.

e lisRegle:  'symetrieCentrale-pointSurDroite1'
si:  'symetrieCentrale  ?x1 ?x2 ?x3
sorteDeDroite ?d
pointSur ?d ?x2
pointSur ?d ?x3'
alors:  'pointSur ?d ?x1'
com: 'Si le centre de symétrie et un point sont sur une droite, l''image de ce point est aussi sur cette droite.'.

e lisRegle:  'symetrieCentrale-pointSurDroite2'
si:  'symetrieCentrale  ?x1 ?x2 ?x3
pointSur ?d ?x1
pointSur ?d ?x3'
alors:  'pointSur ?d ?x2'
com: 'Si le centre de symétrie et un l''image d''un point sont sur une droite, ce point est aussi sur cette droite.'.

e lisRegle: 'symetrieCentrale-segmentsParallele'
si:  'symetrieCentrale ?x ?y ?centre
segment ?y [ ?a ?b ]' 
alors: 'parallele ?x ?y'.

e lisRegle: 'symetrieCentrale-SymetrieCentraleSegment' 
si:  'symetrieCentrale ?cible ?objet ?centre
segment ?objet [ ?x ?y ]
symetrieCentrale ?x1 ?x ?centre
symetrieCentrale ?y1 ?y ?centre'
alors: 'segment ?cible [ ?x1 ?y1 ]'.                                  

e lisRegle: 'symetrieCentrale-milieu' 
si: 'symetrieCentrale ?x1 ?x ?centre
ordonneMot:et:rep1:rep2:  ?x1 ?x ?xx1 ?xx' 
alors:  'milieu  [ ?xx1 ?xx ] ?centre' 
com: 'le centre de symétrie est le milieu entre un point et son image.'.



e lisRegle:  'symetrieCentrale-PointSurCercle'
si:  'pointSur ?c ?p
symetrieCentrale ?x1 ?p ?centre
cercle ?c  ?centre ?x
'
alors:  'pointSur ?c ?x1'
com: 'si un point est sur un cercle l''image de ce point par symètrie centrale est sur le cercle.'.

e lisRegle: 'symetrieCentrale-milieu2Pts'
 si:  'point ?a ?x
point ?b ?x2
point ?c ?x3
symetrieCentrale ?x1 ?x2 ?centre1
symetrieCentrale ?x2 ?3 ?centre2'

alors:  'parallele [ ?x1  ?x2 ] [  ?centre1 ?centre2 ]'
com: ''.! !

!ExpertRegle class methodsFor: 'rules' stamp: 'drgeo 10/31/2024 23:19:21'!
translations: e
	e
		lisRegle: 'translations-PointSur'
		si:
			'translation ?t ?ip1 ?p1 ?v
vecteur ?v
pointSur ?dr ?p1
sorteDeDroite ?dr
direction:rep: ?v ?res
direction:rep: ?dr ?res'
		alors: 'pointSur ?dr ?ip1'
		com:
			'le segments reliant un point à son image par un vecteur est isométrique au vecteur de la translation'.
	e
		lisRegle: 'translations-PointMemeVecteurEgalité'
		si:
			'translation point ?ip1 ?p1 ?v
segment ?s1 [ ?p1 ?ip1 ]'
		alors: 'isométrique ?s1 ?v'
		com:
			'le segments reliant un point à son image par un vecteur est isométrique au vecteur de la translation'.
	e
		lisRegle: 'translations--translationCroisée'
		si:
			'translation point ?ip ?p ?v
vecteur ?v ?x1 ?p2
vecteur ?v2 ?x1 ?p'
		alors: 'translation point ?ip ?p2 ?v2'
		com:
			' Si deux vecteurs ont une origine commune la translation du point p à l''extrémité d''un des vecteurs  par l''autre vecteur a la même image que celle de la transalation du point à l''extrémité de l''autre vecteur par ce vecteur; 
le vecteur reliant ce point et de même origine que les deux vecteurs est le vecteur somme des deux vecteurs.'.
	e
		lisRegle: 'translations--TranslationPerpendiculaire'
		si:
			'vecteurSur ?d ?v
perpendiculaire ?d ?perp'
		alors: 'perpendiculaire ?v ?perp'
		com:
			'Si un vecteur est sur une droite perpendiculaire à un objet
alors il est perpediculaire à cet objet'.
	e
		lisRegle: 'translations--PointparallèleASonVecteur'
		si:
			'translation point ?ip1 ?p1 ?v
vecteur ?v [ ?b ?a ]
relationCrée:et:nom: [ ?p1 ?ip1 ] [  ?b ?a ] parallèle'
		alors: 'relationCréée [ ?p1 ?ip1 ] [  ?b ?a ] parallèle'
		com:
			'le segment reliant un point à son image par une translation est  parallèle au  vecteur de la translation.'.
	e
		lisRegle: 'translations--segmentsparallèles'
		si:
			'translation point ?ip1 ?p1 ?v
translation point ?ip2 ?p2 ?v
segment ?s1 [ ?p1 ?p2 ]
segment ?s2 [ ?ip2 ?ip1 ]
relationCrée:et:nom: ?s1 ?s2 parallèle'
		alors: 'relationCréée  ?s1 ?s2 parallèle'
		com: 'Un segment et son image par une translation sont  parallèles.'.
	e
		lisRegle: 'translations--PointparallèleASonVecteurEgalité'
		si:
			'translation point ?ip1 ?p1 ?v
segment ?s1 [ ?p1 ?ip1 ]'
		alors: 'egal ?s1 ?v'
		com:
			'le segment reliant un point à son image par une translation est  égal au  vecteur de la translation.'.
	e
		lisRegle: 'translations-SorteDeDroiteParallèle'
		si:
			'sorteDeDroite ?so
translation ?s ?so ?v'
		alors: 'parallèle ?s ?so'.
	e
		lisRegle: 'translations-adition Vecteurs1'
		si:
			'translation point ?p1 ?p1o ?v1
translation point ?p2 ?p1o ?v2
translation point ?p3  ?p2 ?v1'
		alors: 'translation point ?p3 ?p1 ?v2'.
	e
		lisRegle: 'translations-adition Vecteurs2'
		si:
			'translation point ?p1 ?p1o ?v1
translation point ?p2 ?p1o ?v2
translation point ?p3  ?p2 ?v2'
		alors: 'translation point ?p3 ?p1 ?v1'! !

!ExpertRegle class methodsFor: 'rules' stamp: 'DrGeoUser 2/24/2020 13:08'!
varignon2: e

	"comment stating purpose of message"

e lisRegle: 'varign0n2Quaditriangle1'
	 si:  'quadrilatere ?A ?B ?C ?D
segment ?s [ ?C ?A ]'
	alors:'triangle ?A ?B ?C'.
e lisRegle: 'varign0n2Quaditriangle2'
	 si:  'quadrilatere ?A ?B ?C ?D
segment ?s [ ?C ?A ]'
	alors:'triangle ?A ?D ?C'.

e lisRegle: 'varignon2Thales1' 
	si: 'triangle ?A ?B ?C
segment ?s1 [ ?A ?B ]
segment ?s2 [ ?B ?C ]
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s4 [ ?C ?A ]
segment ?s3 [ ?j ?i ]' 
	alors: 'parallele ?s3 ?s4'.
	e lisRegle: 'varignon2Thales2' 
	si: 'triangle ?A ?B ?C
segment ?s1 [ ?C ?B }
segment ?s2 [ ?B ?A ]
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s4 [ ?C ?A ]
segment ?s3 [ ?j ?i ]' 
	alors: 'parallele ?s3 ?s4'.! !

!ExpertRegle class methodsFor: 'rules'!
varignonRegles: arg1
	| temp2 |
	temp2 := arg1 creeRegle: 'VarignonAdjacent1'.
	temp2 antecedents: 'segment ?s1                     
segment ?s2  ?x ?c
different:de: ?s1 ?s2
'.
	temp2 concl: 'adjacent ?s1 ?s2 ?a ?x ?c'.
	temp2 := arg1 creeRegle: 'VarignonAdjacent2'.
	temp2 antecedents: 'segment ?s1 [ ?x ?a ]
segment ?s2  [ ?x ?c }
different:de: ?s1 ?s2'.
	temp2 concl: 'adjacent ?s1 ?s2 ?a ?x ?c'.
	temp2 := arg1 creeRegle: 'VarignonAdjacent3'.
	temp2 antecedents: 'segment [ ?s1 ?a ?x ]
segment ?s2  [ ?c ?x ]
different:de: ?s1 ?s2'.
	temp2 concl: 'adjacent ?s1 ?s2 ?a ?x ?c'.
	temp2 := arg1 creeRegle: 'VarignonAdjacent4'.
	temp2 antecedents: 'segment ?s1 [ ?x ?a ]
segment ?s2  [ ?x ?c ]
different:de: ?s1 ?s2'.
	temp2 concl: 'adjacent ?s1 ?s2 ?a ?x ?c'.
	temp2 := arg1 creeRegle: 'VarignonMilieu1'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?a ?b ?c
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s3 [  ?i ?j ]
segment ?s4 [ ?c ?a'.
	temp2 concl: 'parallele ?s3 ?s4'.
	temp2 := arg1 creeRegle: 'VarignonMilieu2'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?c ?b ?a
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s3 ?i ?j
segment ?s4 ?c ?a
'.
	temp2 concl: 'parallele ?s3 ?s4'.
	temp2 := arg1 creeRegle: 'VarignonMilieu3'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?c ?b ?a
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s3 ?i ?j
segment ?s4 ?a ?c
'.
	temp2 concl: 'parallele ?s3 ?s4'.
	temp2 := arg1 creeRegle: 'VarignonMilieu4'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?a ?b ?c
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s3 ?j ?i
segment ?s4 ?c ?a
'.
	temp2 concl: 'parallele ?s3 ?s4'.
	arg1
		lisRegle: 'VarignonsegmentsConfondus1'
		si: 'segment ?s1 ?a ?b
milieu ?s1 ?i
segment ?s2 ?i ?b
'
		alors: 'parallele ?s1 ?s2'.
	arg1
		lisRegle: 'VarignonsegmentsConfondus2'
		si: 'segment ?s1 ?a ?b
milieu ?s1 ?i
segment ?s2 ?a ?i
'
		alors: 'parallele ?s1 ?s2'.
	temp2 := arg1 creeRegle: 'VarignonThales3'.
	temp2 antecedents: 'parallele ?par ?d2 ?i
droite ?d2 ?x ?p
pointSur ?d ?i
droite ?d ?ch ?x
droite ?d3 ?ch ?p
intersection  ?par ?d3 ?PP
'.
	temp2 concl: 'homothetie ?ch ?i ?x image de ?p ?PP'.
	temp2 := arg1 creeRegle: 'VarignonThales0'.
	temp2 antecedents: 'homothetie ?ch ?i ?x image de ?m ?mm'.
	temp2 concl: 'homothetie ?ch ?i ?x image de ?x ?i'.
	temp2 := arg1 creeRegle: 'VarignonParalHomothetie'.
	temp2 antecedents: 'homothetie ?ch ?i ?x image de ?p ?P
homothetie ?ch ?i ?x image de ?p1 ?P1
different:de: ?p ?p1
different:de: ?p ?P
different:de: ?p1 ?P1
segment ?s ?p1 ?p
segment ?s1 ?P1 ?P'.
	temp2 concl: 'parallele ?s ?s1'.
	temp2 := arg1 creeRegle: 'VarignonParalTrans'.
	temp2 antecedents: 'parallele ?s1 ?s2
parallele ?s3 ?s2
different:de: ?s1 ?s2
different:de: ?s1 ?s3
different:de: ?s2 ?s3
'.
	temp2 concl: 'parallele ?s1 ?s3'.
	temp2 := arg1 creeRegle: 'VarignonParalRec'.
	temp2 antecedents: 'parallele ?s1 ?s2
'.
	temp2 concl: 'parallele ?s2 ?s1'.
	temp2 := arg1 creeRegle: 'VarignonTriangle'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?a ?b ?c
adjacent ?s2 ?s3 ?b ?c ?a
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?x1 ?x2
ordonneMot:et:rep1:rep2: ?x1 ?s3  ?s1 ?x4
'.
	temp2 concl: 'triangle ?s1 ?s2 ?s3 '.
	temp2 := arg1 creeRegle: 'VarignonTriangles semblables'.
	temp2 antecedents: 'triangle ?s1 ?s2 ?s3
triangle ?ss1 ?ss2 ?ss3
parallele ?s1 ?ss1
parallele ?s2 ?ss2
parallele ?s3 ?ss3'.
	temp2 concl: 'semblables triangle ?s1 ?s2 ?s3 triangle ?ss1 ?ss2 ?ss3'.
	temp2 := arg1 creeRegle: 'VarignonQuadrilatere'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?a ?b ?c
different:de: ?s1 ?s2
adjacent ?s2 ?s3 ?b ?c ?d
different:de: ?s2 ?s3
adjacent ?s3 ?s4 ?c ?d ?a
different:de: ?s3 ?s4
adjacent ?s4 ?s1 ?d ?a ?b
different:de: ?s1 ?s4
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?x1 ?x2
ordonneMot:et:rep1:rep2: ?x1 ?s3 ?x3 ?x4
ordonneMot:et:rep1:rep2: ?x3 ?s4 ?s1 ?x6'.
	temp2 concl: 'quadrilatere ?s1 ?s2 ?s3 ?s4'.
	temp2 := arg1 creeRegle: 'VarignonQuadrilateres semblables'.
	temp2 antecedents: 'quadrilatere ?s1 ?s2 ?s3 ?s4
quadrilatere ?ss1 ?ss2 ?ss3 ?ss4

parallele ?s1 ?ss1
parallele ?s2 ?ss2
parallele ?s3 ?ss3
parallele ?s4 ?ss4'.
	temp2 concl: 'semblables quadrilateres ?s1 ?s2 ?s3 ?s4 quadrilatere ?ss1 ?ss2 ?ss3 ?ss4'.
	temp2 := arg1 creeRegle: 'VarignonParallelograme'.
	temp2 antecedents: 'quadrilatere ?s1 ?s2 ?s3 ?s4

parallele ?s1 ?s3
parallele ?s2 ?s4
'.
	temp2 concl: 'parallelograme ?s1 ?s2 ?s3 ?s4'.
	arg1
		lisRegle: 'varignonlosange'
		si: 'parallelograme ?s1 ?s2 ?s3 ?s4
isometrique ?s2 ?s34
isometrique ?s1 ?s3'
		alors: 'losange ?s2 ?b ?c ?d'.
	arg1
		lisRegle: 'varignonHomothetie'
		si: 'homothetie ?J ?S ?N ?val
homothetie ?I ?S ?M ?val
segment ?s1 ?I ?j
segment ?s2  ?M ?N'
		alors: 'parallele ?s1 ?s2'.
	arg1
		lisRegle: 'varignonParalleleSymCentrale1'
		si: 'symetrie centrale  ?D ?B ?o
symetrie centrale ?C ?A ?o
segment ?s ?C ?D
segment ?ss ?A ?B'
		alors: 'parallele ?s ?ss'.
	arg1
		lisRegle: 'varignonParalleleSymCentrale2'
		si: 'symetrie centrale  ?D ?B ?o
symetrie centrale ?C ?A  ?o
segment ?s ?B ?C
segment ?ss ?D  ?A'
		alors: 'parallele ?s ?ss'.
	arg1
		lisRegle: 'varignonParalleleCrée'
		si: 'relationCréée ?x1 ?x2 parallèle'
		alors: 'parallèle ?x1 ?x2 '.! !
