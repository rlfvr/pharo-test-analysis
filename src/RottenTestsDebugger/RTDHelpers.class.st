"
I am a data structure that encapsulates helpers found by the analyzer
"
Class {
	#name : 'RTDHelpers',
	#superclass : 'Object',
	#instVars : [
		'methodHelpers'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'accessing' }
RTDHelpers >> at: aCompiledMethod [
	
	^methodHelpers at: aCompiledMethod ifAbsent: [ RTDMethodNotFound signal ]
]

{ #category : 'accessing' }
RTDHelpers >> at: aCompiledMethod put: aHelpersCollection [

	methodHelpers at: aCompiledMethod put: aHelpersCollection 
]

{ #category : 'initialization' }
RTDHelpers >> initialize [ 

	super initialize. 
	methodHelpers := Dictionary new.
]

{ #category : 'testing' }
RTDHelpers >> isEmpty [ 
	
	^ methodHelpers isEmpty 
]

{ #category : 'printing' }
RTDHelpers >> printOn: aStream [

	super printOn: aStream.
	methodHelpers printElementsOn: aStream 
]
