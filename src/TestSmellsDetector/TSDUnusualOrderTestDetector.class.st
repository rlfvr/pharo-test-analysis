Class {
	#name : 'TSDUnusualOrderTestDetector',
	#superclass : 'TSDSmellDetector',
	#instVars : [
		'methodVisitor'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'private' }
TSDUnusualOrderTestDetector >> analyzeMethod [

	self methodVisitor containTestMethod: false.
	self methodVisitor var: 0.
	self methodVisitor selfVar: 0.
	self methodVisitor superVar: 0.
	self methodVisitor analyzeMethod: self compiledMethod 
]

{ #category : 'api' }
TSDUnusualOrderTestDetector >> buildResult: aResult [

	super buildResult: aResult.
	
	aResult hasCalledTest: self hasUnusualOrderTest.
	aResult receiverIsSuper: { self methodVisitor superVar }.
	aResult receiverIsOther: { self methodVisitor var }.
	aResult receiverIsSelf: { self methodVisitor selfVar }.
]

{ #category : 'testing' }
TSDUnusualOrderTestDetector >> detects [
	^ self hasUnusualOrderTest
]

{ #category : 'testing' }
TSDUnusualOrderTestDetector >> hasUnusualOrderTest [

	self analyzeMethod .
	^ self methodVisitor containTestMethod
]

{ #category : 'accessing' }
TSDUnusualOrderTestDetector >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := SimpleUnusualOrderTestVisitor new ]
]

{ #category : 'accessing' }
TSDUnusualOrderTestDetector >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'accessing' }
TSDUnusualOrderTestDetector >> smellResultClass [

	^ TSDUnusualOrderTestResult
]
