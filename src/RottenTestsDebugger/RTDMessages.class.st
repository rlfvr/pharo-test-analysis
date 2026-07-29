"
I store the result of the analysis done by `MyTestAnalyzer`
"
Class {
	#name : 'RTDMessages',
	#superclass : 'Object',
	#instVars : [
		'methodsMessages'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'comparing' }
RTDMessages >> = aMaMessages [
	
	^ methodsMessages = aMaMessages methodsMessages
]

{ #category : 'accessing' }
RTDMessages >> at: aCompiledMethod [
	^methodsMessages at: aCompiledMethod ifAbsent: [ RTDMethodNotFound signal ]
]

{ #category : 'accessing' }
RTDMessages >> at: aCompiledMethod put: aSelectorCollection [

	methodsMessages at: aCompiledMethod put: aSelectorCollection 
]

{ #category : 'testing' }
RTDMessages >> does: aCompiledMethod includesMessage: aSelector [ 

	^ (self at: aCompiledMethod) includes: aSelector 
]

{ #category : 'testing' }
RTDMessages >> does: aCompiledMethod includesSubMethod: aCompiledSubmethod [ 
	
	| methodMessages subMethodMessages |
	methodMessages := self at: aCompiledMethod.
	subMethodMessages := self at: aCompiledSubmethod.
	^ (subMethodMessages difference: methodMessages) isEmpty 
]

{ #category : 'initialization' }
RTDMessages >> initialize [ 
	
	super initialize.
	methodsMessages := Dictionary new.
]

{ #category : 'testing' }
RTDMessages >> is: aCompiledMethod connectedTo: aMessage [
 
	^ RTDConnectedMessagesDFS new
		messages: self;
		isMethod: aCompiledMethod connectedTo: aMessage 
]

{ #category : 'testing' }
RTDMessages >> is: aCompiledMethod connectedToAny: aMessageCollection [ 
	
	^ aMessageCollection anySatisfy: [ :message | 
		self is: aCompiledMethod connectedTo: message ]
]

{ #category : 'testing' }
RTDMessages >> isEmpty [ 

	^ methodsMessages isEmpty 
]

{ #category : 'accessing' }
RTDMessages >> methods [
	
	^ methodsMessages keys
]

{ #category : 'accessing' }
RTDMessages >> methodsMessages [

	^methodsMessages 
]

{ #category : 'api' }
RTDMessages >> methodsThatInclude: aSubMethod [

	^ (self methods select: [ :compiledMethod | 
			self does: compiledMethod includesSubMethod: aSubMethod ])
		difference: 	{ aSubMethod } 
]

{ #category : 'printing' }
RTDMessages >> printOn: aStream [

	super printOn: aStream.
	methodsMessages printElementsOn: aStream 
]

{ #category : 'api' }
RTDMessages >> subMethodsIncludedBy: aCompiledMethod [ 
	
	^ (self methods select: [ :subMethod | 
			self does: aCompiledMethod includesSubMethod: subMethod ])
		difference: { aCompiledMethod }
]
