"
I travel through `MaMessages` to test if a given method is connected to a target message in the call tree
"
Class {
	#name : 'RTDConnectedMessagesDFS',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'visited'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'initialization' }
RTDConnectedMessagesDFS >> initialize [ 
	
	super initialize.
	visited := Set new
]

{ #category : 'testing' }
RTDConnectedMessagesDFS >> isMessage: aSelector connectedTo: targetSelector [

	(visited includes: aSelector )
		ifTrue: [ ^ false ]
		ifFalse: [ visited add: aSelector ].

	^ messages methods anySatisfy: [ :compiledMethod |
		compiledMethod selector = aSelector 
			and: [ self isMethod: compiledMethod connectedTo: targetSelector ] ]
]

{ #category : 'testing' }
RTDConnectedMessagesDFS >> isMethod: aCompiledMethod connectedTo: aSelector [
	
	^ (messages does: aCompiledMethod includesMessage: aSelector) or: [
		((messages at: aCompiledMethod) anySatisfy: [ :message | 
			self isMessage: message connectedTo: aSelector ] ) ]
]

{ #category : 'accessing' }
RTDConnectedMessagesDFS >> messages: aMessages [

	messages := aMessages 
]
