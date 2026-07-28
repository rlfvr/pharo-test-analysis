Class {
	#name : 'TSDSetupResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'setupVariables'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'converting' }
TSDSetupResult >> asResultForDrTest [

	| node |
	node := super asResultForDrTest.

	node subResults addAll: { (DTTreeNode name: 'Setup Variables' subResults: (DTFTFMessageNode toNodes: self setupVariables)) }.

	^ node
]

{ #category : 'accessing' }
TSDSetupResult >> setupVariables [

	^ setupVariables
]

{ #category : 'accessing' }
TSDSetupResult >> setupVariables: anObject [

	setupVariables := anObject
]
