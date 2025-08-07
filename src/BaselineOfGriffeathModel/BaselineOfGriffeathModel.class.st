Class {
	#name : 'BaselineOfGriffeathModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfGriffeathModel',
	#package : 'BaselineOfGriffeathModel'
}

{ #category : 'baselines' }
BaselineOfGriffeathModel >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'Griffeath-Model';
		
			package: 'Griffeath-Model-Tests'
			with: [ spec requires: #('Griffeath-Model') ] ].

]
