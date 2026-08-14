"
I am the plugin implementing smell detectors for DrTest
"
Class {
	#name : 'DTTSDPlugin',
	#superclass : 'DrTestsPlugin',
	#category : 'DrTests-TestSmellsDetector-Presenters',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Presenters'
}

{ #category : 'instance creation' }
DTTSDPlugin class >> open [
	<script>
	
	^ (DrTests newApplication: StPharoApplication current) currentPlugin: self new ; open; yourself
]

{ #category : 'api - accessing' }
DTTSDPlugin class >> pluginName [ 

	^ 'Test Smells Detector'
]

{ #category : 'api - accessing' }
DTTSDPlugin class >> pluginResultClass [ 

	^ DTTSDResult 
]

{ #category : 'api - accessing' }
DTTSDPlugin class >> weight [
	^11
]

{ #category : 'accessing' }
DTTSDPlugin >> builder [

	^ DTTSDMultipleResultBuilder builders: {
			  DTTSDDetectorBuilder assertionless.
			  DTTSDDetectorBuilder overwrittenSetup.
			  DTTSDDetectorBuilder classReferences.
			  DTTSDDetectorBuilder uselessSetup.
			  DTTSDDetectorBuilder guarded.
			  DTTSDDetectorBuilder unusualOrderTests }
]

{ #category : 'accessing' }
DTTSDPlugin >> pragmaForResultTrees [

	^ 'dtTestTSDResultTreeNamed:order:' 
]

{ #category : 'api' }
DTTSDPlugin >> resultButtonHelp [
	
	^ 'Browse the test selected in the results list.' translated
]

{ #category : 'api' }
DTTSDPlugin >> runForConfiguration: aDTpluginConfiguration [

	| detections |
	detections := DTTSDDetectedTests new.
	self builder buildData: detections withTests: (aDTpluginConfiguration asTestSuite tests).

	^ self pluginResultClass detectedTests: detections
]

{ #category : 'api' }
DTTSDPlugin >> startButtonHelp [ 

	^ 'Detect smells' translated 
]

{ #category : 'api' }
DTTSDPlugin >> startButtonLabel [ 

	^ 'Detect smells in tests selected.' translated 
]
