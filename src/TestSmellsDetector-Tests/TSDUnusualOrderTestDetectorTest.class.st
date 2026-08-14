Class {
	#name : 'TSDUnusualOrderTestDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDUnusualOrderTestDetectorTest >> detectorClass [
	
	^ TSDUnusualOrderTestDetector 
]

{ #category : 'accessing' }
TSDUnusualOrderTestDetectorTest >> testHasDifferentUnusualOrderTest [

	detector := self detectorClass selfClass: TSDSubFakeTests.
	self assert: (self detector detectSelector: #testCallTest2 ).
	self assert: (self detector methodVisitor selfVar = 1 ).
	self assert: (self detector methodVisitor var = 1 ).
	self assert: (self detector methodVisitor superVar = 1 )
	
	
]

{ #category : 'accessing' }
TSDUnusualOrderTestDetectorTest >> testHasNoUnusualOrderTest [

	self deny: (self detector detectSelector: #testifTrue )
	
]

{ #category : 'accessing' }
TSDUnusualOrderTestDetectorTest >> testHasNoUnusualOrderTest2 [

	self deny: (self detector detectSelector: #testNoCallTest )
	
]

{ #category : 'accessing' }
TSDUnusualOrderTestDetectorTest >> testHasUnusualOrderTest [

	self assert: (self detector detectSelector: #testCallTest )
	
]

{ #category : 'accessing' }
TSDUnusualOrderTestDetectorTest >> testTotalVarUsed [

	| classes testmethodes detector tests |
	detector := TSDUnusualOrderTestDetector new.
	classes := { ClapSTFileEvaluatorTest . ArgumentNamesTest . ArrayTest . LimitedWriteStreamTest }.
	testmethodes := classes collect: [ :each | 
		tests := each methods select: [ :m | m selector beginsWith: 'test' ]. 
		detector selfClass: each.
		tests do: [ :test | 
			detector detectSelector: test selector ] ].
	self assert: detector methodVisitor selfVarTot = 2.
	self assert: detector methodVisitor superVarTot = 6.
	self assert: detector methodVisitor varTot = 8.
	
	
]
