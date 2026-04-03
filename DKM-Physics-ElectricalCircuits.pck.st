'From Cuis7.7 [latest update: #7822] on 3 April 2026 at 1:14:28 am'!
'Description '!
!provides: 'DKM-Physics-ElectricalCircuits' 1 0!
SystemOrganization addCategory: #'DKM-Physics-ElectricalCircuits'!


!classDefinition: #ElectricalCircuits category: #'DKM-Physics-ElectricalCircuits'!
Object subclass: #ElectricalCircuits
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DKM-Physics-ElectricalCircuits'!
!classDefinition: 'ElectricalCircuits class' category: #'DKM-Physics-ElectricalCircuits'!
ElectricalCircuits class
	instanceVariableNames: ''!


!ElectricalCircuits methodsFor: 'DSL' stamp: 'pad 24/Mar/2026 02:09:03'!
evaluateSample:smpl
|circ|
circ :=Compiler evaluate: smpl.
circ expert chargeRegles: 'Electricite'.! !

!ElectricalCircuits methodsFor: 'as yet unclassified' stamp: 'pad 24/Mar/2026 01:32:38'!
evaluateSample
self new evaluateSample: 'DrGeoFigure open'! !

!ElectricalCircuits methodsFor: 'as yet unclassified' stamp: 'pad 24/Mar/2026 01:29:57'!
open
self new evaluateSample: 'DrGeoFigure open'! !

!ElectricalCircuits methodsFor: 'as yet unclassified' stamp: 'pad 23/Mar/2026 15:27:31'!
readme! !

!ElectricalCircuits class methodsFor: 'as yet unclassified' stamp: 'pad 24/Mar/2026 01:10:55'!
codeSample
	^ 'DrGeoFigure open.'! !

!ElectricalCircuits class methodsFor: 'as yet unclassified' stamp: 'pad 23/Mar/2026 19:03:23'!
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

!ElectricalCircuits class methodsFor: 'as yet unclassified' stamp: 'pad 23/Mar/2026 16:02:45'!
description
	^'Describe a circuit using arcs'! !

!ElectricalCircuits class methodsFor: 'as yet unclassified' stamp: 'pad 23/Mar/2026 19:05:07'!
dslCategory
	^ 'DSL point' ! !

!ElectricalCircuits class methodsFor: 'as yet unclassified' stamp: 'pad 25/Mar/2026 11:35:36'!
evaluateSample
ElectricalCircuits new evaluateSample: 'DrGeoFigure open'! !

!ElectricalCircuits class methodsFor: 'as yet unclassified' stamp: 'pad 23/Mar/2026 15:58:18'!
presenterClass
	^ DrGeoSketch ! !

!ElectricalCircuits class methodsFor: 'as yet unclassified' stamp: 'pad 23/Mar/2026 16:37:55'!
title
	^ 'electricCircuits' ! !
