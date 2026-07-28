"
I detect whether tests do not contain assertions
"
Class {
	#name : 'TSDAssertionLessDetector',
	#superclass : 'TSDSmellDetector',
	#instVars : [
		'methodVisitor'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'private' }
TSDAssertionLessDetector >> analyzeMethod [

	self methodVisitor containsAssertMessageNode: false.
	self methodVisitor analyzeMethod: self compiledMethod 
]

{ #category : 'api' }
TSDAssertionLessDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult isAssertionLess: self isAssertionLess 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> detects [
	^ self isAssertionLess 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> hasNoAssertionSelectors [

	^ self methodVisitor helperSelectors allSatisfy: [ :aHelperSelector | 
				(self methodVisitor messages does: self compiledMethod includesMessage: aHelperSelector) not ]
]

{ #category : 'testing' }
TSDAssertionLessDetector >> hasNohelpers [

	^ (self methodVisitor helpers at: self compiledMethod) isEmpty 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> isAssertionLess [

	self analyzeMethod .
	^ self hasNoAssertionSelectors and: [ self hasNohelpers ]
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := RTDHelperVisitor new ]
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> smellResultClass [ 

	^ TSDAssertionLessResult 
]
