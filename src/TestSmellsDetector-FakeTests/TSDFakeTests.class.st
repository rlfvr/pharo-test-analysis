"
This class hierarchy is used as data (a TestCase) for TestSmellsDetector test cases.
Some methods may add seemingly useless statements that are needed for the compiler to not optimize small methods into primitives 
"
Class {
	#name : 'TSDFakeTests',
	#superclass : 'TestCase',
	#instVars : [
		'x',
		'assignedVariable'
	],
	#category : 'TestSmellsDetector-FakeTests',
	#package : 'TestSmellsDetector-FakeTests'
}

{ #category : 'asserting' }
TSDFakeTests >> assert: aBlock description: aStringOrBlock [

	^ super assert: true description: aStringOrBlock 
]

{ #category : 'tests' }
TSDFakeTests >> assignToX [

	x := 1
]

{ #category : 'running' }
TSDFakeTests >> assignVariable [

	assignedVariable := 'woah'
]

{ #category : 'tests' }
TSDFakeTests >> noAssignToX [

1
]

{ #category : 'running' }
TSDFakeTests >> setUp [

	super setUp.
	self skip.
	x := 0.
	self assignVariable 
]

{ #category : 'tests' }
TSDFakeTests >> testCallTest [

	self testUsesClasses 
]

{ #category : 'tests' }
TSDFakeTests >> testConnectedToAssertion [

	self testConnectedToAssignation 
]

{ #category : 'tests' }
TSDFakeTests >> testConnectedToAssignation [

	self x: 1.
	self assert: 1 = 1
]

{ #category : 'tests' }
TSDFakeTests >> testDoesNotAssert [
	"does nonsense instead"
	| y |
	y := OrderedCollection new.
	^ y
]

{ #category : 'tests' }
TSDFakeTests >> testIsConnectedToInstanceVar [

	self 
		assert: self x = 0; 
		testUsesInstanceVar 
]

{ #category : 'tests' }
TSDFakeTests >> testMultipleDetections [

	self
		deny: (self detector detectSelector: #testUsesInstanceVar);
		assert: (self detector detectSelector: #testUsesLocalVariables)
]

{ #category : 'tests' }
TSDFakeTests >> testNoCallTest [

	| var |
	var := TSDUnusualOrderTestDetector.
	var testMethode 
]

{ #category : 'tests' }
TSDFakeTests >> testOnlyAssigns [

	x := 1.
	self assert: 1 = 1
]

{ #category : 'tests' }
TSDFakeTests >> testOnlyAssignsInChildMethod [

	self assignToX.
	self assert: 1 = 1
]

{ #category : 'tests' }
TSDFakeTests >> testOnlyNoAssignsInChildMethod [
	self noAssignToX.
	self assert: 1 = 1
]

{ #category : 'tests' }
TSDFakeTests >> testUsesClasses [

	TSDClassReferencesVisitor new
]

{ #category : 'tests' }
TSDFakeTests >> testUsesInstanceVar [

	self assert: x = 0;
		assert: assignedVariable 
]

{ #category : 'tests' }
TSDFakeTests >> testUsesLocalVariables [

	| x |
	x := 1.
	self assert: x = 1
]

{ #category : 'tests' }
TSDFakeTests >> testUsesTheSameClass [

	TSDFakeTests new.
	TSDFakeTests new.
	TSDFakeTests new.
	TSDFakeTests new.
]

{ #category : 'tests' }
TSDFakeTests >> testUsesTooManyClasses [

	TSDClassReferencesVisitor new.
	TSDFakeTests.
	TSDSubFakeTests 
]

{ #category : 'tests' }
TSDFakeTests >> testifFalse [

	1 = 1 ifFalse: [ true ].
	self x 
]

{ #category : 'tests' }
TSDFakeTests >> testifTrue [

	1 = 1 ifTrue: [ true ].
	self x 
]

{ #category : 'tests' }
TSDFakeTests >> testm1 [
	1 asFloat 
]

{ #category : 'accessing' }
TSDFakeTests >> x [

	1 asFloat.
	^ x
]

{ #category : 'accessing' }
TSDFakeTests >> x: anObject [

	x := anObject
]
