'From Cuis6.0 [latest update: #6118] on 16 February 2025 at 12:09:01 pm'!
'Description '!
!provides: 'Myexpert' 1 7!
!requires: 'DrGeoFrench' 1 13 nil!
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
	instanceVariableNames: 'stw nl regles aVerifier faits vars trouve affirmations ordreRegles deductions lrgl drgeo relations retablit constructions com indtexte titre'
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


!ExpertWorkspace methodsFor: 'accessing'!
bindings
	^ bindings.! !

!ExpertRelations methodsFor: 'accessing'!
expert
	^ expert.! !

!ExpertRelations methodsFor: 'accessing'!
expert: arg1
	expert _ arg1.! !

!ExpertRelations methodsFor: 'accessing'!
includes: arg1
	^ (self select: [ :argm0_2 |
		argm0_2 = arg1 ]) notEmpty.! !

!ExpertRelations methodsFor: 'accessing'!
relation: arg1 et: arg2 nom: arg3
	| temp4 temp5 temp6 |
	temp4 _ expert relationsAt: arg3.
	temp4 isEmptyOrNil ifTrue: [ ^ false ].
	temp5 _ temp4
		detect: [ :argm2_7 |
			argm2_7 includes: arg1 ]
		ifNone: [ ].
	temp6 _ temp4
		detect: [ :argm3_7 |
			argm3_7 includes: arg2 ]
		ifNone: [ ].
	temp5 ifNil: [ ^ false ].
	temp6 ifNil: [ ^ false ].
	^ temp5 = temp6.! !

!ExpertRelations methodsFor: 'accessing'!
relation: arg1 nom: arg2
	| temp3 |
	temp3 _ self selectRelation: arg2.
	temp3 _ temp3 select: [ :argm1_4 |
		argm1_4 includes: arg1 ].
	temp3 isEmpty ifTrue: [ ^ temp3 ].
	^ temp3 asArray first.! !

!ExpertRelations methodsFor: 'accessing'!
relationCrée: arg1 et: arg2 nom: arg3
	| temp4 temp5 temp6 temp7 |
	temp7 _ self expert.
	temp6 _ temp7 relationsAt: arg3.
	temp4 _ temp6
		detect: [ :argm2_8 |
			argm2_8 includes: arg1 ]
		ifNone: [ ].
	temp5 _ temp6
		detect: [ :argm3_8 |
			argm3_8 includes: arg2 ]
		ifNone: [ ].
	(temp4 isNil and: [ temp5 isNil ]) ifTrue: [
		temp4 _ self class new.
		temp4
			add: arg1 copy;
			add: arg2 copy.
		temp6 add: temp4.
		temp7 relations
			at: arg3
			put: temp6.
		^ true ].
	(temp4 notNil and: [ temp5 isNil ]) ifTrue: [
		(temp6 includes: temp4) ifTrue: [ temp6 remove: temp4 ].
		temp4 add: arg2 copy.
		temp6 add: temp4.
		temp7 relations
			at: arg3
			put: temp6.
		^ true ].
	(temp5 notNil and: [ temp4 isNil ]) ifTrue: [
		(temp6 includes: temp5) ifTrue: [ temp6 remove: temp5 ].
		temp5 add: arg1 copy.
		temp6 add: temp5.
		temp7 relations
			at: arg3
			put: temp6.
		^ true ].
	((temp4 notNil and: [ temp5 notNil ]) and: [ temp4 = temp5 ]) ifTrue: [ ^ true ].
	temp4 do: [ :argm8_8 |
		temp5 add: argm8_8 ].
	temp6
		remove: temp4
		ifAbsent: [ ].
	^ true.! !

!ExpertRelations methodsFor: 'accessing'!
relations
	^ expert relations.! !

!ExpertRelations methodsFor: 'accessing'!
relations: arg1
	expert relations: arg1.! !

!ExpertRelations methodsFor: 'accessing'!
relationsAt: arg1
	^ self relations
		at: arg1 asSymbol
		ifAbsentPut: [ OrderedCollection new ].! !

!ExpertRelations methodsFor: 'accessing'!
selectRelation: arg1
	^ self expert relations select: [ :argm0_2 |
		argm0_2 includes: arg1 ].! !

!ExpertRelations class methodsFor: 'accessing'!
initRelations
	relations _ IdentityDictionary new.! !

!ExpertRelations class methodsFor: 'accessing'!
relations
	^ relations.! !

!ExpertRelations class methodsFor: 'accessing'!
relationsAt: arg1
	^ relations
		at: arg1 asSymbol
		ifAbsentPut: [ OrderedCollection new ].! !

!ExpertRelations class methodsFor: 'initialize'!
new: arg1
	| temp2 |
	temp2 _ self new.
	temp2 add: arg1.
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
< arg1
	| temp2 temp3 |
	temp2 _ self printString.
	temp3 _ arg1 printString.
	^ temp2 < temp3.! !

!ExpertList methodsFor: 'accessing'!
= arg1
	(arg1 isKindOf: ExpertList) ifFalse: [ ^ false ].
	(self isEmpty and: [ arg1 isEmpty ]) ifTrue: [ ^ true ].
	(self tail isNil and: [ arg1 tail notNil ]) ifTrue: [ ^ false ].
	(arg1 tail isNil and: [ self tail notNil ]) ifTrue: [ ^ false ].
	((self head isKindOf: Number) and: [ arg1 head isKindOf: Number ]) ifTrue: [ ^ self tail = arg1 tail and: [ self head - arg1 head < 1.0e-7 ]].
	^ self head = arg1 head and: [ self tail = arg1 tail ].! !

!ExpertList methodsFor: 'accessing'!
add: arg1
	self addLast0: arg1.
	^ arg1.! !

!ExpertList methodsFor: 'accessing'!
addFirst: arg1
	| temp2 |
	temp2 _ self class new.
	temp2 head: arg1.
	temp2 tail: self.
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
addFirstIfNotIncluded: arg1
	| temp2 |
	(self includes: arg1) ifTrue: [ ^ self ].
	temp2 _ self veryDeepCopy.
	^ temp2 addFirst: arg1.! !

!ExpertList methodsFor: 'accessing'!
addLast0: arg1
	self tail ifNil: [
		self head: arg1.
		self tail: self class new.
		^ self ].
	self tail addLast0: arg1.! !

!ExpertList methodsFor: 'accessing'!
addLast: arg1
	self addLast0: arg1.! !

!ExpertList methodsFor: 'accessing'!
addLastIfNotIncluded: arg1
	| temp2 |
	(self includes: arg1) ifTrue: [ ^ self ].
	temp2 _ self veryDeepCopy.
	^ temp2 addLast0: arg1.! !

!ExpertList methodsFor: 'accessing'!
all: arg1
	| temp2 |
	temp2 _ true.
	self do: [ :argm1_4 |
		(arg1 value: argm1_4) ifFalse: [ temp2 _ false ]].
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
allButFirst
	^ self tail.! !

!ExpertList methodsFor: 'accessing'!
allButLast
	| temp1 |
	temp1 _ self copyList.
	^ temp1 allButLast0: temp1.! !

!ExpertList methodsFor: 'accessing'!
allButLast0: arg1
	| temp2 |
	self tail ifNil: [ ^ nil ].
	temp2 _ self tail.
	self tail tail isEmpty ifTrue: [
		temp2 head: nil.
		temp2 tail: nil.
		^ arg1 ].
	^ self tail allButLast0: arg1.! !

!ExpertList methodsFor: 'accessing'!
append: arg1
	^ ExpertList new
		append: self deepCopy
		with: arg1.! !

!ExpertList methodsFor: 'accessing'!
append: arg1 with: arg2
	| temp3 |
	temp3 _ arg1.
	arg2 doFirstLevel: [ :argm1_4 |
		temp3 add: argm1_4 ].
	^ temp3.! !

!ExpertList methodsFor: 'accessing'!
asArray
	^ self asOrderedCollection asArray.! !

!ExpertList methodsFor: 'accessing'!
asCollection
	^ self asOrderedCollection.! !

!ExpertList methodsFor: 'accessing'!
asOrderedCollection
	| temp1 |
	temp1 _ OrderedCollection new.
	self doFirstLevel: [ :argm1_2 |
		temp1 addLast: argm1_2 ].
	^ temp1.! !

!ExpertList methodsFor: 'accessing'!
asSetlist
	^ ExpertList new: self asOrderedCollection asSet.! !

!ExpertList methodsFor: 'accessing'!
asString
	^ self printString.! !

!ExpertList methodsFor: 'accessing'!
at: arg1
	arg1 > self size ifTrue: [ ^ nil ].
	arg1 < 1 ifTrue: [ ^ nil ].
	arg1 = 1 ifTrue: [ ^ self first ].
	^ self allButFirst at: arg1 - 1.! !

!ExpertList methodsFor: 'accessing'!
collect: arg1
	| temp2 |
	temp2 _ self class new.
	self doFirstLevel: [ :argm1_3 |
		temp2 add: (arg1 value: argm1_3) ].
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
copyList
	| temp1 |
	self isEmpty ifTrue: [ ^ self ].
	temp1 _ ExpertList new.
	self doFirstLevel: [ :argm2_2 |
		temp1 add: argm2_2 ].
	^ temp1.! !

!ExpertList methodsFor: 'accessing'!
couples
	^ self couples: ExpertList new.! !

!ExpertList methodsFor: 'accessing'!
couples: arg1
	| temp2 temp3 temp4 temp5 |
	temp5 _ arg1.
	temp2 _ self first.
	temp3 _ self allButFirst.
	temp3 isEmpty ifTrue: [ ^ arg1 ].
	temp3 _ temp3 first.
	temp4 _ ExpertList new.
	temp4 add: temp2.
	temp4 add: temp3.
	temp5 add: temp4.
	^ self allButFirst couples: temp5.! !

!ExpertList methodsFor: 'accessing'!
do: arg1
	| temp2 |
	self isEmpty ifTrue: [ ^ self ].
	temp2 _ ExpertList new.
	self head isList
		ifTrue: [ temp2 head: (self head doRecursively: arg1) ]
		ifFalse: [ temp2 head: (arg1 value: self head) ].
	temp2 tail: (self tail doRecursively: arg1).
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
doFirstLevel: arg1
	| temp2 |
	self isEmpty ifTrue: [ ^ self ].
	arg1 value: self head.
	self tail doFirstLevel: arg1.! !

!ExpertList methodsFor: 'accessing'!
doRecursively: arg1
	| temp2 |
	self isEmpty ifTrue: [ ^ self ].
	temp2 _ ExpertList new.
	self head isList
		ifTrue: [ temp2 head: (self head doRecursively: arg1) ]
		ifFalse: [ temp2 head: (arg1 value: self head) ].
	temp2 tail: (self tail doRecursively: arg1).
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
faitAsList: arg1
	| temp2 |
	arg1 isList ifTrue: [ ^ arg1 ].
	(arg1 isKindOf: OrderedCollection) ifTrue: [
		temp2 _ ExpertList emptyList.
		arg1 do: [ :argm2_4 |
			temp2 _ temp2 addLast: argm2_4 ].
		^ temp2 ].
	arg1 isString ifTrue: [ ^ ExpertList new: arg1 ].! !

!ExpertList methodsFor: 'accessing'!
first
	^ self head.! !

!ExpertList methodsFor: 'accessing'!
head
	^ head.! !

!ExpertList methodsFor: 'accessing'!
head: arg1
	head _ arg1.! !

!ExpertList methodsFor: 'accessing'!
ifEmpty: arg1
	^ self isEmpty
		ifTrue: [ arg1 value ]
		ifFalse: [ self ].! !

!ExpertList methodsFor: 'accessing'!
includes: arg1
	self isEmpty ifTrue: [ ^ false ].
	self first = arg1 ifFalse: [ ^ self allButFirst includes: arg1 ].
	^ true.! !

!ExpertList methodsFor: 'accessing'!
index: arg1
	^ self
		index: arg1
		n: 0.! !

!ExpertList methodsFor: 'accessing'!
index: arg1 n: arg2
	| temp3 |
	self isEmpty ifTrue: [ ^ nil ].
	arg1 = self first ifTrue: [ ^ arg2 + 1 ].
	temp3 _ arg2 + 1.
	^ self allButFirst
		index: arg1
		n: temp3.! !

!ExpertList methodsFor: 'accessing'!
instancie2: arg1
	| temp2 temp3 |
	self ifNil: [ ^ self ].
	self first isList ifTrue: [ ^ (self allButFirst instancie2: arg1) addFirst: (self instancie2: arg1) ].
	self allButFirst ifNil: [ ^ nil ].
	^ (self allButFirst instancie2: arg1) addFirst:
		(((temp3 _ self asString) beginsWith: '?')
			ifTrue: [
				temp2
					valeur: temp3
					vars: arg1 ]
			ifFalse: [ temp3 ]).! !

!ExpertList methodsFor: 'accessing'!
instancie: arg1
	^ self do: [ :argm0_2 |
		(argm0_2 asString beginsWith: '?')
			ifTrue: [
				Expert new
					valeur: argm0_2
					vars: arg1 ]
			ifFalse: [ argm0_2 ]].! !

!ExpertList methodsFor: 'accessing'!
instancie: arg1 expert: arg2
	^ self do: [ :argm0_3 |
		(argm0_3 asString beginsWith: '?')
			ifTrue: [
				arg2
					valeur: argm0_3
					vars: arg1 ]
			ifFalse: [ argm0_3 ]].! !

!ExpertList methodsFor: 'accessing'!
isEmpty
	^ self tail isNil and: [ self head isNil ].! !

!ExpertList methodsFor: 'accessing'!
isList
	^ true.! !

!ExpertList methodsFor: 'accessing'!
last
	self tail ifNil: [ ^ nil ].
	self tail tail ifNil: [ ^ self head ].
	^ self tail last.! !

!ExpertList methodsFor: 'accessing'!
makeCollectionOfLists: arg1
	^ ((arg1 subStrings: '
') collect: [ :argm0_2 |
		ExpertList new: argm0_2 ]) asOrderedCollection.! !

!ExpertList methodsFor: 'accessing'!
makeList: arg1
	^ self
		makeList: arg1
		list: ExpertList new.! !

!ExpertList methodsFor: 'accessing'!
makeList: arg1 list: arg2
	| temp3 temp4 |
	temp4 _ arg2.
	temp3 _ arg1 next.
	temp3 = #']' ifTrue: [ ^ arg2 ].
	temp3 = #'[' ifTrue: [
		temp3 _ arg2
			makeList: arg1
			list: ExpertList new ].
	temp3 ifNil: [ ^ arg2 ].
	temp4 _ arg2 addLast: temp3.
	^ self
		makeList: arg1
		list: temp4.! !

!ExpertList methodsFor: 'accessing'!
makeNom
	| temp1 temp2 |
	temp1 _ ReadStream on: self.
	temp2 _ WriteStream on: ''.
	temp2 nextPutAll: temp1 next.
	[
	temp2 nextPut: $:.
	temp2 nextPutAll: temp1 next.
	temp1 atEnd ] whileFalse.
	^ temp2 contents.! !

!ExpertList methodsFor: 'accessing'!
makeWordCollection: arg1
	| temp2 |
	temp2 _ ((arg1 subStrings: ' ') collect: [ :argm0_3 |
		argm0_3 asSymbol ]) asOrderedCollection.
	'[' = temp2 first ifTrue: [ temp2 _ temp2 allButFirst ].
	'[' = temp2 last ifTrue: [ temp2 _ temp2 allButLast ].
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
max
	^ self sort last.! !

!ExpertList methodsFor: 'accessing'!
min
	^ self sort first.! !

!ExpertList methodsFor: 'accessing'!
notEmpty
	^ self isEmpty not.! !

!ExpertList methodsFor: 'accessing'!
permute
	^ (self addLast: self first) allButFirst.! !

!ExpertList methodsFor: 'accessing'!
permuteMin
	| temp1 temp2 |
	temp1 _ self min.
	temp2 _ self.
	[
	temp2 _ temp2 permute.
	temp1 = temp2 first ] whileFalse.
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
reject: arg1
	| temp2 |
	temp2 _ self class new.
	self doFirstLevel: [ :argm1_3 |
		(arg1 value: argm1_3) ifFalse: [ temp2 add: argm1_3 ]].
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
removeFirst
	| temp1 temp2 |
	temp2 _ self first.
	temp1 _ self.
	temp1 head: temp1 tail head.
	temp1 tail: temp1 tail tail.
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
select: arg1
	| temp2 |
	temp2 _ self class new.
	self doFirstLevel: [ :argm1_3 |
		(arg1 value: argm1_3) ifTrue: [ temp2 add: argm1_3 ]].
	^ temp2.! !

!ExpertList methodsFor: 'accessing'!
size
	^ self size: 0.! !

!ExpertList methodsFor: 'accessing'!
size: arg1
	self isEmpty ifTrue: [ ^ arg1 ].
	^ self tail size: arg1 + 1.! !

!ExpertList methodsFor: 'accessing'!
sum
	| temp1 |
	temp1 _ 0.0.
	self do: [ :argm1_3 |
		temp1 _ temp1 + argm1_3 asNumber ].
	^ temp1.! !

!ExpertList methodsFor: 'accessing'!
tail
	^ tail.! !

!ExpertList methodsFor: 'accessing'!
tail: arg1
	tail _ arg1.! !

!ExpertList methodsFor: 'accessing'!
tousDifferents
	^ self size = self asArray asSet size.! !

!ExpertList methodsFor: 'accessing'!
tousDifferents: arg1
	^ arg1 asArray asSet size = arg1 size.! !

!ExpertList methodsFor: 'printing'!
printOn0: arg1
	self isEmpty ifTrue: [
		arg1 nextPutAll: '[ ]'.
		^ self ].
	self printOn2: arg1.! !

!ExpertList methodsFor: 'printing'!
printOn1: arg1
	self isEmpty ifTrue: [
		arg1 nextPutAll: '[ ]'.
		^ self ].
	arg1 nextPutAll: ' [ '.
	self printOn2: arg1.
	arg1 nextPutAll: ' ] '.! !

!ExpertList methodsFor: 'printing'!
printOn2: arg1
	self isEmpty ifTrue: [ ^ '[  ]' ].
	self tail ifNil: [ ^ self ].
	self head class = ExpertList
		ifTrue: [ self head printOn1: arg1 ]
		ifFalse: [
			head ifNotNil: [
				head isString
					ifTrue: [ arg1 nextPutAll: head ]
					ifFalse: [ arg1 nextPutAll: head printString ]].
			self size > 1 ifTrue: [ arg1 nextPut: $  ]].
	self tail printOn2: arg1.! !

!ExpertList methodsFor: 'printing'!
printOn: arg1
	self isEmpty ifTrue: [
		arg1 nextPutAll: '[ ]'.
		^ self ].
	self printOn0: arg1.! !

!ExpertList methodsFor: 'comparing'!
<= arg1
	| temp2 temp3 |
	temp2 _ self printString.
	temp3 _ arg1 printString.
	^ temp2 <= temp3.! !

!ExpertList methodsFor: 'sorting'!
sort
	| temp1 |
	temp1 _ self.
	^ temp1 sort: [ :argm1_2 :argm1_3 |
		argm1_2 < argm1_3 ].! !

!ExpertList methodsFor: 'sorting'!
sort: arg1
	| temp2 temp3 temp4 |
	temp2 _ self asOrderedCollection.
	temp2 size > 1 ifFalse: [ ^ self ].
	temp2 _ temp2 sort: arg1.
	temp3 _ ReadStream on: temp2.
	temp4 _ WriteStream on: ''.
	temp4 nextPutAll: temp3 next.
	[
	temp4 nextPutAll: ' '.
	temp4 nextPutAll: temp3 next.
	temp3 atEnd ] whileFalse.
	^ ExpertList new: temp4 contents.! !

!ExpertList class methodsFor: 'opening'!
emptyList
	^ self new.! !

!ExpertList class methodsFor: 'opening'!
new: arg1
	| temp2 temp3 |
	temp3 _ self new.
	arg1 isList ifTrue: [ ^ arg1 copy ].
	arg1 isString ifTrue: [
		arg1 ifEmpty: [ ^ temp3 ].
		temp2 _ (temp3 makeWordCollection: arg1) readStream.
		temp3 _ temp3 makeList: temp2.
		^ temp3 ].
	arg1 isNumber ifTrue: [
		temp3 add: arg1.
		^ temp3 ].
	arg1 do: [ :argm4_5 |
		temp3 _ temp3 addLast: argm4_5 ].
	^ temp3.! !

!ExpertOutils methodsFor: 'accessing'!
floatString: arg1
	^ arg1 asString size =
		(arg1 asString select: [ :argm0_2 |
			((((argm0_2 asciiValue
				between: 48
				and: 57) or: [ argm0_2 = $. ]) or: [ argm0_2 = $- ]) or: argm0_2 = $/) or: [ argm0_2 = $e ]]) size.! !

!ExpertOutils methodsFor: 'accessing'!
instancie: arg1 fait: arg2
	| temp3 temp4 |
	arg1 ifNil: [ ^ arg2 ].
	(arg1 isKindOf: IdentityDictionary) ifFalse: [ ^ arg2 ].
	temp4 _ ExpertList new: arg2.
	temp3 _ temp4 collect: [ :argm3_5 |
		self
			valeur: argm3_5
			vars: arg1 ].
	self halt.
	^ temp3.! !

!ExpertOutils methodsFor: 'accessing'!
instancie: arg1 vars: arg2
	| temp3 temp4 |
	arg2 ifNil: [ ^ arg1 ].
	(arg2 isKindOf: IdentityDictionary) ifFalse: [ ^ arg1 ].
	temp4 _ ExpertList new: arg1.
	temp3 _ arg1 do: [ :argm3_5 |
		self
			valeur: argm3_5
			vars: arg2 ].
	^ temp3.! !

!ExpertOutils methodsFor: 'accessing'!
relations
	^ ExpertRelations new relations.! !

!ExpertOutils methodsFor: 'accessing'!
relations: arg1
	ExpertRelations new class relations: arg1.! !

!ExpertOutils methodsFor: 'tools'!
affecte: arg1 valeur: arg2 vars: arg3
	| temp4 temp5 temp6 |
	arg3 ifNil: [ ^ arg1 ].
	arg3 = false ifTrue: [ ^ arg1 ].
	(arg1 asString beginsWith: '?') ifFalse: [ ^ false ].
	temp4 _ arg1 asString asSymbol.
	temp5 _ arg3
		at: temp4
		ifAbsent: [
			arg3
				at: temp4
				put: arg2.
			^ true ].
	temp6 _ self
		valeur: temp4
		vars: arg3.
	(temp6 asString includesAnyOf: '12345678890') ifTrue: [
		(self floatString: temp6 asString) ifTrue: [
			(temp6 asNumber - temp5 asNumber) abs < 0.0001 ifTrue: [ ^ true ]]].
	^ arg2 = temp5.! !

!ExpertOutils methodsFor: 'tools'!
appendCollection: arg1 with: arg2
	arg2 isNil ifTrue: [ ^ arg1 ].
	arg1 addAll: arg2.
	^ arg1.! !

!ExpertOutils methodsFor: 'tools'!
applatis: arg1
	^ (self applatisSuite: arg1) asSet asOrderedCollection.! !

!ExpertOutils methodsFor: 'tools'!
applatisSuite: arg1
	| temp2 temp3 |
	arg1 = false ifTrue: [ ^ false ].
	arg1 class == IdentityDictionary ifTrue: [ ^ arg1 ].
	arg1 ifEmpty: [ ^ OrderedCollection new ].
	temp2 _ arg1 asOrderedCollection first.
	temp3 _ arg1 asOrderedCollection allButFirst.
	temp2 class == OrderedCollection ifTrue: [
		temp3 isEmpty ifTrue: [ ^ self applatisSuite: temp2 ].
		^ self
			appendCollection: (self applatisSuite: temp2)
			with: (self applatisSuite: temp3) ].
	^ (self
		appendCollection: arg1
		with: (self applatisSuite: temp3)) reject: [ :argm6_4 |
		argm6_4 isNil ].! !

!ExpertOutils methodsFor: 'tools'!
colAsString: arg1
	| temp2 |
	temp2 _ (String new: 200) writeStream.
	arg1 do: [ :argm1_3 |
		argm1_3 isString
			ifTrue: [ temp2 nextPutAll: argm1_3 , ' ' ]
			ifFalse: [
				argm1_3 printOn: temp2.
				temp2 nextPutAll: ' ' ]].
	temp2 size > 0 ifTrue: [ temp2 skip: -1 ].
	^ temp2 contents.! !

!ExpertOutils methodsFor: 'tools'!
colAsString: arg1 debut: arg2
	^ arg1 collect: [ :argm0_3 |
		self
			string: argm0_3 asString
			debut: arg2 ].! !

!ExpertOutils methodsFor: 'tools'!
colAsStringWithCr: arg1
	| temp2 |
	temp2 _ String new writeStream.
	arg1 do: [ :argm1_3 |
		argm1_3 isString
			ifTrue: [ temp2 nextPutAll: argm1_3 , ' ' ]
			ifFalse: [
				argm1_3 printOn: temp2.
				temp2 nextPutAll: ' ' ].
		temp2 nextPutAll: ' ' ].
	temp2 size > 0 ifTrue: [ temp2 skip: -1 ].
	^ temp2 contents.! !

!ExpertOutils methodsFor: 'tools'!
colAsStringWithCrForSet: arg1
	| temp2 |
	temp2 _ String new writeStream.
	arg1 do: [ :argm1_3 |
		argm1_3 isString
			ifTrue: [ temp2 nextPutAll: '{' , argm1_3 allButFirst allButLast , '} ' ]
			ifFalse: [
				argm1_3 printOn: temp2.
				temp2 nextPutAll: ' ' ].
		temp2 nextPutAll: '
	' ].
	temp2 size > 0 ifTrue: [ temp2 skip: -1 ].
	^ temp2 contents.! !

!ExpertOutils methodsFor: 'tools'!
commentaireDe: arg1
	| temp2 temp3 |
	^ self.! !

!ExpertOutils methodsFor: 'tools'!
concat: arg1
	| temp2 temp3 |
	arg1 ifEmpty: [ ^ arg1 ].
	temp2 _ ReadStream on: arg1.
	temp3 _ WriteStream on: OrderedCollection new.
	[
	temp2 next ifNotNil: [ :temp4 |
		temp3 nextPutAll: temp4 ].
	temp2 atEnd ] whileFalse.
	^ temp3 contents.! !

!ExpertOutils methodsFor: 'tools'!
evaluate: arg1
	| temp2 |
	temp2 _ arg1.
	^ temp2 _ OpalCompiler new
		source: arg1;
		evaluate.! !

!ExpertOutils methodsFor: 'tools'!
faitAsString: arg1
	| temp2 temp3 |
	arg1 isList ifTrue: [
		temp3 _ arg1 do: [ :argm0_5 |
			argm0_5 asString ].
		^ temp3 printString ].
	temp2 _ String new writeStream.
	arg1 do: [ :argm2_5 |
		argm2_5 isString
			ifTrue: [
				temp3 _ ExpertList new: argm2_5.
				temp3 printOn: temp2.
				temp2 nextPutAll: ' ' ]
			ifFalse: [ argm2_5 printOn: temp2 ]].
	temp2 size > 0 ifTrue: [ temp2 skip: -1 ].
	^ temp2 contents.! !

!ExpertOutils methodsFor: 'tools'!
keyOf: arg1 lval: arg2
	^ arg2 keys at: (arg2 values indexOf: arg1).! !

!ExpertOutils methodsFor: 'tools'!
label: arg1
	^ (self drgeo view drawable itemViews detect: [ :argm0_2 |
		argm0_2 mathItem = arg1 ]) labelMorph.! !

!ExpertOutils methodsFor: 'tools'!
label: arg1 figure: arg2
	^ (arg2 view drawable itemViews detect: [ :argm0_3 |
		argm0_3 mathItem = arg1 ]) labelMorph.! !

!ExpertOutils methodsFor: 'tools'!
list: arg1
	^ ExpertList new: arg1.! !

!ExpertOutils methodsFor: 'tools'!
makeFactCollection: arg1
	| temp2 temp3 |
	temp3 _ OrderedCollection new.
	temp2 _ OrderedCollection new.
	arg1 do: [ :argm2_5 |
		argm2_5 = '§'
			ifTrue: [
				temp3 ifNotEmpty: [ temp2 add: temp3 ].
				temp3 _ OrderedCollection new ]
			ifFalse: [ temp3 add: argm2_5 ]].
	temp3 ifNotEmpty: [ temp2 add: temp3 ].
	^ temp2.! !

!ExpertOutils methodsFor: 'tools'!
makeFactCollectionFromString: arg1
	| temp2 |
	temp2 _ self creeRegle: 'temp'.
	temp2 antecedents: arg1.
	^ temp2 ant.! !

!ExpertOutils methodsFor: 'tools'!
makeList: arg1
	^ ExpertList new: arg1.! !

!ExpertOutils methodsFor: 'tools'!
makeNumber: arg1
	| temp2 |
	arg1 isPoint ifTrue: [ ^ arg1 ].
	arg1 isNumber ifTrue: [ ^ arg1 ].
	temp2 _ Compiler evaluate: arg1.
	temp2 isNumber ifTrue: [ ^ temp2 ].
	^ arg1.! !

!ExpertOutils methodsFor: 'tools'!
makeTokenCollection: arg1
	^ arg1 findTokens: #($  $( $) ).! !

!ExpertOutils methodsFor: 'tools'!
makeTokenCollection: arg1 index: arg2
	| temp3 temp4 temp5 |
	temp4 _ arg2 asString.
	temp5 _ ''.
	temp3 _ arg1 findTokens: #($  $( $) ).
	^ temp3 first.! !

!ExpertOutils methodsFor: 'tools'!
makeWordCollection: arg1
	| temp2 temp3 temp5 |
	arg1 class = OrderedCollection ifTrue: [ ^ arg1 ].
	temp2 _ OrderedCollection new.
	temp3 _ ''.
	temp5 _ true.
	arg1 do: [ :argm4_6 |
		argm4_6 = Character space
			ifTrue: [
				temp5 ifFalse: [
					temp3 ifNotEmpty: [
						temp2 add: temp3.
						temp3 _ ''.
						temp5 _ true ]]]
			ifFalse: [
				temp5 ifTrue: [ temp5 _ false ].
				argm4_6 isLineSeparator
					ifTrue: [
						temp2 add: temp3.
						temp2 add: '§'.
						temp3 _ '' ]
					ifFalse: [ temp3 _ temp3 , argm4_6 asString ]]].
	temp3 ~= '' ifTrue: [ temp2 add: temp3 ].
	^ temp2.! !

!ExpertOutils methodsFor: 'tools'!
minimum: arg1
	arg1 isList ifTrue: [ ^ arg1 asOrderedCollection sorted first ].
	^ (arg1 findTokens: #($; )) sorted first.! !

!ExpertOutils methodsFor: 'tools'!
nomDizainesPolygone: arg1
	arg1 = 0 ifTrue: [ ^ '' ].
	arg1 = 1 ifTrue: [ ^ 'Deca' ].
	arg1 = 2 ifTrue: [ ^ 'Icosca' ].
	arg1 > 2 ifTrue: [ ^ (self nomUnitéPolygone: arg1) , 'Conta' ].! !

!ExpertOutils methodsFor: 'tools'!
nomPolygone: arg1
	arg1 = 100 ifTrue: [ ^ 'Hectogone' ].
	^ (self nomUnitéPolygone: arg1 \\ 10) , (self nomDizainesPolygone: arg1 // 10) , 'gone'.! !

!ExpertOutils methodsFor: 'tools'!
nomUnitéPolygone: arg1
	| temp2 |
	temp2 _ #('' #Hen #Do #Tri #Tetra #Penta #Hexa #Hepta #Octo #Enea ) asOrderedCollection.
	^ (temp2 at: arg1 asNumber + 1) asString.! !

!ExpertOutils methodsFor: 'tools'!
nomsComRegles: arg1
	| temp2 |
	temp2 _ 0.
	^ arg1 collect: [ :argm1_4 |
		temp2 _ temp2 + 1.
		(argm1_4 com isNil or: [ argm1_4 com = '' ])
			ifTrue: [ temp2 asString , ' ' , argm1_4 name ]
			ifFalse: [ temp2 asString , ' ' , argm1_4 com ]].! !

!ExpertOutils methodsFor: 'tools'!
nomsRegles: arg1
	| temp2 |
	temp2 _ 0.
	^ arg1 collect: [ :argm1_4 |
		temp2 _ temp2 + 1.
		temp2 asString , ' ' , argm1_4 name ].! !

!ExpertOutils methodsFor: 'tools'!
perform: arg1 vars: arg2
	| temp3 temp4 temp5 |
	temp3 _ arg1 removeFirst.
	temp3 _ (temp3 , 'vars:') asSymbol.
	temp5 _ arg1 asOrderedCollection.
	temp5 add: arg2.
	temp4 _ temp5 asArray.
	^ self
		perform: temp3
		withArguments: temp4.! !

!ExpertOutils methodsFor: 'tools'!
sort: arg1
	| temp2 temp3 |
	arg1 isString ifTrue: [
		temp2 _ arg1 findTokens: #($; ).
		temp2 _ temp2 sorted.
		temp3 _ WriteStream on: ''.
		temp3 nextPutAll: temp2 first.
		temp2 allButFirst do: [ :argm4_4 |
			temp3 nextPutAll: ';' , argm4_4 ].
		^ temp3 contents ].
	^ arg1 sort.! !

!ExpertOutils methodsFor: 'tools'!
string: arg1 debut: arg2
	^ arg1 asString
		copyReplaceFrom: 1
		to: arg2
		with: ' '.! !

!ExpertOutils methodsFor: 'tools'!
unifie2: arg1 avec: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp4 _ arg1 copy.
	temp5 _ arg2 copy.
	temp4 ifNil: [ temp4 _ ExpertList new ].
	temp5 ifNil: [ temp5 _ ExpertList new ].
	(temp4 isEmpty and: [ temp5 isEmpty ]) ifTrue: [ ^ arg3 ].
	(temp4 isEmpty or: [ temp5 isEmpty ]) ifTrue: [ ^ false ].
	temp6 _ temp4 removeFirst.
	temp7 _ temp5 removeFirst.
	temp6 isNumber ifTrue: [ temp6 _ temp6 asString ].
	temp6 == temp7 ifTrue: [ ^ self
			unifie2: temp4
			avec: temp5
			vars: arg3 ].
	temp6 = temp7 ifTrue: [ ^ self
			unifie2: temp4
			avec: temp5
			vars: arg3 ].
	((temp6 isKindOf: ExpertList) and: [ temp7 isKindOf: ExpertList ]) ifTrue: [
		(self
			unifie2: temp6
			avec: temp7
			vars: arg3) = false ifTrue: [ ^ false ].
		^ self
			unifie2: temp4
			avec: temp5
			vars: arg3 ].
	(temp6 isString and: [ $? = temp6 first ]) ifTrue: [
		(temp7 isString not or: [ ($? = temp7 first) not ]) ifTrue: [
			(self
				affecte: temp6
				valeur: temp7
				vars: arg3) ifFalse: [ ^ false ]].
		temp4 isEmpty & temp5 isEmpty ifTrue: [ ^ arg3 ].
		^ self
			unifie2: temp4
			avec: temp5
			vars: arg3 ].
	$? = temp7 first ifTrue: [
		$? = temp6 first ifFalse: [
			(self
				affecte: temp7
				valeur: temp6
				vars: arg3) ifFalse: [ ^ false ]].
		(temp4 isEmpty and: [ temp5 isEmpty ]) ifTrue: [ ^ arg3 ].
		^ self
			unifie2: temp4
			avec: temp5
			vars: arg3 ].
	^ false.! !

!ExpertOutils methodsFor: 'tools'!
unifie: arg1 avec: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp4 _ ExpertList new: arg1.
	temp5 _ ExpertList new: arg2.
	(temp4 isEmpty and: [ temp5 isEmpty ]) ifTrue: [ ^ true ].
	(temp4 isEmpty or: [ temp5 isEmpty ]) ifTrue: [ ^ false ].
	temp6 _ temp4 removeFirst.
	temp7 _ temp5 removeFirst.
	temp6 = temp7 ifTrue: [ ^ self
			unifie: temp4
			avec: temp5
			vars: arg3 ].
	(temp6 isNumber and: [ temp7 isNumber not ]) ifTrue: [ temp7 _ self makeNumber: temp7 ].
	(temp6 isNumber not and: [ temp7 isNumber ]) ifTrue: [ temp6 _ self makeNumber: temp6 ].
	(temp6 isNumber and: [ temp7 isNumber ]) ifTrue: [
		(temp6 - temp7) abs < 1e-3 ifTrue: [
			arg3
				at:
					(self
						keyOf: temp7
						lval: arg3)
				put: (temp7 * 1000) rounded / 1000.
			arg3
				at:
					(self
						keyOf: temp6
						lval: arg3)
				put: (temp6 * 1000) rounded / 1000.
			^ true ]].
	((temp6 isKindOf: ExpertList) and: [ temp7 isKindOf: ExpertList ]) ifTrue: [
		(self
			unifie: temp6
			avec: temp7
			vars: arg3) ifTrue: [
			(temp4 isEmpty and: [ temp5 isEmpty ]) ifTrue: [ ^ true ].
			^ self
				unifie: temp4
				avec: temp5
				vars: arg3 ].
		^ false ].
	(temp6 isString and: [ $? = temp6 first ]) ifTrue: [
		(temp7 isString not or: [ ($? = temp7 asString first) not ]) ifTrue: [
			(self
				affecte: temp6
				valeur: temp7
				vars: arg3) ifFalse: [ ^ false ]].
		temp4 isEmpty & temp5 isEmpty ifTrue: [ ^ true ].
		^ self
			unifie: temp4
			avec: temp5
			vars: arg3 ].
	$? = temp7 asString first ifTrue: [
		$? = temp6 asString first ifFalse: [
			(self
				affecte: temp7
				valeur: temp6
				vars: arg3) ifFalse: [ ^ false ]].
		(temp4 isEmpty and: [ temp5 isEmpty ]) ifTrue: [ ^ true ].
		^ self
			unifie: temp4
			avec: temp5
			vars: arg3 ].
	^ false.! !

!ExpertOutils methodsFor: 'tools'!
valeur: arg1 vars: arg2
	| temp3 |
	arg1 isList ifTrue: [ ^ arg1 instancie: arg2 ].
	(arg1 asString beginsWith: '?') ifFalse: [ ^ arg1 ].
	arg2 ifNil: [ ^ arg1 ].
	(arg2 isKindOf: IdentityDictionary) ifFalse: [ ^ arg1 ].
	temp3 _ arg2
		at: arg1 asSymbol
		ifAbsent: [ ^ arg1 ].
	temp3 isList ifTrue: [ ^ temp3 instancie: arg2 ].
	^ temp3.! !

!ExpertOutils methodsFor: 'tools'!
verifieFait2: arg1
	| temp2 temp3 temp4 temp5 temp6 |
	temp2 _ self makeWordCollection: arg1.
	temp3 _ self faits
		at: temp2 first
		ifAbsent: [ ^ OrderedCollection new ].
	temp4 _ temp3 collect: [ :argm2_8 |
		Array
			with:
				(self
					unifie: temp2
					avec: argm2_8 fait
					vars: IdentityDictionary new)
			with: argm2_8 ].
	temp4 _ temp4 reject: [ :argm3_8 |
		argm3_8 first = false ].
	temp6 _ ''.
	temp4 do: [ :argm5_8 |
		temp6 _ temp6 , '
' , argm5_8 last afficheFait ].
	^ temp6.! !

!ExpertOutils methodsFor: 'tools'!
verifieFaits: arg1
	| temp2 temp3 temp4 |
	temp2 _ self makeFactCollectionFromString: arg1.
	temp3 _ temp2 collect: [ :argm1_6 |
		Array
			with: argm1_6
			with: ((self subclasses at: 3) verifieFait: argm1_6) ].
	temp4 _ ''.
	temp3 do: [ :argm3_6 |
		temp4 _ temp4 , '
	' , (self colAsString: argm3_6 first) , '
	' , (self colAsStringWithCr: argm3_6 last) ].
	^ temp4.! !

!Expert methodsFor: 'accessing'!
Display: arg1 String: arg2
	| temp3 |
	(WorkspaceWindow allInstances includes: arg1) ifFalse: [ temp3 _ self drgeo presenter expertInitJournal ].
	temp3 model actualContents: temp3 model actualContents , ' ' , arg2.! !

!Expert methodsFor: 'accessing'!
aConfirmer: arg1
	| temp2 temp3 temp4 temp5 |
	temp3 _ self reglesConcluants: arg1.
	temp3 _ ReadStream on: temp3 asOrderedCollection.
	temp2 _ WriteStream on: ''.
	[
	temp2
		nextPut: Character cr;
		nextPutAll: 'Soit par la regle '.
	temp2 nextPutAll: (temp4 _ temp3 next) first nom.
	temp2 nextPut: Character cr.
	temp5 _ ReadStream on: temp4 first ant.
	[
	temp2 nextPut: Character cr.
	temp2 nextPutAll:
		(self faitAsString:
			(temp4 first
				instancie: temp4 second
				fait: temp5 next)).
	temp5 atEnd ] whileFalse.
	temp2 nextPut: Character cr.
	temp3 atEnd ] whileFalse.
	^ temp2 contents.! !

!Expert methodsFor: 'accessing'!
activeRegle: arg1
	(ExpertRegle class methodDict keys includes: arg1 , ':') ifFalse: [ ^ 'Règle inexistante' ].
	(stw includes: arg1 asSymbol) ifTrue: [ ^ 'Règle déjà chargée' ].
	ExpertRegle
		perform: (arg1 , ':') asSymbol
		withArguments:
			{self}.
	stw add: arg1 asSymbol.
	^ 'Règle ' , arg1 , ' activée'.! !

!Expert methodsFor: 'accessing'!
afficheAffirmations
	| temp1 temp2 temp3 temp4 |
	temp1 _ 0.
	temp2 _ affirmations collect: [ :argm1_5 |
		argm1_5 fait asString ].
	temp3 _ ReadStream on: temp2.
	temp4 _ WriteStream on: ''.
	temp4 nextPut: Character cr.
	[
	temp1 _ temp1 + 1.
	temp4 nextPutAll: temp1 asString.
	temp4 nextPut: Character space.
	temp4 nextPutAll: temp3 next.
	temp4 nextPut: Character cr.
	temp3 atEnd ] whileFalse.
	^ temp4 contents.! !

!Expert methodsFor: 'accessing'!
afficheCode
	| temp1 |
	temp1 _ 'f:=DrGeoFigure nouveau.
'.
	(((self affirmations collect: [ :argm1_3 |
		argm1_3 fait ]) select: [ :argm1_3 |
		argm1_3 first = 'code' ]) collect: [ :argm1_3 |
		argm1_3 allButFirst asString ]) reverseDo: [ :argm1_3 |
		temp1 _ temp1 , argm1_3 , '.
' ].
	^ temp1.! !

!Expert methodsFor: 'accessing'!
afficheConclusions
	| temp1 temp2 |
	temp2 _ ReadStream on:
		(self regles values collect: [ :argm0_3 |
			argm0_3 concl asString ]) asSet asSortedCollection.
	temp1 _ WriteStream on: ''.
	[
	temp1 cr.
	temp1 nextPutAll: temp2 next.
	temp2 atEnd ] whileFalse.
	^ temp1 contents.! !

!Expert methodsFor: 'accessing'!
afficheFaits
	'' = self afficheFaits2 ifTrue: [ ^ 'base vide' ].
	^ self afficheFaits2.! !

!Expert methodsFor: 'accessing'!
afficheFaits2
	| temp1 temp2 temp3 temp4 |
	temp1 _ (self faits keys reject: [ :argm0_5 |
		argm0_5 asString endsWith: '-regles' ]) collect: [ :argm0_5 |
		Array
			with: argm0_5
			with: (self faits at: argm0_5) ].
	temp3 _ temp1 collect: [ :argm1_5 |
		argm1_5 last select: [ :argm1_6 |
			argm1_6 retire not ]].
	temp1 _ temp3 collect: [ :argm2_5 |
		argm2_5 collect: [ :argm2_6 |
			argm2_6 afficheFait2 ]].
	temp1 _ temp1 reject: [ :argm3_5 |
		argm3_5 isEmpty ].
	temp1 ifEmpty: [ ^ '' ].
	temp2 _ ReadStream on: temp1.
	temp3 _ WriteStream on: OrderedCollection new.
	[
	temp3 nextPutAll: temp2 next.
	temp2 atEnd ] whileFalse.
	temp3 _ temp3 contents sort: [ :argm8_5 :argm8_6 |
		argm8_5 asNumber <= argm8_6 asNumber ].
	temp3 _ ReadStream on: temp3.
	temp4 _ WriteStream on: ''.
	temp4 nextPut: Character cr.
	[
	temp4 nextPutAll: temp3 next.
	temp4 nextPut: Character cr.
	temp3 atEnd ] whileFalse.
	^ temp4 contents.! !

!Expert methodsFor: 'accessing'!
affichePrédicats
	| temp1 temp2 temp3 |
	temp1 _ ExpertRegle methodDictionary.
	temp2 _ ExpertRegle methodDictionary keys.
	temp3 _ temp2 collect: [ :argm2_4 |
		((temp1 at: argm2_4) name substrings: '>>') last , '->' , (temp1 at: argm2_4) comment asString , Character cr asString ].
	^ temp3.! !

!Expert methodsFor: 'accessing'!
afficheRegle: arg1
	| temp2 |
	temp2 _ arg1 asSymbol.
	temp2 _ regles
		at: temp2
		ifAbsent: [ ^ arg1 ].
	^ temp2 afficheRegle.! !

!Expert methodsFor: 'accessing'!
afficheRegles
	| temp1 temp2 |
	ordreRegles isEmpty ifTrue: [ ^ 'Pas de règles' ].
	temp1 _ WriteStream on: ''.
	temp2 _ ReadStream on: ordreRegles.
	[
	temp1 nextPutAll: (self regles at: temp2 next) afficheRegle.
	temp1 nextPut: Character cr.
	temp2 atEnd ] whileFalse.
	^ temp1 contents.! !

!Expert methodsFor: 'accessing'!
afficheReglesConcluants2: arg1
	| temp2 temp3 temp4 temp5 temp6 temp7 temp8 |
	temp2 _ WriteStream on: ''.
	temp3 _ ReadStream on: (self reglesConcluants: arg1).
	[
	temp5 _ temp3 next.
	temp6 _ temp5 first.
	temp7 _ temp5 last.
	temp8 _ temp6 verifRegle: temp7.
	temp8 isEmpty
		ifTrue: [ temp8 _ temp7 ]
		ifFalse: [ temp8 _ temp8 first first ].
	temp2 cr.
	temp2 nextPutAll: temp6 nom.
	temp4 _ ReadStream on: temp6 ant.
	[
	temp2 cr.
	temp2 nextPutAll:
		(self faitAsString:
			(temp6
				instancie: temp8
				fait: temp4 next)).
	temp4 atEnd ] whileFalse.
	temp2 cr.
	temp3 atEnd ] whileFalse.
	^ temp2 contents.! !

!Expert methodsFor: 'accessing'!
afficheReglesConcluants: arg1
	| temp2 temp3 temp4 temp5 temp6 temp7 |
	temp2 _ WriteStream on: ''.
	lrgl _ ReadStream on: (self reglesConcluants: arg1).
	[
	temp4 _ lrgl next.
	temp5 _ temp4 first.
	temp6 _ temp4 last.
	temp7 _ temp5 verifRegle: temp6.
	temp7 = false
		ifTrue: [ temp7 _ temp6 ]
		ifFalse: [
			temp7 isEmpty
				ifTrue: [ temp7 _ temp6 ]
				ifFalse: [ temp7 _ temp7 first first ]].
	temp2 cr.
	temp2 nextPutAll: temp5 nom.
	temp3 _ ReadStream on: temp5 ant.
	[
	temp2 cr.
	temp2 nextPutAll:
		(self faitAsString:
			(temp5
				instancie: temp7
				fait: temp3 next)).
	temp3 atEnd ] whileFalse.
	temp2 cr.
	lrgl atEnd ] whileFalse.
	^ temp2 contents.! !

!Expert methodsFor: 'accessing'!
afficheReglesDisplay
	self drgeo presenter expertDisplay: 'Règles
' , self afficheRegles.! !

!Expert methodsFor: 'accessing'!
affirme: arg1 fait: arg2
	| temp3 temp4 temp5 |
	temp3 _ arg2.
	temp3 isString ifTrue: [ temp3 _ ExpertList new: temp3 ].
	((temp4 _ faits
		at: temp3 first asSymbol
		ifAbsent: [
			temp5 _ ExpertFait new.
			temp5
				fait: temp3;
				just: arg1;
				no: stw.
			self addFait: temp5.
			trouve _ true.
			^ true ]) select: [ :argm2_7 |
		argm2_7 fait = temp3 ]) ifEmpty: [
		nl _ nl + 1.
		temp5 _ ExpertFait new.
		temp5
			fait: temp3;
			just: arg1;
			no: stw.
		self addFait: temp5.
		(affirmations includes: temp5) ifFalse: [ affirmations add: temp5 ].
		trouve _ true.
		^ true ].
	temp4 ifNotEmpty: [
		temp4 do: [ :argm3_7 |
			argm3_7 retire: false.
			^ true ]].
	^ false.! !

!Expert methodsFor: 'accessing'!
affirme: arg1 fait: arg2 vars: arg3
	| temp4 temp5 temp6 temp8 |
	temp4 _ arg2.
	temp4 isEmpty ifTrue: [ ^ false ].
	temp4 isString ifTrue: [ temp4 _ ExpertList new: temp4 ].
	(temp5 _ (faits
		at: temp4 first asSymbol
		ifAbsent: [
			(temp4 first asString endsWith: ':') ifTrue: [
				temp8 _ temp4 allButFirst copyList.
				temp8 add: arg3.
				self regles asArray first
					perform: (temp4 first , 'vars:') asSymbol
					withArguments: temp8 asArray.
				^ true ].
			temp6 _ ExpertFait new.
			temp6
				fait: temp4;
				just: arg1;
				lv: arg3;
				no: stw.
			self addFait: temp6.
			deductions add: temp6.
			trouve _ true.
			^ true ]) select: [ :argm3_9 |
		argm3_9 fait = temp4 ]) ifEmpty: [
		temp4 first last = $: ifTrue: [
			temp8 _ temp4 allButFirst.
			temp8 add: arg3.
			self
				perform: (temp4 first , 'vars:') copy asSymbol
				withArguments: temp8 asArray.
			^ true ].
		temp6 _ ExpertFait new.
		nl _ nl + 1.
		temp6
			fait: temp4;
			just: arg1;
			lv: arg3;
			no: stw.
		self addFait: temp6.
		deductions add: temp6.
		trouve _ true.
		^ true ].
	retablit ifTrue: [
		temp5 ifNotEmpty: [
			temp5 do: [ :argm4_9 |
				argm4_9 retire: false.
				deductions add: argm4_9 ]]].
	^ false.! !

!Expert methodsFor: 'accessing'!
affirmeFaits: arg1
	| temp2 |
	temp2 _ self
		affirmeFaits: 'énoncé'
		faits: arg1.
	^ temp2 size asString , ' faits affirrmés.'.! !

!Expert methodsFor: 'accessing'!
affirmeFaits: arg1 faits: arg2
	^ (self makeFactCollectionFromString: arg2) collect: [ :argm0_3 |
		self
			affirme: arg1
			fait: argm0_3 asString ].! !

!Expert methodsFor: 'accessing'!
ajouteNoms
	| temp1 temp3 temp4 |
	self do: [ :argm0_5 |
		temp1 _ ''.
		((argm0_5 name = '' or: [ ' ' = argm0_5 name ]) or: argm0_5 name isNil)
			ifTrue: [
				temp3 _ temp3 + 1.
				temp4 _ (argm0_5 asString findTokens: #($  $( $) )) first , temp3 asString.
				argm0_5 name: temp4 ]
			ifFalse: [ temp4 _ argm0_5 name ].
		temp4 ifNil: [ temp4 _ '' ]].! !

!Expert methodsFor: 'accessing'!
ajouteNoms: arg1
	| temp2 temp4 temp5 |
	temp4 _ 0.
	temp5 _ ''.
	arg1 do: [ :argm2_6 |
		temp2 _ ''.
		((argm2_6 name = '' or: [ ' ' = argm2_6 name ]) or: argm2_6 name isNil)
			ifTrue: [
				temp4 _ temp4 + 1.
				temp5 _ (argm2_6 asString findTokens: ' )(') first , temp4 asString.
				argm2_6 name: temp5 ]
			ifFalse: [ temp5 _ argm2_6 name ].
		temp5 ifNil: [ temp5 _ '' ]].
	^ arg1.! !

!Expert methodsFor: 'accessing'!
causeFaitNo: arg1
	^ self
		causeFaitNo: arg1
		decal: ''
		detail: nil.! !

!Expert methodsFor: 'accessing'!
causeFaitNo: arg1 decal: arg2
	| temp3 temp4 temp5 temp6 temp7 temp8 |
	arg1 > affirmations size ifTrue: [ ^ arg1 asString , 'Fait absent' ].
	temp3 _ affirmations select: [ :argm1_10 |
		argm1_10 notNil ].
	temp3 _ temp3 at: arg1.
	temp5 _ temp3 just.
	temp6 _ WriteStream on: ''.
	temp4 _ regles
		at: temp5 asSymbol
		ifAbsent: [
			temp6
				nextPut: Character cr;
				nextPutAll: arg2;
				nextPutAll: arg1 asString;
				nextPut: Character space;
				nextPutAll: (self faitAsString: temp3 fait);
				nextPutAll: ' par ';
				nextPutAll: temp5.
			^ temp6 contents ].
	temp6
		nextPut: Character cr;
		nextPutAll: arg2;
		nextPutAll: arg1 asString;
		nextPut: Character space;
		nextPutAll: (self faitAsString: temp3 fait);
		nextPutAll: '  par la regle ';
		nextPutAll: temp4 nom;
		nextPut: Character cr.
	temp4 com ifNotNil: [
		temp6
			nextPutAll: temp4 com;
			nextPut: Character cr ].
	temp6
		nextPutAll: ' car:';
		nextPut: Character cr.
	temp4 ant do: [ :argm9_10 |
		temp8 _ self
			instancie: argm9_10
			vars: temp3 lv.
		temp6
			nextPut: Character cr;
			nextPutAll: arg2;
			nextPutAll: (self nF: temp8) asString;
			nextPut: Character space;
			nextPutAll: temp8 printString ].
	^ temp6 contents.! !

!Expert methodsFor: 'accessing'!
causeFaitNo: arg1 decal: arg2 detail: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp13 temp14 temp15 temp16 temp17 |
	self initConstructions.
	temp8 _ self drgeo.
	temp7 _ arg3.
	arg3 isNil ifTrue: [ temp7 _ true ].
	temp4 _ affirmations select: [ :argm4_18 |
		argm4_18 notNil ].
	arg1 > temp4 size ifTrue: [ ^ arg1 asString , ' Fait absent' ].
	temp4 _ temp4 at: arg1.
	temp6 _ temp4 just.
	temp9 _ temp4 lv.
	temp10 _ WriteStream on: ''.
	temp5 _ regles
		at: temp6 asSymbol
		ifAbsent: [
			drgeo == nil.
			temp10
				nextPut: Character cr;
				nextPutAll: arg2;
				nextPutAll: arg1 asString;
				nextPut: Character space;
				nextPutAll: (self faitAsString: temp4 fait).
			(#('DrGeo' 'énoncé' ) includes: temp4 just)
				ifTrue: [ temp10 nextPutAll: ' par ' ]
				ifFalse: [ temp10 nextPutAll: ' par la règle: ' ].
			temp10
				nextPutAll: temp6;
				nextPut: Character cr.
			(#('DrGeo' 'énoncé' ) includes: temp4 just) ifFalse: [ temp10 nextPutAll: (self regles at: temp4 just asSymbol) com ].
			^ temp10 contents ].
	drgeo == nil.
	temp10
		nextPut: Character cr;
		nextPutAll: arg2;
		nextPutAll: arg1 asString;
		nextPut: Character space;
		nextPutAll: (self faitAsString: temp4 fait);
		nextPutAll: '  par ';
		nextPutAll: temp5 nom;
		nextPut: Character cr.
	temp5 com ifNotNil: [
		temp10
			nextPutAll: ' * ';
			nextPutAll: temp5 com;
			nextPut: Character cr ].
	temp7 ifTrue: [
		temp10
			nextPutAll: ' car:';
			nextPut: Character cr.
		temp5 ant do: [ :argm15_18 |
			temp11 _ self
				instancie: argm15_18
				vars: temp4 lv.
			temp14 _ ''.
			temp16 _ '->'.
			temp17 _ temp11 first.
			(temp17 printString includes: $:)
				ifTrue: [
					self com
						ifTrue: [
							temp16 _ ''.
							temp14 _ (ExpertRegle methodDictionary at: (temp17 , 'vars:') asSymbol) sourceCode lines at: 2.
							temp14 ifNil: [ temp14 _ '' ].
							temp14 _ Character cr asString , '* ' , temp14 allButFirst allButLast ]
						ifFalse: [
							temp16 _ ''.
							temp14 ifNil: [ temp14 _ '' ]]]
				ifFalse: [
					temp13 _ self nF: temp11.
					temp13 isNumber ifTrue: [ temp14 _ temp15 _ (affirmations at: temp13) just ].
					((temp14 ~= '*' and: [ self com ]) and: [ temp15 notNil ]) ifTrue: [
						temp14 _ self regles
							at: temp15 asSymbol
							ifAbsent: [ temp14 _ temp15 ].
						temp14 = temp15 ifFalse: [
							com
								ifTrue: [ temp14 _ temp15 , Character cr asString , '*' , temp14 com ]
								ifFalse: [ temp14 _ temp15 ]].
						temp15 ifNil: [ temp14 _ temp15 ]]].
			(temp11 first asString endsWith: ':') ifTrue: [ temp13 _ '-- ' ].
			temp11 first asString = '~' ifTrue: [
				temp14 _ ''.
				temp16 _ '' ].
			temp10
				nextPut: Character cr;
				nextPutAll: arg2;
				nextPutAll: temp13 asString;
				nextPut: Character space;
				nextPutAll: temp11 asString , temp16 , temp14 ]].
	^ temp10 contents.! !

!Expert methodsFor: 'accessing'!
causesFaitNo: arg1
	^ self
		causesFaitNo: arg1
		dec: ''
		detail: true.! !

!Expert methodsFor: 'accessing'!
causesFaitNo: arg1 dec: arg2
	| temp3 temp4 temp5 |
	temp5 _ WriteStream on: ''.
	temp5
		nextPutAll: arg2;
		nextPutAll: '  '.
	temp5 _ temp5 contents.
	temp3 _ WriteStream on: ''.
	temp3 nextPutAll:
		(self
			causeFaitNo: arg1
			decal: arg2).
	temp3 nextPut: Character cr.
	temp4 _ affirmations at: arg1.
	(#('enonce' 'DrGeo' ) includes: temp4 just) ifTrue: [ ^ temp3 contents ].
	temp4 nosAnt do: [ :argm8_6 |
		temp3 nextPutAll:
			(self
				causesFaitNo: argm8_6
				dec: temp5).
		temp3 nextPut: Character space ].
	^ temp3 contents.! !

!Expert methodsFor: 'accessing'!
causesFaitNo: arg1 dec: arg2 detail: arg3
	| temp4 temp5 temp6 |
	temp6 _ WriteStream on: '  '.
	temp6
		nextPutAll: arg2;
		nextPutAll: '  '.
	temp6 _ temp6 contents.
	temp4 _ WriteStream on: ''.
	temp4 nextPutAll:
		(self
			causeFaitNo: arg1
			decal: arg2
			detail: arg3).
	arg3 ifTrue: [ temp4 nextPut: Character cr ].
	temp5 _ affirmations at: arg1.
	(#('enonce' 'DrGeo' ) includes: temp5 just) ifTrue: [ ^ temp4 contents ].
	temp5 nosAnt do: [ :argm8_7 |
		temp4 nextPutAll:
			(self
				causesFaitNo: argm8_7
				dec: temp6
				detail: arg3).
		temp4 nextPut: Character space ].
	^ temp4 contents.! !

!Expert methodsFor: 'accessing'!
chargeRegles: arg1
	| temp2 |
	temp2 _ arg1.
	(temp2 endsWith: ':') ifFalse: [ temp2 _ temp2 , ':' ].
	temp2 _ temp2 asSymbol.
	(ExpertRegle class methodDict keys includes: temp2) ifFalse: [ ^ 'Pas de règle : ' , temp2 ].
	(self stw includes: temp2) ifTrue: [ ^ 'Règle déjà installée: ' , temp2 ].
	ExpertRegle
		perform: temp2
		withArguments:
			{self}.
	self stw add: temp2.
	^ 'Règles : ' , self stw asArray printString , ' Installées.'.! !

!Expert methodsFor: 'accessing'!
com
	^ com.! !

!Expert methodsFor: 'accessing'!
com: arg1
	com _ arg1.! !

!Expert methodsFor: 'accessing'!
constructions
	constructions ifNil: [ constructions _ ExpertList new ].
	^ constructions.! !

!Expert methodsFor: 'accessing'!
constructions: arg1
	constructions ifNil: [ constructions _ ExpertList new ].
	constructions add: arg1.! !

!Expert methodsFor: 'accessing'!
creeRegle: arg1
	| temp2 |
	arg1 = '' ifTrue: [ ^ self ].
	(regles keys includes: arg1 asSymbol) ifTrue: [ ^ self regles at: arg1 asSymbol ].
	self addRegle: (temp2 _ ExpertRegle new nom: arg1).
	ordreRegles add: arg1 asSymbol.
	temp2 expert: self.
	^ temp2.! !

!Expert methodsFor: 'accessing'!
deductions
	^ deductions.! !

!Expert methodsFor: 'accessing'!
deduis
	| temp1 temp2 temp3 temp4 temp5 temp6 |
	deductions _ OrderedCollection new.
	temp3 _ affirmations size.
	[
	self regles keysDo: [ :argm9_8 |
		(self regles at: argm9_8) faitsMeConcernants ].
	self trouve: false.
	temp1 _ self faits keys reject: [ :argm11_8 |
		argm11_8 endsWith: '-regles' ].
	temp2 _ temp1 collect: [ :argm12_8 |
		self faits
			at: (argm12_8 , '-regles') asSymbol
			ifAbsent: [ ]].
	temp2 _ (self concat: temp2) reject: [ :argm13_8 |
		argm13_8 = 'temp' or: [ argm13_8 isNil ]].
	temp2 isEmpty ifTrue: [ ^ 'pas de règles applicables' ].
	temp2 do: [ :argm15_8 |
		(temp6 _ self regles
			at: argm15_8 asSymbol
			ifAbsent: [ ]) ifNotNil: [ temp6 verifRegle ]].
	trouve ] whileTrue.
	deductions _ deductions asSet asOrderedCollection.
	affirmations size = temp3 ifTrue: [ ^ 'rien de nouveau ' ].
	temp4 _ WriteStream on: ''.
	temp5 _ ReadStream on: deductions.
	[
	temp5 atEnd ifFalse: [
		temp4 nextPutAll: temp5 next fait asString.
		temp4 nextPut: Character cr ].
	temp5 atEnd ] whileFalse.
	^ temp4 contents.! !

!Expert methodsFor: 'accessing'!
drgeo
	^ drgeo.! !

!Expert methodsFor: 'accessing'!
drgeo: arg1
	drgeo _ arg1.! !

!Expert methodsFor: 'accessing'!
enonceFait: arg1
	self
		affirme: 'énoncé'
		fait: arg1.! !

!Expert methodsFor: 'accessing'!
enonceFaits: arg1
	(self makeFactCollectionFromString: arg1) do: [ :argm0_2 |
		self enonceFait: argm0_2 ].! !

!Expert methodsFor: 'accessing'!
executeCode
	Compiler evaluate: self afficheCode.! !

!Expert methodsFor: 'accessing'!
expertBackward
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10 |
	temp1 _ drgeo app presenter.
	temp4 _ temp1 tool.
	temp1 expertDisplayStatus: 'Taper l''hypothèse  à vérifier.'.
	temp3 _ DrGWizardPage new textEntry: 'Taper un but'.
	temp3 ifNil: [
		temp1 view statusMessage: temp4 description.
		^ temp1 ].
	temp3 ifEmpty: [
		temp1 view statusMessage: temp4 description.
		^ temp1 ].
	temp3 _ self list: temp3.
	temp2 _ self reglesConcluant: temp3.
	temp6 _ self nomsRegles: temp2.
	temp5 _ self nomsComRegles: temp2.
	temp5 _ temp5 asOrderedCollection.
	temp5 addFirst: 'Annuler'.
	temp7 _ DrGWizardPage new
		chooseDropList: '                            choisir une règle                             '
		list: temp5.
	temp7 = 'Annuler' ifTrue: [ ^ temp1 ].
	temp7 isNil ifTrue: [ ^ temp1 ].
	temp10 _ temp7 asNumber.
	temp8 _ WriteStream on: ''.
	temp9 _ ReadStream on: (temp2 at: temp10) ant reverse.
	[
	temp8
		nextPut: Character cr;
		nextPutAll: temp9 next printString.
	temp9 atEnd ] whileFalse.
	temp1
		expertDisplay: temp7
		String: temp8 contents.! !

!Expert methodsFor: 'accessing'!
explique: arg1
	^ self causeFaitNo: arg1.! !

!Expert methodsFor: 'accessing'!
faitTelque2: arg1
	| temp2 temp3 temp4 temp5 temp6 temp7 temp8 |
	temp6 _ IdentityDictionary new.
	temp2 _ arg1.
	temp2 isList ifFalse: [ temp2 _ ExpertList new: temp2 ].
	temp3 _ temp2 first.
	temp3 = #~
		ifTrue: [ temp5 _ temp2 allButFirst ]
		ifFalse: [
			temp4 _ self faits
				at: temp3
				ifAbsent: [
					self affirmations
						at: temp3
						ifAbsent: [ ^ arg1 , 'pas trouvé' ]].
			temp5 _ temp4
				detect: [ :argm5_10 |
					(self
						unifie: temp2
						avec: argm5_10 fait
						vars: temp6) ~= false ]
				ifNone: [
					temp8 _ ExpertFait new.
					temp8 fait: temp2.
					temp8 just: 'pas trouvé dans les affirmations'.
					temp8 expert: self ]].
	^ temp5.! !

!Expert methodsFor: 'accessing'!
faitTelque: arg1
	| temp2 temp3 temp4 temp6 |
	temp2 _ false.
	temp3 _ arg1.
	arg1 isEmpty ifTrue: [ ^ false ].
	$~ = arg1 first ifTrue: [ ^ arg1 ].
	arg1 isString ifTrue: [ temp3 _ self list: arg1 ].
	(temp3 first endsWith: ':') ifTrue: [
		com ifTrue: [ ^ temp3 asString , Character cr asString , ((ExpertRegle methodDictionary at: (temp3 first asString , 'vars:') asSymbol) sourceCode lines at: 2) ].
		^ temp3 asString , Character cr asString ].
	temp6 _ self affirmations
		detect: [ :argm6_7 |
			temp4 _ argm6_7.
			argm6_7 fait = arg1 ]
		ifNone: [
			temp6 _ self affirmations
				detect: [ :argm6_7 |
					argm6_7 = (self faitTelque2: arg1) ]
				ifNone: [ ^ (affirmations indexOf: temp4) asString , ' ' , arg1 ]].
	^ temp6 afficheFait2.! !

!Expert methodsFor: 'accessing'!
faitsIssusDe: arg1
	| temp2 |
	temp2 _ ''.
	(self affirmations select: [ :argm1_4 |
		arg1 = argm1_4 just ]) do: [ :argm1_4 |
		temp2 _ temp2 , '
' , argm1_4 afficheFait ].
	^ temp2.! !

!Expert methodsFor: 'accessing'!
getRelationsAt: arg1
	| temp2 temp3 |
	temp3 _ arg1.
	temp3 isSymbol ifFalse: [ temp3 _ temp3 asSymbol ].
	(temp2 _ self relationsAt: temp3) ifNil: [ temp2 _ self initRelationsAt: temp3 ].
	^ temp2.! !

!Expert methodsFor: 'accessing'!
indTexte
	^ indtexte.! !

!Expert methodsFor: 'accessing'!
indTexte: arg1
	indtexte _ arg1.! !

!Expert methodsFor: 'accessing'!
initConstructions
	constructions ifNotNil: [
		constructions do: [ :argm0_1 |
			(argm0_1 isKindOf: DrGWrappedItem) ifTrue: [ self supprimerMathitem: argm0_1 mathItem ].
			Array = argm0_1 class ifTrue: [ argm0_1 first style color: argm0_1 last ]]].
	constructions _ ExpertList new.! !

!Expert methodsFor: 'accessing'!
initFaits
	self indTexte: nil.
	nl _ 0.
	self initConstructions.
	faits _ IdentityDictionary new.
	self supprimeMarquesRetire.
	affirmations _ OrderedCollection new.
	self initRelations.
	deductions _ OrderedCollection.
	^ 'Base vide'.! !

!Expert methodsFor: 'accessing'!
initRegles
	regles _ IdentityDictionary new.
	ordreRegles _ OrderedCollection new.
	lrgl _ OrderedCollection new.
	stw _ OrderedCollection new.
	^ 'règles supprimée'.! !

!Expert methodsFor: 'accessing'!
initRelations
	relations _ IdentityDictionary new.! !

!Expert methodsFor: 'accessing'!
initRelationsAt: arg1
	| temp2 temp3 |
	temp2 _ arg1 asSymbol.
	temp3 _ Set new.
	relations
		at: temp2
		put: Set new.! !

!Expert methodsFor: 'accessing'!
lgl
	^ lrgl.! !

!Expert methodsFor: 'accessing'!
lisFigure
	self lisFigure: self drgeo.! !

!Expert methodsFor: 'accessing'!
lisFigure: arg1
	self lisFigureDrgeo: arg1.! !

!Expert methodsFor: 'accessing'!
lisFigureDrgeo
	| temp1 temp2 temp3 temp4 temp6 temp7 temp8 temp9 temp10 temp11 |
	temp3 _ drgeo drawable submorphs select: [ :argm0_12 |
		argm0_12 isKindOf: DrGMorph ].
	temp8 _ 0.
	temp2 _ ''.
	temp1 _ (temp3 select: [ :argm3_12 |
		argm3_12 style hidden = false ]) collect: [ :argm3_12 |
		argm3_12 mathItem ].
	temp1 _ temp1 select: [ :argm4_12 |
		argm4_12 exist ].
	self ajouteNoms: temp1.
	temp1 do: [ :argm6_12 |
		temp4 _ ''.
		temp4 _ temp4 , argm6_12 className asString , ' ' , argm6_12 name.
		(argm6_12 isKindOf: DrGTextItem) ifTrue: [ temp4 _ temp4 , ' ' , argm6_12 text ].
		(argm6_12 isKindOf: DrGPolygonRegularItem) ifTrue: [
			temp10 _ temp1 select: [ :argm9_13 |
				DrGPointOncurveItem = argm9_13 class or: [ DrGPointFreeItem = argm9_13 class ]].
			temp11 _ ExpertList new:
				(temp10 collect: [ :argm10_13 |
					(temp10
						detect: [ :argm10_14 |
							argm10_13 point = argm10_14 point ]
						ifNone: [ ]) name ]) allButFirst.
			temp4 _ temp4 , ' ' , '[ ' , temp11 asString , ' ]' ].
		(argm6_12 isKindOf: DrGPolygonNptsItem) ifTrue: [ temp4 _ temp4 , ' ' , (self polySommets: argm6_12 name) ].
		(argm6_12 isKindOf: DrGAngleItem)
			ifTrue: [
				temp9 _ argm6_12 degreeAngle round: 3.
				temp9 = temp9 asInteger ifTrue: [ temp9 _ temp9 asInteger ].
				temp4 _ temp4 , ' ' , temp9 asString ]
			ifFalse: [
				(argm6_12 isKindOf: DrGValueItem) ifTrue: [
					temp9 _ argm6_12 valueItem.
					temp9 asInteger = temp9 ifTrue: [ temp9 _ temp9 asInteger ].
					temp4 _ temp4 , ' ' , temp9 asString ]].
		temp7 _ argm6_12 parents.
		(argm6_12 isKindOf: DrGPolygonNptsItem) ifTrue: [ temp7 _ nil ].
		temp7 ifNotNil: [
			temp6 _ ''.
			temp7 do: [ :argm15_13 |
				argm15_13 isNumber ifFalse: [
					(argm15_13 name = '' or: argm15_13 name isNil)
						ifTrue: [
							temp8 _ temp8 + 1.
							temp6 _ (argm15_13 asString findTokens: #($  $( $) )) first , temp8 asString.
							argm15_13 name: temp6 ]
						ifFalse: [ temp6 _ argm15_13 name ]].
				temp4 _ temp4 , ' ' , temp6.
				(argm15_13 isKindOf: DrGAngleItem)
					ifTrue: [
						temp9 _ argm6_12 degreeAngle round: 3.
						temp9 = temp9 asInteger ifTrue: [ temp9 _ temp9 asInteger ].
						temp4 _ temp4 , ' ' , temp9 asString ]
					ifFalse: [
						(argm15_13 isKindOf: DrGValueItem) ifTrue: [
							temp9 _ argm15_13 valueItem.
							temp9 asInteger = temp9 ifTrue: [ temp9 _ temp9 asInteger ].
							temp4 _ temp4 , ' ' , temp9 asString ]]]].
		self
			affirme: 'Drgeo'
			fait: temp4 ].
	^ temp1.! !

!Expert methodsFor: 'accessing'!
lisFigureDrgeo: arg1
	| temp2 temp3 temp4 temp5 temp7 temp8 temp9 temp10 temp11 temp12 |
	temp2 _ arg1 domain factory pool.
	temp9 _ 0.
	temp3 _ ''.
	self ajouteNoms: temp2.
	temp2 do: [ :argm4_13 |
		temp5 _ ''.
		temp5 _ temp5 , argm4_13 className asString , ' ' , argm4_13 name.
		(argm4_13 isKindOf: DrGTextItem) ifTrue: [ temp5 _ temp5 , ' ' , argm4_13 text ].
		(argm4_13 isKindOf: DrGPolygonRegularItem) ifTrue: [
			temp11 _ temp2 select: [ :argm7_14 |
				DrGPointOncurveItem = argm7_14 class or: [ DrGPointFreeItem = argm7_14 class ]].
			temp12 _ ExpertList new:
				(temp11 collect: [ :argm8_14 |
					(temp11
						detect: [ :argm8_15 |
							argm8_14 point = argm8_15 point ]
						ifNone: [ ]) name ]) allButFirst.
			temp5 _ temp5 , ' ' , '[ ' , temp12 asString , ' ]' ].
		(argm4_13 isKindOf: DrGPolygonNptsItem) ifTrue: [ temp5 _ temp5 , ' ' , (self polySommets: argm4_13 name) ].
		(argm4_13 isKindOf: DrGAngleItem)
			ifTrue: [
				temp10 _ argm4_13 degreeAngle roundTo: 3.
				temp10 = temp10 asInteger ifTrue: [ temp10 _ temp10 asInteger ].
				temp5 _ temp5 , ' ' , temp10 asString ]
			ifFalse: [
				(argm4_13 isKindOf: DrGValueItem) ifTrue: [
					temp10 _ argm4_13 valueItem.
					temp10 asInteger = temp10 ifTrue: [ temp10 _ temp10 asInteger ].
					temp5 _ temp5 , ' ' , temp10 asString ]].
		temp8 _ argm4_13 parents.
		(argm4_13 isKindOf: DrGPolygonNptsItem) ifTrue: [ temp8 _ nil ].
		temp8 ifNotNil: [
			temp7 _ ''.
			temp8 do: [ :argm13_14 |
				argm13_14 isNumber ifFalse: [
					(argm13_14 name = '' or: argm13_14 name isNil)
						ifTrue: [
							temp9 _ temp9 + 1.
							temp7 _ (argm13_14 asString findTokens: #($  $( $) )) first , temp9 asString.
							argm13_14 name: temp7 ]
						ifFalse: [ temp7 _ argm13_14 name ]].
				temp5 _ temp5 , ' ' , temp7.
				(argm13_14 isKindOf: DrGAngleItem)
					ifTrue: [
						temp10 _ argm4_13 degreeAngle round: 3.
						temp10 = temp10 asInteger ifTrue: [ temp10 _ temp10 asInteger ].
						temp5 _ temp5 , ' ' , temp10 asString ]
					ifFalse: [
						(argm13_14 isKindOf: DrGValueItem) ifTrue: [
							temp10 _ argm13_14 valueItem.
							temp10 asInteger = temp10 ifTrue: [ temp10 _ temp10 asInteger ].
							temp5 _ temp5 , ' ' , temp10 asString ]]]].
		self
			affirme: 'DrGeo'
			fait: temp5 ].
	^ temp2.! !

!Expert methodsFor: 'accessing'!
lisRegle: arg1 com: arg2
	| temp3 |
	(regles keys includes: arg1 asSymbol)
		ifTrue: [ temp3 _ regles at: arg1 asSymbol ]
		ifFalse: [ ^ self ].
	temp3 com: arg2.! !

!Expert methodsFor: 'accessing'!
lisRegle: arg1 si: arg2 alors: arg3
	| temp4 |
	temp4 _ self creeRegle: arg1.
	temp4 antecedents: arg2.
	temp4 concl: arg3.
	^ 'Règle ''' , arg1 , ''' définie'.! !

!Expert methodsFor: 'accessing'!
lisRegle: arg1 si: arg2 alors: arg3 com: arg4
	| temp5 |
	temp5 _ self creeRegle: arg1.
	temp5 antecedents: arg2.
	temp5 concl: arg3.
	temp5 com: arg4.
	^ 'Règle ''' , arg1 , ''' définie'.! !

!Expert methodsFor: 'accessing'!
lregles
	^ lregles.! !

!Expert methodsFor: 'accessing'!
lregles: arg1
	lregles _ arg1.! !

!Expert methodsFor: 'accessing'!
marquerLesObjets: arg1
	| temp2 temp3 temp4 |
	temp2 _ self affirmations at: arg1.
	temp3 _ self drgeo domain factory pool.
	self initConstructions.
	temp4 _ OrderedCollection new.
	temp2 fait do: [ :argm4_6 |
		argm4_6 isList
			ifTrue: [
				argm4_6 collect: [ :argm4_7 |
					temp4 add: argm4_7 ]]
			ifFalse: [ temp4 add: argm4_6 ]].
	temp4 _ temp4 asSet.
	temp4 _ temp4 collect: [ :argm6_6 |
		temp3
			detect: [ :argm6_7 |
				argm6_6 = argm6_7 ]
			ifNone: [ ]].
	temp4 _ temp4 asOrderedCollection select: [ :argm7_6 |
		argm7_6 notNil ].
	temp4 do: [ :argm8_6 |
		self constructions add:
			(Array
				with: argm8_6
				with: argm8_6 style color).
		argm8_6 style color: Color cyan ].! !

!Expert methodsFor: 'accessing'!
mesRegles
	^ self stw asArray.! !

!Expert methodsFor: 'accessing'!
modelesFaits
	| temp1 temp2 temp4 temp5 temp6 |
	temp1 _ self faits keys reject: [ :argm0_7 |
		argm0_7 asString endsWith: '-regles' ].
	temp2 _ OrderedCollection new.
	temp1 collect: [ :argm2_7 |
		(self faits at: argm2_7) do: [ :argm2_8 |
			temp2 add: argm2_8 ]].
	temp2 _ (temp2 collect: [ :argm3_7 |
		Array
			with: argm3_7 fait first
			with: argm3_7 fait size ]) asSet.
	temp2 _ temp2 collect: [ :argm4_7 |
		temp4 _ ' '.
		temp5 _ 0.
		temp6 _ argm4_7 last asInteger.
		temp6 - 1 timesRepeat: [
			temp5 _ temp5 + 1.
			temp4 _ temp4 , ' ?x' , temp5 asString ].
		(argm4_7 first , temp4) asString ].
	temp4 _ ''.
	temp2 _ temp2 asSortedCollection: [ :argm6_7 :argm6_8 |
		argm6_7 < argm6_8 ].
	temp2 do: [ :argm7_7 |
		temp4 _ temp4 , argm7_7 , '
' ].
	^ '
' , temp4.! !

!Expert methodsFor: 'accessing'!
modèlesQuestions
	| temp1 temp2 temp4 temp5 temp6 |
	temp1 _ self faits keys reject: [ :argm0_7 |
		argm0_7 asString endsWith: '-regles' ].
	temp2 _ OrderedCollection new.
	temp1 collect: [ :argm2_7 |
		(self faits at: argm2_7) do: [ :argm2_8 |
			temp2 add: argm2_8 ]].
	temp2 _ (temp2 collect: [ :argm3_7 |
		Array
			with: argm3_7 fait first
			with: argm3_7 fait size ]) asSet.
	temp2 _ temp2 collect: [ :argm4_7 |
		temp4 _ ' '.
		temp5 _ 0.
		temp6 _ argm4_7 last asInteger.
		temp6 - 1 timesRepeat: [
			temp5 _ temp5 + 1.
			temp4 _ temp4 , ' ?x' , temp5 asString ].
		(argm4_7 first , temp4) asString ].
	temp4 _ ''.
	temp2 _ temp2 asSortedCollection: [ :argm6_7 :argm6_8 |
		argm6_7 < argm6_8 ].
	temp2 do: [ :argm7_7 |
		temp4 _ temp4 , argm7_7 , '
' ].
	^ '
Modèles de questions.
' , temp4.! !

!Expert methodsFor: 'accessing'!
ordreRegles
	^ ordreRegles.! !

!Expert methodsFor: 'accessing'!
ordreRegles: arg1
	ordreRegles _ arg1.! !

!Expert methodsFor: 'accessing'!
ouvreTranscript
	^ self.! !

!Expert methodsFor: 'accessing'!
polySommets: arg1
	| temp2 temp3 temp4 temp5 temp6 |
	temp2 _ self drgeo app domain factory pool.
	temp3 _ temp2 detect: [ :argm1_7 |
		argm1_7 name = arg1 ].
	temp5 _ temp3 parents collect: [ :argm2_7 |
		argm2_7 name ].
	temp6 _ ' [ ' , (self colAsString: temp5) , ' ]'.
	^ temp6.! !

!Expert methodsFor: 'accessing'!
prouve: arg1
	| temp2 temp3 temp4 temp6 |
	temp2 _ self makeList: arg1.
	temp6 _ false.
	temp4 _ 0.
	temp3 _ self affirmations select: [ :argm3_7 |
		temp6 ifFalse: [ temp4 _ temp4 + 1 ].
		temp2 = argm3_7 fait ifTrue: [ temp6 _ true ].
		temp2 = argm3_7 fait ].
	^ temp3 collect: [ :argm4_7 |
		temp4 asString , ' ' , argm4_7 fait asString , 'Par la regles: ' , argm4_7 just ].! !

!Expert methodsFor: 'accessing'!
reglesChargées
	^ (self regles keys collect: [ :argm0_1 |
		((self regles at: argm0_1) name substringsSeparatedBy: $-) first ]) asSet sorted.! !

!Expert methodsFor: 'accessing'!
reglesConcluant: arg1
	| temp2 |
	temp2 _ ExpertRegle new.
	temp2 expert: self.
	^ temp2 reglesConcluant: arg1.! !

!Expert methodsFor: 'accessing'!
reglesConcluants: arg1
	| temp2 temp3 temp4 |
	temp3 _ IdentityDictionary new.
	temp2 _ arg1.
	temp4 _ self regles values select: [ :argm2_5 |
		self
			unifie: argm2_5 concl
			avec: temp2
			vars: temp3 ].
	^ temp4.! !

!Expert methodsFor: 'accessing'!
reglesPrédéfinies
	ExpertRegle class methodDict keys.! !

!Expert methodsFor: 'accessing'!
retablit
	^ retablit.! !

!Expert methodsFor: 'accessing'!
retablit: arg1
	retablit _ arg1.
	^ retablit.! !

!Expert methodsFor: 'accessing'!
retireFait: arg1
	| temp2 temp3 |
	temp2 _ arg1.
	temp2 isString ifTrue: [ temp2 _ ExpertList new: temp2 ].
	temp3 _ self affirmations
		detect: [ :argm2_4 |
			argm2_4 fait = temp2 ]
		ifNone: [ ^ false ].
	self
		affirme: 'retrait'
		fait: temp2 printString , 'retire'
		vars: IdentityDictionary new.
	temp3 retire: true.
	^ true.! !

!Expert methodsFor: 'accessing'!
règlesChargées
	^ stw.! !

!Expert methodsFor: 'accessing'!
règlesPrédéfinies
	^ ExpertRegle class methodDict keys sort.! !

!Expert methodsFor: 'accessing'!
stw
	^ stw.! !

!Expert methodsFor: 'accessing'!
stw: arg1
	stw _ arg1.! !

!Expert methodsFor: 'accessing'!
supprimeMarqueRetire: arg1
	| temp2 |
	temp2 _ arg1.
	temp2 isString ifTrue: [ temp2 _ ExpertList new: temp2 ].
	(self affirmations detect: [ :argm2_3 |
		argm2_3 fait = temp2 ]) retire: nil.! !

!Expert methodsFor: 'accessing'!
supprimeMarquesRetire
	self affirmations do: [ :argm0_1 |
		argm0_1 retire: nil ].! !

!Expert methodsFor: 'accessing'!
supprimeRegle: arg1
	| temp2 |
	temp2 _ regles
		at: arg1 asSymbol
		ifAbsent: [ ^ self ].
	regles removeKey: arg1 asSymbol.
	ordreRegles remove: arg1 asSymbol.
	^ temp2.! !

!Expert methodsFor: 'accessing'!
supprimerMathitem: arg1
	self drgeo domain deleteMathItem: arg1.! !

!Expert methodsFor: 'accessing'!
titre
	titre ifNil: [ titre = 'Expert journal' ].
	^ titre.! !

!Expert methodsFor: 'accessing'!
titre: arg1
	titre _ arg1.! !

!Expert methodsFor: 'accessing'!
toutVerifier
	| temp1 |
	temp1 _ Set new.
	(affirmations
		select: [ :argm1_2 |
			argm1_2 regles notNil ]
		thenCollect: [ :argm1_2 |
			argm1_2 regles ]) do: [ :argm1_2 |
		argm1_2 do: [ :argm1_3 |
			temp1 add: argm1_3 asSymbol ]].
	^ aVerifier _ temp1.! !

!Expert methodsFor: 'accessing'!
trace: arg1
	^ self.! !

!Expert methodsFor: 'accessing'!
verifieCondition: arg1
	| temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp13 |
	temp2 _ false.
	temp10 _ IdentityDictionary new.
	temp3 _ self creeRegle: 'temp'.
	temp3 antecedents: arg1 asString.
	temp11 _ temp3 ant.
	temp3 expert: self.
	temp4 _ temp3 verifAntecedants.
	temp4 = false ifTrue: [ ^ 'faux' ].
	(1 = temp4 size and: [ temp4 first = temp2 ]) ifTrue: [ ^ 'faux' ].
	temp4 _ temp4 reject: [ :argm9_14 |
		argm9_14 = temp2 ].
	temp4 _ temp4 collect: [ :argm10_14 |
		temp11 collect: [ :argm10_15 |
			temp3 concl: argm10_15.
			temp13 _ temp3 instancie: argm10_14.
			temp13 = argm10_14 ifTrue: [ temp13 _ false ].
			temp13 ]].
	temp4 _ temp4 reject: [ :argm11_14 |
		argm11_14 = temp2 ].
	temp4 ifEmpty: [ ^ '
faux' ].
	temp5 _ ReadStream on: temp4.
	temp6 _ Character cr.
	temp7 _ WriteStream on: ''.
	temp7 nextPut: temp6.
	[
	temp8 _ temp5 next.
	temp8 ifNil: [ temp8 _ temp11 ].
	temp9 _ ReadStream on: temp8.
	[
	temp11 _ self faitTelque: temp9 next asString.
	(temp11 ~= false and: [ temp11 ~= nil ]) ifTrue: [
		temp7 nextPutAll: temp11.
		temp8 size > 1 ifTrue: [ temp7 nextPut: temp6 ]].
	temp9 atEnd ] whileFalse.
	temp7 nextPut: temp6.
	temp5 atEnd ] whileFalse.
	temp7 nextPut: temp6.
	^ temp7 contents.! !

!Expert methodsFor: 'accessing'!
verifieFait: arg1 vars: arg2
	| temp3 temp4 temp5 temp6 |
	temp3 _ arg1.
	arg1 isString ifTrue: [ temp3 _ ExpertList new: arg1 ].
	arg1 class = ExpertFait ifTrue: [ temp3 _ ExpertList new: arg1 fait ].
	temp4 _ self faits
		at: temp3 first asSymbol
		ifAbsent: [ ^ OrderedCollection new ].
	temp4 _ temp4 reject: [ :argm4_8 |
		argm4_8 retire ].
	temp5 _ temp4 collect: [ :argm5_8 |
		temp6 _ arg2 copy.
		Array
			with:
				((self
					unifie: temp3
					avec: argm5_8 fait
					vars: temp6) ifTrue: [ temp6 ])
			with: argm5_8 ].
	temp5 _ temp5 reject: [ :argm6_8 |
		argm6_8 first == nil ].
	^ temp5.! !

!Expert methodsFor: 'accessing'!
verifieFaits
	| temp1 temp2 temp3 |
	temp1 _ self makeFactCollectionFromString: self modèlesQuestions.
	temp2 _ temp1 collect: [ :argm1_5 |
		Array
			with: argm1_5
			with: (self verifieFait: argm1_5) ].
	temp3 _ ''.
	temp2 do: [ :argm3_5 |
		temp3 _ temp3 , '
	' , (self colAsString: argm3_5 first) , '
	' , (self colAsStringWithCr: argm3_5 last) ].
	^ temp3.! !

!Expert methodsFor: 'accessing'!
vérifieCondition: arg1
	| temp2 temp3 temp4 temp5 temp6 temp7 |
	temp2 _ false.
	temp5 _ IdentityDictionary new.
	temp3 _ self creeRegle: 'temp'.
	temp3 antecedents: arg1.
	temp6 _ temp3 ant.
	temp4 _ temp3 verifAntecedants.
	temp4 ifEmpty: [ ^ false ].
	temp4 _ Array
		with:
			(temp4 collect: [ :argm7_9 |
				self
					instancie: argm7_9
					fait: temp6 first ])
		with: temp4.
	temp7 _ '
	'.
	temp4 do: [ :argm9_9 |
		temp7 _ temp7 , argm9_9 first asString , Character cr asString , argm9_9 last asString , Character cr asString ].
	^ temp7.! !

!Expert methodsFor: 'initialize'!
apppfficheCode
	(self affirmations collect: [ :argm0_1 |
		argm0_1 fait ]) select: [ :argm0_1 |
		argm0_1 first beginsWith: 'f' ].! !

!Expert methodsFor: 'initialize'!
initialize
	affirmations _ ''.
	self initRegles.
	self initFaits.
	self initRelations.
	ExpertRegle interface: self.
	retablit _ true.
	com _ true.
	nl _ 0.
	stw _ OrderedCollection new.
	stw add: #interface.
	vars _ IdentityDictionary new.! !

!Expert methodsFor: 'relations'!
lrgl
	^ lrgl.! !

!Expert methodsFor: 'relations'!
lrgl: arg1
	lrgl _ arg1.! !

!Expert methodsFor: 'relations'!
relations
	^ relations.! !

!Expert methodsFor: 'relations'!
relationsAt: arg1
	| temp2 temp3 |
	temp3 _ arg1 asSymbol.
	temp2 _ relations
		at: temp3
		ifAbsent: [ ^ Set new ].
	^ relations at: temp3.! !

!Expert methodsFor: 'tools'!
aVerifier
	^ aVerifier.! !

!Expert methodsFor: 'tools'!
aVerifier: arg1
	aVerifier _ arg1.! !

!Expert methodsFor: 'tools'!
addFait: arg1
	| temp2 temp3 |
	(arg1 isKindOf: String) ifTrue: [ (temp2 _ ExpertFait new) fait: (ExpertList new: arg1) ].
	(arg1 isKindOf: Collection) ifTrue: [ (temp2 _ ExpertFait new) fait: arg1 ].
	(arg1 isKindOf: ExpertFait) ifTrue: [ temp2 _ arg1 ].
	temp3 _ faits
		at: temp2 key
		ifAbsent: [ temp3 _ OrderedCollection new ].
	temp2 expert: self.
	temp3 add: temp2.
	faits
		at: temp2 key
		put: temp3.
	affirmations add: temp2.
	^ arg1.! !

!Expert methodsFor: 'tools'!
addRegle: arg1
	arg1 faitsMeConcernants0.
	self regles
		at: arg1 name asSymbol
		put: arg1.
	arg1 expert: self.! !

!Expert methodsFor: 'tools'!
afficheWs: arg1
	| temp2 |
	temp2 _ (World submorphs select: [ :argm0_3 |
		argm0_3 isKindOf: SystemWindow ]) select: [ :argm0_3 |
		'affirmations Expert' = argm0_3 label ].
	temp2 isEmpty
		ifTrue: [
			temp2 _ Workspace new open.
			temp2 contents: arg1.
			temp2 label: 'affirmations Expert' ]
		ifFalse: [
			temp2 _ World submorphs.
			temp2 _ temp2 select: [ :argm2_3 |
				argm2_3 isKindOf: SystemWindow ].
			temp2 _ temp2 select: [ :argm3_3 |
				'affirmations Expert' = argm3_3 label ].
			temp2 _ temp2 first.
			temp2 model contents: arg1 ].! !

!Expert methodsFor: 'tools'!
affirmations
	^ affirmations.! !

!Expert methodsFor: 'tools'!
affirmations: arg1
	affirmations _ arg1.! !

!Expert methodsFor: 'tools'!
affirme: arg1
	| temp2 temp3 |
	temp2 _ arg1.
	(temp2 isKindOf: String) ifTrue: [ temp2 _ self makeWordCollection: temp2 ].
	((faits
		at: temp2 first asSymbol
		ifAbsent: [
			temp3 _ ExpertFait new.
			temp3 fait: temp2.
			self addFait: temp3.
			trouve _ true.
			^ true ]) select: [ :argm2_5 |
		argm2_5 fait = temp2 ]) ifEmpty: [
		temp3 _ ExpertFait new.
		temp3 fait: temp2.
		self addFait: temp3.
		affirmations add: temp3.
		trouve _ true.
		^ true ].
	^ false.! !

!Expert methodsFor: 'tools'!
comment
	^ self sourceCode.! !

!Expert methodsFor: 'tools'!
comment: arg1
	^ (self makeFactCollectionFromString: arg1 sourceCode) at: 2.! !

!Expert methodsFor: 'tools'!
couleurPoint: arg1
	| temp2 |
	drgeo ifNotNil: [
		temp2 _ self drgeo app costumes select: [ :argm0_3 |
			argm0_3 class = DrGPointCostume ].
		temp2 do: [ :argm1_3 |
			argm1_3 style color: arg1 ]].! !

!Expert methodsFor: 'tools'!
deduire
	^ Cursor wait showWhile: [ self deduis ].! !

!Expert methodsFor: 'tools'!
faitAsString: arg1
	arg1 class == ExpertFait ifTrue: [ ^ super faitAsString: arg1 fait ].
	^ super faitAsString: arg1.! !

!Expert methodsFor: 'tools'!
faits
	^ faits.! !

!Expert methodsFor: 'tools'!
faitsAsArray
	^ (faits keys collect: [ :argm0_1 |
		(faits at: argm0_1 asSymbol) collect: [ :argm0_2 |
			argm0_2 ]]) asArray.! !

!Expert methodsFor: 'tools'!
faitsAt: arg1
	^ faits
		at: arg1 asSymbol
		ifAbsent: [ ^ nil ].! !

!Expert methodsFor: 'tools'!
initVars
	vars _ IdentityDictionary new.
	^ vars.! !

!Expert methodsFor: 'tools'!
instancie: arg1 fait: arg2
	| temp3 temp4 |
	temp4 _ ExpertList new: arg2.
	(arg1 isKindOf: IdentityDictionary) ifFalse: [ ^ arg2 ].
	temp3 _ temp4 do: [ :argm2_5 |
		self
			valeur: argm2_5
			vars: arg1 ].
	^ temp3.! !

!Expert methodsFor: 'tools'!
instancieNum: arg1 fait: arg2
	| temp3 temp4 |
	temp4 _ 0.
	arg1 ifNil: [ ^ arg2 ].
	(arg1 isKindOf: IdentityDictionary) ifFalse: [ ^ arg2 ].
	temp3 _ arg2 do: [ :argm3_6 |
		(self floatString: argm3_6)
			ifTrue: [
				temp4 _ temp4 + 1.
				'?&' , temp4 asString ]
			ifFalse: [
				self
					valeur: argm3_6
					vars: arg1 ]].
	^ temp3.! !

!Expert methodsFor: 'tools'!
listeSelCom: arg1
	| temp2 temp3 |
	temp2 _ ExpertRegle methodDict asOrderedCollection.
	temp2 _ temp2 select: [ :argm1_5 |
		argm1_5 category = arg1 ].
	temp2 _ temp2 collect: [ :argm2_5 |
		Array
			with: argm2_5 selector asString
			with: ((argm2_5 sourceCode lines at: 2) withoutEnclosing: $") ].
	temp3 _ ''.
	temp2 do: [ :argm4_5 |
		temp3 _ temp3 , argm4_5 first , ' ' , (argm4_5 last , Character cr asString) ].! !

!Expert methodsFor: 'tools'!
listeSelCom: arg1 class: arg2
	| temp3 temp4 |
	temp3 _ arg2 methodDict asOrderedCollection.
	temp3 _ temp3 select: [ :argm1_6 |
		argm1_6 category = arg1 ].
	temp3 _ temp3 collect: [ :argm2_6 |
		Array
			with: argm2_6 selector asString
			with: ((argm2_6 sourceCode lines at: 2) withoutEnclosing: $") ].
	temp4 _ ''.
	^ temp3 do: [ :argm4_6 |
		temp4 _ temp4 , argm4_6 first , ' ' , (argm4_6 last , Character cr asString) ].! !

!Expert methodsFor: 'tools'!
nF: arg1
	| temp2 temp3 |
	temp3 _ temp2 _ ExpertList new faitAsList: arg1.
	temp2 first = '~' ifTrue: [ temp2 _ temp2 allButFirst ].
	^ affirmations indexOf:
		(affirmations
			detect: [ :argm2_4 |
				(temp2 faitAsList: argm2_4 fait) = temp2 ]
			ifNone: [ ^ '--' ]).! !

!Expert methodsFor: 'tools'!
polySommets
	| temp1 temp2 temp3 temp4 |
	temp1 _ self drgeo area submorphs.
	temp2 _ temp1 detect: [ :argm1_5 |
		DrGPolygoneMorph = argm1_5 class ].
	temp3 _ temp2 costume name.
	temp4 _ ExpertList new:
		(temp2 costume mathItem parents collect: [ :argm3_5 |
			argm3_5 name ]).
	^ '[  ' , temp4 printString , ' ]'.! !

!Expert methodsFor: 'tools'!
regles
	^ regles.! !

!Expert methodsFor: 'tools'!
regles: arg1
	regles _ arg1.! !

!Expert methodsFor: 'tools'!
reglesConcluantFait: arg1
	| temp2 |
	^ self regles keys select: [ :argm0_4 |
		self
			unifie: arg1
			avec: (temp2 _ self regles at: argm0_4 asSymbol) concl
			vars: IdentityDictionary new ].! !

!Expert methodsFor: 'tools'!
retablitFait: arg1
	| temp2 temp3 |
	temp2 _ arg1.
	temp2 isString ifTrue: [ temp2 _ ExpertList new: temp2 ].
	temp3 _ self affirmations
		detect: [ :argm2_4 |
			argm2_4 fait = temp2 ]
		ifNone: [ ^ false ].
	self
		affirme: 'rétabli'
		fait: temp2 printString
		vars: IdentityDictionary new.
	temp3 retire: true.
	^ true.! !

!Expert methodsFor: 'tools'!
retablitFait: arg1 regle: arg2
	| temp3 temp4 |
	temp3 _ arg1.
	temp3 isString ifTrue: [ temp3 _ ExpertList new: temp3 ].
	temp4 _ self affirmations
		detect: [ :argm2_5 |
			argm2_5 fait = temp3 ]
		ifNone: [ ^ true ].
	self
		affirme: 'retablit par ' , arg2
		fait: temp4 fait printString , ' retabli'
		vars: IdentityDictionary new.
	temp4 retire: nil.
	^ true.! !

!Expert methodsFor: 'tools'!
retireFait: arg1 regle: arg2
	| temp3 temp4 |
	temp3 _ arg1.
	temp3 isString ifTrue: [ temp3 _ ExpertList new: temp3 ].
	temp4 _ self affirmations
		detect: [ :argm2_5 |
			argm2_5 fait = temp3 ]
		ifNone: [ ^ false ].
	self
		affirme: arg2
		fait: temp3 printString , ' retire'
		vars: IdentityDictionary new.
	temp4 retire: true.
	^ true.! !

!Expert methodsFor: 'tools'!
rounded: arg1 dec: arg2
	| temp3 |
	temp3 _ 10 raisedTo: arg2.
	^ (arg1 * temp3) rounded / temp3.! !

!Expert methodsFor: 'tools'!
setFaits: arg1
	faits _ arg1.! !

!Expert methodsFor: 'tools'!
setRegles: arg1
	regles _ arg1.! !

!Expert methodsFor: 'tools'!
standard
	| temp1 temp2 temp3 |
	temp1 _ self regles keys.
	temp2 _ temp1 collect: [ :argm1_5 |
		(regles at: argm1_5) concl ].
	^ temp2 collect: [ :argm2_5 |
		temp3 _ 0.
		argm2_5 collect: [ :argm3_6 |
			(argm3_6 beginsWith: '?')
				ifTrue: [
					temp3 _ temp3 + 1.
					'?' , temp3 asString ]
				ifFalse: [ argm3_6 asString ]]].! !

!Expert methodsFor: 'tools'!
trouve
	^ trouve.! !

!Expert methodsFor: 'tools'!
trouve: arg1
	trouve _ arg1.! !

!Expert methodsFor: 'tools'!
vars
	^ vars.! !

!Expert methodsFor: 'tools'!
verifFait: arg1 vars: arg2
	| temp3 temp4 temp5 |
	temp3 _ arg1.
	temp3 isString ifTrue: [ temp3 _ ExpertList new: temp3 ].
	temp4 _ (self faits at: temp3 first) collect: [ :argm2_7 |
		temp5 _ arg2 copy.
		self
			unifie: argm2_7 fait
			avec: temp3
			vars: temp5 ].
	^ temp5.! !

!Expert methodsFor: 'tools'!
verifieFait: arg1
	| temp2 temp3 |
	temp3 _ (self
		verifieFait: arg1
		vars: IdentityDictionary new) collect: [ :argm0_4 |
		argm0_4 last afficheFait ].
	temp2 _ WriteStream on: ''.
	temp3 do: [ :argm2_4 |
		temp2 nextPutAll: '
'.
		temp2 nextPutAll: argm2_4 ].
	^ temp2 contents.! !

!Expert class methodsFor: 'initialize'!
nouveau
	^ self new.! !

!ExpertFait methodsFor: 'accessing'!
afficheFait
	| temp1 temp2 |
	temp1 _ expert faitAsString: self.
	temp2 _ self no asString , ' ' , temp1 , ' -> ' , self just.
	^ temp2.! !

!ExpertFait methodsFor: 'accessing'!
afficheFait2
	| temp1 temp2 temp3 |
	temp1 _ expert faitAsString: self.
	temp2 _ (expert affirmations indexOf: self) asString , ' ' , temp1 , ' ->' , self just.
	temp3 _ self expert regles
		at: self just asSymbol
		ifAbsent: [ ].
	temp3 isNil ifTrue: [ ^ temp2 ].
	temp3 _ temp3 com.
	(temp3 isNil or: [ expert com not ]) ifTrue: [ ^ temp2 ].
	temp3 _ Character cr asString , ' * ' , temp3.
	^ temp2 , temp3.! !

!ExpertFait methodsFor: 'accessing'!
egal: arg1
	| temp2 temp3 |
	temp3 _ IdentityDictionary new.
	temp2 _ arg1.
	temp2 isString ifTrue: [ temp2 _ expert list: arg1 ].
	^ expert
		unifie: self fait
		avec: temp2
		vars: temp3.! !

!ExpertFait methodsFor: 'accessing'!
expert
	^ expert.! !

!ExpertFait methodsFor: 'accessing'!
expert: arg1
	expert _ arg1.! !

!ExpertFait methodsFor: 'accessing'!
fait
	^ fait.! !

!ExpertFait methodsFor: 'accessing'!
fait: arg1
	fait _ arg1.! !

!ExpertFait methodsFor: 'accessing'!
faitAsString
	^ super faitAsString: self fait.! !

!ExpertFait methodsFor: 'accessing'!
isExpertFait
	^ true.! !

!ExpertFait methodsFor: 'accessing'!
just
	^ just.! !

!ExpertFait methodsFor: 'accessing'!
just: arg1
	just _ arg1.! !

!ExpertFait methodsFor: 'accessing'!
key
	^ fait first asSymbol.! !

!ExpertFait methodsFor: 'accessing'!
lv
	^ lv.! !

!ExpertFait methodsFor: 'accessing'!
lv: arg1
	lv _ arg1.! !

!ExpertFait methodsFor: 'accessing'!
monIndex
	^ expert affirmations indexOf: self.! !

!ExpertFait methodsFor: 'accessing'!
nF
	expert affirmations indexOf: self.! !

!ExpertFait methodsFor: 'accessing'!
nosAnt
	| temp1 |
	temp1 _ expert.
	^ ((temp1 regles
		at: self just asSymbol
		ifAbsent: [ ^ #() ]) ant collect: [ :argm1_2 |
		temp1
			instancie: argm1_2
			vars: self lv ])
		collect: [ :argm1_2 |
			temp1 nF: (temp1 faitAsString: argm1_2) ]
		thenSelect: [ :argm1_2 |
			argm1_2 isNumber ].! !

!ExpertFait methodsFor: 'accessing'!
regles
	| temp1 |
	temp1 _ (self fait first , '-regles') asSymbol.
	(expert faits keys includes: temp1) ifTrue: [ ^ expert faits at: temp1 ].
	^ nil.! !

!ExpertFait methodsFor: 'accessing'!
retire
	retire ifNil: [ retire _ false ].
	^ retire.! !

!ExpertFait methodsFor: 'accessing'!
retire: arg1
	retire _ arg1.! !

!ExpertFait methodsFor: 'as yet unclassified'!
no
	^ no.! !

!ExpertFait methodsFor: 'as yet unclassified'!
no: arg1
	no _ arg1.! !

!ExpertRegle methodsFor: 'numbers'!
abs: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	^ self
		affecte: arg2
		valeur: (self makeNumber: temp4) abs
		vars: arg3.! !

!ExpertRegle methodsFor: 'numbers'!
arrondis: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 isSymbol ifTrue: [ temp4 _ temp4 asNumber ].
	temp4 isPoint ifTrue: [
		temp5 _ temp4 + 0.0005 * 1000.
		temp6 _ (temp5 x + 5.0e-5 * 1000) asInteger.
		temp7 _ (temp5 y + 5.0e-5 * 1000) asInteger.
		temp5 _ temp6 @ temp7.
		^ self
			affecte: arg2
			valeur: temp5 / 1000.0
			vars: arg3 ].
	temp4 isString ifTrue: [
		temp4 _ OpalCompiler new
			source: temp4;
			evaluate ].
	temp4 isFloat ifTrue: [
		temp5 _ temp4 + 0.0005 * 1000.
		^ self
			affecte: arg2
			valeur: temp5 asInteger / 1000.0
			vars: arg3 ].
	temp4 isInteger ifTrue: [ ^ self
			affecte: arg2
			valeur: temp4 asFloat
			vars: arg3 ].
	^ false.! !

!ExpertRegle methodsFor: 'numbers'!
difference: arg1 et: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	(temp5 isNil or: [ temp6 isNil ]) ifTrue: [ ^ false ].
	temp5 _ self makeNumber: temp5.
	temp6 _ self makeNumber: temp6.
	(temp5 isString or: [ temp6 isString ])
		ifTrue: [ temp7 _ temp5 asString , ' - ' , temp6 asString ]
		ifFalse: [
			temp7 _ temp5 - temp6.
			temp7 isNumber ifTrue: [
				temp7 asFraction = temp7 asInteger ifTrue: [ temp7 _ temp7 asInteger ]]].
	^ self
		affecte: arg3
		valeur: temp7
		vars: arg4.! !

!ExpertRegle methodsFor: 'numbers'!
différence: arg1 et: arg2 rep: arg3 vars: arg4
	^ self
		difference: arg1
		et: arg2
		rep: arg3
		vars: arg4.! !

!ExpertRegle methodsFor: 'numbers'!
ensembleAjoute: arg1 ensemble: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	temp7 _ self
		valeur: arg2
		vars: arg4.
	((temp5 asString beginsWith: '?') and: [ temp5 = arg1 ]) ifTrue: [ ^ false ].
	((temp6 asString beginsWith: '?') and: [ temp6 = arg2 ]) ifTrue: [ ^ false ].
	temp7 _ temp6 add: arg1.
	^ self
		affecte: arg3
		valeur: temp7
		vars: arg4.! !

!ExpertRegle methodsFor: 'numbers'!
égal: arg1 à: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 isString ifTrue: [ temp5 _ Compiler evaluate: temp4 ].
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	temp5 isString ifTrue: [ temp5 _ Compiler evaluate: temp5 ].
	temp4 ifNil: [ ^ self
			affecte: arg1
			valeur: temp5
			vars: arg3 ].
	temp5 ifNil: [ ^ self
			affecte: arg2
			valeur: temp4
			vars: arg3 ].
	(temp4 isNumber and: [ temp5 isNumber ]) ifTrue: [ ^ temp4 = temp5 ].
	(temp4 isPoint and: [ temp5 isPoint ]) ifTrue: [ ^ temp4 = temp5 ].
	(temp4 isPoint and: [ temp5 isPoint ]) ifTrue: [ ^ (temp4 - temp5) abs < (0.001 @ 0.001) ].
	(temp4 isNumber and: [
		temp5 isNumber and: [
			temp4 isFloat or: [ temp5 isFloat ]]]) ifTrue: [ ^ (temp4 - temp5) abs < 0.001 ].
	^ temp4 = temp5.! !

!ExpertRegle methodsFor: 'numbers'!
gensym
	gen ifNil: [ gen _ 0 ].
	^ gen _ gen + 1.! !

!ExpertRegle methodsFor: 'numbers'!
inférieur: arg1 à: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	temp4 _ self makeNumber: temp4.
	temp5 _ self makeNumber: temp5.
	^ temp4 < temp5.! !

!ExpertRegle methodsFor: 'numbers'!
inférieurOuEgal: arg1 à: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	temp4 _ self makeNumber: temp4.
	temp5 _ self makeNumber: temp5.
	^ temp4 <= temp5.! !

!ExpertRegle methodsFor: 'numbers'!
initGensym
	gen _ 0.! !

!ExpertRegle methodsFor: 'numbers'!
négatif: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	-543.617 @ 3632.852.
	temp5 _ temp4 negated.
	self
		affecte: arg2
		valeur: temp5 asString
		vars: arg3.
	^ true.! !

!ExpertRegle methodsFor: 'numbers'!
produit: arg1 et: arg2 rep: arg3 vars: arg4
	| temp5 temp6 |
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	(temp5 notNil and: temp6 notNil) ifTrue: [
		((temp5 _ self makeNumber: temp5) ~= false and: [ (temp6 _ self makeNumber: temp6) ~= false ]) ifTrue: [ ^ self
				affecte: arg3
				valeur: (temp5 * temp6) asString
				vars: arg4 ]].
	^ false.! !

!ExpertRegle methodsFor: 'numbers'!
quotient: arg1 et: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	temp5 ifNil: [ ^ false ].
	temp6 ifNil: [ ^ false ].
	temp5 _ self makeNumber: temp5.
	temp6 _ self makeNumber: temp6.
	(temp5 isNumber and: [ temp6 isNumber ]) ifFalse: [ ^ false ].
	temp7 _ temp5 / temp6.
	^ self
		affecte: arg3
		valeur: temp7 asString
		vars: arg4.! !

!ExpertRegle methodsFor: 'numbers'!
racine: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp4 _ OpalCompiler new
		source: temp4;
		evaluate.
	temp5 _ temp4 sqrt.
	temp5 asFraction = temp5 asInteger
		ifTrue: [ temp5 _ temp5 asInteger ]
		ifFalse: [ temp5 _ temp5 asFraction ].
	self
		affecte: arg2
		valeur: temp5 asString
		vars: arg3.
	^ true.! !

!ExpertRegle methodsFor: 'numbers'!
racineDecimal: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp4 _ self makeNumber: temp4.
	temp5 _ temp4 sqrt asFloat.
	^ self
		affecte: arg2
		valeur: temp5 asString
		vars: arg3.! !

!ExpertRegle methodsFor: 'numbers'!
racineFraction: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp4 _ self makeNumber: temp4.
	temp5 _ temp4 sqrt asFraction.
	^ self
		affecte: arg2
		valeur: temp5 asString
		vars: arg3.! !

!ExpertRegle methodsFor: 'numbers'!
racineSymbol: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp7 _ 'V' , 175 asCharacter asString.
	temp4 _ self
		valeur: arg1
		vars: arg3.
	((arg1 beginsWith: '?') and: [ arg1 = temp4 ]) ifTrue: [ ^ false ].
	temp5 _ self makeNumber: temp4.
	temp5 isNumber ifTrue: [
		temp6 _ temp5 sqrt.
		temp6 isFloat ifTrue: [ temp6 _ temp7 , temp4 ].
		^ self
			affecte: arg2
			valeur: temp6 asString
			vars: arg3 ].
	^ self
		affecte: arg2
		valeur: temp7 , temp4 asString
		vars: arg3.! !

!ExpertRegle methodsFor: 'numbers'!
somme: arg1 et: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	temp5 ifNil: [ ^ false ].
	temp6 ifNil: [ ^ false ].
	temp5 _ self makeNumber: temp5.
	temp6 _ self makeNumber: temp6.
	(temp5 isNumber and: [ temp6 isNumber ]) ifFalse: [ ^ false ].
	temp7 _ temp5 + temp6.
	^ self
		affecte: arg3
		valeur: temp7
		vars: arg4.! !

!ExpertRegle methodsFor: 'numbers'!
supérieur: arg1 à: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp5 ifNil: [ ^ false ].
	temp4 _ self makeNumber: temp4.
	temp5 _ self makeNumber: temp5.
	^ temp4 > temp5.! !

!ExpertRegle methodsFor: 'numbers'!
supérieurOuEgal: arg1 à: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	temp4 _ self makeNumber: temp4.
	temp5 _ self makeNumber: temp5.
	^ temp4 >= temp5.! !

!ExpertRegle methodsFor: 'numbers'!
x: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	^ self
		affecte: arg2
		valeur: (self makeNumber: temp4 x) abs
		vars: arg3.! !

!ExpertRegle methodsFor: 'numbers'!
y: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	^ self
		affecte: arg2
		valeur: (self makeNumber: temp4 y) abs
		vars: arg3.! !

!ExpertRegle methodsFor: 'relations'!
ajoute: arg1 ensemble: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	temp5 add: arg1.
	^ true.! !

!ExpertRegle methodsFor: 'relations'!
contient: arg1 el: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	(temp4 isNil or: [ temp5 isNil ]) ifTrue: [ ^ false ].
	(temp4 isKindOf: Symbol) ifTrue: [ ^ (temp4 asString indexOf: (temp5 at: 1)) > 0 ].
	^ temp4 includes: temp5.! !

!ExpertRegle methodsFor: 'relations'!
nonRelation: arg1 et: arg2 nom: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	temp6 _ self
		valeur: arg2
		vars: arg4.
	temp5 = temp6 ifTrue: [ ^ true ].
	(temp5 = arg1 and: [
		arg1 isString and: [ arg1 beginsWith: '?' ]]) ifTrue: [ ^ false ].
	(temp6 = arg2 and: [
		arg2 isString and: [ arg2 beginsWith: '?' ]]) ifTrue: [ ^ false ].
	temp7 _ self
		valeur: arg3
		vars: arg4.
	temp8 _ ExpertRelations new.
	temp8 expert: expert.
	^ (temp8
		relation: temp5
		et: temp6
		nom: temp7) not.! !

!ExpertRegle methodsFor: 'relations'!
relation: arg1 et: arg2 nom: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 |
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	temp5 isNil ifTrue: [ ^ false ].
	temp6 isNil ifTrue: [ ^ false ].
	temp5 = temp6 ifTrue: [ ^ true ].
	(temp5 = arg1 and: [
		arg1 isString and: [ arg1 beginsWith: '?' ]]) ifTrue: [ ^ false ].
	(temp6 = arg2 and: [
		arg2 isString and: [ arg2 beginsWith: '?' ]]) ifTrue: [ ^ false ].
	temp7 _ self
		valeur: arg3
		vars: arg4.
	temp8 _ ExpertRelations new.
	temp8 expert: expert.
	^ temp8
		relation: temp5
		et: temp6
		nom: temp7.! !

!ExpertRegle methodsFor: 'relations'!
relation: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	self expert relations ifEmpty: [ ^ false ].
	temp7 _ ExpertList new.
	temp6 _ self expert.
	temp5 _ self
		instanciedValue: arg1 asString
		vars: arg3.
	temp5 ifNotNil: [
		temp4 _ self expert relations at: temp5 asSymbol.
		temp4 _ temp4 collect: [ :argm5_8 |
			ExpertList new: argm5_8 ].
		self
			affecte: arg2
			valeur: (ExpertList new: temp4)
			vars: arg3.
		^ true ].
	^ false.! !

!ExpertRegle methodsFor: 'relations'!
relationCrée: arg1 et: arg2 nom: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 |
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	temp5 isNil ifTrue: [ ^ false ].
	temp6 isNil ifTrue: [ ^ false ].
	temp5 = temp6 ifTrue: [ ^ false ].
	temp7 _ self
		valeur: arg3
		vars: arg4.
	temp8 _ ExpertRelations new.
	temp8 expert: self expert.
	temp8
		relationCrée: temp5
		et: temp6
		nom: temp7.
	^ true.! !

!ExpertRegle methodsFor: 'relations'!
relationsClés: arg1 vars: arg2
	| temp3 |
	temp3 _ self
		valeur: arg1
		vars: arg2.
	self expert
		affecte: temp3
		valeur: self expert relations keys
		vars: arg2.
	^ true.! !

!ExpertRegle methodsFor: 'geometry'!
abcisseDe: arg1 sur: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 |
	temp7 _ self expert drgeo domain factory pool.
	temp9 _ [ :argm1_10 |
	temp7
		detect: [ :argm1_11 |
			argm1_10 = argm1_11 name ]
		ifNone: [ ]].
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	temp5 ifNil: [ ^ false ].
	temp6 ifNil: [ ^ false ].
	temp8 _ temp9 value: temp5.
	temp8 class.
	(temp9 value: temp6) ifNil: [ ^ false ].
	^ self
		affecte: arg3
		valeur: ((temp9 value: temp6) abscissaOf: temp8 point)
		vars: arg4.! !

!ExpertRegle methodsFor: 'geometry'!
aireTriangle: arg1 avec: arg2 avec: arg3 rep: arg4 vars: arg5
	| temp6 temp7 temp8 temp10 temp11 |
	temp7 _ self expert drgeo domain factory pool.
	temp8 _ self
		instanciedValue: arg1
		vars: arg5.
	temp10 _ self
		instanciedValue: arg2
		vars: arg5.
	temp11 _ self
		instanciedValue: arg3
		vars: arg5.
	temp8 ifNil: [ ^ false ].
	temp10 ifNil: [ ^ false ].
	temp11 ifNil: [ ^ false ].
	temp8 _ (temp7
		detect: [ :argm7_12 |
			temp8 = argm7_12 name ]
		ifNone: [ ^ false ]) point.
	temp10 _ (temp7
		detect: [ :argm8_12 |
			temp10 = argm8_12 name ]
		ifNone: [ ^ false ]) point.
	temp11 _ (temp7
		detect: [ :argm9_12 |
			temp11 = argm9_12 name ]
		ifNone: [ ^ false ]) point.
	temp6 _ temp8
		triangleArea: temp10
		with: temp11.
	^ self
		affecte: arg4
		valeur: temp6
		vars: arg5.! !

!ExpertRegle methodsFor: 'geometry'!
aireTriangleNegative: arg1 avec: arg2 avec: arg3 rep: arg4 vars: arg5
	| temp6 |
	self
		aireTriangle: arg1
		avec: arg2
		avec: arg3
		rep: arg4
		vars: arg5.
	temp6 _ self
		valeur: arg4
		vars: arg5.
	temp6 < 0 ifTrue: [ ^ self
			affecte: arg4
			valeur: temp6
			vars: arg5 ].
	^ false.! !

!ExpertRegle methodsFor: 'geometry'!
aireTriangleNegative: arg1 avec: arg2 avec: arg3 vars: arg4
	| temp5 temp6 |
	temp5 _ '?&x'.
	temp6 _ arg4 veryDeepCopy.
	(self
		aireTriangle: arg1
		avec: arg2
		avec: arg3
		rep: temp5
		vars: temp6) ifTrue: [ ^ (self
			valeur: temp5
			vars: temp6) < 0 ].
	^ false.! !

!ExpertRegle methodsFor: 'geometry'!
aireTrianglePositive: arg1 avec: arg2 avec: arg3 rep: arg4 vars: arg5
	| temp6 |
	self
		aireTriangle: arg1
		avec: arg2
		avec: arg3
		rep: arg4
		vars: arg5.
	temp6 _ self
		valeur: arg4
		vars: arg5.
	temp6 >= 0 ifTrue: [ ^ self
			affecte: arg4
			valeur: temp6
			vars: arg5 ].
	^ false.! !

!ExpertRegle methodsFor: 'geometry'!
aireTrianglePositive: arg1 avec: arg2 avec: arg3 vars: arg4
	| temp5 temp6 |
	temp5 _ '?&x'.
	temp6 _ arg4 deepCopy.
	(self
		aireTriangle: arg1
		avec: arg2
		avec: arg3
		rep: temp5
		vars: temp6) ifTrue: [ ^ (self
			valeur: temp5
			vars: temp6) >= 0 ].
	^ false.! !

!ExpertRegle methodsFor: 'geometry'!
degrés: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp6 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 _ temp4 asString.
	temp5 _ (temp6
		detect: [ :argm4_7 |
			temp4 = argm4_7 name ]
		ifNone: [ ^ false ]) degreeAngle.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
nomPolygone: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp5 _ (self
		instanciedValue: arg1
		vars: arg3) asNumber.
	^ self
		affecte: arg2
		valeur: (self nomPolygone: temp5)
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
nonPointConfondu: arg1 avec: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 |
	temp9 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp5 ifNil: [ ^ false ].
	temp6 _ (temp9
		detect: [ :argm5_10 |
			temp4 = argm5_10 name ]
		ifNone: [ ^ false ]) point.
	temp7 _ (temp9
		detect: [ :argm6_10 |
			temp5 = argm6_10 name ]
		ifNone: [ ^ false ]) point.
	temp8 _ (temp6 - temp7) abs.
	^ (temp8 x < 0.0001 and: [ temp8 y < 0.0001 ]) not.! !

!ExpertRegle methodsFor: 'geometry'!
origine: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 |
	temp6 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	(temp7 _ temp4 substrings: ':') size = 2
		ifTrue: [ temp5 _ temp7 first ]
		ifFalse: [
			temp8 _ temp6
				detect: [ :argm3_9 |
					temp4 = argm3_9 name ]
				ifNone: [ ^ false ].
			temp5 _ temp8 parents first name ].
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
parents: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp6 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 _ temp4 asString.
	temp5 _ (temp6
		detect: [ :argm4_8 |
			temp4 = argm4_8 name ]
		ifNone: [ ^ false ]) parents.
	temp5 _ ExpertList new:
		(temp5 collect: [ :argm5_8 |
			argm5_8 name ]).
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
pente: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp6 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 _ temp4 asString.
	temp5 _ temp6
		detect: [ :argm4_7 |
			temp4 = argm4_7 name ]
		ifNone: [ ^ false ].
	(temp5 isKindOf: DrGLineItem) ifFalse: [ ^ false ].
	temp5 _ temp5 direction.
	0 = temp5 x ifTrue: [
		self
			affecte: arg2
			valeur: Float infinity
			vars: arg3.
		^ true ].
	temp5 _ temp5 y / temp5 x.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
point: arg1 entre: arg2 et: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp12 |
	temp12 _ self expert drgeo.
	temp5 _ self
		valeur: arg1
		vars: arg4.
	((temp5 beginsWith: '?') and: [ temp5 = arg1 ]) ifTrue: [ ^ false ].
	temp6 _ self
		valeur: arg2
		vars: arg4.
	((temp6 beginsWith: '?') and: [ temp6 = arg2 ]) ifTrue: [ ^ false ].
	temp7 _ self
		valeur: arg3
		vars: arg4.
	((temp7 beginsWith: '?') and: [ temp6 = arg2 ]) ifTrue: [ ^ false ].
	temp6 = temp7 ifTrue: [ ^ false ].
	temp6 = temp5 ifTrue: [ ^ false ].
	temp7 = temp5 ifTrue: [ ^ false ].
	temp8 _ ((self expert drgeo view submorphs select: [ :argm10_13 |
		argm10_13 class = DrGPointMorph ])
		detect: [ :argm10_13 |
			argm10_13 costume name = temp6 ]
		ifNone: [ ^ false ]) costume mathItem point.
	temp9 _ ((temp11 drgeo area submorphs select: [ :argm11_13 |
		argm11_13 class = DrGPointMorph ])
		detect: [ :argm11_13 |
			argm11_13 costume name = temp7 ]
		ifNone: [ ^ false ]) costume mathItem point.
	temp10 _ ((temp11 drgeo area submorphs select: [ :argm12_13 |
		argm12_13 class = DrGPointMorph ])
		detect: [ :argm12_13 |
			argm12_13 costume name = temp5 ]
		ifNone: [ ^ false ]) costume mathItem point.
	temp8 x = temp9 x ifTrue: [
		temp8 y < temp9 y ifTrue: [ ^ temp10 y
				between: temp8 y
				and: temp9 y ].
		^ temp10 y
			between: temp9 y
			and: temp8 y ].
	temp8 x < temp9 x ifTrue: [ ^ temp10 x
			between: temp8 x
			and: temp9 x ].
	^ temp10 x
		between: temp9 x
		and: temp8 x.! !

!ExpertRegle methodsFor: 'geometry'!
point: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp6 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 _ temp4 asString.
	temp5 _ (temp6
		detect: [ :argm4_7 |
			temp4 = argm4_7 name ]
		ifNone: [ ^ false ]) point.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
pointConfondu: arg1 avec: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 |
	temp9 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp5 ifNil: [ ^ false ].
	temp6 _ (temp9
		detect: [ :argm5_10 |
			temp4 = argm5_10 name ]
		ifNone: [ ^ false ]) point.
	temp7 _ (temp9
		detect: [ :argm6_10 |
			temp5 = argm6_10 name ]
		ifNone: [ ^ false ]) point.
	temp8 _ (temp6 - temp7) abs.
	^ temp8 x < 0.0001 and: [ temp8 y < 0.0001 ].! !

!ExpertRegle methodsFor: 'geometry'!
pointDifferent: arg1 de: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 |
	temp9 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp5 ifNil: [ ^ false ].
	temp6 _ (temp9
		detect: [ :argm5_10 |
			temp4 = argm5_10 name ]
		ifNone: [ ^ false ]) point.
	temp7 _ (temp9
		detect: [ :argm6_10 |
			temp5 = argm6_10 name ]
		ifNone: [ ^ false ]) point.
	temp8 _ (temp6 - temp7) abs.
	^ (temp8 x < 0.0001 and: [ temp8 y < 0.0001 ]) not.! !

!ExpertRegle methodsFor: 'geometry'!
pointsSur: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 |
	temp6 _ expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp9 _ OrderedCollection new.
	temp4 ifNil: [ ^ false ].
	temp8 _ [ :argm4_11 |
	temp6
		detect: [ :argm4_12 |
			argm4_11 = argm4_12 name ]
		ifNone: [ ^ false ]].
	temp4 _ temp8 value: temp4.
	temp5 _ temp4 origin.
	temp7 _ expert affirmations
		select: [ :argm7_11 |
			argm7_11 fait asString beginsWith: 'pointSur ' , temp4 name asString ]
		thenCollect: [ :argm7_11 |
			argm7_11 fait last asString ].
	temp7 do: [ :argm8_11 |
		temp9 add: argm8_11 ].
	temp9 _ temp9 asSet asOrderedCollection.
	temp9 sort: [ :argm10_11 :argm10_12 |
		(temp4 abscissaOf: (temp8 value: argm10_11) point) < (temp4 abscissaOf: (temp8 value: argm10_12) point) ].
	temp9 _ ExpertList new: temp9.
	^ self
		affecte: arg2
		valeur: temp9
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
pointsSurCercle: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 |
	temp5 _ expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp6 _ [ :argm3_11 |
	temp5 detect: [ :argm3_12 |
		argm3_11 = argm3_12 name ]].
	temp4 _ temp6 value: temp4.
	temp9 _ OrderedCollection new.
	temp8 _ expert affirmations
		select: [ :argm6_11 |
			argm6_11 fait asString beginsWith: 'pointSur ' , temp4 name asString ]
		thenCollect: [ :argm6_11 |
			argm6_11 fait last asString ].
	temp8 do: [ :argm7_11 |
		temp9 add: argm7_11 ].
	temp9 _ temp9 asSet asOrderedCollection.
	temp9 sort: [ :argm9_11 :argm9_12 |
		(temp4 abscissaOf: (temp6 value: argm9_11) point) < (temp4 abscissaOf: (temp6 value: argm9_12) point) ].
	temp9 _ ExpertList new: temp9.
	^ self
		affecte: arg2
		valeur: temp9
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
pointx: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 |
	temp8 _ self
		valeur: arg1
		vars: arg3.
	temp6 _ self
		valeur: arg2
		vars: arg3.
	temp8 class = Point ifFalse: [
		((temp8 beginsWith: '?') and: [ arg1 = temp8 ]) ifTrue: [ ^ false ].
		temp7 _ self expert drgeo app.
		temp4 _ temp7 costumes.
		temp8 _ temp4
			detect: [ :argm5_10 |
				temp8 = argm5_10 mathItem name ]
			ifNone: [ ^ false ].
		temp8 _ temp8 mathItem point ].
	temp5 _ temp8 x.
	^ self
		affecte: temp6
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
pointy: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 |
	temp8 _ self
		valeur: arg1
		vars: arg3.
	temp6 _ self
		valeur: arg2
		vars: arg3.
	temp8 class = Point ifFalse: [
		((temp8 beginsWith: '?') and: [ arg1 = temp8 ]) ifTrue: [ ^ false ].
		temp7 _ self expert drgeo app.
		temp4 _ temp7 costumes.
		temp8 _ temp4
			detect: [ :argm5_10 |
				temp8 = argm5_10 mathItem name ]
			ifNone: [ ^ false ].
		temp8 _ temp8 mathItem point ].
	temp5 _ temp8 y.
	^ self
		affecte: temp6
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'geometry'!
triangleArea: arg1 with: arg2 with: arg3 rep: arg4 vars: arg5
	| temp6 temp7 temp8 temp10 temp11 |
	temp7 _ self expert drgeo domain factory pool.
	temp8 _ self
		instanciedValue: arg1
		vars: arg5.
	temp10 _ self
		instanciedValue: arg2
		vars: arg5.
	temp11 _ self
		instanciedValue: arg3
		vars: arg5.
	temp8 ifNil: [ ^ false ].
	temp10 ifNil: [ ^ false ].
	temp11 ifNil: [ ^ false ].
	temp8 _ (temp7 detect: [ :argm7_12 |
		temp8 = argm7_12 name ]) point.
	temp10 _ (temp7 detect: [ :argm8_12 |
		temp10 = argm8_12 name ]) point.
	temp11 _ (temp7 detect: [ :argm9_12 |
		temp11 = argm9_12 name ]) point.
	temp6 _ temp8
		triangleArea: temp10
		with: temp11.
	^ self
		affecte: arg4
		valeur: temp6
		vars: arg5.! !

!ExpertRegle methodsFor: 'geometry'!
vecteur: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp6 _ self expert drgeo domain factory pool.
	temp5 _ temp6 detect: [ :argm3_7 |
		argm3_7 name = temp4 ].
	^ self
		affecte: arg2
		valeur: temp5 direction
		vars: arg3.! !

!ExpertRegle methodsFor: 'actions'!
affiche: arg1 vars: arg2
	| temp3 |
	temp3 _ self
		instanciedValue: arg1
		vars: arg2.
	DrGWizardPage new alert: temp3 printString.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
afficheTexte: arg1 a: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 |
	temp4 _ DrGeoFigure viewLess.
	temp5 _ self expert drgeo app.
	temp4 drgeo: temp5.
	temp7 _ (self
		instanciedValue: arg1
		vars: arg3) asString.
	temp9 _ self
		instanciedValue: arg2 asString
		vars: arg3.
	temp9 _ OpalCompiler new
		source: temp9;
		evaluate.
	temp6 ifNil: [ ^ false ].
	temp7 ifNil: [ ^ false ].
	temp8 _ temp4
		texte: temp7
		a: temp9.
	temp8 couleur: Color cyan.
	temp8 nommer: temp6.
	self expert constructions: temp8.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
afficheTexte: arg1 contenu: arg2 a: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 |
	temp5 _ DrGeoFigure viewLess.
	temp6 _ self expert drgeo app.
	temp5 drgeo: temp6.
	temp7 _ self
		instanciedValue: arg1
		vars: arg4.
	temp8 _ (self
		instanciedValue: arg2
		vars: arg4) asString.
	temp10 _ self
		instanciedValue: arg3 asString
		vars: arg4.
	temp10 _ OpalCompiler new
		source: temp10;
		evaluate.
	temp7 ifNil: [ ^ false ].
	temp8 ifNil: [ ^ false ].
	temp9 _ temp5
		texte: temp8
		a: temp10.
	temp9 couleur: Color cyan.
	temp9 nommer: temp7.
	self expert constructions: temp9.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
angleCentre: arg1 de: arg2 a: arg3 coul: arg4 vars: arg5
	| temp6 temp7 temp8 temp9 temp10 temp11 temp12 temp13 temp14 temp15 temp16 temp17 |
	temp6 _ DrGeoFigure viewLess.
	temp7 _ self expert drgeo app.
	temp8 _ temp7 costumes.
	temp8 collect: [ :argm3_18 |
		argm3_18 mathItem name ].
	temp6 drgeo: temp7.
	temp9 _ self
		instanciedValue: arg1
		vars: arg5.
	temp10 _ self
		instanciedValue: arg2
		vars: arg5.
	temp11 _ self
		instanciedValue: arg3
		vars: arg5.
	temp16 _ self
		instanciedValue: arg4
		vars: arg5.
	temp9 ifNil: [ ^ false ].
	temp10 ifNil: [ ^ false ].
	temp11 ifNil: [ ^ false ].
	temp14 _ temp8
		detect: [ :argm12_18 |
			argm12_18 mathItem name = temp10 ]
		ifNone: [ ^ false ].
	temp13 _ temp8
		detect: [ :argm13_18 |
			argm13_18 mathItem name = temp9 ]
		ifNone: [ ^ false ].
	temp15 _ temp8
		detect: [ :argm14_18 |
			argm14_18 mathItem name = temp11 ]
		ifNone: [ ^ false ].
	temp16 = 'noir' ifTrue: [ temp17 _ Color black ].
	temp16 = 'blanc' ifTrue: [ temp17 _ Color white ].
	temp16 = 'rouge' ifTrue: [ temp17 _ Color red ].
	temp16 = 'jaune' ifTrue: [ temp17 _ Color yellow ].
	temp16 = 'bleu' ifTrue: [ temp17 _ Color blue ].
	temp16 = 'cyan' ifTrue: [ temp17 _ Color cyan ].
	temp16 = 'magenta' ifTrue: [ temp17 _ Color magenta ].
	temp16 = 'blanc' ifTrue: [ temp17 _ Color white ].
	temp12 _ temp6
		angleCentre: temp13
		de: temp14
		a: temp15.
	temp12 style color: temp17.
	self expert constructions: temp12.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
angleGeometriqueCentre: arg1 de: arg2 a: arg3 coul: arg4 vars: arg5
	| temp6 temp7 temp8 temp9 temp10 temp11 temp12 temp13 temp14 temp15 temp16 temp17 |
	temp6 _ DrGeoFigure viewLess.
	temp7 _ self expert drgeo app.
	temp8 _ temp7 costumes.
	temp6 drgeo: temp7.
	temp9 _ self
		instanciedValue: arg1
		vars: arg5.
	temp10 _ self
		instanciedValue: arg2
		vars: arg5.
	temp11 _ self
		instanciedValue: arg3
		vars: arg5.
	temp16 _ self
		instanciedValue: arg4
		vars: arg5.
	temp9 ifNil: [ ^ false ].
	temp10 ifNil: [ ^ false ].
	temp11 ifNil: [ ^ false ].
	temp14 _ temp8 detect: [ :argm11_18 |
		argm11_18 mathItem name = temp10 ].
	temp13 _ temp8 detect: [ :argm12_18 |
		argm12_18 mathItem name = temp9 ].
	temp15 _ temp8 detect: [ :argm13_18 |
		argm13_18 mathItem name = temp11 ].
	temp16 = 'noir' ifTrue: [ temp17 _ Color black ].
	temp16 = 'blanc' ifTrue: [ temp17 _ Color white ].
	temp16 = 'rouge' ifTrue: [ temp17 _ Color red ].
	temp16 = 'jaune' ifTrue: [ temp17 _ Color yellow ].
	temp16 = 'bleu' ifTrue: [ temp17 _ Color blue ].
	temp16 = 'cyan' ifTrue: [ temp17 _ Color cyan ].
	temp16 = 'magenta' ifTrue: [ temp17 _ Color magenta ].
	temp16 = 'blanc' ifTrue: [ temp17 _ Color white ].
	temp12 _ temp6
		angleGeometriqueCentre: temp13
		de: temp14
		a: temp15.
	temp12 style color: temp17.
	self expert constructions: temp12.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
angleGeometriqueCentre: arg1 de: arg2 a: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp12 temp13 temp14 |
	temp5 _ DrGeoFigure viewLess.
	temp6 _ self expert drgeo app.
	temp7 _ temp6 costumes.
	temp5 drgeo: temp6.
	temp8 _ self
		instanciedValue: arg1
		vars: arg4.
	temp9 _ self
		instanciedValue: arg2
		vars: arg4.
	temp10 _ self
		instanciedValue: arg3
		vars: arg4.
	temp8 ifNil: [ ^ false ].
	temp9 ifNil: [ ^ false ].
	temp10 ifNil: [ ^ false ].
	temp13 _ temp7 detect: [ :argm10_15 |
		argm10_15 mathItem name = temp9 ].
	temp12 _ temp7 detect: [ :argm11_15 |
		argm11_15 mathItem name = temp8 ].
	temp14 _ temp7 detect: [ :argm12_15 |
		argm12_15 mathItem name = temp10 ].
	temp11 _ temp5
		angleGeometriqueCentre: temp12
		de: temp13
		a: temp14.
	temp11 style color: Color cyan.
	self expert constructions: temp11.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
couleurObjet: arg1 couleur: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 |
	temp7 _ self expert drgeo app.
	temp4 _ self
		valeur: arg2
		vars: arg3.
	temp4 = 'vert' ifTrue: [ temp4 _ Color green ].
	temp4 = 'bleu' ifTrue: [ temp4 _ Color blue ].
	temp4 = 'rouge' ifTrue: [ temp4 _ Color red ].
	temp4 = 'magenta' ifTrue: [ temp4 _ Color magenta ].
	temp4 = 'jaune' ifTrue: [ temp4 _ Color yellow ].
	temp4 = 'cyan' ifTrue: [ temp4 _ Color cyan ].
	temp4 = 'noir' ifTrue: [ temp4 _ Color black ].
	temp5 _ self
		valeur: arg1
		vars: arg3.
	temp6 _ temp7 costumes.
	temp8 _ temp6
		detect: [ :argm11_9 |
			temp5 = argm11_9 name ]
		ifNone: [ ^ false ].
	self expert constructions add:
		(Array
			with: temp8
			with: temp8 style color).
	temp8 style color: temp4.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
couleurPoint: arg1 couleur: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp7 _ self expert drgeo app.
	temp4 _ self
		valeur: arg2
		vars: arg3.
	temp4 = 'vert' ifTrue: [ temp4 _ Color green ].
	temp4 = 'bleu' ifTrue: [ temp4 _ Color blue ].
	temp4 = 'rouge' ifTrue: [ temp4 _ Color red ].
	temp4 = 'magenta' ifTrue: [ temp4 _ Color magenta ].
	temp4 = 'jaune' ifTrue: [ temp4 _ Color yellow ].
	temp4 = 'cyan' ifTrue: [ temp4 _ Color cyan ].
	temp4 = 'noir' ifTrue: [ temp4 _ Color black ].
	temp5 _ self
		valeur: arg1
		vars: arg3.
	temp6 _ temp7 costumes select: [ :argm10_8 |
		argm10_8 class = DrGPointCostume ].
	(temp6
		detect: [ :argm11_8 |
			temp5 = argm11_8 name ]
		ifNone: [ ^ false ]) style color: temp4.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
créePointMilieu: arg1 Point: arg2 et: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp12 |
	temp6 _ self expert drgeo app.
	temp5 _ DrGeoFigure viewLess.
	temp5 drgeo: temp6.
	temp10 _ temp6 costumes.
	temp11 _ [ :argm4_13 |
	temp10
		detect: [ :argm4_14 |
			argm4_13 = argm4_14 mathItem name ]
		ifNone: [ ]].
	temp7 _ self
		instanciedValue: arg1
		vars: arg4.
	temp8 _ self
		instanciedValue: arg2
		vars: arg4.
	temp9 _ self
		instanciedValue: arg3
		vars: arg4.
	temp8 _ temp11 value: temp8.
	temp9 _ temp11 value: temp9.
	temp7 _ temp11 value: temp7.
	temp12 _ temp5
		segment: temp8
		to: temp9.
	temp5
		intersectionOf: temp12
		and: temp7.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
distanceDe: arg1 a: arg2 coul: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp12 temp13 temp14 temp15 temp16 temp17 temp18 |
	temp5 _ DrGeoFigure viewLess.
	temp6 _ self expert drgeo app.
	temp7 _ temp6 costumes.
	temp5 drgeo: temp6.
	temp8 _ self
		instanciedValue: arg1
		vars: arg4.
	temp9 _ self
		instanciedValue: arg2
		vars: arg4.
	temp13 _ self
		instanciedValue: arg3
		vars: arg4.
	temp8 ifNil: [ ^ false ].
	temp9 ifNil: [ ^ false ].
	temp11 _ temp7 detect: [ :argm9_19 |
		argm9_19 mathItem name = temp8 ].
	temp12 _ temp7 detect: [ :argm10_19 |
		argm10_19 mathItem name = temp9 ].
	temp13 = 'noir' ifTrue: [ temp14 _ Color black ].
	temp13 = 'blanc' ifTrue: [ temp14 _ Color white ].
	temp13 = 'rouge' ifTrue: [ temp14 _ Color red ].
	temp13 = 'jaune' ifTrue: [ temp14 _ Color yellow ].
	temp13 = 'bleu' ifTrue: [ temp14 _ Color blue ].
	temp13 = 'cyan' ifTrue: [ temp14 _ Color cyan ].
	temp13 = 'magenta' ifTrue: [ temp14 _ Color magenta ].
	temp10 _ temp5
		distanceDe: temp11
		a: temp12.
	temp10 style color: temp14.
	temp15 _ temp11 mathItem point.
	temp16 _ temp12 mathItem point.
	temp17 _ temp15 x - temp16 x / 2.
	temp18 _ temp15 y - temp16 y / 2.
	temp10 deplacerA: temp16 x + temp17 @ (temp16 y + temp18).
	temp5 actualiser.
	self expert constructions: temp10.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
execute: arg1 vars: arg2
	| temp3 temp4 temp5 |
	temp3 _ DrGeoFigure viewLess.
	temp4 _ self expert drgeo app.
	temp3 drgeo: temp4.
	temp5 _ (self
		instanciedValue: arg1
		vars: arg2) asString.
	temp5 ifNil: [ ^ false ].
	OpalCompiler new
		source: 'f := DrGeoFigure viewLess.
	drgeo := DrGeo allInstances first  .
	f drgeo: drgeo.' , 'f  ' , temp5;
		evaluate.
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
polyAjouteETNuméroteSommets: arg1 vars: arg2
	| temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10 temp13 |
	temp4 _ self expert drgeo app.
	temp3 _ DrGeoFigure viewLess.
	temp3 drgeo: temp4.
	temp6 _ self
		valeur: arg1
		vars: arg2.
	(temp6 = arg1 and: [ temp6 beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp8 _ temp4 costumes.
	temp5 _ temp8 detect: [ :argm6_15 |
		argm6_15 name = temp6 ].
	temp7 _ temp5 mathItem parents last valueItem - 1.
	temp9 _ temp8 select: [ :argm8_15 |
		temp13 _ argm8_15 mathItem.
		temp13 class = DrGPointOncurveItem and: [ temp5 mathItem = temp13 parents first ]].
	temp9 size = temp7 ifFalse: [
		0
			to: temp7 - 1
			do: [ :temp11 |
				temp10 _ temp3
					pointSurLigne: temp5
					a: temp11 / (temp7 + 1).
				temp10 nommer: 'P' , (temp11 + 1) asString ]].
	^ true.! !

!ExpertRegle methodsFor: 'actions'!
polyAjouteSommets: arg1 vars: arg2
	| temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp12 |
	temp4 _ self expert drgeo app.
	temp3 _ DrGeoFigure viewLess.
	temp3 drgeo: temp4.
	temp6 _ self
		valeur: arg1
		vars: arg2.
	(temp6 = arg1 and: [ temp6 beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp8 _ temp4 costumes.
	temp5 _ temp8 detect: [ :argm6_14 |
		argm6_14 name = temp6 ].
	temp7 _ temp5 mathItem parents last valueItem - 1.
	temp9 _ temp8 select: [ :argm8_14 |
		temp12 _ argm8_14 mathItem.
		temp12 class = DrGPointOncurveItem and: [ temp5 mathItem = temp12 parents first ]].
	temp9 size = temp7 ifFalse: [
		0
			to: temp7 - 1
			do: [ :temp10 |
				temp3
					pointSurLigne: temp5
					a: temp10 / (temp7 + 1) ]].
	^ true.! !

!ExpertRegle methodsFor: 'accessing'!
active: arg1
	self class
		perform: arg1 asSymbol
		withArguments: expert.! !

!ExpertRegle methodsFor: 'accessing'!
activeconcl: arg1
	| temp2 temp3 |
	temp3 _ temp2 allButFirst.
	$: = concl first last ifTrue: [
		temp3 add: arg1.
		self
			perform: (concl first , 'vars:') asSymbol
			withArguments: temp3 asArray ].
	^ temp2.! !

!ExpertRegle methodsFor: 'accessing'!
afficheConclusion
	| temp1 temp2 |
	temp1 _ WriteStream on: ''.
	temp2 _ ReadStream on: self concl.
	[
	temp1 nextPutAll: temp2 next asString.
	temp2 atEnd ifFalse: [ temp1 nextPutAll: ' ' ].
	temp2 atEnd ] whileFalse.
	^ temp1 contents.! !

!ExpertRegle methodsFor: 'accessing'!
afficheConclusions
	| temp1 temp2 temp3 |
	temp1 _ '' writeStream.
	temp2 _ self instancieConcl readStream.
	[
	temp3 _ temp2 next readStream.
	temp1 cr.
	[
	temp1 nextPutAll: temp3 next.
	temp1 space.
	temp3 atEnd ] whileFalse.
	temp2 atEnd ] whileFalse.
	^ temp1 contents.! !

!ExpertRegle methodsFor: 'accessing'!
afficheRegle
	| temp1 temp2 temp3 |
	temp1 _ WriteStream on: ''.
	temp2 _ ReadStream on: self ant.
	temp1 nextPutAll: Character cr asString.
	temp1 nextPutAll: 'e lisRegle: '.
	temp1 nextPut: $'.
	temp1 nextPutAll: self nom.
	temp1 nextPut: $'.
	temp1 nextPut: Character cr.
	temp1 nextPutAll: 'si: '''.
	[
	temp3 _ temp2 next.
	temp1 nextPutAll: temp3 printString.
	temp2 atEnd ifFalse: [ temp1 nextPut: Character cr ].
	temp2 atEnd ] whileFalse.
	temp1 nextPut: $'.
	temp1 nextPut: Character cr.
	temp1 nextPutAll: 'alors: '''.
	temp1 nextPutAll: concl printString.
	temp1 nextPut: $'.
	com ifNotNil: [
		temp1 nextPut: Character cr.
		temp1 nextPutAll: 'com: '.
		com printOn: temp1 ].
	temp1 nextPut: $..
	^ temp1 contents.! !

!ExpertRegle methodsFor: 'accessing'!
afficheRegle1
	| temp1 temp3 temp4 |
	temp1 _ ''.
	ant do: [ :argm1_5 |
		temp4 _ ''.
		argm1_5 do: [ :argm2_6 |
			temp4 _ temp4 , argm2_6 , ' ' ].
		temp1 _ temp1 , temp4 , '
	' ].
	temp3 _ ''.
	concl do: [ :argm3_5 |
		temp3 _ temp3 , argm3_5 , ' ' ].
	^ '
	Regle: ' , name , '
	si:
	' , temp1 , '
	alors:
	' , temp3.! !

!ExpertRegle methodsFor: 'accessing'!
ant
	^ ant.! !

!ExpertRegle methodsFor: 'accessing'!
ant: arg1
	ant _ arg1.! !

!ExpertRegle methodsFor: 'accessing'!
antAstring
	| temp1 temp2 |
	temp1 _ '' writeStream.
	ant do: [ :argm1_3 |
		temp1 nextPutAll: (expert faitAsString: argm1_3).
		temp1 cr ].
	^ temp1 contents.! !

!ExpertRegle methodsFor: 'accessing'!
antecedents: arg1
	self ant:
		((arg1 subStrings: '
') collect: [ :argm0_2 |
			ExpertList new: argm0_2 ]) asOrderedCollection.! !

!ExpertRegle methodsFor: 'accessing'!
com
	com ifNil: [ ^ '' ].
	^ com.! !

!ExpertRegle methodsFor: 'accessing'!
com: arg1
	com _ arg1.! !

!ExpertRegle methodsFor: 'accessing'!
commentaireRegle
	| temp1 temp2 temp3 temp4 temp5 |
	temp4 _ DrGeo allInstances last view expert.
	temp1 _ Character cr asString.
	temp2 _ temp4 regles keys sort.
	temp5 _ temp2 collect: [ :argm3_7 |
		temp5 _ temp4 regles at: argm3_7.
		temp5 name , ' >> ' , temp5 concl asString , ' modèle: ' , temp5 concl first , ' ' , (temp5 concl size - 1) asString , temp1 , '*' , temp5 com , temp1 ].
	^ temp5.! !

!ExpertRegle methodsFor: 'accessing'!
commentaireRegle: arg1
	| temp2 temp3 temp4 temp5 temp6 |
	temp5 _ DrGeo allInstances last view expert.
	temp2 _ Character cr asString.
	temp3 _ temp5 regles keys.
	temp4 _ temp5 regles keys select: [ :argm3_8 |
		argm3_8 beginsWith: arg1 asString ].
	temp4 sort.
	temp6 _ temp4 collect: [ :argm5_8 |
		temp6 _ temp5 regles at: argm5_8.
		temp6 name , ' >> ' , temp6 concl asString , ' modèle: ' , temp6 concl first , ' ' , (temp6 concl size - 1) asString , temp2 , '*' , temp6 com , temp2 ].
	^ temp6.! !

!ExpertRegle methodsFor: 'accessing'!
commentaireRegle: arg1 expert: arg2
	| temp3 temp4 temp5 temp6 |
	temp3 _ Character cr asString.
	temp4 _ arg2 regles keys.
	temp5 _ arg2 regles keys select: [ :argm2_8 |
		argm2_8 beginsWith: arg1 ].
	temp5 sort.
	temp6 _ temp5 collect: [ :argm4_8 |
		temp6 _ arg2 regles at: argm4_8.
		temp6 name , ' >> ' , temp6 concl asString , temp3 , '*' , temp6 com , temp3 ].
	^ temp6.! !

!ExpertRegle methodsFor: 'accessing'!
commentaires: arg1
	| temp2 temp3 temp4 |
	temp2 _ ExpertRegle methodDictionary.
	temp3 _ Character cr asString.
	temp4 _ temp2 keys select: [ :argm2_5 |
		(temp2 at: argm2_5) category = arg1 ].
	temp4 _ temp4 sort.
	^ temp4 collect: [ :argm4_5 |
		argm4_5 asString , '	->' , (temp2 at: argm4_5) comment asString , temp3 ].! !

!ExpertRegle methodsFor: 'accessing'!
concl
	^ concl.! !

!ExpertRegle methodsFor: 'accessing'!
concl: arg1
	| temp2 |
	temp2 _ arg1.
	temp2 isString ifTrue: [ temp2 _ ExpertList new: arg1 ].
	^ concl _ temp2.! !

!ExpertRegle methodsFor: 'accessing'!
contient: arg1 relation: arg2
	^ arg2 includes: arg1.! !

!ExpertRegle methodsFor: 'accessing'!
expert
	^ expert.! !

!ExpertRegle methodsFor: 'accessing'!
expert: arg1
	expert _ arg1.! !

!ExpertRegle methodsFor: 'accessing'!
faitsMeConcernants
	| temp1 |
	ant ifNotNil: [
		lf _ ant
			select: [ :argm0_3 |
				argm0_3 notEmpty and: [ argm0_3 notNil ]]
			thenCollect: [ :argm0_3 |
				argm0_3 first ].
		temp1 _ lf collect: [ :argm1_3 |
			temp1 _ self expert faits
				at: (argm1_3 , '-regles') asSymbol
				ifAbsent: [ Set new ].
			temp1 add: self nom.
			self expert faits
				at: (argm1_3 , '-regles') asSymbol
				put: temp1 ]].
	^ lf.! !

!ExpertRegle methodsFor: 'accessing'!
faitsMeConcernants0
	ant ifNotNil: [
		lf _ ((ant select: [ :argm0_1 |
			argm0_1 notEmpty ]) collect: [ :argm0_1 |
			argm0_1 first ]) asSet ].! !

!ExpertRegle methodsFor: 'accessing'!
findText: arg1
	self expert indTexte: arg1.! !

!ExpertRegle methodsFor: 'accessing'!
indTexte
	^ self expert indTexte.! !

!ExpertRegle methodsFor: 'accessing'!
indTexte: arg1
	self expert indTexte: arg1.! !

!ExpertRegle methodsFor: 'accessing'!
initLv
	lv _ Set new.! !

!ExpertRegle methodsFor: 'accessing'!
instancie: arg1
	^ self
		instancie: arg1
		fait: concl.! !

!ExpertRegle methodsFor: 'accessing'!
instancie: arg1 fait: arg2
	| temp3 |
	arg1 ifNil: [ ^ arg2 ].
	(arg1 isKindOf: IdentityDictionary) ifFalse: [ ^ arg2 ].
	temp3 _ arg2 do: [ :argm2_4 |
		self
			valeur: argm2_4
			vars: arg1 ].
	^ temp3.! !

!ExpertRegle methodsFor: 'accessing'!
instancieConcl
	^ (expert applatis: self lv asOrderedCollection) asSet asOrderedCollection collect: [ :argm0_1 |
		self instancie: argm0_1 ].! !

!ExpertRegle methodsFor: 'accessing'!
instancieNum: arg1
	| temp2 temp3 temp4 |
	temp3 _ ExpertList new: arg1.
	temp4 _ 0.
	temp2 _ temp3 do: [ :argm2_6 |
		(self expert floatString: argm2_6)
			ifTrue: [
				temp4 _ temp4 + 1.
				'?&' , temp4 asString ]
			ifFalse: [ argm2_6 ]].
	^ temp2.! !

!ExpertRegle methodsFor: 'accessing'!
instancieNum: arg1 fait: arg2
	| temp3 temp4 temp5 |
	temp4 _ ExpertList new: arg2.
	temp5 _ 0.
	arg1 ifNil: [ ^ arg2 ].
	(arg1 isKindOf: IdentityDictionary) ifFalse: [ ^ arg2 ].
	temp3 _ temp4 do: [ :argm4_7 |
		(self expert floatString: argm4_7)
			ifTrue: [
				temp5 _ temp5 + 1.
				'?&' , temp5 asString ]
			ifFalse: [
				self
					valeur: argm4_7
					vars: arg1 ]].
	^ temp3.! !

!ExpertRegle methodsFor: 'accessing'!
lf
	^ lf.! !

!ExpertRegle methodsFor: 'accessing'!
lf: arg1
	lf _ arg1.! !

!ExpertRegle methodsFor: 'accessing'!
lv
	^ lv asOrderedCollection.! !

!ExpertRegle methodsFor: 'accessing'!
lv: arg1
	lv _ arg1.! !

!ExpertRegle methodsFor: 'accessing'!
lvAdd: arg1
	lv ifNil: [ lv _ Set new ].
	lv add: arg1.
	^ arg1.! !

!ExpertRegle methodsFor: 'accessing'!
name
	^ name.! !

!ExpertRegle methodsFor: 'accessing'!
name: arg1
	name _ arg1.! !

!ExpertRegle methodsFor: 'accessing'!
nom
	^ name.! !

!ExpertRegle methodsFor: 'accessing'!
nom: arg1
	name _ arg1.! !

!ExpertRegle methodsFor: 'accessing'!
perform: arg1 vars: arg2
	| temp3 temp4 temp5 temp6 |
	temp3 _ arg1 removeFirst.
	temp6 _ (temp3 findBetweenSubStrs: ':') size.
	temp3 _ (temp3 asString , 'vars:') asSymbol.
	temp5 _ arg1.
	temp5 add: arg2.
	temp4 _ temp5 asArray.
	^ self
		perform: temp3
		withArguments: temp4.! !

!ExpertRegle methodsFor: 'accessing'!
predComm: arg1
	| temp2 temp3 temp4 |
	temp2 _ (ExpertRegle methodDict at: arg1 asSymbol) sourceCode.
	temp3 _ temp2
		indexOf: $"
		startingAt: 1.
	temp4 _ temp2
		indexOf: $"
		startingAt: temp3 + 1.
	^ temp2
		collect: [ :argm3_5 |
			argm3_5 ]
		from: temp3 + 1
		to: temp4 - 1.! !

!ExpertRegle methodsFor: 'accessing'!
reglesConcluant: arg1
	| temp2 temp3 temp4 |
	temp2 _ arg1.
	temp2 isString ifTrue: [ temp2 _ self expert list: temp2 ].
	temp3 _ expert regles keys.
	temp3 _ temp3 collect: [ :argm3_6 |
		expert regles at: argm3_6 asSymbol ].
	^ temp3 select: [ :argm4_6 |
		lv _ IdentityDictionary new.
		temp4 _ expert
			unifie: argm4_6 concl
			avec: temp2
			vars: lv.
		temp4 ~= false ].! !

!ExpertRegle methodsFor: 'accessing'!
renomme: arg1
	| temp2 |
	temp2 _ self nom.
	self nom: arg1.
	expert regles
		at: arg1 asSymbol
		put: self.
	expert regles removeKey: temp2 asSymbol.
	^ temp2.! !

!ExpertRegle methodsFor: 'accessing'!
varLibre: arg1 val: arg2 vars: arg3
	(arg1 isString and: [ arg1 beginsWith: '?' ]) ifTrue: [ ^ arg1 = arg2 ].
	^ false.! !

!ExpertRegle methodsFor: 'accessing'!
varLibre: arg1 vars: arg2
	arg1 asString beginsWith: '?'.
	^ (self
		valeur: arg1
		vars: arg2) = arg1.! !

!ExpertRegle methodsFor: 'accessing'!
verifAnt: arg1 vars: arg2
	| temp3 temp4 temp5 temp6 temp7 temp9 |
	neg _ false.
	cut _ false.
	temp4 _ arg1 copy.
	temp4 class ~= OrderedCollection ifTrue: [ ^ false ].
	temp6 _ OrderedCollection new.
	temp4 ifNil: [ ^ false ].
	temp5 _ temp4 first first asSymbol.
	temp5 = #!! ifTrue: [
		temp4 first removeFirst.
		cut _ true.
		temp4 first isEmpty ifFalse: [ temp5 _ temp4 first first asSymbol ]].
	temp5 = #~ ifTrue: [
		temp4 first removeFirst.
		neg _ true ].
	temp4 first isEmpty ifFalse: [ temp5 _ temp4 first first asSymbol ].
	temp5 last = $: ifTrue: [
		temp9 _ self
			perform: temp4 first copyList
			vars: arg2.
		neg ifTrue: [ temp9 _ temp9 not ].
		temp9
			ifTrue: [ temp6 _ arg2 ]
			ifFalse: [ ^ false ].
		temp4 removeFirst.
		temp4 ifEmpty: [ ^ self lvAdd: arg2 ].
		^ self
			verifAnt: temp4
			vars: arg2 ].
	temp3 _ self expert faitsAt: temp5.
	temp3 ifNil: [
		neg ifTrue: [ ^ arg2 ].
		^ false ].
	temp3 _ temp3 reject: [ :argm13_10 |
		argm13_10 retire ].
	temp6 _ temp3 collect: [ :argm14_10 |
		temp7 _ arg2 copy.
		temp9 _ self
			unifie: temp4 first
			avec: argm14_10 fait
			vars: temp7.
		temp9 ~= false ifTrue: [ temp9 _ true ].
		temp9 ifTrue: [ temp9 _ temp7 ].
		neg ifTrue: [
			temp9 ~= false
				ifTrue: [ temp9 _ false ]
				ifFalse: [ temp9 _ temp7 ]].
		temp9 ].
	neg ifTrue: [
		(temp6 includes: false) ifTrue: [ temp6 _ OrderedCollection new ]].
	temp6 _ temp6 select: [ :argm16_10 |
		(argm16_10 = false) not ].
	temp4 removeFirst.
	temp4 ifEmpty: [ ^ self lvAdd: (self applatis: temp6) ].
	^ (self applatis: temp6) collect: [ :argm19_10 |
		self
			verifAnt: temp4
			vars: argm19_10 ].! !

!ExpertRegle methodsFor: 'accessing'!
verifAntecedants
	^ self verifAntecedants: IdentityDictionary new.! !

!ExpertRegle methodsFor: 'accessing'!
verifAntecedants: arg1
	| temp2 temp3 |
	temp2 _ false.
	self initLv.
	temp3 _ self
		verifAnt: self ant copy
		vars: arg1.
	temp3 ifNil: [ ^ false ].
	temp3 = temp2 ifTrue: [ ^ false ].
	temp3 _ self applatis:
		(temp3 reject: [ :argm5_5 |
			argm5_5 = temp2 or: [ argm5_5 isNil ]]).
	temp3 _ temp3 asSet.
	temp3 _ temp3 asOrderedCollection.
	cut ifTrue: [
		cut _ false.
		temp3 ifNotEmpty: [ temp3 _ OrderedCollection with: temp3 first ]].
	^ temp3.! !

!ExpertRegle methodsFor: 'accessing'!
verifHyp
	| temp1 |
	temp1 _ self
		verifAnt: self ant
		vars: IdentityDictionary new.
	^ temp1 collect: [ :argm1_2 |
		self ant collect: [ :argm1_3 |
			self
				instancie: argm1_2
				fait: argm1_3 ]].! !

!ExpertRegle methodsFor: 'accessing'!
verifHyp: arg1
	| temp2 |
	temp2 _ self
		verifAnt: self ant
		vars: arg1.
	^ temp2 collect: [ :argm1_3 |
		self ant collect: [ :argm1_4 |
			self
				instancie: argm1_3
				fait: argm1_4 ]].! !

!ExpertRegle methodsFor: 'accessing'!
verifRegle
	^ self verifRegle: IdentityDictionary new.! !

!ExpertRegle methodsFor: 'accessing'!
verifRegle: arg1
	| temp2 temp3 |
	temp2 _ (self verifAntecedants: arg1) ifNil: [ ^ false ].
	temp2 = false ifTrue: [ ^ false ].
	temp2 ifEmpty: [ ^ true ].
	temp2 ~= false ifTrue: [
		temp3 _ temp2
			select: [ :argm3_4 |
				argm3_4 notNil and: [ argm3_4 ~= false ]]
			thenCollect: [ :argm3_4 |
				Array
					with: argm3_4
					with: (self instancie: argm3_4) ].
		temp3 do: [ :argm4_4 |
			argm4_4 ifNotEmpty: [
				self expert
					affirme: self name
					fait: argm4_4 last asString
					vars: argm4_4 first ]]].
	^ self applatis: temp3.! !

!ExpertRegle methodsFor: 'list'!
addFirst: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	(temp5 = arg1 and: [ temp5 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp7 _ self
		valeur: arg2
		vars: arg4.
	(temp7 = arg2 and: [ temp7 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp6 _ self
		valeur: arg3
		vars: arg4.
	temp5 isList ifTrue: [ ^ self
			affecte: temp6
			valeur: (temp5 addFirst: temp7)
			vars: arg4 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
addLast: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	(temp5 = arg1 and: [ temp5 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp7 _ self
		valeur: arg2
		vars: arg4.
	(temp7 = arg2 and: [ temp7 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp6 _ self
		valeur: arg3
		vars: arg4.
	temp5 isList ifTrue: [ ^ self
			affecte: temp6
			valeur: (temp5 addLast: temp7)
			vars: arg4 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
ajoute: arg1 liste: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp7 _ false.
	temp5 _ self
		valeur: arg1
		vars: arg4.
	temp5 = arg1 ifTrue: [ ^ temp7 ].
	temp6 _ self
		valeur: arg2
		vars: arg4.
	(temp6 = arg2 and: [ arg2 asString beginsWith: '?' ]) ifTrue: [ ^ temp7 ].
	temp6 _ temp6 addLast: temp5.
	^ self
		affecte: arg3
		valeur: temp6
		vars: arg4.! !

!ExpertRegle methodsFor: 'list'!
ajouteDernierUnique: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	(temp5 = arg1 and: [ temp5 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp7 _ self
		valeur: arg2
		vars: arg4.
	(temp7 = arg2 and: [ temp7 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp6 _ self
		valeur: arg3
		vars: arg4.
	temp5 isList ifTrue: [ ^ self
			affecte: temp6
			valeur: (temp5 addLastIfNotIncluded: temp7)
			vars: arg4 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
ajoutePremier: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp5 ifNil: [ ^ false ].
	temp7 _ self
		instanciedValue: arg2
		vars: arg4.
	temp7 ifNil: [ ^ false ].
	temp6 _ self
		valeur: arg3
		vars: arg4.
	temp5 isList ifTrue: [ ^ self
			affecte: temp6
			valeur: (temp5 _ temp5 addFirst: temp7)
			vars: arg4 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
ajoutePremierUnique: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	(temp5 = arg1 and: [ temp5 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp7 _ self
		valeur: arg2
		vars: arg4.
	(temp7 = arg2 and: [ temp7 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp6 _ self
		valeur: arg3
		vars: arg4.
	temp5 isList ifTrue: [ ^ self
			affecte: temp6
			valeur: (temp5 addFirstIfNotIncluded: temp7)
			vars: arg4 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
commencePar: arg1 début: arg2 vars: arg3
	| temp4 temp5 |
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	temp5 ifNil: [ ^ false ].
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 isList ifTrue: [ ^ false ].
	^ temp4 beginsWith: temp5.! !

!ExpertRegle methodsFor: 'list'!
commencePar: arg1 débutOuListe: arg2 vars: arg3
	| temp4 temp5 |
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	temp5 ifNil: [ ^ false ].
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 class = ExpertList ifTrue: [ ^ true ].
	^ temp4 beginsWith: temp5.! !

!ExpertRegle methodsFor: 'list'!
constructions: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ arg1
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	^ self
		affecte: arg2
		valeur: temp4
		vars: arg3.! !

!ExpertRegle methodsFor: 'list'!
contient: arg1 liste: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp6 _ false.
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	temp4 = arg2 ifTrue: [ ^ temp6 ].
	temp5 = arg1 ifTrue: [ ^ temp6 ].
	^ temp5 includes: temp4.! !

!ExpertRegle methodsFor: 'list'!
couples: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp4 isList ifTrue: [ ^ self
			affecte: arg2
			valeur: temp4 couples
			vars: arg3 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
dernier: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	(temp4 = arg2 and: [ temp4 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp4 isList ifTrue: [
		temp4 isEmpty ifTrue: [ ^ false ].
		^ self
			affecte: temp5
			valeur: temp4 last
			vars: arg3 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
derniers: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	(temp4 = arg1 and: [ temp4 beginsWith: '?' ]) ifTrue: [ ^ false ].
	^ self
		affecte: arg2
		valeur:
			(temp4 collect: [ :argm2_5 |
				argm2_5 last ])
		vars: arg3.! !

!ExpertRegle methodsFor: 'list'!
enleverDe: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 |
	temp8 _ false.
	temp5 _ self
		valeur: arg1
		vars: arg4.
	temp5 ifNil: [ ^ false ].
	temp6 _ self
		valeur: arg2
		vars: arg4.
	(temp5 includes: temp6) ifFalse: [ ^ false ].
	temp6 ifNil: [ ^ false ].
	temp7 _ self
		valeur: arg3
		vars: arg4.
	temp6 ifNil: [ ^ false ].
	temp9 _ temp5 reject: [ :argm8_10 |
		temp6 = argm8_10 ].
	1 = temp9 size ifTrue: [ temp9 _ temp9 first ].
	(self
		varLibre: arg2
		val: temp6
		vars: arg4) ifTrue: [ ^ temp8 ].
	((temp7 asString beginsWith: '?') and: [ temp7 = arg3 asString ]) ifTrue: [ ^ self
			affecte: temp7
			valeur: temp9
			vars: arg4 ].
	^ self
		unifie: temp7
		avec: temp9
		vars: arg4.! !

!ExpertRegle methodsFor: 'list'!
excludes: arg1 el: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	^ (temp4 includes: temp5) not.! !

!ExpertRegle methodsFor: 'list'!
élément: arg1 à: arg2 rep: arg3 vars: arg4
	| temp5 temp6 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	(temp5 = arg1 and: [ temp5 beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	^ self
		affecte: arg3
		valeur: (temp5 at: temp6 asNumber)
		vars: arg4.! !

!ExpertRegle methodsFor: 'list'!
includes: arg1 el: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	^ temp4 includes: temp5.! !

!ExpertRegle methodsFor: 'list'!
index: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 |
	temp8 _ false.
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp5 ifNil: [ ^ temp8 ].
	temp5 isList ifFalse: [
		temp10 _ ExpertList new.
		temp10 add: temp5 asSymbol.
		temp5 _ temp10 ].
	temp5 isList.
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	temp6 ifNil: [ ^ temp8 ].
	temp7 _ self
		valeur: arg3
		vars: arg4.
	temp9 _ temp5 index: temp6.
	temp9 ifNotNil: [ ^ self
			affecte: arg3
			valeur: temp9
			vars: arg4 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
joint: arg1 avec: arg2 rep: arg3 vars: arg4
	| temp5 temp6 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	temp6 _ self
		valeur: arg2
		vars: arg4.
	^ self
		affecte: arg3
		valeur: (temp5 append: temp6)
		vars: arg4.! !

!ExpertRegle methodsFor: 'list'!
justeAprès: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 |
	temp8 _ false.
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp5 ifNil: [ ^ temp8 ].
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	temp6 ifNil: [ ^ temp8 ].
	temp7 _ self
		valeur: arg3
		vars: arg4.
	temp9 _ (temp5 asArray indexOf: temp6) + 1.
	temp9 <= temp5 asArray size ifTrue: [ ^ self
			affecte: arg3
			valeur: (temp5 at: temp9)
			vars: arg4 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
justeAvant: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 |
	temp8 _ false.
	temp5 _ self
		instanciedValue: arg1
		vars: arg4.
	temp5 ifNil: [ ^ temp8 ].
	temp6 _ self
		instanciedValue: arg2
		vars: arg4.
	temp6 ifNil: [ ^ temp8 ].
	temp7 _ self
		valeur: arg3
		vars: arg4.
	temp9 _ (temp5 asArray indexOf: temp6) - 1.
	temp9 > 0 ifTrue: [ ^ self
			affecte: arg3
			valeur: (temp5 at: temp9)
			vars: arg4 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
min: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ temp4 min.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'list'!
nonContient: arg1 el: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	(temp4 isNil or: [ temp5 isNil ]) ifTrue: [ ^ false ].
	(temp4 isKindOf: ByteSymbol) ifTrue: [ ^ (temp4 asString indexOf: (temp5 at: 1)) > 0 ].
	^ (temp4 includes: temp5) not.! !

!ExpertRegle methodsFor: 'list'!
nonTousPositifs: arg1 vars: arg2
	| temp3 |
	temp3 _ self
		valeur: arg1
		vars: arg2.
	(temp3 = arg1 and: [ temp3 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp3 isList ifFalse: [ ^ false ].
	^ (temp3 all: [ :argm3_4 |
		argm3_4 > 0 ]) not.! !

!ExpertRegle methodsFor: 'list'!
premier: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	(temp4 = arg2 and: [ temp4 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp4 isEmpty ifTrue: [ ^ false ].
	temp5 _ self
		valeur: arg2
		vars: arg3.
	temp4 isList ifTrue: [
		temp4 isEmpty ifTrue: [ ^ false ].
		^ self
			affecte: temp5
			valeur: temp4 first
			vars: arg3 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
premiers: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	(temp4 isString and: [
		temp4 = arg1 and: [ temp4 asString beginsWith: '?' ]]) ifTrue: [ ^ false ].
	^ self
		affecte: arg2
		valeur:
			(temp4 collect: [ :argm2_5 |
				argm2_5 isList
					ifTrue: [ argm2_5 first ]
					ifFalse: [ (ExpertList new: (self expert verifieCondition: 'segment ' , argm2_5 , ' ?s')) allButLast allButLast last first asString ]])
		vars: arg3.! !

!ExpertRegle methodsFor: 'list'!
saufDernier: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	temp4 size = 1 ifFalse: [ ^ self
			affecte: temp5
			valeur: temp4 allButLast
			vars: arg3 ].
	^ self
		affecte: temp5
		valeur: ExpertList new
		vars: arg3.! !

!ExpertRegle methodsFor: 'list'!
saufPremier: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	(temp4 = arg2 and: [ temp4 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp4 isList ifTrue: [ ^ self
			affecte: temp5
			valeur: temp4 allButFirst
			vars: arg3 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
somme: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNotNil: [ ^ self
			affecte: arg2
			valeur: temp4 sum
			vars: arg3 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
sort: arg1 block: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp6 _ false.
	temp5 _ self
		valeur: arg1
		vars: arg4.
	(temp5 = arg1 and: [ temp5 asString beginsWith: '?' ]) ifFalse: [
		(arg3 asString beginsWith: '?') ifTrue: [
			temp7 _ temp5 sort: arg2.
			^ self
				affecte: arg3
				valeur: temp7
				vars: arg4 ].
		^ temp7 = arg1 ].
	^ temp6.! !

!ExpertRegle methodsFor: 'list'!
taille: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	(temp4 = arg2 and: [ temp4 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp4 isList ifTrue: [
		temp4 isEmpty ifTrue: [ ^ self
				affecte: temp5
				valeur: 0
				vars: arg3 ].
		^ self
			affecte: temp5
			valeur: temp4 size
			vars: arg3 ].
	^ false.! !

!ExpertRegle methodsFor: 'list'!
tousNégatifs: arg1 vars: arg2
	| temp3 |
	temp3 _ self
		valeur: arg1
		vars: arg2.
	(temp3 = arg1 and: [ temp3 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp3 isList ifFalse: [ ^ false ].
	^ temp3 all: [ :argm3_4 |
		argm3_4 asNumber < 0 ].! !

!ExpertRegle methodsFor: 'list'!
tousPositifs: arg1 vars: arg2
	| temp3 |
	temp3 _ self
		valeur: arg1
		vars: arg2.
	(temp3 = arg1 and: [ temp3 asString beginsWith: '?' ]) ifTrue: [ ^ false ].
	temp3 isList ifFalse: [ ^ false ].
	^ temp3 all: [ :argm3_4 |
		argm3_4 asNumber > 0 ].! !

!ExpertRegle methodsFor: 'list'!
triePointsSur: arg1 droite: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 |
	temp6 _ false.
	temp9 _ self
		valeur: arg2
		vars: arg4.
	temp9 isList ifTrue: [ ^ false ].
	temp8 _ self expert drgeo domain factory pool.
	temp10 _ [ :argm4_11 |
	temp8
		detect: [ :argm4_12 |
			argm4_11 = argm4_12 name ]
		ifNone: [ ]].
	temp9 _ temp10 value: temp9.
	temp9 ifNil: [ ^ false ].
	temp5 _ self
		valeur: arg1
		vars: arg4.
	(temp5 = arg1 and: [ temp5 asString beginsWith: '?' ]) ifFalse: [
		(arg3 asString beginsWith: '?') ifTrue: [
			temp7 _ temp5 sort: [ :argm8_11 :argm8_12 |
				(temp9 abscissaOf: (temp10 value: argm8_11) point) < (temp9 abscissaOf: (temp10 value: argm8_12) point) ]].
		^ self
			affecte: arg3
			valeur: temp7
			vars: arg4 ].
	^ temp6.! !

!ExpertRegle methodsFor: 'miscellaneous'!
ajouteDernier: arg1 el: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 |
	temp6 _ nil.
	temp7 _ nil.
	temp8 _ false.
	temp5 _ self
		valeur: arg1
		vars: arg4.
	(temp5 = arg1 and: [ temp5 asString beginsWith: '?' ]) ifFalse: [
		temp7 _ self
			valeur: arg2
			vars: arg4 ].
	(temp7 = arg2 and: [ temp7 asString beginsWith: '?' ]) ifFalse: [
		temp6 _ self
			valeur: arg3
			vars: arg4 ].
	temp5 isList ifTrue: [
		temp8 _ self
			affecte: temp6
			valeur: (temp5 addLast: temp7)
			vars: arg4 ].
	^ temp8.! !

!ExpertRegle methodsFor: 'miscellaneous'!
alignés: arg1 avec: arg2 et: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp12 temp14 temp15 |
	temp12 _ self
		valeur: arg1
		vars: arg4.
	temp14 _ self
		valeur: arg2
		vars: arg4.
	temp15 _ self
		valeur: arg3
		vars: arg4.
	((temp12 beginsWith: '?') and: [ arg1 = temp12 ]) ifTrue: [ ^ false ].
	((temp14 beginsWith: '?') and: [ arg2 = temp14 ]) ifTrue: [ ^ false ].
	((temp15 beginsWith: '?') and: [ arg3 = temp15 ]) ifTrue: [ ^ false ].
	temp8 _ DrGeoFigure viewLess.
	temp8 drgeo: self expert drgeo app.
	temp9 _ temp8 drgeo area submorphs select: [ :argm8_16 |
		DrGPointMorph = argm8_16 class ].
	temp12 _ temp9
		detect: [ :argm9_16 |
			temp12 = argm9_16 costume name ]
		ifNone: [ ^ false ].
	temp14 _ temp9
		detect: [ :argm10_16 |
			temp14 = argm10_16 costume name ]
		ifNone: [ ^ false ].
	temp15 _ temp9
		detect: [ :argm11_16 |
			temp15 = argm11_16 costume name ]
		ifNone: [ ^ false ].
	temp5 _ temp12 costume mathItem point.
	temp6 _ temp14 costume mathItem point.
	temp7 _ temp15 costume mathItem point.
	temp10 _ temp7 - temp6.
	0 ~= temp10 x ifTrue: [
		temp11 _ temp10 y / temp10 x.
		^ temp5 = (temp5 x - temp7 x @ (temp7 y + (temp11 * temp5 x))) ].
	^ temp5 x = temp6 x and: [ temp5 x = temp7 x ].! !

!ExpertRegle methodsFor: 'miscellaneous'!
asLowerCase: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ (self
		instanciedValue: arg1
		vars: arg3) asLowercase.
	self
		affecte: arg2
		valeur: temp4
		vars: arg3.
	^ true.! !

!ExpertRegle methodsFor: 'miscellaneous'!
compteFaits: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ ((self expert
		verifieFait: arg1
		vars: arg3) select: [ :argm0_5 |
		argm0_5 first notNil ]) size.
	^ self
		affecte: arg2
		valeur: temp4 asString
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
contraire: arg1 mot: arg2 rep: arg3 vars: arg4
	| temp5 temp6 |
	temp5 _ self
		instanciedValue: arg2
		vars: arg4.
	temp6 _ self
		instanciedValue: arg1
		vars: arg4.
	^ self expert
		affecte: arg3
		valeur: arg1
		vars: arg4.! !

!ExpertRegle methodsFor: 'miscellaneous'!
créeNom: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp4 _ temp4 makeNom.
	^ self
		affecte: arg2
		valeur: temp4
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
créeNomMin: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp4 _ temp5 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ temp5 permuteMin.
	temp7 _ temp5 last.
	temp6 _ temp5 allButFirst first.
	temp6 > temp7 ifTrue: [ ^ false ].
	temp5 _ temp5 makeNom.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
créeNomUnique: arg1 rep: arg2 vars: arg3
	^ self expert
		affecte: arg2
		valeur: arg1 , self gensym asString
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
different: arg1 de: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 temp10 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	(temp5 isNil or: [ temp4 isNil ]) ifTrue: [ ^ false ].
	(temp4 isNumber and: [ temp5 isNumber ]) ifTrue: [ ^ (temp4 - temp5) abs > 0.001 ].
	^ temp4 ~= temp5.! !

!ExpertRegle methodsFor: 'miscellaneous'!
direction: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp6 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp7 _ temp6
		detect: [ :argm3_8 |
			temp4 = argm3_8 name ]
		ifNone: [ ^ false ].
	temp5 _ temp7 direction.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
distance: arg1 a: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 temp12 |
	temp10 _ self
		valeur: arg1
		vars: arg4.
	temp12 _ self
		valeur: arg2
		vars: arg4.
	temp8 _ self
		valeur: arg3
		vars: arg4.
	((temp10 beginsWith: '?') and: [ arg1 = temp10 ]) ifTrue: [ ^ false ].
	((temp12 beginsWith: '?') and: [ arg2 = temp12 ]) ifTrue: [ ^ false ].
	temp9 _ self expert drgeo app.
	temp6 _ temp9 costumes.
	temp10 _ temp6
		detect: [ :argm7_13 |
			temp10 = argm7_13 mathItem name ]
		ifNone: [ ^ false ].
	temp12 _ temp6
		detect: [ :argm8_13 |
			temp12 = argm8_13 mathItem name ]
		ifNone: [ ^ false ].
	temp10 _ temp10 mathItem point.
	temp12 _ temp12 mathItem point.
	temp7 _ temp10 distanceTo: temp12.
	^ self
		affecte: temp8
		valeur: temp7
		vars: arg4.! !

!ExpertRegle methodsFor: 'miscellaneous'!
distance: arg1 à: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 temp8 temp9 temp10 temp12 |
	temp10 _ self
		valeur: arg1
		vars: arg4.
	temp12 _ self
		valeur: arg2
		vars: arg4.
	temp8 _ self
		valeur: arg3
		vars: arg4.
	temp10 isString ifTrue: [
		((temp10 beginsWith: '?') and: [ arg1 = temp10 ]) ifTrue: [ ^ false ]].
	temp12 isString ifTrue: [
		((temp12 beginsWith: '?') and: [ arg2 = temp12 ]) ifTrue: [ ^ false ]].
	temp9 _ self expert drgeo app.
	temp6 _ temp9 costumes.
	temp10 _ temp6
		detect: [ :argm7_13 |
			temp10 = argm7_13 mathItem name ]
		ifNone: [ ^ false ].
	temp12 _ temp6
		detect: [ :argm8_13 |
			temp12 = argm8_13 mathItem name ]
		ifNone: [ ^ false ].
	temp10 _ temp10 mathItem point.
	temp12 _ temp12 mathItem point.
	temp7 _ temp10 distanceTo: temp12.
	^ self
		affecte: temp8
		valeur: temp7
		vars: arg4.! !

!ExpertRegle methodsFor: 'miscellaneous'!
extrémité: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp6 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp7 _ temp6 detect: [ :argm3_8 |
		temp4 = argm3_8 name ].
	temp5 _ temp7 parents last name.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
égaux: arg1 et: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp5 _ self
		instanciedValue: arg2
		vars: arg3.
	(temp5 notNil and: [ temp4 notNil ]) ifTrue: [ ^ temp4 = temp5 ].
	(temp4 isNil and: [ temp5 notNil ]) ifTrue: [
		temp5 isList ifTrue: [ temp5 _ ExpertList new: '[ [  ' , temp5 printString , ' ] ]' ].
		^ self
			unifie: arg1
			avec: temp5
			vars: arg3 ].
	(temp5 isNil and: [ temp4 notNil ]) ifTrue: [
		temp4 isList ifTrue: [ temp4 _ ExpertList new: '[ [  ' , temp4 printString , ' ] ]' ].
		^ self
			unifie: arg2
			avec: temp4
			vars: arg3 ].
	^ false.! !

!ExpertRegle methodsFor: 'miscellaneous'!
instanciedValue: arg1 vars: arg2
	| temp3 |
	temp3 _ self
		valeur: arg1
		vars: arg2.
	((arg1 asString beginsWith: '?') and: [ temp3 = arg1 ]) ifTrue: [ ^ nil ].
	^ temp3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
max: arg1 rep: arg2 vars: arg3
	| temp4 temp5 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ temp4 max.
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
membre: arg1 liste: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 temp8 temp9 |
	temp7 _ temp8 domain factory pool.
	temp6 _ false.
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp5 _ self
		valeur: arg2
		vars: arg3.
	temp4 = arg1 ifTrue: [
		temp9 _ temp7 select: [ :argm4_10 |
			argm4_10 isKindOf: DrGPointFreeItem ].
		temp9 do: [ :argm5_10 |
			self
				affecte: temp9
				valeur: argm5_10
				vars: arg3 ].
		^ true ].
	temp5 = arg2 ifTrue: [ ^ temp6 ].
	^ temp5 includes: temp4.! !

!ExpertRegle methodsFor: 'miscellaneous'!
minMot: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		valeur: arg1
		vars: arg3.
	temp4 = arg1 ifTrue: [ ^ false ].
	^ self
		affecte: arg2
		valeur: temp4 min
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
minimum: arg1 rep: arg2 vars: arg3
	| temp4 |
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	^ self
		affecte: arg2
		valeur: (self minimum: temp4)
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
mot: arg1 et: arg2 et: arg3 rep: arg4 vars: arg5
	| temp6 temp7 temp8 |
	temp6 _ self
		valeur: arg1
		vars: arg5.
	temp7 _ self
		valeur: arg2
		vars: arg5.
	temp8 _ self
		valeur: arg3
		vars: arg5.
	^ self
		affecte: arg4
		valeur: temp6 asString , temp7 asString , temp8 asString
		vars: arg5.! !

!ExpertRegle methodsFor: 'miscellaneous'!
mot: arg1 et: arg2 rep: arg3 vars: arg4
	| temp5 temp6 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	temp6 _ self
		valeur: arg2
		vars: arg4.
	^ self
		affecte: arg3
		valeur: temp5 asString , temp6 asString
		vars: arg4.! !

!ExpertRegle methodsFor: 'miscellaneous'!
objet: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp6 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp5 _ temp6 detect: [ :argm3_7 |
		temp4 = argm3_7 name ].
	^ self
		affecte: arg2
		valeur: temp5
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
ordonneMot: arg1 et: arg2 rep1: arg3 rep2: arg4 vars: arg5
	| temp6 temp7 temp8 temp9 temp10 temp11 |
	((temp8 _ temp6 _ arg1) isList and: [ (temp9 _ temp7 _ arg2) isList ])
		ifTrue: [
			temp6 _ arg1 instancie: arg5.
			temp7 _ arg2 instancie: arg5.
			(temp6 select: [ :argm2_12 |
				(self
					instanciedValue: argm2_12
					vars: lv) = nil ]) notEmpty ifTrue: [ ^ false ].
			(temp7 select: [ :argm3_12 |
				(self
					instanciedValue: argm3_12
					vars: lv) = nil ]) notEmpty ifTrue: [ ^ false ]]
		ifFalse: [
			temp8 _ temp6 _ self
				valeur: arg1
				vars: arg5.
			temp8 isList ifFalse: [
				(temp8 = arg1 and: [ arg1 beginsWith: '?' ]) ifTrue: [ ^ false ]].
			temp9 _ temp7 _ self
				valeur: arg2
				vars: arg5.
			temp9 isList ifFalse: [
				(temp9 = arg1 and: [ arg2 beginsWith: '?' ]) ifTrue: [ ^ false ]]].
	(temp6 isNumber and: [ temp7 isNumber ]) ifTrue: [
		temp6 > temp7 ifTrue: [ ^ (self
				affecte: arg3
				valeur: temp6
				vars: arg5) and: [
				self
					affecte: arg4
					valeur: temp7
					vars: arg5 ]].
		^ (self
			affecte: arg3
			valeur: temp7
			vars: arg5) and: [
			self
				affecte: arg4
				valeur: temp6
				vars: arg5 ]].
	(temp10 _ temp6) isList ifTrue: [ temp10 _ temp6 printString ].
	(temp11 _ temp7) isList ifTrue: [ temp11 _ temp7 printString ].
	temp10 asString < temp11 asString ifTrue: [ ^ (self
			affecte: arg3
			valeur: temp6
			vars: arg5) and: [
			self
				affecte: arg4
				valeur: temp7
				vars: arg5 ]].
	^ (self
		affecte: arg3
		valeur: temp7
		vars: arg5) and: [
		self
			affecte: arg4
			valeur: temp6
			vars: arg5 ].! !

!ExpertRegle methodsFor: 'miscellaneous'!
ordonneMot: arg1 et: arg2 rep: arg3 vars: arg4
	| temp5 temp6 temp7 |
	temp5 _ self
		valeur: arg1
		vars: arg4.
	temp6 _ self
		valeur: arg2
		vars: arg4.
	temp5 isList and: [ temp6 isList ].
	temp7 _ {temp5. temp6} sort: [ :argm3_8 :argm3_9 |
		argm3_8 < argm3_9 ].
	^ self
		affecte: arg3
		valeur: temp7 first , temp7 last
		vars: arg4.! !

!ExpertRegle methodsFor: 'miscellaneous'!
renomme: arg1 nom: arg2 vars: arg3
	| temp4 temp5 temp6 temp7 |
	temp5 _ self expert drgeo domain factory pool.
	temp4 _ self
		instanciedValue: arg1
		vars: arg3.
	temp6 _ self
		instanciedValue: arg2
		vars: arg3.
	temp4 ifNil: [ ^ false ].
	temp6 ifNil: [ ^ false ].
	temp7 _ temp5
		detect: [ :argm5_8 |
			temp4 = argm5_8 name ]
		ifNone: [ ^ true ].
	temp7 name: temp6.
	^ true.! !

!ExpertRegle methodsFor: 'miscellaneous'!
retablitFait: arg1 vars: arg2
	| temp3 |
	temp3 _ self expert
		instancie: arg1
		vars: arg2.
	^ self expert
		retablitFait: temp3
		regle: self name.! !

!ExpertRegle methodsFor: 'miscellaneous'!
retireFait: arg1 vars: arg2
	| temp3 |
	temp3 _ self expert
		instancie: arg1
		vars: arg2.
	^ self expert
		retireFait: temp3
		regle: self name.! !

!ExpertRegle methodsFor: 'miscellaneous'!
sort: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp5 _ false.
	temp4 _ self
		valeur: arg1
		vars: arg3.
	(temp4 = arg1 and: [ temp4 asString beginsWith: '?' ]) ifFalse: [
		(arg2 asString beginsWith: '?') ifTrue: [
			temp6 _ temp4 sort.
			^ self
				affecte: arg2
				valeur: temp6
				vars: arg3 ].
		^ temp6 = arg1 ].
	^ temp5.! !

!ExpertRegle methodsFor: 'miscellaneous'!
suivant: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp6 _ false.
	temp4 _ self
		valeur: arg1
		vars: arg3.
	(temp4 = arg1 and: [ temp4 beginsWith: '?' ]) ifTrue: [ ^ temp6 ].
	temp5 _ self
		valeur: arg1
		vars: arg3.
	(temp5 = arg1 and: [ temp4 beginsWith: '?' ]) ifTrue: [ ^ temp6 ].
	^ self
		affecte: arg2
		valeur: temp4 , self gensym asString
		vars: arg3.! !

!ExpertRegle methodsFor: 'miscellaneous'!
total: arg1 vars: arg2
	| temp3 temp4 temp5 temp7 |
	temp3 _ arg1 reverse asOrderedCollection.
	temp4 _ temp3 removeFirst.
	temp3 _ temp3 reverse.
	temp5 _ 0.
	temp3 do: [ :argm4_8 |
		temp7 _ (self
			valeur: argm4_8
			vars: arg2) asNumber.
		temp5 _ temp5 + temp7 ].
	^ self
		affecte: temp4
		valeur: temp5
		vars: arg2.! !

!ExpertRegle methodsFor: 'miscellaneous'!
tousDifferents: arg1 vars: arg2
	| temp3 |
	temp3 _ self
		valeur: arg1
		vars: arg2.
	((arg1 isString and: [ arg1 beginsWith: '?' ]) and: [ temp3 = arg1 ]) ifTrue: [ ^ false ].
	temp3 isList ifTrue: [ ^ temp3 tousDifferents ].
	^ false.! !

!ExpertRegle methodsFor: 'miscellaneous'!
trie: arg1 rep: arg2 vars: arg3
	| temp4 temp5 temp6 |
	temp5 _ false.
	temp4 _ self
		valeur: arg1
		vars: arg3.
	(temp4 = arg1 and: [ temp4 asString beginsWith: '?' ]) ifFalse: [
		(arg2 asString beginsWith: '?') ifTrue: [
			temp6 _ temp4 sort.
			^ self
				affecte: arg2
				valeur: temp6
				vars: arg3 ].
		^ temp6 = arg1 ].
	^ temp5.! !

!ExpertRegle class methodsFor: 'rules'!
Electricite: arg1
	arg1 initRegles.
	ExpertRegle interfaceElectricite: arg1.
	ExpertRegle ohmRegles: arg1.
	ExpertRegle circuitRegles: arg1.! !

!ExpertRegle class methodsFor: 'rules'!
Epidémie: arg1
	arg1 initRegles.
	arg1
		lisRegle: 'interface-Arc3pts'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc3pts ?a ?p1 ?p2 ?p3'
		com: 'Lecture d''un fait sur la figure: arc de p1 à p2 à p3'.
	arg1
		lisRegle: 'interface-Textes'
		si: 'DrGTextItem ?txt ?act ?x'
		alors: '?act ?x'
		com: 'Lecture d''un texte affirmation sur la figure'.
	arg1
		lisRegle: 'ami'
		si: 'arc3pts ?n ?x ?p ?y'
		alors: 'ami ?x ?y '
		com: 'Relation ami selon les arcs dessinés'.
	arg1
		lisRegle: 'infecte1'
		si: 'ami ?x ?y
~ confiné ?x
infecté ?y'
		alors: 'infecté ?x'
		com: 'Infection de x. Si contact avec un ami infecté et non confiné alors: infection.'.
	arg1
		lisRegle: 'infecte2'
		si: 'ami ?x ?y
~ confiné ?y
infecté ?x'
		alors: 'infecté ?y'
		com: 'Infection de y. Si contact avec un ami infecté et non confiné alors: infection.'.
	arg1
		lisRegle: 'marqueInfecté0'
		si: 'infecté0 ?x
couleurPoint:couleur: ?x magenta'
		alors: 'infecté ?x'
		com: 'Un infecté0 est un infecté; marque en noir un infecté0'.
	arg1
		lisRegle: 'marqueInfecté'
		si: 'infecté ?x
~ infecté0 ?x
couleurPoint:couleur: ?x bleu'
		alors: 'marque ?x infecté'
		com: 'Marque en bleu les personnes infectées.'.
	arg1
		lisRegle: 'marqueConfiné'
		si: 'confiné ?x 
couleurPoint:couleur: ?x vert '
		alors: 'marque ?x confiné '
		com: 'Marque en vert les personnes confinées.'.
	arg1
		lisRegle: 'personne1'
		si: 'ami ?x ?y'
		alors: 'personne ?y'
		com: 'X est une personne.'.
	arg1
		lisRegle: 'personne2'
		si: 'ami ?x ?y'
		alors: 'personne ?x'
		com: 'Y est une personne.'.! !

!ExpertRegle class methodsFor: 'rules'!
Euclide: arg1
	arg1 initRegles.
	arg1 retablit: false.
	ExpertRegle interface: arg1.
	ExpertRegle relations: arg1.
	ExpertRegle mesure: arg1.
	ExpertRegle egalites: arg1.
	ExpertRegle objetsSur: arg1.
	ExpertRegle isometrieRegles: arg1.
	ExpertRegle paralPerpRegles: arg1.
	ExpertRegle polygones: arg1.
	ExpertRegle figuresRectilignes: arg1.
	ExpertRegle figuresNonRectilignes: arg1.
	ExpertRegle translations: arg1.
	ExpertRegle homothétie: arg1.
	ExpertRegle angles: arg1.
	ExpertRegle symetrieCentrale: arg1.
	ExpertRegle symetrieAxiale: arg1.! !

!ExpertRegle class methodsFor: 'rules'!
EuclideMinimum: arg1
	arg1 initRegles.
	arg1 retablit: false.
	ExpertRegle interface: arg1.
	ExpertRegle relations: arg1.
	ExpertRegle mesure: arg1.
	ExpertRegle egalites: arg1.
	ExpertRegle objetsSur: arg1.
	ExpertRegle isometrieRegles: arg1.
	ExpertRegle paralPerpRegles: arg1.
	ExpertRegle polygones: arg1.
	ExpertRegle figuresRectilignes: arg1.! !

!ExpertRegle class methodsFor: 'rules'!
Famille: arg1
	arg1 initRegles.
	arg1
		lisRegle: 'parents'
		si: 'père  ?p
mère  ?m
enfants ?m ?p ?e'
		alors: 'parents ?e ?m  ?p'
		com: 'Les parents d''un enfant sont son père et sa mère'.
	arg1
		lisRegle: 'frèreOuSoeur'
		si: 'parents ?e1 ?p  ?m
parents ?e2  ?p  ?m
different:de: ?e1 ?e2'
		alors: 'frèreOuSoeur ?e1 ?e2'.
	arg1
		lisRegle: 'parents2'
		si: 'père  ?p
mère  ?m
enfants ?m ?p [ ?x1 ?x2 ]'
		alors: 'parents [ ?x1 ?x2 ] ?m  ?p'
		com: 'Les parents d''un enfant sont son père et sa mère'.! !

!ExpertRegle class methodsFor: 'rules'!
angles: arg1
	arg1
		lisRegle: 'angles-alignés'
		si: 'alignement ?al
angle0 [  ?x1 ?x2 ?x3 ]
contient:el: ?al ?x1
contient:el: ?al ?x2
contient:el: ?al ?x3'
		alors: 'angle0 [ classement:  plat ]'
		com: 'Si les trois points qui définissent un angle sont alignés, l''angle est plat'.
	arg1
		lisRegle: 'angles-equivalent'
		si: 'angle0 [ ?x1 ?o ?x2 ]
pointSur ?d1 ?x1
pointSur  ?d2 ?x2
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?dd1 ?dd2
intersection ?o ?dd1 ?dd2
position ?x1 ?pos1 ?o ?d1
position ?x2 ?pos2 ?o ?d2
pointSur ?d1 ?x3
pointSur ?d2 ?x4
position ?x3 ?pos1 ?o ?d1
position ?x4 ?pos2 ?o ?d2
relationCrée:et:nom: [ ?x1 ?o ?x2 ] [ ?x3 ?o ?x4 ] équivalent'
		alors: 'relationCréée  [ ?x1 ?o ?x2 ] [ ?x3 ?o ?x4 ]  équivalent'
		com: 'Des angles de même sommet et avec des extrémités sur les mêmes droites et les mêmes positions sont équivalents.'.
	arg1
		lisRegle: 'angles-inscrit'
		si: 'angle0 [ ?p1 ?s ?p2 ] [ plusProche ]
cercle ?c
pointSur ?c ?p1
pointSur ?c ?p2
pointSur ?c ?s'
		alors: 'angle0  [ ?p1 ?s ?p2 ]  [ Inscrit: ?c ]'
		com: 'Un angle inscrit dans un cercle a son sommet sur le cercle et ses côtés interceptent le cercle.'.
	arg1
		lisRegle: 'angles-inscritsIsométrique'
		si: 'angle0  [ ?p1 ?s1 ?p2 ]  [ Inscrit: ?c ]
angle0  [ ?p1 ?s2 ?p2 ]  [ Inscrit: ?c ]
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
different:de: ?s1 ?s2
relationCrée:et:nom:   [ ?p1 ?ss1 ?p2 ]  [ ?p1 ?ss2 ?p2 ] isométrique'
		alors: 'relationCréée  [ ?p1 ?ss1 ?p2 ]  [ ?p1 ?ss2 ?p2 ] isométrique'
		com: 'Des angles inscrits  dans un  même cercle et interceptant le même arc sont isométriques'.
	arg1
		lisRegle: 'angles-inscritsIsométriqueClassement'
		si: ' angle0  ?a1 [ ?cl ]
angle0 ?a2
contient:el: [ aigu droit obtus  ] ?cl
relation:et:nom: ?a1 ?a2 isométrique
different:de: ?a1 ?a2'
		alors: 'angle0 ?a2 [ ?cl ]'
		com: ''.
	arg1
		lisRegle: 'angles-AuCentre1'
		si: 'cercle ?c [ centre: ?o ]
angle0 [ ?p1 ?o ?p2 ] [ plusProche ]
pointSur ?c ?p1
pointSur ?c ?p2
pointSur ?c ?s'
		alors: 'angle0  [ ?p1 ?s ?p2 ]  [ AuCentre:  ?c ]'
		com: 'Un angle au centre d''un cercle a son sommet au centre du  cercle et ses côtés interceptent le cercle.'.
	arg1
		lisRegle: 'angles-inscritIsométrie'
		si: 'angle0   [  ?x1 ?s1 ?y1 ]  [ Inscrit: ?c ]
angle0   [  ?x2 ?s2 ?y2 ]  [ Inscrit: ?c ]
ordonneMot:et:rep1:rep2:   [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ]  [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ] 
relationCrée:et:nom:  [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ] isométrique
different:de: [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ]'
		alors: 'relationCréée [  ?x1 ?s1 ?y1 ] [  ?x2 ?s2 ?y2 ] isométrique'
		com: 'Des angle inscrit dans un cercle qui interceptent le cercle sur les mêmes points sont isométriques.'.
	arg1
		lisRegle: 'angles-AuCentre'
		si: 'angle0 [  ?x ?o ?y ] 
cercle ?c [ centre: ?o ]
pointSur ?c ?x
pointSur ?c ?y'
		alors: 'angle0 [  ?x ?o ?y ]  [ AuCentre: ?c ]'
		com: 'Un angle au centre  son sommet au centre d''un cercle et ses côtés interceptent le cercle.'.
	arg1
		lisRegle: 'angles-ClassementDroit1'
		si: ' perpendiculaire [ ?x1 ?y1 ] [ ?x2 ?y2 ]
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
	arg1
		lisRegle: 'angles-ClassementDroit2'
		si: ' perpendiculaire [ ?x1 ?y1 ] [ ?x2 ?y2 ]
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
relation:et:nom: [ ?rep2 ?I ?rep1  ] [ ?x  ?I ?y ] équivalent'
		alors: 'angle0  [ ?x  ?I ?y ] [ classement: droit ]'
		com: 'L''angle entre des droites perpendiculaires est classé angle droit.'.
	arg1
		lisRegle: 'angles-angleDefA'
		si: 'angle0 [ ?p1 ?o ?p2 ]
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
	arg1
		lisRegle: 'angles-plusProche2'
		si: 'angle0  [ ?x1  ?O ?x2 ] [ plusProche ]
pointsConfondus  ?x3 ?x1
contient:el: [  ?x3 ?x1 ] ?x1
enleverDe:el:rep: [ ?x3 ?x1 ] ?x1 ?ang'
		alors: 'angle0 [ ?ang ?O ?x2 ] [ plusProche ]'
		com: 'Autre angle plus proche avec des points confondus'.
	arg1
		lisRegle: 'angles-plusProche3'
		si: 'angle0  [ ?x1  ?O ?x2 ] [ plusProche ]
pointsConfondus  ?x3 ?x2
contient:el: [  ?x3 ?x2 ] ?x2
enleverDe:el:rep: [ ?x3 ?x2 ] ?x2 ?ang'
		alors: 'angle0 [ ?x1 ?O ?ang ] [ plusProche ]'
		com: 'Autre angle plus proche avec des points confondus'.
	arg1
		lisRegle: 'angles-angleDef1ApAv'
		si: 'sorteDeDroite ?d1
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
		alors: '  angle0 [ ?apO1 ?O ?avO2 ] [ plusProche ]'
		com: 'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
	arg1
		lisRegle: 'angles-angleDef2AvAv'
		si: 'sorteDeDroite ?d1
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
		alors: 'angle0 [ ?avO1 ?O ?avO2 ] [ plusProche ]'
		com: 'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
	arg1
		lisRegle: 'angles-angleDef3AvAp'
		si: 'sorteDeDroite ?d1
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
		alors: 'angle0 [ ?avO1 ?O ?apO2 ] [ plusProche ]'
		com: 'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
	arg1
		lisRegle: 'angles-angleDef4ApAp'
		si: 'sorteDeDroite ?d1
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
		alors: 'angle0 [ ?apO1 ?O ?apO2 ] [ plusProche ]'
		com: 'Angle non plat défini par la position de ses extrémités les plus proches du sommet'.
	arg1
		lisRegle: 'angles-angleDeBaseNonplats'
		si: 'angle0 [ ?p1 ?o ?p2 ] [ plusProche ]
aireTriangle:avec:avec:rep:  ?p1 ?o ?p2 ?res
abs:rep: ?res ?absres
supérieur:à: ?absres  1e-10'
		alors: 'angle0 [ ?p1 ?o ?p2 ]'
		com: 'Angle non plat sans ses propriétés et avec les extrémités les plus proches du sommet.'.
	arg1
		lisRegle: 'angles-Obtus1'
		si: 'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x1 ?x2 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil    ?pos ?im ?m
égaux:et: Avant ?pos
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ obtus ]'
		com: 'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est avant l''intersection avec une médiatrice d''un côté, l''agle est obtus, supérieur à un droit.'.
	arg1
		lisRegle: 'angles-Aigu1'
		si: 'angle0 [ ?x1 ?x2 ?x3 ]
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
		com: 'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est avant l''intersection avec une médiatrice d''un côté, l''agle est aigu, inférieur à un droit.'.
	arg1
		lisRegle: 'angles-médiatricesAngleDroit1'
		si: 'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x1 ?x2 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
pointConfondu:avec: ?im ?mil
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ classement: droit]'
		com: 'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est confondu avec  l''intersection d''une médiatrice d''un côté, l''agle est droit'.
	arg1
		lisRegle: 'angles-aigu2'
		si: 'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x2 ?x3 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil   Après ?im ?m
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ aigu ]'
		com: 'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est avant l''intersection avec une médiatrice d''un côté, l''agle est aigu, inférieur à un droit.'.
	arg1
		lisRegle: 'angles-obtus2'
		si: 'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x2 ?x3 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil    Avant ?im ?m
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ obtus ]'
		com: 'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est avant l''intersection avec une médiatrice d''un côté, l''agle est obtus, supérieur à un droit'.
	arg1
		lisRegle: 'angles-testAigu'
		si: 'perpendiculaire ?x ?y ?o
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
		com: 'Si une droite coupe la droite issue du sommet de cet angle et perpendiculaire à un côté de cet angle 
avant son intersection avec l''autre côté de l''angle, l''angle est aigu.'.
	arg1
		lisRegle: 'angles-testDroit'
		si: 'perpendiculaire ?x ?y ?o
intersection ?i ?x ?d
pointSur ?d ?i
pointSur ?d ?x2
pointSur ?d ?x1
angle0 [ ?x1 ?o ?x2 ]
pointsConfondus ?x1 ?i 
different:de: ?i ?x1'
		alors: 'angle0  [ ?x1 ?o ?x2 ] [ classement: droit ]'
		com: 'Si une droite coupe la droite issue du sommet de cet angle et perpendiculaire à un côté de cet angle 
à l''intersection avec l''autre côté de l''angle, l''angle est droit.'.
	arg1
		lisRegle: 'angles-testObtus'
		si: 'perpendiculaire ?x ?y ?o
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
		com: 'Si une droite coupe la droite issue du sommet de cet angle et perpendiculaire à un côté  de cet angle 
après son intersection avec l''autre côté de l''angle, l''angle est obtus.'.
	arg1
		lisRegle: 'angles-médiatricesAngleDroit2'
		si: 'angle0 [ ?x1 ?x2 ?x3 ]
médiatrice ?m [ ?x1 ?x3 ]
médiatrice ?m2 [ ?x2 ?x3 ]
milieu [  ?x1 ?x3 ] ?mil
intersection ?im ?m ?m2
position  ?mil    pointConfonduAvec ?im ?m
different:de: ?m ?m2'
		alors: 'angle0 [ ?x1 ?x2 ?x3 ] [ classement: droit ]'
		com: 'Si sur la médiatrice des extrémités d''un angle  le milieu des extrémités est confondu avec  l''intersection d''une médiatrice d''un côté, l''agle est droit'.
	arg1
		lisRegle: 'angles-opposésSommets1'
		si: 'angle0  ?x2 [  supplémentaire: ?x1 ]
angle0  ?x3 [  supplémentaire: ?x1 ]
ordonneMot:et:rep1:rep2: ?x2 ?x3  ?x2 ?x3
different:de: ?x2 ?x3'
		alors: 'angle0 ?x2 [ opposé:  ?x3  ]'
		com: 'Deux angles sont opposés par le sommet s''ils sont supplémentaires au même angle'.
	arg1
		lisRegle: 'angles-opposésSommets2'
		si: 'angle0  ?x1 [  supplémentaire: ?x2 ]
angle0  ?x1 [  supplémentaire: ?x3 ]
ordonneMot:et:rep1:rep2: ?x2 ?x3  ?x2 ?x3
different:de: ?x2 ?x3'
		alors: 'angle0 ?x2 [ opposé:  ?x3  ]'
		com: 'Deux angles sont opposés par le sommet s''ils sont supplémentaires au même angle'.
	arg1
		lisRegle: 'angles-angleAdjacent'
		si: 'angle0  [ ?x1 ?o ?x2 ]
angle0 [ ?x2 ?o ?x3 ]
ordonneMot:et:rep1:rep2:  [ ?x1 ?o ?x2 ] [ ?x2 ?o ?x3 ]  ?x ?y'
		alors: 'angle0  ?x [  adjacent: ?y ]'
		com: 'Des angles sont adjacents,s''ils ont un côté en commun.'.
	arg1
		lisRegle: 'angles-angleAdjacentMesure'
		si: 'angle 0 [ ?x1 ?o ?x2 ] [  adjacent: [ ?x2 ?o ?x3 ] ]
mesure [ ?x1 ?o ?x2 ] ?m1
mesure [ ?x2 ?o ?x3 ] ?m2
somme:et:rep: ?m1 ?m2 ?m3
inférieurOuEgal:à: ?m3  180
different:de: 180.0 ?m3'
		alors: 'mesure [ ?x1 ?o ?x3 ] ?m3 déduite'
		com: 'La mesure de la somme de deux angles adjacents est la somme des mesures des angles.'.
	arg1
		lisRegle: 'angles-mesureTroisièmeAngle1'
		si: 'polygone ?pol  [  Trigone ]
polygone ?pol  [  sommets: [ ?s1 ?s2 ?s3] ]
mesure [ ?s2  ?s1 ?s3 ] ?m1 donnée
mesure [ ?s3   ?s2 ?s1 ] ?m2 donnée
somme:et:rep: ?m1 ?m2 ?ms
difference:et:rep: 180 ?ms ?m3'
		alors: 'mesure [ ?s1 ?s3 ?s2 ] ?m3 déduite'
		com: 'Un angle du Trigone est égal à 180 - somme des deux autres.'.
	arg1
		lisRegle: 'angles-mesureTroisièmeAngle2'
		si: 'polygone ?pol  [  Trigone ]
polygone ?pol  [  sommets: [ ?s1 ?s2 ?s3] ]
mesure [ ?s3 ?s2 ?s1 ] ?m1 donnée
mesure [ ?s1 ?s3 ?s2 ] ?m2 donnée
somme:et:rep: ?m1 ?m2 ?ms
difference:et:rep: 180 ?ms ?m3'
		alors: 'mesure [ ?s2 ?s1 ?s3 ] ?m3 déduite'
		com: 'Un angle du Trigone est égal à 180 - somme des deux autres.'.
	arg1
		lisRegle: 'angles-mesureTroisièmeAngle3'
		si: 'polygone ?pol  [  Trigone ]
polygone ?pol  [  sommets: [ ?s1 ?s2 ?s3] ]
mesure [ ?s1  ?s3 ?s2 ] ?m1 donnée
mesure [ ?s2  ?s1 ?s3 ] ?m2 donnée
somme:et:rep: ?m1 ?m2 ?ms
difference:et:rep: 180 ?ms ?m3'
		alors: 'mesure [ ?s3 ?s2 ?s1 ] ?m3 déduite'
		com: 'Un angle du Trigone est égal à 180 - somme des deux autres.'.
	arg1
		lisRegle: 'angles-mesureAnglesOpposés2'
		si: 'mesure  ?a1  ?v ?source
angle0 ?a1 [ opposé:  [ ?x1 ?o ?x2 ]  
~ mesure [ ?x1 ?o ?x2 ] ?v donnée'
		alors: 'mesure [ ?x1 ?o ?x2 ] ?v déduite'.
	arg1
		lisRegle: 'angles-mesureAnglesOpposés1'
		si: 'angle0 [ ?x1 ?o ?x2 ] [ opposé:  ?a1 ] 
ordonneMot:et:rep1:rep2:  ?a1 [ ?x1 ?o ?x2 ]  ?aa1 ?aa2
relationCrée:et:nom: ?aa1 ?aa2 isométrique'
		alors: 'relationCréée ?aa1 ?aa2 isométrique'
		com: 'Des angles opposés sont isométriques'.
	arg1
		lisRegle: 'angles-mesureAnglesOpposés2'
		si: 'mesure  ?a1  ?v ?source
angle0 ?a1 [ opposé:  [ ?x1 ?o ?x2 ]
ordonneMot:et:rep1:rep2:  ?a1 [ ?x1 ?o ?x2 ]  ?aa1 ?aa2
relationCrée:et:nom: ?aa1 ?aa2 isométrique'
		alors: 'relationCréée ?aa1 ?aa2 isométrique'
		com: 'Des angles opposés sont isométriques'.
	arg1
		lisRegle: 'angles-mesureAnglescorrespondant1Isométrie'
		si: 'angle0 [ ?x1 ?o ?x2 ] [ correspondant:  ?a1 ] 
ordonneMot:et:rep1:rep2:  ?a1 [ ?x1 ?o ?x2 ]  ?aa1 ?aa2
relationCrée:et:nom: ?aa1 ?aa2 isométrique'
		alors: 'relationCréée   ?aa1 ?aa2 isométrique'
		com: 'Des angles correspondants sont isométriques'.
	arg1
		lisRegle: 'angles-mesureAnglescorrespondant2Isométrie'
		si: 'mesure  ?a1  ?v ?source
angle0	[ ?x1 ?o ?x2 ] 		
angle0 ?a1 [ correspondant:  [ ?x1 ?o ?x2 ] ]
ordonneMot:et:rep1:rep2:  ?a1 [ ?x1 ?o ?x2 ]  ?aa1 ?aa2
relationCrée:et:nom: ?aa1 ?aa2 isométrique'
		alors: 'relationCréée ?aa1 ?aa2 isométrique'
		com: 'Des angles correspondants sont isométriques'.
	arg1
		lisRegle: 'angles-mesureAngles supplémentaire1'
		si: 'mesure  ?a1 ?v ?source 
angle0 ?a1 [ supplémentaire:  ?a2 ]
difference:et:rep: 180 ?v ?v1
supérieur:à: ?v1 0'
		alors: 'mesure ?a2 ?v1 déduite'
		com: 'La somme de deux angles supplémentaires est 180'.
	arg1
		lisRegle: 'angles-mesureAngles supplémentaire2'
		si: 'mesure  ?a2  ?v ?source
angle0 ?a1 [ supplémentaire:  ?a2 ]
difference:et:rep: 180 ?v ?v1
supérieur:à:  ?v1 0
~ mesure ?a1 ?v1 donnée'
		alors: 'mesure ?a1 ?v1 déduite'.
	arg1
		lisRegle: 'angles-mesureAngles supplémentaireDroit1'
		si: 'angle0 ?a1 [  classement: droit  ]
angle0 ?a1 [ supplémentaire:  ?a2 ]'
		alors: 'angle0 ?a2 [ classement: droit ]'
		com: 'Si l''un de deux angles supplémentaires est droit, alors l''autre est aussi droit'.
	arg1
		lisRegle: 'angles-mesureAngles supplémentaireDroit2'
		si: 'angle0 ?a2 [  classement: droit ]
angle0 ?a1 [ supplémentaire:  ?a2 ]'
		alors: 'angle0 ?a1 [ classement: droit]'
		com: 'Si l''un de deux angles supplémentaires est droit, alors l''autre est aussi droit'.
	arg1
		lisRegle: 'angles-adjacentAngles1'
		si: 'angle0 [ ?d1 ?o ?d2 ]
angle0 [ ?d2 ?o ?d3 ]
angle0  [ ?d1 ?o  ?d3 ]
demi-droite ?d1 ?o ?p1
demi-droite ?d2 ?o ?p2
demi-droite ?d3 ?o ?p3
different:de: ?d1 ?d2
different:de: ?d1 ?d3
different:de: ?d3 ?d2'
		alors: 'adjacent  [ ?p1 ?o ?p2 ] [ ?p2 ?o ?p3 ]'.
	arg1
		lisRegle: 'angles-supplémentaires1'
		si: 'angle0 [  ?x1 ?O ?x2 ] 
angle0 [  ?x2 ?O ?x3 ]  
angle0 [  ?x1 ?O ?x3  ]  [ classement: plat  ]
ordonneMot:et:rep1:rep2:  [ ?x1 ?O ?x2 ] [ ?x2 ?O ?x3 ] ?x ?y
different:de: ?x1 ?x2
different:de: ?x2 ?x3'
		alors: 'angle0 ?x  [  supplémentaire: ?y ]'
		com: 'Si la somme de deux angles est un angle plat, ces angles sont  supplémentaires.'.
	arg1
		lisRegle: 'angles-supplémentaires2'
		si: 'angle0 [  ?x1 ?O ?x2 ] 
angle0 [  ?x3 ?O ?x1 ]  
angle0 [  ?x2 ?O ?x3  ]  [ classement: plat  ]
ordonneMot:et:rep1:rep2:  [ ?x1 ?O ?x2 ] [ ?x3 ?O ?x1 ] ?x ?y
different:de: ?x1 ?x2
different:de: ?x2 ?x3'
		alors: 'angle0 ?x  [  supplémentaire: ?y ]'
		com: 'Si la somme de deux angles est un angle plat, ces angles sont  supplémentaires.'.
	arg1
		lisRegle: 'angles-bissect'
		si: 'angle [  ?a ?o ?b ]
isométrique [ ?a ?o ] [ ?b ?o ]
médiatrice ?m [ ?a ?b ]'
		alors: 'bissectrice ?m angle [ ?a ?o ?b ]'
		com: 'La bissectriceDe:  d''un angle est la médiatrice de points situés à même distance du sommet; la médiatrice d''un triangle isocèle est aussi la bissectrice.'.
	arg1
		lisRegle: 'angles-bissectriceAnglesIsométriques'
		si: 'bissectrice  ?bis [ ?x1 ?o ?x3 ]
milieu [ ?x1 ?x3 ] ?m
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?x1 ?x3
relationCrée:et:nom: [ ?x1 ?o ?m ] [ ?m ?o ?x3 ] isométrique
different:de: ?o ?m'
		alors: 'relationCréée   [ ?x1 ?o ?m ] [ ?m ?o ?x3 ] isométrique'
		com: 'La bissectrice d''un angle divise cet angle en deux angles isométriques.'.
	arg1
		lisRegle: 'angles-AnglePlatDef'
		si: 'alignement  [ ?x1 ?o ?x2 ]'
		alors: 'angle0  [ ?x1 ?o ?x2 ]  [ classement: plat ]'
		com: 'Un angle plat est un angle de 180°, les côtés de  l''angle sont sur une même droite ainsi que les points qui définissent l''angle'.
	arg1
		lisRegle: 'angles-AnglePlusProche'
		si: 'pointSur ?d1 ?x1
sorteDeDroite ?d1
pointsSur:rep: ?d1 ?pts1
index:el:rep: ?pts1 ?x1 ?ind1
index:el:rep: ?pts1 ?x2 ?ind2
index:el:rep: ?pts1 ?o ?indo1
difference:et:rep: ?ind1 ?indo1 ?diff1
difference:et:rep: ?ind2 ?indo1 ?diff2
abs:rep: ?diff1 ?absdiff1
abs:rep: ?diff2 ?absdiff2
égal:à: ?absdiff1 1
égal:à: ?absdiff2 1'
		alors: 'angle0  [ ?x1 ?o ?x2 ]'
		com: 'L'' angle le plus proche, l''angle avec ses extrémiés les plus proches de soc sommet'.
	arg1
		lisRegle: 'angles-Angle platDef2'
		si: 'angle0  [ classement: plat ]'
		alors: 'angle0 [ plusProche ]'
		com: 'L'' angle qui sert à la définition de l''angle plat  est aussi le plus proche'.
	arg1
		lisRegle: 'angles-droit->perpendiculaire'
		si: 'angle0 [ ?x ?O ?y ] [  d roit ]
ordonneMot:et:rep1:rep2: [  ?x ?O ] [  ?O ?y  ] ?xx ?yy'
		alors: 'perpendiculaire  ?xx ?yy '
		com: ' Les côtés d''un angle droit sont perpendiculaire.'.
	arg1
		lisRegle: 'angles-AngleSupplémentairesDroit1'
		si: 'angle0 [ ?x1 ?o ?x2 ] [ supplémentaire: ?sup ]
relation:et:nom: [ ?x1 ?o ?x2 ]  ?sup isométrique'
		alors: 'angle0  [ ?x1 ?o ?x2 ]  [ classement: droit ]'
		com: 'Définition: Losqu''une droite coupe une autre droite avec des angles isométriques de chaque côté, ces angles sont dits droits et les droites sont dites perpendiculaires.'.
	arg1
		lisRegle: 'angles-SupplémentairesAngleDroit2'
		si: 'angle0 [ ?x1 ?o ?x2 ] [ supplémentaire: ?sup ]
relation:et:nom: [ ?x1 ?o ?x2 ]  ?sup isométrique'
		alors: 'angle0  ?sup  [ classement: droit ]'
		com: 'Définition: Losqu''une droite coupe une autre droite avec des angles isométriques de chaque côté, ces angles sont dits droits et les droites sont dites perpendiculaires.'.
	arg1
		lisRegle: 'angles-AngleDroit3'
		si: 'angle0 [ ?x1 ?o ?x2 ]
intersection  ?o ?d2 ?d1
pointSur ?d1 ?x1
pointSur ?d2 ?x2
perpendiculaire ?d1 ?d2'
		alors: 'angle0  [ ?x1 ?o ?x2 ]  [ classement: droit]'
		com: 'Définition: Un angle droit est un angle dont la mesure est 90°. Un angle droit a ses côtés perpendiculaires'.
	arg1
		lisRegle: 'angles-AngleAigu'
		si: 'angle ?x1
angle ?x1 [ position: [  ?pos1 ?pos2 ] ]
different:de: ?pos1 ?pos2
~ angle ?x1 [ classement: droit]'
		alors: 'angle ?x1 [ aigu ]'
		com: 'Un angle aigus est un angle > 0° et  < 90°. C''est aussi un angle  avec des positions différentes. (Après  Avant  ou Avant Après)'.
	arg1
		lisRegle: 'angles-AngleObtus'
		si: 'angle ?x1
angle ?x1 [ position: [  ?pos1 ?pos2 ] ]
~ angle ?x1 [ classement: droit]
égaux:et: ?pos1 ?pos2'
		alors: 'angle ?x1 [ obtus ]'
		com: 'Un angle obtu est un angle > 90° et  < 180°. C''est aussi un angle  avec des mêmes positions. (Avant Avant  ou Après Après)'.
	arg1
		lisRegle: 'angles-correspondant1'
		si: ' sorteDeDroite ?d1
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
position ?y1 Après ?o1 ?d3
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
tousDifferents: [ ?d1 ?d2 ?d3 ]'
		alors: 'angle0 ?a1 [  correspondant:  ?a2 ]'
		com: 'Lorsque deux droites parallèles sont coupées par une sécante, deux angles sont correspondants
s''ils sont situés du même côté de la droite sécante.
si l''un est à l''intérieur et l''autre à l''extérieur des droites parallèles.
s''ils ne sont pas adjacents. '.
	arg1
		lisRegle: 'angles-correspondant2'
		si: 'sorteDeDroite ?d1
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
position ?x2  Avant ?o2 ?d2
position ?x1 Avant ?o1 ?d1
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
tousDifferents: [ ?d1 ?d2 ?d3 ]
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
different:de: ?o1 ?o2'
		alors: 'angle0 ?a1 [  correspondant:  ?a2 ]'
		com: 'Lorsque deux droites parallèles sont coupées par une sécante, deux angles sont correspondants 
s''ils sont situés du même côté de la droite sécante.
si l''un est à l''intérieur et l''autre à l''extérieur des droites parallèles.
s''ils ne sont pas adjacents.'.
	arg1
		lisRegle: 'angles-correspondant3'
		si: 'sorteDeDroite ?d1
sorteDeDroite ?d2
sorteDeDroite ?d3
relation:et:nom: ?d1 ?d2 parallèle
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?ddd3
intersection ?o1  ?dd1 ?dd3
intersection ?o2 ?dd2 ?ddd3
ordonneMot:et:rep1:rep2: ?o1 ?o2  ?o1 ?o2
relation:et:nom: ?d1 ?d2 parallèle
angle0  [ ?x1 ?o1 ?y1 ]
angle0  [ ?x2 ?o2 ?y2  ]
position ?y2 Après ?o2 ?d2
position ?y1 Après ?o1 ?d1
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
tousDifferents: [ ?d1 ?d2 ?d3 ]
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
different:de: ?o1 ?o2'
		alors: 'angle0 ?a1 [  correspondant:  ?a2 ]'
		com: 'Lorsque deux droites parallèles sont coupées par une sécante, deux angles sont correspondants  
s''ils sont situés du même côté de la droite sécante.
si l''un est à l''intérieur et l''autre à l''extérieur des droites parallèles.
s’ils ne sont pas adjacents. .'.
	arg1
		lisRegle: 'angles-correspondant4'
		si: 'sorteDeDroite ?d1
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
position ?y2 Avant ?o2 ?d2
position ?y1 Avant ?o1 ?d1
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
tousDifferents: [ ?d1 ?d2 ?d3 ]'
		alors: 'angle0 ?a1 [ correspondant:  ?a2 ]'
		com: 'Lorsque deux droites parallèles sont coupées par une sécante, deux angles sont correspondants
s''ils sont situés du même côté de la droite sécante.
si l''un est à l''intérieur et l''autre à l''extérieur des droites parallèles.
s''ils ne sont pas adjacents. '.
	arg1
		lisRegle: 'angles-alterneExterne1'
		si: 'sorteDeDroite ?d1
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
position ?x2  Après ?o2 ?d2
position ?x1 Avant ?o1 ?d1
relation:et:nom: ?d1 ?d2 parallèle
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2 ]
different:de: ?o1 ?o2'
		alors: 'angle0 ?a1 [  alterneExterne:  ?a2 ]'
		com: 'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''extérieur de ces parallèles sont alternes externes.'.
	arg1
		lisRegle: 'angles-alterneInterne2'
		si: 'Y'
		alors: 'angle0 ?a1 [  alterneInterne:  ?a2 ]'
		com: 'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''extérieur de ces parallèles sont alternes internes.'.
	arg1
		lisRegle: 'angles-alterneExterne2'
		si: 'sorteDeDroite ?d1
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
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2'
		alors: 'angle0 ?a1 [  alterneExterne:  ?a2 ]'
		com: 'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''extérieur de ces parallèles sont alternes externes.'.
	arg1
		lisRegle: 'angles-alterneInterne1'
		si: ' sorteDeDroite ?d1
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
position ?y2 Après ?o2 ?d2
relation:et:nom: ?d1 ?d2 parallèle
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
different:de: ?o1 ?o2'
		alors: 'angle0 ?a1 [  alterneInterne:  ?a2 ]'
		com: 'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''intérieur de ces parallèles sont alternes internes.'.
	arg1
		lisRegle: 'angles-alterneInterne2'
		si: 'sorteDeDroite ?d1
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
position ?y2 Avant ?o2 ?d3
position ?y1 Après ?o1 ?d3
relation:et:nom: ?d1 ?d2 parallèle
ordonneMot:et:rep1:rep2: [ ?x1 ?o1 ?y1 ] [ ?x2 ?o2 ?y2  ] ?a1 ?a2
different:de: ?o1 ?o2'
		alors: 'angle0 ?a1 [  alterneInterne:  ?a2 ]'
		com: 'Des angles situés de chaque côté d''une droite tombant sur des parallèles et à l''intérieur de ces parallèles sont alternes internes.'.! !

!ExpertRegle class methodsFor: 'rules'!
circuitRegles: arg1
	arg1 retablit: false.
	ExpertRegle interface: arg1.
	arg1
		lisRegle: 'Circuits-AreteSegment'
		si: 'segment ?s
parents:rep: ?s  ?par
premier:rep: ?par ?x
dernier:rep: ?par ?y'
		alors: 'arete ?s ?x ?y'
		com: 'arête comme segment.'.
	arg1
		lisRegle: 'Circuits-AreteArc'
		si: 'arc3pts ?a ?x ?y ?z'
		alors: 'arete ?a ?x ?z'
		com: 'arête comme arc.'.
	arg1
		lisRegle: 'Circuit-Circuit'
		si: 'arete [  ?x1 ?x2 ?x3 ] ?x ?z'
		alors: '?x1 ?x2 ?x3'
		com: ' L''élément de circuit est le nom de l''arête'.
	arg1
		lisRegle: 'CircuitsEntrant'
		si: 'point ?p
compteFaits:rep:   [ arete ?a ?x ?p ] ?r'
		alors: 'entrant ?p ?r'
		com: 'Le nombred''arêtes qui arrivent sur un noeud.'.
	arg1
		lisRegle: 'Circuits-Sortant'
		si: 'point ?p
compteFaits:rep:   [ arete ?a ?p ?x ] ?r'
		alors: 'sortant ?p ?r'
		com: 'Le nombred''arêtes qui reprtentt d''un noeud.'.
	arg1
		lisRegle: 'Circuits-NouvelleAreteconducteur1'
		si: 'arete ?cond1 ?x  ?n1
commencePar:début: ?cond1 S
arete ?r ?n1 ?n2
commencePar:débutOuListe: ?r  R
entrant ?n1  1
sortant ?n1 1
retireFait: arete ?cond1 ?x  ?n1
retireFait: arete ?r ?n1 ?n2'
		alors: 'arete ?r ?x  ?n2'
		com: 'Retire les conducteurs.'.
	arg1
		lisRegle: 'Circuits-NouvelleAreteconducteur2'
		si: 'arete ?cond2 ?n2 ?y
commencePar:début: ?cond2 S
arete ?r ?n1 ?n2
commencePar:débutOuListe: ?r  R
entrant ?n2 1
sortant ?n2 1
retireFait: arete ?cond2 ?n2 ?y
retireFait: arete ?r ?n1 ?n2'
		alors: 'arete  ?r  ?n1 ?y'
		com: 'Retire les conducteurs.'.
	arg1
		lisRegle: 'Circuits-PAR2'
		si: 'arete ?v ?x ?y
arete ?v2 ?x ?y
sortant ?x ?n1
entrant ?y ?n1
ordonneMot:et:rep1:rep2: ?v ?v2 ?r1 ?r2
different:de: ?v ?v2
'
		alors: 'PAR  ?r1 ?r2  ?x ?y'
		com: 'Des résistances en parallèle sortent d''un même noeud et entrent dans un même noeud.'.
	arg1
		lisRegle: 'Circuits-NouvelleAretePAR'
		si: 'PAR ?r1  ?r2  ?n1 ?n2
retireFait: arete ?r1 ?n1 ?n2
retireFait: arete ?r2 ?n1 ?n2
retireFait: PAR ?r1  ?r2  ?n1 ?n2'
		alors: 'arete [ parallele ?r1 ?r2 ] ?n1 ?n2'
		com: 'On remplace les deux résistances en parallèle par une arête nommée: arete [ parallele ?r1 ?r2 ] ?n1 ?n2.'.
	arg1
		lisRegle: 'Circuits-SER'
		si: 'arete ?a1 ?x ?n
commencePar:débutOuListe: ?a1 R
arete ?a2 ?n ?z
sortant ?n 1
entrant ?n 1
commencePar:débutOuListe: ?a2 R
different:de: ?a1 ?a2'
		alors: 'SER ?a1 ?a2 ?x ?z'
		com: 'Pour les résistances en série, le noeud entre  les résistances a une résistance entrant et une sortant.'.
	arg1
		lisRegle: 'Circuits-NouvelleAreteSER'
		si: 'SER ?r1 ?r2 ?n1 ?n2
different:de: ?r1 ?r2
arete ?r1 ?n1 ?x
arete ?r2 ?x  ?n2
retireFait: SER ?r1  ?r2  ?n1 ?n2
retireFait: arete ?r1 ?n1 ?x
retireFait: arete ?r2 ?x ?n2'
		alors: 'arete [ serie ?r1 ?r2 ] ?n1 ?n2'
		com: 'On remplace les deux résistances en série par une arête nommée: arete [ serie ?r1 ?r2 ] ?n1 ?n2.'.
	arg1
		lisRegle: 'Circuits-ElementDeCircuit'
		si: 'arete [ ?a ?r1 ?r2 ] ?n1 ?n2
different:de: ?r1 ?r2'
		alors: '?a ?r1 ?r2'
		com: 'l''élément de circuit est le nom de l''arête.'.
	arg1
		lisRegle: 'Circuits-CircuitAuxBornes+et-'
		si: 'arete [ ?a ?r1 ?r2 ] + - '
		alors: 'circuit  ?a ?r1 ?r2  + -  '
		com: 'Les circuits qui vont de + à -.'.! !

!ExpertRegle class methodsFor: 'rules'!
code: arg1
	| temp2 |
	arg1
		lisRegle: 'interface-texte1'
		si: 'DrGTextItem ?x ?y ?z ?w'
		alors: '?y ?z   ?w'
		com: 'Donnée sous forme de  texte.'.
	arg1
		lisRegle: 'interface-texte2'
		si: 'DrGTextItem ?x ?y ?z ?u  ?w'
		alors: '?y ?z ?u  ?w'
		com: 'Donnée sous forme de  texte.'.
	temp2 _ arg1 creeRegle: 'Code-DrGPointFreeItem'.
	temp2 antecedents: 'DrGPointFreeItem  ?p
point:rep: ?p ?res
asLowerCase:rep: ?p ?lp'.
	temp2 concl: 'code ?lp := f point:  ?res'.
	temp2 com: 'Code d''un point'.
	temp2 _ arg1 creeRegle: 'Code-Segment'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy
point:rep: ?xx ?res1
asLowerCase:rep: ?xx ?lxx
point:rep: ?yy ?res2
asLowerCase:rep: ?yy ?lyy
asLowerCase:rep: ?s ?ls'.
	temp2 concl: 'code ?ls := f segmentDe: ?lxx à: ?lyy'.
	temp2 com: 'code segment'.
	temp2 _ arg1 creeRegle: 'Code-Droite'.
	temp2 antecedents: 'DrGLine2ptsItem ?s ?x ?y
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy
point:rep: ?xx ?res1
asLowerCase:rep: ?xx ?lxx
point:rep: ?yy ?res2
asLowerCase:rep: ?yy ?lyy
asLowerCase:rep: ?s ?ls'.
	temp2 concl: 'code ?ls := f droitePassantPar: ?lxx et: ?lyy'.
	temp2 com: 'code droite'.! !

!ExpertRegle class methodsFor: 'rules'!
egalites: arg1
	arg1
		lisRegle: 'egalité-Points'
		si: 'point ?p1
point ?p2
point:rep: ?p1 ?pt1
point:rep:  ?p2  ?pt2
égal:à: ?pt1 ?pt2
different:de: ?p1 ?p2'
		alors: 'egal ?p1 ?p2'
		com: 'Des points de même coordonnées  sont égaux.'.
	arg1
		lisRegle: 'egalité-PointSur1'
		si: 'egal ?p1 ?p2
point ?p1
point ?p2
pointSur ?obj ?p1'
		alors: 'pointSur ?obj  ?p2'
		com: 'Des points de même coordonnées  sont égaux.'.
	arg1
		lisRegle: 'egalité-PointSur2'
		si: 'egal ?p1 ?p2
point ?p1
point ?p2
pointSur ?obj ?p2'
		alors: 'pointSur ?obj  ?p1'
		com: 'Des points de même coordonnées  sont égaux.'.
	arg1
		lisRegle: 'egalité-AnglesdoubleSomme'
		si: 'égal [ somme ?x1 ?x2 ] ?x3
égal [ double ?x1 ] [ mesure ?xd1 ]
égal [ double ?x2 ] [ mesure ?xd2 ] 
égal   [ somme [ mesure ?xd1 ] [ mesure ?xd2 ] ] ?xd3
different:de: ?xd1 ?xd2'
		alors: 'égal ?xd3  [ double ?x3 ]'
		com: 'La somme des doubles de mesures est égale au double de la somme des mesures.
2x + 2y = 2 (x + Y)'.! !

!ExpertRegle class methodsFor: 'rules'!
ensemble: arg1
	arg1
		lisRegle: 'initparallèle1'
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
	arg1
		lisRegle: 'initparallèle2'
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
		alors: 'parallèles [ ?xx1 ?yy1 ] ?rep3 '.! !

!ExpertRegle class methodsFor: 'rules'!
figuresNonRectilignes: arg1
	arg1
		lisRegle: 'figuresNonRectilignes-AngleAuCentre'
		si: 'angle0  [ ?x1 ?o ?x2 ]
sorteDeCerclee ?c [ centre: ?o ]
pointSur ?c ?a
pointSur ?c ?bs
relation:et:nom: [ ?a ?o ?b ]  [ ?x1 ?o ?x2 ] équivsalent
different:de: ?a ?b'
		alors: 'sorteDeCercle ?c [  angleAuCentre:  [ ?a ?o ?b ] ]'
		com: 'Un angle au centre d''un cercle a son sommet au centre du cercle et ses extrémités interceptent le cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-PointSurCercle'
		si: 'sorteDeCercle ?c ?o ?x'
		alors: 'pointSur ?c ?x'
		com: 'Le point qui définit un cercle par deux points est sur ce cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-RayonCouple'
		si: 'sorteDeCercle ?c [ centre: ?o ]
pointSur ?c ?p
ordonneMot:et:rep1:rep2: ?o ?p ?oo ?pp'
		alors: 'sorteDeCercle  ?c [ rayon: [ ?oo ?pp ] ]'
		com: 'Le couple  qui a un point au centre d''un cercle et  l''autre sur ce cercle est un rayon du cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-CercleRayonCouple'
		si: 'sorteDeCercle ?c
cercle ?c
sorteDeCercle ?c ?p'
		alors: 'cercle  ?c ?p'
		com: 'Transfertdes propriètés d''une sorte de cercle au cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-RayonSegment'
		si: 'sorteDeCercle  ?c [ rayon: [ ?oo ?pp ]
segment ?s [ ?oo ?pp ]'
		alors: 'sorteDeCercle  ?c [ rayon: ?s ]'
		com: 'Le segment qui a une extrémité au centre d''un cercle et  l''autre sur ce cercle est un rayon du cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-médiatrice-Cercles'
		si: 'sorteDeCercle ?x1 ?o1 ?p1
sorteDeCercle ?x2 ?o2 ?p2
droite ?d ?i2 ?i1
intersection ?i1 ?x1 ?x2
intersection ?i2 ?x1 ?x2
relation:et:nom: ?x1 ?x2 isométrique
different:de: ?x1 ?x2'
		alors: 'médiatrice ?d [ ?o1 ?o2 ]'
		com: 'La médiatrice est le lieu des points équidistants à deux points ou aux extrémités d''un segment.
Sa construction peut se faire à l''aide de deux cercles, de même rayon, centrés sur les points; la médiatrice passe par les intersections des cercles '.
	arg1
		lisRegle: 'figuresNonRectilignes-médiatrice'
		si: 'cercle ?c [ centre: ?o ]
corde ?c  [  ?p1 ?p2 ]
perpendiculaire ?perp ?cor ?o
point:rep: ?o ?pto
point:rep: ?p1 ?ptp1
point:rep: ?p2 ?ptp2
aireTriangle:avec:avec:rep: ?ptp1 ?pto ?ptp2 ?aire
inférieur:à: 0 ?aire'
		alors: 'médiatrice ?perp  [ ?p1 ?p2 ]'
		com: 'La perpendiculaire issue du centre d''un cercle à une corde de ce cercle est une médiatrice de  la corde.'.
	arg1
		lisRegle: 'figuresNonRectilignes-cercleOrthogonauxRayons0'
		si: 'cercle ?c1 [ rayon: [ ?x1 ?x2 ] ]
cercle ?c2 [ rayon: [ ?x3 ?x4 ] ]
ordonneMot:et:rep1:rep2: [ ?x1 ?x2 ]  [ ?x3 ?x4 ]  ?xx1 ?xx2
perpendiculaire ?xx1 ?xx2
ordonneMot:et:rep1:rep2:   ?c1 ?c2   ?cc1 ?cc2
different:de: ?c1 ?c2'
		alors: 'orthogonal   ?cc1 ?cc2'
		com: 'Un cercle est  orthogonal  à un autre cercle si à l''intersecton des cercles, les rayons des cercles sont perpendiculaires'.
	arg1
		lisRegle: 'figuresNonRectilignes-cercleOrthogonauxDroiteDesCentres'
		si: 'cercle ?c1 [ centre: ?o1 ]
cercle ?c2  [ centre: ?o2 ]
pointSur ?c2 ?p
sorteDeDroite ?do1P 
pointSur ?do1P  ?o1
pointSur ?do1P ?p
perpendiculaire   ?perp ?do1P ?o2
different:de: ?c1 ?c2'
		alors: 'cercle ?c1 [  droiteDesCentres: [ ?p ?perp ] ]'
		com: 'Soit un point A, soit un cercle Corth orthogonal à un crcle C.
La perpendiculaire  à la droite reliant le point A  au centre du cercle C, issue du  centre du cercle Corth est la droite des centres.
Tous les cercles passant par le point A et ayant leurs centres sur cette droite sont orthogonaux au cercle C.'.
	arg1
		lisRegle: 'figuresNonRectilignes-cercleOrthogonaux'
		si: 'intersection ?o2  ?x ?y 
cercle ?c2 [ centre: ?o2   ]
cercle ?c1 [ droiteDesCentres: [ ?p ?d ] ]
contient:el: [ ?x ?y ] ?d
pointSur ?d ?o2
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
different:de: ?c1 ?c2'
		alors: 'orthogonal ?cc1 ?cc2'
		com: 'Un cercle qui a son centre  sur la droite des centres d''un cercle est orthogonal à ce cercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-CerclesOrthogonauxTangente1'
		si: 'orthogonal  ?c1 ?c2
cercle ?c2 [ centre: ?o ]
cercle ?c1 [ rayon: [ ?o1 ?p1 ] ] 
cercle ?c2 [ rayon: [ ?o2 ?p2 ] ]
enleverDe:el:rep: [ ?o2 ?p2 ] ?o ?p
pointSur ?c1 ?p
different:de: mesure ?o1
different:de: mesure ?o2'
		alors: 'cercle ?c1 [ tangente: [  [ ?o2  ?p2 ] ?p ] ]'
		com: 'Si deux cercles, sont orthogonaux le rayon de l''un est tangente de l''autre'.
	arg1
		lisRegle: 'figuresNonRectilignes-CreclesOrthogonauxTangente2'
		si: 'orthogonal  ?c1 ?c2
cercle ?c1 [  centre: ?o1 ]
cercle ?c2 [ rayon: [ ?o2 ?p2 ] ]
enleverDe:el:rep: [ ?o2 ?p2 ] ?o2 ?p
pointSur ?c1  ?p
different:de: mesure ?o1
different:de: mesure ?o2'
		alors: 'cercle ?c2 [ tangente: [  [ ?o1  ?p2 ] ?p ] ]'
		com: 'Si deux cercles, sont orthogonaux le rayon de l''un est tangente de l''autre'.
	arg1
		lisRegle: 'figuresNonRectilignes-pointSurCercleMédiatrice1'
		si: 'médiatrice ?m  [ ?x1 ?x2 ]
cercle ?c [ centre: ?o ]
pointSur ?m ?o
pointSur ?c ?x1'
		alors: 'pointSur ?c ?x2'
		com: 'Si le centre d''un cercle est sur la médiatrice de deux points et que l''un des points est sur le cercle, l''autre l''est aussi.'.
	arg1
		lisRegle: 'figuresNonRectilignes-pointSurCercleMédiatrice2'
		si: 'médiatrice ?m  [ ?x1 ?x2 ]
cercle ?c [ centre: ?o ]
pointSur ?m ?o
pointSur ?c ?x2'
		alors: 'pointSur ?c ?x1'
		com: 'Si le centre d''un cercle est sur la médiatrice de deux points et que l''un des points est sur le cercle, l''autre l''est aussi.'.
	arg1
		lisRegle: 'figuresNonRectilignes-cercleOrthogonalPassantParUnPoint'
		si: 'cercle ?c1 [ rayon: [ ?o1 ?p ]
médiatrice ?m [ ?ps ?p  ]
cercle ?c1 [  tangente: [  ?t ?p ] ]
intersection ?o2  ?t ?m
cercle  ?c2 [ centre: ?o2 ]'
		alors: 'cercle ?c2 [ orthogonal: [ ?c1 point: ?ps ] ]'
		com: 'Le cercle c2  passant par un point P , orthogonal à un cercle c1'.
	arg1
		lisRegle: 'figuresNonRectilignes-cercleOrthogonalPassantParDeuxPts'
		si: 'cercle ?c3 [ centre: ?o3 ]
cercle ?c1 [ centre: ?o1 ]
droiteDesCentres  ?x1 ?o1 ?x3
intersection  ?o3  ?x1 ?m
médiatrice ?m [ ?a ?b ]'
		alors: 'cercle ?c3 [ orthogonal: [ ?c1 points: ?a ?b ]'
		com: 'Un cercle c2  orthogonal à un cercle c1 et passant par les points A et B'.
	arg1
		lisRegle: 'figuresNonRectilignes-cercleOrthogonalDroiteDesCentres'
		si: 'cercle ?c2 [ orthogonal: [ ?c1 point: ?ps ] 
cercle ?c1 [  centre: ?o1 ]
sorteDeDroite ?d1  ?ps  ?o1
perpendiculaire ?d2 ?d1 ?o2'
		alors: 'droiteDesCentres ?d2 ?o1 ?ps'
		com: 'Droite des centres, c2  orthogonal à un cercle c1 et passant par un point P'.
	arg1
		lisRegle: 'figuresNonRectilignes-cerclesOrthogonaux'
		si: 'cercle ?x1 [ tangente: [  ?t1 ?p ] ]
cercle ?x2 [ tangente: [  ?t2 ?p ] ]
perpendiculaire ?t2 ?t1
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2'
		alors: 'orthogonal ?xx1 ?xx2'
		com: 'Deux cercles sont orthogonaux si leurs tangentes sont perpendiculaires'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrieSegment'
		si: 'pointSur ?c ?p
cercle ?c [  rayon: [ mesure [ ?p1 ?p2 ] ]  ]  ]
cercle ?c [  centre: ?o  ]
relationCrée:et:nom: [ ?p1 ?p2 ]  [ ?o  ?p ] isométrique'
		alors: 'relationCréée  [ ?p1 ?p2 ]  [ ?o  ?p ] isométrique'
		com: 'Tout rayon d''un cercle défini par un segment est isométrique à ce segment .'.
	arg1
		lisRegle: 'figuresNonRectilignes-médiatriceCorde'
		si: 'pointSur  ?x1 ?x2
pointSur  ?x1 ?x3
milieu [  ?x2 ?x3  ] ?m
cercle ?x1 [ centre: ?o  ]
ordonneMot:et:rep1:rep2:  ?o ?m ?oo ?mm
sorteDeDroite ?d ?oo ?mm'
		alors: 'médiatrice ?d [ ?x2 ?x3 ]'.
	arg1
		lisRegle: 'figuresNonRectilignes-CercleCouples'
		si: 'sorteDeCercle  ?c [ rayon: [ ?oo  ?xx ] ]'
		alors: 'rayon ?c [ ?oo ?xx ]'
		com: 'Le rayon d''un cercle pour compatibilité avec d''autres règles'.
	arg1
		lisRegle: 'figuresNonRectilignes-Cercle'
		si: 'sorteDeCercle ?c ?centre ?p'
		alors: 'sorteDeCercle ?c [ centre: ?centre ]'
		com: 'Définition du centre d'' un cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-sorteDeCercleCentre'
		si: 'cercle ?c [ centre: ?c0 ]'
		alors: 'sorteDeCercle ?c  [ centre:  ?c0  ]'
		com: 'SotreDeCercle , centre du cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-sorteDeCerclePointSur'
		si: 'sorteDeCercle ?c ?i ?p
pointSur ?c  ?pts'
		alors: 'sorteDeCercle ?c  [ pointSur: ?pts  ]'
		com: 'SorteDeCercle , point sur ce  cercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-CerclePar3pts'
		si: 'intersection ?i ?m1 ?m2
médiatrice ?m1 ?pts1
médiatrice ?m2 ?pts2
cercle ?c [ centre: ?i ]
point ?p
contient:el: ?pts1 ?p
contient:el: ?pts2 ?p
enleverDe:el:rep: ?pts1 ?p ?p1
enleverDe:el:rep: ?pts2 ?p ?p2'
		alors: 'cercle ?c  [ cerclePar3Points: [ ?p1 ?p ?p2 ]  ]'
		com: 'Cercle par 3 points, l'' intersection des médiatrices de deux paires de points est le centre du cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-CerclePar3ptsPoint1'
		si: 'cercle ?c  [ cerclePar3Points: [ ?p1 ?p ?p2 ] ]'
		alors: 'pointSur ?c ?p1'
		com: 'Un des 3 points par où passe un cercle par 3 points est sur le cercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-CerclePar3ptsPoint2'
		si: 'cercle ?c  [ cerclePar3Points: [ ?p1 ?p ?p2 ] ]'
		alors: 'pointSur ?c ?p'
		com: 'Un des 3 points par où passe un cercle par 3 points est sur le cercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-CerclePar3ptsPoint3'
		si: 'cercle ?c  [ cerclePar3Points: [ ?p1 ?p ?p2 ] ]'
		alors: 'pointSur ?c ?p2'
		com: 'Un des 3 points par où passe un cercle par 3 points est sur le cercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrie-Rayons'
		si: ' sorteDeCercle  ?c [ rayon: [ ?x1  ?y1 ] ] 
sorteDeCercle  ?c [ rayon:  [ ?x2  ?y2 ]  ]
ordonneMot:et:rep1:rep2:  [ ?x1  ?y1 ] [ ?x2  ?y2 ]  ?r1 ?r2
relationCrée:et:nom: ?r1 ?r2  isométrique
different:de: [ ?x1  ?y1 ] [ ?x2  ?y2 ]'
		alors: 'relationCréée ?r1 ?r2 isométrique'
		com: 'Les rayons d''une même sorteDeCercle sont isométriques.'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrie-Cercle1'
		si: 'sorteDeCercle  ?c1 [ rayon: ?r ]
sorteDeCercle  ?c2 [ rayon: ?r ]
different:de: ?c1 ?c2
relationCrée:et:nom:?c1 ?c2  isométrique'
		alors: 'relationCréée  ?c1 ?c2 isométrique'
		com: 'Si deux cercles différents, ont même rayon ou des rayons de même mesure, alors les cercles sont isométriques.'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrie-CercleSegment'
		si: 'cercle ?c1 ?s
segment ?s
cercle ?c2 ?s
different:de: ?c1 ?c2
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
relationCrée:et:nom: ?cc1 ?cc2 isométrique'
		alors: 'relationCréée  ?cc1 ?cc2 isométrique'
		com: 'Si  deux cercles différents sont définis par un même segment, alors les cercles sont isométriques, ils ont un même rayon.'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrie-CercleValeurCentre'
		si: 'cercle ?c1 ?centre ?val  ?n'
		alors: 'cercle ?c1 [ centre: ?centre ]'
		com: 'Centre d''un cercle défini par le centre et une mesure du rayon'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrie-CercleValeurMesureRayon'
		si: 'cercle ?c1 ?centre ?val  ?n'
		alors: 'cercle ?c1 [ rayon:  [ mesure  ?val ]'
		com: 'Mesure du rayon d''un cercle dont le rayon est donné par une valeur'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrie-CercleSegmentIsométrieCercles'
		si: 'cercle ?c1 [ segment: ?seg ]
segment ?s ?y
cercle ?c2 [ rayon: ?seg ]
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
relationCrée:et:nom: ?cc1  ?cc2 isométrique'
		alors: 'relationCréée ?cc1  ?cc2 isométrique'
		com: 'Un cercle défini par un segment est isométrique au cercle qui a ce segment pour rayon'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrie-CercleSegmentIsométriques'
		si: ' cercle ?c1 [ segment: [ ?x1 ?y1 ]
cercle ?c1 [ rayon: [ ?x2 ?y2 ] ]
ordonneMot:et:rep1:rep2: [ ?x1 ?y1 ] [ ?x2 ?y2 ] ?r1 ?r2
relationCrée:et:nom: ?r1 ?r2 isométrique'
		alors: 'relationCréée ?r1 ?r2 isométrique'
		com: 'Un cercle défini par un segment a ses rayons isométriques à ce segment'.
	arg1
		lisRegle: 'figuresNonRectilignes-isométrie-CercleIsométriques'
		si: 'isométrique ?c1 ?c2
sorteDeCercle ?c1
sorteDeCercle ?c2
sorteDeCercle  ?c1 [ rayon: ?r1 ]
sorteDeCercle  ?c2 [ rayon: ?r2 ]
different:de: ?c1 ?c2
relationCrée:et:nom:  ?r1 ?r2 isométrique'
		alors: 'relationCréée ?r1 ?r2 isométrique'
		com: 'Si  deux cercles différents sont isométriques, alors leurs rayons sont isométriques.'.
	arg1
		lisRegle: 'figuresNonRectilignes-diamètre1'
		si: 'sorteDeCercle ?c [ centre: ?o  ]
pointSur ?c ?x1
pointSur ?c ?x2
alignement [ ?x1 ?o ?x2 ]
different:de: ?x1 ?x2'
		alors: 'sorteDeCercle ?c [ diamètre: [ ?x1 ?x2 ] ]'.
	arg1
		lisRegle: 'figuresNonRectilignes-diamètre3'
		si: 'sorteDeCercle ?c [ centre: ?o  ]
DrGArcCenterAngleItem ?c ?o ?x2  ?x1
alignement [ ?x1 ?o ?x2 ]
different:de: ?x1 ?x2'
		alors: 'sorteDeCercle ?c [ diamètre: [ ?x1 ?x2 ] ]'
		com: 'Si deux points sur un cercle sont alignés avec le centre de ce cercle le couple de points est un diamètre du .'.
	arg1
		lisRegle: 'figuresNonRectilignes-diamètre2'
		si: 'sorteDeCercle ?c [ centre: ?o  ]
pointSur ?c ?x1
pointSur ?c ?x2
alignement [ ?x2 ?o ?x1 ]
different:de: ?x1 ?x2'
		alors: 'sorteDeCercle ?c [ diamètre: [ ?x2 ?x1 ]'
		com: 'Si deux points sont alignés avec le centre de ce cercle le couple de points est un diamètre du cercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-alignementDiamètreRayon'
		si: 'alignement [ ?x1 ?o ?x2 ]
cercle ?c [ rayon: [ ?o ?x1 ] ]
cercle ?c [ rayon: [ ?o ?x2 ] ]'
		alors: 'cercle ?c [  diamètre: [ ?x1 ?x2 ] ]'
		com: 'Si les extémités de deux rayons sont alignées avec le centre de ce cercle le couple des extrémité des rayons est un diamètre du cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-Médiatricediamètre'
		si: 'médiatrice ?d 
cercle ?c ?centre ?z 
intersection ?x1 ?c ?d
intersection ?x2 ?c ?d
different:de: ?x1 ?x2
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2'
		alors: 'diamètre ?c [ ?xx1 ?xx2 ]'
		com: 'Le segment qui relie les intersections d''une médiatrice d''un diamètre d''un cercle  avec ce cercle est un diamètre de ce cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-diamètreCercleSegment'
		si: 'diamètre ?c [ ?x1 ?x2 ] 
vecteur   ?s  ?x1 ?x2
ordonneMot:et:rep1:rep2: ?v1 ?v2 ?x1 ?x2
~ segment ?s2[ ?x1 ?x2 ]'
		alors: 'segment ?s [ ?x1 ?x2 ]'
		com: 'Si le diamètre d''un cercle est un vecteur, il est aussi un segment de mêmes extrémités, pour compatibilité avec les règles qui utilisent des segments.'.
	arg1
		lisRegle: 'figuresNonRectilignes-diamètreCercleIsometrie'
		si: 'diamètre ?c ?d1
diamètre ?c ?d2
different:de: ?d1 ?d2
relationCrée:et:nom: ?d1 ?d2 isométrique'
		alors: 'relationCréée  ?d1 ?d2 isométrique'
		com: 'Les diamètres d''un même cerccle sont isométriques'.
	arg1
		lisRegle: 'figuresNonRectilignes-diamètreArc2'
		si: 'arcCentré  ?a  ?centre ?x3 ?x4
segment ?s [ ?x3 ?x4 ]
pointSur  ?s ?centre'
		alors: 'diamètre ?a [ ?x3 ?x4 ]'.
	arg1
		lisRegle: 'figuresNonRectilignes-diamètreArc'
		si: 'arcCentré  ?arc ?centre ?x1 ?x2
milieu ?x1 ?x2 ?centre'
		alors: 'arcCentré  ?arc [   diamètre: [ ?x1 ?x2   ]'
		com: 'Si le centre de l''arc est le  milieu des extrémités alors le segment reliant les extémités est un diamètre'.
	arg1
		lisRegle: 'figuresNonRectilignes-ArcIsométriques'
		si: 'arcCentré ?arc1 ?o ?a ?b
arcCentré ?arc2 ?o ?b ?c
relation:et:nom:  [ ?a ?b ] [  ?c  ?b ] isométrique
relationCrée:et:nom:  ?arc1 ?arc2  isométrique'
		alors: 'relationCréée  ?arc1 ?arc2   isométrique'
		com: 'Des arcs centrés de même centre sont isométriques si leur extrémités sont des couples isométriques'.
	arg1
		lisRegle: 'figuresNonRectilignes-ArcIsométriquesAngleDroit1'
		si: 'arcCentré  ?x1 ?x2 ?x3 ?x4
arcCentré  ?x5  ?x2 ?x7 ?x8
angle0 [ ?x3 ?x2 ?x4 ] [ supplémentaire: [ ?x7 ?x2 ?x8 ] ]
relation:et:nom: ?x1 ?x5 isométrique
different:de: ?x1 ?x5
relationCrée:et:nom: [ ?x3 ?x2 ?x4  ]  [ ?x7 ?x2 ?x8 ] isométrique'
		alors: 'relationCréée [ ?x3 ?x2 ?x4  ]  [ ?x7 ?x2 ?x8 ] isométrique'
		com: 'Si deux arcs centrés partagent un demi-cercle et sont isométriques, ils partagent le demi-cercle en deux parties égales, leurs extrémités sont les extrémités d''angles supplémentaires et isométriques'.
	arg1
		lisRegle: 'figuresNonRectilignes-ArcIsométriquesAngleDroit2'
		si: 'arcCentré  ?x1 ?x2 ?x3 ?x4
arcCentré  ?x5  ?x2 ?x7 ?x8
angle0 [ ?x3 ?x2 ?x4 ] [ supplémentaire: [ ?x7 ?x2 ?x8 ] ]
relation:et:nom: ?x1 ?x5 isométrique
different:de: ?x1 ?x5
relationCrée:et:nom: [ ?x3 ?x2 ?x4  ]  [ ?x7 ?x2 ?x8 ] isométrique'
		alors: 'relationCréée [ ?x3 ?x2 ?x4  ]  [ ?x7 ?x2 ?x8 ] isométrique'
		com: 'Si deux arcs centrés partagent un demi-cercle et sont isométriques, ils partagent le demi-cercle en deux parties égales, leurs extrémités sont les extrémités d''angles supplémentaires et isométriques'.
	arg1
		lisRegle: 'figuresNonRectilignes-AngleAigu'
		si: 'angle0 [ ?x1 ?o  ?y1 ] [ supplémentaire:  ?x2 ] 
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
	arg1
		lisRegle: 'figuresNonRectilignes-AngleObtus'
		si: 'angle0 [ ?x1 ?o  ?y1 ] [ supplémentaire:  ?x2 ] 
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
	arg1
		lisRegle: 'figuresNonRectilignes-AngleObtus2'
		si: 'angle0 [ ?x1 ?o  ?y1 ] [ supplémentaire: [ ?x2 ?o ?y2 ]  ] 
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
	arg1
		lisRegle: 'figuresNonRectilignes-AngleAigu2'
		si: 'angle0 [ ?x1 ?o  ?y1 ] [ supplémentaire: [ ?x2 ?o ?y2 ]  ] 
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
	arg1
		lisRegle: 'figuresNonRectilignes-diamètreIntersection'
		si: 'droite ?d 
sorteDeCercle ?c ?centre ?z
intersection ?x1 ?c ?d
intersection ?x2 ?c ?d 
pointSur ?d  ?centre
~egal ?x1 ?x2
different:de: ?x1 ?x2'
		alors: ' cercle ?c [  diamètre: [ ?x1 ?x2 ]  ]'.
	arg1
		lisRegle: 'figuresNonRectilignes-Milieu'
		si: 'sorteDeCercle ?c   [diamètre: ?c [ ?x ?y ]
sorteDeCercle ?c ?centre ?z'
		alors: 'sorteDeCercle ?c [ milieu [ ?x ?y ] ?centre'
		com: 'Le milieu   d''un diamètre est le centre du sorteDeCercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-AngleInscritDemiCercle'
		si: 'cercle ?c [ diamètre: [ ?x1 ?x2 ] ]
pointSur ?c ?p
ordonneMot:et:rep1:rep2: ?x1 ?p  ?xx1 ?pp 
ordonneMot:et:rep1:rep2: ?p ?x2 ?ppp ?xx
different:de: ?p ?x1
different:de: ?p ?x2'
		alors: 'perpendiculaire [ ?xx1 ?pp ] [ ?ppp ?xx ]'
		com: 'Un angle incrit dans un demi cercle est un angle droit, il a ses extrémités aux extrémités d''un diamètre.'.
	arg1
		lisRegle: 'figuresNonRectilignes-AngleIncrit'
		si: 'cercle ?c 
pointSur ?c ?p1
pointSur ?c ?p2
pointSur ?c ?p3
angle0 [ ?x1 ?p2 ?x3 ]
relation:et:nom: [  ?p1 ?p2 ?p3 ] [ ?x1 ?p2 ?x3 ] équivalent'
		alors: 'cercle ?c [ angleInscrit: [ ?p1 ?p2 ?p3  ] ]'
		com: 'Un angle inscrit dans un cercle a son sommet sur ce cercle et ses extrémités interceptent le cercle'.
	arg1
		lisRegle: 'figuresNonRectilignes-alignementMilieu'
		si: 'milieu ?o [  ?x1 ?x2 ]
relationCrée:et:nom: [ ?o ?x1 ] [ ?x2 ?o ] isométrique
different:de: ?x1 ?x2'
		alors: 'relationCréée [ ?o  ?x1 ] [ ?x2 ?o] isométrique'
		com: 'si un point est le milieu de deux points,  les couples qui le reiie à chaque point sont isométriques.'.
	arg1
		lisRegle: 'figuresNonRectilignes-PuissancePoint'
		si: 'cercle ?c [  centre: ?O ]
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
		alors: 'puissanceFormule ?P ?c ?d [  produit [ mesure [ ?ii1 ?oo1 ] ] [ mesure [  ?ii2 ?oo2 ]  ] ]'
		com: 'La puissance d''un point par rapport à un cercle est le produit des distances de ce point aux intersections d''une droite passant par ce point et coupant le cercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-EgalitéPuissanceMêmeCercleMêmePoint'
		si: 'puissanceFormule  ?O ?c1 ?d1 [ produit [ mesure ?x1 ] [ mesure ?y1 ] ]
puissanceFormule  ?O ?c1 ?d2 [ produit [ mesure ?x2 ] [ mesure ?y2 ] ]
pointSur ?d1 ?O
pointSur ?d2 ?O
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?d1 ?d2
different:de: ?d1 ?d2'
		alors: 'égal [ produit [ mesure ?x1 ] [ mesure ?y1 ] ]  [ produit [ mesure ?x2 ] [ mesure ?y2 ] ]'
		com: 'Les puisances d''un même point sont égales pour un cercle donné'.
	arg1
		lisRegle: 'figuresNonRectilignes-ValeurPuissance'
		si: 'puissanceFormule ?O ?c ?d [  produit [ mesure ?m1 ] [ mesure ?m2 ] 
mesure ?m1 ?v1
mesure ?m2 ?v2
produit:et:rep: ?v1 ?v2 ?res
arrondis:rep:  ?res ?resArr
arrondis:rep:  ?v1 ?v1Arr
arrondis:rep:  ?v2 ?v2Arr'
		alors: 'puissance ?O ?c ?resArr [ ?m1 ?v1Arr ] [ ?m2 ?v2Arr ]'
		com: 'Calcul de la puissance d''un point par rapport à un cercle à partir des mesures.'.
	arg1
		lisRegle: 'figuresNonRectilignes-AngleIncritDemiCercle'
		si: 'sorteDeCercle ?c [ diamètre: [ ?p1 ?p3 ] ]
sorteDeCercle ?c [ centre: ?o ]
pointSur ?c ?p1
pointSur ?c ?p2
pointSur ?c ?p3
angle0 [ ?p1 ?p2 ?p3 ]'
		alors: 'angle0 [ ?p1 ?p2 ?p3 ] [ inscrit: [ demi-cercle [ ?p1 ?o ?p3  ] ]'
		com: 'Si  deux points sont les extrémité d'' un diamètre d''un cercle, l''angle qui a son sommet sur ce cercle et comme extrémités les extrémités du diamètre du cercle est un angle inscrit dans un demi cercle, c''est un angle droit.'.
	arg1
		lisRegle: 'figuresNonRectilignes-AngleInscritDemiCercleDroit'
		si: 'angle0  End of statement list encountered ->[ ?p1 ?p2 ?p3 ] [ inscrit: [ demi-cercle [ ?p1 ?o ?p3  ] ]'
		alors: 'angle0 [ ?p1 ?p2 ?p3 ] [  droit  ]'
		com: 'Un angle inscrit dans un demi cercle est droit.'.
	arg1
		lisRegle: 'figuresNonRectilignes-tangente001'
		si: 'cercle ?c [ rayon: ?r ]
cercle ?c [ centre: ?O ]
enleverDe:el:rep: ?r ?O ?p
intersection  ?p ?x2 ?x3
perpendiculaire ?x2 ?x3
segment ?s ?r
enleverDe:el:rep: [ ?x2 ?x3 ] ?s ?t'
		alors: 'sorteDeCercle ?c [ tangente: [ point:  ?p tangente: ?t ] ]'
		com: 'Tangente en un point à un cercle. '.
	arg1
		lisRegle: 'figuresNonRectilignes-tangentePerp1'
		si: 'sorteDeCercle ?c [ rayon: ?r  ]
sorteDeCercle ?c [ centre: ?cent ]
enleverDe:el:rep: ?r  ?cent ?p
perpendiculaire ?x1 ?x2 
coupleSur ?x1 ?r
coupleSur ?x2 ?tanj'
		alors: 'sorteDeCercle ?c [ tangente:  [ point: ?p tangente: ?tanj ]   ]'
		com: 'Tangente en un point à un cercle. '.
	arg1
		lisRegle: 'figuresNonRectilignes-PropriétésSorteDeCercle'
		si: 'cercle ?c
sorteDeCercle ?c ?prop'
		alors: 'cercle ?c ?prop'
		com: 'transfert propriétés sorteDeCercle au cercle.'.
	arg1
		lisRegle: 'figuresNonRectilignes-tangentePerp2'
		si: 'sorteDeCercle ?c [ rayon: ?r  ]
sorteDeCercle ?c [ centre: ?cent ]
enleverDe:el:rep: ?r  ?cent ?p
perpendiculaire ?x1 ?x2 ?p
coupleSur ?x1 ?tanj
coupleSur ?x2 ?r'
		alors: 'cercle ?c [ tangente:  [  ?tanj  ?p ] ]'
		com: 'Tangente en un point à un sorteDeCercle. '.
	arg1
		lisRegle: 'figuresNonRectilignes-tangente002'
		si: 'sorteDeCercle ?c [ rayon: [ ?p1 ?p2  ] ]
sorteDeCercle ?c  [ centre: ?O ]
enleverDe:el:rep: [ ?p1 ?p2  ] ?O ?p
perpendiculaire  [ ?p1 ?p2 ] [  ?x1 ?x2 ]
different:de: [ ?p1 ?p2 ] [  ?x1 ?x2 ]'
		alors: 'sorteDeCercle ?c [ tangente: [ point: ?p tangente:  [  ?x1 ?x2  ]  ] ]'
		com: 'Tangente en un point à un Cercle. '.
	ExpertRegle figuresNonRectilignesSuite: arg1.! !

!ExpertRegle class methodsFor: 'rules'!
figuresNonRectilignesSuite: arg1
	arg1
		lisRegle: 'figuresNonRectilignes-cerclesOrthogonaux1'
		si: 'orthogonal ?c1 ?c2'
		alors: 'cercle ?c1 [ orthogonal: ?c2  ]'
		com: 'Deux cercles sont orthogonaux si le rayon de l''un  et de l''autre sont perpendiculaire'.
	arg1
		lisRegle: 'figuresNonRectilignes-cerclesOrthogonaux2'
		si: 'orthogonal ?c1 ?c2'
		alors: 'cercle ?c2 [ orthogonal: ?c1  ]'
		com: 'Deux cercles sont orthogonaux si le rayon de l''un  et de l''autre sont perpendiculaire'.
	arg1
		lisRegle: 'figuresNonRectilignes-OrthogonalPerp'
		si: 'orthogonal ?x1 ?x2
cercle  ?x1 [ rayon: [ ?t1 ?p ]  ]             
cercle  ?x2 [  rayon: [ ?t2 ?p ]  ]
ordonneMot:et:rep1:rep2: [ ?t1 ?p ] [ ?t2 ?p ] ?r1 ?r2'
		alors: 'perpendiculaire ?r1 ?r2'
		com: 'les rayons passant par l''intersection de deux cercles orthogonaux sont perpendiculaires.'.
	arg1
		lisRegle: 'figuresNonRectilignes-cercleDiamètresIsométriques'
		si: 'cercle ?c [ diamètre: ?d1 ]
cercle ?c [ diamètre: ?d2 ]
different:de: ?d1 ?d2
relationCrée:et:nom:  ?d1 ?d2  isométrique'
		alors: 'relationCréée  ?d1 ?d2 isomérique'
		com: 'Les diamètre d''un même cercle sont isométriques'.! !

!ExpertRegle class methodsFor: 'rules'!
figuresRectilignes: arg1
	arg1
		lisRegle: 'égalitéParallèleParallèleDirection'
		si: 'sorteDeDroite ?x1
sorteDeDroite ?x2
égalité Parallèle ParallèleDirection
relation:et:nom: ?x1 ?x2 parallèleDirection
relationCrée:et:nom: ?x1 ?x2 parallèle'
		alors: 'relationCrée:et:nom: ?x1 ?2 parallèle'
		com: 'égalitéParallèleParallèleDirection'.
	arg1
		lisRegle: 'figuresRectilignes-SegmentConfondus'
		si: 'segment ?s ?ss
segment ?s2 ?ss
different:de: ?s2 ?s'
		alors: 'confondu ?s ?s2'
		com: 'Des segments avec les mêmes extrémités sont confondus'.
	arg1
		lisRegle: 'figuresRectilignes-origineLigne'
		si: 'sorteDeDroite ?d ?x ?y
DrGLine2ptsItem ?d ?or ?extr'
		alors: 'origine ?d ?or'
		com: 'Le premier des parents d''une sorte de droite est son origine.'.
	arg1
		lisRegle: 'figuresRectilignes-origineDemiDroite'
		si: 'sorteDeDroite ?d ?x ?y
DrGRay2ptsItem ?d ?or ?extr'
		alors: 'origine ?d ?or'
		com: 'Le premier des parents d''une sorte de droite est son origine.'.
	arg1
		lisRegle: 'figuresRectilignes-origineSegment'
		si: 'sorteDeDroite ?d ?x ?y
DrGSegment2ptsItem ?d ?or ?extr'
		alors: 'origine ?d ?or'
		com: 'Le premier des parents d''une sorte de droite est son origine.'.
	arg1
		lisRegle: 'figuresRectilignes-pointLigne'
		si: 'sorteDeDroite ?d ?x ?y
DrGLine2ptsItem ?d ?or ?extr
point ?extr'
		alors: 'point ?d ?extr'
		com: 'Le deuxième des parents d''une sorte de droite est le point définissant l''objet.'.
	arg1
		lisRegle: 'figuresRectilignes-pointDemiDroite'
		si: 'sorteDeDroite ?d ?x ?y
DrGRay2ptsItem ?d ?or ?extr'
		alors: 'point ?d ?extr'
		com: 'Le deuxième des parents d''une sorte de droite est le point définissant l''objet.'.
	arg1
		lisRegle: 'figuresRectilignes-pointSegment'
		si: 'sorteDeDroite ?d ?x ?y
DrGSegment2ptsItem ?d ?or ?extr'
		alors: 'point ?d ?extr'
		com: 'Le deuxième des parents d''une sorte de droite est le point définissant l''objet.'.
	arg1
		lisRegle: 'figuresRectilignes-AlignementPoints'
		si: 'point ?x
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
		com: 'Si l''aire du triangle formé par trois points est nulle, les points sont alignés'.
	arg1
		lisRegle: 'figuresRectilignes-Milieu'
		si: 'milieu  [ ?x ?y ] ?m'
		alors: 'alignement [ ?x ?m ?y ]'
		com: 'Le milieu d''un couple est aligné avec les extrémités.'.
	arg1
		lisRegle: 'figuresRectilignes-bissectrice-def'
		si: 'bissectrice ?m [ ] ?x1 ?x2 ?x3 ] '
		alors: 'bissectrice ?m'.
	arg1
		lisRegle: 'figuresRectilignes-médiatriceConstruction'
		si: 'cercle ?c1 [ centre: ?a ]
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
		com: 'La médiatrice de deux points ou d''un segment est le lieu des points équidistants des extrémités du segment ou des deux points.'.
	arg1
		lisRegle: 'figuresRectilignes-médiatricePerpSegment'
		si: 'perpendiculaire ?perp ?s ?p
segment ?s [ ?a ?b ]
milieu ?s  ?p'
		alors: 'médiatrice ?perp [ ?a ?b ]'.
	arg1
		lisRegle: 'figuresRectilignes-médiatricePerpSegmentPointSur'
		si: 'médiatrice ?perp [ ?a ?b ]
milieu [  ?a ?b  ] ?mil'
		alors: 'pointSur ?perp ?mil'.
	arg1
		lisRegle: 'figuresRectilignes-médiatriceIsométrie'
		si: 'médiatrice  ?x1  [ ?a ?b ]
pointSur ?x1 ?p
milieu ?x2 ?m
different:de: ?m ?p
relationCrée:et:nom: [  ?a ?p ] [  ?b  ?p  ]  isométrique'
		alors: 'relationCréée [  ?a ?p ] [  ?b ?p ]  isométrique'
		com: 'Un point sur la  médiatrice d''un segment est à égale distance des extrémités de ce segment ou du couple de ces extrémités.'.
	arg1
		lisRegle: 'figuresRectilignes-médiatricePerpRec'
		si: 'médiatrice ?m ?s
ordonneMot:et:rep1:rep2: ?m ?s ?mm ?ss'
		alors: 'perpendiculaire ?mm ?ss'
		com: 'La médiatrice  d''un segment ou de deux points est prependiculaire à ce segment ou ces deux points ou à la droite qui relie les deux points.'.
	arg1
		lisRegle: 'figuresRectilignes-médiatrices3Points1'
		si: 'intersection ?i ?m1 ?m2
médiatrice  ?m1 ?x1
médiatrice  ?m2 ?x2
médiatrice  ?m3 ?x3
different:de: ?m3 ?m1
different:de: ?m3 ?m2'
		alors: 'intersection ?i ?m1 ?m3'
		com: 'L''intersection des médiatrices de deux points implique l''intersection de ces médairices avec la médiatrice d''un de ces points et le troizième point'.
	arg1
		lisRegle: 'figuresRectilignes-médiatrices3Points2'
		si: 'intersection ?i ?m1 ?m2
médiatrice  ?m1 ?x1
médiatrice  ?m2 ?x2
médiatrice  ?m3 ?x3
different:de: ?m3 ?m1
different:de: ?m3 ?m2'
		alors: 'intersection ?i ?m1 ?m3'
		com: 'L''intersection des médiatrices de deux points implique l''intersection de ces médairices avec la médiatrice d''un de ces points et le troizième point'.
	arg1
		lisRegle: 'figuresRectilignes-médiatrices3Points1PointSur'
		si: 'intersection ?i ?m2 ?m1
médiatrice  ?m1 ?x1
médiatrice  ?m2 ?x2
médiatrice  ?m3 [ ?y1 ?y2 ]
milieu  [ ?y1 ?y2 ] ?mil 
different:de: ?m3   ?m1
different:de: ?m3 ?m2'
		alors: 'pointSur  ?m3  ?mil'
		com: 'L''intersection des médiatrices de deux points implique que  le  milieu des points définissant la médiatrice soit sur la médiatrice.'.
	arg1
		lisRegle: 'figuresRectilignes-médiatrices3Points2PointSur'
		si: 'intersection ?i ?m2 ?m1
médiatrice  ?m1 ?x1
médiatrice  ?m2 ?x2
médiatrice  ?m3 [ ?y1 ?y2 ]
milieu  [ ?y1 ?y2 ] ?mil 
different:de: ?m3   ?m1
different:de: ?m3 ?m2'
		alors: 'pointSur ?m3 ?mil'
		com: 'L''intersection des médiatrices de deux points implique que  le  milieu des points définissant la médiatrice soit sur la médiatrice.'.
	arg1
		lisRegle: 'figuresRectilignes-pointSurMédiatriceMilieu'
		si: 'médiatrice ?m  [ ?p1 ?p2 ]
milieu ?mil ?p1 ?p2'
		alors: 'pointSur ?m  ?mil'
		com: 'Le  milieu des points définissant une médiatrice est sur la médiatrice.'.
	arg1
		lisRegle: 'figuresRectilignes-trianglePlat0'
		si: 'alignement [ ?a ?b ?c ]
créeNom:rep:   [ ?a ?b ?c ] ?t'
		alors: 'triangle ?t [ plat ]'.
	arg1
		lisRegle: 'figuresRectilignes-triangleNonPlat'
		si: 'triangle ?x [ sommets: [ ?a ?b ?c ] ]
aireTriangle:avec:avec:rep: ?a ?b ?c ?aire
abs:rep: ?aire     ?absaire
supérieur:à:   ?absaire 0'
		alors: 'triangle ?x [ non_plat ]'
		com: 'On élimine les triangles plats'.
	arg1
		lisRegle: 'figuresRectilignes-triangleNonPlatSommetA'
		si: 'triangle ?x [ non_plat ]
triangle ?x [ sommets: [ ?a ?b ?c ] ]'
		alors: 'triangle ?x [ sommet: [ ?a  angle: [ ?b ?a ?c ] ]'
		com: 'Un sommet du triangle et son angle'.
	arg1
		lisRegle: 'figuresRectilignes-triangleNonPlatSommetB'
		si: 'triangle ?x [ non_plat ]
triangle ?x [ sommets: [ ?a ?b ?c ] ]'
		alors: 'triangle ?x [ sommet: [ ?b angle: [  ?c ?b  ?a ] ]'
		com: 'Un sommet du triangle et son angle'.
	arg1
		lisRegle: 'figuresRectilignes-triangleNonPlatSommetC'
		si: 'triangle ?x [ non_plat ]
triangle ?x [ sommets: [ ?a ?b ?c ] ]'
		alors: 'triangle ?x [ sommet: [ ?c angle: [   ?b ?c  ?a ] ]'
		com: 'Un sommet du triangle et son angle'.
	arg1
		lisRegle: 'figuresRectilignes-TriangleAnglesEquivalents'
		si: 'triangle ?t [ sommets: ?som ]
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
	arg1
		lisRegle: 'figuresRectilignes-AireTriangle0'
		si: 'triangle ?t [ hauteur: ?h ]
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
	arg1
		lisRegle: 'figuresRectilignes-AireTriangle0Inverse1'
		si: 'triangle ?t [ hauteur: ?h ]
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
	arg1
		lisRegle: 'figuresRectilignes-AireTriangle0Inverse2'
		si: 'triangle ?t [ hauteur: [ ?pr1 ?dr1 ] ]
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
	arg1
		lisRegle: 'figuresRectilignes-AireTriangle'
		si: 'mesure [ aire0 triangle ?t  ] ?aire0
arrondis:rep: ?aire0 ?aire'
		alors: 'triangle ?t [ aire: ?aire ] '
		com: 'aire calculée à  partir d''une hauteur du triangle et de la base correspondante. Aire triangle = base x hauteur / 2'.
	arg1
		lisRegle: 'figuresRectilignes-AngleObtusHauteurs'
		si: 'triangle  ?x1  [ hauteur: ?x2 ]
triangle ?x1 [ sommets: ?som ]
coupleSur ?d ?x2 
position Après I ?s ?d
contient:el: ?som ?s'
		alors: 'triangle ?x1 [ angle_obtus: [ sommet: ?s ] ]'
		com: 'Si l''intersection des hauteurs est sur la hauteur issue du sommet et après ce sommet hors du triangle, l''angle à ce sommet est obtus.'.
	arg1
		lisRegle: 'figuresRectilignes-AngleObtusMédiatrices'
		si: 'médiatrice  ?x1 [ ?x2 ?x3 ]
position Avant  ?pt O ?x1
triangle ?t [ sommets: ?som ]
enleverDe:el:rep: ?som ?x2 ?res
enleverDe:el:rep:  ?res ?x3 ?s'
		alors: 'triangle ?x1 [ angle_obtus: [ sommet: ?s ] ]'
		com: 'Si l''intersection des médiatrices est après l''intersection d''une médatrice avec un côté d''un triangle, l''angle à ce sommet est obtus.'.
	arg1
		lisRegle: 'figuresRectilignes-triangleAngleExtérieur1'
		si: 'triangle ?t [ isocèle: [ sommet: ?s  angles:  [ ?p1 ?p2  ?s ]   ?ang ] ]
angle [ ?p1 ?s ?p2 ] [ supplémentaire: ?sup ]'
		alors: 'triangle ?t [ angleExtérieur: [ [ mesure  ?sup ] = somme [ mesure [ ?p1 ?p2  ?s ] ]  [ mesure  ?ang ] ]  ]'
		com: 'La mesure de l''angle extérieur à un sommet d''un triangle est égal à la somme des mesures des angles aux deux autres sommets'.
	arg1
		lisRegle: 'figuresRectilignes-triangleAngleExtérieur2'
		si: 'triangle ?t [ isocèle: [ sommet: ?s  angles:  [ ?p1 ?p2  ?s ]   ?ang ] ]
angle [ ?p2 ?s ?p1 ] [ supplémentaire: ?sup ] ]'
		alors: 'triangle ?t [ angleExtérieur: [ [ mesure  ?sup  ] = somme [ mesure [ ?p1 ?p2  ?s ] ]  [ mesure  ?ang ] ]  ]'
		com: 'La mesure de l''angle extérieur à un sommet d''un triangle est égal à la somme des mesures des angles aux deux autres sommets'.
	arg1
		lisRegle: 'figuresRectilignes-triangleAngleIsométriques'
		si: 'triangle ?t [ isocèle: [ sommet: ?s angles: ?a1 ?a2 ] ]
relationCrée:et:nom: ?a1 ?a2 isométrique'
		alors: 'relationCréée  ?a1 ?a2 isométrique'
		com: 'Angles isométriques d''un triangle isocèles'.
	arg1
		lisRegle: 'figuresRectilignes-trianglesommeMesureAngleExtérieur'
		si: 'triangle ?t [ angleExtérieur: [ [ mesure  ?sup ] = somme [ mesure [ ?p1 ?p2  ?s ] ]  [ mesure  ?ang ] ]  ]'
		alors: 'somme [ mesure  [   ?p1 ?p2  ?s ] ]  [ mesure  ?ang ] [ mesure ?sup ]'
		com: 'La mesure de l''angle extérieur à un sommet d''un triangle est égal à la somme des mesures des angles aux deux autres sommets'.
	arg1
		lisRegle: 'figuresRectilignes-triangleIsocèleMesureAnglesisométriqueOk1'
		si: 'triangle  ?t [ isocèle:  [ sommet: ?s angles: ?ang1 ?ang2 ] ]
relationCrée:et:nom:  ?ang1 ?ang2 isométrique'
		alors: 'relationCréée   ?ang1 ?ang2 isométrique'
		com: 'Pour un triangle isocèle les angles autres que celui à l''intersection des côtés isométriques sont isométriques'.
	arg1
		lisRegle: 'figuresRectilignes-triangleIsocèleMesureAnglesisométriqueSommet1'
		si: 'mesure ?x3
mesure ?x4
relation:et:nom: [  mesure ?x3 ] [ mesure ?x4 ] isométrique'
		alors: 'somme [  mesure ?x3 ] [ mesure ?x4 ] [ double  mesure ?x4 ]'
		com: 'Si deux angles ont  des mesures isométriques, leur somme est le double de l''une d''eux.'.
	arg1
		lisRegle: 'figuresRectilignes-triangleIsocèleMesureAnglesisométriqueSomme2'
		si: 'mesure ?x3
mesure ?x4
relation:et:nom: [  mesure ?x3 ] [ mesure ?x4 ] isométrique'
		alors: ' somme [  mesure ?x3 ] [ mesure ?x4 ] [ double  mesure ?x3 ]'
		com: 'Si deux angles ont  des mesures isométriques, la somme de leurs mesures est le double de l''une des mesures'.
	arg1
		lisRegle: 'figuresRectilignes-PointSurmédiatrice1'
		si: 'segment ?s [ ?c ?b ]
médiatrice ?m ?s
pointSur ?m ?pt
segment ?s1 [ ?b ?pt ]
segment ?s2 [ ?c ?pt ]
relationCrée:et:nom: ?s1 ?s2 '
		alors: 'relationCréée  ?s1 ?s2 isométrique'
		com: 'Soit m la médiatrice d''un segment s et P un point sur cette médiatrice, les segments reliant P aux extrémités de s sont isométriques.'.
	arg1
		lisRegle: 'figuresRectilignes-triangleisocèle1'
		si: 'triangle ?t [ côtés: [ [ ?a ?b ] [ ?b ?c ]  [ ?a ?c ] ]
triangle ?t [  orientation: gauche ]
relation:et:nom: [ ?a ?b ] [ ?b ?c ] isométrique'
		alors: 'triangle ?t [ isocèle:  [ sommet:  ?b angles: [ ?b  ?a ?c ] [ ?a ?c ?b ] ] ]'
		com: 'Un triangle qui a 2 côtés isométriques est isocèle du sommet  à l''intersection de ces côtés, les angles autres que le sommet sont isométriques.'.
	arg1
		lisRegle: 'figuresRectilignes-triangleisocèle2'
		si: 'triangle ?t [ côtés: [ [ ?a ?b ] [ ?b ?c ]  [ ?a ?c ] ]
triangle ?t [ orientation: gauche ]
relation:et:nom: [ ?a ?c ]  [ ?b  ?c ] isométrique'
		alors: 'triangle ?t [ isocèle:  [ sommet:  ?c angles: [ ?b ?a ?c ] [ ?c ?b ?a  ]  ] ]'
		com: 'Un triangle qui a 2 côtés isométriques est isocèle du sommet  à l''intersection de ces côtés, les angles autres que le sommet sont isométriques.'.
	arg1
		lisRegle: 'figuresRectilignes-triangleisocèle3'
		si: 'triangle ?t [ côtés: [ [ ?a ?b ] [ ?b ?c ]  [ ?a ?c ] ]
relation:et:nom:  [ ?a ?c ]  [ ?a ?b ]  isométrique'
		alors: 'triangle ?t [ isocèle:  [ sommet:  ?a angles: [ ?c ?b ?a ] [  ?a ?c ?b  ] ] ]'
		com: 'Un triangle qui a 2 côtés isométriques est isocèle du sommet  à l''intersection de ces côtés, les angles autres que le sommet sont isométriques.'.
	arg1
		lisRegle: 'figuresRectilignes-triangleisocèleCôtéOpposé1'
		si: 'triangle ?t [ anglesIsométriques:  [  ?x2  ?a ?b ] [  ?a ?b ?x2 ] ]
segment ?s [ ?a ?b ]'
		alors: 'triangle ?t [ segmentOpposé: ?s ] ]'
		com: 'Le segment opposé au sommet du triangle isocèle'.
	arg1
		lisRegle: 'figuresRectilignes-triangleisocèleCôtéOpposé2'
		si: 'triangle ?t [ anglesIsométriques:  [  ?x2  ?a ?b ] [  ?a ?b ?x2 ] ]
segment ?s [ ?b ?a ]'
		alors: 'triangle ?t [ segmentOpposé: ?s ] ]'
		com: 'Le segment opposé au sommet du triangle isocèle'.
	arg1
		lisRegle: 'figuresRectilignes-triangleRectangle1'
		si: 'triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
triangle ?t [  sommets: [  ?a ?b ?c ] ]
perpendiculaire ?s1 ?s3'
		alors: 'triangle ?t   [ rectangle: [ sommet: ?a côtés: ?s1 ?s3 ] ]'
		com: 'Un triangle qui a deux côtés perpendiculaires est rectangle au point d''intersection de ces côtés'.
	arg1
		lisRegle: 'figuresRectilignes-triangleRectangle2'
		si: 'triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
triangle ?t [  sommets: [  ?a ?b ?c ] ]
perpendiculaire ?s1 ?s2'
		alors: 'triangle ?t   [ rectangle: [ sommet: ?b côtés: ?s1 ?s2 ] ]'
		com: 'Un triangle qui a deux côtés perpendiculaires est rectangle au point d''intersection de ces côtés'.
	arg1
		lisRegle: 'figuresRectilignes-triangleRectangle3'
		si: 'triangle ?t [  sommets: [  ?a ?b ?c ] ]
triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ]           
perpendiculaire ?s2 ?s3'
		alors: 'triangle ?t   [ rectangle: [ sommet: ?c côtés: ?s2 ?s3 ] ]'
		com: 'Un triangle qui a deux côtés perpendiculaires est rectangle au point d''intersection de ces côtés'.
	arg1
		lisRegle: 'figuresRectilignes-trianglesRectanglesIsométriques'
		si: 'triangle ?t1  [ rectangle: [ sommet:  ?p1 ]
adjacent ?s1 ?s2 ?x ?p1 ?y
adjacent ?ss1 ?ss2 ?xx ?p2 ?yy
triangle ?t2  [ rectangle: [ sommet:  ?p2 ]
different:de: ?t1 ?t2
relation:et:nom:  ?s1 ?ss1 isométrique
relation:et:nom: ?s2 ?ss2 isométrique
relationCrée:et:nom: ?t1 ?t2 isométrique'
		alors: 'relationCréée  ?t1 ?t2 isométrique'
		com: 'Deux triangles rectangle avec les côtés issus de l''angle droit respectivement isométriques sont isométriqueq'.
	arg1
		lisRegle: 'figuresRectilignes-trianglesIsométrique'
		si: 'triangle ?t1 [ côtés: [ ?c11 ?c12 ?c13 ] ]
triangle ?t2 [ côtés: [ ?c21 ?c22 ?c23 ] ]
relation:et:nom: ?c11 ?c23 isométrique
relation:et:nom: ?c12 ?c21 isométrique
relation:et:nom: ?c13 ?c22 isométrique
different:de: ?t1 ?t2
'
		alors: 'isométrique ?t1 ?t2'
		com: 'Deux triangles ayant respectivement leus côtés isométriques sont isométrique'.
	arg1
		lisRegle: 'figuresRectilignes-triangleEquilatéral'
		si: 'triangle ?t [  isocèle: [ sommet: ?s1 ] ]
triangle ?t [  isocèle: [ sommet: ?s2 ] ]
different:de: ?s1 ?s2
'
		alors: 'triangle ?t [ équilatéral ]'
		com: 'Si un triangle est isocèle en deux sommets, il est équilatéral.'.
	arg1
		lisRegle: 'figuresRectilignes-triangleEquilateral2'
		si: 'triangle ?t  [  côtés: [ [ ?x1 ?y1 ] [ ?x2 ?y2 ] [ ?x3 ?y3 ]  ] ]
triangle ?t [ non_plat  ]
ordonneMot:et:rep1:rep2:   ?x1 ?y1  ?xx1 ?yy1 
ordonneMot:et:rep1:rep2:   ?x2 ?y2  ?xx2 ?yy2  
ordonneMot:et:rep1:rep2:   ?x3 ?y3  ?xx3 ?yy3  
relation:et:nom:  [ ?xx2 ?yy2 ] [ ?xx1 ?yy1 ]  isométrique
relation:et:nom:  [ ?xx3 ?yy3 ] [ ?xx1 ?yy1 ]  isométrique
'
		alors: 'triangle ?t [ équilatéral ]'
		com: 'Un triangle qui a les trois côtés isométriques est un triangle équilatéral.'.
	arg1
		lisRegle: 'figuresRectilignes-MédianesTriangle1'
		si: 'triangle ?t [ sommets: [ ?pt ?b ?c ] ]
triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
triangle ?t [ non_plat ]
milieu ?s2  ?m 
segment   ?med [ ?pt  ?m ]'
		alors: 'triangle ?t [ médiane: [ ?med ?pt ?m ] ]'
		com: 'Une médiane du triangle.'.
	arg1
		lisRegle: 'figuresRectilignes-MédianesTriangle2'
		si: 'triangle ?t [ sommets: [ ?a ?pt ?c ] ]
triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
triangle ?t [ non_plat ]
milieu  ?s3 ?m 
segment   ?med [ ?pt  ?m ]'
		alors: 'triangle ?t [ médiane: [ ?med ?pt ?m ] ]'
		com: 'Une médiane du triangle.'.
	arg1
		lisRegle: 'figuresRectilignes-MédianesTriangle3'
		si: 'triangle ?t [ sommets: [ ?a ?b ?pt ] ]
triangle ?t [ côtés: [ ?s1 ?s2 ?s3 ] ]
milieu  ?s1 ?m 
segment   ?med [ ?pt  ?m ]'
		alors: 'triangle ?t [ médiane: [ ?med ?pt ?m ] ]'
		com: 'Une médiane du triangle.'.
	arg1
		lisRegle: 'figuresRectilignes-MédiatriceTriangle1'
		si: 'triangle ?t [ côtés:  [ ?s1 ?s2 ?s3  ] ]
triangle ?t [ non_plat ] 
médiatrice  ?m ?s1'
		alors: 'triangle ?t [ médiatrice: [ ?m  ?s1 ] ]'
		com: 'Une  médiatrice du triangle.'.
	arg1
		lisRegle: 'figuresRectilignes-MédiatriceTriangle2'
		si: 'triangle ?t [ côtés: [ ?s1 ?s2 ?s3  ] ]
triangle ?t [ non_plat ] 
médiatrice ?m  ?s2'
		alors: 'triangle ?t [ médiatrice: [ ?m  ?s2 ] ]'
		com: 'Une  médiatrice du triangle.'.
	arg1
		lisRegle: 'figuresRectilignes-MédiatriceTriangle3'
		si: 'triangle ?t [ côtés: [ ?s1 ?s2 ?s3  ] ]
triangle ?t [ non_plat ]
médiatrice ?m ?s3'
		alors: 'triangle ?t [ médiatrice: [ ?m  ?s3 ] ]'
		com: 'Une  médiatrice du triangle.'.
	arg1
		lisRegle: 'figuresRectilignes-Médiatriceisocèle1'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
triangle ?t [ non_plat ]
médiatrice ?m  [ ?b ?c ] 
pointSur ?m ?a'
		alors: 'triangle ?t [ isocèle:  [ sommet: ?a ] ]'
		com: 'Un triangle qui a un sommet sur la médiatrice de son côté opposé est isocèle.'.
	arg1
		lisRegle: 'figuresRectilignes-Médiatriceisocèle2'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
triangle ?t [ non_plat ]
médiatrice ?m  [ ?a ?c ] 
pointSur ?m ?b'
		alors: 'triangle ?t [ isocèle: [ sommet: ?b ] ]'
		com: 'Un triangle qui a un sommet sur la médiatrice de son côté opposé est isocèle.'.
	arg1
		lisRegle: 'figuresRectilignes-Médiatriceisocèle3'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
triangle ?t [ non_plat ]
triangle ?t [  médiatrice: [ ?m  [ ?a ?b ] ] ]
pointSur ?m ?c'
		alors: 'triangle ?t [ isocèle: [ sommet: ?c ] ]'
		com: 'Un triangle qui a un sommet sur la médiatrice de son côté opposé est isocèle.'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscrit1'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
cercle ?cer ?i ?xf
triangle ?t  [ médiatrice: [ ?m1  ?s1 ] ]
triangle ?t  [ médiatrice: [ ?m2 ?s2 ] ]
intersection ?i ?m1 ?m2'
		alors: 'triangle ?t [ cercleCirconscrit: ?cer ]'
		com: 'Cercle circonscrit à un triangle'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscrit2'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
cercle ?cer ?i ?x
triangle ?t [ médiatrice: ?m1 ?s1 ]
triangle ?t [ médiatrice: ?m2 ?s2 ]
intersection ?i ?m1 ?m2'
		alors: 'triangle ?t [ cercle circonscrit: ?cer ]'
		com: 'Cercle circonscrit à un triangle'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscrit3'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
cercle ?cer ?i ?c
triangle ?t  [ médiatrice: ?m1 ?s1 ]
triangle ?t  [ médiatrice: ?m2 ?s2 ]
intersection ?i ?m1 ?m2'
		alors: 'triangle ?t [ cercle circonscrit: ?cer ]'
		com: 'Cercle circonscrit à un triangle'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur1.1'
		si: 'triangle ?t [ cercle circonscrit: ?cer ?i ?c ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?x'
		com: 'point sur cercle circonscrit'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur1.2'
		si: 'triangle ?t [ cercle circonscrit: ?cer ?i ?c ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?b'
		com: 'point sur cercle circonscrit'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur2.1'
		si: 'triangle ?t  [ cercle circonscrit: ?cer ?i ?a ]
triangle ?t [ sommets: [  ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?b'
		com: 'point sur cercle circonscrit'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur2.2'
		si: 'triangle ?t [ cercle circonscrit: ?cer ?i ?a ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?c'
		com: 'point sur cercle circonscrit'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur3.1'
		si: 'triangle ?t  [ cercle circonscrit: ?cer ?i ?b ]
triangle ?t [ sommets: [ ?a ?b ?c ] ['
		alors: 'pointSur ?cer ?a'
		com: 'point sur cercle circonscrit'.
	arg1
		lisRegle: 'figuresRectilignes-cercleCirconscritpointSur3.2'
		si: 'triangle ?t [ cercle circonscrit: ?cer ?i ?b ]
triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: 'pointSur ?cer ?c'
		com: ''.
	arg1
		lisRegle: 'figuresRectilignes-bissectriceTriangle1'
		si: ' triangle ?t [ sommets: [ ?a ?b ?c ] ]
bissectrice  ?x1 [ ?y ?a ?z ]'
		alors: ' triangle ?t [ bissectrice: [ ?x1  sommet: ?a ] ]'
		com: 'Bissectrice de l''angle à un sommet.'.
	arg1
		lisRegle: 'figuresRectilignes-bissectriceTriangle2'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
bissectrice  ?x1 [ ?y ?b ?z ]'
		alors: ' triangle ?t [ bissectrice: [ ?x1 sommet: ?b ] ]'
		com: 'Bissectrice de l''angle à un sommet.'.
	arg1
		lisRegle: 'figuresRectilignes-bissectriceTriangle3'
		si: 'bissectrice  ?x1 [ ?x ?c ?y ]
 triangle ?t [ sommets: [ ?a ?b ?c ] ]'
		alors: ' triangle ?t [ bissectrice: [ ?x1 sommet: ?c ]  ]'
		com: 'Bissectrice de l''angle à un  sommet.'.
	arg1
		lisRegle: 'figuresRectilignes-bissectriceTriangle1b'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
bissectrice  ?bis ?b ?a ?c
'
		alors: ' triangle ?t [ bissectrice: [ ?bis sommet: ?a ] ]'
		com: 'Bissectrice de l''angle à un  sommet.'.
	arg1
		lisRegle: 'figuresRectilignes-bissectriceTriangle2b'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c ] ]
bissectrice  ?bis ?a ?c ?b
'
		alors: ' triangle ?t [ bissectrice: [ ?bis sommet: ?c ] ]'
		com: 'Bissectrice de l''angle à un  sommet.'.
	arg1
		lisRegle: 'figuresRectilignes-bissectriceTriangle3b'
		si: 'triangle ?t [ sommets: [ ?a ?b ?c>>>] ]
bissectrice  ?bis ?c ?b ?a
'
		alors: ' triangle ?t [ bissectrice: [ ?bis sommet: ?b ]  ]'
		com: 'Bissectrice de l''angle à un  sommet.'.
	ExpertRegle figuresRectilignesuite: arg1.! !

!ExpertRegle class methodsFor: 'rules'!
figuresRectilignesSuite2: arg1
	arg1
		lisRegle: 'figuresRectilignes-CercleInscrit'
		si: 'triangle ?t [ non_plat ]
triangle ?t [ sommets: [  ?a ?b ?c] ]
bissectrice ?bis1
bissectrice ?bis2
intersection ?i ?bis1 ?bis2
cercle ?cc ?i ?p
ordonneMot:et:rep1:rep2: ?bis1 ?bis2 ?bbis1 ?bbis2'
		alors: 'triangle ?t [ cercleInscrit: [ ?cc  centre:  ?i intersection: ?bbis1 ?bbis2 ] ]'
		com: 'L''intersection des bissetrices d''un triangle est le centre du cercle inscrit dans un triangle'.
	arg1
		lisRegle: 'figuresRectilignes-sommeAngles2'
		si: 'triangle ?t  [ sommets: [  ?A ?O ?S ] ]
cercle ?cer [ centre: ?O ]
droite ?d
ordonneMot:et:rep1:rep2: ?d ?cer ?dd ?ccer
intersection ?I ?dd ?ccer
angle0 [ ?A ?S ?O ]
angle0 [ ?O ?A ?S ]
different:de: ?I ?S'
		alors: 'égal  [ somme  [ mesure [ ?A ?S ?O ]  ]  [ mesure    [ ?O ?A ?S  ] ]  ]   [ mesure [ ?A ?O ?I ]  ]'
		com: 'La somme des mesures de  deux angles d''un triangle est égale à la mesure du supplémentaire du  troisième angle'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneRayons'
		si: 'polygoneRégulier?p [  sommets: ?s ]
polygone ?p [  centre: ?c ]
point ?x
contient:el: ?s ?x
ordonneMot:et:rep1:rep2: ?c ?x ?cc ?xx'
		alors: 'polygone ?p [ rayon: [ ?cc ?xx  ] ]'
		com: 'Un rayon de polygone relie un sommet au centre du polygone, c''est aussi un rayon du cercle circonscrit au polygone'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneNbcôtés'
		si: 'polygoneRégulier ?x1 [ nombre_de_sommets: ?x6 ] ]'
		alors: 'polygoneRégulier ?x1 [ nombre_de_côtés: ?x6 ] ]'
		com: 'Un polygoneRégulier régulier: a un nombre de côtés égal au nombre de sommets'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneSommets'
		si: 'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6'
		alors: 'polygoneRégulier ?x1  [ sommets: ?x2 ] ]'
		com: 'Les sommets d''un polygone régulier de n côtés, en vert le sommet qui définit le polygone, ajoute les sommets, si nécessaires'.
	arg1
		lisRegle: 'figuresRectilignes-Polygone3def'
		si: 'polygoneRégulier ?x1 [ nombre_de_côtés: 3 ] ]'
		alors: 'polygoneRégulier  ?x1 [  quadrilatère ]'
		com: 'Un polygone de 3sommets définit un triangle'.
	arg1
		lisRegle: 'figuresRectilignes-Polygone4def'
		si: 'polygoneRégulier ?x1 [ nombre_de_côtés: 4] ]'
		alors: 'polygoneRégulier  ?x1 [  quadrilatère ]'
		com: 'Un polygone de 4 sommets définit un quadrilatère'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneNomCôté<=100'
		si: 'polygoneRégulier ?x1 [ nombre_de_côtés: ?nc ]
inférieurOuEgal:à: ?nc  100
nomPolygone:rep: ?nc ?res'
		alors: 'polygoneRégulier  ?x1 [ nom:   ?res ]'
		com: 'nomme un polygone de moins de cent côtés selon la nomenclatutre'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneNomGénéral'
		si: 'polygoneRégulier ?x1 [ nombre_de_côtés: ?nc ]'
		alors: 'polygoneRégulier  ?x1 [ PolygoneRégulier ]'
		com: 'nomme un polygone régulier'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneCréeDernierCôtés1'
		si: 'créeCôtés ?c [ ?x ]
premier:rep: ?c ?p
premier:rep: ?p ?p1
addLast:el:rep: ?c  [ ?x ?p1 ] ?res
retireFait: créeCôtés ?c [ ?x ]'
		alors: 'créeCôtés ?res'
		com: 'Crée le dernier côtés d''un polygone à partir de ses sommets reliant le dernier sommet au premier'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneCôtés'
		si: 'créeCôtés ?res'
		alors: 'polygoneRégulier ?x1  [ côtés: ?res ] ]'
		com: 'Les côtés d''un polygone régulier de n côtés.'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneCréeCôtés'
		si: 'créeCôtés ?c ?som
retireFait: créeCôtés ?c ?som
premier:rep: ?som ?p
saufPremier:rep: ?som ?sp
premier:rep: ?sp ?p2
addLast:el:rep: ?c  [  ?p ?p2 ] ?res'
		alors: 'créeCôtés ?res ?sp'
		com: 'Crée les côtés d''un polygone à partir de ses sommets'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèrePérimètre'
		si: 'polygone Tetragone?q [ périmètre:  ?p ]'
		alors: 'quadrilatère ?q [  périmètre:  ?p ]'
		com: 'Le périmètre d''un quadrilatèe'.
	arg1
		lisRegle: 'figuresRectilignes-polygoneCréeCôté'
		si: 'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6
premier:rep: ?x2 ?p
saufPremier:rep: ?x2 ?sp
premier:rep: ?sp ?p2'
		alors: 'créeCôtés [  [  ?p ?p2  ]  ] ?sp '.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneCôtésDef'
		si: 'créeCôtés  ?c ?x
polygoneRégulier ?p [  nombre_de_côtés: ?nc ]
taille:rep: ?c ?tc
égaux:et: ?nc ?tc
retireFait: créeCôtés  ?c ?x'
		alors: 'polygoneRégulier ?p [ côtés: ?c ]'
		com: 'Arrête la création des côtés d''un polygone à partir de ses sommets'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneAngleAuCentre'
		si: 'polygoneRégulier ?p [  nombre_de_sommets: ?n ]
quotient:et:rep: 360 ?n ?angle'
		alors: 'polygoneRégulier ?p [ angle_au_centre: ?angle ]'
		com: 'L''angle au centre = 360 / nombre_de_côtés'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneAngleEntreCôtés'
		si: 'polygoneRégulier ?p [ angle_au_centre: ?angle ]
difference:et:rep: 180 ?angle ?rep1'
		alors: 'polygoneRégulier ?p [ angle_entre_côtés: ?rep1 ]'
		com: 'L''angle entre côtés  = 180 - angle_au_centre, somme des angles entre rayon et côté'.
	arg1
		lisRegle: 'figuresRectilignes-PolygoneAngleEntreRayonEtCôtés'
		si: 'polygoneRégulier ?p [ angle_entre_côtés: ?angle ]
quotient:et:rep:  ?angle 2 ?rep1'
		alors: 'polygoneRégulier ?p  [ angle_entre_rayon_et_côté: ?rep1 ]'
		com: 'L''angle entre rayon et côtés  = moitié de angle_entre_côtés'.
	arg1
		lisRegle: 'figuresRectilignes-adjacent1'
		si: 'segment ?s1 [ ?a ?b ]
segment ?s2 [ ?b ?c ]
different:de: ?a ?c'
		alors: 'adjacent ?s1 ?s2 ?a ?b ?c'
		com: 'Segment adjacents.'.
	arg1
		lisRegle: 'figuresRectilignes-AireHeron'
		si: 'triangle ?x2 [ côtés: [ ?c1  ?c2 ?c3 ]
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
		com: 'Aire du triangle par la formule de Héron
demi périmètre P, côtés a b c , aire = racine  ( p (p-a)  (p-b) (p-c)  ).'.
	arg1
		lisRegle: 'figuresRectilignes-AireHéron'
		si: 'mesure  [ aireHéron triangle ?x1 ] ?aire déduite
arrondis:rep:  ?aire ?aireArr.'
		alors: 'triangle ?x1 [ aireHéron: ?aireArr ]'
		com: 'Aire du triangle par la formule de Héron
demi périmètre P, côtés a b c , aire = racine  ( p (p-a)  (p-b) (p-c)  ).'.
	arg1
		lisRegle: 'figuresRectilignes-HauteurHeron1'
		si: 'mesure [ aireHéron triangle ?t ]  ?m
triangle ?t [ sommets: [  ?s1 ?s2 ?s3  ] 
enleverDe:el:rep:  [  ?s1 ?s2 ?s3  ]  ?s1 ?cot
mesure  ?cot ?mc1
produit:et:rep: ?m 2 ?2m
quotient:et:rep: ?2m ?mc1 ?mh 
mot:et:rep: H ?s1 ?nomH'
		alors: 'mesure [ hauteur [ ?s1 ?nomH ] ] ?mh déduite'
		com: 'Hauteur calculée partir de l''aire.'.
	arg1
		lisRegle: 'figuresRectilignes-HauteurHeron2'
		si: 'mesure [ aireHéron triangle ?t ]  ?m
triangle ?t [ sommets: [  ?s1 ?s2 ?s3  ] 
enleverDe:el:rep:  [  ?s1 ?s2 ?s3  ]  ?s2 ?cot
mesure  ?cot ?mc1
produit:et:rep: ?m 2 ?2m
quotient:et:rep: ?2m ?mc1 ?mh 
mot:et:rep: H ?s2 ?nomH'
		alors: 'mesure [ hauteur [ ?s2 ?nomH ] ] ?mh déduite'
		com: 'Hauteur calculée partir de l''aire.'.
	arg1
		lisRegle: 'figuresRectilignes-HauteurHeron3'
		si: 'mesure [ aireHéron triangle ?t ]  ?m
triangle ?t [ sommets: [  ?s1 ?s2 ?s3  ] 
enleverDe:el:rep:  [  ?s1 ?s2 ?s3  ]  ?s3 ?cot
mesure  ?cot ?mc1
produit:et:rep: ?m 2 ?2m
quotient:et:rep: ?2m ?mc1 ?mh 
mot:et:rep: H ?s3 ?nomH'
		alors: 'mesure [ hauteur [ ?s3 ?nomH ] ] ?mh déduite'
		com: 'Hauteur calculée partir de l''aire.'.
	arg1
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangleEn1'
		si: 'quadrilatère  ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
perpendiculaire  ?c1 ?c2
point ?x
contient:el: ?c1 ?x
contient:el: ?c2 ?x'
		alors: 'quadrilatère ?x1q [ rectangleEn: ?x  ] '
		com: 'Si deux côtés d'' un quadrilatère sont perpendiculaires, le quadrilatère est rectangle en l''intersection des côtés.'.
	arg1
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangleEn2'
		si: 'quadrilatère  ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
perpendiculaire  ?c2 ?c3
point ?x
contient:el: ?c3 ?x
contient:el: ?c2 ?x'
		alors: 'quadrilatère ?x1 [ rectangleEn: ?x  ]'
		com: 'Si deux côtés d''un quadrilatère sont perpendiculaires, le quadrilatère est rectangle en l''intersection des côtés.'.
	arg1
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangleEn3'
		si: 'quadrilatère  ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
perpendiculaire  ?c3 ?c4
point ?x
contient:el: ?c3 ?x
contient:el: ?c4 ?x'
		alors: 'quadrilatère ?x1 [ rectangleEn: ?x ]'
		com: 'Si deux côtés d'' un quadrilatère sont perpendiculaires, le quadrilatère est rectangle en l''intersection des côtés.'.
	arg1
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangleEn4'
		si: 'quadrilatère  ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
perpendiculaire  ?c1 ?c4
point ?x
contient:el: ?c3 ?x
contient:el: ?c4 ?x'
		alors: 'quadrilatère ?x1 [ rectangleEn: ?x ]'
		com: 'Si deux côtés d'' un quadrilatère sont perpendiculaires, le quadrilatère est rectangle en l''intersection des côtés.'.
	arg1
		lisRegle: 'figuresRectilignes-parallèlesAuxPerpendicuiaires'
		si: 'perpendiculaire  ?x1 ?x2
segment ?x1 
segment ?x2 
segment ?x3 
segment ?x4 
relation:et:nom:  ?x3 ?x1 parallèle
relation:et:nom: ?x4 ?x2 parallèle'
		alors: 'perpendiculaire ?x3  ?x4'
		com: 'Si des segments sont  perpendiculaires et respectivement parallèles à un autre segment, ces segments sont perpendiculaires.'.! !

!ExpertRegle class methodsFor: 'rules'!
figuresRectilignesuite: arg1
	arg1
		lisRegle: 'figuresRectilignes-sommeAngles1'
		si: 'triangle ?t  [ sommets: [  ?B ?O ?S ] ]
cercle ?cer [ centre: ?O ]
droite ?d
ordonneMot:et:rep1:rep2: ?d ?cer ?dd ?ccer
intersection ?I ?dd ?ccer
angle0 [ ?S ?B ?O ]
angle0 [ ?O ?S ?B ]
different:de: ?I ?S'
		alors: 'égal  [ somme  [ mesure  [ ?O ?S ?B ]  ]  [ mesure  [ ?S ?B ?O ]  ]  ]   [ mesure [ ?I ?O  ?B ]   ]'
		com: 'La somme des mesures de  deux angles d''un triangle est égale à la mesure du supplémentaire du  troisième angle'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèrediagonale1'
		si: 'quadrilatère ?l [ sommets: [ ?a ?b ?c ?d ] ]'
		alors: 'quadrilatère ?l [  diagonale: [ ?a ?c  ] ]'
		com: 'diagonale reliant le premier au troisième sommet.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèrediagonale2'
		si: 'quadrilatère ?l [ sommets: [ ?a ?b ?c ?d ] ]'
		alors: 'quadrilatère ?l [  diagonale:   [ ?b ?d  ] ] '
		com: 'diagonale reliant le deuxième au dernier sommet.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèrediagonalesPerp'
		si: 'quadrilatère  ?x1 [ diagonale: [ diagonale1  [ ?x ?y  ]  ]  ]
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
		com: 'Les diagonales  sont perpendiclaires si les extrémités de l''une des diagonales sont sur la médiatrice de l''autre .'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeDef1'
		si: 'quadrilatère ?l [ côtés: [ ?ss1 ?ss2 ?ss3 ?ss4 ] 
segment ?s1 ?ss1
segment ?s3 ?ss3
relation:et:nom: ?s1 ?s3 parallèle'
		alors: 'quadrilatère ?l [ trapèze [ bases: [ ?ss1 ?ss3 ] ] ]'
		com: 'Un quadrilatère avec une paire de côtés parallèles est un trapèze. Ces côtés sont appelés Bases'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeDef2'
		si: 'quadrilatère ?l [ côtés: [ ?ss1 ?ss2 ?ss3  ?ss4 ] ]
segment ?s2 ?ss2
segment ?s4 ?ss4
relation:et:nom: ?s2  ?s4 parallèle'
		alors: 'quadrilatère ?l [ trapèze [ bases: [  ?ss2 ]   ?ss4 ] ]'
		com: 'Un quadrilatère avec une paire de côtés parallèles est un trapèze. Ces côtés sont appelés Bases'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeDef1Direction'
		si: 'quadrilatère ?l [ côtés: [ ?ss1 ?ss2 ?ss3 ?ss4 ] 
segment ?s1 ?ss1
segment ?s3 ?ss3
relation:et:nom: ?s1 ?s3 parallèleDirection'
		alors: 'quadrilatère ?l [ trapèze [ bases: [ ?ss1 ?ss3 ] ] ]'
		com: 'Un quadrilatère avec une paire de côtés de même direction est un trapèze. Ces côtés sont appelés Bases'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeDef2Direction'
		si: 'quadrilatère ?l [ côtés: [ ?ss1 ?ss2 ?ss3  ?ss4 ] ]
segment ?s2 ?ss2
segment ?s4 ?ss4
relation:et:nom: ?s2  ?s4 parallèleDirection'
		alors: 'quadrilatère ?l [ trapèze [ bases: [  ?ss2 ]   ?ss4 ] ]'
		com: 'Un quadrilatère avec une paire de côtés de même direction est un trapèze. Ces côtés sont appelés Bases'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèze'
		si: 'quadrilatère ?l [ trapèze [ bases: [ ?b1 ?b2 ] ] ]'
		alors: 'quadrilatère ?l [ trapèze ]'
		com: 'Pour afficher seulement le type de quadrilatère'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeRectangle-Hauteur1'
		si: 'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ]  ]  ] 
distance [ ?b1 ?b2 ] [  ?p1 ?p2 ]'
		alors: 'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ] ] [ hauteur: [ ?p1 ?p2 ] ]'
		com: 'La mesure de la hauteur d''un trapèze est  la distance entre les bases'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeRectangle-Hauteur2'
		si: 'quadrilatère ?q  [ trapèze  [ bases:  [ ?b1 ?b2 ]  ] [ hauteur: [ ?p1 ?p2 ]  ] 
segment ?s1 ?b1
segment ?s2 ?b2
pointSur ?b1 ?a
pointSur ?b2 ?b
segmenrt ?s3 [ ?a ?b ]
perpendiculaire ?s3 ?b1
perpendiculaire ?s2 ?s1'
		alors: 'quadrilatère ?q [ hauteur: ?s1 ]'
		com: 'La mesure de la hauteur d''un trapèze est  la distance entre les bases'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeIRectangle3a'
		si: 'quadrilatère ?q [ sommets: [  ?a ?b ?c ?d2  ]
quadrilatère ?q [  rectangleEn: ?a ]
quadrilatère ?q [  rectangleEn: ?b ]
quadrilatère ?q [  rectangleEn: ?c ]
quadrilatère ?q [  rectangleEn: ?d ]
'
		alors: 'quadrilatère ?q [ rectangle ]'
		com: 'Un trapèze rectangle en chaque sommet est un rectangle.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreTrapèzeIsocèle3b'
		si: 'quadrilatère ?q [ sommets: [  ?a ?b ?c ?d1  ]
angleOrienté ?ang [ ?val ?c ?b ?a ] 
alignement [  ?c   ?d2 ?d1 ]
égal:à:  ?val 90'
		alors: 'quadrilatère ?q [ rectangle ]'
		com: 'Trapèze isocèle et rectangle, une seule intersection, angle droit.'.
	arg1
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangle1'
		si: 'quadrilatère ?q [ trapèze  [ bases:  [  ?b1  ?b2 ]    ]  [ hauteur:  [ ?h1 ?h2 ]  ]  ] 
quadrilatère ?q [ côtés: ?cot ]
contient:el: ?cot [ ?h1 ?h2 ]'
		alors: 'quadrilatère ?q [  rectangleEn:  ?h1 ]'
		com: 'Un quadrilatère qui a 2 côtés perpendiclaires est rectangle  en l''intersection de ces deux côtés.'.
	arg1
		lisRegle: 'figuresRectilignes-QuadrilatèreRectangle2'
		si: 'quadrilatère ?q [ trapèze  [ bases:  [  ?b1  ?b2 ]    ]  [ hauteur:  [ ?h1 ?h2 ]  ]  ] 
quadrilatère ?q [ côtés: ?cot ]
contient:el: ?cot [ ?h1 ?h2 ]'
		alors: 'quadrilatère ?q [  rectangleEn: ?h2 ]'
		com: 'Un quadrilatère qui a 2 côtés perpendiclaires est rectangle  en l''intersection de ces deux côtés.'.
	arg1
		lisRegle: 'figuresRectilignes-distanceBases'
		si: 'quadrilatère ?t [ trapèze [ bases: [ ?b1 ?b2 ] ]
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
		com: 'La distance entre deux parallèles est la distance entre les intersections des parallèles avec une perpendiculaire aux parallèles'.
	arg1
		lisRegle: 'figuresRectilignes-trapèzeAire0'
		si: 'quadrilatère ?q [ trapèze  [ bases:  [  ?b1 ?b2  ] ] [ hauteur:  ?h ]  ] 
mesure ?h ?mh
mesure  [ moyenne  ?b1 ?b2  ] ?moy
produit:et:rep: ?moy ?mh ?aire'
		alors: 'mesure [ aire0  trapèze ?q ] ?aire déduite'
		com: 'Aire de trapèze = (moyenne des bases) x hauteur.'.
	arg1
		lisRegle: 'figuresRectilignes-trapèzeAireMesure'
		si: 'quadrilatère ?q [ aire0: [ ?aire trapèze [  bases: [  ?b1 ?b2 ] hauteur: ?h ] ]
~ mesure [ aire trapèze ?q ] ?aire donnée'
		alors: 'mesure [ aire trapèze ?q ] ?aire déduite'
		com: 'Mesure de l''aire d''un trapèze.'.
	arg1
		lisRegle: 'figuresRectilignes-trapèzeMoyenne>DesBases'
		si: 'quadrilatère ?q [ trapèze [  bases: [  ?b1 ?b2 ] ] [ hauteur: [ ?x1 ?x2 ] ] 
mesure ?b1 ?mb1
mesure ?b2 ?mb2
somme:et:rep: ?mb1 ?mb2 ?som
quotient:et:rep: ?som 2 ?moy
~ mesure  [ moyenne  ?b1 ?b2  ] ?moy'
		alors: 'mesure  [ moyenne  ?b1 ?b2  ] ?moy'
		com: 'calcul de la moyenne des bases'.
	arg1
		lisRegle: 'figuresRectilignes-trapèzeHauteurCalcul'
		si: 'mesure [ aire trapèze ?q ] ?aire
mesure  [ moyenne  ?b1 ?b2  ] ?moy
quadrilatère ?q [  trapèze [  bases: [  ?b1 ?b2 ] hauteur: ?h ] ] 
quotient:et:rep: ?aire ?moy ?mh
~ mesure ?h ?mh'
		alors: 'mesure ?h ?mh'
		com: 'Calcul de la Hauteur à partir de la moyenne des bases.'.
	arg1
		lisRegle: 'figuresRectilignes-trapèzeMoyenneBasesCalcul'
		si: 'mesure [ aire cerf-volant ?q ] ?aire
mesure ?h ?mh
quadrilatère ?q [  trapèze [  bases: [  ?b1 ?b2 ] hauteur: ?h ] ] 
quotient:et:rep: ?aire ?mh ?moy 
~ mesure [ moyenne [ ?b1 ?b2 ] ]   ?mh'
		alors: 'mesure [ moyenne [ ?b1 ?b2 ] ]   ?mh'
		com: 'Calcul de la moyenne des bases à partir de l''aire et de la hauteur'.
	arg1
		lisRegle: 'figuresRectilignes-trapèzeAire'
		si: 'mesure [ aire  ?q ]  ?aire
arrondis:rep: ?aire ?aireArr'
		alors: 'quadrilatère ?q [ aire: ?aireArr ]'
		com: 'Aire arrondie'.
	arg1
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle1'
		si: 'quadrilatère ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
quadrilatère  ?x1 [ trapèze [ bases: [ ?c1 ?c3 ] ] ]
relation:et:nom:   ?c2 ?c4 isométrique'
		alors: 'quadrilatère ?x1 [ isocèle: [ côtés: [  ?c2 ?c4 ] ] ]'
		com: 'Un trapèze qui a les côtès opposés isométriques est isocèle.'.
	arg1
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle1Trapèze'
		si: 'quadrilatère ?x1 [ isocèle: [ côtés: [ ?c2 ?c4 ] ] ]'
		alors: 'quadrilatère ?x1 [ trapèze ]'
		com: 'Pour afficher seulement le type de quadrilatère'.
	arg1
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle2'
		si: 'quadrilatère ?x1 [ côtés: [ ?c1 ?c2 ?c3 ?c4 ] ]
relation:et:nom:   ?c1 ?c3 isométrique'
		alors: 'quadrilatère ?x1 [ isocèle: [  côtés:   ?c1 ?c3 ] ]'
		com: 'Un trapèze qui a les côtès opposés isométriques est isocèle.'.
	arg1
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle2Trapèze'
		si: 'quadrilatère ?x1 [ trapèze_isocèle2: [ côtés: ?c1 ?c3 ] ]'
		alors: 'quadrilatère ?x1 [ trapèze_isocèle ]'
		com: 'Pour afficher seulement le type de quadrilatère'.
	arg1
		lisRegle: 'figuresRectilignes-TrapèzeIsocèle3'
		si: 'quadrilatère ?q [ isocèle: [ côtés: ?x [ ?a ?e ] ] ]
quadrilatère ?q [ trapèze [ bases: [ [ ?a ?b ] [  ?p ?e ] ]  ] ]
perpendiculaire ?perp ?d ?e
segment ?s [ ?aa ?bb ]
intersection ?i ?perp ?s
relationCrée:et:nom:   ?c1 ?c3 isométrique'
		alors: 'relationCréée TrapèzeIsocèle3 [ ?a ?b ] [ ?p ?e ] isométrique'
		com: 'Un trapèze isocèle avec une des bases ayant une intersection avec la perpendiculaire à cette base issue de l''extémité du côtè opposé, a ses bases  isométriques et est un aussi un parallélogramme.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèrediagonaleParalléloBases'
		si: 'quadrilatère  ?x1 [ trapèze ?x2 ]
quadrilatère  ?x1 [ trapèze  ?x3 ]
different:de: ?x2 ?x3'
		alors: 'quadrilatère ?x1 [ parallélogramme  ]'
		com: 'Si chaque paire de côtés opposés d''un quadrilatère sont les bases d''un trapèze, le quadrilatère est un parallélogramme.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreCôtésParallèlesEtIsocèles'
		si: 'quadrilatère  ?x1 [ isocèle: [ côtés: [ ?c1 ?c2 ] ]
mêmePente ?c1 ?c2'
		alors: 'quadrilatère ?x1 [ parallélogramme  ]'
		com: 'Si les côtés d''un trapèze isocèle ont une même pente,  ce trapèze est un parallélogramme.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreCôtésParallèlesEtIsocèlesAngle droit'
		si: 'segment ?s1 ?c1
segment ?s2 ?c2
pente:rep: ?s1 ?p1
pente:rep: ?s2 ?p2
abs:rep: ?p1 ?pp1
abs:rep: ?p2 ?pp2
supérieur:à: ?pp1 1.0e13
supérieur:à: ?pp2 1.0e13'
		alors: 'mêmePente ?s1 ?s2'
		com: 'Des segments pente infinie ont une même pente.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreCôtésParallèlesEtIsocèlesAngle droit'
		si: 'égaux:et: ?c1 [ B  C ]
segment ?s1 ?c1
segment ?s2 ?c2
pente:rep: ?s1 ?p1
pente:rep: ?s2 ?p2
égal:à: ?p1 ?p2
different:de: ?s1 ?s2'
		alors: 'mêmePente ?c1 ?c2'
		com: 'Des segments de même pente en valeur absolue.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreParallélogrammeIsométrieSeg1'
		si: 'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3 ?s4 ] ]
quadrilatère ?l [  parallélogramme  ]
relationCrée:et:nom:  ?s2 ?s4 isométrique'
		alors: 'relationCréée  ?s2 ?s4 isométrique'
		com: 'les côtés opposés d''un parallélogramme sont isométriques.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreParallélogrammeIsométrieSeg2'
		si: 'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3 ?s4 ] ]
quadrilatère ?l [  parallélogramme  ]
relationCrée:et:nom:  ?s1 ?s3 isométrique'
		alors: 'relationCréée  ?s1 ?s3 isométrique'
		com: 'les côtés opposés d''un parallélogramme sont isométriques.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreParallelogrammeIsometrieRéciproque1'
		si: 'quadrilatère ?q [  segments: [ ?s1 ?s2 ?s3 ?s4 ] ]
isométrique  ?s1 ?s3
isométrique  ?s2 ?s4'
		alors: 'quadrilatère ?q [ parallelogramme ]'
		com: 'Si un quadrilatère a 2 paires de côtés opposés isométriques, c''est un parallèlogramme.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreParallelogrammeParallèle1'
		si: 'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3 ?s4 ] ]
quadrilatère ?l [  parallélogramme ]
segment ?s1 ?ss1
segment ?s3 ?ss3'
		alors: 'parallèle ?ss1 ?ss3'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreParallelogrammeParallèle2'
		si: 'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3  ?s4 ]  ]
quadrilatère ?l [  prallélogramme  ]
segment ?s2 ?ss2
segment ?s4 ?ss4'
		alors: 'parallèle ?ss2 ?ss4'
		com: 'Les côtés opposés d''un paralélogramme sont parallèles.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreParallèlogramme'
		si: 'quadrilatère ?l [ côtés: [  ?s1 ?s2 ?s3 ?s4 ] ]
segment ?seg1 ?s1
segment ?seg2 ?s2
segment ?seg3 ?s3
segment ?seg4 ?s4
parallèle ?seg1 ?seg3
parallèle ?seg2 ?seg4
'
		alors: 'quadrilatère ?l [ parallélogramme ]'
		com: 'Un quadilatère avec deux paires de côtés parallèles est un parallélogramme.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLosangeparallèlögramme'
		si: 'quadrilatère ?l [ losange ]'
		alors: 'quadrilatère ?l [ parallélogramme ]'
		com: 'Un losange est aussi un parallélogramme.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLosangeparallèles1'
		si: 'quadrilatère ?l [ losange ]
quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3  ?s4 ]'
		alors: 'parallèle ?s1 ?s3'
		com: ' Les côtés opposés d''un losange sont parallèles.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLosangeparallèles2'
		si: 'quadrilatère ?l [ losange ] 
quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3  ?s4 ]'
		alors: 'parallèle ?s2 ?s4'
		com: ' Les côtés opposés d''un losange sont parallèles.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreCarré1'
		si: 'quadrilatère ?l [ rectangle ]
quadrilatère ?l [ losange  ]'
		alors: 'quadrilatère ?l [  carré  ]'
		com: 'Si un quadrilatère est à la fois un losange et un rectangle, c''est un carré'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreCarréIsométrie'
		si: 'quadrilatère  ?q [ carré ]
quadrilatère ?q [ diagonale: [ diagonale1 ?d1 ] ]
quadrilatère ?q [ diagonale: [ diagonale2 ?d2 ] ]'
		alors: 'isométrique ?d1 ?d2'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreRectangle'
		si: 'quadrilatère ?l [ côtés: [ ?s1 ?s2 ?s3 ?s4 ] ] 
quadrilatère ?l [ parallélogramme]
perpendiculaire ?s1 ?s2
perpendiculaire ?s2 ?s3'
		alors: 'quadrilatère ?l [ rectangle   ]'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLosange3'
		si: 'quadrilatère ?q [ diagonale: ?x1 ] 
 quadrilatère ?q [ diagonale: ?x2 ] 
perpendiculaire ?x1 ?x2
different:de:  ?x1 ?x2'
		alors: 'quadrilatère ?q [ losange ]'
		com: 'Un quadrilatère avec les diagonales qui se coupent en leur milieu et sont perpendiculaires est un losange'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLosange'
		si: 'quadrilatère ?q [ côtés: [ [ ?x1 ?y1 ]   [ ?x2 ?y2 ]   [ ?x3 ?y3 ]  [ ?x4 ?y4 ]   ] ]
relation:et:nom:   [ ?x1 ?y1 ] [ ?x2 ?y2 ] isométrique
relation:et:nom:   [ ?x1 ?y1 ] [ ?x3 ?y3 ] isométrique
relation:et:nom:   [ ?x1 ?y1 ] [ ?x4 ?y4 ] isométrique'
		alors: 'quadrilatère ?q [ losange ]'
		com: 'Un quadrilatère avec tous les côtés isométriques entre eux est un losange'.
	arg1
		lisRegle: 'figuresRectilignes-LosangeaussiCerf-volant'
		si: 'quadrilatère ?q [ losange ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com: 'Un losange est aussi un cerf-volant'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantIsométrie1'
		si: 'quadrilatère ?q [ côtés: [ ?x1 ?x2 ?x3 ?x4 ] ]
relation:et:nom: ?x1 ?x2 isométrique
relation:et:nom: ?x4 ?x3 isométrique
tousDifferents: [ ?x1 ?x2 ?x3 ?x4 ]'
		alors: 'quadrilatère ?q [ cerf-volant1 ]'
		com: 'Un quadrilatère avec deux paires de côtés isométriques est un cerf-volant'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantIsométrie2'
		si: 'quadrilatère ?q [ côtés: [ ?x1 ?x2 ?x3 ?x4 ] ]
relation:et:nom: ?x1 ?x4 isométrique
relation:et:nom: ?x2 ?x3 isométrique
tousDifferents: [ ?x1 ?x2 ?x3 ?x4 ]'
		alors: 'quadrilatère ?q [ cerf-volant2 ]'
		com: 'Un quadrilatère avec deux paires de côtés isométriques est un cerf-volant'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volant1Cerf-Volant'
		si: 'quadrilatère ?q [ cerf-volant1 ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com: 'Un quadrilatère avec deux paires de côtés isométriques est un cerf-volant.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volant2Cerf-Volant'
		si: 'quadrilatère ?q [ cerf-volant2 ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com: 'Un quadrilatère avec deux paires de côtés isométriques est un cerf-volant.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreCerfVolantDiagonales'
		si: 'perpendiculaire [ ?x1 ?x2 ] [ ?x3 ?x4 ]
quadrilatère ?q [ diagonale: ?diag1  ]
quadrilatère ?q [ diagonale: ?diag2  ]
contient:el: ?diag1 ?x1
contient:el: ?diag1 ?x2
contient:el: ?diag2 ?x3
contient:el: ?diag2 ?x4'
		alors: 'quadrilatère ?q [  cerf-volant ]'
		com: 'Si les diagonales d''un quadrilatère sont perpendiculaires, alors le quadrilatère est un cerf-volant.'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLosange'
		si: 'quadrilatère ?q [ cerf-volant1 ]
quadrilatère ?q [ cerf-volant2 ]'
		alors: 'quadrilatère ?q [ losange ]'
		com: 'Un quadrilatère formés de deux  cerf-volants est un losange'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantRéflexion'
		si: 'quadrilatère  ?x1 [ diagonale: [ ?x2 ?x3 ] ]
reflexion  ?xr1 ?xr2 ?r
contient:el: [  ?x2 ?x3 ] ?xr1 
contient:el: [  ?x2 ?x3 ] ?xr2'
		alors: 'quadrilatère  ?x1 [ cerf-volant ]'
		com: 'Un quadrilatère dont une diagonale a pour extrémités un sommet et l''image d''un sommet par une réflection dont l''axe  passe par les deux autre sommets est un cerf-volant'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantRéflexion'
		si: 'quadrilatère  ?x1 [ diagonale: [ ?x2 ?x3 ] ]
quadrilatère  ?x1 [ diagonale: [ ?x4 ?x5 ] ]
reflexion ?x2 ?x3 ?r
droite ?r ?x4 ?x5'
		alors: 'quadrilatère  ?x1 [ cerf-volant ]'
		com: 'Un quadrilatère dont une diagonale a pour extrémités un sommet et l''image d''un sommet par une réflection dont l''axe  passe par les deux autre sommets est un cerf-volant'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantdiagonales1'
		si: 'quadrilatère ?q [ sommets: ?som ]
quadrilatère ?q [  diagonale: [ ?x1 ?x2 ] ]
quadrilatère ?q [  diagonale: [ ?x3 ?x4 ] ]
perpendiculaire  [ ?x3 ?x4 ] [ ?x1 ?x2 ] 
different:de: [ ?x3 ?x4 ] [ ?x1 ?x2 ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com: 'Un quadrilatère est un cerf-volan si ses diagonales se coupent à angle droit, la diagonale qui est la médiatrice de deux sommets opposés est l''axe de symétrie du cerf-volant'.
	arg1
		lisRegle: 'figuresRectilignes-quadrilatèreLCerf-volantdiagonales2'
		si: 'quadrilatère ?q [ sommets: ?som ]
quadrilatère ?q [  diagonale: [ ?x1 ?x2 ] ]
quadrilatère ?q [  diagonale: [ ?x3 ?x4 ] ]
perpendiculaire   [ ?x1 ?x2 ]  [ ?x3 ?x4 ]'
		alors: 'quadrilatère ?q [ cerf-volant ]'
		com: 'Un quadrilatère est un cerf-volant si ses diagonales se coupent à angle droit, la diagonale qui est la médiatrice de deux sommets opposés est l''axe de symétrie du cerf-volant'.
	arg1
		lisRegle: 'figuresRectilignes-Milieudiagonales1'
		si: 'quadrilatère ?q [ cerf-volant ]
symetrieCentrale  ?x1 ?y2 ?centre
ordonneMot:et:rep1:rep2: ?x1 ?y2 ?xx1 ?yy2
quadrilatère ?q [ diagonale: [ ?xx1 ?yy2 ] ]
quadrilatère ?q [ diagonale: [ ?x3 ?y4 ] ]
médiatrice ?m [ ?x3 ?x4 ]
pointSur ?m ?xx1
pointSur ?m ?yy2'
		alors: 'milieu [ ?x3 ?x4 ] ?centre'
		com: 'Si les extrémités d''une diagonale d''un cerf-volant sont un point et son image par une symétrie centrale de centre O et sur la médiatrice de l''autre diagonale, les diagonales se coupent en leur milieu, au centre de symétrie.'.
	arg1
		lisRegle: 'figuresRectilignes-Cerf-volantAire0'
		si: 'quadrilatère ?q [  cerf-volant ]
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
	arg1
		lisRegle: 'figuresRectilignes-Cerf.volantAireDiagonale1'
		si: 'quadrilatère ?q [ diagonale: [ diagonale1 [ ?a ?b  ] ]
quadrilatère ?q [ diagonale: [ diagonale2 [ ?d ?e  ] ]
mesure  [ trapèze ?q aire ] ?mta
mesure  [ ?d ?e ] ?m2
quotient:et:rep: ?mta   ?m2  ?res
produit:et:rep: ?res  2 ?m1
'
		alors: 'mesure [  ?a ?c ] ?m1'
		com: 'calcul de la diagonale2'.
	arg1
		lisRegle: 'figuresRectilignes-QuadrilatèreAire'
		si: 'mesure [ aire quadrilatère ?q ] ?aire0
arrondis:rep: ?aire0 ?aire'
		alors: 'quadrilatère ?q [ aire: ?aire ]'
		com: 'Aire arrondie'.
	arg1
		lisRegle: 'figuresRectilignes-Cerf.volantMesureAire'
		si: 'quadrilatère ?q [ aire0: [ ?aire0 cerf-volant [] ]
arrondis:rep: ?aire0 ?aire
~ mesure [ aire cerf-volant ?q  ] ?aire'
		alors: 'mesure [ aire cerf-volant ?q  ] ?aire'
		com: 'Mesure aire cerf-volant'.
	arg1
		lisRegle: 'figuresRectilignes-Approximation1'
		si: 'quadrilatère ?q [ aire0: [ ?aire2 ?type2  ?val2  ] ]
quadrilatère ?q [ aire0: [ ?aire1 ?type1  ?val1 ] ]
different:de: ?val1 ?val2
supérieur:à: ?aire2 ?aire1
retireFait: quadrilatère ?q [ aire0: [ ?aire2 ?type2  ?val1 ] ]'
		alors: 'quadrilatère ?q [ aire0: [ ?aire1 ?type2 ?val2 ] ]'
		com: 'Approximation d''une valeur.'.
	arg1
		lisRegle: 'figuresRectilignes-MesureCôté'
		si: 'quadrilatère ?q [ aire0: [ ?aire ?type ?val ] ]
quadrilatère ?q [ trapèze  [ bases:  [  ?b1 ?b2 ] hauteur: ?h  ]  ] 
mesure ?h ?mh
quotient:et:rep: ?aire ?mh ?quo'
		alors: 'mesure [ moyenne [ ?b1 ?b2 ] ] ?quo'
		com: 'la moyenne des mesures des bases est l''aire divisée par la hauteur'.
	arg1
		lisRegle: 'figuresRectilignes-diagonale'
		si: 'quadrilatère ?q [ trapèze ]
quadrilatère ?q [ cerf-volant ]
quadrilatère ?q [  aire0: [ ?aire ?x ?z ] ] ]
produit:et:rep: 2 ?aire ?prod
racineDecimal:rep: ?prod ?mesDiag
quadrilatère ?q [  diagonale: ?diag ]'
		alors: 'mesure ?diag ?mesDiag'
		com: 'Diagonale calculée à partir de l''aire du carré'.
	arg1
		lisRegle: 'figuresRectilignes-diagonale'
		si: 'quadrilatère ?q [ trapèze ]
quadrilatère ?q [ cerf-volant ]
quadrilatère ?q [  aire0: [ ?aire ?x ?z ] ] ]
produit:et:rep: 2 ?aire ?prod
quadrilatère ?q [  diagonale: ?diag1 ]
quadrilatère ?q [  diagonale: ?diag2 ]
different:de: ?diag1 ?diag2'
		alors: 'mesure [ produit ?diag1 ?diag2 ] ?prod'
		com: 'Diagonale calculée à partir de l''aire du carré'.
	arg1
		lisRegle: 'figuresRectilignes-aireInverseMoyenne des bases'
		si: 'quadrilatère A:B:C:D  [ aire0:  [ ?aire trapèze  [ bases:  [  [ ?x1 ?y1 ] [ ?x2 ?y2 ] ] hauteur:  ?h  ]  ]  ] 
mesure ?h ?mh
quotient:et:rep:  ?aire ?mh ?mb
~ mesure  [ moyenne [ ?x1 ?y1 ]  [ ?x2 ?y2 ]  ] ?mb'
		alors: 'mesure  [ moyenne [ ?x1 ?y1 ]  [ ?x2 ?y2 ]  ] ?mb'
		com: 'Calcul de la moyenne des bases à partir de l''aire du trapèze.'.
	arg1
		lisRegle: 'figuresRectilignes-PositionPoint'
		si: 'sorteDeDroite  ?d ?x ?y
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
		com: 'Position d''un point par rapport à une droite, dépend de l''orientation du triangle formé par les points qui définissent la droite et le point'.
	arg1
		lisRegle: 'figuresRectilignes-PositionPointInverse1'
		si: 'sorteDeDroite  ?d ?x ?y
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
		com: 'Position d''un point par rapport à une droite, dépend de l''orientation du triangle formé par les points qui définissent la droite et le point'.
	arg1
		lisRegle: 'figuresRectilignes-PositionPointInverse2'
		si: 'sorteDeDroite  ?d ?x ?y
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
		com: 'Position d''un point par rapport à une droite, dépend de l''orientation du triangle formé par les points qui définissent la droite et le point'.
	ExpertRegle figuresRectilignesSuite2: arg1.! !

!ExpertRegle class methodsFor: 'rules'!
homothétie: arg1
	arg1
		lisRegle: 'homothétie-thales'
		si: 'homothétie ?ix ?x ?c ?v2
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
	arg1
		lisRegle: 'homothétie-defPoint'
		si: 'homothétie ?ix ?c ?x ?v'
		alors: 'point ?ix'
		com: 'l''image d''un point par une homothétie est un point'.
	arg1
		lisRegle: 'homothétie-rec'
		si: 'homothétie ?ix ?c ?x ?v
quotient:et:rep: 1 ?v ?rep'
		alors: 'homothétie ?ix ?x ?c ?rep'
		com: 'L''image d''une d''un point par une homothétie de centre C et  de rapport v  est la même que l''image de C par l''homothétie de centre x de rapport 1 / v '.
	arg1
		lisRegle: 'homothétie-SegmentsRapport1'
		si: 'intersection ?O ?d1 ?d2
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
		alors: 'homothétie ?y1 ?y2 ?O [ quotient  [ mesure  [ ?y1 ?O ]  ]  [ mesure  [  ?y2 ?O ]  ]  ] '
		com: 'Si de l''intersection de  deux droites on a des segments reliant deux points de chaque droite, dans un même rapport, un des points est l''image par une homothétie ayant ce point pour centre et de rapport le quotient des mesures des segments correspondant pour chaque droite.'.
	arg1
		lisRegle: 'homothétie-SegmentsRapport2'
		si: 'intersection ?O ?d1 ?d2
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
		alors: 'homothétie ?y3 ?y4 ?O   [ quotient  [ mesure  [ ?y3 ?O ]  ]  [ mesure  [ ?y4  ?O ]  ]  ]'
		com: 'Si de l''intersection de deux droites on a des segments reliant deux points de chaque droite, dans un même rapport, un des points est l''image par une homothétie ayant ce point pour centre et de rapport le quotient des mesures des segments correspondant pour chaque droite.'.! !

!ExpertRegle class methodsFor: 'rules'!
interface: arg1
	| temp2 |
	arg1
		lisRegle: 'interface-texte1'
		si: 'DrGTextItem ?x ?y ?z ?w'
		alors: '?y ?z   ?w'
		com: 'Donnée sous forme de  texte.'.
	arg1
		lisRegle: 'interface-texte2'
		si: 'DrGTextItem ?x ?y ?z ?u  ?w'
		alors: '?y ?z ?u  ?w'
		com: 'Donnée sous forme de  texte.'.
	temp2 _ arg1 creeRegle: 'interface-DrGPointFreeItem'.
	temp2 antecedents: 'DrGPointFreeItem  ?p '.
	temp2 concl: 'point ?p'.
	temp2 com: 'Qualification d''un point'.
	temp2 _ arg1 creeRegle: 'interface-PointInter-def'.
	temp2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	temp2 concl: 'point ?p'.
	temp2 com: 'Qualification d''un point'.
	temp2 _ arg1 creeRegle: 'interface-PointInter-defPointSur1'.
	temp2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	temp2 concl: 'pointSur ?o1 ?p'.
	temp2 com: 'Le point d''intersection est sur le premier objet'.
	temp2 _ arg1 creeRegle: 'interface-PointInter-defPointSur2'.
	temp2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	temp2 concl: 'pointSur ?o2 ?p'.
	temp2 com: 'Le point d''intersection est sur le deuxième objet'.
	temp2 _ arg1 creeRegle: 'interface-PointSurLigne-def'.
	temp2 antecedents: 'DrGPointOncurveItem ?p ?d'.
	temp2 concl: 'point ?p'.
	temp2 com: 'point sur une ligne'.
	temp2 _ arg1 creeRegle: 'interface-PointSurLigne-pointSur'.
	temp2 antecedents: 'DrGPointOncurveItem ?p ?l'.
	temp2 concl: 'pointSur ?l  ?p'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-Segment'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy'.
	temp2 concl: 'segment ?s [ ?xx ?yy ]'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-Segment-def'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	temp2 concl: 'segment ?s'.
	temp2 com: 'Qualification d''une sorte de segment.'.
	temp2 _ arg1 creeRegle: 'interface-SegmentpointSur1'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	temp2 concl: 'pointSur ?s ?x'.
	temp2 com: 'L''origine d''un  segment est un point sur ce segment.'.
	temp2 _ arg1 creeRegle: 'interface-SegmentpointSur2'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	temp2 concl: 'pointSur ?s ?y'.
	temp2 com: 'L''extrémité d''un  segment est un point sur ce segment.'.
	arg1
		lisRegle: 'interface-Segment-extremité1'
		si: 'segment ?s [ ?a ?b ]'
		alors: 'point ?a'
		com: 'l''origine d''un segment est un point'.
	arg1
		lisRegle: 'interface-Segment-extremité2'
		si: 'segment ?s [ ?a ?b ]'
		alors: 'point ?b'
		com: 'la fin  d''un  segment est un point'.
	temp2 _ arg1 creeRegle: 'interface-SegmentSorteDeDroite-def'.
	temp2 antecedents: 'segment ?s'.
	temp2 concl: 'sorteDeDroite ?s'.
	temp2 com: 'Qualification d''une sorte de droite.'.
	temp2 _ arg1 creeRegle: 'interface-SegmentSorteDeDroite-def2'.
	temp2 antecedents: 'segment ?s [ ?xx ?yy ]
different:de: ?xx ?yy'.
	temp2 concl: 'sorteDeDroite ?s ?xx ?yy'.
	temp2 com: 'Un segment est une sorte de droite.'.
	temp2 _ arg1 creeRegle: 'interface-SegmentSorteDeSegment-def2'.
	temp2 antecedents: 'segment ?s [ ?xx ?yy ]'.
	temp2 concl: 'sorteDeSegment ?s [ ?xx ?yy ]'.
	temp2 com: 'Un segment est une sorte de segment.'.
	temp2 _ arg1 creeRegle: 'interface-Vecteur'.
	temp2 antecedents: 'DrGVector2ptsItem  ?v ?a ?b'.
	temp2 concl: 'vecteur ?v [ ?a ?b ]'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-SegmentVecteur-def2'.
	temp2 antecedents: 'vecteur ?s [ ?xx ?yy ]'.
	temp2 concl: 'sorteDeSegment ?s [ ?xx ?yy ]'.
	temp2 com: 'Qualification d''une sorte de segment.'.
	temp2 _ arg1 creeRegle: 'interface-Vecteur-def'.
	temp2 antecedents: 'DrGVector2ptsItem  ?v ?a ?b'.
	temp2 concl: 'vecteur ?v'.
	temp2 com: 'Qualification d''une sorte de cercle.'.
	arg1
		lisRegle: 'interface-Cercle2pts'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'cercle ?C ?p2 ?p1'
		com: 'Lecture d''un fait sur la figure'.
	arg1
		lisRegle: 'interface-sorteDeCercle2pts'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'sorteDeCercle ?C ?p2 ?p1'
		com: 'Lecture d''un fait sur la figure'.
	arg1
		lisRegle: 'interface-Cercle2pts-def'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'cercle ?C'
		com: 'Qualification d''une sorte de cercle.'.
	arg1
		lisRegle: 'interface-sorteDeCercle2pts-def'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'sorteDeCercle ?C'
		com: 'Qualification d''une sorte de cercle.'.
	arg1
		lisRegle: 'interface-CercleSegment-def'
		si: 'DrGCircleSegmentItem ?c  ?P ?Seg'
		alors: 'sorteDeCercle ?c'
		com: 'Qualification d''une sorte de cercle.'.
	arg1
		lisRegle: 'interface-CercleSegmentPointSur'
		si: 'DrGCircleSegmentItem ?c  ?P ?Seg
pointSur ?c ?Ps'
		alors: 'cercle ?c ?P ?Ps'
		com: 'Si cercle C de rayon segment Seg et centre P et point sur cercle Ps alors  cercle C  P Ps'.
	arg1
		lisRegle: 'interface-CercleSegmentCentre'
		si: 'DrGCircleSegmentItem ?c  ?P ?Seg'
		alors: 'cercle ?c [ centre: ?P ]'
		com: 'Centre d''un cercle dont le rayon est défini par un segment'.
	arg1
		lisRegle: 'interface-CercleSegmentSegment'
		si: 'DrGCircleSegmentItem ?c  ?P ?Seg
segment ?Seg ?s'
		alors: 'cercle ?c [ segment: ?s ]'
		com: 'Cercle dont le rayon est défini par un segment'.
	arg1
		lisRegle: 'interface-CercleSegmentSegment-def'
		si: 'DrGCircleSegmentItem ?c  ?P ?Seg
segment ?Seg ?s'
		alors: 'cercle ?c'
		com: ' Qualification d''un cercle.'.
	arg1
		lisRegle: 'interface-CerclePointSur'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'pointSur ?C ?p1'
		com: 'Si un cercle est défini par son centre et un point alors ce point est sur le cercle'.
	arg1
		lisRegle: 'interface-Cercle-def'
		si: 'DrGCircle2ptsItem ?C ?p2 ?p1'
		alors: 'cercle ?C'
		com: 'Qualification d''un cercle'.
	arg1
		lisRegle: 'interface-Cercle-Segment1'
		si: 'DrGCircleSegmentItem ?c ?p ?s
segment ?s [ ?p ?p2 ]'
		alors: 'pointSur ?c ?p2'
		com: ''.
	arg1
		lisRegle: 'interface-Cercle-Segment2'
		si: 'DrGCircleSegmentItem ?c ?p ?s
segment ?s [ ?p2 ?p ]'
		alors: 'pointSur ?c ?p2'
		com: ''.
	arg1
		lisRegle: 'interface-Cercle-Segment'
		si: 'DrGCircleSegmentItem ?c ?p ?s'
		alors: 'cercle  ?c ?s'
		com: ''.
	arg1
		lisRegle: 'interface-sorteDeCercle-Segment'
		si: 'DrGCircleSegmentItem ?c ?p ?s'
		alors: 'sorteDeCercle  ?c ?s'
		com: ''.
	arg1
		lisRegle: 'interface-Arc3pts'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc3pts ?a ?p1 ?p2 ?p3'
		com: 'Lecture d''un fait sur la figure: arc de p1'.
	arg1
		lisRegle: 'interface-sorteDeCercleArc3pts'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3
trie:rep: [ ?p1 ?p2 ?p3 ] ?rep'
		alors: 'sorteDeCercle ?a [ cerclePar3Points: ?rep'
		com: 'Un arc 3pts est une sorte de cercle par 3 pts'.
	arg1
		lisRegle: 'interface-Arc3pts-def'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc ?a'
		com: 'Qualification d''un arc'.
	arg1
		lisRegle: 'interface-Arc3pts-def'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'sorteDeCercle ?a'
		com: 'Qualification d''une sorte de Cercle'.
	arg1
		lisRegle: 'interface-Arc-def-Cercle'
		si: 'arc ?a'
		alors: 'sorteDeCercle ?a'
		com: 'Qualification d''une sorte de cercle'.
	arg1
		lisRegle: 'interface-sorteDeCercle-pointSur1'
		si: 'sorteDeCercle ?c [ cerclePar3Points: [ ?p1 ?p2 ?p3 ]  ]'
		alors: 'pointSur  ?c ?p1'
		com: 'Si arc 3 points p1 p2 p3 alors p1 sur l''arc'.
	arg1
		lisRegle: 'interface-sorteDeCercle-pointSur2'
		si: 'sorteDeCercle ?c [ cerclePar3Points: [ ?p1 ?p2 ?p3 ]  ]'
		alors: 'pointSur  ?c ?p2'
		com: 'Si  sorte de cercle points p1 p2 p3 alors p1 sur la sorte de cercle'.
	arg1
		lisRegle: 'interface-sorteDeCercle-pointSur3'
		si: 'sorteDeCercle ?c [ cerclePar3Points: [ ?p1 ?p2 ?p3 ]  ]'
		alors: 'pointSur  ?c ?p3'
		com: 'Si  sorte de cercle points p1 p2 p3 alors p2 sur la sorte de cercle'.
	arg1
		lisRegle: 'interface-SorteDeCercleCentre'
		si: 'sorteDeCercle ?c [ cerclePar3Points: ?pts ]
intersection ?i ?m1 ?m2
médiatrice ?m1 [  ?x ?y ]
médiatrice ?m2 [  ?z ?w ]
includes:el: ?pts ?x
includes:el: ?pts ?y
includes:el: ?pts ?z
includes:el: ?pts ?w'
		alors: 'sorteDeCercle  ?c [ centre: ?i ]'
		com: 'Le centre d''un cercle par 3 points est l''intersection de méd1atrices de deux couple de ses trois points'.
	arg1
		lisRegle: 'interface-Arc3pts-Centre'
		si: 'arc3pts  ?a ?p1 ?p2 ?p3
médiatrice ?m1 ?p1 ?p2
médiatrice ?m2 ?p2 ?p3
different:de: ?m1 ?m2
intersection ?i ?m1 ?m2'
		alors: 'arcCentré ?a ?i ?p1 ?p3'
		com: 'Le centre d''un arc 3 pts  est l''intersection des médiatreces du point central et de chaque extrémité,
Il permet de définir l''arc comme l''arc centré équivalent.'.
	arg1
		lisRegle: 'interface-Arc3ptsRayon'
		si: 'arc ?a
centre ?a ?c
pointSur ?a ?P
segment ?s [ ?c ?p ]'
		alors: 'rayon ?a ?s'
		com: 'Rayon d''un arc'.
	arg1
		lisRegle: 'interface-ArcCentré'
		si: 'DrGArcCenterAngleItem ?arc ?c ?x  ?y'
		alors: 'arcCentré ?arc ?c ?x ?y'
		com: 'Lecture d''un fait sur la figure'.
	arg1
		lisRegle: 'interface-ArcCentré-Centre'
		si: 'arcCentré ?arc ?c ?x ?y'
		alors: 'sorteDeCercle ?arc ?c ?x'
		com: 'Lecture d''un fait sur la figure'.
	arg1
		lisRegle: 'interface-ArcCentré-def'
		si: 'DrGArcCenterAngleItem ?arc ?c ?x  ?y'
		alors: 'arc ?arc'
		com: 'Qualification d''un arc centré'.
	arg1
		lisRegle: 'interface-ArcCentré-pointSur1'
		si: 'DrGArcCenterAngleItem ?arc ?c ?x  ?y'
		alors: 'pointSur  ?arc ?x'
		com: 'L''extrémité 1 d''un arc centré est sur l''arc.'.
	arg1
		lisRegle: 'interface-ArcCentré-pointSur2'
		si: 'DrGArcCenterAngleItem ?arc ?c ?x  ?y'
		alors: 'pointSur  ?arc ?y'
		com: ' L''extrémité 2 définit l''angle d''ouverture et n''est pas nécessairement sur l''arc'.
	arg1
		lisRegle: 'interface-SorteDeCercle-pointSur1'
		si: 'sorteDeCercle ?arc ?c ?x  ?y'
		alors: 'pointSur  ?arc ?x'
		com: 'L''extrémité 1 d''un arc centré est sur l''arc.
Par contre l''extrémité 2 définit l''angle d''ouverture et n''est pas nécessairement sur l''arc'.
	temp2 _ arg1 creeRegle: 'interface-Droite'.
	temp2 antecedents: 'DrGLine2ptsItem ?d ?a ?b
ordonneMot:et:rep1:rep2: ?a ?b ?aa ?bb'.
	temp2 concl: 'droite ?d ?aa ?bb'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	arg1
		lisRegle: 'interface-DroiteSensDirect'
		si: 'sorteDeDroite ?d ?x1 ?x2
origine ?d ?x1'
		alors: 'sens ?d direct'
		com: 'Le sens d''une sorte de droite est direct si son premier point est son origne.'.
	arg1
		lisRegle: 'interface-DroiteSensIndirect'
		si: 'sorteDeDroite ?d ?x1 ?x2
origine ?d ?x2'
		alors: 'sens ?d inverse'
		com: 'Le sens d''une sorte de droite est inverse si son deuxième point est son origne.'.
	temp2 _ arg1 creeRegle: 'interface-sorteDeDroite'.
	temp2 antecedents: 'DrGLine2ptsItem ?d ?a ?b
ordonneMot:et:rep1:rep2: ?a ?b ?aa ?bb'.
	temp2 concl: 'sorteDeDroite ?d ?aa ?bb'.
	temp2 com: 'Une droite est une sorte de droite'.
	temp2 _ arg1 creeRegle: 'interface-sorteDeDroiteParallèle'.
	temp2 antecedents: 'parallèle ?ppar ?dd ?p'.
	temp2 concl: 'relationCréée ?ppar ?dd parallèle'.
	temp2 com: 'Une parallèle est une sorte de droite.'.
	temp2 _ arg1 creeRegle: 'interface-Droite-def'.
	temp2 antecedents: 'DrGLine2ptsItem ?d ?a ?b'.
	temp2 concl: 'droite ?d'.
	temp2 com: 'Qualification d''une  droite'.
	temp2 _ arg1 creeRegle: 'interface-demi-Droite'.
	temp2 antecedents: 'DrGRay2ptsItem ?dd ?p1 ?p2'.
	temp2 concl: 'demi-droite ?dd ?p1 ?p2'.
	temp2 _ arg1 creeRegle: 'interface-demi-DroitepointSur1'.
	temp2 antecedents: 'DrGRay2ptsItem ?dd ?p1 ?p2'.
	temp2 concl: 'pointSur ?dd ?p1'.
	temp2 com: 'L''origine d''une demi-droite est un point de cette demi-droite'.
	temp2 _ arg1 creeRegle: 'interface-demi-DroitepointSur2'.
	temp2 antecedents: 'DrGRay2ptsItem ?dd ?p1 ?p2'.
	temp2 concl: 'pointSur ?dd ?p2'.
	temp2 com: 'Le point qui définit une demi-droite est un point de cette demi-droite'.
	temp2 _ arg1 creeRegle: 'interface-demi-Droite-sorteDeDroite'.
	temp2 antecedents: 'DrGRay2ptsItem ?dd ?p1 ?p2
ordonneMot:et:rep1:rep2: ?p1 ?p2 ?pp1 ?pp2'.
	temp2 concl: 'sorteDeDroite ?dd ?pp1 ?pp2'.
	temp2 com: 'Une demi-droite est une sorte de droite'.
	temp2 _ arg1 creeRegle: 'interface-sorteDeDroite-def'.
	temp2 antecedents: 'droite ?d ?a ?b'.
	temp2 concl: 'sorteDeDroite ?d'.
	temp2 com: 'Définition une sorteDeDroite'.
	temp2 _ arg1 creeRegle: 'interface-demi-droite-sorteDeDroite-def'.
	temp2 antecedents: 'demi-droite ?d ?a ?b'.
	temp2 concl: 'sorteDeDroite ?d'.
	temp2 com: 'Qualification d''une  sorteDeDroite'.
	temp2 _ arg1 creeRegle: 'interface-Médiatrice0'.
	temp2 antecedents: 'DrGLinePerpendicularBisector2ptsItem ?m ?a ?b'.
	temp2 concl: 'médiatrice ?m [ ?a ?b ]'.
	arg1
		lisRegle: 'interface-sorteDroiteCouple'
		si: 'sorteDeDroite [ ?a ?b ] '
		alors: 'sorteDeDroite   [ ?a ?b ] ?a ?b'
		com: 'Un couple de points est considéré comme une sorte de droite passant par les points'.
	temp2 _ arg1 creeRegle: 'interface-Mediatrice-def'.
	temp2 antecedents: 'DrGPerpendicularBisectorItem ?s ?a'.
	temp2 concl: 'médiatrice ?s'.
	temp2 _ arg1 creeRegle: 'interface-MediatriceSorteDeDroite-def'.
	temp2 antecedents: 'DrGPerpendicularBisectorItem ?s ?a'.
	temp2 concl: 'sorteDeDroite ?s'.
	temp2 com: 'Qualification d''une sorteDeDroite'.
	temp2 _ arg1 creeRegle: 'interface-Mediatrice-def0'.
	temp2 antecedents: 'DrGLinePerpendicularBisector2ptsItem ?s ?a ?b'.
	temp2 concl: 'médiatrice ?s'.
	temp2 _ arg1 creeRegle: 'interface-MediatriceSorteDedroite-def0'.
	temp2 antecedents: 'DrGLinePerpendicularBisector2ptsItem ?s ?a ?b'.
	temp2 concl: 'sorteDeDroite ?s'.
	temp2 com: 'Qualification d''une sorteDeDroite'.
	temp2 _ arg1 creeRegle: 'interface-Mediatrice-perpendiculaire'.
	temp2 antecedents: 'médiatrice ?m ?a ?b
droite ?d ?a ?b'.
	temp2 concl: 'perpendiculaire ?m ?d'.
	temp2 _ arg1 creeRegle: 'interface-Médiatrice-segmentPerp'.
	temp2 antecedents: 'médiatrice ?m ?a ?b
segment ?s [ ?a ?b ]'.
	temp2 concl: 'perpendiculaire ?s ?m'.
	arg1
		lisRegle: 'interface-DroitePerpendiculaire-enP'
		si: 'DrGLinePerpendicularItem ?perp1 ?dAB ?p
ordonneMot:et:rep1:rep2:  ?perp1 ?dAB ?p1 ?p2'
		alors: 'perpendiculaire ?p1  ?p2 ?p'
		com: 'Lecture d''un fait sur la figure'.
	arg1
		lisRegle: 'interface-DroitePerpendiculaire-enP-def1'
		si: 'DrGLinePerpendicularItem ?perp1 ?dAB ?C'
		alors: 'perpendiculaire ?perp1'
		com: 'Lecture d''un fait sur la figure définition'.
	arg1
		lisRegle: 'interface-DroitePerpendiculaire-enP-def1pointSur'
		si: 'DrGLinePerpendicularItem ?perp1 ?dAB ?C'
		alors: 'pointSur ?perp1 ?C'
		com: 'Le point qui définit par où passe la perpendiculaire est sur cette perpendiculaire'.
	arg1
		lisRegle: 'interface-DroitePerpendiculaire-enP-def2'
		si: 'DrGLinePerpendicularItem ?perp1 ?dAB ?C'
		alors: 'perpendiculaire ?dAB'
		com: 'Lecture d''un fait sur la figure définition'.
	arg1
		lisRegle: 'interface-DroitePerpendiculaire-SorteDedroite'
		si: 'perpendiculaire ?d'
		alors: 'sorteDeDroite  ?d'
		com: 'Une perpendiculaire est une sorte de droite'.
	arg1
		lisRegle: 'interface-DroitePerpendiculaire-SorteDedroite2'
		si: 'perpendiculaire ?perp ?d ?p'
		alors: 'sorteDeDroite  ?perp ?d ?p'
		com: 'Une perpendiculaire  à une droite par un point est une sorte de droite'.
	arg1
		lisRegle: 'interface-sorteDeDroitePerpendiculairesOrdonnées'
		si: 'DrGLinePerpendicularItem ?perp1 ?dAB ?C
		ordonneMot:et:rep1:rep2  ?perp1 ?dAB  ?x ?y:'
		alors: 'perpendiculaire ?x ?y'
		com: 'Lecture d''un fait sur la figure'.
	ExpertRegle interfacesuite: arg1.! !

!ExpertRegle class methodsFor: 'rules'!
interfaceElectricite: arg1
	| temp2 |
	arg1
		lisRegle: 'interface-texte1'
		si: 'DrGTextItem ?x ?y ?z ?w'
		alors: '?y ?z   ?w'
		com: 'Donnée sous forme de  texte.'.
	arg1
		lisRegle: 'interface-texte2'
		si: 'DrGTextItem ?x ?y ?z ?u  ?w'
		alors: '?y ?z ?u  ?w'
		com: 'Donnée sous forme de  texte.'.
	temp2 _ arg1 creeRegle: 'interface-DrGPointFreeItem'.
	temp2 antecedents: 'DrGPointFreeItem  ?p '.
	temp2 concl: 'point ?p'.
	temp2 com: 'Qualification d''un point'.
	temp2 _ arg1 creeRegle: 'interface-PointInter-def'.
	temp2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	temp2 concl: 'point ?p'.
	temp2 com: 'Qualification d''un point'.
	temp2 _ arg1 creeRegle: 'interface-PointInter-defPointSur1'.
	temp2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	temp2 concl: 'pointSur ?o1 ?p'.
	temp2 com: 'Le point d''intersection est sur le premier objet'.
	temp2 _ arg1 creeRegle: 'interface-PointInter-defPointSur2'.
	temp2 antecedents: 'DrGPointIntersectionItem ?p ?o1 ?o2'.
	temp2 concl: 'pointSur ?o2 ?p'.
	temp2 com: 'Le point d''intersection est sur le deuxième objet'.
	temp2 _ arg1 creeRegle: 'interfacePointSurLigne-def'.
	temp2 antecedents: 'DrGPointOncurveItem ?p ?d'.
	temp2 concl: 'point ?p'.
	temp2 com: 'point sur une ligne'.
	temp2 _ arg1 creeRegle: 'interface-PointSurLigne-pointSur'.
	temp2 antecedents: 'DrGPointOncurveItem ?p ?l'.
	temp2 concl: 'pointSur ?l  ?p'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-Segment'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy'.
	temp2 concl: 'segment ?s [ ?xx ?yy ]'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-Segment-def'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	temp2 concl: 'segment ?s'.
	temp2 com: 'Qualification d''une sorte de segment.'.
	temp2 _ arg1 creeRegle: 'interface-SegmentpointSur1'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	temp2 concl: 'pointSur ?s ?x'.
	temp2 com: 'L''origine d''un  segment est un point sur ce segment.'.
	temp2 _ arg1 creeRegle: 'interface-SegmentpointSur2'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?x ?y'.
	temp2 concl: 'pointSur ?s ?y'.
	temp2 com: 'L''extrémité d''un  segment est un point sur ce segment.'.
	arg1
		lisRegle: 'interface-Segment-extremité1'
		si: 'segment ?s [ ?a ?b ]'
		alors: 'point ?a'
		com: 'l''origine d''un segment est un point'.
	arg1
		lisRegle: 'interface-Segment-extremité2'
		si: 'segment ?s [ ?a ?b ]'
		alors: 'point ?b'
		com: 'la fin  d''un  segment est un point'.
	temp2 _ arg1 creeRegle: 'interface-SegmentSorteDeDroite-def'.
	temp2 antecedents: 'segment ?s'.
	temp2 concl: 'sorteDeDroite ?s'.
	temp2 com: 'Qualification d''une sorte de droite.'.
	temp2 _ arg1 creeRegle: 'interface-SegmentSorteDeDroite-def2'.
	temp2 antecedents: 'segment ?s [ ?xx ?yy ]
different:de: ?xx ?yy'.
	temp2 concl: 'sorteDeDroite ?s ?xx ?yy'.
	temp2 com: 'Un segment est une sorte de droite.'.
	temp2 _ arg1 creeRegle: 'interface-SegmentSorteDeSegment-def2'.
	temp2 antecedents: 'segment ?s [ ?xx ?yy ]'.
	temp2 concl: 'sorteDeSegment ?s [ ?xx ?yy ]'.
	temp2 com: 'Un segment est une sorte de segment.'.
	arg1
		lisRegle: 'interface-Arc3pts'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc3pts ?a ?p1 ?p2 ?p3'
		com: 'Lecture d''un fait sur la figure: arc de p1'.
	arg1
		lisRegle: 'interface-sorteDeCercleArc3pts'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3
trie:rep: [ ?p1 ?p2 ?p3 ] ?rep'
		alors: 'sorteDeCercle ?a [ cerclePar3Points: ?rep'
		com: 'Un arc 3pts est une sorte de cercle par 3 pts'.
	arg1
		lisRegle: 'interface-Arc3pts-def'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'arc ?a'
		com: 'Qualification d''un arc'.
	arg1
		lisRegle: 'interface-Arc3pts-def'
		si: 'DrGArc3ptsItem  ?a ?p1 ?p2 ?p3'
		alors: 'sorteDeCercle ?a'
		com: 'Qualification d''une sorte de Cercle'.! !

!ExpertRegle class methodsFor: 'rules'!
interfacesuite: arg1
	| temp2 |
	arg1
		lisRegle: 'interface-sorteDeDroitePerpendiculaire-enP2Def'
		si: 'perpendiculaire ?perp1'
		alors: 'sorteDeDroite ?perp1'
		com: 'Lecture d''un fait sur la figure'.
	arg1
		lisRegle: 'interface-sorteDeDroitePerpendiculaire-enP2DefDroite'
		si: 'perpendiculaire ?perp1'
		alors: 'sorteDeDroite ?perp1'
		com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-Droiteparallèle'.
	temp2 antecedents: 'DrGLineParallelItem ?par ?d ?p'.
	temp2 concl: 'parallèle ?par ?d ?p'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	arg1
		lisRegle: 'interface-Droiteparallèle-def'
		si: 'DrGLineParallelItem ?Par ?d ?p'
		alors: 'parallèle ?Par'
		com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-Droiteparallèle-defParallele'.
	temp2 antecedents: 'parallèle ?Par'.
	temp2 concl: 'sorteDeDroite ?Par'.
	temp2 com: 'une parallèle est une sorte de droite'.
	temp2 _ arg1 creeRegle: 'interface-Droiteparallèle-defParalelleDroite'.
	temp2 antecedents: 'parallèle ?Par
~ segment ?Par'.
	temp2 concl: 'droite ?Par'.
	temp2 com: 'Qualification d''une droite'.
	temp2 _ arg1 creeRegle: 'interface-DroiteparallèlePtSur'.
	temp2 antecedents: ' DrGLineParallelItem ?Par ?d ?p'.
	temp2 concl: 'pointSur ?Par ?p'.
	temp2 com: 'Si une droite parallèle par P alors P est sur la droite parallèle'.
	temp2 _ arg1 creeRegle: 'interface-MilieuSegment'.
	temp2 antecedents: 'DrGPointMiddlesegmentItem ?m ?s
segment ?s [ ?x ?y ]'.
	temp2 concl: 'milieu [ ?x ?y ]   ?m'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-Milieu2ptsSegment'.
	temp2 antecedents: 'milieu ?s ?m
segment ?s  [ ?A ?B ]'.
	temp2 concl: 'milieu [ ?A ?B ] ?m'.
	temp2 com: 'le milieu d''un segment est aussi le milieu du couple définit par le segment'.
	temp2 _ arg1 creeRegle: 'interface-Milieu2pts'.
	temp2 antecedents: 'DrGPointMiddle2ptsItem ?I ?A ?B
ordonneMot:et:rep1:rep2: ?A ?B ?AA ?BB'.
	temp2 concl: 'milieu [ ?AA ?BB ] ?I'.
	temp2 com: 'Milieu d''un couple de points'.
	temp2 _ arg1 creeRegle: 'interface-Milieu-def'.
	temp2 antecedents: 'milieu [ ?A ?B  ]  ?I '.
	temp2 concl: 'point  ?I'.
	temp2 com: 'Le milieu est un point'.
	arg1
		lisRegle: 'interface-pointsSur.'
		si: 'sorteDeDroite ?d
pointsSur:rep: ?d ?pts'
		alors: 'pointsSur ?d ?pts'
		com: 'Les points sur une sorte de droite dans l''ordre suivant le sens de la droite.'.
	arg1
		lisRegle: 'interface-ParallèleSens'
		si: 'parallèle ?par ?d ?p
sens ?d ?s'
		alors: 'sens ?par ?s'
		com: 'une parallèle a le même sens que la droite à laquelle elle est parallèle.'.
	arg1
		lisRegle: 'interface-Mediatrice-defSorte'
		si: 'médiatrice ?s'
		alors: 'sorteDeDroite  ?s'
		com: 'Qualification d''une sorte de droite'.
	arg1
		lisRegle: 'interface-médiatriceMilieuPointSurCrée'
		si: 'créeObjets
médiatrice ?m [ ?a ?b ]'
		alors: 'créePointMilieu:Point:et:  ?m ?a ?b'
		com: 'Le milieu du segment ou du couple de points définissant  la médiatrice est sur la médiatrice.'.
	arg1
		lisRegle: 'interface-médiatriceMilieuPointSur'
		si: 'médiatrice ?m [ ?a ?b ]
point ?x
segment ?s
intersection ?p ?m ?s'
		alors: 'pointSur ?m ?p'
		com: 'Le milieu du segment ou du couple de points définissant  la médiatrice est sur la médiatrice.'.
	temp2 _ arg1 creeRegle: 'interface-MilieuSegment0'.
	temp2 antecedents: 'DrGPointMiddlesegmentItem ?I ?s
segment ?s  [ ?A ?B ]'.
	temp2 concl: 'milieu [ ?A ?B ] ?I'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-PointIntersection'.
	temp2 antecedents: 'DrGPointIntersectionItem ?pt ?L1 ?L2 
ordonneMot:et:rep1:rep2: ?L1 ?L2 ?LL1 ?LL2'.
	temp2 concl: 'intersection ?pt ?LL1 ?LL2'.
	temp2 com: 'Lecture d''un fait sur la figure'.
	temp2 _ arg1 creeRegle: 'interface-PointSurLigne'.
	temp2 antecedents: 'DrGPointOncurveItem ?pt ?L'.
	temp2 concl: 'pointSur  ?L ?pt'.
	temp2 com: 'Point sur un élément géométrique'.
	temp2 _ arg1 creeRegle: 'interface-PointIntersection-pointSur1'.
	temp2 antecedents: 'DrGPoint-IntersectionItem ?pt ?L1 ?L2 '.
	temp2 concl: 'pointSur  ?L1 ?pt'.
	temp2 com: 'Poine intersection sur un élément géométrique'.
	temp2 _ arg1 creeRegle: 'interface-PointIntersection-pointSur2'.
	temp2 antecedents: 'DrGPointIntersectionItem ?pt ?L1 ?L2 '.
	temp2 concl: 'pointSur ?L2 ?pt'.
	temp2 com: 'Point2 intersection sur un élément géométrique'.
	temp2 _ arg1 creeRegle: 'interface-PointSurDroite1'.
	temp2 antecedents: 'DrGLine2ptsItem ?D1 ?A ?B'.
	temp2 concl: 'pointSur ?D1 ?A'.
	temp2 com: 'Point sur un élément géométrique'.
	temp2 _ arg1 creeRegle: 'interface-PointSurDroite2'.
	temp2 antecedents: 'DrGLine2ptsItem ?D1 ?A ?B'.
	temp2 concl: 'pointSur ?D1 ?B'.
	temp2 com: 'Point sur un élément géométrique'.
	arg1
		lisRegle: 'interface-SymCentralePoint'
		si: 'DrGPointSymmetryItem  ?image  ?pt  ?centre'
		alors: 'symetrieCentrale  ?image  ?pt  ?centre'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-SymCentralePoint-def'
		si: 'DrGPointSymmetryItem  ?image  ?pt  ?centre'
		alors: 'point  ?image'
		com: 'Qualification d''un point'.
	arg1
		lisRegle: 'interface-SymCentraleArc'
		si: 'DrGArcSymmetryItem  ?image  ?pt  ?centre'
		alors: 'symetrieCentrale  ?image  ?pt  ?centre'.
	arg1
		lisRegle: 'interface-SymCentraleImage'
		si: 'DrGSegmentSymmetryItem  ?image  ?obj  ?centre'
		alors: 'symetrieCentrale  ?image  ?obj  ?centre'.
	arg1
		lisRegle: 'interface-SymCentraleSegment.def'
		si: 'DrGSegmentSymmetryItem  ?image  ?seg ?centre
segment ?seg'
		alors: 'segment  ?image'
		com: 'Qualification d''un segment'.
	arg1
		lisRegle: 'interface-SymCentralePoint.def'
		si: 'DrGSegmentSymmetryItem  ?image  ?pt  ?centre
point ?pt'
		alors: 'point  ?image'
		com: 'Qualification d''un point'.
	arg1
		lisRegle: 'interface-Homothetie'
		si: 'DrGPointHomothetyItem ?J ?S ?N ?vn ?val'
		alors: 'homothétie ?J ?S ?N ?val'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-DrGSegmentHomothetyItem1'
		si: 'DrGSegmentHomothetyItem ?J ?S ?N ?vn ?val'
		alors: 'homothétie ?J ?S ?N ?val'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-DrGSegmentHomothetyItem-def'
		si: 'DrGSegmentHomothetyItem ?J ?S ?N ?vn ?val'
		alors: 'segment  ?J'
		com: 'Qualification d''un segment'.
	arg1
		lisRegle: 'interface-DrGSegmentHomothetie-segment'
		si: 'DrGSegmentHomothetyItem ?J ?S ?N ?vn ?val
segment ?S [ ?a ?b ]
DrGPointHomothetyItem ?aa ?a ?N ?vn ?val
DrGPointHomothetyItem ?bb ?b ?N ?vn ?val
ordonneMot:et:rep1:rep2: ?aa ?bb ?aas ?bbs
'
		alors: 'segment  ?J [ ?aas  ?bbs ]'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-Homothetie-def'
		si: 'DrGPointHomothetyItem ?J ?S ?N ?vn ?val'
		alors: 'point ?J'
		com: 'Qualification d''un point'.
	arg1
		lisRegle: 'interface-Médiatrice1'
		si: 'DrGPerpendicularBisectorItem ?d ?s
segment ?s [ ?x ?y ]'
		alors: 'médiatrice ?d [ ?x ?y ]'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-reflexionPoint'
		si: 'DrGPointReflexionItem ?image ?p ?d'
		alors: 'reflexion  ?image ?p ?d'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-reflexionPoin.Axet'
		si: 'DrGPointReflexionItem ?image ?p ?d'
		alors: 'axeSymétrie ?d'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-reflexionPoint-def'
		si: 'DrGPointReflexionItem ?image ?p ?d'
		alors: 'point  ?image'
		com: 'Qualification d''unpoint'.
	arg1
		lisRegle: 'interface-reflexionSegment'
		si: 'DrGSegmentReflexionItem ?image ?p ?d'
		alors: 'reflexion  ?image ?p ?d'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-bissectrice'
		si: 'DrGAngleBisector3ptsItem ?D ?P1 ?P2 ?P3'
		alors: 'bissectrice  ?D [ ?P1 ?P2 ?P3 ]'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-bissectrice-def0'
		si: 'DrGAngleBisector3ptsItem ?D ?P1 ?P2 ?P3'
		alors: 'bissectrice  ?D'
		com: 'Qualification de la bissectrice'.
	arg1
		lisRegle: 'interface-bissectrice-droite-def'
		si: 'bissectrice ?D'
		alors: 'sorteDedroite  ?D'
		com: 'Qualification d''une sorte de droite'.
	arg1
		lisRegle: 'interface-TranslationPoint'
		si: 'DrGPointTranslationItem ?p ?po ?v '
		alors: 'translation point ?p ?po ?v'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-TranslationPoint-def'
		si: 'DrGPointTranslationItem ?p ?po ?v '
		alors: 'point ?p'
		com: 'Qualification d''un point'.
	arg1
		lisRegle: 'interface-TranslationSegmentPoints'
		si: 'translation segment ?s ?so ?v 
segment ?so ?ao ?bo 
translation point ?a ?ao ?v
translation point ?b ?bo ?v'
		alors: 'segment ?s [ ?a ?b ]'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-Translation'
		si: 'DrGSegmentTranslationItem ?s ?so ?v '
		alors: 'translation segment ?s ?so ?v'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-PolygoneNbSommets'
		si: 'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6
couleurPoint:couleur: ?x4 bleu
polyAjouteETNuméroteSommets: ?x1'
		alors: 'polygoneRégulier ?x1 [ nombre_de_sommets: ?x6 ] ]'
		com: 'Un polygone régulier: nombre de sommets, fait de la figure'.
	arg1
		lisRegle: 'interface-PolygonePointSurPremierSommet'
		si: 'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6'
		alors: 'pointSur ?x1 ?x4'
		com: 'Le sommet qui définit le  polygone  est sur ce polygone, fait de la figure'.
	arg1
		lisRegle: 'interface-PolygoneCentre'
		si: 'DrGPolygonRegularItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6'
		alors: 'polygoneRégulier ?x1 [ centre: ?x3 ] ]'
		com: 'Un polygone régulier: centre, fait de la figure'.
	arg1
		lisRegle: 'interface-PolygoneIrrégulier'
		si: 'DrGPolygonNptsItem  ?x1 ?x2
premier:rep:  ?x2 ?p2
dernier:rep: ?x2  ?p1
couples:rep: ?x2 ?res
ajouteDernier:el:rep:  ?res  [  ?p1 ?p2  ] ?res2
'
		alors: 'lignePolygonaleFermée ?res2'
		com: 'Un polygone irrégulier, est une ligne polygonale fermée , fait de la figure'.
	arg1
		lisRegle: 'interface-Cercle'
		si: 'DrGCircleRadiusItem  ?x1 ?x2 ?x3 ?x4'
		alors: 'cercle ?x1 ?x2  ?x3 ?x4'.
	arg1
		lisRegle: 'interface-Cercle-def2'
		si: 'DrGCircleRadiusItem  ?x1 ?x2 ?x3 ?x4'
		alors: 'cercle ?x1'
		com: 'Qualification d''un cercle'.
	arg1
		lisRegle: 'interface-Cercle-rayon2'
		si: 'DrGCircleRadiusItem  ?x1 ?x2  ?x3 ?x4
pointSur ?x1 ?p
segment ?s [ ?x2 ?p ]'
		alors: 'rayon ?x1 ?s'.
	arg1
		lisRegle: 'interface-lieu'
		si: 'DrGLocus2ptsItem ?l  ?pLibre ?pdependant'
		alors: 'lieu ?l  ?pLibre ?pdependant'.
	arg1
		lisRegle: 'interface-longueurSegment'
		si: 'DrGValueSegmentlengthItem  ?nom ?val  ?s
segment ?s [ ?a ?b ]
arrondis:rep: ?val ?val2'
		alors: 'mesure [ ?a ?b ] ?val donnée'.
	arg1
		lisRegle: 'interface-longueurSegment2'
		si: 'DrGValueSegmentlengthItem  mesure ?nom ?val  ?s
segment ?s [ ?a ?b ]
arrondis:rep: ?val ?val2'
		alors: 'mesure [ ?a ?b ] ?val donnée'.
	arg1
		lisRegle: 'interface-distancePoints1'
		si: 'DrGValueDistance2ptsItem mesure ?m ?val ?p1 ?p2
ordonneMot:et:rep1:rep2: ?p1 ?p2 ?pp1  ?pp2'
		alors: 'mesure [ ?pp1 ?pp2 ] ?val donnée'.
	arg1
		lisRegle: 'interface-ValeurScript'
		si: 'DrGValueScriptItem  ?nom ?val ?a1 ?Val1  ?a2 ?Val2'
		alors: 'valeurScript ?nom ?val  ?a1 ?Val1 ?a2 ?Val2'.
	arg1
		lisRegle: 'interface-distancePoints2'
		si: ' DrGValueDistance2ptsItem  ?m ?val ?p1 ?p2
ordonneMot:et:rep1:rep2: ?p1 ?p2 ?pp1  ?pp2'
		alors: 'mesure  [ ?pp1 ?pp2 ] ?val donnée'.
	arg1
		lisRegle: 'interface-angleOrienté1'
		si: 'DrGAngle3ptsOrientedItem  ?x1 ?x2 ?x3 ?x4 ?x5 ?x6'
		alors: 'mesure ?x2 ?x3 donnée'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-angleOrienté2'
		si: 'DrGAngle3ptsOrientedItem  ?x1 ?x2 ?x3 ?x4 ?x5'
		alors: 'mesure [ ?x3 ?x4 ?x5 ] ?x2 donnée'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-angleOrienté3'
		si: 'DrGAngle3ptsOrientedItem  ?x1 ?x2 ?x3 ?x4 ?x5'
		alors: 'angle ?x1  [  ?x3 ?x4 ?x5 ]'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-DrGAngle3ptsItem1'
		si: 'DrGAngle3ptsItem  ?x1 ?x2 ?x3 ?x4 ?x5
aireTriangleNegative:avec:avec: ?x3 ?x4 ?x5'
		alors: 'mesure [ ?x3 ?x4 ?x5 ] ?x2 donnée'.
	arg1
		lisRegle: 'interface-DrGAngle3ptsItem2'
		si: 'DrGAngle3ptsItem  ?x1 ?x2 ?x3 ?x4 ?x5
aireTrianglePositive:avec:avec: ?x3 ?x4 ?x5'
		alors: 'mesure [ ?x5 ?x4 ?x3 ] ?x2 donnée'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-DrGAngle3ptsItem3'
		si: 'DrGAngle3ptsItem  ?x1 ?x2 ?x3 ?x4 ?x5'
		alors: 'angle ?x1 [ ?x3 ?x4 ?x5 ]'
		com: 'Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-demi-droite'
		si: 'DrGRay2ptsItem ?dd  ?pOrig ?y ?p'
		alors: 'demi-droite  ?dd  ?pOrig   ?y ?p'
		com: 'définition d''une demi-droite, Lecture d''un fait de la figure'.
	arg1
		lisRegle: 'interface-demi-droite-def0'
		si: 'demi-droite  ?dd  ?pOrig   ?y'
		alors: 'demi-droite  ?dd'
		com: 'Qualification d''une demi-droite'.
	arg1
		lisRegle: 'interface-pointTranslaté'
		si: 'translation  ?x1 ?x2 ?x3 ?x4'
		alors: 'point ?x2'
		com: 'L''image d''un point par translation est un point. '.
	arg1
		lisRegle: 'interface-pointXY'
		si: 'point ?x1
point:rep: ?x1 ?pos
x:rep: ?pos ?x
y:rep: ?pos ?y'
		alors: 'point ?x1  x= ?x y= ?y'
		com: 'Les coordonnées d''un point'.
	arg1
		lisRegle: 'interface-pointPos'
		si: 'point ?x1
point:rep: ?x1 ?pos'
		alors: 'point ?x1 ?pos'
		com: 'La position (point) d''un point'.! !

!ExpertRegle class methodsFor: 'rules'!
isometrieOld: arg1
	| temp2 |
	arg1
		lisRegle: 'isométrie-milieu'
		si: 'milieu [ ?x ?y ] ?m
relationCrée:et:nom:  [ ?x ?m ] [ ?y ?m ] isométrique '
		alors: 'relationCréée  [ ?x ?m ] [ ?y ?m ] isométrique'
		com: 'Le segmentqui relie l''origine d''un segment à son milieu est isométrique au segment qui relie son milieu à son extrémité.'.
	arg1
		lisRegle: 'isométrie-AlternesInternes'
		si: 'angle ?a1 [  alterneInterne: ?a2 ]'
		alors: 'isométrique ?a1 ?a2'
		com: 'Des angles Alternes Internes sont isométriques'.
	arg1
		lisRegle: 'isométrie-AlternesExternes'
		si: 'angle ?a1 [  alterneExterne: ?a2 ]'
		alors: 'isométrique ?a1 ?a2'
		com: 'Des angles Alternes Internes sont isométriques'.
	arg1
		lisRegle: 'isométrie-CoupleExplicite'
		si: 'relation isométrique explicite
point ?x
point ?y
point ?o
relation:et:nom: [ ?o ?x ] [ ?o ?y ] isométrique
ordonneMot:et:rep1:rep2:  [ ?o ?x ] [ ?o ?y ]  [ ?o ?x ] [ ?o ?y ]
different:de:  [ ?o ?x ] [ ?o ?y ]'
		alors: 'isométrique  [ ?o ?x ] [ ?o ?y ] '.
	arg1
		lisRegle: 'isométrie-SegmentExplicite'
		si: 'relation isométrique explicite
segment ?s1
segment ?s2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
relation:et:nom: ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'isométrique  ?ss1 ?ss2'.
	arg1
		lisRegle: 'isométrie-SegmentsParallèles1'
		si: 'segment  ?x2 [  ?a ?b ] 
segment  ?x3 [  ?a ?d ] 
 intersection  ?x1 ?x2 ?x3
parallèle ?x4 ?x3
parallèle ?x5 ?x2
intersection ?c ?x4 ?x5'
		alors: 'isométrique [ ?a ?b ] [ ?c ?d ]'.
	arg1
		lisRegle: 'isométrie-SegmentsParallèles2'
		si: 'segment  ?x2 [  ?a ?b ] 
segment  ?x3 [  ?a ?d ] 
 intersection  ?x1 ?x2 ?x3
parallèle ?x4 ?x3
parallèle ?x5 ?x2
intersection ?c ?x4 ?x5'
		alors: 'isométrique [ ?a ?d ] [ ?b ?c ]'.
	arg1
		lisRegle: 'isométrie-SymCentraleSegments2'
		si: 'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
ordonneMot:et:rep1:rep2: ?A ?B ?AA ?BB
ordonneMot:et:rep1:rep2: ?C ?D ?CC ?DD
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'isométrique [ ?B ?C ] [ ?A  ?D ]'.
	arg1
		lisRegle: 'isométrie-SymCentraleSegmentsparallèles1'
		si: 'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'parallèle [ ?B ?C ] [ ?A  ?D ]'.
	arg1
		lisRegle: 'isométrie-SymCentraleSegmentsparallèles2'
		si: 'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'parallèle [ ?A ?B ] [ ?C  ?D ]'.
	arg1
		lisRegle: 'isométries-réflexion'
		si: 'segment [  ?x ?y ]
reflexion ?xi ?x ?axe
reflexion ?yi ?y ?axe'
		alors: 'isométrique [ ?x ?y ] [ ?xi  ?yi ]'
		com: 'L''image d''un segment par symértie axiale est isométrique au segment'.
	temp2 _ arg1 creeRegle: 'isométries-RetireQuantitésEgales1'.
	temp2 antecedents: 'somme ?x ?y ?z
somme ?m ?n ?o
isométrique ?y ?n
'.
	temp2 concl: 'isométrique ?x ?m'.
	temp2 _ arg1 creeRegle: 'isométries-RetireQuantitésEgales2'.
	temp2 antecedents: 'somme ?x ?y ?z
somme ?m ?n ?o
isométrique ?x ?m
'.
	temp2 concl: 'isométrique ?y ?n'.
	arg1
		lisRegle: 'isométrie-RayonExplicite'
		si: 'relation isométrique explicite
cercle ?c [  rayon: [ ?x1 ?y1 ] ] 
cercle ?c [ rayon: [ ?x2 ?y2 ] ]
different:de: ?y1 ?y2'
		alors: 'isométrique [ ?x1 ?y1 ] [ ?x2 ?y2 ]'
		com: 'Les rayons d''un même cercle sont isométriques'.
	arg1
		lisRegle: 'isométrie-RayonRelationSegments'
		si: 'cercle ?c [  rayon: ?x1 ] 
cercle ?c [ rayon: ?x2 ] 
segment ?x1
segment ?x2
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2
relationCrée:et:nom: ?xx1 ?xx2 isométrique
different:de: ?x1 ?x2'
		alors: 'relationCréée  ?xx1 ?xx2 isométrique'
		com: 'Les rayons d''un même cercle sont isométriques'.
	arg1
		lisRegle: 'isométrie-RayonCouple'
		si: 'cercle ?c [  rayon: [ ?x1 ?x2 ]  ] 
cercle ?c [ rayon: [ ?x3 ?x4 ]  ]
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2
ordonneMot:et:rep1:rep2: ?x3 ?x4 ?xx3 ?xx4 
ordonneMot:et:rep1:rep2: [ ?xx1 ?xx2 ] [ ?xx3 ?xx4 ]  ?r1 ?r2
relationCrée:et:nom: ?r1 ?r2 isométrique
different:de: [ ?x1 ?x2 ] [ ?x3 ?x4 ]'
		alors: 'relationCréée   ?r1 ?r2 isométrique'
		com: 'Les rayons d''un même cercle sont isométriques'.
	arg1
		lisRegle: 'isométrie-triangleIsocèle'
		si: 'triangle ?t1  [ isocèle: [ sommet: ?s1  ] ]
triangle ?t1 [ sommets: ?som1 ]
enleverDe:el:rep: ?som1 ?s1 ?r1
triangle ?t2  [ isocèle: [ sommet: ?s2  ] ]
triangle ?t2 [ sommets: ?som2 ]
enleverDe:el:rep: ?som2 ?s2 ?r2
different:de: ?t1 ?t2
ordonneMot:et:rep1:rep2: ?t1 ?t2 ?t1 ?t2
relation:et:nom: ?r1 ?r2 isométrique'
		alors: 'isométrique ?t1 ?t2'
		com: 'Deux triangles isocèles de sommets s1 s2 sont isométriques si les côtés opposés aux sommets sont isométriques'.
	arg1
		lisRegle: 'isométrie-anglesTriangle1'
		si: 'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?c2 ?a2 ?b2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [  ?a1 ?b1 ?c1 ]   [ ?a2 ?b2 ?c2 ]  ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [  ?a1 ?b1 ?c1 ] [  ?b2 ?c2 ?a2  ]'
		com: 'Des triangles isométriques on leurs angles correspondants isométriques'.
	arg1
		lisRegle: 'isométrie-anglesTriangle2'
		si: 'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?a2 ?b2 ?c2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [   ?c1 ?a1 ?b1 ]   [ ?c2 ?a2 ?b2  ]  ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [  ?ang1 ] [  ?ang2 ]'
		com: 'Des triangles isométriques on leurs angles correspondants isométriques'.
	arg1
		lisRegle: 'isométrie-anglesTriangle3'
		si: 'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?a2 ?b2 ?c2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [  ?b1 ?c1 ?a1  ]    [ ?b2 ?c2 ?a2  ] ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [ ?ang1 ] [  ?ang2 ]'.! !

!ExpertRegle class methodsFor: 'rules'!
isometrieRegles: arg1
	| temp2 |
	arg1
		lisRegle: 'isométrie-milieu'
		si: 'milieu [ ?x ?y ] ?m
relationCrée:et:nom:  [ ?x ?m ] [ ?y ?m ] isométrique '
		alors: 'relationCréée  [ ?x ?m ] [ ?y ?m ] isométrique'
		com: 'Le segmentqui relie l''origine d''un segment à son milieu est isométrique au segment qui relie son milieu à son extrémité.'.
	arg1
		lisRegle: 'isométrie-AlternesInternes'
		si: 'angle ?a1 [  alterneInterne: ?a2 ]'
		alors: 'isométrique ?a1 ?a2'
		com: 'Des angles Alternes Internes sont isométriques'.
	arg1
		lisRegle: 'isométrie-AlternesExternes'
		si: 'angle ?a1 [  alterneExterne: ?a2 ]'
		alors: 'isométrique ?a1 ?a2'
		com: 'Des angles Alternes Internes sont isométriques'.
	arg1
		lisRegle: 'isométrie-CoupleExplicite'
		si: 'relation isométrique explicite
point ?x
point ?y
point ?o
relation:et:nom: [ ?o ?x ] [ ?o ?y ] isométrique
ordonneMot:et:rep1:rep2:  [ ?o ?x ] [ ?o ?y ]  [ ?o ?x ] [ ?o ?y ]
different:de:  [ ?o ?x ] [ ?o ?y ]'
		alors: 'isométrique  [ ?o ?x ] [ ?o ?y ] '.
	arg1
		lisRegle: 'isométrie-SegmentExplicite'
		si: 'relation isométrique explicite
segment ?s1
segment ?s2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
relation:et:nom: ?s1 ?s2 isométrique
different:de: ?s1 ?s2'
		alors: 'isométrique  ?ss1 ?ss2'.
	arg1
		lisRegle: 'isométrie-SegmentsParallèles1'
		si: 'segment  ?x2 [  ?a ?b ] 
segment  ?x3 [  ?a ?d ] 
 intersection  ?x1 ?x2 ?x3
parallèle ?x4 ?x3
parallèle ?x5 ?x2
intersection ?c ?x4 ?x5'
		alors: 'isométrique [ ?a ?b ] [ ?c ?d ]'.
	arg1
		lisRegle: 'isométrie-SegmentsParallèles2'
		si: 'segment  ?x2 [  ?a ?b ] 
segment  ?x3 [  ?a ?d ] 
 intersection  ?x1 ?x2 ?x3
parallèle ?x4 ?x3
parallèle ?x5 ?x2
intersection ?c ?x4 ?x5'
		alors: 'isométrique [ ?a ?d ] [ ?b ?c ]'.
	arg1
		lisRegle: 'isométrie-SymCentraleSegments2'
		si: 'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
ordonneMot:et:rep1:rep2: ?A ?B ?AA ?BB
ordonneMot:et:rep1:rep2: ?C ?D ?CC ?DD
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'isométrique [ ?B ?C ] [ ?A  ?D ]'.
	arg1
		lisRegle: 'isométrie-SymCentraleSegmentsparallèles1'
		si: 'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'parallèle [ ?B ?C ] [ ?A  ?D ]'.
	arg1
		lisRegle: 'isométrie-SymCentraleSegmentsparallèles2'
		si: 'symetrieCentrale  ?D ?B ?o
symetrieCentrale ?C ?A  ?o
segment  [ ?A ?B ]
segment  [ ?C  ?D ]
different:de: ?D ?B
different:de: ?C ?A'
		alors: 'parallèle [ ?A ?B ] [ ?C  ?D ]'.
	arg1
		lisRegle: 'isométrie-réflexion'
		si: 'segment [  ?x ?y ]
reflexion ?xi ?x ?axe
reflexion ?yi ?y ?axe'
		alors: 'isométrique [ ?x ?y ] [ ?xi  ?yi ]'
		com: 'L''image d''un segment par symértie axiale est isométrique au segment'.
	temp2 _ arg1 creeRegle: 'isométrie-RetireQuantitésEgales1'.
	temp2 antecedents: 'somme ?x ?y ?z
somme ?m ?n ?o
isométrique ?y ?n
'.
	temp2 concl: 'isométrique ?x ?m'.
	temp2 _ arg1 creeRegle: 'isométrie-RetireQuantitésEgales2'.
	temp2 antecedents: 'somme ?x ?y ?z
somme ?m ?n ?o
isométrique ?x ?m
'.
	temp2 concl: 'isométrique ?y ?n'.
	arg1
		lisRegle: 'isométrie-RayonExplicite'
		si: 'relation isométrique explicite
cercle ?c [  rayon: [ ?x1 ?y1 ] ] 
cercle ?c [ rayon: [ ?x2 ?y2 ] ]
different:de: ?y1 ?y2'
		alors: 'isométrique [ ?x1 ?y1 ] [ ?x2 ?y2 ]'
		com: 'Les rayons d''un même cercle sont isométriques'.
	arg1
		lisRegle: 'isométrie-RayonRelationSegments'
		si: 'cercle ?c [  rayon: ?x1 ] 
cercle ?c [ rayon: ?x2 ] 
segment ?x1
segment ?x2
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2
relationCrée:et:nom: ?xx1 ?xx2 isométrique
different:de: ?x1 ?x2'
		alors: 'relationCréée  ?xx1 ?xx2 isométrique'
		com: 'Les rayons d''un même cercle sont isométriques'.
	arg1
		lisRegle: 'isométrie-RayonCouple'
		si: 'cercle ?c [  rayon: [ ?x1 ?x2 ]  ] 
cercle ?c [ rayon: [ ?x3 ?x4 ]  ]
ordonneMot:et:rep1:rep2: ?x1 ?x2 ?xx1 ?xx2
ordonneMot:et:rep1:rep2: ?x3 ?x4 ?xx3 ?xx4 
ordonneMot:et:rep1:rep2: [ ?xx1 ?xx2 ] [ ?xx3 ?xx4 ]  ?r1 ?r2
relationCrée:et:nom: ?r1 ?r2 isométrique
different:de: [ ?x1 ?x2 ] [ ?x3 ?x4 ]'
		alors: 'relationCréée   ?r1 ?r2 isométrique'
		com: 'Les rayons d''un même cercle sont isométriques'.
	arg1
		lisRegle: 'isométrie-triangleIsocèle'
		si: 'triangle ?t1  [ isocèle: [ sommet: ?s1  ] ]
triangle ?t1 [ sommets: ?som1 ]
enleverDe:el:rep: ?som1 ?s1 ?r1
triangle ?t2  [ isocèle: [ sommet: ?s2  ] ]
triangle ?t2 [ sommets: ?som2 ]
enleverDe:el:rep: ?som2 ?s2 ?r2
different:de: ?t1 ?t2
ordonneMot:et:rep1:rep2: ?t1 ?t2 ?t1 ?t2
relation:et:nom: ?r1 ?r2 isométrique'
		alors: 'isométrique ?t1 ?t2'
		com: 'Deux triangles isocèles de sommets s1 s2 sont isométriques si les côtés opposés aux sommets sont isométriques'.
	arg1
		lisRegle: 'isométrie-anglesTriangle1'
		si: 'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?c2 ?a2 ?b2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [  ?a1 ?b1 ?c1 ]   [ ?a2 ?b2 ?c2 ]  ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [  ?a1 ?b1 ?c1 ] [  ?b2 ?c2 ?a2  ]'
		com: 'Des triangles isométriques on leurs angles correspondants isométriques'.
	arg1
		lisRegle: 'isométrie-anglesTriangle2'
		si: 'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?a2 ?b2 ?c2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [   ?c1 ?a1 ?b1 ]   [ ?c2 ?a2 ?b2  ]  ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [  ?ang1 ] [  ?ang2 ]'
		com: 'Des triangles isométriques on leurs angles correspondants isométriques'.
	arg1
		lisRegle: 'isométrie-anglesTriangle3'
		si: 'triangle ?t1 [ sommets: [  ?a1 ?b1 ?c1 ]  ]
triangle ?t2  [ sommets: [  ?a2 ?b2 ?c2 ]  ]
isométrique ?t1 ?t2
ordonneMot:et:rep1:rep2: [  ?b1 ?c1 ?a1  ]    [ ?b2 ?c2 ?a2  ] ?ang1 ?ang2
different:de: ?t1 ?t2'
		alors: 'isométrique [ ?ang1 ] [  ?ang2 ]'.! !

!ExpertRegle class methodsFor: 'rules'!
mesure: arg1
	arg1
		lisRegle: 'mesure-trianglePérimètreAffichemesure'
		si: 'triangle ?t [ périmètre: ?p ]
affiche mesure déduite'
		alors: 'afficher [ périmètre: ?t ] ?p'
		com: 'mesure du Périmètre d''un polygone'.
	arg1
		lisRegle: 'mesure-QuadrilatèrePérimètreAffichemesure'
		si: 'quadrilatère ?t [ périmètre: ?p ]
affiche mesure déduite'
		alors: 'afficher [ périmètre: ?t ] ?p'
		com: 'mesure du Périmètre d''un polygone'.
	arg1
		lisRegle: 'mesure-mesureAnglesAffiche'
		si: 'affiche mesure déduite
			angle0 [ ?x1 ?o ?x2 ] ?v1
mesure [ ?x1 ?o ?x2 ] ?v1 déduite
different:de: 180 ?v1'
		alors: 'afficher angle0 [ ?x1 ?o ?x2 ] ?v1'.
	arg1
		lisRegle: 'mesure-sommeDemesuresinit'
		si: 'mesuresDe  ?lmes ?m
dernier:rep: ?lmes ?der
mesure ?der ?mder
somme:et:rep:  ?mder ?m ?res
saufDernier:rep: ?lmes ?lmesSp'
		alors: 'mesuresDe  [ ?der ]  ?lmesSp ?res'
		com: 'addition des mesures d''une liste'.
	arg1
		lisRegle: 'mesure-sommeDemesuresSuite'
		si: 'mesuresDe  ?x ?lmes ?m
dernier:rep: ?lmes ?der
mesure ?der ?mder
somme:et:rep:  ?mder ?m ?res
saufDernier:rep: ?lmes ?lmesSd      
ajoutePremier:el:rep: ?x ?der ?l'
		alors: 'mesuresDe  ?l  ?lmesSd ?res'
		com: 'addition des mesures d''une liste'.
	arg1
		lisRegle: 'mesure-mesureSimple'
		si: 'mesure ?x ?m ?cond'
		alors: 'mesure ?x ?m'
		com: 'La mesure sans justification.'.
	arg1
		lisRegle: 'mesure-mesureAireAffiche1'
		si: 'affiche mesure déduite
mesure [ aire ?obj ?t  ] ?aire déduite
arrondis:rep: ?aire ?aire2'
		alors: 'afficher [ aire ?obj ?t  ?aire2 ]'.
	arg1
		lisRegle: 'mesure-mesureAireAffiche2'
		si: 'affiche mesure déduite
mesure [ aire0 ?obj ?t  ] ?aire déduite
arrondis:rep: ?aire ?aire2'
		alors: 'afficher [ aire ?obj ?t  ?aire2 ]'.
	arg1
		lisRegle: 'mesure-mesureAireHéronAffiche'
		si: 'affiche mesure déduite
mesure [ aireHéron ?obj ?t  ] ?aire déduite
arrondis:rep: ?aire ?aire2'
		alors: 'afficher [ aireHéron ?obj ?t  ?aire2 ]'.
	arg1
		lisRegle: 'mesure-aireQuadrilatère0'
		si: 'quadrilatère ?q  [ aire: ?a ]'
		alors: 'mesure [ aire quadrilatère ?q ] ?a déduite'
		com: 'mesure de l''aire d''un quadrilatère.'.
	arg1
		lisRegle: 'mesure-mesureSegmentsAffiche'
		si: 'affiche mesure déduite
point ?a
point ?b
mesure   [ ?a ?b ] ?v1 déduite
~ mesure [ ?a ?b ] ?v1 donnée
~ mesure [ ?b ?a ] ?v1 donnée'
		alors: 'afficher  [ ?a ?b ] ?v1'.
	arg1
		lisRegle: 'mesure-mesureAnglesAffichage'
		si: 'afficher angle0  [ ?x1 ?o ?x2 ] ?v1
~ mesure [ ?x1 ?o ?x2 ] ?v donnée'
		alors: 'angleCentre:de:a:coul: ?o ?x1 ?x2 cyan'.
	arg1
		lisRegle: 'mesure-mesurePérimétreAffichage'
		si: 'afficher [ périmètre: ?t ] ?p
retireFait: afficher [ périmètre: ?t ] ?p'
		alors: 'afficheTexte:a: [ périmètre: ?t ?p ] nil'.
	arg1
		lisRegle: 'mesure-mesureAireHéronAffichage'
		si: 'afficher [ aireHéron ?obj ?t  ?aire0 ]
retireFait: afficher [ aireHéron ?obj ?t  ?aire0 ]'
		alors: 'afficheTexte:a: [ aireHéron ?obj ?t ?aire0 ] nil'.
	arg1
		lisRegle: 'mesure-mesureAireAffichage'
		si: 'afficher [ aire ?obj ?t  ?aire0 ]
retireFait: afficher [ aire ?obj ?t  ?aire0 ]'
		alors: 'afficheTexte:a: [ aire ?obj ?t ?aire0 ] nil'.
	arg1
		lisRegle: 'mesure-mesureAirePolygoneAffichage'
		si: 'afficher [ aire Polygone ?x1 ?res ]	
arrondis:rep: ?res ?aire'
		alors: 'afficheTexte:a: [ aire Polygone ?x1 ?aire ] nil'.
	arg1
		lisRegle: 'mesure-mesureDistanceAffichage'
		si: 'afficher [ ?a ?b ]  ?mes
different:de: ?a  périmètre:'
		alors: 'distanceDe:a:coul: ?a ?b  cyan'.
	arg1
		lisRegle: 'mesure-produit1'
		si: 'mesure  [ produit ?b1 ?b2 ] ?mb
mesure ?b1 ?mb1
quotient:et:rep: ?mb ?mb1 ?mb2

~mesure ?b2 ?mb2'
		alors: 'mesure ?b2 ?mb2'
		com: 'premier terme d''un produit.'.
	arg1
		lisRegle: 'mesure-produit1'
		si: 'mesure  [ produit ?b1 ?b2 ] ?mb
mesure ?b2 ?mb2
quotient:et:rep: ?mb ?mb1 ?mb2
~mesure ?b1 ?mb1'
		alors: 'mesure ?b1 ?mb1'
		com: 'Deuxième terme d''un produit'.
	arg1
		lisRegle: 'mesure-moyenneIsométrie1'
		si: 'mesure  [ moyenne [ ?b1 ?b2 ] ] ?mb
relation:et:nom: ?b1 ?b2 isométrique'
		alors: 'mesure ?b1 ?mb'
		com: 'la mesure d''une moyenne de deux objets isométriques est égale à la mesure d''un des objets.'.
	arg1
		lisRegle: 'mesure-moyenneIsométrie2'
		si: 'mesure  [ moyenne [ ?b1 ?b2 ] ] ?mb
relation:et:nom: ?b1 ?b2 isométrique'
		alors: 'mesure ?b2 ?mb'
		com: 'la mesure d''une moyenne de deux objets isométriques est égale à la mesure d''un des objets.'.
	arg1
		lisRegle: 'mesure-moyenne1'
		si: 'mesure  [ moyenne ?b1 ?b2 ] ?mb
mesure ?b1 ?mb1
produit:et:rep: ?mb 2 ?bb
difference:et:rep: ?bb ?mb1 ?mb2
~mesure ?b2 ?mb2'
		alors: 'mesure ?b2 ?mb2'
		com: 'premier terme d''une moyenne.'.
	arg1
		lisRegle: 'mesure-moyenne2'
		si: 'mesure  [ moyenne ?b1 ?b2 ] ?mb
mesure ?b2 ?mb2
produit:et:rep: ?mb 2 ?bb
difference:et:rep: ?bb ?mb2 ?mb1
~ mesure ?b1 ?mb1'
		alors: 'mesure ?b1 ?mb1 '
		com: 'Deuxième terme d''une moyenne.'.
	arg1
		lisRegle: 'mesure-moyenne3'
		si: 'mesure ?b1 ?mb1		
mesure ?b2 ?mb2
somme:et:rep: ?mb1 ?mb2 ?mbb
quotient:et:rep: ?mbb 2 ?moy
~ mesure  [ moyenne ?b1 ?b2 ] ?moy'
		alors: 'mesure  [ moyenne ?b1 ?b2 ] ?moy'
		com: 'Calcul d''une moyenne.'.
	arg1
		lisRegle: 'mesure-distanceParallèles'
		si: 'parallèle ?d1 ?d2 ?pt
perpendiculaire ?perp  ?d1 ?p
pointSur ?d2 ?p
intersection ?i ?perp ?d1
different:de: ?p ?i
mesure ?x ?m
contient:el: ?x ?i
contient:el: ?x ?p
~ mesure [ aire trapèze ?q ] ?aire'
		alors: 'mesure [ distance parallèles [ ?d1 ?d2 ] ] ?m'
		com: 'la distance entre 2 parallèles est la mesure de la distance entre les intersections d''une perpendiculaire aux parallèles avec ces parallèles.'.
	arg1
		lisRegle: 'mesure-anglePlat'
		si: 'angle0 [ ?x ?o ?y ] [ plat ]'
		alors: 'mesure [ ?x ?o ?y ]  180 déduite'
		com: 'Un angle plat est 180°, sa mesure est 180.'.
	arg1
		lisRegle: 'mesure-angleDroit'
		si: 'angle0 [ ?x ?o ?y ] [ droit ]'
		alors: 'mesure [ ?x ?o ?y ] 90 déduite'
		com: 'Un angle droit est  90°, sa mesure est 90.'.
	arg1
		lisRegle: 'mesure-anglesSupplémentaires'
		si: 'angle  [ ?x ?o ?y ]  [ supplémentaires  [ ?x ?o ?z ]  ]
mesure [ ?x ?o ?z ] ?m1
difference:et:rep: 180 ?m1 ?rep'
		alors: 'mesure  [ ?x ?o ?y ] ?rep'
		com: 'La somme deux angles supplémentaires forment un angle plat , si l''on connait la mesure d''un des angles, la mesure de l''autre  est 180 - angle'.
	arg1
		lisRegle: 'mesure-isométrieAnglesNumérique'
		si: 'angle0 ?obj1
angle0 ?obj2
mesure ?obj1 ?m1 ?val
relation:et:nom:  ?obj1  ?obj2 isométrique
different:de: ?obj1  ?obj2
~  mesure ?obj2 ?m1 donnée'
		alors: 'mesure ?obj2 ?m1  déduite'
		com: 'Des objets isométriques ont même mesure'.
	arg1
		lisRegle: 'mesure-isométrieAnglesSymbolique'
		si: 'angle0 ?obj1
angle0 ?obj2
relation:et:nom:  ?obj1  ?obj2 isométrique
different:de: ?obj1  ?obj2
different:de: ?obj1  ?obj2'
		alors: 'égal [ mesure ?obj1 ] [ mesure ?obj2 ]'
		com: 'Les mesures d'' objets isométriques sont égales'.
	arg1
		lisRegle: 'mesure-isométrieCouples'
		si: 'mesure [ ?a ?b ] ?val
point ?x
point ?y
relation:et:nom: [ ?x ?y ] [ ?a ?b ] isométrique
different:de: [ ?x ?y ] [ ?a ?b ]
different:de: [ ?x ?y ] [ ?b ?a ]
'
		alors: 'mesure [ ?x ?y ] ?val déduite'
		com: 'Des objets isométriques ont même mesure'.
	arg1
		lisRegle: 'mesure-isométrieEgalité'
		si: 'somme ?x ?y ?z
somme ?x ?y  ?w
different:de:  ?z ?w'
		alors: 'égal ?z ?w'
		com: 'Si les termes d''une sommes	sont les mêmes, alors les résultats sont égaux'.
	arg1
		lisRegle: 'mesure-sommeSegment'
		si: 'segment ?s [  ?a ?c ]
pointSur ?s ?b
different:de: ?b  ?a
different:de: ?b ?c
different:de: ?a ?c'
		alors: 'somme [ mesure [ ?a ?b ]  ]  [ mesure [ ?b ?c ] ] [  mesure [ ?a ?c ] ]'.
	arg1
		lisRegle: 'mesure-AnglesEgalitéTransitivité'
		si: 'égal ?x ?y
égal ?x  ?z
different:de: ?y ?z'
		alors: 'égal  ?y ?z'
		com: 'Transitivité de l''égalité. x = y et x = z => y =  z.
		'.
	arg1
		lisRegle: 'mesure-sommeAnglesEgaux'
		si: 'égal [ mesure ?x1 ] [ mesure ?x2 ]
ordonneMot:et:rep1:rep2: [ mesure ?x1 ] [ mesure ?x2 ]   ?a ?b
different:de: ?x1 ?x2'
		alors: 'égal  [ somme ?a ?b ] [ double   [ mesure ?x1 ] '
		com: 'Si les  termes d''une somme sont égaux, la somme est le doule de l''un d''eux'.
	arg1
		lisRegle: 'mesure-SommeDedoubles '
		si: ' angle0 [  ?x1 ?o ?x2 ]  [ AuCentre: ?c ]
angle0 [  ?x1 ?s ?x2 ] [ Inscrit: ?c ]égal [ mesure  [ ?I ?O ?A ]  ]  [ double  [ mesure  [ ?A ?S ?O ]  ]  '
		alors: 'égal [ mesure [  ?x1 ?o ?x2 ]  ] [ double [ mesure [[  ?x1 ?s ?x2 ] ]'
		com: 'Si chaque terme d''une somme est le double d''un terme d''une autre somme, les sommes sont le double l''une de l''autre.'.
	arg1
		lisRegle: 'mesure-EgalitésPartiesSommes1'
		si: 'égal  [ somme ?x1 ?x2 ] [ double ?x3 ]
égal  [ somme ?x1 ?x2 ] ?x4
different:de:[ double ?x3 ]  ?x4'
		alors: 'égal [ double ?x3 ]  ?x4'
		com: 'Si les termes de deux sommes sont égaux les résutats sont égaux, en calcul formel, on peut égaler les résultats'.
	arg1
		lisRegle: 'mesure-EgalitésPartiesSommes2'
		si: 'égal  [ somme ?x1 ?x2 ] ?x3
égal  [ somme ?x4  ?x2 ] ?x3
different:de: ?x1 ?x4'
		alors: 'égal ?x1 ?x4'
		com: 'Si deux sommes sont égales et l''un des termes d''une somme est égal à un terme de l''autre somme, les autres termes sont égaux'.
	arg1
		lisRegle: 'mesure-EgalitésPartiesSommes3'
		si: 'égal  [ somme ?x1 ?x2 ] ?x3
égal  [ somme ?x2  ?x4 ] ?x3'
		alors: 'égal ?x1 ?x4'
		com: 'Si deux sommes sont égales et l''un des termes d''une somme est égal à un terme de l''autre somme, les autres termes sont égaux'.
	arg1
		lisRegle: 'mesure-EgalitésPartiesSommes4'
		si: 'égal  [ somme  ?x2 ?x1 ] ?x3
égal  [ somme ?x4 ?x2 ] ?x3'
		alors: 'égal ?x2 ?x4'
		com: 'Si deux sommes sont égales et l''un des termes d''une somme est égal à un terme de l''autre somme, les autres termes sont égaux'.
	arg1
		lisRegle: 'mesure-rapportDouble'
		si: 'égal [ somme [  mesure  ?x  ]     [ mesure ?y ]  ] [ mesure [ double ?x2 ]
égal [ somme  [ mesure ?x ]   [ mesure  ?y ] ]  ?z
different:de: ?z [ double ?x2 ]'
		alors: 'égal ?z [ double ?x2 ]'
		com: 'Rapport de 1 à 2 entre deux mesures.'.
	arg1
		lisRegle: 'mesure-EgalitéProduitsFacteurCommun1'
		si: ' égal  [ produit ?x1 ?y1 ]   [ produit ?x2 ?y2 ] ]
égal  [ produit ?x3 ?y1 ]   [ produit ?x4 ?y2 ] ]
ordonneMot:et:rep1:rep2:  ?x1 ?x3  ?x1 ?x3
different:de: ?x1 ?x3'
		alors: 'égal  [ quotient ?x1 ?x2 ] [ quotient ?x3 ?x4 ]'
		com: 'En divisant une égalité par l''autre, les facteurs communs s''éliminent,'.
	arg1
		lisRegle: 'mesure-EgalitéProduitsFacteurCommun2'
		si: 'égal  [ produit ?x1 ?y1 ]   [ produit ?x2 ?y2 ] ]
égal  [ produit ?x1 ?y3 ]   [ produit ?x2 ?y4 ] ]
ordonneMot:et:rep1:rep2:  ?y1 ?y3  ?y1 ?y3
different:de: ?y1 ?y3'
		alors: 'égal  [ quotient ?y1 ?y2 ] [ quotient ?y3 ?y4 ]'
		com: 'En divisant une égalité par l''autre, les facteurs communs s''éliminent,'.
	arg1
		lisRegle: 'mesure-Egalité>EchangeMoyens'
		si: 'égal  [ quotient ?x1 ?x2 ] [ quotient ?x3 ?x4 ]'
		alors: 'égal  [ quotient ?x1 ?x3 ] [ quotient ?x2 ?x4 ]'
		com: 'Dans une égalité entre quotients l''égalité subsiste si on échange les moyens.'.
	arg1
		lisRegle: 'mesure-additionmesuresAngles'
		si: 'angle0 [  ?x1 ?s ?x2 ]
angle0 [  ?x2 ?s ?x3 ]'
		alors: 'égal [  somme [ mesure  [  ?x1 ?s ?x2 ]  ] [  mesure [  ?x2 ?s ?x3  ]  ]  ] [  mesure [ ?x1 ?s ?x3 ] ]'
		com: 'Somme de deux angles adjacents.'.! !

!ExpertRegle class methodsFor: 'rules'!
morpion: arg1
	arg1
		lisRegle: 'Fin'
		si: 'ligne h1 ?1 ?2 ?3
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
	arg1
		lisRegle: 'v1'
		si: 'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
		alors: 'ligne v1 ?1 ?4 ?7'.
	arg1
		lisRegle: 'v2'
		si: 'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
		alors: 'ligne v2 ?2 ?5 ?8'.
	arg1
		lisRegle: 'v3'
		si: 'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
		alors: 'ligne v3 ?3 ?6 ?9'.
	arg1
		lisRegle: 'd1'
		si: 'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
		alors: 'ligne d1 ?1 ?5 ?9'.
	arg1
		lisRegle: 'd2'
		si: 'ligne h1 ?1 ?2 ?3
ligne h2 ?4 ?5 ?6
ligne h3 ?7 ?8 ?9'
		alors: 'ligne d2 ?3 ?5 ?7'.
	arg1
		lisRegle: 'adversaire o'
		si: 'joueur x'
		alors: 'adversaire o'.
	arg1
		lisRegle: 'adversaire x'
		si: 'joueur o'
		alors: 'adversaire x'.
	arg1
		lisRegle: 'a gagné'
		si: 'joueur ?j
ligne ?l ?j ?j ?j'
		alors: 'Joueur ?j [  a gagné ligne ?l ]'.
	arg1
		lisRegle: 'gagne 1'
		si: 'joueur ?j
ligne ?l - ?j ?j'
		alors: 'joueur ?j [ gagne en jouant ?l case 1 ]'.
	arg1
		lisRegle: 'gagne 2'
		si: 'joueur ?j
ligne ?l ?j - ?j'
		alors: 'joueur ?j [ gagne en jouant ?l case 2 ]'.
	arg1
		lisRegle: 'gagne 3'
		si: 'joueur ?j
ligne ?l ?j ?j  -'
		alors: 'joueur ?j [ gagne en jouant ?l case 3 ]'.
	arg1
		lisRegle: 'contre 1'
		si: 'adversaire ?a
joueur ?j
ligne ?l - ?a ?a'
		alors: 'j]oueur ?j [ contre ?a  en jouant ?l case 1'.
	arg1
		lisRegle: 'contre 2'
		si: 'adversaire ?a
joueur ?j
ligne ?l ?a - ?a'
		alors: 'joueur ?j [ contre ?a  en jouant ?l case 2 ]'.
	arg1
		lisRegle: 'contre 3'
		si: 'adversaire ?a
joueur ?j
ligne ?l ?a ?a -'
		alors: 'joueur ?j [ contre ?a  en jouant ?l case 3 ]'.
	arg1
		lisRegle: 'menace1'
		si: 'joueur ?j
adversaire ?a
ligne ?l ?j - -'
		alors: 'joueur ?j [ menace ?a en jouant ligne ?l case 2 ou 3 ]'.
	arg1
		lisRegle: 'menace2'
		si: 'joueur ?j
adversaire ?a
ligne ?l - ?j -'
		alors: 'joueur ?j [ menace ?a en jouant ligne ?l case 1 ou 3 ]'.
	arg1
		lisRegle: 'menace3'
		si: 'joueur ?j
adversaire ?a
ligne ?l - - ?j'
		alors: 'joueur ?j [ menace ?a en jouant ligne ?l case 1 ou 2 ]'.! !

!ExpertRegle class methodsFor: 'rules'!
morpionInterface: arg1
	arg1
		lisRegle: 'interface1-1'
		si: 'DrGTextItem ?T ligne h1 ?1 ?2 ?3'
		alors: 'ligne h1 ?1 ?2 ?3'.
	arg1
		lisRegle: 'interface1-2'
		si: 'DrGTextItem ?T ligne h2 ?4 ?5 ?6'
		alors: 'ligne h2 ?4 ?5 ?6'.
	arg1
		lisRegle: 'interface1-3'
		si: 'DrGTextItem ?T ligne h3 ?7 ?8 ?9'
		alors: 'ligne h3 ?7 ?8 ?9'.
	arg1
		lisRegle: 'interface2'
		si: 'DrGTextItem ?T joueur ?j'
		alors: 'joueur ?j'.! !

!ExpertRegle class methodsFor: 'rules'!
objetsSur: arg1
	| temp2 |
	arg1
		lisRegle: 'objetsSur-pointsConfondus'
		si: 'point ?x
point ?y
pointConfondu:avec: ?x ?y
ordonneMot:et:rep1:rep2:  ?x ?y ?x ?y
different:de: ?x ?y'
		alors: 'pointsConfondus ?x ?y'
		com: ' Des points de noms différents mais de même coordonées'.
	arg1
		lisRegle: 'objetsSur-droitesConfondues'
		si: 'sorteDeDroite ?x
sorteDeDroite  ?y
pointSur ?x ?p1
pointSur ?x ?p2
pointSur ?y ?p1
pointSur ?y ?p2 
different:de: ?x ?y
different:de: ?p1 ?p2
relationCrée:et:nom: ?x ?y confondues'
		alors: 'relationCréée  ?x ?y confondues'.
	arg1
		lisRegle: 'objetsSur-droitesConfonduesPerpendiculaire'
		si: 'sorteDeDroites ?x 
sorteDeDroites ?y
sorteDeDroite ?z
ordonneMot:et:rep1:rep2: ?x ?z ?xx ?zz
relation:et:nom: ?x ?y confondues
perpendiculaire ?xx ?zz
ordonneMot:et:rep1:rep2: ?y ?z ?yy ?zzz'
		alors: 'perpendiculaire ?yy ?zzz'
		com: 'Si l''une de deux sortes de droites confondues est perpendiculaire à une autre droite, l''autre l''est aussi.'.
	arg1
		lisRegle: 'objetsSur-MilieuSegment'
		si: 'segment ?s [ ?x ?y ]
milieu  [ ?x ?y ] ?m'
		alors: 'pointSur ?s ?m'
		com: 'Le milieu d''un segment est un point sur ce segment.'.
	arg1
		lisRegle: 'objetsSur-reflexion'
		si: 'reflexion  ?x1 ?x2 ?x3
perpendiculaire ?x4 ?x3
pointSur ?x4 ?x2'
		alors: 'pointSur ?x4 ?x1'
		com: 'Si un point est sur une perpendiculaire à l''axe de réflexion, son image l''est aussi'.
	arg1
		lisRegle: 'objetsSur-SegmentSur'
		si: 'segment ?s  [ ?p1 ?p2 ]
droite ?x
pointSur ?x ?p1
pointSur ?x ?p2
different:de: ?s ?x'
		alors: 'segmentSur ?x ?s'
		com: 'Si les extrémités d''un segment sont sur une droite, alors le segment est  sur la droite'.
	arg1
		lisRegle: 'objetsSur-IntersectionSur1'
		si: 'segmentSur ?x ?s
intersection ?i ?s ?y
pointSur ?x ?i
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy
different:de: ?x ?y'
		alors: 'intersection ?i ?xx ?yy'
		com: 'Si il y a une intersection sur un segment et ce segment sur cette droite, alors l''intersection est aussi sur la droite'.
	arg1
		lisRegle: 'objetsSur-IntersectionSur2'
		si: 'segmentSur ?x ?s
intersection ?i ?y ?s
pointSur ?x ?i
different:de: ?x ?y'
		alors: 'intersection ?i ?y ?x'
		com: 'Si il y a une intersection sur un segment et ce segment sur cette droite, alors l''intersection est aussi sur la droite'.
	arg1
		lisRegle: 'objetsSur-pointSurAlignement'
		si: 'angle  [ ?x ?y ?z ] plat
segment ?s [ ?x ?z ]'
		alors: 'pointSur ?s ?y '
		com: 'Le sommet d''un angle plat est sur le segment qui a pour extrémités les points de l''angle autres que le sommet,'.
	arg1
		lisRegle: 'objetsSur-Milieu'
		si: 'milieu ?p1 ?p2 ?m
droite ?d
pointSur ?d ?p1
pointSur ?d ?p2'
		alors: 'pointSur ?d ?m'
		com: 'le milieu de deux points sur une droite est aussi sur cette droite'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointSurLigne'.
	temp2 antecedents: 'DrGPointOncurveItem ?pt ?L'.
	temp2 concl: 'pointSur  ?L ?pt'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointSurSegmentMilieu1'.
	temp2 antecedents: 'DrGSegment2ptsItem ?s ?a ?b
milieu ?s ?m'.
	temp2 concl: 'pointSur  ?s ?m'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointIntersection1'.
	temp2 antecedents: 'DrGPointIntersectionItem ?pt ?L1 ?L2 '.
	temp2 concl: 'pointSur  ?L1 ?pt'.
	temp2 com: 'le point interesection est sur le premier objet.'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointIntersection2'.
	temp2 antecedents: 'DrGPointIntersectionItem ?pt ?L1 ?L2 '.
	temp2 concl: 'pointSur ?L2 ?pt'.
	temp2 com: 'le point interesection est sur le deuxième objet.'.
	temp2 _ arg1 creeRegle: 'objetSsur-PointSurDemi-droiteDroite1'.
	temp2 antecedents: 'demi-droite ?dd ?a ?b
sorteDeDroite ?sd
pointsSur ?dd ?pts
pointSur ?sd ?x
pointSur ?sd ?y
contient:el: ?pts  ?x
contient:el: ?pts  ?y
different:de: ?x ?y
different:de: ?dd ?sd'.
	temp2 concl: 'demi-droiteSur ?sd ?dd'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointSurDemi--droiteDroite2'.
	temp2 antecedents: 'DrGRay2ptsItem ?D1 ?A ?B'.
	temp2 concl: 'pointSur ?D1 ?B'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointSurSorteDeDroite1'.
	temp2 antecedents: 'sorteDeDroite ?d ?A ?B
point ?A
point ?B
different:de: ?A ?B'.
	temp2 concl: 'pointSur ?d ?A'.
	temp2 com: 'Un point qui définit sorte de droite est sur  cette sorte de droite'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointSurSorteDeDroite2'.
	temp2 antecedents: 'sorteDeDroite ?d ?A ?B
point ?A
point ?B
different:de: ?A ?B'.
	temp2 concl: 'pointSur ?d ?B'.
	temp2 com: 'Un point qui définit une sorte de droite est sur  cette sorte de droite'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointSurPerpendiculairePassantParUnPoint'.
	temp2 antecedents: 'perpendiculaire ?p ?d ?x'.
	temp2 concl: 'pointSur ?p ?x'.
	temp2 com: 'Le  point par où passe une perpendiculaire est  sur cette perpendiculaire'.
	temp2 _ arg1 creeRegle: 'objetSsur-PointSurDroite3'.
	temp2 antecedents: 'DrGLine2ptsItem ?D1 ?A ?B'.
	temp2 concl: 'pointSur ?D1 ?A'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointSurDroite4'.
	temp2 antecedents: 'droite ?D1 ?A ?B'.
	temp2 concl: 'pointSur ?D1 ?B'.
	temp2 _ arg1 creeRegle: 'objetsSur-SegmentSurSorteDeDroite'.
	temp2 antecedents: 'segment ?s [  ?a ?b ]
sorteDeDroite ?d
pointSur ?d ?a
pointSur ?d ?b
different:de: ?d ?s'.
	temp2 concl: 'segmentSur ?d [ ?a ?b ]'.
	temp2 _ arg1 creeRegle: 'objetsSur-CoupleSurSorteDeDroite'.
	temp2 antecedents: ' sorteDeDroite ?d
pointSur ?d ?a
pointSur ?d ?b
ordonneMot:et:rep1:rep2: ?a ?b ?aa ?bb
pointDifferent:de: ?a ?b'.
	temp2 concl: 'coupleSur ?d [ ?aa ?bb ]'.
	temp2 com: 'Un couple sur une sorte de droite'.
	arg1
		lisRegle: 'objetsSur-PointSur-parallèle'
		si: 'sorteDeDroite ?d1
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
	arg1
		lisRegle: 'objetsSur-PointSurPsarallèle'
		si: 'parallèle ?d2  ?d1
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
	temp2 _ arg1 creeRegle: 'objetsSur-VecteurSurDroite'.
	temp2 antecedents: 'vecteur ?s ?x ?y
pointSur ?D1 ?x
pointSur ?D1 ?y
different:de: ?x ?y
droite ?D1 
'.
	temp2 concl: 'vecteurSur ?D1 ?s'.
	arg1
		lisRegle: 'objetsSur-SegmentSurBissectrice'
		si: 'segment ?s [ ?x ?p2 ]
bissectrice  ?D1 ?p1 ?p2 ?p3
pointSur ?D1 ?x
different:de: ?x  ?p2'
		alors: 'segmentSur ?D1 ?s'.
	temp2 _ arg1 creeRegle: 'objetsSur-VecteurSursegment'.
	temp2 antecedents: 'vecteur ?s ?x ?y
segment ?D1 [ ?x ?y ]'.
	temp2 concl: 'segmentSur ?D1 ?s'.
	arg1
		lisRegle: 'objetsSur-SegmentSurBissectrice'
		si: 'segment ?s [ ?x ?p2 ]
bissectrice  ?b ?p1 ?p2 ?p3
pointSur ?b ?x
different:de: ?x  ?p2
different:de: ?x  ?p3
different:de: ?x ?p1'
		alors: 'segmentSur ?b ?s'.
	temp2 _ arg1 creeRegle: 'objetsSur-SegmentSurMediatrice'.
	temp2 antecedents: 'mediatrice  ?D1 ?p1 ?p2 
pointSur ?D1 ?x
pointSur ?D1 ?y
segment ?s [ ?x ?y ]
different:de: ?x ?y'.
	temp2 concl: 'segmentSur ?D1 ?s'.
	temp2 _ arg1 creeRegle: 'objetsSur-SegmentSurSegment'.
	temp2 antecedents: 'segment ?s [ ?x ?y ]
segment ?s1 [ ?a ?b ]
pointSur ?s1 ?x
pointSur ?s1 ?y
different:de: ?s ?s1
different:de: ?x ?y
different:de: ?x ?a
different:de: ?y ?b
'.
	temp2 concl: 'segmentSur ?s1 ?s'.
	arg1
		lisRegle: 'objetsSur-SegmentSurPerp1'
		si: 'perpendiculaire  ?D1 ?a ?b
pointSur ?D1 ?x
pointSur ?D1 ?y
segment ?s [ ?x ?y ]
different:de: ?D1 ?s'
		alors: 'segmentSur ?D1 ?s'.
	arg1
		lisRegle: 'objetsSur-SegmentSurPerp2'
		si: 'perpendiculaire  ?D1 ?a ?b
pointSur ?a ?x
pointSur ?a ?y
segment ?s [ ?x ?y ]
different:de: ?a ?s'
		alors: 'segmentSur ?a ?s'.
	arg1
		lisRegle: 'objetsSur-SegmentSurParal'
		si: 'segment ?s [ ?x ?y ]
pointSur ?D1 ?x
pointSur ?D1 ?y
parallèle  ?D1 ?a 
different:de: ?D1 ?s'
		alors: 'segmentSur ?D1 ?s'.
	arg1
		lisRegle: 'objetsSur-perpendiculaiereSegmentSurPerp2'
		si: 'segment ?s [ ?x ?y ]
pointSur ?D1 ?x
pointSur ?D1 ?y
different:de: ?x ?y
perpendiculaire  ?D1 ?D2'
		alors: 'perpendiculaire [ ?x ?y ] ?D2'.
	arg1
		lisRegle: 'objetsSur-cordeSegment'
		si: 'segment ?s [  ?p1 ?p2  ]
cercle ?c
pointSur ?c ?p1
pointSur ?c ?p2'
		alors: 'cercle ?c [ corde: ?s ]'
		com: 'Un segment qui a ses extrémités sur un cercle est une corde sde ce cercle'.
	temp2 _ arg1 creeRegle: 'objetsSur-SegmentSurDroite2'.
	temp2 antecedents: 'segment ?s [ ?x ?y ]
pointSur ?D1 ?x
pointSur ?D1 ?y
different:de: ?x ?y
different:de: ?D1 ?s
droite ?D1 ?a ?b'.
	temp2 concl: 'segmentSur ?D1 ?s'.
	arg1
		lisRegle: 'objetsSur-cordeCouple'
		si: 'cercle ?c
pointSur ?c ?p1
pointSur ?c ?p2
different:de: ?p1 ?p2'
		alors: 'cercle ?c [  corde: [ ?p1 ?p2 ] ]'
		com: 'Un segment qui a ses extrémités sur un cercle est une corde de ce cercle'.
	temp2 _ arg1 creeRegle: 'objetsSur-SegmentSurDroite2'.
	temp2 antecedents: 'segment ?s [ ?x ?y ]
pointSur ?D1 ?x
pointSur ?D1 ?y
different:de: ?x ?y
different:de: ?D1 ?s
droite ?D1 ?a ?b'.
	temp2 concl: 'segmentSur ?D1 ?s'.
	arg1
		lisRegle: 'objetsSur-cerclePointOpposé1'
		si: 'cercle ?cer
cercle ?cer [  centre: ?o ]
pointSur ?cer ?p1
milieu [ ?p1 ?p2 ] ?o'
		alors: 'pointSur ?cer ?p2'
		com: 'Si le milieu d''un couple de points est le centre d''un cercle et l''un des points du couple sur le cercle, alors l''autre point du couple est aussi sur  ce cercle.'.
	arg1
		lisRegle: 'objetsSur-cerclePointOpposé2'
		si: 'cercle ?cer
cercle ?cer [  centre: ?o ]
pointSur ?cer ?p2
milieu [ ?p1 ?p2 ] ?o'
		alors: 'pointSur ?cer ?p1'
		com: 'Si le milieu d''un couple de points est le centre d''un cercle et l''un des points du couple sur le cercle, alors l''autre point du couple est aussi sur  ce cercle.'.
	arg1
		lisRegle: 'objetsSur-diamètreCercle2'
		si: 'cercle ?cercle 
cerle ?cercle [ centre: ?centre ] 
milieu ?s ?centre
pointSur ?cercle ?p2
segment ?s [ ?p2 ?p ]'
		alors: 'diamètre ?cercle   [ ?p ?p2 ]'
		com: 'Si un segment ou un couple a une extrémité sur un cercle et son milieu au centre du cercle c''est un diamètre'.
	arg1
		lisRegle: 'objetsSur-diamètreCercle2'
		si: 'cercle ?cercle 
cerle ?cercle [ centre: ?centre ] 
milieu ?s ?centre
segment ?s [ ?p ?p2 ]
pointSur ?s ?p2'
		alors: 'diamètre ?cercle   [ ?p ?p2 ]'
		com: 'Si un segment a une extrémité sur un cercle et son milieu au centre du cercle c''est un diamètre'.
	arg1
		lisRegle: 'objetsSur-diamètreCercleExtrémités1'
		si: 'diamètre ?cercle  ?s
cercle ?cercle ?centre ?x
segment ?s [ ?p1 ?p2 ]
pointSur ?cercle ?p1'
		alors: 'pointSur ?cercle  ?p1'
		com: 'Si un segment est le diamètre d''un cerlce ses extrémités sont sur le cercle.'.
	arg1
		lisRegle: 'objetsSur-diamètreCercleExtrémités2'
		si: 'diamètre ?cercle  ?s
cercle ?cercle ?centre ?x
segment ?s [ ?p1 ?p2 ]
pointSur ?cercle ?p2'
		alors: 'pointSur ?cercle  ?p1'
		com: 'Si un segment est le diamètre d''un cerlce ses extrémités sont sur le cercle.'.
	temp2 _ arg1 creeRegle: 'objetsSur-Segmentparallèles'.
	temp2 antecedents: 'parallèle ?d1 ?d2
segmentSur ?d1 ?s1
segmentSur ?d2 ?s2
different:de: ?d1 ?d2
different:de:  ?S1 ?S2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2'.
	temp2 concl: 'parallèle ?ss1 ?ss2'.
	temp2 _ arg1 creeRegle: 'objetsSur-droitesparallèles'.
	temp2 antecedents: 'parallèle ?s1 ?s2
segmentSur ?d1 ?s1
segmentSur ?d2 ?s2
droite ?d1 ?i ?j
droite ?d2 ?k ?l
different:de: ?d1 ?d2
ordonneMot:et:rep1:rep2: ?d1 ?d2 ?dd1 ?dd2'.
	temp2 concl: 'parallèle ?dd1 ?dd2'.
	temp2 _ arg1 creeRegle: 'objetsSur-Intersectiondroites'.
	temp2 antecedents: 'pointSur ?o1 ?pt
pointSur ?o2 ?pt
different:de: ?o1 ?o2
ordonneMot:et:rep1:rep2:  ?o1 ?o2 ?oo1 ?oo2'.
	temp2 concl: 'intersection ?pt ?oo1 ?oo2'.
	temp2 _ arg1 creeRegle: 'objetsSur-Intersection1'.
	temp2 antecedents: 'pointSur ?o1 ?pt
pointSur ?o2 ?pt
sorteDeDroite ?o1
sorteDeDroite  ?o2
ordonneMot:et:rep1:rep2:  ?o1 ?o2  ?o1 ?o2
nonRelation:et:nom: ?o1 ?o2 parallèle
different:de: ?o1 ?o2'.
	temp2 concl: 'intersection ?pt ?o1 ?o2'.
	temp2 com: 'Un point sur deux objets différents est une intersection de ces objets.'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointIntersection'.
	temp2 antecedents: 'intersection ?pt ?o1 ?o2 
'.
	temp2 concl: 'point ?pt'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointIntersection1'.
	temp2 antecedents: 'intersection ?pt ?o1 ?o2 
'.
	temp2 concl: 'pointSur ?o1 ?pt'.
	temp2 com: 'Le point d''intersection est sur le premier objet'.
	temp2 _ arg1 creeRegle: 'objetsSur-PointIntersection2'.
	temp2 antecedents: 'intersection ?pt ?o1 ?o2 
'.
	temp2 concl: 'pointSur ?o2  ?pt'.
	temp2 com: 'Le point d''intersection est sur le deuxième objet'.
	arg1
		lisRegle: 'objetsSur-symCentrale'
		si: 'symetrieCentrale ?cible  ?orig  ?centre
point ?orig
pointSur  ?obj  ?orig
symetrieCentrale ?cible2  ?obj ?centre
'
		alors: 'pointSur ?cible2 ?cible'.
	arg1
		lisRegle: 'objetsSur-PointSur-milieuSurSegment'
		si: 'segment ?s [ ?a ?b ]
milieu ?a ?b ?i'
		alors: 'milieu ?s ?i'
		com: 'le milieu entre deux points reliés par un segment est aussi le milieu du segment'.
	arg1
		lisRegle: 'objetsSur-PointSur-milieuSurSegment'
		si: 'segment ?s [ ?a ?b ]
milieu ?a ?b ?i'
		alors: 'milieu ?s ?i'
		com: 'le milieu entre deux points reliés par un segment est aussi le milieu du segment'.
	arg1
		lisRegle: 'objetsSur-confondus'
		si: 'angle0 [ ?a ?s ?b  ]
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
	arg1
		lisRegle: 'objetsSur-angleAprès1'
		si: 'angle0 [ ?a ?s ?b  ]
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
	arg1
		lisRegle: 'objetsSur-angleAprès2'
		si: 'angle0 [ ?a ?s ?b  ]
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
	arg1
		lisRegle: 'objetsSur-angleAvant1'
		si: 'angle0 [ ?a ?s ?b  ]
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
	arg1
		lisRegle: 'objetsSur-angleAvant2'
		si: 'angle0 [ ?a ?s ?b  ]
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
	arg1
		lisRegle: 'objetsSur-positionSecanteAvant1'
		si: ' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d3 ?pts
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
intersection ?O ?dd1 ?dd3
justeAvant:el:rep: ?pts ?O ?x'
		alors: 'position ?x Avant ?O ?d3'
		com: 'Un point avant un autre sur la sécante de deux parallèles.'.
	arg1
		lisRegle: 'objetsSur-positionSecanteAprès1'
		si: ' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d3 ?pts
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
intersection ?O ?dd1 ?dd3
justeAprès:el:rep: ?pts ?O ?x'
		alors: 'position ?x Après ?O ?d3'
		com: 'Un point avant un autre sur la sécante de deux parallèles.'.
	arg1
		lisRegle: 'objetsSur-positionSecanteAvant2'
		si: ' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d3 ?pts
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?dd3
intersection ?O ?dd2 ?dd3
justeAvant:el:rep: ?pts ?O ?x'
		alors: 'position ?x Avant ?O ?d3'
		com: 'Un point avant un autre sur la sécante de deux parallèles.'.
	arg1
		lisRegle: 'objetsSur-positionSecanteAprès2'
		si: ' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d3 ?pts
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?dd3
intersection ?O ?dd2 ?dd3
justeAprès:el:rep: ?pts ?O ?x'
		alors: 'position ?x Après ?O ?d3'
		com: 'Un point avant un autre sur la sécante de deux parallèles.'.
	arg1
		lisRegle: 'objetsSur-positionSecanteAvant3'
		si: 'parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d1 ?pts
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
intersection ?O ?dd1 ?dd3
justeAvant:el:rep: ?pts ?O ?x'
		alors: 'position ?x Avant ?O ?d1'
		com: 'Un point avant un autre sur l''une des deux parallèles.'.
	arg1
		lisRegle: 'objetsSur-positionSecanteAprès3'
		si: 'parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d1 ?pts
ordonneMot:et:rep1:rep2: ?d1 ?d3 ?dd1 ?dd3
intersection ?O ?dd1 ?dd3
justeAprès:el:rep: ?pts ?O ?x'
		alors: 'position ?x Après ?O ?d1'
		com: 'Un point avant un autre sur l''une des deux parallèles.'.
	arg1
		lisRegle: 'objetsSur-positionSecanteAvant4'
		si: ' parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d2 ?pts
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?dd3
intersection ?O ?dd2 ?dd3
justeAvant:el:rep: ?pts ?O ?x'
		alors: 'position ?x Avant ?O ?d2'
		com: 'Un point avant un autre sur l''une des deux parallèles.'.
	arg1
		lisRegle: 'objetsSur-positionSecanteAprès4'
		si: 'parallèle ?d1 ?d2
sorteDeDroite ?d3
pointsSur:rep: ?d2 ?pts
ordonneMot:et:rep1:rep2: ?d2 ?d3 ?dd2 ?dd3
intersection ?O ?dd2 ?dd3
justeAprès:el:rep: ?pts ?O ?x'
		alors: 'position ?x Après ?O ?d2'
		com: 'Un point avant un autre sur l''une des  deux parallèles.'.
	arg1
		lisRegle: 'objetsSur-Entre'
		si: 'position  ?x Avant ?y ?d1
position  ?x Après ?z ?d1'
		alors: 'entre ?x ?y  ?z ?d1'
		com: 'Un point sur une droite entre deux points.'.
	arg1
		lisRegle: 'objetsSur-PerpendiculaireCouple'
		si: 'coupleSur ?x [ ?x1 ?x2 ]
coupleSur ?y [  ?y1 ?y2  ]
ordonneMot:et:rep1:rep2: ?x ?y ?xx ?yy
ordonneMot:et:rep1:rep2: ?cplx ?cply ?cplxx ?cplyy
perpendiculaire ?xx ?yy
different:de: ?x ?y'
		alors: 'perpendiculaire ?cplxx ?cplyy'
		com: 'Si des couples sont sur des objets perpendiculaires, alors les couples sont aussi perpendiculaires.'.
	arg1
		lisRegle: 'objetsSur-Après1'
		si: 'sorteDeDroite ?d1
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
	arg1
		lisRegle: 'objetsSur-Avant1'
		si: ' sorteDeDroite ?d1
pointSur ?d1 ?p1
pointSur ?d1 ?p2 
pointsSur ?d1 ?pts1
index:el:rep:  ?pts1 ?p1  ?ind1
index:el:rep:  ?pts1 ?p2  ?ind2
inférieur:à: ?ind1 ?ind2
different:de: ?p2 ?p1
nonPointConfondu:avec: ?p1 ?p2'
		alors: 'position ?p1 Avant ?p2 ?d1'
		com: 'Un point sur une droite Avant un autre.'.! !

!ExpertRegle class methodsFor: 'rules'!
ohmRegles: arg1
	arg1
		lisRegle: 'Ohm-Regles-texte'
		si: 'DrGTextItem ?x ?y ?z ?v ?u'
		alors: '?y ?z  ?v ?u'
		com: 'lecture de données texte.'.
	arg1
		lisRegle: 'Ohm-ResistanceEqSerie'
		si: 'serie ?R1 ?R2
resistance ?R1 ?r1 ?u
resistance ?R2 ?r2 ?u
somme:et:rep: ?r1 ?r2 ?r'
		alors: 'resistance [ serie ?R1 ?R2 ] ?r ?u'
		com: 'La résistance équivalente à deux résitances en série est égale à la somme des résistances. '.
	arg1
		lisRegle: 'Ohm-CourantSerie1'
		si: 'serie ?r1 ?r2
courant ?r1 ?i A'
		alors: 'courant ?r2 ?i A'
		com: 'Dans des résistance en série, le courant  est le même pour  chaque résistance.'.
	arg1
		lisRegle: 'Ohm-CourantSerie2'
		si: 'serie ?r1 ?r2
courant ?r2 ?i A'
		alors: 'courant ?r1 ?i A'
		com: 'Dans des résistance en série, le courant  est le même pour  chaque résistance.'.
	arg1
		lisRegle: 'Ohm-CourantSerie3'
		si: 'serie ?r1 ?r2
courant ?r2 ?i A'
		alors: 'courant [ serie ?r1 ?r2 ] ?i A'
		com: 'Dans un circuit de deux résistance en série, le courant  est le même que pour chaque résistance.'.
	arg1
		lisRegle: 'Ohm-CourantSerie4'
		si: 'serie ?r1 ?r2
courant ?r1 ?i A'
		alors: 'courant [ serie ?r1  ?r2 ] ?i A'
		com: 'Dans un circuit de deux résistance en série, le courant  est le même que pour chaque résistance.'.
	arg1
		lisRegle: 'Ohm-CourantSerie5'
		si: 'serie ?r1 ?r2
courant [ serie ?r1  ?r2 ] ?i A'
		alors: 'courant ?r1 ?i A'
		com: 'Dans un circuit de deux résistance en série, le courant  est le même pour une résistance que pour le circuit.'.
	arg1
		lisRegle: 'Ohm-CourantSerie6'
		si: 'serie ?r1 ?r2
courant [ serie ?r1  ?r2 ] ?i A'
		alors: 'courant ?r2 ?i A'
		com: 'Dans un circuit de deux résistance en série, le courant  est le même pour une résistance que pour le circuit.'.
	arg1
		lisRegle: 'Ohm-ResistanceEqParallele'
		si: 'parallele ?R1 ?R2
resistance ?R1 ?r1 ?u
resistance ?R2 ?r2 ?u
quotient:et:rep: 1 ?r1 ?q1
quotient:et:rep: 1 ?r2 ?q2
somme:et:rep: ?q1 ?q2 ?q
quotient:et:rep: 1 ?q ?req
~ resistance [ parallele ?R1 ?R2 ] ?xreq Ohm-s'
		alors: 'resistance [ parallele ?R1 ?R2 ] ?req Ohm-s'
		com: 'La résistance équvalente au circuit de deux résistances en parallèle est l''inverse de la somme des inverses des résistances.'.
	arg1
		lisRegle: 'Ohm-CourantParallele1'
		si: 'parallele ?r1 ?r2
courant ?r1 ?i1 A
courant ?r2 ?i2 A
somme:et:rep: ?i1 ?i2 ?i'
		alors: 'courant [ parallele ?r1  ?r2 ] ?i A'
		com: 'Le courant dans un circuit de deux résisrances en parallèles est la somme des courants dans chaque résistance.'.
	arg1
		lisRegle: 'Ohm-CourantParallele'
		si: 'courant [ parallele ?r1  ?r2 ] ?i A'
		alors: 'parallele ?r1 ?r2'
		com: 'Si l''on affrme le courant dans deux résistances en parallèle, on affirme que les résistances sont en parallèle.'.
	arg1
		lisRegle: 'Ohm-CourantParallele2'
		si: 'courant [ parallele ?r1  ?r2 ] ?i A
courant ?r2 ?i2 A
difference:et:rep: ?i ?i2 ?i1
~ courant ?r1 ?xi1 A'
		alors: 'courant ?r1 ?i1 A'
		com: 'Si l''on connait le courant dans une résistance, et  le courant dans un circuit de deux résistances en parallèles
, on peut calculer le courant dans l''autre résistance.'.
	arg1
		lisRegle: 'Ohm-CourantParallele3'
		si: 'courant [ parallele ?r1  ?r2 ] ?i A
courant ?r1 ?i1 A
difference:et:rep: ?i ?i1 ?i2
~ courant ?r2 ?xi2 A'
		alors: 'courant ?r2 ?i2 A'
		com: 'Si l''on connait le courant dans une résistance, et  le courant dans un circuit de deux résistances en parallèles
, on peut calculer le courant dans l''autre résistance.'.
	arg1
		lisRegle: 'Ohm-TensionSerie1'
		si: 'tension [ serie ?r1 ?r2 ] ?u  V
tension ?r2 ?u2 V
difference:et:rep: ?u ?u2 ?u1
~ tension ?r1 ?xu1 V'
		alors: 'tension ?r1 ?u1 V'
		com: 'Si l''on connait la tension dans une résistance, et  la tension du circuit de deux résistances en série
, on peut calculer la tension de l''autre résistance.'.
	arg1
		lisRegle: 'Ohm-TensionSerie'
		si: 'tension [ serie ?r1 ?r2 ] ?u  V'
		alors: 'serie ?r1 ?r2'
		com: 'Si l''on affime  la tension du circuit de deux résistances en série,
on peut affirmer que les résistances sont en série.'.
	arg1
		lisRegle: 'Ohm-TensionSerie2'
		si: 'tension [ serie ?r1 ?r2 ] ?u  V
tension ?r1 ?u1 V
difference:et:rep: ?u ?u1 ?u2
~ tension ?r2 ?xu2 V'
		alors: 'tension ?r2 ?u2 V'
		com: 'Si l''on connait la tension dans une résistance, et  la tension du circuit de deux résistances en série,
 on peut calculer la tension de l''autre résistance.'.
	arg1
		lisRegle: 'Ohm-TensionSerie3'
		si: 'serie ?r1 ?r2
tension ?r1 ?u1 V
tension ?r2 ?u2 V
somme:et:rep: ?u1 ?u2 ?u
~ tension [ serie ?r1 ?r2 ] ?xu  V'
		alors: 'tension [ serie ?r1 ?r2 ] ?u  V'
		com: 'La tension d''un circuit de deux résistances en série est la somme des tensions des résistances.'.
	arg1
		lisRegle: 'Ohm-TensionParallele1'
		si: 'parallele ?r1 ?r2
tension ?r2 ?u V
~ tension ?r1 ?xu V'
		alors: 'tension ?r1 ?u V'
		com: ' Des résistances  en parallèle ont la même  tension.'.
	arg1
		lisRegle: 'Ohm-TensionParallele2'
		si: 'parallele ?r1 ?r2
tension ?r1 ?u V
~ tension ?r2 ?xu V'
		alors: 'tension ?r2 ?u V'
		com: 'Des résistances en parallèle ont la même tension.'.
	arg1
		lisRegle: 'Ohm-TensionParallele3'
		si: 'parallele ?r1 ?r2
tension ?r1 ?u V
~ tension [ parallele ?r1 ?r2  ] ?xu V'
		alors: 'tension [ parallele ?r1 ?r2  ] ?u V'
		com: 'Dans un circuit de résistances en parallèle, le circuit a la même tension que chaque résistance.'.
	arg1
		lisRegle: 'Ohm-TensionParallele5'
		si: 'tension [ parallele ?r1 ?r2  ] ?u V
~ tension ?r1 ?xu V'
		alors: 'tension ?r1 ?u V'
		com: 'Dans un circuit de résistances en parallèle, chaque résistance a la même tension que le circuit.'.
	arg1
		lisRegle: 'Ohm-TensionParallele6'
		si: 'tension [ parallele ?r1 ?r2  ] ?u V
~ tension ?r2 ?xu V'
		alors: 'tension ?r2 ?u V'
		com: 'Dans un circuit de résistances en parallèle, chaque résistance a la même tension que le circuit.'.
	arg1
		lisRegle: 'Ohm-TensionParallele4'
		si: 'parallele ?r1 ?r2
tension ?r2 ?u V
~ tension [ parallele ?r1 ?r2  ] ?xu V'
		alors: 'tension [ parallele ?r1 ?r2  ] ?u V'
		com: 'Dans un circuit de résistances en parallèle, le circuit a la même tension que chaque résistance.'.
	arg1
		lisRegle: 'Ohm-CircuitSerie1'
		si: 'serie [ serie ?r1 ?r2 ] ?r3'
		alors: 'serie ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	arg1
		lisRegle: 'Ohm-CircuitSerie2'
		si: 'serie ?r3 [ serie ?r1 ?r2 ]'
		alors: 'serie ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	arg1
		lisRegle: 'Ohm-CircuitSerie3'
		si: 'parallele [ serie ?r1 ?r2 ] ?r3'
		alors: 'serie ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	arg1
		lisRegle: 'Ohm-CircuitSerie4'
		si: 'parallele ?r3 [ serie ?r1 ?r2 ]'
		alors: 'serie ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	arg1
		lisRegle: 'Ohm-CircuitParallele1'
		si: 'parallele [ parallele ?r1 ?r2 ] ?r3'
		alors: 'parallele ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	arg1
		lisRegle: 'Ohm-CircuitParallele2'
		si: 'parallele ?r3 [ parallele ?r1 ?r2 ]'
		alors: 'parallele ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	arg1
		lisRegle: 'Ohm-CircuitParallele3'
		si: 'serie [ parallele ?r1 ?r2 ] ?r3'
		alors: 'parallele ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	arg1
		lisRegle: 'Ohm-CircuitParallele4'
		si: 'serie ?r3 [ parallele ?r1 ?r2 ]'
		alors: 'parallele ?r1 ?r2'
		com: 'Affirmation d''une partie de circuit.'.
	arg1
		lisRegle: 'Ohm-Resistance'
		si: 'courant ?r1 ?i A
tension ?r1 ?u V
quotient:et:rep:   ?u ?i ?r
~ resistance ?r1 ?xr Ohm-s'
		alors: 'resistance ?r1 ?r Ohm-s'
		com: 'loi d''Ohm : R = U / I'.
	arg1
		lisRegle: 'Ohm-Courant'
		si: 'resistance ?r1 ?r Ohm-s
tension ?r1 ?u V
quotient:et:rep:   ?u ?r ?i
~ courant ?r1 ?xi A'
		alors: 'courant ?r1 ?i A'
		com: 'loi d''Ohm : I = U / R'.
	arg1
		lisRegle: 'Ohm-Tension'
		si: 'resistance ?r1 ?r Ohm-s
courant ?r1 ?i A
produit:et:rep:   ?i ?r ?u
~ tension ?r1 ?u V'
		alors: 'tension ?r1 ?u V'
		com: 'loi d''Ohm : U = R * I'.! !

!ExpertRegle class methodsFor: 'rules'!
paralPerpRegles: arg1
	arg1
		lisRegle: 'paralPerp-MêmeDirectioninv'
		si: 'sorteDeDroite ?s1
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
	arg1
		lisRegle: 'paralPerp-MêmeDirection'
		si: 'segment ?s1
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
	arg1
		lisRegle: 'paralPerp-confondue'
		si: 'point ?p
pointSur ?x1 ?p
pointSur ?x2 ?p
different:de: ?x1 ?x2
relation:et:nom: ?x1 ?x2 parallèle'
		alors: 'parallèlesConfondues ?x1 ?x2'
		com: 'Si un  même point est sur deux parallèles, alors ces parallèles sont  confondues.'.
	arg1
		lisRegle: 'paralPerp-angleDroit'
		si: 'angle [  ?x1 ?o ?x2 ] ?j1
mesure [ ?x1 ?o ?x2 ] 90 ?j 
segment ?perp1 [ ?o  ?x1 ]
segment ?perp2 [ ?x2 ?o  ]'
		alors: 'perpendiculaire ?perp1 ?perp2'
		com: 'Deux couples de points formant un angle de 90° sont perpendiculaires'.
	arg1
		lisRegle: 'paralPerp-segmentsCouples'
		si: 'segment ?s1 [ ?x1 ?y1 ]
segment ?s2 [ ?x2 ?y2 ]
different:de: ?s1 ?s2
relation:et:nom: ?s1 ?s2 parallèle
relationCrée:et:nom: [ ?x1 ?y1 ] [ ?x2 ?y2 ] parallèle
ordonneMot:et:rep1:rep2:  [ ?x1 ?y1 ] [ ?x2 ?y2 ] ?x ?y ]'
		alors: 'relationCréée ?x ?y parallèle'
		com: 'Si les segments sont paralèles, leurs couples le sont aussi'.
	arg1
		lisRegle: 'paralPerp-SegmentsPerpendiculairesSegmentCouples1'
		si: 'perpendiculaire ?s1  ?s2
segment ?s1 ?c1
segment ?s2 ?c2
ordonneMot:et:rep1:rep2: ?c1 ?c2 ?cc1 ?cc2
different:de: ?s1 ?s2'
		alors: 'perpendiculaire ?cc1 ?cc2'
		com: 'Si des segments  sont perpendiculaires, les couples de leurs extémités le sont aussi'.
	arg1
		lisRegle: 'paralPerp-SegmentsPerpendiculairesSegmentCouples2'
		si: ' coupleSur ?d [ ?x1 ?x2 ]
perpendiculaire [  ?x3 ?x4 ] ?d
ordonneMot:et:rep1:rep2:  [ ?x3 ?x4 ]  [ ?x1 ?x2 ]  ?a ?b'
		alors: 'perpendiculaire ?a ?b'
		com: 'Si des segments  sont perpendiculaires, les couples de leurs extémités le sont aussi '.
	arg1
		lisRegle: 'paralPerp-SegmentsPerpendiculairesCouplesSegment'
		si: 'perpendiculaire ?c1 ?c2
segment ?s1 ?c1
segment ?s2 ?c2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
'
		alors: 'perpendiculaire ?ss1 ?ss2'
		com: 'Si des couples  sont perpendiculaires, les segments de leurs extémités le sont aussi'.
	arg1
		lisRegle: 'paralPerp-perpendiculaireCouple1'
		si: 'sorteDeDroite ?x1
sorteDeDroite ?x2
perpendiculaire ?d1 ?d2
coupleSur ?d2  [ ?x1 ?x2 ]'
		alors: 'perpendiculaire  ?d1 [ ?x1 ?x2 ]'
		com: 'Des couples sur des sortes de droites perpendiculaires sont perpendiculaires'.
	arg1
		lisRegle: 'paralPerp-parallèleCouple'
		si: 'coupleSur  ?x1 ?xx1
coupleSur  ?x2 ?xx2
parallèle ?x1 ?x2
relationCrée:et:nom:  ?xx1 ?xx2 parallèle
different:de: ?xx1 ?xx2
different:de: ?x1 ?x2'
		alors: 'relationCréée  ?xx1 ?xx2 parallèle'
		com: 'Des couples sur des droites parallèles sont parallèles.'.
	arg1
		lisRegle: 'paralPerp-CréeRelationparallèleSorteDeDroite'
		si: 'parallèle ?x ?y
sorteDeDroite ?x
sorteDeDroite ?y
relationCrée:et:nom: ?x ?y parallèle'
		alors: 'relationCréée ?x ?y parallèle'
		com: 'Création d'' une relation.'.
	arg1
		lisRegle: 'paralPerp-VecteursMêmeSens'
		si: 'vecteur ?ss ?s
vecteur:rep: ?ss ?v1
pointx:rep: ?v1 ?x
pointy:rep: ?v1 ?y
vecteur ?ss2 ?s2
vecteur:rep: ?ss2 ?v2
different:de: ?ss ?ss2
égal:à: ?v1 ?v2
relationCrée: parallèle ?ss ?ss2'
		alors: 'relatiionCréée  ?ss ?ss2 parallèle'
		com: 'Des vecteurs qui ont  même orientation et de même sens  sont parallèles.'.
	arg1
		lisRegle: 'paralPerp-constructionParallèle '
		si: 'segment ?sAB  [ ?a ?b ]
segment ?sAC [ ?a ?c ]
segment ?sBD [  ?b ?d ] ]
different:de:  [ ?a ?b ]  [ ?a ?d ]
relation [ ?a ?b ] [ ?c ?d ] isométrique
relationCrée:  [ ?a ?b ] [ ?c ?d ] parallèle'
		alors: 'relationCréée  [ ?a ?b ] [  ?c ?d ] parallèle'
		com: 'Si un segment a à chacune des ses extrémités un segment parallèle , isométrique et du même côté, le segment reliant l''autre extrémité de chacun de ces segments est parallèle  à ce segment'.
	arg1
		lisRegle: 'paralPerp-perpendiculaire'
		si: 'perpendiculaire ?p1 ?p2 ?p'
		alors: 'perpendiculaire ?p1 ?p2'.
	arg1
		lisRegle: 'paralPerp-perpendiculaireCouple'
		si: 'perpendiculaire  ?x1 ?x2
segment ?s1  ?x1
segment ?s2 ?x2'
		alors: 'perpendiculaire ?x1 ?x2'
		com: 'Si des segments sont perpendiculaires, leurs couples le sont aussi.'.
	arg1
		lisRegle: 'paralPerp-parallèleDef1'
		si: 'parallèle ?x1 ?x2
segment ?x1 [ ?a ?b ]'
		alors: 'parallèle ?x1'
		com: 'Une segment parallèle à un autre est de type parallèle.'.
	arg1
		lisRegle: 'paralPerp-parallèleDef2'
		si: 'parallèle ?x1 ?x2
sorteDeSegment ?x2 [ ?a ?b ]'
		alors: 'parallèle ?x2'
		com: 'Une segment parallèle à un autre est de type parallèle.'.
	arg1
		lisRegle: 'paralPerp-SegmentsParallèles'
		si: 'parallèle [ ?A ?B ] [ ?C  ?D ]
segment ?s2 [ ?C ?D ]
segment ?s1 [ ?A ?B ]
relationCrée:et:nom: ?s1 ?s2  parallèle'
		alors: 'relationCréée ?s1 ?s2 parallèle'
		com: 'Si les couples sur des segments sont parallèles, les couples le sont aussi.'.
	arg1
		lisRegle: 'paralPerp-parallèleParUnPoint'
		si: 'parallèle ?par ?d ?p
ordonneMot:et:rep1:rep2: ?d ?par ?dd ?ppar
relationCrée:et:nom: ?dd  ?ppar parallèle'
		alors: 'relationCréée ?dd  ?ppar parallèle'
		com: 'Construction d''une parallèle par un poin.t'.
	arg1
		lisRegle: 'paralPerp-PerpendiculaireParUnPointConstruction'
		si: 'cercle ?c [ centre:  ?p ]
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
		com: 'Construction d''une perpendiculaire par un point, en construisant la médiatrice passant par ce point.'.
	arg1
		lisRegle: 'paralPerp-Segmentparallèles'
		si: 'droite ?d1
droite ?d2
segmentSur ?d1 ?s1
segmentSur ?d2 ?s2
relation:et:nom:  ?d1 ?d2 parallèle
relationCrée:et:nom: ?s1 ?s2 parallèle
different:de:   ?d1 ?d2
different:de: ?s1 ?s2'
		alors: 'relationCréée  ?s1 ?s2 parallèle'
		com: 'Les segments sur deux droites parallèles, sont parallèles'.
	arg1
		lisRegle: 'paralPerp-Segmentparallèles2'
		si: 'sorteDeDroite ?d1
sorteDeDroite ?d2
segmentSur ?d1 ?s1
relation:et:nom:  ?d1 ?d2 parallèle
relationCrée:et:nom:  ?d2 ?s1 parallèle
different:de:  ?d1 ?d2
different:de: ?d2 ?s1'
		alors: 'relationCréée  ?d2 ?s1 parallèle'
		com: 'Un segment sur une droite parallèle à une autre droite, est aussi parallèle à cette droite.'.
	arg1
		lisRegle: 'paralPerp-SegmentSurParallèleEntreEux'
		si: 'sorteDeDroite ?d1
sorteDeDroite ?d2
parallèle ?d1 ?d2
different:de:   ?d1 ?d2
segmentSur ?d1 ?s1
segment ?s1 [  ?x1 ?x2 ] 
relationCrée:et:nom:  ?d2  [  ?x1 ?x2 ]  parallèle
different:de: ?d2 ?s1'
		alors: 'relationCréée  ?d2 [  ?x1 ?x2 ] parallèle'
		com: 'Le couple d''un segment sur une droite parallèle à une autre droite, est aussi parallèle à cette droite.'.
	arg1
		lisRegle: 'paralPerp-SegmentsPerpendiculaires'
		si: 'perpendiculaire ?p1 ?p2
segmentSur ?p1 ?s1
segmentSur ?p2 ?s2'
		alors: 'perpendiculaire ?s1 ?s2'
		com: 'Des segments sur des sortes de droites perpendiculaires sont perpendiculaires'.
	arg1
		lisRegle: 'paralPerp-SegmentsPerpendiculairesObjetCouples'
		si: 'perpendiculaire [ ?x1 ?x2 ] [ ?y1 ?Y2 ]
coupleSur   ?obj1 [ ?x1 ?x2 ] 
coupleSur   ?obj2 [ ?y1 ?Y2 ]
ordonneMot:et:rep1:rep2: ?obj1 ?obj2 ?aa ?bb'
		alors: 'perpendiculaire ?aa ?bb'
		com: 'Si des segments  sont perpendiculaires, les couples de leurs extémités sont perpendiculaires'.
	arg1
		lisRegle: 'paralPerp-SegmentsparallèlesETPerpendiculaires'
		si: 'perpendiculaire ?p1 ?p2
parallèle ?p1 ?p3
different:de:   ?p1 ?p2
different:de: ?p1 ?p3'
		alors: 'perpendiculaire ?p3 ?p2'
		com: 'Si une droite d1 est parallèle à une droite d2 elle même perpendiclaire à une droite d3, cette droite d1 est aussi perpendiculaire à d3'.
	arg1
		lisRegle: 'paralPerp-médiatrice'
		si: 'perpendiculaire  ?x1 ?x2 ?x3
segment ?x2 [ ?a ?b ] ]
milieu [ ?a ?b ] ?x3'
		alors: 'médiatrice ?x1 [ ?a ?b ]'
		com: 'Une perpendiculaire à un segment  et passant par le milieu de ce segment  est une médiatrice de ces points.'.
	arg1
		lisRegle: 'paralPerp-SegmentparallèlesRéc'
		si: 'droite ?d1
droite ?d2
segmentSur ?d1 ?s1
segmentSur ?d2 ?s2
segment ?s1 ?ss1
segment ?s2 ?ss2
parallèle ?s1 ?s2
relationCrée:et:nom:  ?s1 ?s2 parallèle 
different:de: ?s1 ?s2'
		alors: 'relationCréée ?d1 ?d2 parallèle'
		com: 'Si des segments sont sur des droites et leurs couples sont parallèles, les droites sont aussi parallèles.'.
	arg1
		lisRegle: 'paralPerp-SegmentsPerpendiculaires'
		si: 'perpendiculaire ?p1 ?p2
different:de:   ?p1 ?p2
segmentSur ?p1 ?s1
segmentSur ?p2 ?s2
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2'
		alors: 'perpendiculaire ?ss1 ?ss2'
		com: 'Des segments sur des sortes de droites perpendiculaires sont perpendiculaires'.
	arg1
		lisRegle: 'paralPerp-SegmentsparallèlesETPerpendiculaires'
		si: 'perpendiculaire ?p1 ?p2
parallèle ?p1 ?p3
different:de:   ?p1 ?p2
different:de: ?p1 ?p3'
		alors: 'perpendiculaire  ?p3 ?p2'
		com: 'Si une droite d1 est parallèle à une droite d2 elle même perpendiclaire à une droite d3, cette droite d1 est aussi perpendiculaire à d3'.
	arg1
		lisRegle: 'paralPerp-Milieu'
		si: 'adjacent ?s1 ?s2 ?a ?b ?c
milieu ?s1 ?i
milieu ?s2 ?j
segment ?sij [ ?i ?j ]
segment sAC [ ?a ?c ]
relationCrée:et:nom: [ ?a ?c j ]  [ ?i ? j parallèle'
		alors: 'relationCréée  [ ?a ?c j ]  [ ?i ? j parallèle'
		com: 'Réciproque de Thales (rapport 1/2)'.
	arg1
		lisRegle: 'paralPerp-PerpMêmeDroite1'
		si: 'perpendiculaire ?d1 ?perp1
perpendiculaire ?d1 ?perp2
sorteDeDroite  ?perp1
sorteDeDroite ?perp2
ordonneMot:et:rep1:rep2:  ?perp1 ?perp2  ?pperp1 ?pperp2
different:de: ?perp1 ?perp2
relationCrée:et:nom: ?pperp1 ?pperp2 parallèle'
		alors: 'relationCréée ?pperp1 ?pperp2 parallèle'
		com: 'Deux droites perpendiculaires à une même sorte de droite sont parallèles.'.
	arg1
		lisRegle: 'paralPerp-parallèleSym'
		si: 'symetrie centrale ?x ?p ?xx
segment ?s1 [ ?x ?y ]
symetrie centrale ?yy ?pp ?yy
segment ?s1 ?[ xx ?yy ]
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?ss1 ?ss2
relationCrée:et:nom:'
		alors: 'relationCréée ?ss1 ?ss2 parallèle'.
	arg1
		lisRegle: 'paralPerp-Thales0'
		si: 'homothétie ?ch ?i ?x image de ?m ?mm'
		alors: 'homothétie ?ch ?i ?x image de ?x ?i'.
	arg1
		lisRegle: 'paralPerp-homothétieMilieu1'
		si: 'milieu [ ?a ?b ] ?mil'
		alors: 'homothétie  ?a  ?mil ?b  0.5'
		com: 'Le milieu d''un segment est l''image d''une extémité par une homothétie qui a pour centre l''autre extrémité'.
	arg1
		lisRegle: 'paralPerp-homothétieMilieu2'
		si: 'milieu [ ?a ?b ] ?mil'
		alors: 'homothétie  ?b  ?mil ?a  0.5'
		com: 'Le milieu d''un segment est l''image d''une extémité par une homothétie qui a pour centre l''autre extrémité'.
	arg1
		lisRegle: 'paralPerp-Translation'
		si: 'translation segment ?s [ ?so ?v ]
relationCrée:et:nom: ?ss ?sso parallèle'
		alors: 'relationCréée ?ss ?sso parallèle'.! !

!ExpertRegle class methodsFor: 'rules'!
polygones: arg1
	arg1
		lisRegle: 'polygones-créeNomPolygone'
		si: 'lignePolygonaleFermée0  ?x1
taille:rep: ?x1 ?taille
égal:à: 4 ?taille
premiers:rep: ?x1 ?prems
tousDifferents: ?prems
créeNom:rep: ?prems  ?nomPoly
nomPolygone:rep: ?taille ?nom'
		alors: 'lignePolygonaleFermée ?x1  [ ?nomPoly  ?nom ]'
		com: 'Un polygone de 4 côtés est unTetragone'.
	arg1
		lisRegle: 'polygones--objetPolygoneNom'
		si: 'lignePolygonaleFermée ?l2 [ ?nomPoly  ?nom  ] '
		alors: 'polygone ?nomPoly  [  ?nom ]'
		com: 'Nom du polygone selon le nombre de sommets ou de côtès'.
	arg1
		lisRegle: 'polygones--objetPolygoneDef'
		si: 'lignePolygonaleFermée ?l2 [ ?nomPoly  ?nom ] ?l'
		alors: 'polygone ?nomPoly'
		com: 'Définition d''un objet.'.
	arg1
		lisRegle: 'polygones--objetPolygonePointSur'
		si: 'point ?x
polygone ?nm  ?p [ sommets: ?som ]
contient:el: ?som ?x'
		alors: 'pointSur ?p ?x'
		com: 'Un sommet d''un polygone est un point sur ce polygone.'.
	arg1
		lisRegle: 'polygones-objetPolygoneSommets'
		si: 'polygone ?nomPoly [ sommets: ?som ] ?l'
		alors: 'polygone ?nomPoly  [ sommets: ?som ]'
		com: 'Liste des sommets du polygone.'.
	arg1
		lisRegle: 'polygones-objetPolygoneCôtés'
		si: 'polygone ?nomPoly [ sommets: ?som ] ?l'
		alors: 'polygone ?nomPoly  [ côtés:  ?l ]'
		com: 'Liste des sommets du polygone.'.
	arg1
		lisRegle: 'polygones--PérimètreInit'
		si: 'polygone ?nomPoly  [ côtés: ?cot ]'
		alors: 'mesuresDe ?cot 0'
		com: 'Initialse le calcul du périmètre'.
	arg1
		lisRegle: 'polygones--Périmètre'
		si: 'polygone ?nomPoly  [ côtés: ?cot ]
mesuresDe  ?cot ?x ?m
arrondis:rep:  ?m ?per'
		alors: 'polygone ?nomPoly [ périmètre: ?per ]'
		com: 'Périmètre d''un polygone'.
	arg1
		lisRegle: 'polygones--Aire'
		si: 'polygone ?nomPoly  [ côtés: ?cot ]

mesure  [ aire0  trapèze ?t ] ?m ] 
arrondis:rep: ?m ?mArr'
		alors: 'polygone ?nomPoly [ aire:  ?mArr ]'
		com: 'Aire d''un polygone'.
	arg1
		lisRegle: 'polygones--PérimètreMesure'
		si: 'polygone ?nomPoly [ périmètre: ?m ]'
		alors: 'mesure [ périmètre ?nomPoly ] ?m déduite'
		com: 'Mesure du Périmètre d''un polygone'.
	arg1
		lisRegle: 'polygones-lignePolygonaleCrée'
		si: 'adjacent ?s1 ?s2 ?x1 ?s ?x2'
		alors: 'lignePolygonale [  [ ?x1 ?s ] [ ?s ?x2 ] ]'.
	arg1
		lisRegle: 'polygones-lignePolygonaleSuite1'
		si: 'lignePolygonale ?l
dernier:rep: ?l ?der
segment ?s ?der
adjacent ?s ?s2 ?a ?b ?c
ajouteDernierUnique:el:rep: ?l [ ?b ?c ]  ?l2'
		alors: 'lignePolygonale ?l2'.
	arg1
		lisRegle: 'polygones-lignePolygonaleRetrait1'
		si: 'lignePolygonale ?l1
lignePolygonale ?l2
taille:rep: ?l1 ?t1
taille:rep: ?l2 ?t2
inférieur:à: ?t1 ?t2
retireFait: lignePolygonale ?l1'
		alors: 'lignePolygonale0 ?l1'.
	arg1
		lisRegle: 'polygones-lignePolygonaleRetrait2'
		si: 'lignePolygonale ?l2
lignePolygonale ?l1
taille:rep: ?l1 ?t1
taille:rep: ?l2 ?t2
inférieur:à: ?t1 ?t2
'
		alors: 'lignePolygonale ?l2'.
	arg1
		lisRegle: 'polygones-triangleinit'
		si: 'lignePolygonaleFermée ?l  [  Trigone ?nom ]
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
	arg1
		lisRegle: 'polygones-aire-triangle'
		si: 'triangle   ?nom [ triangles: [ ?triangle2 ]   ]
dernier:rep: ?triangle2 ?aire0
supérieur:à: ?aire0 0
abs:rep: ?aire0 ?aire'
		alors: 'triangle   ?nom [ aire_triangles: ?aire  ]'.
	arg1
		lisRegle: 'polygones-QuadrilatèreTrianglesSuite'
		si: 'quadrilatère0  ?nom [ triangles: ?ts  ?l2 ]
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
	arg1
		lisRegle: 'polygones-Quadrilatère-DefTetragone'
		si: 'polygone   ?nom [ Tetragone  ]
polygone   ?nom ?x'
		alors: 'quadrilatère ?nom ?x'
		com: 'Un tetragone est un quadrilatère; propriété du tetragone  attribuée au quadrilatère.'.
	arg1
		lisRegle: 'polygones-TrigoneHauteurs'
		si: 'triangle ?t [ sommets: ?som ]
triangle ?t [ côtés: ?cot ]
perpendiculaire ?x1 ?x2 ?x
contient:el: ?som ?x
segment ?s ?ss
nonContient:el:  ?cot ?ss
'
		alors: 'polygone ?t [ hauteur: ?ss  ]'
		com: 'La hauteur d''un Trigone est le couple formé d''un sommet et 
de l''intersection de la perpendiculaire au côté opposé à ce sommet et de ce côté opposé.'.
	arg1
		lisRegle: 'polygones-Triangle-Def'
		si: 'polygone   ?nom [ Trigone ] 
polygone ?nom [ sommets: [ ?a ?b ?c ] ]
aireTriangle:avec:avec:rep: ?a ?b ?c ?aire
abs:rep: ?aire ?aireAbs
supérieur:à: ?aireAbs  0.0
polygone ?nom ?x'
		alors: 'triangle ?nom ?x'
		com: 'Transfert des propriétés du trigone au triangle si le trigone n''est pas plat'.
	arg1
		lisRegle: 'polygones-PolygoneInit'
		si: 'lignePolygonaleFermée ?l  [  ?nomPoly ?nom ]
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
		alors: 'polygone0 ?nomPoly   ?nom [ triangles: [  [ ?triangle2  ]     ?l3 ]    ]'.
	arg1
		lisRegle: 'polygones-PolygoneTrianglesSuite1'
		si: 'lignePolygonaleFermée ?l [  ?nomPolygone  ?nom ]
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
	arg1
		lisRegle: 'polygones-Triangles'
		si: 'lignePolygonaleFermée ?l [ triangle: ?t ]
triangle ?t [  sommets: ?som  ]
premier:rep: ?som ?p1
saurPremier:rep: ?som ?som1
permier:rep: ?som1 ?p2
saurPremier:rep: ?som1 ?som2
permier:rep: ?som2 ?p3
aireTriangle:avec:avec:rep:  ?p1 ?p2 ?p3 ?aire
supérieur:à: ?aire 0'
		alors: ' triangle  ?t  [ triangles: ?som ]'.
	arg1
		lisRegle: 'polygones-PolygoneTrianglesSuite2'
		si: 'polygone0  ?nomPolygone  ?nom [ triangles: [ ?triangles  ?l2  ]  ]
dernier:rep: ?l2 ?der
taille:rep: ?der ?t
égal:à: ?t 0'
		alors: 'polygone1  ?nomPolygone  ?nom [ triangles: ?triangles   ]'.
	arg1
		lisRegle: 'polygones-aire'
		si: 'polygone1  ?x1 ?x2 [  triangles: ?x3 ]
derniers:rep: ?x3  ?res
somme:rep:  ?res ?res2'
		alors: 'polygone   ?x1 [  aire_triangles: ?res2 ]'
		com: 'Aire d''un polygone à partir du polygone découpé en triangles. 
Cette aire est positive si le polygone est orienté à gauche, négative si le polygone est orienté à droite.'.
	arg1
		lisRegle: 'polygones-aireAffiche'
		si: 'polygone   ?x1 [  aire_triangles: ?res2 ]
affiche mesure déduite'
		alors: 'afficher [ aire ?x1 ] ?res2 déduite'
		com: ''.
	arg1
		lisRegle: 'polygones-lignePolygonaleFermée'
		si: 'lignePolygonale0 ?l
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
	arg1
		lisRegle: 'polygones-lignePolygonaleFermée2'
		si: 'lignePolygonale ?l
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
	arg1
		lisRegle: 'polygones-lignePolygonaleFermée0'
		si: 'lignePolygonale0 ?l
premier:rep: ?l ?pr
premier:rep: ?pr ?a
dernier:rep: ?l ?der
dernier:rep: ?der ?b
égaux:et: ?a ?b
premiers:rep: ?l ?prems
minimum:rep: ?prems ?min
égaux:et: ?a ?min'
		alors: 'lignePolygonaleFermée0 ?l'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeSommets'
		si: 'lignePolygonaleFermée  ?l2 [ ?nomPoly ?nom ]
premiers:rep: ?l2 ?som
tousDifferents: ?som'
		alors: 'polygone ?nomPoly  [ sommets:    ?som  ]'
		com: 'Liste des sommets d''une ligne polygonale fermée fomant un polygone et nom du polygone selon le nombre de côtés.'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFermée3'
		si: 'lignePolygonaleFermée0 ?l
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
		com: 'Une ligne qui a un segment qui joint son dernier point à son premier est une ligne polygonaleFermée'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFermeture'
		si: 'lignePolygonaleFermée   ?lor
segment ?s ?x
sens ?s inverse
contient:el: ?lor    ?x 
'
		alors: 'lignePolygonaleFermée ?lor fermeture: ?s'
		com: 'La fermeture  d''une ilgne polygonale est le segment qui joint le début  à la fin  de cette ligne pour la fermer, il est en sens inverse'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeConvexité'
		si: 'polygone ?nomPoly  [ sommets:    ?l2  ]
taille:rep: ?l2 ?t
premier:rep: ?l2 ?p2
saufPremier:rep:  ?l2  ?l1
premier:rep: ?l1 ?p3
dernier:rep: ?l2 ?p1
aireTriangle:avec:avec:rep: ?p1 ?p2 ?p3 ?a1
ajouteDernier:el:rep:  ?l2 ?p2 ?suite'
		alors: 'convexité0  ?nomPoly   [   [ ?p1  ?p2 ?p3 ?a1  ]   ]  ?suite'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeConvexitéTriangle'
		si: 'polygone ?nomPoly  [ sommets:    ?l2  ]
taille:rep: ?l2 ?t
égal:à: ?t 3
premier:rep: ?l2 ?p2
saufPremier:rep:  ?l2  ?l1
premier:rep: ?l1 ?p3
dernier:rep: ?l2 ?p1
aireTriangle:avec:avec:rep: ?p1 ?p2 ?p3 ?a1'
		alors: 'convexité0  ?nomPoly   [   [ ?p1  ?p2 ?p3 ?a1  ]   ]  [  ]'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeConvexitéSuite'
		si: 'convexité0     ?nomPoly ?conv     ?l2
dernier:rep: ?l2 ?p3
saufDernier:rep:  ?l2 ?l3
dernier:rep: ?l3 ?p2
saufDernier:rep:  ?l3 ?l4
dernier:rep: ?l4 ?p1
aireTriangle:avec:avec:rep: ?p1 ?p2 ?p3 ?a1
saufDernier:rep:  ?l4 ?suite
ajoutePremier:el:rep: ?conv [ ?p1 ?p2 ?p3 ?a1  ] ?conv2'
		alors: 'convexité0   ?nomPoly  ?conv2  ?l3 '.
	arg1
		lisRegle: 'polygones-OrientationGauche'
		si: 'polygone  ?nom [  sommets: ?som ]
convexité0     ?nom ?conv    [ [  ] ]
derniers:rep: ?conv ?ders
tousPositifs: ?ders'
		alors: 'polygone  ?nom [ orientation: gauche ]'
		com: 'Polygone orienté à gauche, sens inverse des aiguilles d''une montre'.
	arg1
		lisRegle: 'polygones-OrientationDroite'
		si: 'polygone   ?nom [  sommets: ?som ]
convexité0     ?nom ?conv     [ [ ] 
derniers:rep: ?conv ?ders
tousNégatifs: ?ders'
		alors: 'polygone ?nom [ orientation: droite ]'
		com: 'Polygone orienté à droite,sens  des aiguilles d''une montre'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeConvexe'
		si: 'polygone  ?nom [  sommets: ?som ]
convexité0     ?nom ?conv  ?l2 
taille:rep: ?l2 ?t
inférieur:à:  ?t 3
derniers:rep: ?conv ?der
tousPositifs: ?der'
		alors: 'polygone   ?nom [  convexité:  [  convexe  ] ]'
		com: 'Si l''aire de tous les  triangle formé de trois sommets consécutifs est de même signe, le polygone est convexe.'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeConvexeNeg'
		si: 'polygone  ?nom [  sommets: ?som ]
convexité0     ?nom ?conv  ?l2 
taille:rep: ?l2 ?t
inférieur:à:  ?t 3
derniers:rep: ?conv ?der
tousNégatifs: ?der'
		alors: 'polygone   ?nom [  convexité:  [  convexe  ] ]'
		com: 'Si l''aire de tous les  triangle formé de trois sommets consécutifs est de même signe, le polygone est convexe.'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeNonConvexe'
		si: 'polygone ?nom  [  sommets: ?som ]
tousDifferents: ?som
convexité0     ?nom ?conv  ?l2 
taille:rep: ?l2 ?t
inférieur:à:  ?t 3
derniers:rep: ?conv ?der
~ tousPositifs: ?der
~ tousNégatifs: ?der'
		alors: 'polygone  ?nom  [ convexité: [ non convexe ] ]'
		com: 'Si ni l''aire de tous les  triangle formé de trois sommets consécutifs est négative,  ni l''aire de tous les  triangle formé de trois sommets consécutifs est posittive , le polygone est non convexe.'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeSommets2'
		si: 'lignePolygonaleFermée0  ?x1
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
	arg1
		lisRegle: 'polygones-triangleDef'
		si: 'polygone ?poly [ Trigone ]
polygone  ?nom [  côtés: ?c ]
taille:rep: ?c ?t
égal:à: 3 ?t'
		alors: 'triangle ?nom [ côtés: ?c ]'
		com: 'Un polygone de trois côtés est un triangle.'.
	arg1
		lisRegle: 'polygones-trianglePlatDef'
		si: 'polygone ?poly [ Trigone ]
polygone  ?nom [  sommets: [ ?x1 ?x2 ?x3 ] ]
alignement ?x
contient:el: ?x ?x1
contient:el: ?x ?x2
contient:el: ?x ?x3
taille:rep:  [ ?x1 ?x2 ?x3  ] ?t
égal:à: 3 ?t'
		alors: 'triangle ?nom [ plat ]'
		com: 'Si les sommets d''un triangle sont alignés, le triangle est plat.'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeNoms'
		si: 'lignePolygonaleFermée0 ?l2
polygone ?nom [ sommets: ?som ]
taille:rep: ?som ?t
nomPolygone:rep: ?t ?nomPoly'
		alors: 'polygone ?nom [  ?nomPoly   ]'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeTriangle'
		si: 'lignePolygonaleFermée ?l2 [  Trigone ?nom ]
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
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeTriangle'
		si: 'lignePolygonaleFermée ?l2 [ Trigone ?nomPoly ]'
		alors: 'lignePolygonaleFermée ?l2 [ triangle ?nomPoly ]'.
	arg1
		lisRegle: 'polygones-lignePolygonaleFerméeQuadrilatère'
		si: 'lignePolygonaleFermée ?l2 [ Tetragone ?nomPoly ]'
		alors: 'lignePolygonaleFermée ?l2 [ quadrilatère ?nomPoly ]'.! !

!ExpertRegle class methodsFor: 'rules'!
relations: arg1
	arg1
		lisRegle: 'relations-RelationExplicite'
		si: 'relation ?rel explicite
relationCréée  ?obj1 ?obj2 ?rel
ordonneMot:et:rep1:rep2:  ?obj1 ?obj2  ?oobj1 ?oobj2'
		alors: '?rel ?oobj1 ?oobj2'
		com: 'Affirmaion explicite d''une relation.'.
	arg1
		lisRegle: 'relations-def'
		si: 'relation ?rel 
relation:rep: ?rel ?rep'
		alors: 'relation ?rel ?rep'.
	arg1
		lisRegle: 'relations-isométrieCréation'
		si: 'isométrique ?a ?b
relationCrée:et:nom: ?a ?b isométrique'
		alors: 'relation isométrique  ?a ?b créée'.
	arg1
		lisRegle: 'relations-angleEquivalentCréation'
		si: 'angle ?x [ équivalent: ?y ]
relationCrée:et:nom: ?x ?y  angleEquivalent'
		alors: 'relation angleEquivalent  ?x ?y créée'.! !

!ExpertRegle class methodsFor: 'rules'!
representant: arg1
	arg1
		lisRegle: 'triangle'
		si: 'segment ?s1 ?x ?y
segment ?s2 ?y ?z
segment ?s3 ?z ?x
ordonneMot:et:rep1:rep2: ?y ?z ?o ?p
ordonneMot:et:rep1:rep2: ?x ?o ?m ?n
ordonneMot:et:rep1:rep2: ?n ?p ?q ?r
mot:et:rep: ?m ?q ?m1
mot:et:rep: ?m1 ?r ?m2
'
		alors: 'triangle ?m2  [ ?s1 ?s2 ?s3 ]'.
	arg1
		lisRegle: 'triangleIsocele'
		si: 'triangle ?t [ ?s1 ?s2 ?s3 ]
egal ?s1 ?s2
segment ?s1 ?a ?b'
		alors: 'triangle ?t isocele de sommet  ?b'.
	arg1
		lisRegle: 'triangleEquilateral'
		si: 'triangle ?t isocele de sommet  ?s1
triangle ?t isocele de sommet  ?s2
different:de:  ?s1 ?s2
'
		alors: 'triangle ?t equilateral '.! !

!ExpertRegle class methodsFor: 'rules'!
symetrieAxiale: arg1
	arg1
		lisRegle: 'symetrieAxiale-reflexionPoint'
		si: 'reflexion ?p ?ip ?axe 
point ?p
segment ?s  ?p ?ip'
		alors: 'perpendiculaire ?s  ?axe'.
	arg1
		lisRegle: 'symetrieAxiale-reflexionPointCouple'
		si: 'reflexion ?p ?ip ?axe 
~ pointSur ?axe  ?p'
		alors: 'perpendiculaire [ ?p ?ip ] ?axe'
		com: 'Un point et son image par une réflexion (symétrie axiale) forment un couple perpendiculaire à l''axe de réflexion.'.
	arg1
		lisRegle: 'symetrieAxiale-reflexionSegment'
		si: 'reflexion ?ip ?p ?axe 
pointSur ?axe ?p2 
point ?p
point ?p2
ordonneMot:et:rep1:rep2:  ?p ?p2 ?pp ?pp2
ordonneMot:et:rep1:rep2:  ?ip ?p2 ?ipp ?ppp2
'
		alors: 'isométrique [ ?pp ?pp2 ] [ ?ipp ?ppp2 ] '
		com: 'Les segments reliant un point sur l''axe et respectivement un point et son image par une rélexion (symétrie axiale) sont isométriques'.
	arg1
		lisRegle: 'symetrieAxiale-ReflexionImages1'
		si: 'reflexion ?p ?ip ?axe 
translation point ?p ?ipt1 ?v
translation point ?ip ?iipt1 ?v'
		alors: 'reflexion ?ipt1 ?iipt1 ?axe'
		com: 'si un point a une  image par translation et une image par réflexion
alors son image par translation a aussi une image par la même réflexion.'.
	arg1
		lisRegle: 'symetrieAxiale-ReflexionImages2'
		si: 'reflexion ?ip ?p ?axe 
translation point ?ipt1 ?ip ?v
translation point ?iipt1 ?p ?v'
		alors: 'reflexion ?ipt1 ?iipt1 ?axe'
		com: 'si un point a une  image par translation et une image par réflexion
alors son image par translation a aussi une image par la même réflexion.'.
	arg1
		lisRegle: 'symetrieAxiale-ReflexionI-parallèles'
		si: 'reflexion ?xi ?x ?axe
reflexion ?yi ?y ?axe
different:de: ?xi ?yi
different:de: ?x ?y'
		alors: 'parallèle  [ ?xi ?x ]  [ ?yi ?y ]'
		com: 'les segment reliant un point et son image par symétrie axiale sont parallèles'.! !

!ExpertRegle class methodsFor: 'rules'!
symetrieCentrale: arg1
	arg1
		lisRegle: 'symetrieCentrale-Arc'
		si: 'symetrieCentrale ?Arc2 ?Arc1 ?csym
arcCentré ?Arc1 ?centre ?p1 ?p2
symetrieCentrale ?centre2 ?centre  ?csym
symetrieCentrale ?pp1 ?p1  ?csym
symetrieCentrale ?pp2 ?p2  ?csym'
		alors: 'arcCentré ?Arc2 ?centre2  ?pp1 ?pp2'.
	arg1
		lisRegle: 'symetrieCentrale-isométrie'
		si: 'symetrieCentrale  ?x1 ?x2 ?x3
ordonneMot:et:rep1:rep2: ?x1 ?x3 ?xx1 ?xx3
ordonneMot:et:rep1:rep2: ?x2 ?x3 ?xx2 ?xx33'
		alors: 'isométrique [ ?xx1 ?xx3 ] [ ?xx2 ?xx33 ]'
		com: 'Le centre de symétrie partage en 2 segments isométriques le segment relliant un point à son image.'.
	arg1
		lisRegle: 'symetrieCentrale-pointSurDroite1'
		si: 'symetrieCentrale  ?x1 ?x2 ?x3
sorteDeDroite ?d
pointSur ?d ?x2
pointSur ?d ?x3'
		alors: 'pointSur ?d ?x1'
		com: 'Si le centre de symétrie et un point sont sur une droite, l''image de ce point est aussi sur cette droite.'.
	arg1
		lisRegle: 'symetrieCentrale-pointSurDroite2'
		si: 'symetrieCentrale  ?x1 ?x2 ?x3
pointSur ?d ?x1
pointSur ?d ?x3'
		alors: 'pointSur ?d ?x2'
		com: 'Si le centre de symétrie et un l''image d''un point sont sur une droite, ce point est aussi sur cette droite.'.
	arg1
		lisRegle: 'symetrieCentrale-segmentsParallele'
		si: 'symetrieCentrale ?x ?y ?centre
segment ?y [ ?a ?b ]'
		alors: 'parallele ?x ?y'.
	arg1
		lisRegle: 'symetrieCentrale-SymetrieCentraleSegment'
		si: 'symetrieCentrale ?cible ?objet ?centre
segment ?objet [ ?x ?y ]
symetrieCentrale ?x1 ?x ?centre
symetrieCentrale ?y1 ?y ?centre'
		alors: 'segment ?cible [ ?x1 ?y1 ]'.
	arg1
		lisRegle: 'symetrieCentrale-milieu'
		si: 'symetrieCentrale ?x1 ?x ?centre
ordonneMot:et:rep1:rep2:  ?x1 ?x ?xx1 ?xx'
		alors: 'milieu  [ ?xx1 ?xx ] ?centre'
		com: 'le centre de symétrie est le milieu entre un point et son image.'.
	arg1
		lisRegle: 'symetrieCentrale-PointSurCercle'
		si: 'pointSur ?c ?p
symetrieCentrale ?x1 ?p ?centre
cercle ?c  ?centre ?x
'
		alors: 'pointSur ?c ?x1'
		com: 'si un point est sur un cercle l''image de ce point par symètrie centrale est sur le cercle.'.
	arg1
		lisRegle: 'symetrieCentrale-milieu2Pts'
		si: 'point ?a ?x
point ?b ?x2
point ?c ?x3
symetrieCentrale ?x1 ?x2 ?centre1
symetrieCentrale ?x2 ?3 ?centre2'
		alors: 'parallele [ ?x1  ?x2 ] [  ?centre1 ?centre2 ]'
		com: ''.! !

!ExpertRegle class methodsFor: 'rules'!
translations: arg1
	arg1
		lisRegle: 'translations-PointSur'
		si: 'translation ?t ?ip1 ?p1 ?v
vecteur ?v
pointSur ?dr ?p1
sorteDeDroite ?dr
direction:rep: ?v ?res
direction:rep: ?dr ?res'
		alors: 'pointSur ?dr ?ip1'
		com: 'le segments reliant un point à son image par un vecteur est isométrique au vecteur de la translation'.
	arg1
		lisRegle: 'translations-PointMemeVecteurEgalité'
		si: 'translation point ?ip1 ?p1 ?v
segment ?s1 [ ?p1 ?ip1 ]'
		alors: 'isométrique ?s1 ?v'
		com: 'le segments reliant un point à son image par un vecteur est isométrique au vecteur de la translation'.
	arg1
		lisRegle: 'translations--translationCroisée'
		si: 'translation point ?ip ?p ?v
vecteur ?v ?x1 ?p2
vecteur ?v2 ?x1 ?p'
		alors: 'translation point ?ip ?p2 ?v2'
		com: ' Si deux vecteurs ont une origine commune la translation du point p à l''extrémité d''un des vecteurs  par l''autre vecteur a la même image que celle de la transalation du point à l''extrémité de l''autre vecteur par ce vecteur; 
le vecteur reliant ce point et de même origine que les deux vecteurs est le vecteur somme des deux vecteurs.'.
	arg1
		lisRegle: 'translations--TranslationPerpendiculaire'
		si: 'vecteurSur ?d ?v
perpendiculaire ?d ?perp'
		alors: 'perpendiculaire ?v ?perp'
		com: 'Si un vecteur est sur une droite perpendiculaire à un objet
alors il est perpediculaire à cet objet'.
	arg1
		lisRegle: 'translations--PointparallèleASonVecteur'
		si: 'translation point ?ip1 ?p1 ?v
vecteur ?v [ ?b ?a ]
relationCrée:et:nom: [ ?p1 ?ip1 ] [  ?b ?a ] parallèle'
		alors: 'relationCréée [ ?p1 ?ip1 ] [  ?b ?a ] parallèle'
		com: 'le segment reliant un point à son image par une translation est  parallèle au  vecteur de la translation.'.
	arg1
		lisRegle: 'translations--segmentsparallèles'
		si: 'translation point ?ip1 ?p1 ?v
translation point ?ip2 ?p2 ?v
segment ?s1 [ ?p1 ?p2 ]
segment ?s2 [ ?ip2 ?ip1 ]
relationCrée:et:nom: ?s1 ?s2 parallèle'
		alors: 'relationCréée  ?s1 ?s2 parallèle'
		com: 'Un segment et son image par une translation sont  parallèles.'.
	arg1
		lisRegle: 'translations--PointparallèleASonVecteurEgalité'
		si: 'translation point ?ip1 ?p1 ?v
segment ?s1 [ ?p1 ?ip1 ]'
		alors: 'egal ?s1 ?v'
		com: 'le segment reliant un point à son image par une translation est  égal au  vecteur de la translation.'.
	arg1
		lisRegle: 'translations-SorteDeDroiteParallèle'
		si: 'sorteDeDroite ?so
translation ?s ?so ?v'
		alors: 'parallèle ?s ?so'.
	arg1
		lisRegle: 'translations-adition Vecteurs1'
		si: 'translation point ?p1 ?p1o ?v1
translation point ?p2 ?p1o ?v2
translation point ?p3  ?p2 ?v1'
		alors: 'translation point ?p3 ?p1 ?v2'.
	arg1
		lisRegle: 'translations-adition Vecteurs2'
		si: 'translation point ?p1 ?p1o ?v1
translation point ?p2 ?p1o ?v2
translation point ?p3  ?p2 ?v2'
		alors: 'translation point ?p3 ?p1 ?v1'.! !

!ExpertRegle class methodsFor: 'rules'!
varignon2: arg1
	arg1
		lisRegle: 'varign0n2Quaditriangle1'
		si: 'quadrilatere ?A ?B ?C ?D
segment ?s [ ?C ?A ]'
		alors: 'triangle ?A ?B ?C'.
	arg1
		lisRegle: 'varign0n2Quaditriangle2'
		si: 'quadrilatere ?A ?B ?C ?D
segment ?s [ ?C ?A ]'
		alors: 'triangle ?A ?D ?C'.
	arg1
		lisRegle: 'varignon2Thales1'
		si: 'triangle ?A ?B ?C
segment ?s1 [ ?A ?B ]
segment ?s2 [ ?B ?C ]
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s4 [ ?C ?A ]
segment ?s3 [ ?j ?i ]'
		alors: 'parallele ?s3 ?s4'.
	arg1
		lisRegle: 'varignon2Thales2'
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
	temp2 _ arg1 creeRegle: 'VarignonAdjacent1'.
	temp2 antecedents: 'segment ?s1                     
segment ?s2  ?x ?c
different:de: ?s1 ?s2
'.
	temp2 concl: 'adjacent ?s1 ?s2 ?a ?x ?c'.
	temp2 _ arg1 creeRegle: 'VarignonAdjacent2'.
	temp2 antecedents: 'segment ?s1 [ ?x ?a ]
segment ?s2  [ ?x ?c }
different:de: ?s1 ?s2'.
	temp2 concl: 'adjacent ?s1 ?s2 ?a ?x ?c'.
	temp2 _ arg1 creeRegle: 'VarignonAdjacent3'.
	temp2 antecedents: 'segment [ ?s1 ?a ?x ]
segment ?s2  [ ?c ?x ]
different:de: ?s1 ?s2'.
	temp2 concl: 'adjacent ?s1 ?s2 ?a ?x ?c'.
	temp2 _ arg1 creeRegle: 'VarignonAdjacent4'.
	temp2 antecedents: 'segment ?s1 [ ?x ?a ]
segment ?s2  [ ?x ?c ]
different:de: ?s1 ?s2'.
	temp2 concl: 'adjacent ?s1 ?s2 ?a ?x ?c'.
	temp2 _ arg1 creeRegle: 'VarignonMilieu1'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?a ?b ?c
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s3 [  ?i ?j ]
segment ?s4 [ ?c ?a'.
	temp2 concl: 'parallele ?s3 ?s4'.
	temp2 _ arg1 creeRegle: 'VarignonMilieu2'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?c ?b ?a
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s3 ?i ?j
segment ?s4 ?c ?a
'.
	temp2 concl: 'parallele ?s3 ?s4'.
	temp2 _ arg1 creeRegle: 'VarignonMilieu3'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?c ?b ?a
milieu ?s1 ?i
milieu ?s2 ?j
segment ?s3 ?i ?j
segment ?s4 ?a ?c
'.
	temp2 concl: 'parallele ?s3 ?s4'.
	temp2 _ arg1 creeRegle: 'VarignonMilieu4'.
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
	temp2 _ arg1 creeRegle: 'VarignonThales3'.
	temp2 antecedents: 'parallele ?par ?d2 ?i
droite ?d2 ?x ?p
pointSur ?d ?i
droite ?d ?ch ?x
droite ?d3 ?ch ?p
intersection  ?par ?d3 ?PP
'.
	temp2 concl: 'homothetie ?ch ?i ?x image de ?p ?PP'.
	temp2 _ arg1 creeRegle: 'VarignonThales0'.
	temp2 antecedents: 'homothetie ?ch ?i ?x image de ?m ?mm'.
	temp2 concl: 'homothetie ?ch ?i ?x image de ?x ?i'.
	temp2 _ arg1 creeRegle: 'VarignonParalHomothetie'.
	temp2 antecedents: 'homothetie ?ch ?i ?x image de ?p ?P
homothetie ?ch ?i ?x image de ?p1 ?P1
different:de: ?p ?p1
different:de: ?p ?P
different:de: ?p1 ?P1
segment ?s ?p1 ?p
segment ?s1 ?P1 ?P'.
	temp2 concl: 'parallele ?s ?s1'.
	temp2 _ arg1 creeRegle: 'VarignonParalTrans'.
	temp2 antecedents: 'parallele ?s1 ?s2
parallele ?s3 ?s2
different:de: ?s1 ?s2
different:de: ?s1 ?s3
different:de: ?s2 ?s3
'.
	temp2 concl: 'parallele ?s1 ?s3'.
	temp2 _ arg1 creeRegle: 'VarignonParalRec'.
	temp2 antecedents: 'parallele ?s1 ?s2
'.
	temp2 concl: 'parallele ?s2 ?s1'.
	temp2 _ arg1 creeRegle: 'VarignonTriangle'.
	temp2 antecedents: 'adjacent ?s1 ?s2 ?a ?b ?c
adjacent ?s2 ?s3 ?b ?c ?a
ordonneMot:et:rep1:rep2: ?s1 ?s2 ?x1 ?x2
ordonneMot:et:rep1:rep2: ?x1 ?s3  ?s1 ?x4
'.
	temp2 concl: 'triangle ?s1 ?s2 ?s3 '.
	temp2 _ arg1 creeRegle: 'VarignonTriangles semblables'.
	temp2 antecedents: 'triangle ?s1 ?s2 ?s3
triangle ?ss1 ?ss2 ?ss3
parallele ?s1 ?ss1
parallele ?s2 ?ss2
parallele ?s3 ?ss3'.
	temp2 concl: 'semblables triangle ?s1 ?s2 ?s3 triangle ?ss1 ?ss2 ?ss3'.
	temp2 _ arg1 creeRegle: 'VarignonQuadrilatere'.
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
	temp2 _ arg1 creeRegle: 'VarignonQuadrilateres semblables'.
	temp2 antecedents: 'quadrilatere ?s1 ?s2 ?s3 ?s4
quadrilatere ?ss1 ?ss2 ?ss3 ?ss4

parallele ?s1 ?ss1
parallele ?s2 ?ss2
parallele ?s3 ?ss3
parallele ?s4 ?ss4'.
	temp2 concl: 'semblables quadrilateres ?s1 ?s2 ?s3 ?s4 quadrilatere ?ss1 ?ss2 ?ss3 ?ss4'.
	temp2 _ arg1 creeRegle: 'VarignonParallelograme'.
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
