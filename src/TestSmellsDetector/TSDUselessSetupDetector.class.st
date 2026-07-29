"
I am a detector for test methods that does not use all instance variables set up in a setUp method from the same class
"
Class {
	#name : 'TSDUselessSetupDetector',
	#superclass : 'TSDSetupDetector',
	#instVars : [
		'accessesFinder'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'accessing' }
TSDUselessSetupDetector >> accessesFinder [

	^ accessesFinder ifNil: [ accessesFinder := TSDInstanceVariablesFinder accessings
			selfClass: self selfClass; yourself ]
]

{ #category : 'api' }
TSDUselessSetupDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult 
		usedSetupVariables: (self foundInstanceVariables intersection: self setupVariables);
		doesUseSetupVariables: self doesUseSetUp 
]

{ #category : 'testing' }
TSDUselessSetupDetector >> detects [

	self accessesFinder reset.
	^ self doesUseSetUp not
]

{ #category : 'testing' }
TSDUselessSetupDetector >> doesUseSetUp [

	"A method uses it's setup variables only if 
	the setup variables are a subset of the accessed variables in the method"
	^ (self setupVariables difference: self foundInstanceVariables) isEmpty
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> foundInstanceVariables [

	^ self accessesFinder at: self selector
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> selfClass: aClass [

	super selfClass: aClass.
	self accessesFinder selfClass: aClass 
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> smellResultClass [ 

	^ TSDUselessSetupResult 
]
