Class {
	#name : 'TSDUnusualOrderTestResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'hasUnusualOrderTest',
		'receiverIsSelf',
		'receiverIsSuper',
		'receiverIsOther'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'converting' }
TSDUnusualOrderTestResult >> asResultForDrTest [

	| node |
	node := super asResultForDrTest.

	node subResults addAll: { 
	( DTTreeNode name: 'receiver is self' subResults: ( DTFTFMessageNode toNodes: self receiverIsSelf ) ).
	( DTTreeNode name: 'receiver is super' subResults: ( DTFTFMessageNode toNodes: self receiverIsSuper ) ).
	( DTTreeNode name: 'receiver is other' subResults: ( DTFTFMessageNode toNodes: self receiverIsOther ) ).
	( DTFTFMessageNode new
		message: ( String streamContents: [ :stream |
			stream 
				print: ( self testClass selector: self selector );
				<< ': ';
				<< ( self hasUnusualOrderTest 
					ifTrue: [ 'has called test' ]
					ifFalse: [ 'has not called test' ] ) ] );
		browseMethod: ( self testClass lookupSelector: self selector );
		yourself ) }.
		
	^ node
]

{ #category : 'accessing' }
TSDUnusualOrderTestResult >> hasCalledTest: anObject [

	hasUnusualOrderTest := anObject 
]

{ #category : 'accessing' }
TSDUnusualOrderTestResult >> hasUnusualOrderTest [ 

	^ hasUnusualOrderTest 
]

{ #category : 'accessing' }
TSDUnusualOrderTestResult >> receiverIsOther [ 

	^ receiverIsOther 
]

{ #category : 'accessing' }
TSDUnusualOrderTestResult >> receiverIsOther: anObject [ 

	receiverIsOther := anObject
]

{ #category : 'accessing' }
TSDUnusualOrderTestResult >> receiverIsSelf [ 

	^ receiverIsSelf 
]

{ #category : 'accessing' }
TSDUnusualOrderTestResult >> receiverIsSelf: anObject [

	receiverIsSelf := anObject 
]

{ #category : 'accessing' }
TSDUnusualOrderTestResult >> receiverIsSuper [ 

	^ receiverIsSuper 
]

{ #category : 'accessing' }
TSDUnusualOrderTestResult >> receiverIsSuper: anObject [

	receiverIsSuper := anObject 
]
