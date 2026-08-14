"
I store the detected smells resulting from the plugin
"
Class {
	#name : 'DTTSDDetectedTests',
	#superclass : 'Object',
	#instVars : [
		'assertionlessTests',
		'overwrittenSetupTests',
		'manyClassReferencesTests',
		'uselessSetupTests',
		'guardedTests',
		'unusualOrderTests'
	],
	#category : 'DrTests-TestSmellsDetector-Presenters',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTTSDDetectedTests >> assertionlessTests [

	^ assertionlessTests
]

{ #category : 'accessing' }
DTTSDDetectedTests >> assertionlessTests: anObject [

	assertionlessTests := anObject
]

{ #category : 'accessing' }
DTTSDDetectedTests >> guardedTests [

	^ guardedTests
]

{ #category : 'accessing' }
DTTSDDetectedTests >> guardedTests: anObject [

	guardedTests := anObject
]

{ #category : 'accessing' }
DTTSDDetectedTests >> manyClassReferencesTests [

	^ manyClassReferencesTests
]

{ #category : 'accessing' }
DTTSDDetectedTests >> manyClassReferencesTests: anObject [

	manyClassReferencesTests := anObject
]

{ #category : 'accessing' }
DTTSDDetectedTests >> overwrittenSetupTests [

	^ overwrittenSetupTests
]

{ #category : 'accessing' }
DTTSDDetectedTests >> overwrittenSetupTests: anObject [

	overwrittenSetupTests := anObject
]

{ #category : 'accessing' }
DTTSDDetectedTests >> unusualOrderTests [

	^ unusualOrderTests
]

{ #category : 'accessing' }
DTTSDDetectedTests >> unusualOrderTests: anObject [

	unusualOrderTests := anObject
]

{ #category : 'accessing' }
DTTSDDetectedTests >> uselessSetupTests [

	^ uselessSetupTests
]

{ #category : 'accessing' }
DTTSDDetectedTests >> uselessSetupTests: anObject [

	uselessSetupTests := anObject
]
