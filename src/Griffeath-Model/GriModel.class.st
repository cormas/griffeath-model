"
GriModel is the Scheduler of the Griffeath""s Model.
See: Fisch, R., Gravner, J. & Griffeath, D. Threshold-range scaling of excitable cellular automata. Stat Comput 1, 23–39 (1991). https://doi.org/10.1007/BF01890834
"
Class {
	#name : 'GriModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'theCells'
	],
	#classInstVars : [
		'numberLines',
		'numberColumns'
	],
	#category : 'Griffeath-Model',
	#package : 'Griffeath-Model'
}

{ #category : 'as yet unclassified' }
GriModel class >> aboutThisModel [

	^ ''
]

{ #category : 'accessing' }
GriModel class >> initializeParameters [

	super initializeParameters.
	numberLines := 80.
	numberColumns := 150.
]

{ #category : 'accessing' }
GriModel class >> numberColumns [

	<parameterGetter>
	^ numberColumns
]

{ #category : 'accessing' }
GriModel class >> numberColumns: int [

	<parameterSetter>
	numberColumns := int
]

{ #category : 'accessing' }
GriModel class >> numberLines [

	<parameterGetter>
	^ numberLines
]

{ #category : 'accessing' }
GriModel class >> numberLines: int [

	<parameterSetter>
	numberLines := int
]

{ #category : 'as yet unclassified' }
GriModel class >> prefix [

	^ 'Gri'
]

{ #category : 'initialization' }
GriModel >> initRandomSpace_Moore [
	"To be simulated with stepAverage. If you set the parameter 'nbOfStates' to 14 with threshold 3, you get beautiful movements"

	<init>
	self
		createGridNumberOfRows: self class numberLines
		numberOfColumns: self class numberColumns
		neighbourhood: 8
		closed: false
]

{ #category : 'initialization' }
GriModel >> initRandomSpace_VonNeuman [

	<init>
	self
		createGridNumberOfRows: self class numberLines
		numberOfColumns: self class numberColumns
		neighbourhood: 4
		closed: false 
]

{ #category : 'initialization' }
GriModel >> initialize [

	super initialize.
	theCells := OrderedCollection new
]

{ #category : 'probes' }
GriModel >> numberOf1s [

	<probeNamed: 'Number of yellow cells' color: 'FFFF00'>
	^ (self theCells select: [ :c | c state = 1 ]) size
]

{ #category : 'probes' }
GriModel >> numberOf2s [

	<probeNamed: 'Number of light orange cells' color: 'F19A0F'>
	^ (self theCells select: [ :c | c state = 2 ]) size
]

{ #category : 'probes' }
GriModel >> numberOf3s [

	<probeNamed: 'Number of orange cells' color: 'EC6C28'>
	^ (self theCells select: [ :c | c state = 3 ]) size
]

{ #category : 'probes' }
GriModel >> numberOf4s [

	<probeNamed: 'Number of red cells' color: 'FF0000'>
	^ (self theCells select: [ :c | c state = 4 ]) size
]

{ #category : 'control' }
GriModel >> stepAverage [
	"Call successively #newStateAverage then #updateState for all the cells"

	<control>
	self cells do: [ :a | a newStateAverage ].
	self cells do: [ :a | a updateState ]
]

{ #category : 'control' }
GriModel >> stepStandard [
	"Call successively #newState then #updateState for all the cells.
	This step works well with the Von Neuman neigbourhood"

	<control>
	self stepSynchronouslyCA: 1
]

{ #category : 'control' }
GriModel >> stepThreshold [
	"Call successively #newStateThreshold then #updateState for all the cells"

	<control>
	self cells do: [ :a | a newStateThreshold ].
	self cells do: [ :a | a updateState ]
]

{ #category : 'accessing' }
GriModel >> theCells [

	<getterFor: #GriCell>
	^ theCells 
]
