"
Cell is the unique class of the Griffeath model, with a state that can be 1, 2, 3 or 4
"
Class {
	#name : 'GriCell',
	#superclass : 'CMSpatialEntityCell',
	#classInstVars : [
		'nbOfStates',
		'threshold'
	],
	#category : 'Griffeath-Model',
	#package : 'Griffeath-Model'
}

{ #category : 'accessing' }
GriCell class >> initializeParameters [

	super initializeParameters.
	nbOfStates := 4.
	threshold := 3
]

{ #category : 'accessing' }
GriCell class >> nbOfStates [

	^ nbOfStates
]

{ #category : 'accessing' }
GriCell class >> nbOfStates: anObject [

	nbOfStates := anObject
]

{ #category : 'accessing' }
GriCell class >> states [

	^ 1 to: self nbOfStates
]

{ #category : 'accessing' }
GriCell class >> statesColors [

	^ OrderedCollection
		  with: Color yellow
		  with: (Color fromHexString: 'F19A0F')
		  with: (Color fromHexString: 'EC6C28')
		  with: Color red
		  with: (Color fromHexString: '83430A')
		  with: Color black
]

{ #category : 'accessing' }
GriCell class >> threshold [

	^ threshold
]

{ #category : 'accessing' }
GriCell class >> threshold: anObject [

	threshold := anObject
]

{ #category : 'initialization' }
GriCell >> initialize [
	" Private - Set the receiver's internal state and bufferState. Initally a state can be randomly set to 1,2, 3 or 4 "

	super initialize.

	state := self randomIntegerBetween: 1 and: (self class nbOfStates).
	bufferState := state
]

{ #category : 'control' }
GriCell >> newState [
"= newState standard"
	"This cell in state i changes to state i + 1 mod N (at the next time step) if it has a neighbor that is in state i + 1 mod N, otherwise it remains in state i at the next time step. 
	For example, if the current cell state is 3, and one of its  neighbors is in state 4, then the current cell changes its state to 4. Note that next state of 4 mod 4 is 1. This creates the cycle."

	| next |
	next := self class states atWrap: state + 1.
	self neighbourhood
		detect: [ :c | c state = next ]
		ifFound: [ self bufferState: next ]
		ifNone: [ self bufferState: state ]
]

{ #category : 'control' }
GriCell >> newStateAverage [
	"The current cell in state i checks its state against the neighbors' states. If 3 (threshold) or more neighbors have a state between (i+1) and (i + nbStates/3), then the current cell changes to that state. 
For example, if the current cell state is 2, and 3 of its  neighbors are in state 3 to 6, then the current cell changes its state to 3. "

	| next max |
	next := self class states atWrap: state + 1.
	max := self class states atWrap:
		       state + (1 max: (self class states size / 3) rounded).
	max >= next ifFalse: [
		next := max.
		max := self class states atWrap: state + 1 ].
	(self neighbourhood select: [ :c | c state between: next and: max ])
		size >= self class threshold
		ifTrue: [ self bufferState: (self class states atWrap: state + 1) ]
		ifFalse: [ self bufferState: state ]
]

{ #category : 'control' }
GriCell >> newStateThreshold [

	"This cell in state i changes to state i + 1 mod N (at the next time step) if it has N (threshold) neighbors that are in state i + 1 mod N, otherwise it remains in state i at the next time step. 
	For example, if the current cell state is 3, and 3 of its  neighbors is in state 4, then the current cell changes its state to 4. Note that next state of 4 mod 4 is 1. This creates the cycle."

	| next |
	next := self class states atWrap: state + 1.
	(self neighbourhood select: [ :c | c state = next ])
		size >= self class threshold
		ifTrue: [ self bufferState: next ]
		ifFalse: [ self bufferState: state ]
]

{ #category : 'pov' }
GriCell >> pov [

	<pov>
		^ CMPointOfView color: (self
				   colorValue: state
				   min: 1
				   color: Color yellow
				   max: GriCell nbOfStates
				   color: Color red).
	"^ CMPointOfView color: (self class statesColors at: state)"
]
