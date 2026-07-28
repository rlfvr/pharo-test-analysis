"
I find and store the messages sent by visited methods, as well as including guarded messages
"
Class {
	#name : 'RTDMessageVisitor',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'methodVisitor'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'api' }
RTDMessageVisitor >> analyzeMethod: aCompiledMethod [

	methodVisitor analyzeMethod: aCompiledMethod.
	self collectMessages 
]

{ #category : 'as yet unclassified' }
RTDMessageVisitor >> collectMessages [

	methodVisitor selfSentMethods do: [ :aCompiledMethod | 
		messages 
			at: aCompiledMethod 
			put: (aCompiledMethod parseTree allMessageNodes collect: #selector) asSet ]
]

{ #category : 'initialization' }
RTDMessageVisitor >> initialize [

	super initialize.
	messages := RTDMessages new.
	methodVisitor := RTDMethodVisitor new
]

{ #category : 'accessing' }
RTDMessageVisitor >> messages [
	
	^ messages
]

{ #category : 'accessing' }
RTDMessageVisitor >> messages: aMessages [
	
	messages := aMessages 
]

{ #category : 'visiting' }
RTDMessageVisitor >> visitMethodNode: aMethodNode [
	
	self messages 
		at: aMethodNode compiledMethod 
		put: (aMethodNode allMessageNodes collect: #selector) asSet.

	super visitMethodNode: aMethodNode
]
