Class {
	#name : 'TSDSubFakeTests',
	#superclass : 'TSDFakeTests',
	#instVars : [
		'y',
		'subVariableAssigned'
	],
	#category : 'TestSmellsDetector-FakeTests',
	#package : 'TestSmellsDetector-FakeTests'
}

{ #category : 'running' }
TSDSubFakeTests >> assignSubVariable: anObject [

	subVariableAssigned := anObject 
]

{ #category : 'running' }
TSDSubFakeTests >> setUp [

	super setUp.
	y := String new.
	self assignSubVariable: 'wao'
]

{ #category : 'tests' }
TSDSubFakeTests >> testAssignsSomeInstanceVar [

	super testOnlyAssigns 
]

{ #category : 'tests' }
TSDSubFakeTests >> testCallTest2 [

	| var |
	super testCallTest.
	self testOnlyAssigns.
	var := TSDUnusualOrderTestDetector.
	var testMethode 
	 
]

{ #category : 'tests' }
TSDSubFakeTests >> testConnectedToAssignation [

	super testConnectedToAssignation.
	self y: 'a'.
]

{ #category : 'tests' }
TSDSubFakeTests >> testIsConnectedToInstanceVar [

	super testIsConnectedToInstanceVar.
	self assert: self y
]

{ #category : 'tests' }
TSDSubFakeTests >> testOnlyAssigns [

	super testOnlyAssigns.
	y := 'woa'
]

{ #category : 'tests' }
TSDSubFakeTests >> testUsesInstanceVar [ 

	super testUsesInstanceVar.
	self assert: y = subVariableAssigned
]

{ #category : 'accessing' }
TSDSubFakeTests >> y [

	^ y
]

{ #category : 'accessing' }
TSDSubFakeTests >> y: anObject [

	y := anObject
]
