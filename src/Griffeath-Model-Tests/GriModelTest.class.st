Class {
	#name : 'GriModelTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Griffeath-Model-Tests',
	#package : 'Griffeath-Model-Tests'
}

{ #category : 'running' }
GriModelTest >> setUp [

	super setUp.
	model := GriffeathModel new.
	model randomNumberGenerator: (Random seed: 13).
	
	model 
		createGridNumberOfRows: 3
		numberOfColumns: 3
		neighbourhood: 8
		closed: true.
		
]

{ #category : 'running' }
GriModelTest >> tearDown [ 

	GriCell initializeParameters.
	GriffeathModel initializeParameters.
	super tearDown.
]

{ #category : 'tests' }
GriModelTest >> testNbOfStates [

	GriCell nbOfStates: 13.	
		
	self assert: GriCell nbOfStates equals: 13.
]

{ #category : 'tests' }
GriModelTest >> testOneStepAverage [
	model stepAverage.
	
	self assert: (model cells first state) equals: 1 .
	self assert: (model cells last state) equals: 4 .
]

{ #category : 'tests' }
GriModelTest >> testOneStepStandard [
	model stepStandard.
	
	self assert: (model cells first state) equals: 2 .
	self assert: (model cells last state) equals: 4 .
]

{ #category : 'tests' }
GriModelTest >> testOneStepThreshold [
	model stepThreshold.
	
	self assert: (model cells first state) equals: 1 .
	self assert: (model cells last state) equals: 4 .
]
