"
A TSDOverWrittenSetupDetectorTest is a test class for testing the behavior of TSDOverWrittenSetupDetector

The setup defines the instance variable values beforehand.
When a tests reassigns a value. that smells bad !
"
Class {
	#name : 'TSDOverwrittenSetupDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDOverwrittenSetupDetectorTest >> detectorClass [

	^ TSDOverwrittenSetupDetector
]

{ #category : 'tests' }
TSDOverwrittenSetupDetectorTest >> testDetectsDifferentClasses [
1 halt.
	self detector detectSelector: #testOnlyAssigns.
	self assert: (self detector detect: #y: from: TSDSubFakeTests )
]

{ #category : 'tests' }
TSDOverwrittenSetupDetectorTest >> testDetectsNoOverWriteInChildMethod [


	self detector selector: #testOnlyAssignsInChildMethod .

	self assertCollection: self detector result overwrittenVariables hasSameElements: { #x } "nom mal choisit ou test artificiel"
]

{ #category : 'tests' }
TSDOverwrittenSetupDetectorTest >> testDetectsOverWrite [
1 halt.
	self detector selector: #testOnlyAssigns.
	self assertCollection: self detector result overwrittenVariables hasSameElements: { #x } "nom mal choisit ou test artificiel"
]

{ #category : 'tests' }
TSDOverwrittenSetupDetectorTest >> testDetectsOverWriteInChildMethod [


	self detector selector: #testOnlyAssignsInChildMethod .
	1halt.
	self assertCollection: self detector result overwrittenVariables hasSameElements: { #x } "nom mal choisit ou test artificiel"
]
