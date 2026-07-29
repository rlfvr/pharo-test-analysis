"
I detect whether a method overwrites an instance variable set up in a setUp method
"
Class {
	#name : 'TSDOverwrittenSetupDetector',
	#superclass : 'TSDSetupDetector',
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'api' }
TSDOverwrittenSetupDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult 
		overwrittenVariables: (self writtenVariables intersection: self setupVariables);
		doesOverwritesSetup: self doesOverWritesSetUp;
		writtenVariables: self writtenVariables
]

{ #category : 'testing' }
TSDOverwrittenSetupDetector >> detects [
	^ self doesOverWritesSetUp 
]

{ #category : 'testing' }
TSDOverwrittenSetupDetector >> doesOverWritesSetUp [

	^ self writtenVariables includesAny: self setupVariables 
]

{ #category : 'accessing' }
TSDOverwrittenSetupDetector >> smellResultClass [ 

	^ TSDOverwrittenSetupResult 
]

{ #category : 'api' }
TSDOverwrittenSetupDetector >> writtenVariables [

	^ self assignsFinder at: self selector
]
