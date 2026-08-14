"
I am an abstract result builder for detectors
"
Class {
	#name : 'DTTSDDetectorBuilder',
	#superclass : 'DTTSDResultBuilder',
	#instVars : [
		'detector',
		'setDataBlock'
	],
	#category : 'DrTests-TestSmellsDetector-Builders',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Builders'
}

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> assertionless [


	^ self
		  detector: (TSDAssertionLessDetector new
				   methodVisitor: SimpleNoAssertVisitor new ;
				   yourself)
		  setDataBlock: [ :aTestData :tests | 
			aTestData assertionlessTests: (tests select: #isAssertionLess ) ]
]

{ #category : 'visiting' }
DTTSDDetectorBuilder class >> classReferences [

	^ self 
		detector: TSDTooManyClassesDetector new 
			setDataBlock: [ :aTestData :tests | 
				aTestData manyClassReferencesTests: (tests select: #doesReferenceManyClasses ) ]
]

{ #category : 'instance creation' }
DTTSDDetectorBuilder class >> detector: aDetector setDataBlock: aBlock [


	^ self new
		detector: aDetector;
		setDataBlock: aBlock;
		yourself
]

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> guarded [

	^ self
		  detector: (TSDGuardedTestDetector new
				   methodVisitor: SimpleGuardedTestVisitor new ;
				   yourself)
		  setDataBlock: [ :aTestData :tests | 
			aTestData guardedTests: (tests select: #IsGuarded ) ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> overwrittenSetup [

	| detector |
	detector := TSDOverwrittenSetupDetector new.

	^ self detector: detector setDataBlock: [ :aTestData :tests | 
		aTestData overwrittenSetupTests: (tests select: #doesOverwritesSetup ) ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> unusualOrderTests [


	^ self
		  detector: (TSDUnusualOrderTestDetector new
				   methodVisitor: SimpleUnusualOrderTestVisitor new ;
				   yourself)
		  setDataBlock: [ :aTestData :tests | 
			aTestData unusualOrderTests: (tests select: #hasUnusualOrderTest ) ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> uselessSetup [

	^ self
		  detector: TSDUselessSetupDetector new
		  setDataBlock: [ :aTestData :tests |
		  aTestData uselessSetupTests: (tests reject: #doesUseSetupVariables  ) ]
]

{ #category : 'building' }
DTTSDDetectorBuilder >> buildData: aTestData withTests: testCases [

	^ self setDataBlock value: aTestData value: (self detector resultsFrom: testCases )
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> detector [

	^ detector ifNil: [ Error signal: 'Detector not set' ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> detector: anObject [

	detector := anObject
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> setDataBlock [

	^ setDataBlock
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> setDataBlock: anObject [

	setDataBlock := anObject
]
