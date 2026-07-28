"
I build the latice between test methods through `RTDMessages`
"
Class {
	#name : 'RTDLatticeBuilder',
	#superclass : 'Object',
	#instVars : [
		'messages'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'tests' }
RTDLatticeBuilder class >> example [

	<script>
	^ (self new
		messages: (RTDMessages new 
			at: (CompiledMethod new selector: #t1) put: { #x };
			at: (CompiledMethod new selector: #t2) put: { #x . #y };
			at: (CompiledMethod new selector: #t3) put: { #x . #y . #z };
			yourself );
		buildLattices) inspect
]

{ #category : 'building' }
RTDLatticeBuilder >> buildEdges [

	| nodes addedNodes |
	addedNodes := Set new.
	nodes := self messages methods sorted: [ :methodBefore :methodAfter |
		         (self importanceOf: methodBefore) < (self importanceOf: methodAfter) ].
	^ Array streamContents: [ :stream |
			  nodes do: [ :method |
					  (self nextNodeLayerOf: method) do: [ :subMethod |
							  stream nextPut: {
									  subMethod selector.
									  method selector } ] ] ]
]

{ #category : 'building' }
RTDLatticeBuilder >> buildLattices [

	^ RTDGraphTestFixtureStructure new 
		nodes: (self messages methods collect: #selector);
		edges: self buildEdges;
		yourself
]

{ #category : 'helpers' }
RTDLatticeBuilder >> importanceOf: aCompiledMethod [

	^ (self messages methodsThatInclude: aCompiledMethod ) size
]

{ #category : 'accessing' }
RTDLatticeBuilder >> messages [

	^ messages ifNil: [ Error signal: 'Messages not set' ]
]

{ #category : 'accessing' }
RTDLatticeBuilder >> messages: aMessages [

	messages := aMessages 
]

{ #category : 'private' }
RTDLatticeBuilder >> nextNodeLayerOf: method [

	| subMethods |
	subMethods := (self messages subMethodsIncludedBy: method) asSet.

	^ subMethods removeAllSuchThat: [ :subMethod | 
		subMethods anySatisfy: [ :otherSubMethod | subMethod ~= otherSubMethod and: [ 
				self messages does: otherSubMethod includesSubMethod: subMethod ] ] ]
]
