"
I detect whether a test references a classes more than three times
"
Class {
	#name : 'TSDTooManyClassesDetector',
	#superclass : 'TSDSmellDetector',
	#instVars : [
		'visitor'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'api' }
TSDTooManyClassesDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult 
		detectedClasses: self referenceVisitor classReferences;
		doesReferenceManyClasses: self doesReferenceManyClasses 
]

{ #category : 'testing' }
TSDTooManyClassesDetector >> detects [

	self resetVisitor.
	self referenceVisitor visit: self compiledMethod parseTree.
	^ self doesReferenceManyClasses
]

{ #category : 'testing' }
TSDTooManyClassesDetector >> doesReferenceManyClasses [

	^ self referenceVisitor referencesCount >= self ocurrenceThreshold or: [
		  self referenceVisitor anyClassIsReferencedMoreThan: self ocurrenceThreshold ]
]

{ #category : 'accessing' }
TSDTooManyClassesDetector >> ocurrenceThreshold [

	^ 3
]

{ #category : 'accessing' }
TSDTooManyClassesDetector >> referenceVisitor [

	^ visitor ifNil: [ visitor := TSDClassReferencesVisitor new selfClass: self selfClass; yourself ]
]

{ #category : 'private' }
TSDTooManyClassesDetector >> resetVisitor [

	visitor := nil "forces the getter to build a fresh visitor"
]

{ #category : 'accessing' }
TSDTooManyClassesDetector >> smellResultClass [ 

	^ TSDTooManyClassesResult 
]
