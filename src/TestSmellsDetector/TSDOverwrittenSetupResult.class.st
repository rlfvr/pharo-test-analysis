Class {
	#name : 'TSDOverwrittenSetupResult',
	#superclass : 'TSDSetupResult',
	#instVars : [
		'doesOverwritesSetup',
		'overwrittenVariables',
		'writtenVariables'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'converting' }
TSDOverwrittenSetupResult >> asResultForDrTest [

	| node |
	node := super asResultForDrTest.

	node subResults addAll: {
			(DTTreeNode name: 'Written Variables' subResults: (DTFTFMessageNode toNodes: self writtenVariables)).
			(DTTreeNode name: 'Overwritten Variables' subResults: (DTFTFMessageNode toNodes: self overwrittenVariables)).
			(DTFTFMessageNode new
				 message: (String streamContents: [ :stream |
								  stream
									  << 'Overwrites setup: ';
									  << (self doesOverwritesSetup
											   ifTrue: [ 'Yes' ]
											   ifFalse: [ 'No' ]) ]);
				 yourself) }.

	^ node
]

{ #category : 'accessing' }
TSDOverwrittenSetupResult >> doesOverwritesSetup [

	^ doesOverwritesSetup
]

{ #category : 'accessing' }
TSDOverwrittenSetupResult >> doesOverwritesSetup: anObject [

	doesOverwritesSetup := anObject
]

{ #category : 'accessing' }
TSDOverwrittenSetupResult >> overwrittenVariables [

	^ overwrittenVariables
]

{ #category : 'accessing' }
TSDOverwrittenSetupResult >> overwrittenVariables: anObject [

	overwrittenVariables := anObject
]

{ #category : 'accessing' }
TSDOverwrittenSetupResult >> writtenVariables [

	^ writtenVariables
]

{ #category : 'accessing' }
TSDOverwrittenSetupResult >> writtenVariables: anObject [

	writtenVariables := anObject
]
