"
Cell is the unique class of the Griffeath model, with a state that can be 1, 2, 3 or 4
"
Class {
	#name : 'GriCell',
	#superclass : 'CMSpatialEntityCell',
	#category : 'Griffeath-Model',
	#package : 'Griffeath-Model'
}

{ #category : 'initialization' }
GriCell >> initialize [
	" Private - Set the receiver's internal state and bufferState. Initally a state can be randomly set to 1,2, 3 or 4 "

	super initialize.

	state := self randomIntegerBetween: 1 and: 4.
	bufferState := state
]

{ #category : 'control' }
GriCell >> newState [

	| next |
	"next :=Cormas nextCyclicElementOf: #(1 2 3 4) currentElement: self state."
	next := state + 1. next = 5 ifTrue:[next := 1].
	(self neighbourhood select: [:c | c state = next]) size >= 3
		ifTrue: [self bufferState: next]
		ifFalse: [self bufferState: state]
]

{ #category : 'pov' }
GriCell >> pov [

	<pov>
	state = 1 ifTrue: [ ^ CMPointOfView color: Color yellow ].
	state = 2 ifTrue: [ ^ CMPointOfView color: (Color fromHexString: 'F19A0F')].
	state = 3 ifTrue: [ ^ CMPointOfView color: (Color fromHexString: 'EC6C28')].
	state = 4 ifTrue: [ ^ CMPointOfView color: Color red ].
	^ CMPointOfView color: Color brown
]
