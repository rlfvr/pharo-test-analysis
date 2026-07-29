"
I find and store self calls that are connected to asserting selectors
"
Class {
	#name : 'RTDHelperVisitor',
	#superclass : 'Object',
	#instVars : [
		'helpers',
		'helperSelectors',
		'messageVisitor',
		'methodVisitor'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'instance creation' }
RTDHelperVisitor class >> withAssertableSelectors [ 

	^ self new useAssertableSelectors; yourself
]

{ #category : 'api' }
RTDHelperVisitor >> analyzeMethod: aCompiledMethod [

	methodVisitor analyzeMethod: aCompiledMethod.
	messageVisitor analyzeMethod: aCompiledMethod.
	self collectHelpers 
]

{ #category : 'as yet unclassified' }
RTDHelperVisitor >> collectHelpers [ 

	methodVisitor selfSentMethods do: [ :aCompiledMethod | 
		self helpers at: aCompiledMethod put: (self selectMethodHelpers: aCompiledMethod)  ]
]

{ #category : 'accessing' }
RTDHelperVisitor >> helperSelectors [

	^ helperSelectors
]

{ #category : 'accessing' }
RTDHelperVisitor >> helperSelectors: anObject [

	helperSelectors := anObject
]

{ #category : 'accessing' }
RTDHelperVisitor >> helpers [ 
	
	^ helpers 
]

{ #category : 'initialization' }
RTDHelperVisitor >> initialize [ 

	super initialize.
	messageVisitor := RTDMessageVisitor new.
	methodVisitor := RTDMethodVisitor new.
	helperSelectors := OrderedCollection new.
	helpers := RTDHelpers new
]

{ #category : 'private' }
RTDHelperVisitor >> selectMethodHelpers: aCompiledMethod [

	^ (methodVisitor methodsSelfCalls at: aCompiledMethod) select: [ :methodSelfCall |
		  messageVisitor messages is: methodSelfCall connectedToAny: self helperSelectors ]
]

{ #category : 'api' }
RTDHelperVisitor >> useAssertableSelectors [

	self helperSelectors: (TAssertable selectors union: #( assert: assert:description: ) ) 
]

{ #category : 'visiting' }
RTDHelperVisitor >> visitMethodNode: aMethodNode [
	
	super visitMethodNode: aMethodNode.
	self helpers at: aMethodNode compiledMethod put: (self selectMethodHelpers: aMethodNode compiledMethod) 
]
