Class {
	#name : 'SimpleUnusualOrderTestVisitor',
	#superclass : 'RTDMethodVisitor',
	#instVars : [
		'containTestMethod',
		'selfVar',
		'superVar',
		'var',
		'selfVarTot',
		'superVarTot',
		'varTot'
	],
	#category : 'RottenTestsDebugger-visitors',
	#package : 'RottenTestsDebugger',
	#tag : 'visitors'
}

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> addSelfVar [

	selfVar := selfVar + 1.
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> addSelfVarTot [

	selfVarTot := selfVarTot + 1.
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> addSuperVar [

	superVar := superVar + 1.
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> addSuperVarTot [

	superVarTot := superVarTot + 1.
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> addVar [

	var := var + 1.
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> addVarTot [

	varTot := varTot + 1.
]

{ #category : 'initialization' }
SimpleUnusualOrderTestVisitor >> containTestMethod [ 

	^ containTestMethod
]

{ #category : 'initialization' }
SimpleUnusualOrderTestVisitor >> containTestMethod: anObject [ 

	containTestMethod := anObject 
]

{ #category : 'initialization' }
SimpleUnusualOrderTestVisitor >> initialize [ 

	super initialize .
	containTestMethod := false.
	selfVar := 0.
	superVar := 0.
	var := 0.
	selfVarTot := 0.
	superVarTot := 0.
	varTot := 0.
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> selfVar [

	^ selfVar
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> selfVar: anObject [

	selfVar := anObject
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> selfVarTot [

	^ selfVarTot
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> selfVarTot: anObject [

	selfVarTot := anObject
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> superVar [

	^ superVar
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> superVar: anObject [

	superVar := anObject
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> superVarTot [

	^ superVarTot
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> superVarTot: anObject [

	superVarTot := anObject
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> var [

	^ var
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> var: anObject [

	var := anObject
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> varTot [

	^ varTot
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> varTot: anObject [

	varTot := anObject
]

{ #category : 'visiting' }
SimpleUnusualOrderTestVisitor >> visitMessageNode: aMessageNode [

	self visitNodes: aMessageNode.	
	aMessageNode selector isTestSelector ifTrue: [ 
		self containTestMethod: true.
		aMessageNode receiver isSelfVariable ifTrue: [ 
			self addSelfVar. self addSelfVarTot ]
		ifFalse: 
		[ aMessageNode receiver isSuperVariable ifTrue: [ 
			self addSuperVar. self addSuperVarTot ]
		ifFalse: [ 
			self addVar. self addVarTot ] ] ].
	^ containTestMethod 
	
]
