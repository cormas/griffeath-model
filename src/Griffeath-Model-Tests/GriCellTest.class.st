Class {
	#name : 'GriCellTest',
	#superclass : 'TestCase',
	#instVars : [
		'aCell'
	],
	#category : 'Griffeath-Model-Tests',
	#package : 'Griffeath-Model-Tests'
}

{ #category : 'running' }
GriCellTest >> setUp [
	super setUp.
	GriCell initializeParameters.
	aCell := GriCell basicNew.
	aCell randomNumberGenerator: (Random seed: 13).
	aCell initialize
]

{ #category : 'running' }
GriCellTest >> tearDown [ 

	GriCell initializeParameters.
	super tearDown.
]

{ #category : 'running' }
GriCellTest >> testAsString [
	
	| expectedString |
	aCell id: 13.
	expectedString := 'a GriCell -id: 13 -n: 0 -o: 0 -state: 1
	id: 13
	coordinates: nil
	state: 1'.
	
	self assert: aCell asString equals: expectedString.
]

{ #category : 'running' }
GriCellTest >> testInitializeParameters [
	
	self assert: GriCell nbOfStates equals: 4.
	self assert: GriCell threshold equals: 3.
]

{ #category : 'running' }
GriCellTest >> testNbOfStates [

	GriCell nbOfStates: 13.	
		
	self assert: GriCell nbOfStates equals: 13.
]

{ #category : 'running' }
GriCellTest >> testState [

	aCell state: 13.
	
	self assert: aCell state equals: 13.
]

{ #category : 'running' }
GriCellTest >> testThreshold [

	GriCell threshold: 13.	
		
	self assert: GriCell threshold equals: 13.
]

{ #category : 'running' }
GriCellTest >> testUpdateState [
	"Purpose: updates 'state' attribute with the value stored in 'bufferState' attribute"

	aCell state: 13.
	aCell bufferState: aCell state + 1.
	aCell updateState.
	
	self assert: aCell state equals: 14
]
