Class {
	#name : 'TSDUselessSetupResult',
	#superclass : 'TSDSetupResult',
	#instVars : [
		'doesUseSetupVariables',
		'usedSetupVariables'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'converting' }
TSDUselessSetupResult >> asResultForDrTest [

	| node |
	node := super asResultForDrTest.
	node subResults addAll: { 
		DTTreeNode name: 'Used setup variables' subResults: (DTFTFMessageNode toNodes: self usedSetupVariables).
		DTFTFMessageNode new message: ('Does use setup variables: ', self doesUseSetupVariables printString); yourself
	 } .
	^ node
]

{ #category : 'accessing' }
TSDUselessSetupResult >> doesUseSetupVariables [

	^ doesUseSetupVariables
]

{ #category : 'accessing' }
TSDUselessSetupResult >> doesUseSetupVariables: anObject [

	doesUseSetupVariables := anObject
]

{ #category : 'accessing' }
TSDUselessSetupResult >> usedSetupVariables [

	^ usedSetupVariables
]

{ #category : 'accessing' }
TSDUselessSetupResult >> usedSetupVariables: anObject [

	usedSetupVariables := anObject
]
