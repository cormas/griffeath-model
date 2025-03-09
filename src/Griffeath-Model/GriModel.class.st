"
GriModel is the Scheduler of the Griffeath""s Model
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
	numberLines := 150.
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
GriModel >> initRandomSpace [

	<init>
	self
		createGridNumberOfRows: self class numberLines
		numberOfColumns: self class numberColumns
		neighbourhood: 8
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

{ #category : 'stepping' }
GriModel >> step [
<control>
	self stepSynchronouslyCA: 1
]

{ #category : 'accessing' }
GriModel >> theCells [

	<getterFor: #GriCell>
	^ theCells 
]
