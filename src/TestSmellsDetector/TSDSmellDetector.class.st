"
I am an interface for detectors in this package
"
Class {
	#name : 'TSDSmellDetector',
	#superclass : 'Object',
	#instVars : [
		'selector',
		'selfClass'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'testing' }
TSDSmellDetector class >> isAbstract [ 
	
	^ self = TSDSmellDetector 
]

{ #category : 'accessing' }
TSDSmellDetector class >> selfClass: aClass [

	^ self new selfClass: aClass; yourself
]

{ #category : 'api' }
TSDSmellDetector >> buildResult: aResult [

	"assumes the parameters are given"
	self detects.
	aResult 
		selector: self selector;
		testClass: self selfClass
]

{ #category : 'accessing' }
TSDSmellDetector >> compiledMethod [

	^ self lookupMethod: self selector
]

{ #category : 'api' }
TSDSmellDetector >> detect: aSelector from: aClass [

	^ self 
		selfClass: aClass;
		detectSelector: aSelector 
]

{ #category : 'api' }
TSDSmellDetector >> detectSelector: aSelector [
	
	"assumes the self class was already given"
	^ self selector: aSelector; detects
]

{ #category : 'testing' }
TSDSmellDetector >> detects [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
TSDSmellDetector >> lookupMethod: aSelector [

	^ self selfClass lookupSelector: aSelector 
]

{ #category : 'accessing' }
TSDSmellDetector >> result [

	| result |
	result := self smellResultClass new.

	self buildResult: result.
	
	^ result
]

{ #category : 'api' }
TSDSmellDetector >> resultsFrom: aTestCollection [

	^ (aTestCollection collect: [ :aTestCase |
			  self
				  selector: aTestCase selector;
				  selfClass: aTestCase class;
				  result ]) asSortedCollection 
]

{ #category : 'accessing' }
TSDSmellDetector >> selector [

	^ selector
]

{ #category : 'accessing' }
TSDSmellDetector >> selector: anObject [

	selector := anObject
]

{ #category : 'accessing' }
TSDSmellDetector >> selfClass [

	^ selfClass
]

{ #category : 'accessing' }
TSDSmellDetector >> selfClass: anObject [

	selfClass := anObject
]

{ #category : 'accessing' }
TSDSmellDetector >> smellResultClass [

	^ TSDSmellResult
]
